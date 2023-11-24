package controller;

import domain.dao.DoacaoDAO;

public class CpfController {
    
    private final DoacaoDAO doacaoDAO;

    public CpfController() {
        this.doacaoDAO = new DoacaoDAO();
    }
    
    public boolean existsCpf(String cpf) {
        return !doacaoDAO.buscarPorCPF(cpf).isEmpty();
    }
    
}
