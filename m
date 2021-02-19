Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68531F978
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:37:32 +0100 (CET)
Received: from localhost ([::1]:50444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD52J-0000i2-97
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lD50F-0007OI-SP
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:35:23 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lD502-0006Hd-UA
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:35:18 -0500
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DhrVy0H5Xz67nNQ;
 Fri, 19 Feb 2021 20:29:46 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 19 Feb 2021 13:35:01 +0100
Received: from localhost (10.47.77.222) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 19 Feb
 2021 12:35:00 +0000
Date: Fri, 19 Feb 2021 12:33:56 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Chris Browy <cbrowy@avery-design.com>
Subject: Re: [RFC PATCH v2 1/2] Basic PCIe DOE support
Message-ID: <20210219123356.000046de@Huawei.com>
In-Reply-To: <DDBDE314-FA91-4E43-9484-F83E446B6EE4@avery-design.com>
References: <1612900760-7361-1-git-send-email-cbrowy@avery-design.com>
 <1612902949-9992-1-git-send-email-cbrowy@avery-design.com>
 <20210212162442.00007c1d@Huawei.com>
 <8A5C244A-DF9A-4EB5-8C24-568A606E75B0@avery-design.com>
 <20210218191143.00000cdf@Huawei.com>
 <DDBDE314-FA91-4E43-9484-F83E446B6EE4@avery-design.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.77.222]
X-ClientProxiedBy: lhreml742-chm.china.huawei.com (10.201.108.192) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Ben Widawsky <ben.widawsky@intel.com>, david@redhat.com,
 qemu-devel@nongnu.org, vishal.l.verma@intel.com, jgroves@micron.com,
 "20210212162442.00007c1d@huawei.com" <20210212162442.00007c1d@Huawei.com>,
 linux-cxl@vger.kernel.org, armbru@redhat.com,
 "20210218191143.00000cdf@huawei.com" <20210218191143.00000cdf@Huawei.com>,
 mst@redhat.com, imammedo@redhat.com, dan.j.williams@intel.com,
 ira.weiny@intel.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 19:46:54 -0500
Chris Browy <cbrowy@avery-design.com> wrote:

> > On Feb 18, 2021, at 2:11 PM, Jonathan Cameron <jonathan.cameron@huawei.=
com> wrote:
> >=20
> > On Fri, 12 Feb 2021 16:58:21 -0500
> > Chris Browy <cbrowy@avery-design.com> wrote:
> >  =20
> >>> On Feb 12, 2021, at 11:24 AM, Jonathan Cameron <Jonathan.Cameron@Huaw=
ei.com> wrote:
> >>>=20
> >>> On Tue, 9 Feb 2021 15:35:49 -0500
> >>> Chris Browy <cbrowy@avery-design.com> wrote:
> >>>=20
> >>> Run ./scripts/checkpatch.pl over the patches and fix all the warnings=
 before
> >>> posting.  It will save time by clearing out most of the minor formatt=
ing issues
> >>> and similar that inevitably sneak in during development.
> >>>  =20
> >> Excellent suggestion.  We=E2=80=99re still newbies!
> >>  =20
> >>> The biggest issue I'm seeing in here is that the abstraction of
> >>> multiple DOE capabiltiies accessing same protocols doesn't make sense.
> >>>=20
> >>> Each DOE ecap region and hence mailbox can have it's own set of
> >>> (possibly  overlapping) protocols.
> >>>=20
> >>> From the ECN:
> >>> "It is permitted for a protocol using data object exchanges to require
> >>> that a Function implement a unique instance of DOE for that specific
> >>> protocol, and/or to allow sharing of a DOE instance to only a specific
> >>> set of protocols using data object exchange, and/or to allow a Functi=
on
> >>> to implement multiple instances of DOE supporting the specific protoc=
ol."
> >>>=20
> >>> Tightly couple the ECAP and DOE.  If we are in the multiple instances
> >>> of DOE supporting a specific protocol case, then register it separate=
ly
> >>> for each one.  The individual device emulation then needs to deal with
> >>> any possible clashes etc.   =20
> >>=20
> >> Not sure how configurable we want to make the device.  It is a simple =
type 3
> >> device after all.  =20
> >=20
> > Agreed, but what I (or someone else) really doesn't want to have to do
> > in the future is reimplement DOE because we made design decisions that =
make
> > this version hard to reuse.  Unless it is particularly nasty to do we s=
hould
> > try to design something that is generally useful rather than targeted to
> > closely at the specific case we are dealing with.
> >=20
> > I'd argue the ECAP and the DOE mailbox are always tightly coupled 1-to-=
1.
> > Whether the device wants to implement multiple protocols on each DOE ma=
ilbox
> > or indeed run individual protocols on multiple DOE mailboxes is a design
> > decision, but the actual mechanics of DOE match up with the config
> > space structures anything else is impdef on the device. =20
>=20
> Yes I agree that there is 1-to-1 between DOE extended cap (ECAP) and DOE
> Mailbox.  If we want to provide complete flexibility we should let the us=
er pass=20
> device property arrays to QEMU command for how many DOE ECAP=E2=80=99s to=
 build=20
