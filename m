Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28FC5EEF79
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:44:17 +0200 (CEST)
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odoDQ-0007j3-Jf
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odneI-0008Kf-Ri; Thu, 29 Sep 2022 03:08:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odneH-00032K-6n; Thu, 29 Sep 2022 03:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YDghpLhwSU0AqzWXNI3uhSvG/jlVAautYEu7T8tLD3w=; b=ebvEMFDudKuBpj+QZn/wrrFRQT
 DnYrwzcVnh4nBUL7p2nW80I0UAYw9XSlLgkHLVYJzwKXWLv+6LkK7h6tS2Jeu7iJc462HAxv8RSDT
 kizEjMA6Vo6nRGyEz2JcFCEV6DG0H16Tr96uO1nphwIE+lBg76IJWlesAIJI2ACBiUB49Z1q09RSb
 ZB85ZoVQ+BW3GVOju+SkwwffY+JpXD1gC60DZWUsiCTX9VCplvH1JeWj4YMzgh+iBo0pcs1Lkeqxp
 i9Wf7FLQbxG7bR1u6XL3Ary8MDFwi2g7C6V6JDejA2m9ikLTAoJ+E0JNzTqL9rnswj1JTsqsOrS2P
 uJ5lwVY14xxOAa2ANZkFjDBZ5sMkeHoUqBsOPhvrKRAy/stk6xcg7ZGrTq5oWRPXNoKXAgOBsu4Tl
 olIByN2klFC5qPFAhUQ3UxzxWYYZykBSM0uMQu8wMjTxxJRlI3fd+swsUMIT4praq3otWsmMaJ8kd
 sTfcI5lgZDSIsfFLkB70YlNQMay3RgWl0XsXdu6X8NQkSX7gWw4X4bgXPQN3MMNIhn/jtmhH8N+Oc
 a/n+UWW+r2jg2olYGsWfc25S/i8o1eK1euam+WYSCR88I+3GR5oEU70Y1Gw39GsS2LCmnm7CuqTnn
 /UWTgpW4XRCY0C0D+6ekmdWMByoOu0CSP6cwDKlgk=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odncV-000BZG-6N; Thu, 29 Sep 2022 08:06:11 +0100
Message-ID: <d68d4bd3-f260-7150-e077-7b3fe32abb90@ilande.co.uk>
Date: Thu, 29 Sep 2022 08:07:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <e10a8d11ea424aa8fa727936b2ad6c2fe439b3ad.1663368422.git.balaton@eik.bme.hu>
 <4e54027f-b74b-6ed0-9c5d-f655e4784630@ilande.co.uk>
 <97f67cc7-9b4c-cce9-705b-0af5f6eb38@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <97f67cc7-9b4c-cce9-705b-0af5f6eb38@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 08/10] hw/ppc/mac.h: Move grackle-pcihost declaration out
 from shared header
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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

On 25/09/2022 10:26, BALATON Zoltan wrote:

> On Sun, 25 Sep 2022, Mark Cave-Ayland wrote:
>> On 17/09/2022 00:07, BALATON Zoltan wrote:
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
>>> index f323a49d7a..a4094226bc 100644
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
>> This is the wrong way around - we want to move towards using TYPE_ macros 
>> everywhere for device instantiation instead of hardcoded strings.
>>
>> What's really missing here is that the QOM structs and definitions for grackle.c 
>> should be moved to a new include/hw/pci-host/grackle.h file from mac.h and included 
>> where necessary.
> 
> That could be done any time later, this patch is good enough for now, there are other 
> devices instantiated this way in mac_oldworld now. I don't want to chnage grackle 
> here, just clean up the mac.h.

It is a long-standing philosophy for QEMU that if outdated code is touched then there 
should be a best effort to update it to the latest coding standards. Moving the QOM 
definition to a separate header file is not too dissimilar to patch 10, so will be a 
fairly trivial change.


ATB,

Mark.

