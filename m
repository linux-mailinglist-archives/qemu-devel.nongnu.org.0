Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A961F2D6D68
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 02:25:46 +0100 (CET)
Received: from localhost ([::1]:50738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knXBp-0005Nm-Mm
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 20:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knX3E-0000Ln-Gc; Thu, 10 Dec 2020 20:16:55 -0500
Received: from ozlabs.org ([203.11.71.1]:43575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knX3C-0003us-3c; Thu, 10 Dec 2020 20:16:52 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CsXtj11PWz9sWS; Fri, 11 Dec 2020 12:16:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607649405;
 bh=t1cbpdA7/010W2itxE6GbbDbRTGUJmm/HFmzM9UPEgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nml182S2ewTkOmqfymusDshvdxa6IRptOdWLkG2jfabJ7TZ8Cq/IzPh/yJTR9Y9Nh
 2gSBAbFuZqTn2aKY5GxOMxh/iggJtjrTjASqOCe/e/aq7DVbxoyyUF9vtxenz4v0Xq
 piOV7L22HM2Hpz1LMLIB0ffGg5lrH8mxZqlhWXrI=
Date: Fri, 11 Dec 2020 12:08:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [Bug 1907427] [NEW] Build on sparc64 fails with "undefined
 reference to `fdt_check_full'"
Message-ID: <20201211010849.GC4874@yekko.fritz.box>
References: <160750521215.10480.16469807239042219779.malonedeb@wampee.canonical.com>
 <8b7b0f87-c0ae-1fe7-b4d3-16111ed3d956@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline
In-Reply-To: <8b7b0f87-c0ae-1fe7-b4d3-16111ed3d956@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bug 1907427 <1907427@bugs.launchpad.net>, qemu-devel@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 09:00:41AM +0100, Thomas Huth wrote:
> On 09/12/2020 10.13, John Paul Adrian Glaubitz wrote:
> > Public bug reported:
> >=20
> > Trying to build QEMU on sparc64 fails with:
> [...]
> > /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_hcall.c.o: in func=
tion `h_update_dt':
> > ./b/qemu/../../hw/ppc/spapr_hcall.c:1966: undefined reference to `fdt_c=
heck_full'
> > collect2: error: ld returned 1 exit status
> >=20
> > Full build log available at:
> > https://buildd.debian.org/status/fetch.php?pkg=3Dqemu&arch=3Dsparc64&ve=
r=3D1%3A5.2%2Bdfsg-1&stamp=3D1607502300&raw=3D0
>=20
> Looking at the build log, it seems like your system libfdt is version 1.4=
=2E6.
> However, that fdt_check_full function is only properly available with
> version >=3D 1.5.1, if I get that right.
>=20
> As a workaround, you could try to run the configure script with
> --enable-fdt=3Dgit (or of course update your system version to 1.5.1 if
> somehow possible).
>=20
> But anyway, this also means that the check in the QEMU build system is
> likely wrong. But it's weird, I can see that we explicitely test for
> fdt_check_full() in the meson.build script, so no clue what's going wrong
> here. David, do you have an idea?

No, that's rather odd.  More of a meson question than it is an fdt
question, I think.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/SxqEACgkQbDjKyiDZ
s5L4rRAA0ffAIwFcxuaG9N1o/JSUgVJTWGgvndJxDbhv4RE7FYsfJYJiO6S4+qdK
AdTEIc7BR5WHOkGyMBdxfPFGECYgnE4eIA6SsZ8Vj2dn0mCJzMlIj3LNCog3zrGE
/3VyVMhECitOCjrx5ACK72jb84/NJsZKIiC5iaYGRYrUEvCaxkGf7rO4IZ7pg130
xnNFtbGEBoxiyRgm1BsObiimXMPobiGNlH4puBYo7bs0SyGvLpJUCcnGluL7OnqS
cUDpi9ALDWByk2rT6O+xM7eBjZac8/mb4nWC6ikOsoAZB3QeG4hwwIWbSQV8dm7c
VbIy4g1u/0QNQy9NeJHBXXAwjWB3HhC+bzcqtYKs5Ku4Xk/1OYJ8AOi6wQrjwARW
WNno+6y/dHmhIn+F7t3aSUTZTFB3G+hyASIM8ze/N0a/srC3O24tiRLXFhhOJkXM
zgo0JWOIxJbFgwypTGROeNV4BwkZ1UMB0ZUkSSb2+N8Xgd6c8j4P2tHfV09z6miq
+6Asym6s9FB9JJ5BYR2dtWoH/FzRuD79YKCzeN5f9074pgW0JVn5vapYwDmu0V81
uMJqlqq4qt59bNW8OXmWjbWU9dxgmsdsYP44RmTcy/IjJ5XRJOv5LA0O2UNtC80M
M5EEhBYlKOfK7HzDSk0MDUCWil5hGZyNZlWf0c1h4eaPq8a6fJ0=
=yURD
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--