> out and how to assign protocol(s) to each of them.  Array index is the DO=
E=20
> instance #.
>=20
> Also we can provide a property for cdat binary (blob) filename to initial=
ize=20
> the CDAT structure[entries].  This just reads in whatever mix of CDAT str=
ucture
> types are in the blob.
>=20
> -device cxl-type3,bus=3Drp0,memdev=3Dcxl-mem1,id=3Dcxl-pmem0,size=3D256M \
>     doe-ecap-instances=3D2 \
>     doe-ecap[0]=3D5 // bitwise OR for protocols shared
>     doe-ecap[1]=3D2 //bitwise OR for protocols shared
>     doe-ecap-cdat[1]=3Dmycdat.bin
>=20
> where let=E2=80=99s say protocols bitvector
> bit [0]=3DCMA
> bit [1]=3DCDAT
> bit [2}=3DCompliance
>=20
> Let me know if you some better alternatives and we=E2=80=99ll implement i=
t.
>=20

Gut feeling for DOE is that the particular combination of protocol and
ECAP/DOE is device dependent. As such...

I'm not sure we actually want to expose it as command line controllable at =
all.
If we do, I'd suggest a small number of sane choices that exercise cases
we want to check.

=46rom a testing point of view, 2 DOE, one of which supports multiple
protocols and we will have enough to test likely failure modes in the code.

The one protocol running on multiple mailboxes is already covered by the
discovery protocol which they all support.  That might not exercise
all the potential problems on the emulator side (as no need to do
locking etc) but it will proabbly exercise those in the OS and firmware.

Almost all users of DOE functionality in QEMU in the long run are likely
to be emulating a particular device so will hard code the DOE instances pre=
sent
on that device in their emulation of whatever PCIe device they are
emulating.

This is no different to picking a particular layout for config space.
We could make it fully flexible, but it's rarely useful to do so.

If anyone wants to check something unusual, they can hack it into
QEMU.

As a side note, a protocol bit vector is going to unmaintainable as
there will be lots of protocols and last thing we want is that vector
to mean different things on different emulated PCI devices.

Jonathan



>=20
> >  =20
> >>=20
> >> The DOE spec does leave it pretty arbitrary regarding N DOE instances =
(DOE=20
> >> Extended Cap entry points) for M protocols, including where N>1 and M=
=3D1. =20
> >> Currently we implement N=3D2 DOE caps (instances), one for CDAT, one f=
or=20
> >> Compliance Mode.[
> >>=20
> >> Maybe a more complex MLD device might have one or more DOE instances=20
> >> for the CDAT protocol alone to define each HDM but currently we only h=
ave=20
> >> one pmem (SLD) so we can=E2=80=99t really do much more than what=E2=80=
=99s supported.
> >>=20
> >> Open to further suggestion though.  Based on answer to above we=E2=80=
=99ll follow=20
> >> the suggestion lower in the code review regarding=20
> >>  =20
> > ...
> >  =20
>=20


