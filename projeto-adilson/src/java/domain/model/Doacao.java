package domain.model;

import java.time.LocalDate;

public class Doacao {

    private Long id;
    private String cpf;
    private String nomeDoador;
    private Double valor;
    private LocalDate data;

    public Doacao(Long id, String cpf, String nomeDoador, Double valor, LocalDate data) {
        this.id = id;
        this.cpf = cpf;
        this.nomeDoador = nomeDoador;
        this.valor = valor;
        this.data = data;
    }


    public Doacao(String cpf, String nomeDoador, Double valor, LocalDate data) {
        this.cpf = cpf;
        this.nomeDoador = nomeDoador;
        this.valor = valor;
        this.data = data;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNomeDoador() {
        return nomeDoador;
    }

    public void setNomeDoador(String nomeDoador) {
        this.nomeDoador = nomeDoador;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }
}
