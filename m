Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D93A2C875B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 16:04:03 +0100 (CET)
Received: from localhost ([::1]:46786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjkig-0004JU-Er
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 10:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kjkdn-0002IE-5D
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 09:58:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kjkdl-0001yJ-8F
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 09:58:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606748335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n8UDe42HQg3szrXu4ElzgZIY2625Rfo44UOOJDYKBYk=;
 b=IKZjoe0OJLtWgQhv7UP4c2dsyK7ANLNTKwu/XxTp8M+cgMVPgTLXia89Y2I0s0uKeBUmZu
 +ipjgNARnu2NmRDTg3z5JT23icgAguERvJwKDf7tcF4Ca5I49NH0sAUDwIsHRktpRQO2Tr
 zeyZSdI8oZcOmoBNvgtOPIEDXRXw8jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-qOh8WLoiOhuOThD70vq-jQ-1; Mon, 30 Nov 2020 09:58:50 -0500
X-MC-Unique: qOh8WLoiOhuOThD70vq-jQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2246710866C2;
 Mon, 30 Nov 2020 14:58:43 +0000 (UTC)
Received: from localhost (ovpn-115-30.ams2.redhat.com [10.36.115.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80154648A2;
 Mon, 30 Nov 2020 14:58:42 +0000 (UTC)
Date: Mon, 30 Nov 2020 14:58:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v5 12/12] hw/block/nvme: add persistence for zone info
Message-ID: <20201130145841.GA474479@stefanha-x1.localdomain>
References: <20201126234601.689714-1-its@irrelevant.dk>
 <20201126234601.689714-13-its@irrelevant.dk>
 <20201130123300.GA422962@stefanha-x1.localdomain>
 <X8TspZJE+B551qno@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <X8TspZJE+B551qno@apples.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 30, 2020 at 01:59:17PM +0100, Klaus Jensen wrote:
> On Nov 30 12:33, Stefan Hajnoczi wrote:
> > On Fri, Nov 27, 2020 at 12:46:01AM +0100, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > >=20
> > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > ---
> > >  docs/specs/nvme.txt   |  15 +++
> > >  hw/block/nvme-ns.h    |  16 ++++
> > >  hw/block/nvme-ns.c    | 212 ++++++++++++++++++++++++++++++++++++++++=
+-
> > >  hw/block/nvme.c       |  87 +++++++++++++++++
> > >  hw/block/trace-events |   2 +
> > >  5 files changed, 331 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
> > > index 03bb4d9516b4..05d81c88ad4e 100644
> > > --- a/docs/specs/nvme.txt
> > > +++ b/docs/specs/nvme.txt
> > > @@ -20,6 +20,21 @@ The nvme device (-device nvme) emulates an NVM Exp=
ress Controller.
> > >    `zns.mor`; Specifies the number of open resources available. This =
is a 0s
> > >       based value.
> > > =20
> > > +  `zns.pstate`; This parameter specifies another blockdev to be used=
 for
> > > +     storing zone state persistently.
> > > +
> > > +       -drive id=3Dzns-pstate,file=3Dzns-pstate.img,format=3Draw
> > > +       -device nvme-ns,zns.pstate=3Dzns-pstate,...
> > > +
> > > +     To reset (or initialize) state, the blockdev image should be of=
 zero size:
> > > +
> > > +       qemu-img create -f raw zns-pstate.img 0
> > > +
> > > +     The image will be intialized with a file format header and trun=
cated to
> > > +     the required size. If the pstate given is of non-zero size, it =
will be
> > > +     assumed to already contain zone state information and the heade=
r will be
> > > +     checked.
> >=20
> > In principle this makes sense but at first glance it looks like the cod=
e
> > is synchronous - it blocks the vCPU if zone metadata I/O is necessary.
> > That works for test/bring-up code but can't be used in production due t=
o
> > the performance impact.
> >=20
> > Is the expectation that the QEMU NVMe device emulation will only be use=
d
> > for test/bring-up now and in the future?
> >=20
>=20
> Hi Stefan,
>=20
> Thanks for taking a look at this.
>=20
> I could see why someone would maybe use the core nvme emulation in
> production (but I'm not aware of anyone doing it), but the zoned
> emulation is *probably* not for production (and that is where the zone
> updates are needed). But someone could surprise me with a use case I
> guess.
>=20
> And yes, I know this is synchronous in this version. I have not
> extensively evaluated the performance impact, but crucially the blocking
> only happens when the zone changes state (i.e. every write does NOT
> trigger a blk_pwrite just to persist the updated write pointer).
>=20
> I know this can be done asynchronously (I have implemented it like so
> previously), but I wanted to get an opinion on the general stategry
> before adding that. The opposing strategy, is to use a some form of
> mmap/msync, but I, for one, pushed back against that because I'd like
> this to work on as many platforms as possible. Hence the RFC for this
> blockdev based approach.
>=20
> But if you think a blockdev approach like this is a reasonable QEMU-esce
> way of doing it, then I'll proceed to do a v2 with asynchronous updates.

I don't have a strong opinion, especially since I haven't investigated
how NVMe Zoned Namespaces work (besides watching your interesting KVM
Forum presentation).

If you want to do the mmap approach, please use HostMemoryBackend for
that instead of open coding mmap(2) calls. That way it will support
several types of backing memory, including MAP_SHARED files, persistent
memory, etc.

Stefan

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/FCKEACgkQnKSrs4Gr
c8jKbggAptS18Sgx6gMaegiTlxQhyRhKS4g/bchPl6Ds9Lm9+HPq2YsbZvWO7KSv
/OuLxkifa19dmBBZqvzPgCjPmYSUezShikKK0a2KqItOQKx7dHzMIpKYIpEX/2ek
a8Lkfo2L2/S/utg6NL31lvKDaksBZEt9klPwF0Vb8ntNa3jCErTaOi2dUry4e0me
vetgeSL4JU2oXkS6FO0EYqCFTMzvAEHcIpRAOhpVZlhZKv9a1J0wP1puEWQ++ngO
8vSz2OwzHvbjKXDO1Cvc8VGTAOeqgYTxGFUIFoGUPoKWWQTU1ZIqc5fyxvydgWgT
KhOXbtNHzmiCxhp5RiWc/++q7aAxnQ==
=FrfL
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--


