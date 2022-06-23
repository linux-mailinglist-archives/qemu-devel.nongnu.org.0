Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F44557D9A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:14:54 +0200 (CEST)
Received: from localhost ([::1]:51698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Nbh-0003nR-Mo
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o4NZT-0001jQ-Q4; Thu, 23 Jun 2022 10:12:35 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:32532)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o4NZQ-0005Bf-2V; Thu, 23 Jun 2022 10:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655993552; x=1687529552;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E/b7m1t7XpSGo9m9F9Yu/PB+h7o53HbGU3H1eOvmAck=;
 b=GTvfZv/1jg/766Dv4iRGL4Wb56+G60vpWT9yXzJoIlDgVNqSA+s5zMMz
 V3Bf1Zdrp+9n04FbwITe3QWy8AbaVuAchEuHUoiNYvGqq7ybtR8r2xgJZ
 xLPv+JXvNmPFZL1oiaMs8UlfINL3BYjAcOR/ZWfMfyzGy6alDznB1EtbH M=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Jun 2022 07:12:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 07:12:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 23 Jun 2022 07:12:29 -0700
Received: from [10.110.34.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 23 Jun
 2022 07:12:28 -0700
Message-ID: <6bf03439-83d9-8a03-7290-439d41d02a13@quicinc.com>
Date: Thu, 23 Jun 2022 07:12:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/9] Add Qualcomm BMC machines
Content-Language: en-US
To: Graeme Gregory <quic_ggregory@quicinc.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
CC: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Titus Rwantare <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>, qemu-arm
 <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <CACPK8Xcfyu0BxEhVZDQ=mfw0OcPgSm6nVSzpmT5nviq7X+rFTA@mail.gmail.com>
 <2780eff7-17de-0496-7a5b-f3ede706794a@kaod.org>
 <20220623102421.nj56xcmrpnoc5wbg@ggregory-linuxws>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <20220623102421.nj56xcmrpnoc5wbg@ggregory-linuxws>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

On 6/23/2022 3:24 AM, Graeme Gregory wrote:
> On Thu, Jun 23, 2022 at 08:48:49AM +0200, Cédric Le Goater wrote:
>> On 6/23/22 07:25, Joel Stanley wrote:
>>> On Wed, 22 Jun 2022 at 17:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> I'm sending a series to add Qualcomm BMC machines that are equipped with
>>>> Aspeed AST2600 SoC. Also, this series adds MAX31785 fan controller device
>>>> emulation. Please help to review.
>>>
>>> Thanks for the MAX31785 model, that's handy to have.
>>>
>>> I'm all for more emulation and testing using Qemu models, but I wonder
>>> if you need to add all three of your boards. They seem to be a
>>> progression (evb-proto -> dc-scm -> firework). Could you get away with
>>> just one or two of those?
>>
>> I am not sure the evb-proto-bmc is useful to upstream. The other two
>> are fine.
>>
>> Thanks,
>>
> 
> I am happy with dropping the evb-proto-bmc machine. We used that
> internally before actual hardware was available.

Okay. I'll drop the evb-proto-bmc in v2.

Thanks,
Jae

> Graeme
> 
>> C.
>>
>>
>>
>>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Jae
>>>>
>>>> Graeme Gregory (2):
>>>>     hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU device
>>>>     hw/arm/aspeed: add Qualcomm Firework machine and FRU device
>>>>
>>>> Jae Hyun Yoo (3):
>>>>     hw/arm/aspeed: add support for the Qualcomm EVB proto board
>>>>     hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
>>>>     hw/arm/aspeed: firework: add I2C MUXes for VR channels
>>>>
>>>> Maheswara Kurapati (4):
>>>>     hw/i2c: pmbus: Page #255 is valid page for read requests.
>>>>     hw/sensor: add Maxim MAX31785 device
>>>>     hw/arm/aspeed: firework: Add MAX31785 Fan controllers
>>>>     hw/arm/aspeed: firework: Add Thermal Diodes
>>>>
>>>>    hw/arm/Kconfig        |   1 +
>>>>    hw/arm/aspeed.c       | 158 +++++++++++-
>>>>    hw/i2c/pmbus_device.c |   1 -
>>>>    hw/sensor/Kconfig     |   4 +
>>>>    hw/sensor/max31785.c  | 580 ++++++++++++++++++++++++++++++++++++++++++
>>>>    hw/sensor/meson.build |   1 +
>>>>    6 files changed, 742 insertions(+), 3 deletions(-)
>>>>    create mode 100644 hw/sensor/max31785.c
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>

