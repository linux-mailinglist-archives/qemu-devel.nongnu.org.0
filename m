Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF91B19A7C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 11:17:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP1ek-0003ku-RM
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 05:17:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hP1d8-0002y5-If
	for qemu-devel@nongnu.org; Fri, 10 May 2019 05:15:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hP1d6-0008LI-C9
	for qemu-devel@nongnu.org; Fri, 10 May 2019 05:15:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40236)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hP1d0-0008Gc-2E; Fri, 10 May 2019 05:15:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27CB730832CF;
	Fri, 10 May 2019 09:15:39 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6369960FE6;
	Fri, 10 May 2019 09:15:35 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Laszlo Ersek <lersek@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <5FC3163CFD30C246ABAA99954A238FA83F1B6A66@lhreml524-mbs.china.huawei.com>
	<ca5f7231-6924-0720-73a5-766eb13ee331@arm.com>
	<190831a5-297d-addb-ea56-645afb169efb@redhat.com>
	<20190509183520.6dc47f2e@Igors-MacBook-Pro>
	<cd2aa867-5367-b470-0a2b-33897697c23f@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83F1DDFE5@lhreml524-mbs.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <499f2bc5-da85-72b2-4f7b-32f2d25d842b@redhat.com>
Date: Fri, 10 May 2019 11:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA83F1DDFE5@lhreml524-mbs.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 10 May 2019 09:15:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Question] Memory hotplug clarification for Qemu
 ARM/virt
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>, linux-mm <linux-mm@kvack.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Robin Murphy <robin.murphy@arm.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Shameer,

On 5/10/19 10:34 AM, Shameerali Kolothum Thodi wrote:
>=20
>=20
>> -----Original Message-----
>> From: Laszlo Ersek [mailto:lersek@redhat.com]
>> Sent: 09 May 2019 22:48
>> To: Igor Mammedov <imammedo@redhat.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>; Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; will.deacon@arm.com; Catalin
>> Marinas <Catalin.Marinas@arm.com>; Anshuman Khandual
>> <anshuman.khandual@arm.com>; linux-arm-kernel@lists.infradead.org;
>> linux-mm <linux-mm@kvack.org>; qemu-devel@nongnu.org;
>> qemu-arm@nongnu.org; eric.auger@redhat.com; peter.maydell@linaro.org;
>> Linuxarm <linuxarm@huawei.com>; ard.biesheuvel@linaro.org; Jonathan
>> Cameron <jonathan.cameron@huawei.com>; xuwei (O) <xuwei5@huawei.com>
>> Subject: Re: [Question] Memory hotplug clarification for Qemu ARM/virt
>>
>> On 05/09/19 18:35, Igor Mammedov wrote:
>>> On Wed, 8 May 2019 22:26:12 +0200
>>> Laszlo Ersek <lersek@redhat.com> wrote:
>>>
>>>> On 05/08/19 14:50, Robin Murphy wrote:
>>>>> Hi Shameer,
>>>>>
>>>>> On 08/05/2019 11:15, Shameerali Kolothum Thodi wrote:
>>>>>> Hi,
>>>>>>
>>>>>> This series here[0] attempts to add support for PCDIMM in QEMU for
>>>>>> ARM/Virt platform and has stumbled upon an issue as it is not clea=
r(at
>>>>>> least
>>>>>> from Qemu/EDK2 point of view) how in physical world the hotpluggab=
le
>>>>>> memory is handled by kernel.
>>>>>>
>>>>>> The proposed implementation in Qemu, builds the SRAT and DSDT part=
s
>>>>>> and uses GED device to trigger the hotplug. This works fine.
>>>>>>
>>>>>> But when we added the DT node corresponding to the PCDIMM(cold plu=
g
>>>>>> scenario), we noticed that Guest kernel see this memory during ear=
ly
>> boot
>>>>>> even if we are booting with ACPI. Because of this, hotpluggable me=
mory
>>>>>> may end up in zone normal and make it non-hot-un-pluggable even if
>> Guest
>>>>>> boots with ACPI.
>>>>>>
>>>>>> Further discussions[1] revealed that, EDK2 UEFI has no means to
>>>>>> interpret the
>>>>>> ACPI content from Qemu(this is designed to do so) and uses DT info=
 to
