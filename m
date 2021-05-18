Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05454387FB6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:37:42 +0200 (CEST)
Received: from localhost ([::1]:57356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4b3-0000Vy-6t
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1lj4Y8-0007WM-82; Tue, 18 May 2021 14:34:36 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:3614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1lj4Y4-0006Js-Gz; Tue, 18 May 2021 14:34:35 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Fl4Mf00WhzCsJb;
 Wed, 19 May 2021 02:31:25 +0800 (CST)
Received: from dggema771-chm.china.huawei.com (10.1.198.213) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 02:34:11 +0800
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 dggema771-chm.china.huawei.com (10.1.198.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 19 May 2021 02:34:10 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.2176.012; 
 Tue, 18 May 2021 19:34:08 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Subject: RE: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Thread-Topic: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Thread-Index: AQHXMDzb5q8WzYljr0ilpO+8Rxsx7Krg+0EAgAgNE7D///kagIAAE+Fg
Date: Tue, 18 May 2021 18:34:08 +0000
Message-ID: <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
In-Reply-To: <20210518074221.umezsdedzyzmcbsk@gator.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.29.209]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=salil.mehta@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
> Sent: Tuesday, May 18, 2021 8:42 AM
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
> On Tue, May 18, 2021 at 07:17:56AM +0000, Salil Mehta wrote:
> > > From: Qemu-arm
> [mailto:qemu-arm-bounces+salil.mehta=3Dhuawei.com@nongnu.org]
> > > On Behalf Of wangyanan (Y)
> > > Sent: Thursday, May 13, 2021 6:10 AM
> > >
> > > Hi Drew,
> > >
> > > I got a question below, and hope your reply. Thanks!
> > > On 2021/4/13 16:07, Yanan Wang wrote:
> > > > Add the Processor Properties Topology Table (PPTT) to present
> > > > CPU topology information to ACPI guests. Note, while a DT boot
> > > > Linux guest with a non-flat CPU topology will see socket and
> > > > core IDs being sequential integers starting from zero, e.g.
> > > > with -smp 4,sockets=3D2,cores=3D2,threads=3D1
> > > >
> > > > a DT boot produces
> > > >
> > > >   cpu:  0 package_id:  0 core_id:  0
> > > >   cpu:  1 package_id:  0 core_id:  1
> > > >   cpu:  2 package_id:  1 core_id:  0
> > > >   cpu:  3 package_id:  1 core_id:  1
> > > >
> > > > an ACPI boot produces
> > > >
> > > >   cpu:  0 package_id: 36 core_id:  0
> > > >   cpu:  1 package_id: 36 core_id:  1
> > > >   cpu:  2 package_id: 96 core_id:  2
> > > >   cpu:  3 package_id: 96 core_id:  3
> > > >
> > > > This is due to several reasons:
> > > >
> > > >   1) DT cpu nodes do not have an equivalent field to what the PPTT
> > > >      ACPI Processor ID must be, i.e. something equal to the MADT CP=
U
> > > >      UID or equal to the UID of an ACPI processor container. In bot=
h
> > > >      ACPI cases those are platform dependant IDs assigned by the
> > > >      vendor.
> > > >
> > > >   2) While QEMU is the vendor for a guest, if the topology specifie=
s
> > > >      SMT (> 1 thread), then, with ACPI, it is impossible to assign =
a
> > > >      core-id the same value as a package-id, thus it is not possibl=
e
> > > >      to have package-id=3D0 and core-id=3D0. This is because packag=
e and
> > > >      core containers must be in the same ACPI namespace and therefo=
re
> > > >      must have unique UIDs.
> > > >
> > > >   3) ACPI processor containers are not required for PPTT tables to
> > > >      be used and, due to the limitations of which IDs are selected
> > > >      described above in (2), they are not helpful for QEMU, so we
> > > >      don't build them with this patch. In the absence of them, Linu=
x
> > > >      assigns its own unique IDs. The maintainers have chosen not to=
 use
