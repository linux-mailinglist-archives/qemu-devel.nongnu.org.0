Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552F02ECE05
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:39:25 +0100 (CET)
Received: from localhost ([::1]:56878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxShQ-0002oO-ET
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxSgV-0002L3-3A
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:38:27 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:27376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kxSgR-0005LH-VV
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:38:26 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5471C7470F8;
 Thu,  7 Jan 2021 11:38:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0ED107470F7; Thu,  7 Jan 2021 11:38:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0D1937470F4;
 Thu,  7 Jan 2021 11:38:21 +0100 (CET)
Date: Thu, 7 Jan 2021 11:38:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 05/12] vt82c686: Make vt82c686b-pm an abstract base class
 and add vt8231-pm based on it
In-Reply-To: <bb288088-db7b-005d-db5a-5a41fb15f069@amsat.org>
Message-ID: <93a8537e-64c1-1a3-8eeb-2114a46458d@eik.bme.hu>
References: <cover.1609967638.git.balaton@eik.bme.hu>
 <c8fa8df147473c3ec5f3284b4a5d37fc9741e824.1609967638.git.balaton@eik.bme.hu>
 <bb288088-db7b-005d-db5a-5a41fb15f069@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1623005816-1610015901=:62010"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1623005816-1610015901=:62010
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 7 Jan 2021, Philippe Mathieu-Daudé wrote:
> Hi Zoltan,
>
> On 1/6/21 10:13 PM, BALATON Zoltan wrote:
>> The vt82c686b-pm model can be shared between VT82C686B and VT8231. The
>> only difference between the two is the device id in what we emulate so
>> make an abstract via-pm model by renaming appropriately and add types
>> for vt82c686b-pm and vt8231-pm based on it.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/isa/vt82c686.c         | 87 ++++++++++++++++++++++++++-------------
>>  include/hw/isa/vt82c686.h |  1 +
>>  2 files changed, 59 insertions(+), 29 deletions(-)
> ...
>
>> +typedef struct via_pm_init_info {
>> +    uint16_t device_id;
>> +} ViaPMInitInfo;
>> +
>>  static void via_pm_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> +    ViaPMInitInfo *info = data;
>>
>> -    k->realize = vt82c686b_pm_realize;
>> +    k->realize = via_pm_realize;
>>      k->config_write = pm_write_config;
>>      k->vendor_id = PCI_VENDOR_ID_VIA;
>> -    k->device_id = PCI_DEVICE_ID_VIA_ACPI;
>> +    k->device_id = info->device_id;
>>      k->class_id = PCI_CLASS_BRIDGE_OTHER;
>>      k->revision = 0x40;
>> -    dc->reset = vt82c686b_pm_reset;
>> -    dc->desc = "PM";
>> +    dc->reset = via_pm_reset;
>
>> +    /* Reason: part of VIA south bridge, does not exist stand alone */
>> +    dc->user_creatable = false;
>>      dc->vmsd = &vmstate_acpi;
>> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>
> Please do this change in a previous patch.

OK, done.

>>  }
>>
>>  static const TypeInfo via_pm_info = {
>> -    .name          = TYPE_VT82C686B_PM,
>> +    .name          = TYPE_VIA_PM,
>>      .parent        = TYPE_PCI_DEVICE,
>> -    .instance_size = sizeof(VT686PMState),
>> -    .class_init    = via_pm_class_init,
>> +    .instance_size = sizeof(ViaPMState),
>> +    .abstract      = true,
>>      .interfaces = (InterfaceInfo[]) {
>>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>>          { },
>>      },
>>  };
>>
>> +static const ViaPMInitInfo vt82c686b_pm_init_info = {
>> +    .device_id = PCI_DEVICE_ID_VIA_ACPI,
>> +};
>> +
>> +static const TypeInfo vt82c686b_pm_info = {
>> +    .name          = TYPE_VT82C686B_PM,
>> +    .parent        = TYPE_VIA_PM,
>> +    .class_init    = via_pm_class_init,
>> +    .class_data    = (void *)&vt82c686b_pm_init_info,
>
> Igor said new code should avoid using .class_data:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg678305.html
> Can you convert to "leaf class"? Then this patch is good to go.

That says for machines it is not advised (and Igor generally prefers init 
funcs everywhere) but this is a device model. Is it still not allowed to 
use class_data here? I think this is shorter this way than with an init 
function but I may try to convert if absolutely necessary.

Regards,
BALATON Zoltan

> A trivial example of conversion is commit f0eeb4b6154
> ("hw/arm/raspi: Avoid using TypeInfo::class_data pointer").
>
>> +};
>> +
>> +static const ViaPMInitInfo vt8231_pm_init_info = {
>> +    .device_id = 0x8235,
>> +};
>> +
>> +static const TypeInfo vt8231_pm_info = {
>> +    .name          = TYPE_VT8231_PM,
>> +    .parent        = TYPE_VIA_PM,
>> +    .class_init    = via_pm_class_init,
>> +    .class_data    = (void *)&vt8231_pm_init_info,
>> +};
>>
>>
>
>
--3866299591-1623005816-1610015901=:62010--

