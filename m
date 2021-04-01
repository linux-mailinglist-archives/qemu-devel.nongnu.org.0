Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09B7350C65
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 04:10:01 +0200 (CEST)
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRmmW-0005F1-Ez
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 22:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRmko-0004ch-7t; Wed, 31 Mar 2021 22:08:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48953 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRmkl-0003H0-76; Wed, 31 Mar 2021 22:08:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9mml1jbLz9sVt; Thu,  1 Apr 2021 13:08:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617242887;
 bh=6yfYb4lWZ7E5y9m7PdaWnuVzQ2O/vvsnFlbyPFxryZA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gtu3Xywdug4k6zIpKvLav380HfnqaXFxEMKOr4X62Ufx2gyRK3SiTB1L10dbgkATK
 sgzEzvkA7CwUTDBcyTmjMMF0vOACAs3IFEqGJyuXDXJQT8e4Mgf6oZ17ZpfpPaVX6w
 tvrdSiKDOmzcxa69tWLfQtbghSn6hdCMynZc0uSI=
Date: Thu, 1 Apr 2021 12:36:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
Message-ID: <YGUjsYyChGKZi/a7@yekko.fritz.box>
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <YFlAheldkqCkZytI@yekko.fritz.box>
 <b8d96ab9-61e5-b941-6405-5beff5fe0df5@gmail.com>
 <YFqYkuBSD3xPgLVi@yekko.fritz.box>
 <ba20de28-d65b-6da4-5bff-92b637cf7a56@gmail.com>
 <20210330012831.2ce0514c@redhat.com>
 <YGO4aXzC6uEC3e/U@yekko.fritz.box>
 <ab27b072-68f7-37d7-233c-fd5df2e8c1ef@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YT2EIPdXGtid7nbL"
Content-Disposition: inline
In-Reply-To: <ab27b072-68f7-37d7-233c-fd5df2e8c1ef@gmail.com>
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
Cc: Igor Mammedov <imammedo@redhat.com>, groug@kaod.org, qemu-ppc@nongnu.org,
 armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YT2EIPdXGtid7nbL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 04:47:14PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/30/21 8:46 PM, David Gibson wrote:
> > On Tue, Mar 30, 2021 at 01:28:31AM +0200, Igor Mammedov wrote:
> > > On Wed, 24 Mar 2021 16:09:59 -0300
> > > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> > >=20
> > > > On 3/23/21 10:40 PM, David Gibson wrote:
> > > > > On Tue, Mar 23, 2021 at 02:10:22PM -0300, Daniel Henrique Barboza=
 wrote:
> > > > > >=20
> > > > > >=20
> > > > > > On 3/22/21 10:12 PM, David Gibson wrote:
> > > > > > > On Fri, Mar 12, 2021 at 05:07:36PM -0300, Daniel Henrique Bar=
boza wrote:
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
> > > > > > > > DEVICE_UNPLUG_ERROR. They were (and are still being) discus=
sed in [1].
> > > > > > > >=20
> > > > > > > > Patches 1 and 3 are independent of the ppc patches and can =
be applied
> > > > > > > > separately. Patches 2 and 4 are based on David's ppc-for-6.=
0 branch and
> > > > > > > > are dependent on the QAPI patches.
> > > > > > >=20
> > > > > > > Implementation looks fine, but I think there's a bit more to =
discuss
> > > > > > > before we can apply.
> > > > > > >=20
> > > > > > > I think it would make sense to re-order this and put UNPLUG_E=
RROR
> > > > > > > first.  Its semantics are clearer, and I think there's a stro=
nger case
> > > > > > > for it.
> > > > > >=20
> > > > > > Alright
> > > > > > >=20
> > > > > > > I'm a bit less sold on DEVICE_NOT_DELETED, after consideratio=
n.  Does
> > > > > > > it really tell the user/management anything useful beyond what
> > > > > > > receiving neither a DEVICE_DELETED nor a DEVICE_UNPLUG_ERROR =
does?
> > > > > >=20
> > > > > >=20
> > > > > > It informs that the hotunplug operation exceed the timeout that=
 QEMU
> > > > > > internals considers adequate, but QEMU can't assert that it was=
 caused
