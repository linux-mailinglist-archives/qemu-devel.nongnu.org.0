Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE7637FD4E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 20:35:30 +0200 (CEST)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhGBF-0000tr-0V
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 14:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@huawei.com>)
 id 1lhG9k-0007we-1k; Thu, 13 May 2021 14:33:57 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@huawei.com>)
 id 1lhG9a-0007eC-BA; Thu, 13 May 2021 14:33:51 -0400
Received: from dggeml702-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fh0Yb1bnbzWggr;
 Fri, 14 May 2021 02:29:23 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggeml702-chm.china.huawei.com (10.3.17.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 14 May 2021 02:33:40 +0800
Received: from dggpemm500011.china.huawei.com (7.185.36.110) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 02:33:40 +0800
Received: from dggpemm500011.china.huawei.com ([7.185.36.110]) by
 dggpemm500011.china.huawei.com ([7.185.36.110]) with mapi id 15.01.2176.012;
 Fri, 14 May 2021 02:33:40 +0800
From: Andrey Shinkevich <andrey.shinkevich@huawei.com>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: GICv3 for MTTCG
Thread-Topic: GICv3 for MTTCG
Thread-Index: AQHXRo49QQoDTg/5kkqOfm/tGkugzg==
Date: Thu, 13 May 2021 18:33:39 +0000
Message-ID: <a723df317143434e996a2bab47dc1d56@huawei.com>
References: <1f157423cc544731beb743287a4be5cb@huawei.com>
 <87h7j8ez4t.fsf@linaro.org> <7f8496377da246c38452d95bbbfc0ca7@huawei.com>
 <877dk2lfee.fsf@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.227.155.55]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=andrey.shinkevich@huawei.com; helo=szxga01-in.huawei.com
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>, "Cota@braap.org" <Cota@braap.org>,
 "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Chengen \(William, 
 FixNet\)" <chengen@huawei.com>, yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I built QEMU from the source files downloaded from=0A=
