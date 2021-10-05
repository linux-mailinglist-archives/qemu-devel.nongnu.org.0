Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3714421B73
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 03:09:57 +0200 (CEST)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXYxw-0000tb-OD
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 21:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mXYtc-0007HZ-B6; Mon, 04 Oct 2021 21:05:28 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:49787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mXYtX-0003XS-4p; Mon, 04 Oct 2021 21:05:27 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HNfWx1rbNz4xbc; Tue,  5 Oct 2021 12:05:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633395917;
 bh=tIni+qAj7UQ4VAJySozKEk6WZGOgVHuNapUK0k6wn3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=octtrqa7eXHLBJ/qSs0Qa8/gyRhDhcxwEz0qgx4Y3IraCmLebA1tsQkPB9hJppcM6
 dUZ5oMQltmYg6StAW89U5mxLEhsozJ+3IfkiY3RulU1rRdWFWCiblW1/UMT5MtB9br
 8i9teC0G1RNjk+FvQOuHQ5O32o37Way1vC+5fgDg=
Date: Tue, 5 Oct 2021 11:48:46 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Message-ID: <YVug7l8LWl3e+DN5@yekko>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XzI0UvU6oY9y8pZL"
Content-Disposition: inline
In-Reply-To: <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XzI0UvU6oY9y8pZL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
> On 01/10/2021 15.04, Christophe Leroy wrote:
> >=20
> >=20
> > Le 01/10/2021 =E0 14:04, Thomas Huth a =E9crit=A0:
> > > On 01/10/2021 13.12, Peter Maydell wrote:
> > > > On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
> > > > > Nevertheless, as long as nobody has a hint where to find that
> > > > > ppc405_rom.bin, I think both boards are pretty useless in QEMU (a=
s far as I
> > > > > can see, they do not work without the bios at all, so it's
> > > > > also not possible
> > > > > to use a Linux image with the "-kernel" CLI option directly).
> > > >=20
> > > > It is at least in theory possible to run bare-metal code on
> > > > either board, by passing either a pflash or a bios argument.
> > >=20
> > > True. I did some more research, and seems like there was once
> > > support for those boards in u-boot, but it got removed there a
> > > couple of years ago already:
> > >=20
> > > https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
> > >=20
> > > https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
> > >=20
> > > https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
> > >=20
> > > > But I agree that there seem to be no signs of anybody actually
> > > > successfully using these boards for anything, so we should
> > > > deprecate-and-delete them.
> > >=20
> > > Yes, let's mark them as deprecated now ... if someone still uses
> > > them and speaks up, we can still revert the deprecation again.
> >=20
> > I really would like to be able to use them to validate Linux Kernel
> > changes, hence looking for that missing BIOS.
> >=20
> > If we remove ppc405 from QEMU, we won't be able to do any regression
> > tests of Linux Kernel on those processors.
>=20
> If you/someone managed to compile an old version of u-boot for one of the=
se
> two boards, so that we would finally have something for regression testin=
g,
> we can of course also keep the boards in QEMU...

I can see that it would be usefor for some cases, but unless someone
volunteers to track down the necessary firmware and look after it, I
think we do need to deprecate it - I certainly don't have the capacity
to look into this.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XzI0UvU6oY9y8pZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFboO4ACgkQbDjKyiDZ
s5IQjBAAxj3a/bpzmKpcz6KC13su/tQWZx9CnZPgThvtCjzlxI5L4IYHIl+CqCcX
M6mX13Q5vefHgmxL8ozfLV/a8Xb1GoLIiA0+g7MYL9BhvhIFSgAb/D7V5dwIK3Bi
mIqEZUCAnXmNfODt5VjujmXhoX6Pj4AMEvZSP93tBQPZhiHUvTGTkBC2hGMQ4PRD
k1GA/IN5xR+/p6h8CH8ujOkzH1caURjkhQU8UJQFAu2OjjgE3DZEhHwg3Vd3Nb5C
F6166maBYYOwt2910ZhmVsmhn8VBBYYgQk+cBCxYttk1rcTDadzZJZ4BOEsXprmt
kWoDv5/XS3j8eeHfDYEtmyKFC9MIu3fOsaAskyRvtMN9AKuxoFKzFXad+mmTZ6VQ
Puzr8AdckSZYHlxKIHI0nKeegxhJoTiMWzPzk5TPMWvpZtn5w5wr+K6B0HMcAEm0
2nWzPGoKdIha+PeqnhYAebNUQKRDDQnIb5Cp8lOc8M4t33cTmtp9Y994Lmjw37Y3
dSVQKCxieFb5hFd5z2FoBnjE7uk4plfC4wEN+th17vjNPug3C5HjWc/MPBSGLBye
/BT9nG5xt2zfFKn0hY0Iz9bU2ooS0TxVlf2pfgah5sDUm0rBr3+t7xmVNT80xQye
zNxlZUOIT4nfwV+n5yor7jTIZWqJxksRvqDgE3S+6QXhjrMFpZw=
=F0Mt
-----END PGP SIGNATURE-----

--XzI0UvU6oY9y8pZL--

