Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFED388053
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:10:38 +0200 (CEST)
Received: from localhost ([::1]:38182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj56z-0005Id-GE
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1lj4nx-0002M6-WF; Tue, 18 May 2021 14:50:58 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:4563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1lj4nv-0007DJ-Mq; Tue, 18 May 2021 14:50:57 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fl4lQ11xnzmWcC;
 Wed, 19 May 2021 02:48:34 +0800 (CST)
Received: from dggemm751-chm.china.huawei.com (10.1.198.57) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 02:50:49 +0800
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 dggemm751-chm.china.huawei.com (10.1.198.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 02:50:48 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.2176.012; 
 Tue, 18 May 2021 19:50:46 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Subject: RE: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu members
Thread-Topic: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu
 members
Thread-Index: AQHXSj7Bs+01wvGUNEWbtmBiG2lmC6rn8VxQgACpzgCAADVmEP///x2AgADF7hA=
Date: Tue, 18 May 2021 18:50:46 +0000
Message-ID: <0ff033fa8eac400fade06e6be0a98847@huawei.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-5-wangyanan55@huawei.com>
 <6c8f9c3502384f648f30c7381e87dda9@huawei.com>
 <68883a1b-5303-da13-a051-e909e1d1f71b@huawei.com>
 <6d8b9142e8a34d1390f2f0b4bfb53a00@huawei.com>
 <20210518075027.wjpdjvoam7dlzign@gator.home>
In-Reply-To: <20210518075027.wjpdjvoam7dlzign@gator.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.29.209]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=salil.mehta@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Song Bao Hua \(Barry Song\)" <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 yangyicong <yangyicong@huawei.com>, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, Paolo
 Bonzini <pbonzini@redhat.com>, yuzenghui <yuzenghui@huawei.com>, Igor
 Mammedov <imammedo@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Andrew Jones [mailto:drjones@redhat.com]
> Sent: Tuesday, May 18, 2021 8:50 AM
>=20
> On Tue, May 18, 2021 at 07:04:51AM +0000, Salil Mehta wrote:
> > > From: wangyanan (Y)
> > > Sent: Tuesday, May 18, 2021 5:43 AM
> > >
> > > Hi Salil,
> > >
> > > On 2021/5/18 4:48, Salil Mehta wrote:
> > > >> From: Qemu-arm
> > > [mailto:qemu-arm-bounces+salil.mehta=3Dhuawei.com@nongnu.org]
> > > >> On Behalf Of Yanan Wang
> > > >> Sent: Sunday, May 16, 2021 11:29 AM
> > > >> To: Peter Maydell <peter.maydell@linaro.org>; Andrew Jones
> > > >> <drjones@redhat.com>; Michael S . Tsirkin <mst@redhat.com>; Igor M=
ammedov
> > > >> <imammedo@redhat.com>; Shannon Zhao <shannon.zhaosl@gmail.com>; Al=
istair
> > > >> Francis <alistair.francis@wdc.com>; David Gibson
> > > >> <david@gibson.dropbear.id.au>; qemu-devel@nongnu.org;
> qemu-arm@nongnu.org
> > > >> Cc: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; zhukeq=
ian
> > > >> <zhukeqian1@huawei.com>; yangyicong <yangyicong@huawei.com>; Zengt=
ao (B)
> > > >> <prime.zeng@hisilicon.com>; Wanghaibin (D)
> <wanghaibin.wang@huawei.com>;
> > > >> yuzenghui <yuzenghui@huawei.com>; Paolo Bonzini <pbonzini@redhat.c=
om>;
> > > >> Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > >> Subject: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cp=
u members
> > > >>
> > > >> We create and initialize a cpuobj for each present cpu in
> > > >> machvirt_init(). Now we also initialize the cpu member of
> > > >> structure CPUArchId for each present cpu in the function.
> > > > [...]
> > > >
> > > >>           qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> > > >> +
> > > >> +        /*
> > > >> +         * As ARM cpu hotplug is not supported yet, we initialize
> > > >> +         * the present cpu members here.
> > > >> +         */
> > > >> +        machine->possible_cpus->cpus[n].cpu =3D cpuobj;
> > > >
> > > > when vcpu Hotplug is not supported yet, what necessitates this chan=
ge now?
> > > >
> > > The initialization will gives a way to determine whether a CPU is
> > > present or not.
> > > At least, for now it will be used when generating ACPI tables, e.g.
> > > DSDT, MADT.
> > > See patch 5 and 6.
> >
> > yes,  but why do you require it now as part of the vcpu topology change=
?
> >
> > As-far-as-i-can-see, PPTT table changes(part of patch 5/9) do not requi=
re
> > this change. Change in Patch 5/9 has also been done in anticipation of
> > some future requirement(vcpu Hotplug?).
> >
> > Please correct me here if I am wrong?
> >
>=20
> Hi Salil,
>=20
> The problem is that we've never required smp.cpus =3D=3D smp.maxcpus, so
> a user could have smp.cpus < smp.maxcpus. We want the topology to match
> maxcpus, but only enable cpus. However, if you think we should just not
> allow cpus < maxcpus until hot plug is sorted out, then we could discuss
> a way of trying to enforce cpus =3D=3D maxcpus, but I'm not sure how we c=
an
> without breaking existing command lines.


Hi Andrew,
Ideally, if the vcpu Hotplug is not supported the check in the smp_parse()
should impose (cpus =3D=3D maxcpus). This as of now is just a warning of in=
valid
configuration I think. Beside this does not breaks any prior usages which y=
ou
suggested might happen?

Again, this is not a blocking issue from my side but just a humble suggesti=
on.
You might want to take a call on this :)


Thanks
Salil.