> > > >      counters from zero, but rather ACPI table offsets, which expla=
ins
> > > >      why the numbers are so much larger than with DT.
> > > >
> > > >   4) When there is no SMT (threads=3D1) the core IDs for ACPI boot =
guests
> > > >      match the logical CPU IDs, because these IDs must be equal to =
the
> > > >      MADT CPU UID (as no processor containers are present), and QEM=
U
> > > >      uses the logical CPU ID for these MADT IDs.
> > > >
> > > > Tested-by: Jiajie Li <lijiajie11@huawei.com>
> > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > Signed-off-by: Ying Fang <fangying1@huawei.com>
> > > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > > ---
> > > >   hw/arm/virt-acpi-build.c | 63 +++++++++++++++++++++++++++++++++++=
+++++
> > > >   1 file changed, 63 insertions(+)
> > > >
> > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > index 2ad5dad1bf..03fd812d5a 100644
> > > > --- a/hw/arm/virt-acpi-build.c
> > > > +++ b/hw/arm/virt-acpi-build.c
> > > > @@ -436,6 +436,64 @@ build_srat(GArray *table_data, BIOSLinker *lin=
ker,
> > > VirtMachineState *vms)
> > > >                    vms->oem_table_id);
> > > >   }
> > > >
> > > > +/* PPTT */
> > > > +static void
> > > > +build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineStat=
e *vms)
> > > > +{
> > > > +    int pptt_start =3D table_data->len;
> > > > +    int uid =3D 0, cpus =3D 0, socket =3D 0;
> > > > +    MachineState *ms =3D MACHINE(vms);
> > > > +    unsigned int smp_cores =3D ms->smp.cores;
> > > > +    unsigned int smp_threads =3D ms->smp.threads;
> > > > +
> > > > +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> > > > +
> > > > +    for (socket =3D 0; cpus < ms->possible_cpus->len; socket++) {
> > > > +        uint32_t socket_offset =3D table_data->len - pptt_start;
> > > > +        int core;
> > > > +
> > > > +        build_processor_hierarchy_node(
> > > > +            table_data, 1, /* Physical package */
> > > > +            0, socket, /* No parent */
> > > > +            NULL, 0);  /* No private resources */
> > > > +
> > > > +        for (core =3D 0; core < smp_cores; core++) {
> > > > +            uint32_t core_offset =3D table_data->len - pptt_start;
> > > > +            int thread;
> > > > +
> > > > +            if (smp_threads <=3D 1) {
> > > > +                build_processor_hierarchy_node(
> > > > +                    table_data,
> > > > +                    (1 << 1) | /* ACPI Processor ID valid */
> > > > +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> > > > +                    socket_offset, uid++, /* Parent is a Socket */
> > > > +                    NULL, 0);  /* No private resources */
> > > > +            } else {
> > > > +                build_processor_hierarchy_node(
> > > > +                    table_data, 0,
> > > > +                    socket_offset, core, /* Parent is a Socket */
> > > > +                    NULL, 0); /* No private resources */
> > > > +
> > > > +                for (thread =3D 0; thread < smp_threads; thread++)=
 {
> > > > +                    build_processor_hierarchy_node(
> > > > +                        table_data,
> > > > +                        (1 << 1) | /* ACPI Processor ID valid */
> > > > +                        (1 << 2) | /* ACPI 6.3 - Processor is a Th=
read */
> > > > +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> > > > +                        core_offset, uid++, /* Parent is a Core */
> > > > +                        NULL, 0);  /* No private resources */
> > > > +                }
> > > > +            }
> > > > +        }
> > > > +        cpus +=3D smp_cores * smp_threads;
> > > > +    }
> > > > +
> > > > +    build_header(linker, table_data,
> > > > +                 (void *)(table_data->data + pptt_start), "PPTT",
> > > > +                 table_data->len - pptt_start, 2,
> > > > +                 vms->oem_id, vms->oem_table_id);
> > > > +}
> > > > +
> > > >   /* GTDT */
> > > >   static void
> > > >   build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineSta=
te
> *vms)
> > > > @@ -707,6 +765,11 @@ void virt_acpi_build(VirtMachineState *vms,
> > > AcpiBuildTables *tables)
> > > >       acpi_add_table(table_offsets, tables_blob);
> > > >       build_madt(tables_blob, tables->linker, vms);
> > > >
> > > > +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> > > I'm not really sure why we need to care about "ms->smp.cpus > 1" here=
?
> > >
> > > IMO, just like MADT in which we create both ENABLED and DISABLED
> > > gicc nodes no matter of number of ENABLED nodes is one or not, we
> > > should create PPTT table for all the possible cpus and not care about
> > > number of smp cpus, too. This will be more consistent with the ACPI
> > > specification and the PPTT table will be used for ACPI cpu hotplug in
> > > the future even with=A0 "smp.cpus =3D=3D 1".
> >
> >
> > A humble request:
> > Let us not anticipate the changes of vcpu Hotplug here. Things are flui=
d
> > with respect to the vcpu Hotplug right now and I think it will not be
> > right to base PPTT Table changes in anticipation of something we are no=
t
> > sure of what it looks like.
> >
> > Any such decisions should be postponed and be made part of the actual
> > vcpu Hotplug changes when(and if ever) they come for ARM64. This will
> > also ensure proper review of such changes and useful in that particular
> > context.
>=20
> Hi Salil,
>=20
> Can you please elaborate on this and send some pointers to the hot plug
> discussions?=20

