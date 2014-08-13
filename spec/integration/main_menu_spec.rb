RSpec.describe "Main Menu", :integration do
  context "Prints the league menu" do
    it "should display the welcome screen (Pokemon Logo)" do
      actual = run_plt_with_input
      expected = %q{
                                .::.
                              .;:**'            AMC
                              `                  0
  .:XHHHHk.              db.   .;;.     dH  MX   0
oMMMMMMMMMMM       ~MM  dMMP :MMMMMR   MMM  MR      ~MRMN
QMMMMMb  "MMX       MMMMMMP !MX' :M~   MMM MMM  .oo. XMMM 'MMM
  `MMMM.  )M> :X!Hk. MMMM   XMM.o"  .  MMMMMMM X?XMMM MMM>!MMP
   'MMMb.dM! XM M'?M MMMMMX.`MMMMMMMM~ MM MMM XM `" MX MMXXMM
    ~MMMMM~ XMM. .XM XM`"MMMb.~*?**~ .MMX M t MMbooMM XMMMMMP
     ?MMM>  YMMMMMM! MM   `?MMRb.    `"""   !L"MMMMM XM IMMM
      MMMX   "MMMM"  MM       ~%:           !Mh.""" dMI IMMP
      'MMM.                                             IMX
       ~M!M                                             IMP
}
      expect(actual).to include(expected)
    end

    context " when an incorrect command is typed" do
      let(:output){ run_plt_with_input('remove') }
      it "prints an informative message" do
        expect(output).to include("I don't know the 'remove' command.")
      end
    end

    it "should print the list of commands" do
      actual = run_plt_with_input
      expected = "1. Add Trainer\n" +
                 "2. View Trainer Profile\n"
                 # "3. Record Battle\n"
      expect(actual).to include(expected)
    end
  end
end