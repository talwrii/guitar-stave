\version "2.24.4"

\paper {
#(set-paper-size "a4landscape")
}

\header {
  tagline = ##f
}



mylabel = #(define-music-function (e1 label color) (ly:music? string? string?)
  #{
    \once \override NoteHead.stencil = #(lambda (grob)
      (grob-interpret-markup grob
        (markup #:bold #:with-color color #:fontsize -3 #:sans  #:text label)))
    \offset Y-offset -5
    $e1
  #}
)


\score {

  \layout {
    #(layout-set-staff-size 200)
  }

    \new Staff {
  \omit Staff.TimeSignature
  \omit Staff.BarLine

< e a d' g' b' e'' >1

    <<
    \new Voice {\mylabel e1 "E" "pink"}
    \new Voice {\mylabel a1 "A" "orange"}
    \new Voice {\mylabel d'1 "D" "purple"}
    \new Voice {\mylabel g'1 "G" "blue"}
    \new Voice {\mylabel b'1 "B" "green"}
    \new Voice {\mylabel e''1 "E" "red"}
    >>



}
}
