package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;
import modelo.Operadora;

public class OperadoraDAO {
    EntityManager em;
    
    public OperadoraDAO() throws Exception {
        
        EntityManagerFactory emf;
        
        emf = Conexao.getConexao();
        
        em = emf.createEntityManager();
        
    }
    
    public void incluir(Operadora obj) throws Exception {
        
        try {
            
            em.getTransaction().begin();
            
            em.persist(obj);
            
            em.getTransaction().commit();
            
        } catch (RuntimeException e) {
            
            em.getTransaction().rollback();
            
            throw e;
            
        } finally {
            
            em.close();
            
        }
        
    }
    
    public List<Operadora> listar() throws Exception {
        
        return em.createNamedQuery("Operadora.findAll").getResultList();
        
    }
    
     public List<Operadora> listar(String nome) throws Exception {
        //passar o parÃ¢metro pra query
         TypedQuery<Operadora> query = 
                 em.createNamedQuery("Operadora.findByName", Operadora.class);
         
         //Seto o parÃ¢metro
         query.setParameter("nome", '%' + nome + '%');
         //retorno minha lista
         return query.getResultList();
    }
    
    public void alterar(Operadora obj) throws Exception {
        
        try {
            
            em.getTransaction().begin();
            
            em.merge(obj);
            
            em.getTransaction().commit();
            
        } catch (RuntimeException e) {
            
            em.getTransaction().rollback();
            
            throw e;
            
        } finally {
            
            em.close();
            
        }
        
    }
    
    public void excluir(Operadora obj) throws Exception {
        
        try {
            
            em.getTransaction().begin();
            
            em.remove(obj);
            
            em.getTransaction().commit();
            
        } catch (RuntimeException e) {
            
            em.getTransaction().rollback();
            
        } finally {
            
            em.close();
            
        }
        
    }
    
      public Operadora buscarPorChavePrimaria(Long chave)
    {
        return em.find(Operadora.class, chave);
    }
    
    public void fechaEmf() {
        
        Conexao.closeConexao();
        
    }
  
}
