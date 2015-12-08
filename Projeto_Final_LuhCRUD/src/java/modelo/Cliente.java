package modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "cliente")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cliente.findAll", query = "SELECT c FROM Cliente c"),
    @NamedQuery(name = "Cliente.findByCCodigo", query = "SELECT c FROM Cliente c WHERE c.cCodigo = :cCodigo"),
    @NamedQuery(name = "Cliente.findByNome", query = "SELECT c FROM Cliente c WHERE c.nome = :nome"),
    @NamedQuery(name = "Cliente.findByData_Nasc", query = "SELECT c FROM Cliente c WHERE c.dataNasc = :dataNasc"),
    @NamedQuery(name = "Cliente.findByCpf", query = "SELECT c FROM Cliente c WHERE c.cpf = :cpf"),
    @NamedQuery(name = "Cliente.findByEmail", query = "SELECT c FROM Cliente c WHERE c.email = :email")})
    @NamedQuery(name = "Cliente.findByName", query = "SELECT c FROM Cliente c where c.nome like :nome")

public class Cliente implements Serializable {
    @Id
    @Basic(optional = false)
    @Column(name = "c_codigo")
    private Long cCodigo;
    @Basic(optional = false)
    @Column(name = "nome")
    private String nome;
    @Basic(optional = false)
    @Column(name = "data_nasc")
    @Temporal(TemporalType.DATE)
    private Date dataNasc;
    @Basic(optional = false)
    @Column(name = "cpf")
    private String cpf;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cCodigo")
    private List<Telefone> telefoneList;

    public Cliente() {
    }

    public Cliente(Long cCodigo) {
        this.cCodigo = cCodigo;
    }

    public Cliente(Long cCodigo, String nome, Date data_nasc, String cpf, String email) {
        this.cCodigo = cCodigo;
        this.nome = nome;
        this.dataNasc = data_nasc;
        this.cpf = cpf;
        this.email = email;
    }

    public Long getCCodigo() {
        return cCodigo;
    }

    public void setCCodigo(Long cCodigo) {
        this.cCodigo = cCodigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
     public Date getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
    }


    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @XmlTransient
    public List<Telefone> getTelefoneList() {
        return telefoneList;
    }

    public void setTelefoneList(List<Telefone> telefoneList) {
        this.telefoneList = telefoneList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cCodigo != null ? cCodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cliente)) {
            return false;
        }
        Cliente other = (Cliente) object;
        if ((this.cCodigo == null && other.cCodigo != null) || (this.cCodigo != null && !this.cCodigo.equals(other.cCodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Nome: " + nome + "\nCódigo: " + cCodigo ;
        
    }

   
    
}
