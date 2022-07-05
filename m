Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F95664BB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:16:08 +0200 (CEST)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dj5-0001xn-EE
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8dca-0004ZB-F9
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:09:24 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:46731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o8dcX-0000EU-SK
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:09:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 722E8253B1;
 Tue,  5 Jul 2022 08:09:18 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 5 Jul 2022
 10:09:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0012842f7e8-0b5b-40d3-ae08-d662f075cf3a,
 4FF77D4A254985FC0BE9A952312E42D6E34C6CC4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f7e5b92d-48ae-8788-7b69-e75c21305c4c@kaod.org>
Date: Tue, 5 Jul 2022 10:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/8] aspeed: Add fby35 skeleton
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>, Joel Stanley <joel@jms.id.au>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>
References: <20220704215457.38332-1-peter@pjd.dev>
 <20220704215457.38332-5-peter@pjd.dev>
 <CACPK8XfcZM+9sk4f=fCtW2zVioN0sgoT=o+dF62U=AMZuUsL6g@mail.gmail.com>
 <YsPvMUfG6CzK9LSz@pdel-mbp>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YsPvMUfG6CzK9LSz@pdel-mbp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: caf50ff1-a39e-45c1-ba44-2c090c04e89e
X-Ovh-Tracer-Id: 17414856811731979046
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejteeuleelfeeujeeiheffteekffegffekvdevleevtefgvedvfeehheeugeegieenucffohhmrghinhepmhgvthgrrdgtohhmpdhophgvnhgtohhmphhuthgvrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/5/22 09:58, Peter Delevoryas wrote:
> On Tue, Jul 05, 2022 at 06:53:43AM +0000, Joel Stanley wrote:
>> On Mon, 4 Jul 2022 at 21:55, Peter Delevoryas <peter@pjd.dev> wrote:
>>>
>>> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   MAINTAINERS        |  1 +
>>>   hw/arm/fby35.c     | 39 +++++++++++++++++++++++++++++++++++++++
>>>   hw/arm/meson.build |  3 ++-
>>>   3 files changed, 42 insertions(+), 1 deletion(-)
>>>   create mode 100644 hw/arm/fby35.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index d9378511b7..147330ddd7 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1067,6 +1067,7 @@ F: hw/net/ftgmac100.c
>>>   F: include/hw/net/ftgmac100.h
>>>   F: docs/system/arm/aspeed.rst
>>>   F: tests/qtest/*aspeed*
>>> +F: hw/arm/fby35.c
>>>
>>>   NRF51
>>>   M: Joel Stanley <joel@jms.id.au>
>>> diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
>>> new file mode 100644
>>> index 0000000000..03b458584c
>>> --- /dev/null
>>> +++ b/hw/arm/fby35.c
>>> @@ -0,0 +1,39 @@
>>> +/*
>>> + * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
>>
>> Can you mention what fby35 means? I keep reading your patches but can't recall.
> 
> Oh yeah sure, it means "Facebook Yosemite version 3.5". Facebook has a series
> of multi-node compute server designs named Yosemite, the most recent version
> was Yosemite 3:
> 
> https://www.opencompute.org/documents/ocp-yosemite-v3-platform-design-specification-1v16-pdf
> 
> Yosemite 3.5 is an iteration on this design. It's actually very similar in terms
> of there being a BMC on the baseboard, and a Bridge IC (BIC) on each server
> board, with room for expansion boards as well.

You just wrote the commit log :)

C.


> I'm still debugging I2C a little bit, but my goal is to be able to test BMC <->
> BIC IPMB messages with the full OpenBMC firmware running on the BMC and the
> OpenBIC firmware running on the BIC, and to expand this machine to include the
> other 3 slot BIC's (in this patch series, I only included the BIC in the first
> slot).
> 
>>
>>> + *
>>> + * This code is licensed under the GPL version 2 or later. See the COPYING
>>> + * file in the top-level directory.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "hw/boards.h"
>>> +
>>> +#define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
>>> +OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
>>> +
>>> +struct Fby35State {
>>> +    MachineState parent_obj;
>>> +};
>>> +
>>> +static void fby35_init(MachineState *machine)
>>> +{
>>> +}
>>> +
>>> +static void fby35_class_init(ObjectClass *oc, void *data)
>>> +{
>>> +    MachineClass *mc = MACHINE_CLASS(oc);
>>> +
>>> +    mc->desc = "Meta Platforms fby35";
>>> +    mc->init = fby35_init;
>>> +}
>>> +
>>> +static const TypeInfo fby35_types[] = {
>>> +    {
>>> +        .name = MACHINE_TYPE_NAME("fby35"),
>>> +        .parent = TYPE_MACHINE,
>>> +        .class_init = fby35_class_init,
>>> +        .instance_size = sizeof(Fby35State),
>>> +    },
>>> +};
>>> +
>>> +DEFINE_TYPES(fby35_types);
>>> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
>>> index 2d8381339c..92f9f6e000 100644
>>> --- a/hw/arm/meson.build
>>> +++ b/hw/arm/meson.build
>>> @@ -51,7 +51,8 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>>>     'aspeed_soc.c',
>>>     'aspeed.c',
>>>     'aspeed_ast2600.c',
>>> -  'aspeed_ast10x0.c'))
>>> +  'aspeed_ast10x0.c',
>>> +  'fby35.c'))
>>>   arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
>>>   arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
>>>   arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
>>> --
>>> 2.37.0
>>>


