Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA7E3EE4D2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 05:14:13 +0200 (CEST)
Received: from localhost ([::1]:44092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFpYK-0001xZ-NO
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 23:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFpUR-0007xv-EU; Mon, 16 Aug 2021 23:10:11 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53833 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFpUO-0001qJ-Bm; Mon, 16 Aug 2021 23:10:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GpbcX49Gvz9sT6; Tue, 17 Aug 2021 13:10:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629169804;
 bh=sJKcNjj5PmMgkciihaurr214FscblnyfYDHMza4fb8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pq5+l6s7Iwi4fx7E7YIt2s9YjyW/sxXH8UPpI86jfNWOyP4MfocdAZ3i9A8FUyeDb
 TdRcLy+Vo4w139udlxJ4oXiKI6oTVq8bYOcj6YWvmrcG8yulOCpPOQR1H0qMuv/axH
 guBqxvXQNMhGVQaS+bTub+RbNHu7j53lSN2dat94=
Date: Tue, 17 Aug 2021 13:09:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
Message-ID: <YRsoY63uYiVtdpwf@yekko>
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
 <CAFEAcA-KSFuYbkbu7iBvgLxgBgBPRGeOgLuEuh5g5_MO4=Nk0w@mail.gmail.com>
 <1e0f11ef-fd72-0e96-279f-f02463f96442@amsat.org>
 <9c79035-2fb5-cc7-9530-eedaa69aebec@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EovOJ+R4cO2MjYWL"
Content-Disposition: inline
In-Reply-To: <9c79035-2fb5-cc7-9530-eedaa69aebec@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EovOJ+R4cO2MjYWL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 01:58:08PM +0200, BALATON Zoltan wrote:
> On Mon, 16 Aug 2021, Philippe Mathieu-Daud=E9 wrote:
> > On 8/16/21 12:26 PM, Peter Maydell wrote:
> > > On Mon, 16 Aug 2021 at 06:46, David Gibson <david@gibson.dropbear.id.=
au> wrote:
> > > >=20
> > > > On Sun, Aug 15, 2021 at 07:59:15PM -0700, Guenter Roeck wrote:
> > > > > IBM EMAC Ethernet controllers are not emulated by qemu. If they a=
re
> > > > > enabled in devicetree files, they are instantiated in Linux but
> > > > > obviously won't work. Disable associated devicetree nodes to prev=
ent
> > > > > unpredictable behavior.
> > > > >=20
> > > > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > > >=20
> > > > I'll wait for Zoltan's opinion on this, but this sort of thing is w=
hy
> > > > I was always pretty dubious about qemu *loading* a dtb file, rather
> > > > than generating a dt internally.
> > >=20
> > > My take is that if you have to modify the dtb file to get QEMU to
> > > work, then that's a bug in QEMU that should be fixed. It's no
> > > worse than for the machines we have that don't use dtb and where
> > > the kernel just knows what the hardware is. (In my experience
> > > Arm kernels can be a bit finicky about wanting the right dtb
> > > and not some earlier or later one, so I think at least for Arm
> > > trying to generate a dt for our non-virt boards would have been
> > > pretty painful and liable to "new kernels don't boot any more" bugs.)
> > >=20
> > > Is it sufficient to create stub "unimplemented-device" ethernet
> > > controllers here, or does the guest want more behaviour than that?
> >=20
> > For raspi4 "unimplemented-device" is not enough, so what would
> > be the ideal resolution for "the guest wants more behaviour"
> > when we don't have time / interest / specs for the missing
> > pieces?
>=20
> I guess ideal solution is to implement the missing device emulation, if we
> don't have resources for that effort then that's less than ideal but in t=
hat
> case patching the dtb to disable the device does not look too bad to me. I
> think that's an acceptable way to save the effort of implementing the dev=
ice
> that's not srtictly needed.

I'm sympathetic to that, but in that case I think you shold drop the
pretense of using this external dtb and matching it.  Either generate
the dtb in qemu, or snapshot the dtb, modify it to be the
qemu-emulated version of the hardware and load that file explicitly.
The second being basically just an easy way of generating a dtb when
it's near-static.


> For sam460ex I think Linux has booted so far but
> displays an error about missing ethernet ports but this did not prevent it
> from booting. So unless recent kernels fail now, this patch is only
> suppresses those errors (and avoid going to code paths in guest kernel th=
at
> probably never run on real hadware). I think there are arguments for and
> against it (the errors look ugly so we could prevent it but on the other
> hand then we have something different than on real hardware however missi=
ng
> the device means it's really different) so I'm not quite decided about
> either approach but I tend to try to keep it as similar to real hardware =
as
> possible (so using unmodified dtb) as long as it does not cause real
> problems. But if patching the dtb makes it nicer by avoiding a big and ma=
ybe
> confusing error message on boot and it does not break anything else then
> that's OK too.
>=20
> Regards,
> BALATON Zoltan


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EovOJ+R4cO2MjYWL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEbKGMACgkQbDjKyiDZ
s5LLEg//Up5g7Ze3cXx7qbuh7SvjjVxPj3JVUBwWxSbqhrgw3tirqq4Xcm1CGet6
UDX/CnOv8Kzb5tfHiMTeiOnMA0BN6kZLJiOm4p1N8y77X8sEPJU1xGDyXXu3UIzV
sYFmABo8ryM5ZPk8qmsyojurD+VXwMqqvWiZ/36CcV9DixF28e49xJz5jtEXtJcx
l0HwlpM1JGLetW5Lbj7xXTuUHk6ANvgQy+HVu5qtZeHlQbd+pmU8rXgWVx3yci4b
3DcBoTs0S9+t7R1e6+lTOQmhd1G5tWImLvdQ2U+Be5N+3nko73f4EAG0Ezel+ARF
ImJ04NgLhqha5dvlqDYFQscTSXeEdCw4/ERLbMQIznv/f1uDlfNnNC9Dfa3Y0GdI
YK94+tF+qTGe10CoKox2onAcFvQXaCEBoumKEVlxw5hSVK2I9phXDbIQKAZ+Yivm
+lfgNj6nmRJvBII9ex3s7ytwUdnrPHp7kpjHX57JiC/ZdbupHdeH/ctw7DifE0qk
gYVITjcfKgpuSoDqbv7om4PZqqrBtPG8ZpLJnoa3EO09kCGuGvLkIq87a79SLRSv
Qj1Yc3IM7rnM8dAYjFwNRrSyok6jf9znahVOMRMbmNzWmeugIaTnVYZYqNcMKTK4
6w8OX4L4nHjCuQYvoBE3HoNGWH+K4my1xzGlylsV23jISid79bI=
=T/fY
-----END PGP SIGNATURE-----

--EovOJ+R4cO2MjYWL--