> > > > > > by an error or an unexpected delay. The end result is that the =
device
> > > > > > is not going to be deleted from QMP, so DEVICE_NOT_DELETED.
> > > > >=20
> > > > > Is it, though?  I mean, it is with this implementation for papr:
> > > > > because we clear the unplug_requested flag, even if the guest lat=
er
> > > > > tries to complete the unplug, it will fail.
> > > > >=20
> > > > > But if I understand what Markus was saying correctly, that might =
not
> > > > > be possible for all hotplug systems.  I believe Markus was sugges=
ting
> > > > > that DEVICE_NOT_DELETED could just mean that we haven't deleted t=
he
> > > > > device yet, but it could still happen later.
> > > > >=20
> > > > > And in that case, I'm not yet sold on the value of a message that
> > > > > essentially just means "Ayup, still dunno what's happening, sorry=
".
> > > > > > Perhaps we should just be straightforward and create a DEVICE_U=
NPLUG_TIMEOUT
> > > > > > event.
> > > > >=20
> > > > > Hm... what if we added a "reason" field to UNPLUG_ERROR.  That co=
uld
> > > > > be "guest rejected hotplug", or something more specific, in the r=
are
> > > > > case that the guest has a way of signalling something more specif=
ic,
> > > > > or "timeout" - but the later *only* to be sent in cases where on =
the
> > > > > timeout we're able to block any later completion of the unplug (a=
s we
> > > > > can on papr).
> > >=20
> > > Is canceling unplug on timeout documented somewhere (like some spec)?
> >=20
> > Uh.. not as such.  In the PAPR model, hotplugs and unplugs are mostly
> > guest directed, so the question doesn't really arise.
> >=20
> > > If not it might (theoretically) confuse guest when it tries to unplug
> > > after timeout and leave guest in some unexpected state.
> >=20
> > Possible, but probably not that likely.  The mechanism we use to
> > "cancel" the hotplugs is that we just fail the hypercalls that the
> > guest will need to call to actually complete the hotplug.  We also
> > fail those in some other situations, and that seems to work.
> >=20
> > That said, I no longer think this cancelling on timeout is a good
> > idea, since it mismatches what happens on other platforms more than I
> > think we need to.
> >=20
> > My now preferred approach is to revert the timeout changes, but
> > instead allow retries of unplugs to be issued.  I think that's just a
> > matter of resending the unplug message to the guest, while making it
> > otherwise a no-op on the qemu side.
>=20
> I used this approach in a patch I sent back in January:

Yes, you did.  I rejected it at the time, but the discussion since has
convinced me that I made a mistake.  In particular, the point that a
really loaded host could pretty much arbitrarily extend the time for
the guest to process the request is convincing to me.

> "[PATCH v2 1/1] spapr.c: always pulse guest IRQ in spapr_core_unplug_requ=
est()"

Although.. I think we should actually do a full resend of the unplug
request message to the queue, not just pulse the irq.  AFAICT an
unplug request on a DRC that is already unplugged should be safe
(remove-LMB-by-count-only requests might have to be an exception).

> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04399.html
>=20
>=20
> Let me know and I'll revert the timeout mechanism and re-post this one.
> I guess there's still time to make this change in the 6.0.0 window, avoid=
ing
> releasing a mechanism we're not happy with.

Yes, please, I think this is the way to go.

1) Revert timeouts (6.0)
2) Allow retries (6.0)
3) Add notifications when the guest positively signals failure (6.1)

I think this gives us the best mix of a) user experience, b) not
allowing nasty edge cases on loaded systems, c) matching x86 behaviour
where possible.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YT2EIPdXGtid7nbL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBlI7EACgkQbDjKyiDZ
s5IEZRAAmSSNzu7yq9xiMh+yrzfD3Zk/Js8UX7BoKFqcaMjhnKWAT1+1+/xXoeN/
o03h+D05vYX3ZNfQTwL25bwVMYHPTB5fADs+b0Gds5S9B1Qf5lhMDCZlbIfB9XJb
1C/x3n8Fdt20kNGGd3+1adV4aN7L4HU60BG3N1K5u2G/juoP92+VS+7DpfFu+2Ir
HXxRNfT9jCxseTsYWdqZfkrEt7toq/jXWBnfdFrBwHDhxOMirm5mUndOWPxG3esg
2orNfQx+zAC2Y04K8GlCdJSrlT0TENVv6iecada9rJm52n0fxejCKDbpHkt1GLgW
EcLflxtQH3tDRITY5qjYodxl6eJfBgtlAMDzjqkI4xnCWkqHgGZGirdDR8Bl2Shq
CPdlU2MboeliZjc77xaWDQBQ7vMYteJhDAECssDveKJuzvjnd8XUXV3EfXTV9Rav
ZjNvg0hUE1OHtDYymPxqBxRQU4hN6UUpCwChJU+mARnKaeqmElZfNMdxwM1DfAPn
2RnC2/U7i9ScoHpUZKRdrAmezbYSwVY9owN1IWig3ErpQeyJbz+szSfOxNrzNEVy
2lf2xh1v54hulPCbIykWkllpyaBUKIl415y2SkotrS8eXEmgd+uLOpuTiObIYXv+
2bx8CuRkrBbxuVbOjE5e+Q7PkDZJkh/tBQkGwdng4wxBRF9DvQ8=
=4NL4
-----END PGP SIGNATURE-----

--YT2EIPdXGtid7nbL--

