Feature: Custom Sizes
  Scenario: Overriding the sizes in _config.yml with a single width
    Given I have a responsive_image configuration with:
      """
        template: _includes/responsive-image.html
        sizes:
          - width: 100
      """
    And I have a file "index.html" with:
    """
    {% responsive_image path: assets/everybody-loves-jalapeño-pineapple-cornbread.png
                        alt: Foobar
                        widths: "60"
    %}
    """
    When I run Jekyll
    Then the image "assets/resized/everybody-loves-jalapeño-pineapple-cornbread-60x30.png" should have the dimensions "60x30"
    And the file "_site/assets/resized/everybody-loves-jalapeño-pineapple-cornbread-60x30.png" should exist
    And the file "_site/assets/resized/everybody-loves-jalapeño-pineapple-cornbread-100x50.png" should not exist

  Scenario: Overriding the sizes in _config.yml with multiple widths
    Given I have a responsive_image configuration with:
      """
        template: _includes/responsive-image.html
        sizes:
          - width: 100
      """
    And I have a file "index.html" with:
    """
    {% responsive_image path: assets/everybody-loves-jalapeño-pineapple-cornbread.png
                        alt: Foobar
                        widths: "60, 80"
    %}
    """
    When I run Jekyll
    Then the image "assets/resized/everybody-loves-jalapeño-pineapple-cornbread-60x30.png" should have the dimensions "60x30"
    And the file "_site/assets/resized/everybody-loves-jalapeño-pineapple-cornbread-60x30.png" should exist
    And the image "assets/resized/everybody-loves-jalapeño-pineapple-cornbread-80x40.png" should have the dimensions "80x40"
    And the file "_site/assets/resized/everybody-loves-jalapeño-pineapple-cornbread-80x40.png" should exist
    And the file "_site/assets/resized/everybody-loves-jalapeño-pineapple-cornbread-100x50.png" should not exist
