Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4423331BD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 23:47:30 +0100 (CET)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJl8T-0000Wu-9U
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 17:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJl6m-00082v-Jc; Tue, 09 Mar 2021 17:45:44 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50471 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJl6j-0004qS-6h; Tue, 09 Mar 2021 17:45:44 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dw9KC1h5tz9sWT; Wed, 10 Mar 2021 09:45:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615329935;
 bh=4rzQ4BlvuVWBw/oP3UQhV73kqhE19S4Xzvox+vePPMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jdJ2brha+0xaMWNYPVAF9Qc9ByFSPn2WPK3KXKOoTkM7VFI3vaVHY9FZMdORXZ3gs
 Hs35swg0a5157pJ6RfQTwVWSAhqn5F+f6Nowrebiu/L/mTJndc/csySXOXKVUihHNR
 Hqj0hybyNY17ucrrVUYfZNeery3gS+PUVPqYYOL0=
Date: Wed, 10 Mar 2021 09:44:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 4/8] vt82c686: Introduce abstract TYPE_VIA_ISA and
 base vt82c686b_isa on it
Message-ID: <YEf6ZhJ1LC3mjbQI@yekko.fritz.box>
References: <cover.1614719482.git.balaton@eik.bme.hu>
 <07df96112b78673ca191f9a4ffa17bf3a11160f3.1614719482.git.balaton@eik.bme.hu>
 <da48a752-9b2d-6cd8-9603-4cc528fea628@amsat.org>
 <11fb7590-89f3-62e7-48e3-d44226876e78@eik.bme.hu>
 <14cc6696-869d-679a-883f-fbcd30fe6ba1@amsat.org>
 <YEGDLehnK3Vhp56s@yekko.fritz.box>
 <c5f147fc-a834-72fb-26ca-0c37cac7253c@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C2f55A5cXt9uLdf4"
Content-Disposition: inline
In-Reply-To: <c5f147fc-a834-72fb-26ca-0c37cac7253c@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--C2f55A5cXt9uLdf4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 10:12:24AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 3/5/21 2:02 AM, David Gibson wrote:
> > On Thu, Mar 04, 2021 at 11:42:10PM +0100, Philippe Mathieu-Daud=E9 wrot=
e:
> >> On 3/4/21 9:16 PM, BALATON Zoltan wrote:
> >>> On Thu, 4 Mar 2021, Philippe Mathieu-Daud=E9 wrote:
> >>>> On 3/2/21 10:11 PM, BALATON Zoltan wrote:
> >>>>> To allow reusing ISA bridge emulation for vt8231_isa move the device
> >>>>> state of vt82c686b_isa emulation in an abstract via_isa class.
> >>>>>
> >>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >>>>> ---
> >>>>> =A0hw/isa/vt82c686.c=A0=A0=A0=A0=A0=A0=A0 | 70 ++++++++++++++++++++=
++------------------
> >>>>> =A0include/hw/pci/pci_ids.h |=A0 2 +-
> >>>>> =A02 files changed, 40 insertions(+), 32 deletions(-)
> >>>>>
> >>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> >>>>> index 72234bc4d1..5137f97f37 100644
> >>>>> --- a/hw/isa/vt82c686.c
> >>>>> +++ b/hw/isa/vt82c686.c
> >>>>> @@ -609,24 +609,48 @@ static const TypeInfo vt8231_superio_info =3D=
 {
> >>>>> =A0};
> >>>>>
> >>>>>
> >>>>> -OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
> >>>>> +#define TYPE_VIA_ISA "via-isa"
> >>>>> +OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
> >>>>>
> >>>>> -struct VT82C686BISAState {
> >>>>> +struct ViaISAState {
> >>>>> =A0=A0=A0=A0 PCIDevice dev;
> >>>>> =A0=A0=A0=A0 qemu_irq cpu_intr;
> >>>>> =A0=A0=A0=A0 ViaSuperIOState *via_sio;
> >>>>> =A0};
> >>>>>
> >>>>> +static const VMStateDescription vmstate_via =3D {
> >>>>> +=A0=A0=A0 .name =3D "via-isa",
> >>>>
> >>>> You changed the migration stream name, so I think we have
> >>>> a problem with migration... No clue how to do that properly.
> >>>
> >>> I don't think these machines support migration or state description of
> >>> vt86c686b was not missing something before these patches that would m=
ake
> >>> it not work anyway so I did not worry about this too much. I doubt
> >>> anybody wants to migrate a fuloong2e machine so this should not be a
> >>> problem in practice but maybe you can mention it in the release notes=
 if
> >>> you think that would be necessary.
> >>
> >> Maybe just add in the description:
> >>
> >>  This change breaks migration back compatibility, but
> >>  this is not an issue for the Fuloong2E machine.
> >=20
> > Hrm.  If migration was never supported, why is there a vmstate
> > description there at all though?
> >=20
> > That said, I don't think breaking compat is a problem: that's only an
> > issue where we actually have versioned machine types, which covers
> > only pc, pseries, arm virt and a very few others.  I don't think this
> > device was used on any of them.
>=20
> OK. Can you provide a formal Ack-by tag then? :)

Not really - this device isn't within the things I maintain, and I
don't really understand it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--C2f55A5cXt9uLdf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBH+mYACgkQbDjKyiDZ
s5IDYw//WXReoTiQihqvH2U4p4fMzJg1qr48HbEQZTq6eX3T5vnle+4moBjbzjsT
EwUWh1IagaaDra2yD9L1awT3RPV0M5TYUbbd+dSGCk1A+dqunsqC3omt6VMHBgF7
QkrzGmzdtNB7dNQUc1BFuK9kYpGHkMKDqWL1bpukQA91NmTxycOE6kMbpw2h5Lda
beFGNfI3rPmszAzBal+RlkreCan/DNXvQ21I3tuVdEq1Glr85EBRz+uybsY70lRK
w6mo9csi04k3PJSyWALgRbBizfNTPN8XzDxGqIi9W8WJ84w86XtegoQ8bFop1ya/
W+dNemLZ1vKq1ImISUCJ8MwFo9bwKecKNm/OyzX019e3KF17sO8V8it7BNFy/xgQ
q1Wblmguqb9qh7G6ftddqUBY+zvwn2g7pFOfyvJd8pFHFVLH10NT8QyuYXitMTsA
+LNH+BoKZliba7Ures+h+SlJBm+kGswN0peac1UyBsjHV3vqLPErfPV4RRwvtN35
SFpBy6GeWpcnEMYupaMAUw611Wm6LiH7optvo+sx6BeCXAyDkO3iwLHBDmoYScnW
i0tsnDd504+BvN5oKmZLvCzeTkht4zgvBOmG78ps9VcMvmlGnfePEaeVVHp1CARj
FV2Xs728Az+k2NDVNtWKrNJrDAVtf0FrqA7obPc4DXTBczSECXY=
=lp0B
-----END PGP SIGNATURE-----

--C2f55A5cXt9uLdf4--

