Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F74901C4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 06:57:08 +0100 (CET)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9L0s-0000ve-4w
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 00:57:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9KwL-0008FD-37
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 00:52:25 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=39153
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1n9KwG-0003cP-Hh
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 00:52:23 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jcgz23SmGz4y4p; Mon, 17 Jan 2022 16:52:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642398734;
 bh=jPgPa/3C5eJzPdQ6VnWmYlA7OKu9D8y6Q/6AednsbLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HN7pR2fTzwVXB1YI4LlIywTTzFTBabmiacIR56n1EtvSqtBg4q2PoAl9epINGaA0l
 BGRYBTqmTLiFPAkOJ0j96fzeQKWAtnaUyO+yKejjo4GL+Xt9CjSuPcTr/xzgnK7M1W
 0JezLdAz9cAxx5US7YeJLvn1Myn4bcZvawpOInqE=
Date: Mon, 17 Jan 2022 16:52:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: ppc pbr403 vmstate
Message-ID: <YeUEB0lb7mhuoP6G@yekko.fritz.box>
References: <YeB0zGRC/ct8DAzM@work-vm> <YeC4xYrYhdAKKwTx@yekko.fritz.box>
 <a2b11256-5afe-42de-ffb3-dad07c8165b3@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Mt3Q5cHslURdrfBc"
Content-Disposition: inline
In-Reply-To: <a2b11256-5afe-42de-ffb3-dad07c8165b3@kaod.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, peter.maydell@linaro.org, quintela@redhat.com,
 qemu-devel@nongnu.org, danielhb413@gmail.com, groug@kaod.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Mt3Q5cHslURdrfBc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 08:07:21AM +0100, C=E9dric le Goater wrote:
> On 1/14/22 00:41, David Gibson wrote:
> > On Thu, Jan 13, 2022 at 06:51:56PM +0000, Dr. David Alan Gilbert wrote:
> > > Hi,
> > >    Is there any easy way of getting a machine where the pbr403 vmstate
> > > would be generated?
> >=20
> > The condition in pbr403_needed is...
> >=20
> >      return (pvr & 0xffff0000) =3D=3D 0x00200000;
> >=20
> > .. which looks to be the PVR for ppc403 models.  That makes sense with
> > the section name... but not so much with the fact that it's under
> > cpu/tlb6xx.  The 6xx MMU is basically unrelated to the 40x MMU.  But
> > it looks like the vmstate_tlbemb might be shared between then, because
> > of bad ideas of the past.
> >=20
> > But in any case, we already dropped what little 403 support we ever
> > had - there's nothing with that PVR even listed in
> > target/ppc/cpu-models.h.
> >=20
> > So I think we should just drop it.
>=20
> yes. But we can not remove env.pb since this would break migration
> compatibility, correct ?

Only if it appears in a migration section that's actually emitted by a
supported machine type.  As far as I can tell the only section that
does that is vmstate_pbr403, which we're also dropping so we should be
fine.

It is also touched in the *super* old cpu_load_old.  I suspect we
could probably just drop that completely, since I don't think we
realistically support migration from a version that old anyway.  But
even if we don't want to do that right now, we can just replace the
reads into env->pb with discarding reads and we'll be fine.  We don't
implement any cpus that actually used those fields, so we can ignore
them in the migration stream.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Mt3Q5cHslURdrfBc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHlA/4ACgkQgypY4gEw
YSLBbhAAviwxKV8eLFCfmTH69R5OfDikqhWe8PEC72cOwGtvGRJQGh/gLMEWjy4s
p2LOR667iqoAmfA7HpmbAk5ScutJYbUlwHhaU66IHAkRg/uRUP09GkgbZ62WufgO
hRftKxIaDOyH75d4LT032iBIxRnap1jNB3btSgMaS5M+02Swy6dehZVtUetxWpOR
2q+86TBU96FNhOMJtb+VrrH5O9E+GztHxZNjx/n2sB1pyqzyBS1tjsQ3GI11YYrG
rdk4WWdZdombdYC/PKsd6A0noNH0ALu0CUvMDc+mew1mwN2aTnnQV4CKt55Fi28q
NUlssG02P1KYQjxAG2BjFKDECJaT79AQ7x7IKoNexJ+1OGwak+HNd8NaPdRX7emS
g3Zid4t2eEXPvkqpWs+e8B1bl/J1g/FchzKLgb9Pc91SqoQ/9tgS1RjUlfvxSaCg
qBgVEniKmanyG3HczFVWXHUrG9xqW0wd2wYi6HlsQCZPYTNlI+1VFY8bVE20LdJI
394JBEXjkBGyAo8CvtzYhI0EG710u3W/TgLfbEskh1J2SNTy+wOKqwHpW00uhXZv
ycXjWEf2t3Wa7c4Al2E1vQpfsuwNVOj/WhLhQQNfuj0ool3VlZjJOKhrNXC6clRs
YCdOIWbYBwT7UZCbyFRGzJgUggkKvJj6blyc6IHxJlSU37HttxU=
=KTkm
-----END PGP SIGNATURE-----

--Mt3Q5cHslURdrfBc--

