Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E7E5555A6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 23:01:35 +0200 (CEST)
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47Ti-000740-8C
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 17:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o47Id-0003hl-EB
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:50:07 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:44949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o47Ib-0004XZ-Hq
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:50:07 -0400
Received: by mail-ed1-x536.google.com with SMTP id z19so8758426edb.11
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B6i5EpIAMDdtFwZvLblIe+v/y/vG+v6Cn1OsZodYJ9Y=;
 b=f1h7z387mqEjgXiOqI7FFp9j3zMfOyrVx2rasV5IftSr0phFUTa6njMd/ndsun7TBt
 b/hPst6xy+qlApz8Jk33/OlaIYBFECvTQyvR03b84aGvukMuKkrcikvFb1rxmcEg/17x
 2cuHCnsMXUODRC+PzCrP7py+t794KLI6xJVfBH6LvXeHTtd3oHV+bwdf1OWOSPeO1GJm
 NOB0CqPjERBU36n4rJT1Y11Bjv2VA9I+qHb8PPk0D8VnPIKUgszCNq7Det9VTUSl02hW
 k7dCzDPtPJahJAl/kh3S0JpkVAv/mXxy8b3Hc+483Yl0eKhzgpbt+HI/YVfgfcIz3RjU
 lnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B6i5EpIAMDdtFwZvLblIe+v/y/vG+v6Cn1OsZodYJ9Y=;
 b=LyvkzvmeFgPenPJeGR7F0IUi1LjiOW2D24rASBmz/pPIE8f5DlzKvzhn5SxhjHHTNq
 hqGF1IpzR6KGwh+Tm48VHXtD8fLGDOpQ2s225zygA1HfaVgqgJsDfP2vcAmYacILFxvP
 zBM/AtEqKh6WLS9CkorfqO6SxGBfMRcHHoVZffR5R3LJ7O1kIdfgbrZOOf3QgroP18/U
 UmnuJa+8dqK6BxLAj+FLSKvi/bv27Ah4DxD+15TBuXjCOeTTX8ypBCDdUKI94YsdZpCR
 QmogYZMrO1SXYnIOFC6wyq7QNy0ymZmDB2xEZmWU53rkFYs3hsfcJ3j1Kyj4oE3nMYne
 tMuA==
X-Gm-Message-State: AJIora/0nQ+p/aF4ZhsrBWxsVk0ETdgphqtX8n5xVbA89YqW9ZpfOQj6
 izIgskZ3gJCLi4e7oCYdsIOG/H0AzfKGqTz1Y0oEHA==
X-Google-Smtp-Source: AGRyM1t6cO9Qo6aZ4QNgSfGnfkwG9H/6CO9IljId2AVuzg7v7w65OZ+m7s5mDwnJ3PrXXaxg2IGzNtav+62gF1qe1Pk=
X-Received: by 2002:aa7:c801:0:b0:435:5a08:f54c with SMTP id
 a1-20020aa7c801000000b004355a08f54cmr6532950edt.254.1655931004007; Wed, 22
 Jun 2022 13:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-7-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220622172830.101210-7-quic_jaehyoo@quicinc.com>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 22 Jun 2022 13:49:27 -0700
Message-ID: <CAMvPwGoPsdj8ZX1YAK06w9maCaPOVg1Us8YWQr3cH_+6MfRUQA@mail.gmail.com>
Subject: Re: [PATCH 6/9] hw/sensor: add Maxim MAX31785 device
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=titusr@google.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Jun 2022 at 10:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
>
> MAX31785 is a PMBus compliant 6-Channel fan controller. It supports 6 fan
> channels, 11 temperature sensors, and 6-Channel ADC to measure the remote
> voltages. Datasheet can be found here:
> https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
>
> This initial version of the driver has skeleton and support for the
> fan channels. Requests for temperature sensors, and ADC Channels the
> are serviced with the default values as per the datasheet.  No additional
> instrumentation is done.  NV Log feature is not supported.
>
> Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> ---
>  hw/arm/Kconfig        |   1 +
>  hw/arm/aspeed.c       |   6 +-
>  hw/sensor/Kconfig     |   4 +
>  hw/sensor/max31785.c  | 580 ++++++++++++++++++++++++++++++++++++++++++
>  hw/sensor/meson.build |   1 +
>  5 files changed, 590 insertions(+), 2 deletions(-)
>  create mode 100644 hw/sensor/max31785.c
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 219262a8da36..77ef0fa967b2 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -408,6 +408,7 @@ config NPCM7XX
>      select SSI
>      select UNIMP
>      select PCA954X
> +    select MAX31785
>
>  config FSL_IMX25
>      bool

As this is being used with the Aspeed 2600, you may need to select
PMBUS and MAX31785 under config ASPEED_SOC in this same file.


> diff --git a/hw/sensor/max31785.c b/hw/sensor/max31785.c
> new file mode 100644
> index 000000000000..11bf9977b6fd
> --- /dev/null
> +++ b/hw/sensor/max31785.c


Also, style nit, the checkpatch.pl script doesn't check whitespace
alignment. But the style guide
https://qemu-project.gitlab.io/qemu/devel/style.html#multiline-indent
specifies the variants we should use.

> +        pmdev->pages[i].vout_scale_monitor =
> +        MAX31785_DEFAULT_VOUT_SCALE_MONITOR;
> +        pmdev->pages[i].vout_ov_fault_limit =
> +        MAX31785_DEFAULT_OV_FAULT_LIMIT;
> +        pmdev->pages[i].vout_ov_warn_limit =
> +        MAX31785_DEFAULT_OV_WARN_LIMIT;
> +    }
> +
> +}
> +
> +static const VMStateDescription vmstate_max31785 = {
> +    .name = TYPE_MAX31785,
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]){
> +        VMSTATE_PMBUS_DEVICE(parent, MAX31785State),
> +        VMSTATE_UINT16_ARRAY(mfr_mode, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT16_ARRAY(vout_peak, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT16_ARRAY(temperature_peak, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT16_ARRAY(vout_min, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT8_ARRAY(fault_response, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT32_ARRAY(time_count, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT16_ARRAY(temp_sensor_config, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT16_ARRAY(fan_config, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT16_ARRAY(read_fan_pwm, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT16_ARRAY(fan_fault_limit, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT16_ARRAY(fan_warn_limit, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT16_ARRAY(fan_run_time, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT16_ARRAY(fan_pwm_avg, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT64_ARRAY(fan_pwm2rpm, MAX31785State,
> +        MAX31785_TOTAL_NUM_PAGES),
> +        VMSTATE_UINT64(mfr_location, MAX31785State),
> +        VMSTATE_UINT64(mfr_date, MAX31785State),
> +        VMSTATE_UINT64(mfr_serial, MAX31785State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
There's missing indentation here for example.


Thanks,
Titus Rwantare

