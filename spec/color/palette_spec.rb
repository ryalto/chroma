describe Chroma::Color, '#palette' do
  let(:red) { 'red'.paint }

  def palette(name, *args)
    red.palette.send(name, *args)
  end

  it 'returns an instance of Harmonies' do
    expect(red.palette).to be_a Chroma::Harmonies
  end

  describe '#complement' do
    it 'returns the color and its complement' do
      expect(red.palette.complement).to generate_palette %w(red cyan)
    end

    it 'keeps the same format' do
      expect(red.palette.complement).to all have_format :name
    end
  end

  describe '#triad' do
    it 'returns the triad palette' do
      expect(red.palette.triad).to generate_palette %w(red lime blue)
    end

    it 'keeps the same format' do
      expect(red.palette.triad).to all have_format :name
    end
  end

  describe '#tetrad' do
    it 'returns the tetrad palette' do
      expect(red.palette.tetrad).to generate_palette %w(red #80ff00 cyan #7f00ff)
    end

    it 'keeps the same format' do
      expect(red.palette.tetrad).to all have_format :name
    end
  end

  describe '#split_complement' do
    it 'returns the split complement palette' do
      expect(red.palette.split_complement).to generate_palette %w(red #cf0 #06f)
    end

    it 'keeps the same format' do
      expect(red.palette.split_complement).to all have_format :name
    end
  end

  describe '#analogous' do
    context 'with default parameters' do
      it 'returns the analogous palette' do
        expect(red.palette.analogous).
          to generate_palette %w(#f00 #f06 #f03 #f00 #f30 #f60)
      end

      it 'keeps the same format' do
        expect(red.palette.analogous).to all have_format :name
      end
    end

    context 'with `results` argument' do
      it 'returns the analogous palette' do
        expect(red.palette.analogous(results: 3)).
          to generate_palette %w(#f00 #ff001a #ff1a00)
      end

      it 'keeps the same format' do
        expect(red.palette.analogous(results: 3)).to all have_format :name
      end
    end

    context 'with `results` and `slices` arguments' do
      it 'returns the analogous palette' do
        expect(red.palette.analogous(results: 3, slices: 10)).
          to generate_palette %w(#f00 #ff004c #ff4d00)
      end

      it 'keeps the same format' do
        expect(red.palette.analogous(results: 3, slices: 10)).to all have_format :name
      end
    end
  end

  describe '#monochromatic' do
    context 'with default parameters' do
      it 'returns the monochromatic palette' do
        expect(red.palette.monochromatic).
          to generate_palette %w(#f00 #2a0000 #500 #800000 #a00 #d40000)
      end

      it 'keeps the same format' do
        expect(red.palette.monochromatic).to all have_format :name
      end
    end

    context 'with `results` argument' do
      it 'returns the monochromatic palette' do
        expect(red.palette.monochromatic(results: 3)).
          to generate_palette %w(#f00 #500 #a00)
      end

      it 'keeps the same format' do
        expect(red.palette.monochromatic(results: 3)).to all have_format :name
      end
    end
  end
end