>>>>>> build the GetMemoryMap(). To solve this, introduced "hotpluggable"
>>>>>> property
>>>>>> to DT memory node(patches #7 & #8 from [0]) so that UEFI can
>>>>>> differentiate
>>>>>> the nodes and exclude the hotpluggable ones from GetMemoryMap().
>>>>>>
>>>>>> But then Laszlo rightly pointed out that in order to accommodate t=
he
>>>>>> changes
>>>>>> into UEFI we need to know how exactly Linux expects/handles all th=
e
>>>>>> hotpluggable memory scenarios. Please find the discussion here[2].
>>>>>>
>>>>>> For ease, I am just copying the relevant comment from Laszlo below=
,
>>>>>>
>>>>>> /******
>>>>>> "Given patches #7 and #8, as I understand them, the firmware canno=
t
>>>>>> distinguish
>>>>>> =C2=A0 hotpluggable & present, from hotpluggable & absent. The fir=
mware
>> can
>>>>>> only
>>>>>> =C2=A0 skip both hotpluggable cases. That's fine in that the firmw=
are will
>>>>>> hog neither
>>>>>> =C2=A0 type -- but is that OK for the OS as well, for both ACPI bo=
ot and DT
>>>>>> boot?
>>>>>>
>>>>>> Consider in particular the "hotpluggable & present, ACPI boot" cas=
e.
>>>>>> Assuming
>>>>>> we modify the firmware to skip "hotpluggable" altogether, the UEFI
>> memmap
>>>>>> will not include the range despite it being present at boot.
>>>>>> Presumably, ACPI
>>>>>> will refer to the range somehow, however. Will that not confuse th=
e OS?
>>>>>>
>>>>>> When Igor raised this earlier, I suggested that
>>>>>> hotpluggable-and-present should
>>>>>> be added by the firmware, but also allocated immediately, as
>>>>>> EfiBootServicesData
>>>>>> type memory. This will prevent other drivers in the firmware from
>>>>>> allocating AcpiNVS
>>>>>> or Reserved chunks from the same memory range, the UEFI memmap wil=
l
>>>>>> contain
>>>>>> the range as EfiBootServicesData, and then the OS can release that
>>>>>> allocation in
>>>>>> one go early during boot.
>>>>>>
>>>>>> But this really has to be clarified from the Linux kernel's
>>>>>> expectations. Please
>>>>>> formalize all of the following cases:
>>>>>>
>>>>>> OS boot (DT/ACPI)=C2=A0 hotpluggable & ...=C2=A0 GetMemoryMap() sh=
ould report
>>>>>> as=C2=A0 DT/ACPI should report as
>>>>>> -----------------=C2=A0 ------------------
>>>>>> -------------------------------=C2=A0 ------------------------
>>>>>>
>> DT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 present=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ?
>>>>>>
>> DT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 absent=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ?
>>>>>>
>> ACPI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 present=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ?
>>>>>>
>> ACPI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 absent=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ?
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ?
>>>>>>
>>>>>> Again, this table is dictated by Linux."
>>>>>>
>>>>>> ******/
>>>>>>
>>>>>> Could you please take a look at this and let us know what is expec=
ted
>>>>>> here from
>>>>>> a Linux kernel view point.
>>>>>
>>>>> For arm64, so far we've not even been considering DT-based hotplug =
- as
>>>>> far as I'm aware there would still be a big open question there aro=
und
>>>>> notification mechanisms and how to describe them. The DT stuff so f=
ar
>>>>> has come from the PowerPC folks, so it's probably worth seeing what
>>>>> their ideas are.
>>>>>
>>>>> ACPI-wise I've always assumed/hoped that hotplug-related things sho=
uld
>>>>> be sufficiently well-specified in UEFI that "do whatever x86/IA-64 =
do"
>>>>> would be enough for us.
>>>>
>>>> As far as I can see in UEFI v2.8 -- and I had checked the spec befor=
e
>>>> dumping the table with the many question marks on Shameer --, all th=
e
>>>> hot-plug language in the spec refers to USB and PCI hot-plug in the
>>>> preboot environment. There is not a single word about hot-plug at OS
>>>> runtime (regarding any device or component type), nor about memory
>>>> hot-plug (at any time).
>>>>
>>>> Looking to x86 appears valid -- so what does the Linux kernel expect=
 on
>>>> that architecture, in the "ACPI" rows of the table?
>>>
>>> I could only answer from QEMU x86 perspective.
>>> QEMU for x86 guests currently doesn't add hot-pluggable RAM into E820
>>> because of different linux guests tend to cannibalize it, making it n=
on
>>> unpluggable. The last culprit I recall was KASLR.
>>>
>>> So I'd refrain from reporting hotpluggable RAM in GetMemoryMap() if
>>> it's possible (it's probably hack (spec deosn't say anything about it=
)
>>> but it mostly works for Linux (plug/unplug) and Windows guest also
>>> fine with plug part (no unplug there)).
>>
>> I can accept this as a perfectly valid design. Which would mean, QEMU =
should
>> mark each hotpluggable RAM range in the DTB for the firmware with the
>> special new property, regardless of its initial ("cold") plugged-ness,=
 and then
