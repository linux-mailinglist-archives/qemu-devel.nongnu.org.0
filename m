Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C22556E4C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 00:06:43 +0200 (CEST)
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o48Uk-0006Pa-Gm
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 18:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o48Sr-0004ue-8R; Wed, 22 Jun 2022 18:04:46 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:56170)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o48Sn-0007D5-TO; Wed, 22 Jun 2022 18:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655935481; x=1687471481;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uHRd7TkuzOMjgLA8Oi6i6lW6r0fsP37LWClYU4ygYak=;
 b=SF02xNmm686Szgx/jM1MfUmEi0EBQWeSEMH1dhPrub5lk4+5C/YSdtfM
 asDaYOP5uQUbWPpK+oi+CrQJ0aq3VDQmYTaHZjNtSSX1M/B4kiudqIQqd
 hxAN9ywd95dgt0KWYV4kBsx+sTzKm2tOznNAewDwBSzNl3+HsqaSbgwbT k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jun 2022 15:04:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 15:04:38 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 15:04:38 -0700
Received: from [10.110.81.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 15:04:37 -0700
Message-ID: <ba7cda55-1f6b-8cda-ea1a-1d4e71de8b3a@quicinc.com>
Date: Wed, 22 Jun 2022 15:04:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/9] hw/i2c: pmbus: Page #255 is valid page for read
 requests.
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>
CC: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley
 <joel@jms.id.au>, Graeme Gregory <quic_ggregory@quicinc.com>, "Maheswara
 Kurapati" <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-6-quic_jaehyoo@quicinc.com>
 <CAMvPwGp6Rr3g5Rn3jAU1ZK_99oxrx6z=4ggUWFheL_ipQnJfHQ@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CAMvPwGp6Rr3g5Rn3jAU1ZK_99oxrx6z=4ggUWFheL_ipQnJfHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
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
>> Current implementation of the pmbus core driver treats the read request
>> for page 255 as invalid request and sets the invalid command bit (bit 7) in the
>> STATUS_CML register. As per the PMBus specification it is a valid request.
>>
>> Refer to the PMBus specification, revision 1.3.1, section 11.10 PAGE, on the page 58:
>> "Setting the PAGE to FFh means that all subsequent comands are to be applied to
>>   all outputs.
>>
>>   Some commands, such as READ_TEMPERATURE, may use a common sensor but be
>>   available on all pages of a device.  Such implementations are the decision of
>>   each device manufacturer or are specified in a PMBus Application Profile. Consult
>>   the manufacturer's socuments or the Applicatin Profile Specification as needed."
>>
> Thanks for this, the copy of the spec I used was older.
> 
> 
>> For e.g.,
>> The VOUT_MODE is a valid command for page 255 for maxim 31785 device.
>> refer to Table 1. PMBus Command Codes on page 14 in the datasheet.
>> https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
>>
>> Fixes: 38870253f1d1 ("hw/i2c: pmbus: fix error returns and guard against out of range accesses")
>>
>> Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
>> ---
>>   hw/i2c/pmbus_device.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
>> index 62885fa6a15e..7db3343a83b6 100644
>> --- a/hw/i2c/pmbus_device.c
>> +++ b/hw/i2c/pmbus_device.c
>> @@ -291,7 +291,6 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>>           qemu_log_mask(LOG_GUEST_ERROR,
>>                         "%s: tried to read from all pages\n",
>>                         __func__);
>> -        pmbus_cml_error(pmdev);
>>       } else if (pmdev->page > pmdev->num_pages - 1) {
>>           qemu_log_mask(LOG_GUEST_ERROR,
>>                         "%s: page %d is out of range\n",
>> --
>> 2.25.1
>>
> 
> Please also update the stale comment just above, since this is now
> specified behaviour.

Right. The error log printing also needs to be removed so I'll revise 
this fix like below in v2.

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 62885fa6a15e..749a33af827b 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -284,14 +284,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)

      /*
       * Reading from all pages will return the value from page 0,
-     * this is unspecified behaviour in general.
+     * means that all subsequent commands are to be applied to all output.
       */
      if (pmdev->page == PB_ALL_PAGES) {
          index = 0;
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: tried to read from all pages\n",
-                      __func__);
-        pmbus_cml_error(pmdev);
      } else if (pmdev->page > pmdev->num_pages - 1) {
          qemu_log_mask(LOG_GUEST_ERROR,
                        "%s: page %d is out of range\n",

> Reviewed-by: Titus Rwantare <titusr@google.com>

Thank you so much for your review.

Regards,
Jae

