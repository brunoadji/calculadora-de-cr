
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
    File.open(arquivo, 'r') do |file|
      results = file.readlines.map(&:chomp)
      gera_faculdade(results)
    end
  end

  def gera_faculdade(results)
    faculdade = Faculdade.new
    for line in results
      # Ignora o cabeçalho
      unless(line.start_with?("M"))
        line = line.split(",")
        curso = Curso.new(line[COD_CURSO])
        curso = faculdade.cria_curso(curso)
        disciplina = Disciplina.new(line[COD_DISCIPLINA], line[CARGA_HORARIA].to_i)
        disciplina = faculdade.cria_disciplina(disciplina)
        nota = Nota.new(line[NOTA].to_f, line[ANO_SEMESTRE], disciplina)
        aluno = Aluno.new(line[MATRICULA])
        aluno = curso.matricula_aluno(aluno)
        aluno.adiciona_nota(nota)
      end
    end
    return faculdade
  end
end
