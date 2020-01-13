Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E811392D5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 14:59:11 +0100 (CET)
Received: from localhost ([::1]:50754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir0FK-0007qL-LM
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 08:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1ir0EQ-0007Hf-EP
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 08:58:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1ir0EP-0000uP-63
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 08:58:14 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:54242 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1ir0EL-0000ko-VR; Mon, 13 Jan 2020 08:58:10 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 15102F024933C4CF919E;
 Mon, 13 Jan 2020 21:58:03 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 13 Jan 2020
 21:57:56 +0800
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified by
 _HID
To: Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
 <20200113130802.5a961482@redhat.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <b5d91ae3-bf37-d27e-264d-ea21ef23776b@huawei.com>
Date: Mon, 13 Jan 2020 21:57:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200113130802.5a961482@redhat.com>
Content-Type: text/plain; charset="gbk"; format=flowed
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Shannon
 Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


=D4=DA 2020/1/13 20:08, Igor Mammedov =D0=B4=B5=C0:
> On Thu, 19 Dec 2019 14:47:59 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> According to ACPI spec, _ADR should be used for device which is on a
>> bus that has a standard enumeration algorithm. It does not make sense
>> to have a _ADR object for devices which already have _HID and will be
>> enumerated by OSPM.
>>
>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> Are you sure it's does not make sense?
> Have you checked commit f264d51d8, that added _ADR?

I searched in SPCR spec and ACPI spec, but didn't find such requirement=20
for serial port device description.

Hi Andrew,

Could you help to explain the reason?

Thanks,

Heyi



>
>> ---
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: qemu-arm@nongnu.org
>> Cc: qemu-devel@nongnu.org
>> ---
>>   hw/arm/virt-acpi-build.c          |   8 --------
>>   tests/data/acpi/virt/DSDT         | Bin 18449 -> 18426 bytes
>>   tests/data/acpi/virt/DSDT.memhp   | Bin 19786 -> 19763 bytes
>>   tests/data/acpi/virt/DSDT.numamem | Bin 18449 -> 18426 bytes
>>   4 files changed, 8 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 9f4c7d1889..be752c0ad8 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -78,11 +78,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const Me=
mMapEntry *uart_memmap,
>>                                AML_EXCLUSIVE, &uart_irq, 1));
>>       aml_append(dev, aml_name_decl("_CRS", crs));
>>  =20
>> -    /* The _ADR entry is used to link this device to the UART describ=
ed
>> -     * in the SPCR table, i.e. SPCR.base_address.address =3D=3D _ADR.
>> -     */
>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(uart_memmap->base))=
);
>> -
>>       aml_append(scope, dev);
>>   }
>>  =20
>> @@ -170,7 +165,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const Me=
mMapEntry *memmap,
>>       aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
>>       aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
>>       aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>       aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
>>       aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device=
")));
>>       aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>> @@ -334,7 +328,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const M=
emMapEntry *gpio_memmap,
>>   {
>>       Aml *dev =3D aml_device("GPO0");
>>       aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>  =20
>>       Aml *crs =3D aml_resource_template();
>> @@ -364,7 +357,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>>   {
>>       Aml *dev =3D aml_device(ACPI_POWER_BUTTON_DEVICE);
>>       aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
>> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>>       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>       aml_append(scope, dev);
>>   }
>> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
>> index b5895cb22446860a0b9be3d32ec856feb388be4c..a759ff739a071d5fbf5051=
9a6aea296e5e0f1e0c 100644
>> GIT binary patch
>> delta 72
>> zcmbO@f$>*ABbQ6COUN&G1_q{66S<_BT5Bh&t1wzk^tIeLL4lL8ZSqD=3DgU!!5x$Pt+
>> c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>07w882mk;8
>>
>> delta 94
>> zcmey>&p2@cBbQ6CONgKc0|V26iCof5J#`b+RhV2^Ci+-%al|{i1o1F1FmP^cRp4ao
>> tnY@hCfEg&X`7$S;oxFTNc#soEyoaX?Z-8HbfwO@#16Tu)4E1zj005fm7mWY_
>>
>> diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DS=
DT.memhp
>> index 69ad844f65d047973a3e55198beecd45a35b8fce..6e5cc61977e4cd24f765fe=
c0693f75a528c144c1 100644
>> GIT binary patch
>> delta 72
>> zcmX>#i*fTTMlP3Nmk?uL1_q|eiCof5eHSLGt1wzk^tIeLL4lL8ZSqD=3DgU!!5U7RH)
>> c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>03)CjmjD0&
>>
>> delta 94
>> zcmdlyi}BPfMlP3Nmk=3D*s1_q}3iCof5t(PXMt1!8;O!Tqj;)r*23F2X3VBp-?s=3D&$E
>> tGkF=3DO0W(l&^JPwVXL<R6@E|9Scn?n(-T=3DP<17`zg2CxPo8S3f6006qZ7#siq
>>
>> diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/=
DSDT.numamem
>> index b5895cb22446860a0b9be3d32ec856feb388be4c..a759ff739a071d5fbf5051=
9a6aea296e5e0f1e0c 100644
>> GIT binary patch
>> delta 72
>> zcmbO@f$>*ABbQ6COUN&G1_q{66S<_BT5Bh&t1wzk^tIeLL4lL8ZSqD=3DgU!!5x$Pt+
>> c1HyxxIO07#U3dfh0t}oDoEbRcLp@y>07w882mk;8
>>
>> delta 94
>> zcmey>&p2@cBbQ6CONgKc0|V26iCof5J#`b+RhV2^Ci+-%al|{i1o1F1FmP^cRp4ao
>> tnY@hCfEg&X`7$S;oxFTNc#soEyoaX?Z-8HbfwO@#16Tu)4E1zj005fm7mWY_
>>
>
> .


