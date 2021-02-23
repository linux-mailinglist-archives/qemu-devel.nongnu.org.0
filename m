Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F7322506
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 05:54:56 +0100 (CET)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEPip-0000QI-7B
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 23:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEPi1-0008LY-Mm; Mon, 22 Feb 2021 23:54:05 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40419 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEPhz-0003r7-V3; Mon, 22 Feb 2021 23:54:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl6CC3Vwgz9sVR; Tue, 23 Feb 2021 15:53:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614056039;
 bh=kpimJTdN7GYlnHGgKfvI+GUJbPZ/tUb1zq4frzpmj0U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MD4h+pXOJ8NMxgrbOM8lTrnbLZq1V6+Poo3AfFGKTJjWcwZuIVMxRYpsCzVYLfpDe
 QZtLjoTAAXFjYQGI5an69u8DzECiP/JNj5dv7YrSYvI4SUwMG+NkeYZUXhUPMhXggY
 kXZYm0f3YOdnOuIGmSkFz6U+cS37KlEnU+zVdSlk=
Date: Tue, 23 Feb 2021 15:51:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: lagarcia@br.ibm.com
Subject: Re: Editing QEMU POWER Platform wiki page
Message-ID: <YDSJxzxjs3jJImEY@yekko.fritz.box>
References: <91874f1e-4b14-5fb1-f1ae-1225938df759@linux.ibm.com>
 <20210222120138.31f313c9@bahia.lan>
 <3c3fc3f0-afb8-1012-eaf7-11ecbe146025@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8TRNwRPpZC5XDAmo"
Content-Disposition: inline
In-Reply-To: <3c3fc3f0-afb8-1012-eaf7-11ecbe146025@linux.ibm.com>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Greg Kurz <groug@kaod.org>, QEMU devel list <qemu-devel@nongnu.org>,
 Programmingkid <programmingkidx@gmail.com>,
 QEMU PPC devel list <qemu-ppc@nongnu.org>, Cedric Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8TRNwRPpZC5XDAmo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 06:18:08PM -0300, Leonardo Augusto Guimar=E3es Garc=
ia wrote:
> On 2/22/21 8:01 AM, Greg Kurz wrote:
> > On Thu, 18 Feb 2021 10:16:25 -0300
> > Leonardo Augusto Guimar=E3es Garcia <lagarcia@linux.ibm.com> wrote:
> >=20
> > > Hi there,
> > >=20
> > > I would like to edit the wiki page at [0] as it contains some outdated
> > > information. Could anyone that has access to the wiki please help me
> > > create a user so that I can edit it?
> > >=20
> > > 0. https://wiki.qemu.org/Documentation/Platforms/POWER
> > >=20
> > Hi Leo,
> >=20
> > User creation isn't publicly available to avoid spam : only an existing
> > user can create a new account.
>=20
> Yeah, I saw that. That's why I asked here.

The other concerns raised in this thread are valid, but those
notwithstanding, I think it makes sense to let you update the Wiki if
you have the time and inclination.

I have a wiki account, and I know who you are, so I've created an
account for you.  Credentials to follow via private communication.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8TRNwRPpZC5XDAmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0iccACgkQbDjKyiDZ
s5L8vw//Qkn+94CymEQ3AsIygty/6obXHJzDu2Fnl+khvCZVILalXqESNWXBzjWU
wz/f08/zYzqsRZecXXHPNZmTllc7K1HsL+GBGz4QE4nKpw/zREa18MMmKEoSTl1U
6M9vQ+drlAYqMCV0NgLHwkWWodQq3OdGQXXxFrxpTLXpehP8yQkNAQMSpmkK4gur
1APa5hkf+2dzLPHbwSDYAGlBsaPpi2COgMMk+VoDGlxuuoGATrsMcQicP246r9ZI
+Yv1k8cnc/KrT7Y1iqyJPXIBiTw9Tmf/n81DyQ/5+fB32r/WGPgHOXZtLeDihRTr
Cc71dLhwD65xLk8NLJzSOj/SFQKnljJcBtqssvjJ1gDgDSZHC5UbAjmZ5Ivzylbr
ooHPG7vbCMDrrjM1cJ+LbaEzhTR0NYpm38gOZNBd14mhKMq1XKPKSzKQaJtdUV7n
DExA02qcUBco4DaE4DwuduL/cHWNiT0IwhnTS9Xv4fOUXGSM2BFKtJnwPElT32Yk
QpchHcOOy2D4AJfRkXGdJUsiCreAKbZo5iiaCca1ewBwcpZenF3cKj6Lpgls4xKM
4sCtxecwqAvrocbgZ6vq27tqWr2g25x4QEXBOrOLcLQvNP8YYXdstuexeFQANq1F
Eqpk5/Cp4yQBGDsHQXM8dGtQjXEUTzwQgVjPkKyRpl2Wmi1vk9U=
=yuEp
-----END PGP SIGNATURE-----

--8TRNwRPpZC5XDAmo--

