/*
 * Copyright(c) 2017 NTT Corporation.
 */
package jp.co.ntt.atrs.app.b0;

import jp.co.ntt.atrs.domain.model.BoardingClassCd;
import jp.co.ntt.atrs.domain.model.FareTypeCd;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;
import java.util.Date;

/**
 * 選択フライト情報DTOクラス。
 * @author NTT 電電次郎
 */
public class SelectFlightDto implements Serializable {

    /**
     * シリアルバージョンUID。
     */
    private static final long serialVersionUID = 2564839849286457368L;

    /**
     * 路線種別。
     */
    private LineType lineType;

    /**
     * 搭乗日。
     */
    private Date departureDate;

    /**
     * 便名。
     */
    private String flightName;

    /**
     * 出発空港コード。
     */
    private String depAirportCd;

    /**
     * 到着空港コード。
     */
    private String arrAirportCd;

    /**
     * 出発時刻。
     */
    private String departureTime;

    /**
     * 到着時刻。
     */
    private String arrivalTime;

    /**
     * 搭乗クラスコード。
     */
    private BoardingClassCd boardingClassCd;

    /**
     * 運賃種別コード。
     */
    private FareTypeCd fareTypeCd;

    /**
     * 運賃。
     */
    private int fare;

    /**
     * 路線種別を取得する。
     * @return 路線種別
     */
    public LineType getLineType() {
        return lineType;
    }

    /**
     * 路線種別を設定する。
     * @param lineType 路線種別
     */
    public void setLineType(LineType lineType) {
        this.lineType = lineType;
    }

    /**
     * 搭乗日を取得する。
     * @return 搭乗日
     */
    public Date getDepartureDate() {
        return departureDate;
    }

    /**
     * 搭乗日を設定する。
     * @param departureDate 搭乗日
     */
    public void setDepartureDate(Date departureDate) {
        this.departureDate = departureDate;
    }

    /**
     * 便名を取得する。
     * @return 便名
     */
    public String getFlightName() {
        return flightName;
    }

    /**
     * 便名を設定する。
     * @param flightName 便名
     */
    public void setFlightName(String flightName) {
        this.flightName = flightName;
    }

    /**
     * 出発空港コードを取得する。
     * @return 出発空港コード
     */
    public String getDepAirportCd() {
        return depAirportCd;
    }

    /**
     * 出発空港コードを設定する。
     * @param depAirportCd 出発空港コード
     */
    public void setDepAirportCd(String depAirportCd) {
        this.depAirportCd = depAirportCd;
    }

    /**
     * 到着空港コードを取得する。
     * @return 到着空港コード
     */
    public String getArrAirportCd() {
        return arrAirportCd;
    }

    /**
     * 到着空港コードを設定する。
     * @param arrAirportCd 到着空港コード
     */
    public void setArrAirportCd(String arrAirportCd) {
        this.arrAirportCd = arrAirportCd;
    }

    /**
     * 出発時刻を取得する。
     * @return 出発時刻
     */
    public String getDepartureTime() {
        return departureTime;
    }

    /**
     * 出発時刻を設定する。
     * @param departureTime 出発時刻
     */
    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    /**
     * 到着時刻を取得する。
     * @return 到着時刻
     */
    public String getArrivalTime() {
        return arrivalTime;
    }

    /**
     * 到着時刻を設定する。
     * @param arrivalTime 到着時刻
     */
    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    /**
     * 搭乗クラスコードを取得する。
     * @return 搭乗クラスコード
     */
    public BoardingClassCd getBoardingClassCd() {
        return boardingClassCd;
    }

    /**
     * 搭乗クラスコードを設定する。
     * @param boardingClassCd 搭乗クラスコード
     */
    public void setBoardingClassCd(BoardingClassCd boardingClassCd) {
        this.boardingClassCd = boardingClassCd;
    }

    /**
     * 運賃種別コードを取得する。
     * @return 運賃種別コード
     */
    public FareTypeCd getFareTypeCd() {
        return fareTypeCd;
    }

    /**
     * 運賃種別コードを設定する。
     * @param fareTypeCd 運賃種別コード
     */
    public void setFareTypeCd(FareTypeCd fareTypeCd) {
        this.fareTypeCd = fareTypeCd;
    }

    /**
     * 運賃を取得する。
     * @return 運賃
     */
    public int getFare() {
        return fare;
    }

    /**
     * 運賃を設定する。
     * @param fare 運賃
     */
    public void setFare(int fare) {
        this.fare = fare;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this,
                ToStringStyle.MULTI_LINE_STYLE);
    }
}