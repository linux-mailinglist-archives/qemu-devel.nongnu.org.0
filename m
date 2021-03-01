Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7879D3277A0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 07:30:32 +0100 (CET)
Received: from localhost ([::1]:47356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGc4d-0002RM-8w
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 01:30:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGc3F-0001XR-3W; Mon, 01 Mar 2021 01:29:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36475 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGc3C-0004Uu-D1; Mon, 01 Mar 2021 01:29:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dpr221l3Dz9sR4; Mon,  1 Mar 2021 17:28:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614580138;
 bh=Kc34MOdESaleiTo/oS9mXUVbDlHKjmwfQ60Yq66uLnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Va0vmLMjkGp61TjrNeK7KKMZecQRwCz1I7uNL3ATeYsmfjtUSSR2zd7LHwzj2cBya
 1pj6yIrbQpBSH7tzWZ/0xnaWH/pwQrV+3O+k90ThF4f7mcUnAEi4pc7kWH7tj43Kqs
 oyiIyZWhWpwh6vWRyWMRE0bfcpaiwFFlbvNuGPdc=
Date: Mon, 1 Mar 2021 14:57:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/ppc: e500: Add missing <ranges> in the eTSEC node
Message-ID: <YDxmEe8KPVE4qgtI@yekko.fritz.box>
References: <1614158919-9473-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmW2HNpx1J5QGMixEcX8jD4VjaCByMtG=+Mtg-ZpTsL5pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b7SNQgnSCUvgxxZe"
Content-Disposition: inline
In-Reply-To: <CAEUhbmW2HNpx1J5QGMixEcX8jD4VjaCByMtG=+Mtg-ZpTsL5pQ@mail.gmail.com>
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--b7SNQgnSCUvgxxZe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 28, 2021 at 03:02:32PM +0800, Bin Meng wrote:
> On Wed, Feb 24, 2021 at 5:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The eTSEC node should provide an empty <ranges> property in the
> > eTSEC node, otherwise of_translate_address() in the Linux kernel
> > fails to get the eTSEC register base, reporting:
> >
> >   OF: ** translation for device /platform@f00000000/ethernet@0/queue-gr=
oup **
> >   OF: bus is default (na=3D1, ns=3D1) on /platform@f00000000/ethernet@0
> >   OF: translating address: 00000000
> >   OF: parent bus is default (na=3D1, ns=3D1) on /platform@f00000000
> >   OF: no ranges; cannot translate
> >
> > Per devicetree spec v0.3 [1] chapter 2.3.8:
> >
> >   If the property is not present in a bus node, it is assumed that
> >   no mapping exists between children of the node and the parent
> >   address space.
> >
> > This is why of_translate_address() aborts the address translation.
> > Apparently U-Boot devicetree parser seems to be tolerant with
> > missing <ranges> as this was not noticed when testing with U-Boot.
> > The empty <ranges> property is present in all kernel shipped dtsi
> > files for eTSEC, Let's add it to conform with the spec.
> >
> > [1] https://github.com/devicetree-org/devicetree-specification/releases=
/download/v0.3/devicetree-specification-v0.3.pdf
> >
> > Fixes: fdfb7f2cdb2d ("e500: Add support for eTSEC in device tree")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/ppc/e500.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
>=20
> Ping?

Sorry for the delay.  Now applied to ppc-for-6.0.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--b7SNQgnSCUvgxxZe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA8ZhEACgkQbDjKyiDZ
s5I1IQ//WXmJW+8BNzX4XYU5Lehjd/37O0xZjmyemXq34UZpQdgmclQYTsftDotJ
+j3x5lyW13a9E1tO/dESIavAa4oOyQsZQryP5/ata3a2KgGKkBbeytVz6NTG3xfm
06e7jmLYDnQk7+nwwb2+9Z5F9WGudoU4nS/oiV9QymotSNYyAM6Y8zXmmnDDjk5d
0e4yZhFYPJBlBcFdoSA5YYxVr8nCKTudribuubdNdNA/blVumRrQlOwXlqUB12+D
Z/zUsYFAcorXHvdpMKMko2jPy91b+s0k7zKxuNiqZsbb0O2i45q5Um3BBe4JKVCa
ueopztUwVk+wbnHCQDmfSbN2HFyB3tdidbmiPwg0sd57KbUsffIvWBoDp/4FKCJX
bIin4k52ZVmdwODeCowe45oxr2Erv6ofD2O/Zfb4HLTE5bByHk639jJplAUf6UGf
0ftAuB7CEuWFY/EJNaKqpc4UvtrDJKBZm/5ponFp6dqKXsN91eucRa5FZvwoFEEd
t558MUzAYJx8sOmN5vEUyajXlaPbKdHGfS5c44PuCPbu0Q7JySKFA3tUiMJyGAGn
4LfukDTtnAyATZIjvQwlgrMjYoCpHUrveKu06GNPqycPZ1C8ie7t1W7Goxjg6/aY
czdpGwodIl9T/6b6Mw4nPYfl8r+msogqE2YoEJzP7qHIiEPUcFw=
=/ehf
-----END PGP SIGNATURE-----

--b7SNQgnSCUvgxxZe--

