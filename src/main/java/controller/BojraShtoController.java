package controller;

import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXTextField;

import dao.ControlDAO;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import model.Bojra;
import model.LlojiBojes;
import utils.Combo;
import utils.HelperMethods;

public class BojraShtoController implements Initializable{

	@FXML private JFXTextField txtEmri;
	@FXML private JFXButton btnAnullo;
	@FXML private JFXComboBox<String> cmbKategoria;
	@FXML private Label lblError;
	
	private int bojraId = 0;
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		try {
			Combo.populate_combo(cmbKategoria, ControlDAO.getControlDao().getLlojiBojes().getLlojiBojes());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(BojraController.edit == true) {
			bojraId = BojraController.bojraDataHolder.getId();
			getData(BojraController.bojraDataHolder);
		}
		else
			bojraId = 0;
	}

	private void getData(Bojra b) {
		txtEmri.setText(b.getEmri());
		cmbKategoria.setValue(b.getLloji_bojes_id().getLloji_bojes());
	}
	
	@FXML
	public void ruaj() throws Exception {
		if(HelperMethods.checkEmptyText(txtEmri.getText()) || HelperMethods.checkEmptyCombobox(cmbKategoria)) {
			lblError.setText("Ploteso fushat!*");
			return;
		}
		
		String llojiBojesEmri = cmbKategoria.getSelectionModel().getSelectedItem().toString();
		LlojiBojes llojiBojes = new LlojiBojes(ControlDAO.getControlDao().getBojraDao()
				.getLlojiBojesId(llojiBojesEmri), llojiBojesEmri);
		
		Bojra bojra = new Bojra();
		bojra.setEmri(txtEmri.getText());
		bojra.setId(bojraId);
		bojra.setLloji_bojes_id(llojiBojes);
		
		if(bojraId == 0)
			ControlDAO.getControlDao().getBojraDao().addBojra(bojra);
		else
			ControlDAO.getControlDao().getBojraDao().updateBojra(bojra);
		
		HelperMethods.closeStage(btnAnullo);
		
	}
	
	@FXML
	private void anullo() {
		HelperMethods.closeStage(btnAnullo);
	}
}
