Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB971D2885
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 09:08:31 +0200 (CEST)
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ7yo-0001kd-Ej
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 03:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jZ7y3-0001Eq-SO; Thu, 14 May 2020 03:07:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57127 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jZ7y0-0000Ev-PI; Thu, 14 May 2020 03:07:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49N2fs403tz9sV7; Thu, 14 May 2020 17:07:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1589440053;
 bh=Euu4Vfp3gzQ4akXFKPrt504IH7e4adsAFUStfHlTnNI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lh06XqdqRpv4PsCpYWc4YJbLGSIPJhg0fXAPaWLyltFEo1xV2gYlWHlScuzeTVd8P
 efJWk5YEQ2zO4iiXeJu3TJEzhxHWeHafhOYJ/SjXbF++wC+S1nhc02RZfcZ2CYWvIs
 A4iaXl4R1EPHoPdtTtAoBUaTxYf+kW7irchgltEc=
Date: Thu, 14 May 2020 16:52:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 0/6] target/ppc: Various clean-up and fixes for radix64
Message-ID: <20200514065249.GC2183@umbus.fritz.box>
References: <158941060199.240484.5620994992064687533.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IFrzt5yFNjsAZ17G"
Content-Disposition: inline
In-Reply-To: <158941060199.240484.5620994992064687533.stgit@bahia.lan>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 02:41:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IFrzt5yFNjsAZ17G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 12:56:42AM +0200, Greg Kurz wrote:
> First three patches of this series are simple cleanups. The other
> ones fix some regressions introduced by Cedric's recent addition
> of partition-scoped translation.

Applied to ppc-for-5.1, thanks.

>=20
> Changes since v1:
> - fix build break in patch 3
> - introduce guest_visible argument in patch 6
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IFrzt5yFNjsAZ17G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl686sEACgkQbDjKyiDZ
s5KnQg/+JI/QlYizaqkdUpZYQ8R0EE/OB/ux3Gu6jHO1FsEqqGk7he9IUEGq01WD
HtAPFFVHbLFCryQXGNWM6k7AjAuxhpdDyxMDSclUUgaJZn0wkp/kj3mpNb96NdYq
m1sBVKSdrkwxx7lzKq8UmfRUtvd66pzHi9KylFR8q2uQdTrQuHU22DuWnNv0iENT
dVobA+Q1cTLv8p6iPtqLF6LsH0lX4OhjqgOs8cqFe6wcm0FKhlK+Iu/WTiLONtPL
WvS48c4NAqho2QjXe5d7EGWim0KnKHH7/Fi5Sq/foJOjlzJGmZiRXrFtq8a5kk8G
8LWO+vm8RjtW4UQDOj6r4VHaFu2tiAXkFG+yVolGbuxbsXhFCbKr5xOU6XOGszbs
Ly3ybrs0ky9mLyO6kRIQQnTO7QKCvYsoKloEFrK9tW0SFa4/BjaUbjHTII0TY9MX
M9uI3mxBq34ugOEjzQ+hk0OjGxqalkh04fZWZjgE7IHAc4IkYoONXAGE7oHWpQGM
zYNhZF7Q9tqS6+3on8+jA1SztPCD2m9MJe/4+itWBjDKn4ZVyqWnFw6QlMGUwlnJ
Z+dgO9k3+8MSRD7N0oiLFu1RSkGbw9yYaesn3aRf018/hTyOIoUZHi6TDWTY5ctO
7mEZjWlN4BB5AMXWORxbr3j2aNR27KYiZH43cOpF5ZBsLCtiWLM=
=dmhB
-----END PGP SIGNATURE-----

--IFrzt5yFNjsAZ17G--