https://github.com/qemu/qemu=0A=
latest commit 3e9f48bcdabe57f8=0A=
I have applied the series "GICv3 LPI and ITS feature implementation".=0A=
=0A=
When I tried to start QEMU back then with the '-kernel' option, the boot =
=0A=
loader failed to locate the rootfs disk by its correct ID. Specifying =0A=
'root=3D/dev/sda2' didn't help me also.=0A=
So, I used virt-manager successfully which runs QEMU with the following =0A=
arguments:=0A=
=0A=
/usr/local/bin/qemu-system-aarch64 -name =0A=
guest=3DEulerOS-2.8-Rich,debug-threads=3Don -S -object =0A=
secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-33-=
EulerOS-2.8-Rich/master-key.aes =0A=
-machine virt-6.1,accel=3Dtcg,usb=3Doff,dump-guest-core=3Doff,gic-version=
=3D3 =0A=
-cpu max -drive =0A=
file=3D/usr/share/AAVMF/AAVMF_CODE.fd,if=3Dpflash,format=3Draw,unit=3D0,rea=
donly=3Don =0A=
-drive =0A=
file=3D/var/lib/libvirt/qemu/nvram/EulerOS-2.8-Rich_VARS.fd,if=3Dpflash,for=
mat=3Draw,unit=3D1 =0A=
-m 4096 -smp 8,sockets=3D8,cores=3D1,threads=3D1 -uuid =0A=
c95e0e92-011b-449a-8e3f-b5f0938aaaa7 -display none -no-user-config =0A=
-nodefaults -chardev socket,id=3Dcharmonitor,fd=3D26,server,nowait -mon =0A=
chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dutc -no-shutd=
own =0A=
-boot strict=3Don -device =0A=
pcie-root-port,port=3D0x8,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifunction=
=3Don,addr=3D0x1 =0A=
-device =0A=
pcie-root-port,port=3D0x9,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0,addr=3D0x1.0x=
1 =0A=
-device =0A=
pcie-root-port,port=3D0xa,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,addr=3D0x1.0x=
2 =0A=
-device =0A=
pcie-root-port,port=3D0xb,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,addr=3D0x1.0x=
3 =0A=
-device qemu-xhci,p2=3D8,p3=3D8,id=3Dusb,bus=3Dpci.2,addr=3D0x0 -device =0A=
virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.3,addr=3D0x0 -drive =0A=
file=3D/var/lib/libvirt/images/EulerOS-2.8-Rich.qcow2,format=3Dqcow2,if=3Dn=
one,id=3Ddrive-scsi0-0-0-0 =0A=
-device =0A=
scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3Ddrive-scsi0-0=
-0-0,id=3Dscsi0-0-0-0,bootindex=3D1 =0A=
-drive if=3Dnone,id=3Ddrive-scsi0-0-0-1,readonly=3Don -device =0A=
scsi-cd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D1,drive=3Ddrive-scsi0-0=
-0-1,id=3Dscsi0-0-0-1 =0A=
-netdev tap,fd=3D28,id=3Dhostnet0 -device =0A=
virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:f9:e0:69,bus=3Dpc=
i.1,addr=3D0x0 =0A=
-chardev pty,id=3Dcharserial0 -serial chardev:charserial0 -msg timestamp=3D=
on=0A=
=0A=
Best regards,=0A=
Andrey.=0A=
=0A=
=0A=
On 5/13/21 8:20 PM, Alex Benn=E9e wrote:=0A=
> =0A=
> Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:=0A=
> =0A=
>> Dear colleagues,=0A=
>>=0A=
>> Thank you all very much for your responses. Let me reply with one messag=
e.=0A=
>>=0A=
>> I configured QEMU for AARCH64 guest:=0A=
>> $ ./configure --target-list=3Daarch64-softmmu=0A=
>>=0A=
>> When I start QEMU with GICv3 on an x86 host:=0A=
>> qemu-system-aarch64 -machine virt-6.0,accel=3Dtcg,gic-version=3D3=0A=
> =0A=
> Hmm are you sure you are running your built QEMU? For me the following=0A=
> works fine:=0A=
> =0A=
>    ./aarch64-softmmu/qemu-system-aarch64 -machine virt-6.0,gic-version=3D=
3,accel=3Dtcg -cpu max -serial mon:stdio -nic user,model=3Dvirtio-net-pci,h=
ostfwd=3Dtcp::2222-:22 -device virtio-scsi-pci -device scsi-hd,drive=3Dhd0 =
-blockdev driver=3Draw,node-name=3Dhd0,discard=3Dunmap,file.driver=3Dhost_d=
evice,file.filename=3D/dev/zvol/hackpool-0/debian-buster-arm64 -kernel=0A=
> ~/lsrc/linux.git/builds/arm64.nopreempt/arch/arm64/boot/Image -append "co=
nsole=3DttyAMA0 root=3D/dev/sda2" -display none -m 8G,maxmem=3D8G -smp 12=
=0A=
> =0A=
> =0A=
>>=0A=
>> QEMU reports this error from hw/pci/msix.c:=0A=
>> error_setg(errp, "MSI-X is not supported by interrupt controller");=0A=
>>=0A=
>> Probably, the variable 'msi_nonbroken' would be initialized in=0A=
>> hw/intc/arm_gicv3_its_common.c:=0A=
>> gicv3_its_init_mmio(..)=0A=
>>=0A=
>> I guess that it works with KVM acceleration only rather than with TCG.=
=0A=
>>=0A=
>> The error persists after applying the series:=0A=
>> https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html=0A=
>> "GICv3 LPI and ITS feature implementation"=0A=
>> (special thanks for referring me to that)=0A=
>>=0A=
>> Please, make me clear and advise ideas how that error can be fixed?=0A=
>> Should the MSI-X support be implemented with GICv3 extra?=0A=
>>=0A=
>> When successful, I would like to test QEMU for a maximum number of cores=
=0A=
>> to get the best MTTCG performance.=0A=
>> Probably, we will get just some percentage of performance enhancement=0A=
>> with the BQL series applied, won't we? I will test it as well.=0A=
>>=0A=
>> Best regards,=0A=
>> Andrey Shinkevich=0A=
>>=0A=
>>=0A=
>> On 5/12/21 6:43 PM, Alex Benn=E9e wrote:=0A=
>>>=0A=
>>> Andrey Shinkevich <andrey.shinkevich@huawei.com> writes:=0A=
>>>=0A=
>>>> Dear colleagues,=0A=
>>>>=0A=
>>>> I am looking for ways to accelerate the MTTCG for ARM guest on x86-64 =
host.=0A=
>>>> The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8:=
=0A=
>>>>=0A=
>>>> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8=0A=
>>>>=0A=
>>>> The version 3 of the Generic Interrupt Controller (GICv3) is not=0A=
>>>> supported in QEMU for some reason unknown to me. It would allow to=0A=
>>>> increase the limit of CPUs and accelerate the MTTCG performance on a=
=0A=
>>>> multiple core hypervisor.=0A=
>>>=0A=
>>> It is supported, you just need to select it.=0A=
>>>=0A=
>>>> I have got an idea to implement the Interrupt Translation Service (ITS=
)=0A=
>>>> for using by MTTCG for ARM architecture.=0A=
>>>=0A=
>>> There is some work to support ITS under TCG already posted:=0A=
>>>=0A=
>>>     Subject: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation=0A=
>>>     Date: Thu, 29 Apr 2021 19:41:53 -0400=0A=
>>>     Message-Id: <20210429234201.125565-1-shashi.mallela@linaro.org>=0A=
>>>=0A=
>>> please do review and test.=0A=
>>>=0A=
>>>> Do you find that idea useful and feasible?=0A=
>>>> If yes, how much time do you estimate for such a project to complete b=
y=0A=
>>>> one developer?=0A=
>>>> If no, what are reasons for not implementing GICv3 for MTTCG in QEMU?=
=0A=
>>>=0A=
>>> As far as MTTCG performance is concerned there is a degree of=0A=
>>> diminishing returns to be expected as the synchronisation cost between=
=0A=
>>> threads will eventually outweigh the gains of additional threads.=0A=
>>>=0A=
>>> There are a number of parts that could improve this performance. The=0A=
>>> first would be picking up the BQL reduction series from your FutureWei=
=0A=
>>> colleges who worked on the problem when they were Linaro assignees:=0A=
>>>=0A=
>>>     Subject: [PATCH v2 0/7] accel/tcg: remove implied BQL from cpu_hand=
le_interrupt/exception path=0A=
>>>     Date: Wed, 19 Aug 2020 14:28:49 -0400=0A=
>>>     Message-Id: <20200819182856.4893-1-robert.foley@linaro.org>=0A=
>>>=0A=
>>> There was also a longer series moving towards per-CPU locks:=0A=
>>>=0A=
>>>     Subject: [PATCH v10 00/73] per-CPU locks=0A=
>>>     Date: Wed, 17 Jun 2020 17:01:18 -0400=0A=
>>>     Message-Id: <20200617210231.4393-1-robert.foley@linaro.org>=0A=
>>>=0A=
>>> I believe the initial measurements showed that the BQL cost started to=
=0A=
>>> edge up with GIC interactions. We did discuss approaches for this and I=
=0A=
>>> think one idea was use non-BQL locking for the GIC. You would need to=
=0A=
>>> revert:=0A=
>>>=0A=
>>>     Subject: [PATCH-for-5.2] exec: Remove MemoryRegion::global_locking =
field=0A=
>>>     Date: Thu,  6 Aug 2020 17:07:26 +0200=0A=
>>>     Message-Id: <20200806150726.962-1-philmd@redhat.com>=0A=
>>>=0A=
>>> and then implement a more fine tuned locking in the GIC emulation=0A=
>>> itself. However I think the BQL and per-CPU locks are lower hanging=0A=
>>> fruit to tackle first.=0A=
>>>=0A=
>>>>=0A=
>>>> Best regards,=0A=
>>>> Andrey Shinkevich=0A=
>>>=0A=
>>>=0A=
> =0A=
> =0A=
=0A=

