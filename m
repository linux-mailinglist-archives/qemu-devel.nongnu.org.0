Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3FA346F14
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:53:28 +0100 (CET)
Received: from localhost ([::1]:38122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsi7-0004mY-KH
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsdu-00026G-NU; Tue, 23 Mar 2021 21:49:06 -0400
Received: from ozlabs.org ([203.11.71.1]:32919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsds-0007u3-O0; Tue, 23 Mar 2021 21:49:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rkN43JPz9sWb; Wed, 24 Mar 2021 12:49:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616550540;
 bh=j7pMw2L4xs3GmxnzLJV3Ob+u6TdNbCpxPnDgRG7q7Nk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vd0+/30HnCyb2exxt6okM9pMsjP2LOKC9eMBmm1IvlB/sR2bUc4D9JsOGgpfeoHPr
 haqvSLCdGqwOFrhW+Mi5v9fN0VbtguLXRkvXcVxpU+yhlRwtm6T2kA1NNxX3Rmb1nJ
 +SFHg2lavsiFWvzVtrvD/vqmXoBK/XGlnGGrSRnk=
Date: Wed, 24 Mar 2021 12:40:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
Message-ID: <YFqYkuBSD3xPgLVi@yekko.fritz.box>
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <YFlAheldkqCkZytI@yekko.fritz.box>
 <b8d96ab9-61e5-b941-6405-5beff5fe0df5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WMlhhOkMHGfHPrPP"
Content-Disposition: inline
In-Reply-To: <b8d96ab9-61e5-b941-6405-5beff5fe0df5@gmail.com>
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WMlhhOkMHGfHPrPP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 02:10:22PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/22/21 10:12 PM, David Gibson wrote:
> > On Fri, Mar 12, 2021 at 05:07:36PM -0300, Daniel Henrique Barboza wrote:
> > > Hi,
> > >=20
> > > This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
> > > DEVICE_UNPLUG_ERROR. They were (and are still being) discussed in [1].
> > >=20
> > > Patches 1 and 3 are independent of the ppc patches and can be applied
> > > separately. Patches 2 and 4 are based on David's ppc-for-6.0 branch a=
nd
> > > are dependent on the QAPI patches.
> >=20
> > Implementation looks fine, but I think there's a bit more to discuss
> > before we can apply.
> >=20
> > I think it would make sense to re-order this and put UNPLUG_ERROR
> > first.  Its semantics are clearer, and I think there's a stronger case
> > for it.
>=20
> Alright
>=20
> >=20
> > I'm a bit less sold on DEVICE_NOT_DELETED, after consideration.  Does
> > it really tell the user/management anything useful beyond what
> > receiving neither a DEVICE_DELETED nor a DEVICE_UNPLUG_ERROR does?
>=20
>=20
> It informs that the hotunplug operation exceed the timeout that QEMU
> internals considers adequate, but QEMU can't assert that it was caused
> by an error or an unexpected delay. The end result is that the device
> is not going to be deleted from QMP, so DEVICE_NOT_DELETED.

Is it, though?  I mean, it is with this implementation for papr:
because we clear the unplug_requested flag, even if the guest later
tries to complete the unplug, it will fail.

But if I understand what Markus was saying correctly, that might not
be possible for all hotplug systems.  I believe Markus was suggesting
that DEVICE_NOT_DELETED could just mean that we haven't deleted the
device yet, but it could still happen later.

And in that case, I'm not yet sold on the value of a message that
essentially just means "Ayup, still dunno what's happening, sorry".

> Perhaps we should just be straightforward and create a DEVICE_UNPLUG_TIME=
OUT
> event.

Hm... what if we added a "reason" field to UNPLUG_ERROR.  That could
be "guest rejected hotplug", or something more specific, in the rare
case that the guest has a way of signalling something more specific,
or "timeout" - but the later *only* to be sent in cases where on the
timeout we're able to block any later completion of the unplug (as we
can on papr).

Thoughs, Markus?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--WMlhhOkMHGfHPrPP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBamJAACgkQbDjKyiDZ
s5J2bA/9HVSBmGESOs+eTBYKjXVR/sJSKvpO+Zb/T+jjONlGTHPIFtvbxk1F+3z7
5HjqpVSBb0VTj52RObooETMcKISJ8WZ3povhGLrETrs9+0yDoJJDKPyhc1IWA/ss
Hiqip64ghjWnuyjmYqWzRS8ZoL5ydPzgjRk8S2bYZn1AcVXDLMZkWuB3SDnp2bOo
D6Qr1MEthS3orqAZg2lmSvmXL0ZJHuu3Gcu2Ahc1UraZc4DjWe1pOrHDYUovmQCX
cNIvJm4tqaWox4lJ4FL8FvO4nS9UnRNURha1TGGg3ycwXF9JuVIIpF+xjjxPPi3E
ybJVLUKRnknv2qbPQoaDqzdj4R+mJghF1TarG3B/ihN0TOgbxqKrTBd4UvKDCm8Y
cuYwBewAbUhlIdATgGAnLtTeJSwJisZ1h0tJDVWABCBfJINkskYfetzifdKU7dV9
//N6SYCwwbggnEtPinkSZvQZOWpUISouAL7gpBma8jdAa4h58p++OxTJtET+EJky
PdMeal9kEFg/kAFIEYCtV2nZuFg+EvTH507tgr21WPJFJyP3Zsd0gcL6VnfNgMyE
InRc2Nz29nofl+Xv4cbVB2y+i0hn7N3XFftF/MGJyx8G3cp0J3VPOGdKM+/02abJ
FULIfu3FewsB7jyAa3EnDgWBhi8Hd9XRo7nqI/s6qp9VwUTmxno=
=zXak
-----END PGP SIGNATURE-----

--WMlhhOkMHGfHPrPP--

