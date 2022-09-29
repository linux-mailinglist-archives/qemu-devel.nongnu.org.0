Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939DA5EF5C3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:54:29 +0200 (CEST)
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odt3b-0001vR-Oj
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1odrvh-0004Je-AP; Thu, 29 Sep 2022 07:42:15 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:27233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1odrve-00015k-FK; Thu, 29 Sep 2022 07:42:12 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7648075A0FE;
 Thu, 29 Sep 2022 13:42:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3DAF8746E06; Thu, 29 Sep 2022 13:42:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3C06974633D;
 Thu, 29 Sep 2022 13:42:06 +0200 (CEST)
Date: Thu, 29 Sep 2022 13:42:06 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 10/13] hw/ppc/mac.h: Move grackle-pcihost declaration
 out from shared header
In-Reply-To: <197f737f-3ae8-6c73-7605-5bd89721dc3e@ilande.co.uk>
Message-ID: <6cb830fc-1aa8-7ac9-b4a7-a251b9d79a@eik.bme.hu>
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <2ff9b0ca151cab09512b37d855d03eee4a62812a.1664108862.git.balaton@eik.bme.hu>
 <197f737f-3ae8-6c73-7605-5bd89721dc3e@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 29 Sep 2022, Mark Cave-Ayland wrote:
> On 25/09/2022 13:38, BALATON Zoltan wrote:
>
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
>> index 1fa7b770b7..1355d032ff 100644
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
> Why did you include this patch again in v2 when I nacked it in v1?

You did not nack it just said you'd prefer a header instead. As a reviwer 
you express your opinion not an absolute decision that can't be discussed. 
I've replied to that but could not drop this patch as it's needed for 
later patches to get mac.h cleaned so until we agree on something this has 
left unchanged. I'm not a fan of one line headers and splitting up files 
into separate directories that is harder to work with and also think 
reorganising grackle is a separate clean up out of scope for this series 
but OK, I'll move the TYPE define in a new header in the next version. 
I'll wait for your reply on sysbus_mmio_map before sending a new version.

Regards,
BALATON Zoltan

