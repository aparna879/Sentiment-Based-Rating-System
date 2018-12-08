from flask import Flask, render_template, request, redirect
import mysql.connector
from textblob import TextBlob

app = Flask(__name__)

class dbmini:
        @app.route('/')
        @app.route('/index.html')
        def student2():
                return render_template("index.html")

        @app.route('/single.html')
        @app.route('/single')
        def student1():
                return render_template("single.html")

        global search
        @app.route('/',methods = ['POST', 'GET'])
        def search():
            global p
            p=0
            if request.method == 'POST' and request.form.get('searchbar')=="": 
                connection = mysql.connector.connect(host='localhost',user='aparna879',password='password',database='movie2')
                cursor = connection.cursor()   
                result = request.form.get("s")

                #TO GET MOV_ID
                cursor.execute("select mov_id from movies where lower(name)=%s;",[result])
                global mov
                mov= cursor.fetchall()
                connection.commit()
            
                cursor.execute("select md.link from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row0= cursor.fetchall()
                connection.commit()
              
                cursor.execute("select name from movies where lower(name)=%s;",[result])
                row1= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select md.description from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row2= cursor.fetchall()
                connection.commit()
              
                cursor.execute("select md.running_time from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row3= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select md.genre from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row4= cursor.fetchall()
                connection.commit()
               
                cursor.execute("select md.director from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row5= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select md.writer from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row6= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select md.release_date from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row7= cursor.fetchall()
                connection.commit()
                
                cursor.execute("SELECT ROUND(avg(polarity),1) from rating where mov_id=%s;",[mov[0][0]])
                rows= cursor.fetchall()
                connection.commit()


                #Movie_Cast
                cursor.execute("select mc.cast_id from movie_cast mc, movies m where m.mov_id = mc.mov_id AND m.name=%s;",[result])
                rowid= cursor.fetchall()
                connection.commit()

                row8 = []
                for i in range(len(rowid)):
                    cursor.execute("select mc.photo from movie_cast mc where cast_id=%s;",[rowid[i][0]])
                    pic= cursor.fetchall()
                    row8.insert(i,pic[0][0])
                    connection.commit()
                
                row9 = []
                for i in range(len(rowid)):
                    cursor.execute("select mc.actor_name from movie_cast mc where cast_id=%s;",[rowid[i][0]])
                    aname= cursor.fetchall()
                    row9.insert(i,aname[0][0])
                    connection.commit()
            
                row10 = []
                for i in range(len(rowid)):
                    cursor.execute("select mc.alternate_name from movie_cast mc where cast_id=%s;",[rowid[i][0]])
                    altname= cursor.fetchall()
                    row10.insert(i,altname[0][0])
                    connection.commit()
                
                return render_template("single.html",p=p,rows=rows, row0=row0, row1=row1, row2=row2, row3=row3, row4=row4, row5=row5, row6=row6, row7=row7, row8=row8, row9=row9, row10=row10)


        @app.route('/single', methods = ['POST', 'GET'])
        def result():
            p=1
            search()
            if request.method == 'POST' and request.form.get('submit1')=="submit":
                connection = mysql.connector.connect(host='localhost',user='aparna879',password='password',database='movie2')
                cursor = connection.cursor()
                result = request.form.get("comment")
                param =(mov[0][0],result) 
                cursor.execute("INSERT INTO movie_review(mov_id,content) values(%s,%s)",param)
                connection.commit()
 
                #TO GET REV_ID
                cursor = connection.cursor()
                cursor.execute("select rev_id from movie_review where content=%s;",[result])
                rev= cursor.fetchall()
                connection.commit()

                global value
                #SENTIMENT_ANALYSIS
                obj = TextBlob(result)
                sentiment = obj.sentiment.polarity
                value=(sentiment+1)/0.2
                cursor.execute("INSERT into rating(rev_id,mov_id,polarity) values(%s,%s,%s)",(rev[0][0],mov[0][0],value))
                connection.commit()
                cursor.execute("SELECT ROUND(avg(polarity),1) from rating where mov_id=%s;",[mov[0][0]])
                rows= cursor.fetchall()
                connection.commit() 

                #STORED PROCEDURE
                args = [mov[0][0],rev[0][0],'@best','@worst']
                result= cursor.callproc('proc',args)
                connection.commit()
                pos=result[2]
                neg=result[3]

                # args = [mov[0][0],rev[0][0],'@best','@worst']
                # result= cursor.execute("call proc(args)")
                # pos=result[2]
                # neg=result[3]




                #DEBUGGED REFRESHING PROBLEM
                cursor.execute("select link from movie_details where mov_id=%s;",[mov[0][0]])
                row0= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select name from movies where mov_id=%s;",[mov[0][0]])
                row1= cursor.fetchall()
                connection.commit()
            
                cursor.execute("select description from movie_details where mov_id =%s;",[mov[0][0]])
                row2= cursor.fetchall()
                connection.commit()
               
                cursor.execute("select running_time from movie_details where mov_id =%s;",[mov[0][0]])
                row3= cursor.fetchall()
                connection.commit()
            
                cursor.execute("select genre from movie_details where mov_id =%s;",[mov[0][0]])
                row4= cursor.fetchall()
                connection.commit()
            
                cursor.execute("select director from movie_details where mov_id =%s;",[mov[0][0]])
                row5= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select writer from movie_details where mov_id =%s;",[mov[0][0]])
                row6= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select release_date from movie_details where mov_id =%s;",[mov[0][0]])
                row7= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select cast_id from movie_cast where mov_id =%s;",[mov[0][0]])
                rowid= cursor.fetchall()
                connection.commit()
               
                #Movie_Cast
                row8 = []
                for i in range(len(rowid)):
                    cursor.execute("select mc.photo from movie_cast mc where cast_id=%s;",[rowid[i][0]])
                    pic= cursor.fetchall()
                    row8.insert(i,pic[0][0])
                    connection.commit()
                print(row8)


                row9 = []
                for i in range(len(rowid)):
                    cursor.execute("select mc.actor_name from movie_cast mc where cast_id=%s;",[rowid[i][0]])
                    aname= cursor.fetchall()
                    row9.insert(i,aname[0][0])
                    connection.commit()
                print(row9)

                row10 = []
                for i in range(len(rowid)):
                    cursor.execute("select mc.alternate_name from movie_cast mc where cast_id=%s;",[rowid[i][0]])
                    altname= cursor.fetchall()
                    row10.insert(i,altname[0][0])
                    connection.commit()
                print(row10)

                return render_template("single.html",pos=pos,neg=neg,p=p,value=value, rows=rows, row0=row0, row1=row1, row2=row2, row3=row3, row4=row4, row5=row5, row6=row6, row7=row7, row8=row8, row9=row9, row10=row10)

            if request.method == 'POST' and request.form.get('searchbar')=="": 
                connection = mysql.connector.connect(host='localhost',user='aparna879',password='password',database='movie')
                cursor = connection.cursor()   
                result = request.form.get("s")

                #TO GET MOV_ID
                cursor.execute("select mov_id from movies where lower(name)=%s;",[result])
                global mov
                mov= cursor.fetchall()
                connection.commit()
                #print(mov)

                cursor.execute("select md.link from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row0= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select name from movies where lower(name)=%s;",[result])
                row1= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select md.description from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row2= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select md.running_time from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row3= cursor.fetchall()
                connection.commit()
               
                cursor.execute("select md.genre from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row4= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select md.director from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row5= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select md.writer from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row6= cursor.fetchall()
                connection.commit()
                
                cursor.execute("select md.release_date from movie_details md, movies m where m.mov_id = md.mov_id AND m.name=%s;",[result])
                row7= cursor.fetchall()
                connection.commit()
                
                cursor.execute("SELECT ROUND(avg(polarity),1) from rating where mov_id=%s;",[mov[0][0]])
                rows= cursor.fetchall()
                connection.commit()

                cursor.execute("select mc.cast_id from movie_cast mc, movies m where m.mov_id = mc.mov_id AND m.name=%s;",[result])
                rowid= cursor.fetchall()
                connection.commit()

                row8 = []
                for i in range(len(rowid)):
                    cursor.execute("select mc.photo from movie_cast mc where cast_id=%s;",[rowid[i][0]])
                    pic= cursor.fetchall()
                    row8.insert(i,pic[0][0])
                    connection.commit()
                print(row8)


                row9 = []
                for i in range(len(rowid)):
                    cursor.execute("select mc.actor_name from movie_cast mc where cast_id=%s;",[rowid[i][0]])
                    aname= cursor.fetchall()
                    row9.insert(i,aname[0][0])
                    connection.commit()
               
                row9 = []
                for i in range(len(rowid)):
                    cursor.execute("select mc.actor_name from movie_cast mc where cast_id=%s;",[rowid[i][0]])
                    aname= cursor.fetchall()
                    row9.insert(i,aname[0][0])
                    connection.commit()
                

                row10 = []
                for i in range(len(rowid)):
                    cursor.execute("select mc.alternate_name from movie_cast mc where cast_id=%s;",[rowid[i][0]])
                    altname= cursor.fetchall()
                    row10.insert(i,altname[0][0])
                    connection.commit()
            
                row10 = []
                for i in range(len(rowid)):
                    cursor.execute("select mc.alternate_name from movie_cast mc where cast_id=%s;",[rowid[i][0]])
                    altname= cursor.fetchall()
                    row10.insert(i,altname[0][0])
                    connection.commit()
                
                return render_template("single.html",rows=rows, row0=row0, row1=row1, row2=row2, row3=row3, row4=row4, row5=row5, row6=row6, row7=row7, row8=row8, row9=row9, row10=row10)   
  

        

if __name__ == '__main__':
   app.run(debug = True)
