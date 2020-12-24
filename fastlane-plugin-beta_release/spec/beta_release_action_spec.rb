describe Fastlane::Actions::BetaReleaseAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The beta_release plugin is working!")

      Fastlane::Actions::BetaReleaseAction.run(nil)
    end
  end
end
