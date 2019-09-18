package com.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.pojo.Patent;
import com.service.PatentService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/12
 * Time: 9:46
 * Blog: https://wowgz.com.cn
 */
@Controller
@RequestMapping("/patent")
public class PatentController {
    @Autowired
    private PatentService patentService;

    @RequestMapping("/toPatentNews")
    public String toPatentNews(){
        return "patentNews";
    }

    @RequestMapping("/fileExport")
    public void fileExport(HttpServletResponse response){
        List<Patent> list = patentService.queryAllPatents();
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("专利信息","专利信息"),
                Patent.class, list);
        try {
            String fileName="patentInfoExcel.xls";
            response.setContentType("application/xls;charset=UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename="+fileName);
            OutputStream out = response.getOutputStream();
            workbook.write(out);
            out.flush();
            out.close();
//            File targetFile = new File("temp.xls");
//            FileOutputStream fos = new FileOutputStream(targetFile);
//            workbook.write(fos);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/toFileImport")
    public String toFileImport(){
        return "fileImport";
    }

    @RequestMapping("/fileImport")
    public String fileImport(@RequestParam(value = "fileImport") MultipartFile file){
        ImportParams params = new ImportParams();
        params.setTitleRows(1);
        params.setHeadRows(1);
//        File file = request.getParameter("fileImport");
//        System.out.println(request.getParameter("fileImport"));
        try {
//            List<Patent> list = ExcelImportUtil.importExcel(new File("C:\\Users\\Administrator\\Downloads\\patentInfo.xls"), Patent.class, params);
            List<Patent> list = ExcelImportUtil.importExcel(file.getInputStream(), Patent.class, params);
            for (Patent patent :
                    list) {
                if (patentService.queryPatentByNumber(patent.getPatentNumber()) != null){
                    System.out.println(patent.getPatentNumber() + "error");
                } else {
                    patentService.addPatent(patent);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/patent/allPatents";
    }
    @RequestMapping("/allPatents")
    public String list(Model model) {
        List<Patent> list = patentService.queryAllPatents();
        model.addAttribute("list", list);
        return "showAllPatents";
    }

    @RequestMapping("/toAddPatent")
    public String toAddPatent(){
        return "addPatent";
    }

    @RequestMapping("/addPatent")
    public String addPatent(Patent patent){
        patentService.addPatent(patent);
        return "redirect:/patent/toAddPatent";
    }

    @RequestMapping("/toDeletePatent/{patentNumber}")
    public String toDeletePatent(Model model, @PathVariable("patentNumber") int patentNumber){
        model.addAttribute("patent", patentService.queryPatentByNumber(patentNumber));
        return "deletePatent";
    }

    @RequestMapping("/deletePatent")
    public String deletePatent(Patent patent) {
        patentService.deletePatentByNumber(patent.getPatentNumber());
        return "redirect:/patent/allPatents";
    }

    @RequestMapping("/toUpdatePatent/{patentNumber}")
    public String toUpdatePatent(Model model, @PathVariable("patentNumber") int patentNumber) {
        model.addAttribute("patent", patentService.queryPatentByNumber(patentNumber));
        return "updatePatent";
    }

    @RequestMapping("/updatePatent")
    public String updatePatent(Patent patent) {
        patentService.updatePatent(patent);
        return "redirect:/patent/allPatents";
    }
}
