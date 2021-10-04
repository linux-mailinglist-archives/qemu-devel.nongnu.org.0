Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C59421A69
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 01:04:09 +0200 (CEST)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXX0C-0001pj-4W
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 19:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mXWwe-0000lh-Gp
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 19:00:29 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mXWwb-0001Zc-24
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 19:00:28 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HNblc6PL6z4xbb; Tue,  5 Oct 2021 10:00:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633388412;
 bh=iLuVpV1RnidjNyGIhUg/Pl7i3ZTpgdRuq/LeLfrLG44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LwSrf0oqsiRs7PzKj5NJunlP1MVobrB/c/w0r9C3gcewiyYJSIzX0CrJiKOupfKGu
 CmJ0L0oGoZ980+lPc5nRBQsFRY9+H++2zi+N0fkjZrgBLxUto9TmVfUymGXF7iEUDF
 X9RW4hFPST8K1DSNgCXMSC8YGwdJlTYFbBQL9dEk=
Date: Mon, 4 Oct 2021 17:01:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Rust in Qemu BoF followup 2: Rust toolchain availability
Message-ID: <YVqY0iYZeQ5BSZjF@yekko>
References: <YVUaDrf5BXPkZu5r@yekko>
 <CAFEAcA_ibRiKmXvo3CDOvLundowVWr3uPKWbkegh95U+d-zfMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BqNTYKRE9bnLxehG"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_ibRiKmXvo3CDOvLundowVWr3uPKWbkegh95U+d-zfMQ@mail.gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Ed Maste <emaste@freebsd.org>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Brad <brad@comstyle.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BqNTYKRE9bnLxehG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:30:20AM +0100, Peter Maydell wrote:
> On Thu, 30 Sept 2021 at 03:21, David Gibson <david@gibson.dropbear.id.au>=
 wrote:
> >
> > Hi again all,
> >
> > I've now done.. or at least started... the second part of my followup
> > from the KVM Forum BoF on Rust in Qemu.
> >
> > I've extended the page at https://wiki.qemu.org/RustInQemu with
> > information on Rust toolchain availability.  However, I found I had a
> > lot more open questions on this one, so there are quite a lot of gaps.
>=20
> Thanks for doing this work.
>=20
> I note that we have a new host architecture loongarch64 currently
> circling to land. It looks like this is in the "Rust does not have
> support for this target" category at the moment.

AIUI this would be the new Loongson which is no longer MIPS
compatible, yes?  If so, then yes it appears not to have Rust support
at this time.

> > In particular:
> >  * I haven't so far figured out how to definitively check package
> >    information for RHEL & SLES (they're not covered by repology, and
> >    RHEL module structure confuses me, even as a RedHatter)
> >  * I'm not at all sure what criteria to use to consider something as
> >    having "good enough" rustup support, so that information is all
> >    blank so far
>=20
> I guess the answer here is probably "if it has at least the
> glibc and kernel minimum versions that are documented as
> required for the target-triple in the lists at
> https://doc.rust-lang.org/rustc/platform-support.html then
> that's 'good enough'".

Seems reasonable.  I've updated by table based on that criterion,
though for now I haven't considered architectures - basically if the
distro matches the criterion for any architecture I've marked it as ok.

> >  * I've taken a bit of a stab in the dark about what Rust version is
> >    recent enough for our purposes (1.31.0).  I strongly suspect we're
> >    going to want to move that to something more recent, but I don't
> >    know what, which will mean revising a bunch of stuff
>=20
> Hmm. The more we feel we need features that are from a new
> version of Rust the more nervous I get about whether this is
> really something we want to jump to just yet. 1.31 is less than
> 3 years old, which is pretty recent in the context of QEMU's
> own distro support policy.

That's a fair point.  I could be wrong about that.  I'm pretty sure
we'll want Rust 2018 edition support, which is why I used 1.31.0 as
the cutoff.  I know there are a bunch of things that have been
stabilized since then, but I don't know off hand of anything specific
we'll definitely want.

> >  * I'm not really convinced that the way I've formatted it is
> >     particularly good, but I haven't though of a better alternative.
>=20
> I guess we might also care about the CPU architecture per distro,
> in that even if old version X of the distro supports architecture Y
> and rust today supports architecture Y, that doesn't mean that
> distro version X's shipped rust supported architecture Y.
> But we can probably reasonably say "use rustup" if there are
> corner cases like that.

Yeah.. that's where it starts to get very confusing.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BqNTYKRE9bnLxehG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFamM8ACgkQbDjKyiDZ
s5L5DBAAlqMtV494wkCfNJ1Ep3uILiI3gwz8GK5HL9MxeU/S+tHJuBBjXjZ+p9oq
LCCvY+NteEsMOiT8MUtgjk0sNOhlpUQ+fngMLzdvlMj9aUx6v+KP13ANtibZYmBG
VK9oHkrr0lHo99uyLVp9OkzPhALsMRKQNtdGu4MuGVnb8fq/anGcNvw0LNDhtAaC
IVU+WZUezkTPXcEdXS9wV0bVRNg+GsP/6i0bhL7buEjfFLNK3rcRVGVUPzyiaPLv
IExqfIKZNfaKgqT11ShQThVi6hLyxeoYLwYl3Zg9EZLRAgiknoQNhZGCN3pbjjmi
nsK/Ir/O0q7B1dAFi8hQzeguhootUqJ35VnAcQSwdWN/AMieW3ZEEuT8qGVVBgZk
JC7wN9MZEpI2LUOSF9yiBj/z4s8pY4vEyLkJJotyrF9A0mT1DWAp46FI36H4DTif
5tjeKN6JpCvGR1tqXsbqA1aIPX32YGGUo5CnQRHRl6z06bBLYByFnxXwBH/YwOxp
pnAQVLrFT/HjuAI1u8dusUIKRxdz+rC8V2wHRzibbPGJNZfT291b7Mr6raCcO7ep
KOGOtVQR6Zg6KNE6IcYJb0M+tD6L82Pe13H39r93kNtsgr6dh/dncBzCANsa6105
Hqd2RkX5EScHXmoD9hhmSVYkdwSG4KljEStxiJ7XxMkOBsHcenI=
=kTLt
-----END PGP SIGNATURE-----

--BqNTYKRE9bnLxehG--

