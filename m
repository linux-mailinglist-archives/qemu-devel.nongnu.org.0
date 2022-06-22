Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37722556E4D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 00:08:12 +0200 (CEST)
Received: from localhost ([::1]:50198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o48WB-0008Fw-1Z
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 18:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o48Um-00071W-Vi; Wed, 22 Jun 2022 18:06:44 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:62723)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o48Uk-0007f6-Rg; Wed, 22 Jun 2022 18:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655935602; x=1687471602;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+UplhAemCRIGtdvh/Igc3Eiu+bNuZFSzEc8lqL+c5gU=;
 b=jO/Cy1Qd7fOwGSgEKmCimoFmC5lCgN+Jg4XMLD8HilaJM99s6uQ07O8D
 L4hkpgvancNQ7nvwRWeTVhXjUxnvtd+VZegoeOp44Gie1s0YeJCMD+APj
 dNgMWwyqsWGa8brz2qpgbJyQIosUxe+S30dTQfusPINBHoqqZ7xAq9gT3 I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jun 2022 15:06:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 15:06:40 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 15:06:40 -0700
Received: from [10.110.81.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 15:06:31 -0700
Message-ID: <e62e26c7-8aa7-ca96-3a94-88cad6bd0d43@quicinc.com>
Date: Wed, 22 Jun 2022 15:06:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/9] hw/sensor: add Maxim MAX31785 device
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>
CC: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley
 <joel@jms.id.au>, Graeme Gregory <quic_ggregory@quicinc.com>, "Maheswara
 Kurapati" <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-7-quic_jaehyoo@quicinc.com>
 <CAMvPwGoPsdj8ZX1YAK06w9maCaPOVg1Us8YWQr3cH_+6MfRUQA@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CAMvPwGoPsdj8ZX1YAK06w9maCaPOVg1Us8YWQr3cH_+6MfRUQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello Titus,

On 6/22/2022 1:49 PM, Titus Rwantare wrote:
> On Wed, 22 Jun 2022 at 10:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>
>> From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
>>
>> MAX31785 is a PMBus compliant 6-Channel fan controller. It supports 6 fan
>> channels, 11 temperature sensors, and 6-Channel ADC to measure the remote
>> voltages. Datasheet can be found here:
>> https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
>>
>> This initial version of the driver has skeleton and support for the
>> fan channels. Requests for temperature sensors, and ADC Channels the
>> are serviced with the default values as per the datasheet.  No additional
>> instrumentation is done.  NV Log feature is not supported.
>>
>> Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
>> ---
>>   hw/arm/Kconfig        |   1 +
>>   hw/arm/aspeed.c       |   6 +-
>>   hw/sensor/Kconfig     |   4 +
>>   hw/sensor/max31785.c  | 580 ++++++++++++++++++++++++++++++++++++++++++
>>   hw/sensor/meson.build |   1 +
>>   5 files changed, 590 insertions(+), 2 deletions(-)
>>   create mode 100644 hw/sensor/max31785.c
>>
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 219262a8da36..77ef0fa967b2 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -408,6 +408,7 @@ config NPCM7XX
>>       select SSI
>>       select UNIMP
>>       select PCA954X
>> +    select MAX31785
>>
>>   config FSL_IMX25
>>       bool
> 
> As this is being used with the Aspeed 2600, you may need to select
> PMBUS and MAX31785 under config ASPEED_SOC in this same file.

Okay. Will fix it in v2.

>> diff --git a/hw/sensor/max31785.c b/hw/sensor/max31785.c
>> new file mode 100644
>> index 000000000000..11bf9977b6fd
>> --- /dev/null
>> +++ b/hw/sensor/max31785.c
> 
> 
> Also, style nit, the checkpatch.pl script doesn't check whitespace
> alignment. But the style guide
> https://qemu-project.gitlab.io/qemu/devel/style.html#multiline-indent
> specifies the variants we should use.

Will fix the indentation in v2.

>> +        pmdev->pages[i].vout_scale_monitor =
>> +        MAX31785_DEFAULT_VOUT_SCALE_MONITOR;
>> +        pmdev->pages[i].vout_ov_fault_limit =
>> +        MAX31785_DEFAULT_OV_FAULT_LIMIT;
>> +        pmdev->pages[i].vout_ov_warn_limit =
>> +        MAX31785_DEFAULT_OV_WARN_LIMIT;
>> +    }
>> +
>> +}
>> +
>> +static const VMStateDescription vmstate_max31785 = {
>> +    .name = TYPE_MAX31785,
>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .fields = (VMStateField[]){
>> +        VMSTATE_PMBUS_DEVICE(parent, MAX31785State),
>> +        VMSTATE_UINT16_ARRAY(mfr_mode, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT16_ARRAY(vout_peak, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT16_ARRAY(temperature_peak, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT16_ARRAY(vout_min, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT8_ARRAY(fault_response, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT32_ARRAY(time_count, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT16_ARRAY(temp_sensor_config, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT16_ARRAY(fan_config, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT16_ARRAY(read_fan_pwm, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT16_ARRAY(fan_fault_limit, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT16_ARRAY(fan_warn_limit, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT16_ARRAY(fan_run_time, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT16_ARRAY(fan_pwm_avg, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT64_ARRAY(fan_pwm2rpm, MAX31785State,
>> +        MAX31785_TOTAL_NUM_PAGES),
>> +        VMSTATE_UINT64(mfr_location, MAX31785State),
>> +        VMSTATE_UINT64(mfr_date, MAX31785State),
>> +        VMSTATE_UINT64(mfr_serial, MAX31785State),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
> There's missing indentation here for example.

Will fix it too.

Thanks,
Jae


