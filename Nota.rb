class Nota
  attr_accessor :nota, :periodo, :disciplina

  def initialize(nota, periodo, disciplina)
    @nota = nota
    @periodo = periodo
    @disciplina = disciplina
  end
end
