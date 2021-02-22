Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAFF322488
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 04:11:27 +0100 (CET)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEO6g-0002Dd-6H
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 22:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO38-0006EX-7p; Mon, 22 Feb 2021 22:07:46 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38667 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO35-0003Da-UI; Mon, 22 Feb 2021 22:07:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl3rS5NJnz9sTD; Tue, 23 Feb 2021 14:07:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614049656;
 bh=lB2qhVhVvCNwKnLEP9cyVRt4kgQq0RQXnIPlpk7dq2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KFOWhcID0dtdiNAomEpDaPts1jSJ82Ytxndpt+d2goQHThz6ePo193JIsAGJiwYUo
 P86LbDcu1xNkh2QLXqPt/+rGLma2RlyYfZGg3c2dZ4Rw4FNWTs8HtM/WMOo8D/0hW2
 WkZKKs7NJTNCZUbJTm/cdhZcKb3yIEEd5MCTIJEI=
Date: Tue, 23 Feb 2021 10:37:01 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type() return
 value
Message-ID: <YDRAHW1ds1eh0Lav@yekko.fritz.box>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-2-philmd@redhat.com>
 <20210222182405.3e6e9a6f.cohuck@redhat.com>
 <bc37276d-74cc-22f0-fcc0-4ee5e62cf1df@redhat.com>
 <20210222185044.23fccecc.cohuck@redhat.com>
 <YDQ/Y1KozPSyNGjo@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iHciYgIJJ+RNzZ6R"
Content-Disposition: inline
In-Reply-To: <YDQ/Y1KozPSyNGjo@yekko.fritz.box>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iHciYgIJJ+RNzZ6R
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 10:33:55AM +1100, David Gibson wrote:
> On Mon, Feb 22, 2021 at 06:50:44PM +0100, Cornelia Huck wrote:
> > On Mon, 22 Feb 2021 18:41:07 +0100
> > Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
> >=20
> > > On 2/22/21 6:24 PM, Cornelia Huck wrote:
> > > > On Fri, 19 Feb 2021 18:38:37 +0100
> > > > Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
> > > >  =20
> > > >> MachineClass::kvm_type() can return -1 on failure.
> > > >> Document it, and add a check in kvm_init().
> > > >>
> > > >> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > >> ---
> > > >>  include/hw/boards.h | 3 ++-
> > > >>  accel/kvm/kvm-all.c | 6 ++++++
> > > >>  2 files changed, 8 insertions(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/include/hw/boards.h b/include/hw/boards.h
> > > >> index a46dfe5d1a6..68d3d10f6b0 100644
> > > >> --- a/include/hw/boards.h
> > > >> +++ b/include/hw/boards.h
> > > >> @@ -127,7 +127,8 @@ typedef struct {
> > > >>   *    implement and a stub device is required.
> > > >>   * @kvm_type:
> > > >>   *    Return the type of KVM corresponding to the kvm-type string=
 option or
> > > >> - *    computed based on other criteria such as the host kernel ca=
pabilities.
> > > >> + *    computed based on other criteria such as the host kernel ca=
pabilities
> > > >> + *    (which can't be negative), or -1 on error.
> > > >>   * @numa_mem_supported:
> > > >>   *    true if '--numa node.mem' option is supported and false oth=
erwise
> > > >>   * @smp_parse:
> > > >> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > > >> index 84c943fcdb2..b069938d881 100644
> > > >> --- a/accel/kvm/kvm-all.c
> > > >> +++ b/accel/kvm/kvm-all.c
> > > >> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
> > > >>                                                              "kvm-=
type",
> > > >>                                                              &erro=
r_abort);
> > > >>          type =3D mc->kvm_type(ms, kvm_type);
> > > >> +        if (type < 0) {
> > > >> +            ret =3D -EINVAL;
> > > >> +            fprintf(stderr, "Failed to detect kvm-type for machin=
e '%s'\n",
> > > >> +                    mc->name);
> > > >> +            goto err;
> > > >> +        }
> > > >>      }
> > > >> =20
> > > >>      do { =20
> > > >=20
> > > > No objection to this patch; but I'm wondering why some non-pseries
> > > > machines implement the kvm_type callback, when I see the kvm-type
> > > > property only for pseries? Am I holding my git grep wrong? =20
> > >=20
> > > Can it be what David commented here?
> > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg784508.html
> > >=20
> >=20
> > Ok, I might be confused about the other ppc machines; but I'm wondering
> > about the kvm_type callback for mips and arm/virt. Maybe I'm just
> > confused by the whole mechanism?
>=20
> For ppc at least, not sure about in general, pseries is the only
> machine type that can possibly work under more than one KVM flavour
> (HV or PR).  So, it's the only one where it's actually useful to be
> able to configure this.

Wait... I'm not sure that's true.  At least theoretically, some of the
Book3E platforms could work with either PR or the Book3E specific
KVM.  Not sure if KVM PR supports all the BookE instructions it would
need to in practice.

Possibly pseries is just the platform where there's been enough people
interested in setting the KVM flavour so far.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iHciYgIJJ+RNzZ6R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0QB0ACgkQbDjKyiDZ
s5JQqBAA2HMmkpdhk4iK7XRStsDCbxBXZysxhFDBM0qLWfKEbOKqcRzv9BiIFbRb
Ioh4AG1Vvt/cxatFBRkKOOIML8ICtAm/hhBBo3A/6gwi5ogzlRO54Jkr+GIWiRSH
0iY9VKPGnsjTaf6SrE7GKxdYiPdGTR+6+2snq/f0EUjcz15LsWujsrB2Vyr/F/Oe
KEYH+S+Pwot39s3mGSOIR0QYHsfN4+oYLPajZXdmcrGjBsTNM6s7+fDGb6oAC7Yg
7cvOCbL6EAOJ1P3wmYySwu1rVM/vU6IFW7LUfZcP33JynhPYWWh7J84zCTBwNgJF
IQvlIEQU3Qta+SieLJma+ZTwALAiYSDKSJ1n4vIEWQ21FoQLSbzP4oxqDMiTZha+
LW5mzqPTQuF/MZg+B+dZtpCKWiLhkG7SWVB7Gb8hq7wat+AZONUJU/BaqQq2QVdN
a7YiR95k/6rsUFyN0I8NYsrIIMbR6IlI+ivVCukvurwo3iP9m+4/UyM/gM3XRBNc
ekYjyglLGj9pztFIC0JVBPodTG/8OSkAuvVDh2fVaefjfj0nckXJ9oxJDc1D6LH2
vocCjxis9Dv2YgQgzem8pUAQ//Z1WGIiiyWD1gPDt/A3EDbvjxHPZK0w7ZOxKLYR
cagHb4ijSlK6htqbMaqOJ3zM7FOgPwHvc0xLzUttBEolVXQia1E=
=kPBL
-----END PGP SIGNATURE-----

--iHciYgIJJ+RNzZ6R--

