Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BC02E31ED
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 17:54:55 +0100 (CET)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktZJm-0002RK-VY
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 11:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktZHe-0001Q7-N0
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:52:44 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktZHa-0007B4-UR
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:52:42 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A76EC7470E6;
 Sun, 27 Dec 2020 17:52:36 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 759D27470E3; Sun, 27 Dec 2020 17:52:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 73E287470DB;
 Sun, 27 Dec 2020 17:52:36 +0100 (CET)
Date: Sun, 27 Dec 2020 17:52:36 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 07/12] vt82c686: Remove vt82c686b_isa_init() function
In-Reply-To: <2ba49ba3-c202-c498-0284-991e87f78fda@amsat.org>
Message-ID: <dd9dfa8-a3cb-2d90-dad3-c74a035fee8@eik.bme.hu>
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <9258083b42c06413f79cbe9340731345948db5b5.1609031406.git.balaton@eik.bme.hu>
 <2ba49ba3-c202-c498-0284-991e87f78fda@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1253815910-1609087956=:84491"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1253815910-1609087956=:84491
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 27 Dec 2020, Philippe Mathieu-Daudé wrote:
> On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
>> Also rename VT82C686B type to lower case to match other device names.
>
> If possible do not split the commit description in 2 (one part in
> subject and the other part here) as this is annoying to read.

Not so much in the commit log but maybe indeed on the list in email. I did 
not want to repeat subject in the description but can if you prefer.

Thanks for reviewing these, I'll wait a few days to see if there are any 
other comments then will send v2 with suggested changes.

Regards,
BALATON Zoltan

>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/isa/vt82c686.c         | 9 ---------
>>  hw/mips/fuloong2e.c       | 4 +++-
>>  include/hw/isa/vt82c686.h | 3 +--
>>  3 files changed, 4 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index 758c54172b..1c1239cade 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -49,7 +49,6 @@ struct VT82C686BState {
>>      SuperIOConfig superio_conf;
>>  };
>>
>> -#define TYPE_VT82C686B "VT82C686B"
>>  OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B)
>>
>>  static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
>> @@ -367,14 +366,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>>                                  &vt82c->superio);
>>  }
>>
>> -ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)
>> -{
>> -    PCIDevice *d;
>> -
>> -    d = pci_create_simple_multifunction(bus, devfn, true, TYPE_VT82C686B);
>> -    return ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
>> -}
>> -
>>  static void via_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
>> index 3b0489f781..60d2020033 100644
>> --- a/hw/mips/fuloong2e.c
>> +++ b/hw/mips/fuloong2e.c
>> @@ -240,7 +240,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
>>      ISABus *isa_bus;
>>      PCIDevice *dev;
>>
>> -    isa_bus = vt82c686b_isa_init(pci_bus, PCI_DEVFN(slot, 0));
>> +    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
>> +                                          TYPE_VT82C686B);
>
> Good cleanup.
>
> Preferably using TYPE_VT82C686B_ISA:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
>> +    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
>>      assert(isa_bus);
>>      *p_isa_bus = isa_bus;
>>      /* Interrupt controller */
>> diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
>> index ff80a926dc..89e205a1be 100644
>> --- a/include/hw/isa/vt82c686.h
>> +++ b/include/hw/isa/vt82c686.h
>> @@ -1,13 +1,12 @@
>>  #ifndef HW_VT82C686_H
>>  #define HW_VT82C686_H
>>
>> -
>> +#define TYPE_VT82C686B "vt82c686b"
>>  #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
>>  #define TYPE_VIA_AC97 "via-ac97"
>>  #define TYPE_VIA_MC97 "via-mc97"
>>
>>  /* vt82c686.c */
>> -ISABus *vt82c686b_isa_init(PCIBus * bus, int devfn);
>>  I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
>>                            qemu_irq sci_irq);
>>
>>
>
>
--3866299591-1253815910-1609087956=:84491--

