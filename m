Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D81407BF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 11:18:33 +0100 (CET)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isOi0-0004Cq-7K
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 05:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54051)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1isOgl-0003aF-3s
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:17:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1isOgk-00048M-0r
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:17:15 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:49332 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1isOgd-00040U-5o; Fri, 17 Jan 2020 05:17:07 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0F497E896FAF0E365F54;
 Fri, 17 Jan 2020 18:17:02 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Fri, 17 Jan 2020
 18:16:53 +0800
Subject: Re: [PATCH v22 9/9] MAINTAINERS: Add ACPI/HEST/GHES entries
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
 <1578483143-14905-10-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-mLgD8rQ211ep44nd8oxTKSnxc7YmY+nPtADpKZk5asA@mail.gmail.com>
 <1c45a8b4-1ea4-ddfd-cce3-c42699d2b3b9@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <d502bd34-79e4-45f8-e1b7-54265623db15@huawei.com>
Date: Fri, 17 Jan 2020 18:16:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1c45a8b4-1ea4-ddfd-cce3-c42699d2b3b9@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
X-Originating-IP: [10.142.68.147]
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/1/17 15:22, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Peter,
>=20
> On 1/16/20 5:46 PM, Peter Maydell wrote:
>> On Wed, 8 Jan 2020 at 11:32, Dongjiu Geng <gengdongjiu@huawei.com> wro=
te:
>>>
>>> I and Xiang are willing to review the APEI-related patches and
>>> volunteer as the reviewers for the HEST/GHES part.
>>>
>>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>>> ---
>>> =C2=A0 MAINTAINERS | 9 +++++++++
>>> =C2=A0 1 file changed, 9 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 387879a..5af70a5 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1423,6 +1423,15 @@ F: tests/bios-tables-test.c
>>> =C2=A0 F: tests/acpi-utils.[hc]
>>> =C2=A0 F: tests/data/acpi/
>>>
>>> +ACPI/HEST/GHES
>>> +R: Dongjiu Geng <gengdongjiu@huawei.com>
>>> +R: Xiang Zheng <zhengxiang9@huawei.com>
>>> +L: qemu-arm@nongnu.org
>>> +S: Maintained
>>> +F: hw/acpi/ghes.c
>>> +F: include/hw/acpi/ghes.h
>>> +F: docs/specs/acpi_hest_ghes.rst
>>> +
>>> =C2=A0 ppc4xx
>>> =C2=A0 M: David Gibson <david@gibson.dropbear.id.au>
>>> =C2=A0 L: qemu-ppc@nongnu.org
>>> --=20
>>
>> Michael, Igor: since this new MAINTAINERS section is
>> moving files out of the 'ACPI/SMBIOS' section that you're
>> currently responsible for, do you want to provide an
>> acked-by: that you think this division of files makes sense?
>=20
> The files are not 'moved out', Michael and Igor are still the maintaine=
rs of the supported ACPI/SMBIOS subsystem:
>=20
> ACPI/SMBIOS
> M: Michael S. Tsirkin <mst@redhat.com>
> M: Igor Mammedov <imammedo@redhat.com>
> S: Supported
> F: include/hw/acpi/*
> F: hw/acpi/*
>=20
> Dongjiu and Xiang only add themselves as reviewers to get notified on c=
hanges on these specific files. The more eyes the better :)
>=20
> The docs/specs/acpi_hest_ghes.rst document has no maintainer, as these =
others too:
If this file has no maintainer, may be it needs a M tag for this file, ot=
herwise when people change this file, and use "./scripts/get_maintainer.p=
l xxxxx" to get maintainer, it will be empty.

>=20
> - docs/specs/acpi_cpu_hotplug.txt
> - docs/specs/acpi_hw_reduced_hotplug.rst
> - docs/specs/acpi_mem_hotplug.txt
> - docs/specs/acpi_nvdimm.txt
>=20
> The only ACPI file reported as maintained in docs/specs/ is acpi_pci_ho=
tplug.txt, from this entry:
>=20
> PCI
> M: Michael S. Tsirkin <mst@redhat.com>
> M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> S: Supported
> F: docs/specs/*pci*
>=20
> FWIW:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> .
>=20


