package controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.Student;
import dao.StudentDao;

@Controller
public class StudentController {

    /**
     *
     * 从数据库中获取全部学生信息，将数据返回给主页index,jsp
     *
     * @param model
     * @return 返回值类型： String
     * @author janinus
     */
    @RequestMapping(value = "/all")
    public String queryAll(Model model) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        //从ioc容器中获取dao
        StudentDao dao = (StudentDao) context.getBean("dao");
        model.addAttribute("students", dao.queryAll());
        model.addAttribute("tops", dao.topNum(3));
        return "index.jsp";
    }

    /**
     * 通过姓名查找学生，使用模糊查找，将结果返回给index.jsp
     *
     * @param name
     * @param model
     * @return 返回值类型： String
     * @author janinus
     */
    @RequestMapping(value = "/queryByName")
    public String queryByName(String name, Model model) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        //从ioc容器中获取dao
        StudentDao dao = (StudentDao) context.getBean("dao");
        model.addAttribute("students", dao.queryByName(name));
        model.addAttribute("tops", dao.topNum(3));
        return "index.jsp";
    }

    /**
     * 添加新学生，并将结果返回给all页面，由all转发到主页
     * @param name
     * @param javaScore
     * @param htmlScore
     * @param cssScore
     * @param model
     * @return 返回值类型： String
     * @author janinus
     */
    @RequestMapping(value = "/add")
    public String addStu(String name, String javaScore, String htmlScore, String cssScore, Model model) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentDao dao = (StudentDao) context.getBean("dao");
        Student student = new Student();
        student.setName(name);
        student.setJavaScore(Double.parseDouble(javaScore));
        student.setHtmlScore(Double.parseDouble(htmlScore));
        student.setCssScore(Double.parseDouble(cssScore));
        boolean result = dao.addStu(student);
        if (result)
            model.addAttribute("msg", "<script>alert('添加成功！')</script>");
        else
            model.addAttribute("msg", "<script>alert('添加成功！')</script>");
        return "all";
    }

    /**
     * 通过id删除学生
     * @param id
     * @param model
     * @return 返回值类型： String
     * @author janinus
     */
    @RequestMapping(value = "/deleteById")
    public String deleteById(String id, Model model) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentDao dao = (StudentDao) context.getBean("dao");
        boolean result = dao.deleteStu(Integer.parseInt(id));
        if (result)
            model.addAttribute("msg", "<script>alert('删除成功！')</script>");
        else
            model.addAttribute("msg", "<script>alert('删除成功！')</script>");
        return "all";
    }

    /**
     *
     * @param id
     * @param name
     * @param javaScore
     * @param htmlScore
     * @param cssScore
     * @param model
     * @return 返回值类型： String
     * @author janinus
     */
    @RequestMapping(value = "/update")
    public String updateStu(String id, String name, String javaScore, String htmlScore, String cssScore, Model model) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentDao dao = (StudentDao) context.getBean("dao");
        Student student = new Student();
        student.setId(Integer.parseInt(id));
        student.setName(name);
        student.setJavaScore(Double.parseDouble(javaScore));
        student.setHtmlScore(Double.parseDouble(htmlScore));
        student.setCssScore(Double.parseDouble(cssScore));
        boolean result = dao.updateStu(student);
        if (result)
            model.addAttribute("msg", msg("修改成功"));
        else
            model.addAttribute("msg", msg("修改失败"));
        return "all";
    }

    /**
     * 要弹出的页面消息
     * @param msg
     * @return 返回值类型： String
     * @author janinus
     */
    public String msg(String msg) {
        return "<script>alert('" + msg + "')</script>";
    }
}
