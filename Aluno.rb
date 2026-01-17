class Aluno
  attr_accessor :matricula, :notas

  def initialize(matricula)
    @matricula = matricula
    @notas = []
  end

  def calcula_hora_e_notas
    totalCargaHoraria = 0
    totalNota = 0
    for nota in notas
      totalCargaHoraria += nota.disciplina.carga_horaria
      totalNota += nota.nota * nota.disciplina.carga_horaria
    end
    return totalCargaHoraria, totalNota
  end

  def adiciona_nota(nota)
    @notas << nota
    return nota
  end
end