Hi Andrew,
As you are aware, ACPI based vcpu Hotplug is under contention right now.
It is being discussed within the ARM to have Hotplug mechanism which does
not involves QEMU<->Guest ACPI Hotplug exchanges and are purely based on
PSCI triggers(which might take a different ACPI path). If you wish you can
join Linaro Open Discussion meeting for the same. All these discussions
have been happening there

https://linaro.atlassian.net/wiki/spaces/LOD/pages/26844463630/2021-5-25+Me=
eting+Meeting+notes


You're not saying that we shouldn't try to generate PPTT
> tables for AArch64 guests until a solution for hot plug has been
> determined, are you?=20

Sorry, I did not mean that. Changes of PPTT are independent to vcpu
Hotplug support and are still required without it. No problem with that.


If so, I don't think I would agree with that. There
> are benefits to properly describing cpu topology to guests, even without
> hot plug.

Agreed. No second thoughts on that.

 Those benefits, when vcpu pinning is used, are the same benefits
> as for the host, which already use PPTT tables to describe topology, even
> though hot plug isn't supported.

yes sure, you mean pinning vcpus according to the cpu topology for performa=
nce?

>=20
> Now, if you're saying we should only generate tables for smp.cpus, not

Correct. This is what I thought we must be doing even now

> smp.maxcpus, because hot plug isn't supported anyway, then I see your
> point. But, it'd be better to require smp.cpus =3D=3D smp.maxcpus in our
> smp_parse function to do that, which we've never done before, so we may
> have trouble supporting existing command lines.

I am trying to recall, if the vcpu Hotplug is not supported then can they
ever be different?

cpus =3D  (threads * cores * sockets)

static void smp_parse(MachineState *ms, QemuOpts *opts)
{
     [...]

        if (sockets * cores * threads !=3D ms->smp.max_cpus) {
            warn_report("Invalid CPU topology deprecated: "
                        "sockets (%u) * cores (%u) * threads (%u) "
                        "!=3D maxcpus (%u)",
                        sockets, cores, threads,
                        ms->smp.max_cpus);
        }
     [...]
}
 =20
Although, above check does not exit(1) and just warns on detecting invalid
CPU topology. Not sure why?

Well if you think there are subtleties to support above implementation and
we cannot do it now then sure it is your call. :)

I just thought to slim the patch-set down and club the relevant logic to th=
e
places where they ideally would have made more sense to review.


Thanks
Salil.

