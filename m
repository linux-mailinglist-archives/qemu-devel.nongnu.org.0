Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C441B307425
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 11:53:34 +0100 (CET)
Received: from localhost ([::1]:33400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l54vd-000549-Tp
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 05:53:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l54uE-0004RW-AU
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:52:06 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l54uB-0005YL-Qd
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:52:06 -0500
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DRHFS0V0bz67hQ4;
 Thu, 28 Jan 2021 18:46:04 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 11:51:58 +0100
Received: from localhost (10.47.74.140) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 10:51:58 +0000
Date: Thu, 28 Jan 2021 10:51:14 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [RFC] Set addresses for memory devices [CXL]
Message-ID: <20210128105114.0000715a@Huawei.com>
In-Reply-To: <CAPcyv4gbfrHM0L8WFU2jKLJw5DFxj5mpEOi62wyxAoKsQLMdhQ@mail.gmail.com>
References: <20210128035146.gt7ir3u73h5coxrr@mail.bwidawsk.net>
 <CAPcyv4gbfrHM0L8WFU2jKLJw5DFxj5mpEOi62wyxAoKsQLMdhQ@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.74.140]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Ben Widawsky <ben@bwidawsk.net>, Markus Armbruster <armbru@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 21:20:21 -0800
Dan Williams <dan.j.williams@intel.com> wrote:

> On Wed, Jan 27, 2021 at 7:52 PM Ben Widawsky <ben@bwidawsk.net> wrote:
> >
> > Hi list, Igor.
> >
> > I wanted to get some ideas on how to better handle this. Per the recent
> > discussion [1], it's become clear that there needs to be more thought p=
ut into
> > how to manage the address space for CXL memory devices. If you see the
> > discussion on interleave [2] there's a decent diagram for the problem s=
tatement.
> >
> > A CXL topology looks just like a PCIe topology. A CXL memory device is =
a memory
> > expander. It's a byte addressable address range with a combination of p=
ersistent
> > and volatile memory. In a CXL capable system, you can effectively think=
 of these
> > things as more configurable NVDIMMs. The memory devices have an interfa=
ce that
> > allows the OS to program the base physical address range it claims call=
ed an HDM
> > (Host Defined Memory) decoder. A larger address range is claimed by a h=
ost
> > bridge (or a combination of host bridges in the interleaved case) which=
 is
> > platform specific.
> >
> > Originally, my plan was to create a single memory backend for a "window=
" and
> > subregion the devices in there. So for example, if you had two devices =
under a
> > hostbridge, each of 256M size, the window would be some fixed GPA of 51=
2M+ size
> > memory backend, and those memory devices would be a subregion of the
> > hostbridge's window. I thought this was working in my patch series, but=
 as it
> > turns out, this doesn't actually work as I intended. `info mtree` looks=
 good,
> > but `info memory-devices` doesn't.
> > =20
>=20
> A couple clarifying questions...
>=20
> > So let me list the requirements and hopefully get some feedback on the =
best way
> > to handle it.
> > 1. A PCIe like device has a persistent memory region (I don't care about
> > volatile at the moment). =20
>=20
> What do you mean by "PCIe" like? If it is PCI enumerable by the guest
> it has no business being treated as proper memory because the OS
> rightly assumes that PCIe address space is not I/O coherent to other
> initiators.
>=20
> > 2. The physical address base for the memory region is programmable.
> > 3. Memory accesses will support interleaving across multiple host bridg=
es. =20
>=20
> So, per 1. it would look like a PCIe address space inside QEMU but
> advertised as an I/O coherent platform resource in the guest?

Personally I find it easier to think of these devices as containing:

1) A PCI based configuration interface (in config + bar space).

2) Memory accessed via an entirely separate memory bus -
   the PA translations for which (system address map etc) happens to
   be controllable via the PCI path.

The memory traffic goes over the PCI wires, but doesn't otherwise obey
any of the rules of PCI, so separate decode etc allowing for interleaving.
=46rom an emulation point of view it might as well be an entirely different b=
us.
(with a similar tree).

The host allocates certain windows of PA space for which it routes
PA reads / writes to particular physical ports - beyond that all the
PA routing to particular memory devices can be programmed at runtime.

Interleave makes this more 'interesting' :)

The host can set certain PA regions to interleave across multiple CXL root =
ports.
So if base PA =3D 128G, interleave of 512Bytes, 2 way.

Read to 128G + 0bytes   -> port 0
Read to 128G + 512bytes -> port 1
Read to 128G + 1024bytes-> port 0 etc

OS can then put two devices into such a PA region and let them know about
the interleave (via that PCI based config interface)
If there are switches below those ports, further interleave can occur
as well. It's very flexible.

Of course, others may prefer a different mental model!

Jonathan




