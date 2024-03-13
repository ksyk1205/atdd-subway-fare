package nextstep.subway.unit;


import nextstep.subway.domain.farecalculation.FareCalculation;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@DisplayName("요금 계산 테스트")
public class FareCalculationTest {

    @ParameterizedTest
    @CsvSource({
            "10, 1250",
            "12, 1350",
            "51, 2150"
    })
    void 요금계산(Long distance, int fare) {
        //given

        //when
        int fareResult = FareCalculation.getFareByDistance(distance);

        //then
        assertThat(fareResult).isEqualTo(fare);
    }
}
