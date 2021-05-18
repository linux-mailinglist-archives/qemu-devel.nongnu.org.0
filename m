Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5530238807B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:24:34 +0200 (CEST)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5KT-0004d5-DY
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1lj5Ip-00030m-Va; Tue, 18 May 2021 15:22:51 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1lj5In-00017k-E5; Tue, 18 May 2021 15:22:51 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fl5Qn3bLkzqV7X;
 Wed, 19 May 2021 03:19:13 +0800 (CST)
Received: from dggema714-chm.china.huawei.com (10.3.20.78) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 03:22:42 +0800
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 dggema714-chm.china.huawei.com (10.3.20.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 19 May 2021 03:22:41 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.2176.012; 
 Tue, 18 May 2021 20:22:39 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Subject: RE: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Thread-Topic: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Thread-Index: AQHXMDzb5q8WzYljr0ilpO+8Rxsx7Krg+0EAgAgNE7D///kagIAAE+FggACrCICAABT0MA==
Date: Tue, 18 May 2021 19:22:39 +0000
Message-ID: <b61a7413f98a430685b838eecc2db74f@huawei.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
 <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
In-Reply-To: <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.29.209]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=salil.mehta@huawei.com; helo=szxga04-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor
 Mammedov <imammedo@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong <yangyicong@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>, "lijiajie
 \(H\)" <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Andrew Jones [mailto:drjones@redhat.com]
> Sent: Tuesday, May 18, 2021 8:06 PM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: wangyanan (Y) <wangyanan55@huawei.com>; Peter Maydell
> <peter.maydell@linaro.org>; Michael S . Tsirkin <mst@redhat.com>; Wanghai=
bin
> (D) <wanghaibin.wang@huawei.com>; qemu-devel@nongnu.org; Shannon Zhao
> <shannon.zhaosl@gmail.com>; qemu-arm@nongnu.org; Alistair Francis
> <alistair.francis@wdc.com>; Zengtao (B) <prime.zeng@hisilicon.com>;
> yangyicong <yangyicong@huawei.com>; yuzenghui <yuzenghui@huawei.com>; Igo=
r
> Mammedov <imammedo@redhat.com>; zhukeqian <zhukeqian1@huawei.com>; lijiaj=
ie (H)
> <lijiajie11@huawei.com>; David Gibson <david@gibson.dropbear.id.au>; Linu=
xarm
> <linuxarm@huawei.com>; linuxarm@openeuler.org
> Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
>=20
> On Tue, May 18, 2021 at 06:34:08PM +0000, Salil Mehta wrote:
> >  Those benefits, when vcpu pinning is used, are the same benefits
> > > as for the host, which already use PPTT tables to describe topology, =
even
> > > though hot plug isn't supported.
> >
> > yes sure, you mean pinning vcpus according to the cpu topology for perf=
ormance?
>=20
> Yup

Already Agreed :)

> > > Now, if you're saying we should only generate tables for smp.cpus, no=
t
> >
> > Correct. This is what I thought we must be doing even now
> >
> > > smp.maxcpus, because hot plug isn't supported anyway, then I see your
> > > point. But, it'd be better to require smp.cpus =3D=3D smp.maxcpus in =
our
> > > smp_parse function to do that, which we've never done before, so we m=
ay
> > > have trouble supporting existing command lines.
> >
> > I am trying to recall, if the vcpu Hotplug is not supported then can th=
ey
> > ever be different?
> >
> > cpus =3D  (threads * cores * sockets)
> >
> > static void smp_parse(MachineState *ms, QemuOpts *opts)
> > {
> >      [...]
> >
> >         if (sockets * cores * threads !=3D ms->smp.max_cpus) {
> >             warn_report("Invalid CPU topology deprecated: "
> >                         "sockets (%u) * cores (%u) * threads (%u) "
> >                         "!=3D maxcpus (%u)",
> >                         sockets, cores, threads,
> >                         ms->smp.max_cpus);
> >         }
> >      [...]
> > }
> >
> > Although, above check does not exit(1) and just warns on detecting inva=
lid
> > CPU topology. Not sure why?
>=20
> Hmm, not sure what code you have there. I see this in
> hw/core/machine.c:smp_parse
>=20
>         if (ms->smp.max_cpus < cpus) {
>             error_report("maxcpus must be equal to or greater than smp");
>             exit(1);
>         }
>=20
>         if (sockets * cores * threads !=3D ms->smp.max_cpus) {
>             error_report("Invalid CPU topology: "
>                          "sockets (%u) * cores (%u) * threads (%u) "
>                          "!=3D maxcpus (%u)",
>                          sockets, cores, threads,
>                          ms->smp.max_cpus);
>             exit(1);
>         }
>=20
> >
> > Well if you think there are subtleties to support above implementation =
and
> > we cannot do it now then sure it is your call. :)
>=20
> The problem is that -smp 4,maxcpus=3D8 doesn't error out today, even thou=
gh
> it doesn't do anything. OTOH, -smp 4,cores=3D2 doesn't error out either, =
but
> we're proposing that it should. Maybe we can start erroring out when
> cpus !=3D maxcpus until hot plug is supported?

Agreed, both don't make any sense if hotplug is not supported and ideally s=
hould
fail with error. We should block any such topology configuration.


Thanks
Salil

