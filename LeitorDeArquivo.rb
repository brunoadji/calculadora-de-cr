
require_relative 'Faculdade'
require_relative 'Curso'
require_relative 'Disciplina'
require_relative 'Aluno'
require_relative 'Nota'

class LeitorDeArquivo
  def le_arquivo(arquivo)
    File.open(arquivo, 'r') do |file|
      results = file.readlines.map(&:chomp)
      gera_faculdade(results)
    end
  end

  # 0 -> MATRICULA
  # 1 -> COD_DISCIPLINA
  # 2 -> COD_CURSO
  # 3 -> NOTA
  # 4 -> CARGA_HORARIA
  # 5 -> ANO_SEMESTRE
  def gera_faculdade(results)
    faculdade = Faculdade.new
    for line in results
      # Ignora o cabeçalho
      unless(line.start_with?("M"))
        line = line.split(",")
        curso = Curso.new(line[2])
        curso = faculdade.cria_curso(curso)
        disciplina = Disciplina.new(line[1], line[4].to_i)
        disciplina = faculdade.cria_disciplina(disciplina)
        nota = Nota.new(line[3].to_f, line[5], disciplina)
        aluno = Aluno.new(line[0])
        aluno = curso.matricula_aluno(aluno)
        aluno.adiciona_nota(nota)
      end
    end
    return faculdade
  end
end
