Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18176410F42
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 07:15:07 +0200 (CEST)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSBdw-0007Hp-Te
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 01:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSBWg-0002NE-GI
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:07:35 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47855 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSBWa-0008Gy-AD
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 01:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632114436;
 bh=wq6NksA/Us7YvIieQ37yYQsbqqjwGZZLHTTx5/uOaBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PpaOWi+j0zcJKjh1Y8LvEywps0tvmbM0vuuLxBxXjswgWNsL9fqWG2hVFjmu54qAn
 xCgBTGaezQHSY+54AlCKSiIUGT9D0V0sxd5KIBUc9iBiAa6SQRct3MoPEr8rZPpOQS
 8II7A67XDSGZL0Bu4RwMuHu1AHb9cvenlnGuoVeg=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HCXc46HL5z9sX3; Mon, 20 Sep 2021 15:07:16 +1000 (AEST)
Date: Mon, 20 Sep 2021 14:07:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Brad Smith <brad@comstyle.com>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUgI/xtQmWjfTSvq@yekko>
References: <YURYvaOpya498Xx2@yekko>
 <17abd023-4477-4636-a87f-ccbdeffdb4b8@comstyle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LPT1g8kaNLIik3MH"
Content-Disposition: inline
In-Reply-To: <17abd023-4477-4636-a87f-ccbdeffdb4b8@comstyle.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: peter.maydell@linaro.org, slp@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, f4bug@amsat.org, hreitz@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LPT1g8kaNLIik3MH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 19, 2021 at 10:23:21PM -0400, Brad Smith wrote:
> On 9/17/2021 4:58 AM, David Gibson wrote:
> > Hi all,
> >=20
> > At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> > whether Rust supported all the host/build platforms that qemu does,
> > which is obviously vital if we want to make Rust a non-optional
> > component of the build.
> >=20
> > I've added the information to our wiki at:
> > 	https://wiki.qemu.org/RustInQemu
> >=20
> > TBH, the coverage is not as good as I expected.  Linux, macOS and
> > Windows are pretty much ok, with the exception of Linux on Sparc.
> > There are a lot of gaps in *BSD support, however.
> >=20
> > I've included some notes on where the information comes from, and some
> > uncertainties in there.
> >=20
> > I've made an effort to get the information correct, but double
> > checking would be appreciated.
> >=20
> > I haven't yet looked into the packaging situation for the Rust
> > toolchain on various platforms and distros, but I still intend to do
> > so.
>=20
> Regarding this entry on the Wiki page..
>=20
> "I think OpenBSD lacks mips32 support, but the presence of Loongson means
> I'm having trouble pinning that down with certainty"
>=20
> That is correct. Our loongson port is mips64el. OpenBSD only supports
> 64-bit MIPS.

Thanks, I've updated the page to reflect that.

> OpenBSD currently only provides packages and host tools for aarch64,
> amd64, i386 and sparc64.

Sorry, I'm not clear on what you mean by this.  Do you mean OpenBSD
provides Rust packages and tools for aarch64, amd64, i386 and sparc64?
Or some more general statement about openbsd support for those
platforms.

For purposes of this matrix, I'm considering upstream Rust support,
not toolchain packaging (I'll be looking at that later).

If you do have rust packages and host tools for sparc64, that would
imply support is better than shown on
https://doc.rust-lang.org/nightly/rustc/platform-support.html which
notes 'sparc64-unknown-openbsd' as having "unknown or WiP" std library
support and no support for building host tools.  Does that page need
to be updated?

> So for the Wiki armv7, MIPS (64-bit), PPC (32-bit) should be changed
> to N/A.

https://www.openbsd.org/plat.html lists armv7, mips64
(loongson/octeon) and ppc32 (macppc) as supported platforms.  Is that
no longer correct?

> The SPARC (64-bit) entry should be changed to yellow.

Can you confirm that your Rust port has full std library support and
can build the host tools?  If so can you talk to the Rust people about
updating their page?

> I'd like to fill in the gaps for arm, mips64, mips64el, powerpc, powerpc6=
4,
> and riscv64.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LPT1g8kaNLIik3MH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFICP0ACgkQbDjKyiDZ
s5KtcA/4+gUuONt8OM/kFsxWzwDKW27EBsT/0ACZitkgxMevA0yvp2HJw5DdMP/1
XpBBOySz9b6ukb6DucAXYO21OxsE8onv9MiGoTHlKuzpOvYwOtNi83BPKS7PlQfQ
72Oh2m9YOV5q2iGBirIse8iXyPfdOjAkiIejcdi1TFtLZ8mL/SFjWqB3fFWfafhC
cow7CLFr+SkhbEPpuiIcBVwLB/gSfXK84x5SuujSR95QLSH5iHnB3+Gss7ySXVYw
a2f6I76AHYDwTUZ5SXy8iY6H46GpmCM0e0kf18s9WN5La8nwWIO+3oib8lnp53aA
l7JklyjmC5JuHnqoZsZlHoTBXgh8EF1rwUFRC3ZhdQ/i+nW6fuWnHPgPuK5djLbf
/S+h5b7NiuV84Oysj0iMWtiG9abomFZcGGJaZ4q+nqjwuvt5bnaQmDnGpKXKADgL
ILXvqEMCyZ1lKOPUBm8AtOH2jOS905gT5nIz0E/ryg0WdWfoOekPHqk4PrPgJpiO
ilK8uvnNsNbGoeM4r7d5XgBC3uTWBrVDONivM1ArS7N2WQkB4bMsuC6pkm30BKuH
Uu931gSyF2vxz0Aknf8r3+TeqaYik2KwymU49DgMdY8PEc9sr5TG93ZsJV8eJaSr
Fw3azehezfb8rFekWs8qv9k+WomHiPZWDcSE4bCCt4/FEevOJA==
=c8PC
-----END PGP SIGNATURE-----

--LPT1g8kaNLIik3MH--

