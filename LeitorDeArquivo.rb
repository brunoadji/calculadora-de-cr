require 'csv'
require_relative 'Faculdade'
require_relative 'Curso'
require_relative 'Disciplina'
require_relative 'Aluno'
require_relative 'Nota'

class LeitorDeArquivo
  MATRICULA = 0
  COD_DISCIPLINA = 1
  COD_CURSO = 2
  NOTA = 3
  CARGA_HORARIA = 4
  ANO_SEMESTRE = 5

  def le_arquivo()
    print "Insira o nome do arquivo: "
    arquivo = gets.chomp
    data = CSV.read(arquivo, headers: true)
    gera_faculdade(data)
  end

  def gera_faculdade(data)
    faculdade = Faculdade.new
    for line in data
      curso = Curso.new(line['COD_CURSO'])
      curso = faculdade.cria_curso(curso)
      disciplina = Disciplina.new(line['COD_DISCIPLINA'], line['CARGA_HORARIA'].to_i)
      disciplina = faculdade.cria_disciplina(disciplina)
      nota = Nota.new(line['NOTA'].to_f, line['ANO_SEMESTRE'], disciplina)
      aluno = Aluno.new(line['MATRICULA'])
      aluno = curso.matricula_aluno(aluno)
      aluno.adiciona_nota(nota)
    end
    return faculdade
  end
end
