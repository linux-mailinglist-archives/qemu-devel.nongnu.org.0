Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20AA417082
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:57:31 +0200 (CEST)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTitX-0006tg-0u
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTirh-0005mT-Dw
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 06:55:37 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:48303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTirb-0004WF-Ng
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 06:55:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.68])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 07007202EC;
 Fri, 24 Sep 2021 10:55:20 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 24 Sep
 2021 12:55:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00613b99b34-d39b-48b8-8a00-6d567e0f459b,
 EA4874C54EC1FB151381C7D8681494D1EB26EF60) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <942903da-c16f-23dd-155d-61af84962935@kaod.org>
Date: Fri, 24 Sep 2021 12:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/misc: Add an iBT device model
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Titus Rwantare
 <titusr@google.com>, "andrew@aj.id.au" <andrew@aj.id.au>
References: <CAMvPwGr-FuQWHTQYxppAyT9uPhzCUDcezgz+jV=GwHGoQF4N6A@mail.gmail.com>
 <1a0d6240-6654-0cf7-01ce-ef3ebf497a5c@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1a0d6240-6654-0cf7-01ce-ef3ebf497a5c@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 182cee8e-37a2-48f9-a21b-12df24e1e0c9
X-Ovh-Tracer-Id: 12580805561070881641
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmihhnhigrrhgusegrtghmrdhorhhg
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>, Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Titus,

On 9/24/21 10:42, Philippe Mathieu-Daudé wrote:
> On 9/24/21 01:48, Titus Rwantare wrote:
>> Hello all,
>>
>> I'd like some clarification on how the following code transfers irqs
>> back and forth:
>>> b/hw/arm/aspeed_soc.c
>>> +    /* iBT */
>>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
>>> +        return;
>>> +    }
>>> +    memory_region_add_subregion(&s->lpc.iomem,
>>> +                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DEV_LPC],
>>> +                   &s->ibt.iomem);
>>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_ibt,


The iBT device IRQ is connected to a subdevice irq of the LPC device.
See aspeed_lpc_realize(). And triggered in aspeed_lpc_set_irq()

> Code smell indeed, likely:
> 
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->ibt), 1 + aspeed_lpc_ibt,

why ? See what's done above for the LPC device. Commit c59f781e3bcc
("hw/misc: Model KCS devices in the Aspeed LPC controller") and comment


     /*
      * On the AST2400 and AST2500 the one LPC IRQ is shared between all of the
      * subdevices. Connect the LPC subdevice IRQs to the LPC controller IRQ (by
      * contrast, on the AST2600, the subdevice IRQs are connected straight to
      * the GIC).
      *
      * LPC subdevice IRQ sources are offset from 1 because the shared IRQ output
      * to the VIC is at offset 0.
      */

> 
>>> +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_ibt));
>>> }
>>
>> and
>>
>>> hw/misc/aspeed_ibt.c
>>> +static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>> +    AspeedIBTState *ibt = ASPEED_IBT(dev);
>> ...
>>> +
>>> +    sysbus_init_irq(sbd, &ibt->irq);
>>
>> I ask because the code in aspeed_soc.c seems to connect to the
>> lpc->subdevice_irqs[aspeed_lpc_ibt], initialised on
>> hw/misc/aspeed_lpc.c:408.
>> I noticed that bmc firmware running in qemu was checking the BT_CTRL
>> register less frequently than I'd like while editing this patch to use
>> the IPMIInterface.

OK.

This might be a problem in aspeed_ibt_update_irq(). This patch is
an experiment from some few years ago. It still works good enough
for the witherspoon-bmc and powernv9 machines for simple IPMI
commands: fru, sdr, lan, power off (to be checked).

Could you share your BMC and host command line ?

Thanks,

C.

