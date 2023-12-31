package sec02.ex01;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download.do")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FileDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String file_repo = "C:\\file_repo";
		String fileName = (String) request.getParameter("fileName");
		System.out.println("fileName=" + fileName);
		OutputStream out = response.getOutputStream();
		String downFile = file_repo + "\\" + fileName;
		File f = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		FileInputStream in = new FileInputStream(f);
		byte[] buffer = new byte[1024 * 8];
		// 최적의 buffer 크기는 8kb가 적당함
		while (true) {
			int count = in.read(buffer);  // 버퍼 크기로 스캔함
			if (count == -1)			  // 더이상 읽은 데이터가 없음
				break;
			out.write(buffer, 0, count);  // 버퍼 크기만큼 쓰고, 시작위치부터 count값까지만 쓴다.
		}
		in.close();
		out.close();
	}
	

}
