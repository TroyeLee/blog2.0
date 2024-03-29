USE [blog]
GO
/****** Object:  User [blog]    Script Date: 06/29/2018 15:34:32 ******/
CREATE USER [blog] FOR LOGIN [blog] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[user_info]    Script Date: 06/29/2018 15:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_info](
	[userid] [varchar](10) NOT NULL,
	[userpsw] [varchar](10) NOT NULL,
	[logname] [varchar](34) NOT NULL,
	[gender] [varchar](2) NOT NULL,
	[phone] [varchar](11) NULL,
	[email] [varchar](40) NULL,
	[education] [varchar](10) NULL,
	[problem] [varchar](40) NULL,
	[answer] [varchar](40) NULL,
	[selfintro] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[user_info] ([userid], [userpsw], [logname], [gender], [phone], [email], [education], [problem], [answer], [selfintro]) VALUES (N'123456', N'321654', N'张三', N'男', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[user_info] ([userid], [userpsw], [logname], [gender], [phone], [email], [education], [problem], [answer], [selfintro]) VALUES (N'1375011167', N'1314520', N'李朝伟', N'男', N'13750111679', N'1390546753@qq.com', N'本科', N'这是一个问题', N'', N'我是一名就读于广东科技学院的软件工程专业的大二学生')
/****** Object:  Table [dbo].[msg]    Script Date: 06/29/2018 15:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[msg](
	[logname] [varchar](34) NULL,
	[msg] [varchar](200) NULL,
	[times] [date] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[msg] ([logname], [msg], [times]) VALUES (N'张三', N'哈哈哈，我来过', CAST(0x683E0B00 AS Date))
INSERT [dbo].[msg] ([logname], [msg], [times]) VALUES (N'张三', N'哈哈哈，我又来了', CAST(0x683E0B00 AS Date))
INSERT [dbo].[msg] ([logname], [msg], [times]) VALUES (N'张三', N'哈哈哈，我又来了', CAST(0x683E0B00 AS Date))
/****** Object:  Table [dbo].[comment]    Script Date: 06/29/2018 15:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comment](
	[logname] [varchar](34) NULL,
	[articleid] [varchar](10) NULL,
	[msg] [varchar](400) NULL,
	[times] [date] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[comment] ([logname], [articleid], [msg], [times]) VALUES (N'张三', N'0000000000', N'哈哈哈', CAST(0x673E0B00 AS Date))
INSERT [dbo].[comment] ([logname], [articleid], [msg], [times]) VALUES (N'李朝伟', N'0000000000', N'123', CAST(0x693E0B00 AS Date))
INSERT [dbo].[comment] ([logname], [articleid], [msg], [times]) VALUES (N'张三', N'0000000004', N'加油！', CAST(0x693E0B00 AS Date))
INSERT [dbo].[comment] ([logname], [articleid], [msg], [times]) VALUES (N'张三', N'0000000000', N'***', CAST(0x693E0B00 AS Date))
/****** Object:  Table [dbo].[article]    Script Date: 06/29/2018 15:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[article](
	[userid] [varchar](10) NULL,
	[articleid] [varchar](10) NOT NULL,
	[title] [varchar](40) NULL,
	[atype] [varchar](20) NULL,
	[intro] [varchar](200) NULL,
	[content] [varchar](max) NULL,
	[times] [date] NULL,
	[likes] [int] NULL,
	[readcount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[articleid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[article] ([userid], [articleid], [title], [atype], [intro], [content], [times], [likes], [readcount]) VALUES (N'1375011167', N'0000000000', N'数据库连接池', N'web类', N'频繁建立，关闭数据库，极大降低系统性能，增大系统的开销。
因此应采用运行速度更快，数据库访问效率更高的数据库技术
数据库连接池技术', N'好处：

1）创建和管理一个连接的缓冲池的技术，这些连接准备好被任何需要它们的线程使用


2）对于大多数应用程序，当他们正在处理通常需要数毫秒完成的任务时，仅需要能够访问JDBC连接的一个线程。当不处理事物是，这个连接就会闲置。
而对于连接池，它可以允许闲置的连接被其他需要的线程使用。

3）当一个线程需要JDBC对一个GBasse或其他数据库操作时，它从池子中请求一个连接。当这个线程使用完了这个连接，将他返回到连接池中，这样就可以被其他想使用它的线程使用。

4）当连接从连接池中“借出”，它被请求它的线程专有使用。从编程的角度看，这和用户的线程每当需要一个JDBC连接的时候调用DriverManager.getConnection()是一样的，
采用连接池技术，可通过使用心得或已有的连接结束线程。

原理

将数据库连接作为对象存储在一个Vector对象中，一旦数据库连接建立后，不同的数据库访问请求就可以共享这些连接，这样，通过复用这些已经建立的数据库连接，
极大地节省系统资源和时间。

主要操作

1）建立数据库连接池对象

2）按照事先指定的参数创建初始数量的数据库连接。

3）一个数据库访问请求，直接从连接池中得到一个连接。如果数据库连接池对象中没有空闲的连接，且连接数没有达到最大，创建一个新的连接。

4）存取数据库。

5）关闭数据库，释放所有数据库连接。

6）释放数据库连接池对象。


如何使用
1，在Tomcat服务器目录下面的conf中找到Context.xml配置文件，加入以下代码

<Resource name="jdbc/books"  auth="Container" type="javax.sql.DataSource" maxActive="100"
          maxIdle="30" maxWait="10000" username="sa"  password="123456"
          driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"
          url="jdbc:sqlserver://localhost:1433;DatabaseName=news"/          
>
或者
<Context>
    <!-- 数据库连接池配置信息 -->
    <Resource name="jdbc/bbs" auth="Container" type="javax.sql.DataSource" //jdbc/bbs为自定的连接池名
    maxActive="100" maxIdle="30" maxWait="10000" 
    username="root" //数据库用户名
    password="123456"//数据库密码
    driverClassName="com.mysql.jdbc.Driver" //数据库驱动
    url="jdbc:mysql://localhost:3306/bbs_db" //数据库文件全路径
    />
</Context>

参数含义：JDNI（java naming and directory interface）：java命名和目录接口
name:指定Resource的JNDI名称
auth:指定管理Resource的Manager（Container：由容器创建和管理||Application：由Web应用创建和管理）
type:指定Resource所属的Java类
maxActive:指定连接池中处于活动状态的数据库连接的最大数目
maxIdle:指定连接池中处于空闲状态的数据库连接的最大数目
maxWait:指定连接池中连接处于空闲的最长时间，超过这个时间会抛出异常，取值为-1，表示可以无限期等待



2：第二步将数据库驱动.jar放入tomcat目录下的lib或common\lib下面


3：第三步，打开应用程序的Web.xml文件，添加以下配置//配不配也没关系
<resource-ref>
  <res-ref-name>jdbc/books</res-ref-name>
  <res-type>javax.sql.DataSource</res-type>
  <res-auth>Container</res-auth>
</resource-ref>
节点数据来源于Context.xml里面设置的数据

4：第四步，在java文件中先导入以下包：
import javax.sql.DataSource;
import javax.naming.context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

将原来的数据库连接操作：
{
Class.forName("oracle.jdbc.driver.OracleDriver");
if(conn==null||conn.isClosed())
  conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","sa","123456");
}
换成
public Connection getConn(){
  Connection conn-null;
  Context c=new InitialContext();//1.初始化上下文
  DataSource ds = (DataSource)c.lookup("java:comp/env/jdbc/books");//2.查找数据源（获取怀逻辑名相关联的数据源对象）
  conn = ds.getConnection();    //3.获取数据库连接  
  return conn; 
}     
//注明：使用数据库连接池，不需要再加载驱动，也不需要关闭资源连接。       ', CAST(0x693E0B00 AS Date), 6, 51)
INSERT [dbo].[article] ([userid], [articleid], [title], [atype], [intro], [content], [times], [likes], [readcount]) VALUES (N'1375011167', N'0000000001', N'EL表达式 JSTL标签', N'web类', N'Expression Language 比JSP脚本提供更加简化的方式来生成动态web页面', N'EL表达式 JSTL标签
1、EL概念    Expression Language 比JSP脚本提供更加简化的方式来生成动态web页面
2、EL语法    ${表达式}

表达式可以包含文字、操作符、变量（对象引用）、函数调用等

3     [ ]与.运算符
     EL 提供“.“和“[ ]“两种运算符来存取数据。

     当要存取的属性名称中包含一些特殊字符，如.或?等并非字母或数字的符号，就一定要使用“[ ]“。例如：
         ${user.My-Name}应当改为${user["My-Name"] }
     如果要动态取值时，就可以用“[ ]“来做，而“.“无法做到动态取值。例如：
         ${sessionScope.user[data]}中data 是一个变量

4、EL有效表达式支持的内容类型  Boolean、 Integer、 Floating Point、String、Null
5、EL有效表达式支持的操作符    算术型、逻辑型（and、&&、or、||、！、not）、关系型、空、条件型 A?B:C

6、EL内置对象

类别       标识符            描述 
JSP        pageContext       JSP页的上下文

作用域     pageScope         与page作用域的属性的名称和值相关联的类
           requestScope      与request作用域的属性的名称和值相关联的类
           sessionScope      与session作用域的属性的名称和值相关联的类
           applicationScope  与application作用域的属性的名称与值相关联的类

请求参数   param             储存请求参数名称一值对的类
           paramValues       将请求参数的所有值作为一个String数组存储的类

请求头     header            将名称存储头部主要值的类
           headerValues      将请求头部的所有值走位String数组存储的类

Cookie     cookie            按名称存储请求附带的cookie的类

初始化参数 initParam         按名称存储Web应用程序上下文初始化参数的类

例
<%=request.getParameter(“username”) %>       等价于       ${ param.username }
<%=request.getAttribute(“userlist”) %>       等价于       ${ requestScope.userlist }


7、打开与关闭
<%@ page isELIgnored="true" %>
 表示是否禁用EL语言,TRUE表示禁止.FALSE表示不禁止.JSP2.0中默认的启用EL语言

例 EL计算器

<form action="">
  <input type="text" name="num1" value=${param.num1}>+
  <input type="text" name="num2" value=${param.num2}>=
  <input type="text" name="num3" value=${param.num1+param.num2}>
  <br>
  <input type="submit" value="submit">
</form>

', CAST(0x693E0B00 AS Date), 0, 30)
INSERT [dbo].[article] ([userid], [articleid], [title], [atype], [intro], [content], [times], [likes], [readcount]) VALUES (N'1375011167', N'0000000002', N'jsp网站访问次数统计的几种方法', N'web类', N'原作者采用的是jsp网页，但是不管采用什么语言，原理是一样的。', N'第一种，单页面统计。就是说，只要点击这个页面就会统计一次。

<body>
    <%!//在这种标记中定义的变量为全局变量    
　　　　int count=0;    
　　　　synchronized void count(){    
　　　　　　count++;    
　　　　}   
    %>
    <%    count();    out.println("这是第"+count+"个访问者!");    %>
</body>
复制代码
第二种，是利用jsp的内置对象application进行统计。这个程序结果运行分析，也是访问一次页面统计一次。感觉还是不够好。真正满意的是浏览器打开网页，到关闭网页算一次，这样统计比较实际。

<body>
    <%
        if (application.getAttribute("count") == null) {
            application.setAttribute("count", new Integer(0));
        }
        Integer count = (Integer) application.getAttribute("count");
        application
                .setAttribute("count", new Integer(count.intValue() + 1));
        count = (Integer) application.getAttribute("count");
    %>
    <center>
        这是第<%=count.intValue()%>个访问者!
    </center>
</body>

第三种，利用jsp的application和session进行统计。它的原理是，访问者打开浏览器到关闭浏览器算一次访问。每次打开首页，创建一个session，这个session直到浏览器关闭才失效。但总体来说，比前两种要好。但是有一个一个缺陷，那就是当jsp服务器重启时，累计的统计数就清零了。

复制代码
<%
    int n = 0;
    String count = (String) application.getAttribute("counter");
    if (counter != null)
        n = Integer.parseInt(counter);
    if (session.isNew()) 
　　　　 ++n;
    out.print("你是第" + n + "位访客");
    counter = String.valueOf(n);
    application.setAttribute("counter", counter);
%>

 

第四种，就是保存到txt文本中，那样重启服务器也不会丢失了。

复制代码
public class counter {

    public static void writeFile(String filename, long count) {

        try {
            PrintWriter out = newPrintWriter(new FileWriter(filename));
            out.println(count);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static long readFile(String filename) {
        File f = new File(filename);
        long count = 0;
        if (!f.exists()) {
            writeFile(filename, 0);
        }
        try {
            BufferedReader in = newBufferedReader(newFileReader(f));
            try {
                count = Long.parseLong(in.readLine());
            } catch (NumberFormatException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return count;
    }
}

下面是你要计数的jsp页面，在里面添上以下内容就ok了


<%@pageimport="com.benb.servlet.counter"%>
<%
   counterCountFileHandler=newcounter();//创建对象
   longcount=CountFileHandler.readFile(request.getRealPath("/")+"count.txt");
   //读取文件获取数据赋给count
   count=count+1;//修改记录，数据加1
   out.println(count);//显示记录数
   CountFileHandler.writeFile(request.getRealPath("/")+"count.txt",count);//更新文件记录
%>

但是还是不是很好，也是每次访问首页就计数一次。怎么样百分百满意呢？
 
最后一种完美解决方法，session和application加文本保存结合就完美了，不管重启服务器，还是能百分百记录所有的访问记录。
写一个severlet类似前面，就是long类型改成int类型。

public class Counter extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public Counter() {
        super();
    }

    public static void writeFile(String filename, int count) {

        try {
            PrintWriter out = new PrintWriter(new FileWriter(filename));
            out.println(count);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static int readFile(String filename) {
        File f = new File(filename);
        int count = 0;
        if (!f.exists()) {
            writeFile(filename, 0);
        }
        try {
            BufferedReader in = new BufferedReader(new FileReader(f));
            try {
                count = Integer.parseInt(in.readLine());
            } catch (NumberFormatException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return count;
    }

    public void init() throws ServletException {
        // Put your code here
    }

}

页面编码如下


<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.tozhan.cn.GetDataDB" %>
<%@ page import="com.tozhan.cn.news.New" %>
<%@ page import="com.tozhan.cn.Counter" %>
<%
　　Counter CountFileHandler=new Counter();//创建对象
　　int count=0;
　　if(application.getAttribute("count")==null){
　　　　count=CountFileHandler.readFile(request.getRealPath("/")+"count.txt"); //读取文件获取数据赋给count
　　　　application.setAttribute("count",new Integer(count));
　　}
　　count=(Integer)application.getAttribute("count");
　　if(session.isNew()) ++count;
　　application.setAttribute("count",count);
　　CountFileHandler.writeFile(request.getRealPath("/")+"count.txt",count);//更新文件记录
%>
<p>我们的友谊海枯石烂！ 你是第&nbsp;<%=count %>&nbsp;位访客</p>
----转自CSDN', CAST(0x693E0B00 AS Date), 1, 5)
INSERT [dbo].[article] ([userid], [articleid], [title], [atype], [intro], [content], [times], [likes], [readcount]) VALUES (N'1375011167', N'0000000003', N'DIV的内容自动换行', N'web类', N'word-break:break-all和word-wrap:break-word都是能使其容器如DIV的内容自动换行。', N'word-break:break-all和word-wrap:break-word都是能使其容器如DIV的内容自动换行。

它们的区别就在于：

1，word-break:break-all 例如div宽200px，它的内容就会到200px自动换行，如果该行末端有个英文单词很长（congratulation等），它会把单词截断，变成该行末端为conra(congratulation的前端部分)，下一行为tulation（conguatulation）的后端部分了。

2，word-wrap:break-word 例子与上面一样，但区别就是它会把congratulation整个单词看成一个整体，如果该行末端宽度不够显示整个单词，它会自动把整个单词放到下一行，而不会把单词截断掉的。

3，word-break;break-all 支持版本：IE5以上 该行为与亚洲语言的 normal 相同。也允许非亚洲语言文本行的任意字内断开。该值适合包含一些非亚洲文本的亚洲文本。 WORD-WRAP:break-word 支持版本：IE5.5以上 内容将在边界内换行。如果需要，词内换行( word-break )也将发生。表格自动换行，避免撑开。 word-break : normal | break-all | keep-all 参数： normal : 依照亚洲语言和非亚洲语言的文本规则，允许在字内换行 break-all : 该行为与亚洲语言的normal相同。也允许非亚洲语言文本行的任意字内断开。该值适合包含一些非亚洲文本的亚洲文本 keep-all : 与所有非亚洲语言的normal相同。对于中文，韩文，日文，不允许字断开。适合包含少量亚洲文本的非亚洲文本 语法： word-wrap : normal | break-word 参数： normal : 允许内容顶开指定的容器边界 break-word : 内容将在边界内换行。如果需要，词内换行（word-break）也行发生说明：设置或检索当当前行超过指定容器的边界时是否断开转行。

对应的脚本特性为wordWrap。请参阅我编写的其他书目。 语法： table-layout : auto | fixed 参数： auto : 默认的自动算法。布局将基于各单元格的内容。表格在每一单元格读取计算之后才会显示出来。速度很慢 fixed : 固定布局的算法。在这算法中，水平布局是仅仅基于表格的宽度，表格边框的宽度，单元格间距，列的宽度，而和表格内容无关说明：设置或检索表格的布局算法。对应的脚本特性为tableLayout。

建议：word-break 用3C检测会显示问题的，导致百度快照也会出问题-这个属性OPERA FIREFOX 浏览器也不支持 word-break属性可以用white-space:normal;来代替，这样在FireFox和IE下就都能正确换行，而且要注意，单词间的空格不能用 来代替，不然不能正确换行。

我在网站上试验过确实不支持，你可以再W3C验证一下
----转自Chen_s', CAST(0x693E0B00 AS Date), 4, 7)
INSERT [dbo].[article] ([userid], [articleid], [title], [atype], [intro], [content], [times], [likes], [readcount]) VALUES (N'1375011167', N'0000000004', N'实训最后一天', N'日记类', N'实训最后一天', N'今天是javaweb实训最后一天，我终于把这个个人博客给大致弄好了，但是我看了看其他同学的博客项目，发现我这个好垃圾，他们能上传图片到数据库里面，我的这个功能还没有实现，啊啊啊，而且他们的界面好好看，写博客的输入框还是用kindEditor的，我都不会用，唉要怪就怪当初没认真听，现在要是想用的话，得重新看，时间不够啊啊啊啊，不过这个上午还是把阅读量，修改，以及其他部分的小完善。这个星期的马不停蹄就要告一段落啦，打算暑假放假的时候再好好把kindeditor好好看一下，还有文件的上传下载，还有图片上传下载，哎呀，感觉在这个班，压力好大，落后一点就差距很大啦！！！！加油加油！！', CAST(0x693E0B00 AS Date), 3, 9)
INSERT [dbo].[article] ([userid], [articleid], [title], [atype], [intro], [content], [times], [likes], [readcount]) VALUES (N'1375011167', N'0000000005', N'SQL数据库', N'数据库类', N'SQL是专为数据库而建立的操作命令集，是一种功能齐全的数据库语言。', N'在正式学习SQL语言之前，首先让我们对SQL语言有一个基本认识，介绍一下SQL语言的组成：
1.一个SQL数据库是表(Table)的集合，它由一个或多个SQL模式定义。
2.一个SQL表由行集构成，一行是列的序列(集合)，每列与行对应一个数据项。
3.一个表或者是一个基本表或者是一个视图。基本表是实际存储在数据库的表，而视图是由若干基本表或其他视图构成的表的定义。
4.一个基本表可以跨一个或多个存储文件，一个存储文件也可存放一个或多个基本表。每个存储文件与外部存储上一个物理文件对应。
5.用户可以用SQL语句对视图和基本表进行查询等操作。在用户角度来看，视图和基本表是一样的，没有区别，都是关系(表格)。
6.SQL用户可以是应用程序，也可以是终端用户。SQL语句可嵌入在宿主语言的程序中使用，宿主语言有FORTRAN，COBOL，PASCAL，PL/I，C和Ada语言等。SQL用户也能作为独立的用户接口，供交互环境下的终端用户使用。
增
删
查
改
各种操作持续更新中', CAST(0x693E0B00 AS Date), 1, 2)
