Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBA41B575
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:55:45 +0200 (CEST)
Received: from localhost ([::1]:36504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVHKR-0002Ld-Ts
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mVHJQ-0001fV-9Q
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:54:40 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:36153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mVHJO-0004DY-B1
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:54:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E5E8021313;
 Tue, 28 Sep 2021 17:54:27 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 28 Sep
 2021 19:54:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0014888ec3a-a2e3-4dee-bf12-caa855948d0d,
 8FD5BF52E92266594195F7AC71BB6A975D27E3EC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4da8f6cf-0397-e2dd-2a3d-e81bfcaefd67@kaod.org>
Date: Tue, 28 Sep 2021 19:54:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] hw/misc: Add an iBT device model
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>
References: <CAMvPwGr-FuQWHTQYxppAyT9uPhzCUDcezgz+jV=GwHGoQF4N6A@mail.gmail.com>
 <1a0d6240-6654-0cf7-01ce-ef3ebf497a5c@amsat.org>
 <942903da-c16f-23dd-155d-61af84962935@kaod.org>
 <CAMvPwGpWftHwxJBbRUzHmsuguspUPBXgU+ROZqRJ2ypa4z6ETg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAMvPwGpWftHwxJBbRUzHmsuguspUPBXgU+ROZqRJ2ypa4z6ETg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4fb99902-3422-480d-8640-21b44da7cde2
X-Ovh-Tracer-Id: 6256344309420493673
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudektddguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmihhnhigrrhgusegrtghmrdhorhhg
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) NICE_REPLY_A=-2.562,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <minyard@acm.org>, "andrew@aj.id.au" <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 20:43, Titus Rwantare wrote:
> On Fri, 24 Sept 2021 at 03:55, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Hello Titus,
>>
>> On 9/24/21 10:42, Philippe Mathieu-Daudé wrote:
>>> On 9/24/21 01:48, Titus Rwantare wrote:
>>>> Hello all,
>>>>
>>>> I'd like some clarification on how the following code transfers irqs
>>>> back and forth:
>>>>> b/hw/arm/aspeed_soc.c
>>>>> +    /* iBT */
>>>>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
>>>>> +        return;
>>>>> +    }
>>>>> +    memory_region_add_subregion(&s->lpc.iomem,
>>>>> +                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DEV_LPC],
>>>>> +                   &s->ibt.iomem);
>>>>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_ibt,
>>
>>
>> The iBT device IRQ is connected to a subdevice irq of the LPC device.
>> See aspeed_lpc_realize(). And triggered in aspeed_lpc_set_irq()
> 
> Yes, that side makes sense. I tried to get at that irq from
> aspeed_ibt.c as follows:
> 
> qemu_irq_lower(ibt->lpc->subdevice_irqs[aspeed_lpc_ibt]); // or raise
> 
> static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
> {
> AspeedIBTState *ibt = ASPEED_IBT(dev);
> SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> IPMIInterface *ii = IPMI_INTERFACE(dev);
> ibt->lpc = ASPEED_LPC(dev);
> ...
> 
> but this doesn't work and maybe I'm misusing the dynamic cast?
> 
>>>>> +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_ibt));
>>>>> }
>>>>
>>>> and
>>>>
>>>>> hw/misc/aspeed_ibt.c
>>>>> +static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
>>>>> +{
>>>>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>>>> +    AspeedIBTState *ibt = ASPEED_IBT(dev);
>>>> ...
>>>>> +
>>>>> +    sysbus_init_irq(sbd, &ibt->irq);
>>>>
>>>> I ask because the code in aspeed_soc.c seems to connect to the
>>>> lpc->subdevice_irqs[aspeed_lpc_ibt], initialised on
>>>> hw/misc/aspeed_lpc.c:408.
>>>> I noticed that bmc firmware running in qemu was checking the BT_CTRL
>>>> register less frequently than I'd like while editing this patch to use
>>>> the IPMIInterface.
>>
>> OK.
>>
>> This might be a problem in aspeed_ibt_update_irq(). This patch is
>> an experiment from some few years ago. It still works good enough
>> for the witherspoon-bmc and powernv9 machines for simple IPMI
>> commands: fru, sdr, lan, power off (to be checked).
>>
>> Could you share your BMC and host command line ?
>>
> 
> Host:
> -chardev socket,id=ipmichr1,host=localhost,port=9999,reconnect=10 \
> -device ipmi-bmc-extern,chardev=ipmichr1,id=bmc0 \
> -device isa-ipmi-bt,bmc=bmc0,irq=10 -nodefaults
> 
> BMC:
> -chardev socket,id=ipmichr1,host=localhost,port=9999,server=on,wait=off \
> -device ipmi-host-extern,chardev=ipmichr1,responder=/machine/soc/ibt

This looks correct.

> But for this to work you need Hao's patch as well: [PATCH 7/8]
> hw/ipmi: Add an IPMI external host device.
  
Is it based on my aspeed branch which contains the iBT model ?
Could you send the patchset as an RFC maybe ?


Thanks,

C.



