Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5F95E91E2
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:29:41 +0200 (CEST)
Received: from localhost ([::1]:38286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNxE-0005db-7b
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocNtp-0002mW-VC; Sun, 25 Sep 2022 05:26:16 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:27162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocNto-0005MB-FA; Sun, 25 Sep 2022 05:26:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 649FC746E06;
 Sun, 25 Sep 2022 11:26:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4517D746307; Sun, 25 Sep 2022 11:26:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4382874633D;
 Sun, 25 Sep 2022 11:26:06 +0200 (CEST)
Date: Sun, 25 Sep 2022 11:26:06 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 08/10] hw/ppc/mac.h: Move grackle-pcihost declaration
 out from shared header
In-Reply-To: <4e54027f-b74b-6ed0-9c5d-f655e4784630@ilande.co.uk>
Message-ID: <97f67cc7-9b4c-cce9-705b-0af5f6eb38@eik.bme.hu>
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <e10a8d11ea424aa8fa727936b2ad6c2fe439b3ad.1663368422.git.balaton@eik.bme.hu>
 <4e54027f-b74b-6ed0-9c5d-f655e4784630@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

On Sun, 25 Sep 2022, Mark Cave-Ayland wrote:
> On 17/09/2022 00:07, BALATON Zoltan wrote:
>> It is only used by mac_oldworld anyway and it already instantiates
>> a few devices by name so this allows reducing the shared header further.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/pci-host/grackle.c | 1 +
>>   hw/ppc/mac.h          | 3 ---
>>   hw/ppc/mac_oldworld.c | 2 +-
>>   3 files changed, 2 insertions(+), 4 deletions(-)
>> 
>> diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
>> index b05facf463..5282123004 100644
>> --- a/hw/pci-host/grackle.c
>> +++ b/hw/pci-host/grackle.c
>> @@ -34,6 +34,7 @@
>>   #include "trace.h"
>>   #include "qom/object.h"
>>   +#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
>>   OBJECT_DECLARE_SIMPLE_TYPE(GrackleState, GRACKLE_PCI_HOST_BRIDGE)
>>     struct GrackleState {
>> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
>> index 55cb02c990..fe77a6c6db 100644
>> --- a/hw/ppc/mac.h
>> +++ b/hw/ppc/mac.h
>> @@ -35,9 +35,6 @@
>>   #define KERNEL_LOAD_ADDR 0x01000000
>>   #define KERNEL_GAP       0x00100000
>>   -/* Grackle PCI */
>> -#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
>> -
>>   /* Mac NVRAM */
>>   #define TYPE_MACIO_NVRAM "macio-nvram"
>>   OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
>> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>> index f323a49d7a..a4094226bc 100644
>> --- a/hw/ppc/mac_oldworld.c
>> +++ b/hw/ppc/mac_oldworld.c
>> @@ -214,7 +214,7 @@ static void ppc_heathrow_init(MachineState *machine)
>>       }
>>         /* Grackle PCI host bridge */
>> -    grackle_dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
>> +    grackle_dev = qdev_new("grackle-pcihost");
>>       qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);
>>       s = SYS_BUS_DEVICE(grackle_dev);
>>       sysbus_realize_and_unref(s, &error_fatal);
>
> This is the wrong way around - we want to move towards using TYPE_ macros 
> everywhere for device instantiation instead of hardcoded strings.
>
> What's really missing here is that the QOM structs and definitions for 
> grackle.c should be moved to a new include/hw/pci-host/grackle.h file from 
> mac.h and included where necessary.

That could be done any time later, this patch is good enough for now, 
there are other devices instantiated this way in mac_oldworld now. I don't 
want to chnage grackle here, just clean up the mac.h.

Regards,
BALATON Zoltan