>> the firmware will not expose the range in the GCD memory space map, an=
d
>> consequently in the UEFI memmap either.
>>
>> IOW, our table is, thus far:
>>
>> OS boot (DT/ACPI)  hotpluggable & ...  GetMemoryMap() should report as
>> DT/ACPI should report as
>> -----------------  ------------------  -------------------------------=
  ------------------------
>> DT                 present
>> ABSENT                           ?
>> DT                 absent
>> ABSENT                           ?
>> ACPI               present             ABSENT
>> PRESENT
>> ACPI               absent              ABSENT
>> ABSENT
>> In the firmware, I only need to care about the GetMemoryMap() column, =
so I
>> can work with this.
>=20
> Thank you all for the inputs.
>=20
> I assume we will still report the DT cold plug case to kernel(hotplugga=
ble & present).
> so the table will be something like this,
>=20
> OS boot (DT/ACPI)  hotpluggable & ...  GetMemoryMap() should report as =
 DT/ACPI should report as
> -----------------  ------------------  ------------------------------- =
 ------------------------
> DT                 present             ABSENT                          =
 PRESENT
> DT                 absent              ABSENT                          =
 ABSENT
With DT boot, how does the OS get to know if thehotpluggable memory is
present or absent? Or maybe I misunderstand the last column.

Thanks

Eric
> ACPI               present             ABSENT                          =
 PRESENT
> ACPI               absent              ABSENT                          =
 ABSENT=20
>=20
>=20
>  Can someone please file a feature request at
>> <https://bugzilla.tianocore.org/>, for the ArmVirtPkg Package, with th=
ese
>> detais?
>=20
> Ok. I will do that.
>=20
> Thanks,
> Shameer
>=20
>> Thanks
>> Laszlo
>>
>>>
>>> As for physical systems, there are out there ones that do report
>>> hotpluggable RAM in GetMemoryMap().
>>>
>>>> Shameer: if you (Huawei) are represented on the USWG / ASWG, I sugge=
st
>>>> re-raising the question on those lists too; at least the "ACPI" rows=
 of
>>>> the table.
>>>>
>>>> Thanks!
>>>> Laszlo
>>>>
>>>>>
>>>>> Robin.
>>>>>
>>>>>> (Hi Laszlo/Igor/Eric, please feel free to add/change if I have mis=
sed
>>>>>> any valid
>>>>>> points above).
>>>>>>
>>>>>> Thanks,
>>>>>> Shameer
>>>>>> [0] https://patchwork.kernel.org/cover/10890919/
>>>>>> [1] https://patchwork.kernel.org/patch/10863299/
>>>>>> [2] https://patchwork.kernel.org/patch/10890937/
>>>>>>
>>>>>>
>>>>
>>>
>=20

