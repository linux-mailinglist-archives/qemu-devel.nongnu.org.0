Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BBD5F2B59
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 09:59:43 +0200 (CEST)
Received: from localhost ([::1]:44454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofGMX-0003eF-BG
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 03:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ofGKx-00028E-Bb; Mon, 03 Oct 2022 03:58:03 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ofGKv-0004iI-RL; Mon, 03 Oct 2022 03:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AVb6MAdRI2Tg+gQO7fqQKC8nWpNZ0QWKvYNLpJPYXDU=; b=YWeTt/vtXXW9bp5+RG5J1iQ1Sp
 zbkM4EMZhiMh+jBvxnPPPkBSDLQtkkmBcjaQHqoKffLnXpDpON/rxt5Fqsgk34jm7/Lu4dO6KxMtR
 DsCSII/VvhxXwGks45mvvA+JFET5uMy3+DFyFost6hlMQsQmjSRml6eboRxVBnHLJYLPyeb3c+Lh2
 u6+5er1ViF3QG38EM0aV8S7JcF3qk0/4+L1v01rx5EE1H9wVgRd8HinPSzPZ136ldC0kFM09nkIEN
 NM150Wa59k0c/H30QMiaIoT6JRiotzeApVfNhxWy50nGMWyTcAc9KoELYYpWA1OdS0bgLByKQySBS
 ENuiyZA4oKEq1EeYqAfmbwnDZNLFAi3tx0e3bQZiYZqY/YhAFpEQK/L3X9LuwnpPeoySsQUm7GJsi
 WoErP2udz/vDJwTZq1U1yW7puUPv+0bo2utqdwd58xVz7MPf34hbcR86Euscv0UCNBFNpGCqduFmQ
 P4gIegDuflE176CIG/KlxlL+eJAy3THGnkMEvkeMVrE/qUVOoDu0Tk0BRoax0T6UBjfJ56HrIhYpA
 q/sIwB7vpsRBHmOD3VTBKY7cFOvf/fNx7ZFh2UTUduyNbkNqjJb6gTlCiCRZJk1+ZclxSHZDXwJwt
 lFPVbXTJvd16R/oFB0VK5TpQ5rbO3o8iQdxsZwpOM=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ofGJ9-0005PC-LI; Mon, 03 Oct 2022 08:56:15 +0100
Message-ID: <cbdf0f47-6fa7-a0a3-271c-b209a53250b1@ilande.co.uk>
Date: Mon, 3 Oct 2022 08:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <2ff9b0ca151cab09512b37d855d03eee4a62812a.1664108862.git.balaton@eik.bme.hu>
 <197f737f-3ae8-6c73-7605-5bd89721dc3e@ilande.co.uk>
 <6cb830fc-1aa8-7ac9-b4a7-a251b9d79a@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <6cb830fc-1aa8-7ac9-b4a7-a251b9d79a@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 10/13] hw/ppc/mac.h: Move grackle-pcihost declaration
 out from shared header
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.086,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 29/09/2022 12:42, BALATON Zoltan wrote:

> On Thu, 29 Sep 2022, Mark Cave-Ayland wrote:
>> On 25/09/2022 13:38, BALATON Zoltan wrote:
>>
>>> It is only used by mac_oldworld anyway and it already instantiates
>>> a few devices by name so this allows reducing the shared header further.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>   hw/pci-host/grackle.c | 1 +
>>>   hw/ppc/mac.h          | 3 ---
>>>   hw/ppc/mac_oldworld.c | 2 +-
>>>   3 files changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
>>> index b05facf463..5282123004 100644
>>> --- a/hw/pci-host/grackle.c
>>> +++ b/hw/pci-host/grackle.c
>>> @@ -34,6 +34,7 @@
>>>   #include "trace.h"
>>>   #include "qom/object.h"
>>>   +#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
>>>   OBJECT_DECLARE_SIMPLE_TYPE(GrackleState, GRACKLE_PCI_HOST_BRIDGE)
>>>     struct GrackleState {
>>> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
>>> index 55cb02c990..fe77a6c6db 100644
>>> --- a/hw/ppc/mac.h
>>> +++ b/hw/ppc/mac.h
>>> @@ -35,9 +35,6 @@
>>>   #define KERNEL_LOAD_ADDR 0x01000000
>>>   #define KERNEL_GAP       0x00100000
>>>   -/* Grackle PCI */
>>> -#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
>>> -
>>>   /* Mac NVRAM */
>>>   #define TYPE_MACIO_NVRAM "macio-nvram"
>>>   OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
>>> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>>> index 1fa7b770b7..1355d032ff 100644
>>> --- a/hw/ppc/mac_oldworld.c
>>> +++ b/hw/ppc/mac_oldworld.c
>>> @@ -214,7 +214,7 @@ static void ppc_heathrow_init(MachineState *machine)
>>>       }
>>>         /* Grackle PCI host bridge */
>>> -    grackle_dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
>>> +    grackle_dev = qdev_new("grackle-pcihost");
>>>       qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);
>>>       s = SYS_BUS_DEVICE(grackle_dev);
>>>       sysbus_realize_and_unref(s, &error_fatal);
>>
>> Why did you include this patch again in v2 when I nacked it in v1?
> 
> You did not nack it just said you'd prefer a header instead. As a reviwer you express 
> your opinion not an absolute decision that can't be discussed. I've replied to that 
> but could not drop this patch as it's needed for later patches to get mac.h cleaned 
> so until we agree on something this has left unchanged. I'm not a fan of one line 
> headers and splitting up files into separate directories that is harder to work with 
> and also think reorganising grackle is a separate clean up out of scope for this 
> series but OK, I'll move the TYPE define in a new header in the next version. I'll 
> wait for your reply on sysbus_mmio_map before sending a new version.

I should add this obviously also includes moving the GrackleState struct to the new 
header file at the same time, as per typical QOM practice.


ATB,

Mark.

