Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81A15F7F45
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 22:51:14 +0200 (CEST)
Received: from localhost ([::1]:43166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oguJL-0003c6-1Q
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 16:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1oguHM-0001IK-P8
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 16:49:08 -0400
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]:46701
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1oguHK-0002Hn-8p
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 16:49:07 -0400
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org, WANG Xuerui <xen0n@gentoo.org>
Cc: WANG Xuerui <xen0n@gentoo.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Joshua Kinard <kumba@gentoo.org>
Subject: Re: [PATCH] linux-user: Fix more MIPS n32 syscall ABI issues
Date: Fri, 07 Oct 2022 22:48:43 +0200
Message-ID: <4793634.31r3eYUQgx@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <20221006085500.290341-1-xen0n@gentoo.org>
References: <20221006085500.290341-1-xen0n@gentoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4451015.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4;
 envelope-from=dilfridge@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nextPart4451015.LvFx2qVVIh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org, WANG Xuerui <xen0n@gentoo.org>
Subject: Re: [PATCH] linux-user: Fix more MIPS n32 syscall ABI issues
Date: Fri, 07 Oct 2022 22:48:43 +0200
Message-ID: <4793634.31r3eYUQgx@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <20221006085500.290341-1-xen0n@gentoo.org>
References: <20221006085500.290341-1-xen0n@gentoo.org>
MIME-Version: 1.0

Am Donnerstag, 6. Oktober 2022, 10:55:00 CEST schrieb WANG Xuerui:
> In commit 80f0fe3a85 ("linux-user: Fix syscall parameter handling for
> MIPS n32") the ABI problem regarding offset64 on MIPS n32 was fixed,
> but still some cases remain where the n32 is incorrectly treated as any
> other 32-bit ABI that passes 64-bit arguments in pairs of GPRs. Fix by
> excluding TARGET_ABI_MIPSN32 from various TARGET_ABI_BITS =3D=3D 32 check=
s.
>=20
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/1238
> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> Cc: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Andreas K. H=FCttel <dilfridge@gentoo.org>
> Cc: Joshua Kinard <kumba@gentoo.org>
> ---
>=20
> Note: I can't reproduce the crash with neither MIPS n32 sysroot at my hand
> (a self-built one for Loongson-2F, and stage3-mips64_n32-openrc-20221001T=
170527Z),
> so I can only verify by looking at the (host and qemu) strace outputs, and
> would have to ask you to review/test this harder. Thanks.

This solves the problem I observed in=20
https://gitlab.com/qemu-project/qemu/-/issues/1238
Thank you!!

Tested by having one mipsel n32 chroot rebuild itself completely.

Tested-by: Andreas K. Huettel <dilfridge@gentoo.org>

=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer
(council, toolchain, base-system, perl, libreoffice)
--nextPart4451015.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEE/Rnm0xsZLuTcY+rT3CsWIV7VQSoFAmNAkKtfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEZE
MTlFNkQzMUIxOTJFRTREQzYzRUFEM0RDMkIxNjIxNUVENTQxMkEACgkQ3CsWIV7V
QSpa5A//ZjopgVq4QW0u4SQA1WfV5IrvyrPsHOZYJKEexg+3i5rFidjYrhevnXtl
GX4gJj7DEKJJZdxROHp7DYh/DaM7ahfZv3tyuKzLKsiZAq+g7uIg833c4Rz+yAAa
2NwwPOyNZjW1osGbkvuiwNh+4iNKpr3OvIZeW6ecD2OKTzEIvGkHqjKftjJxCjJW
chf2GfLPgHdHBFNhtT35K25PR7i0yb17iE9YR2a2ck11krUaByy4de8cop2SFiP0
x1cZteo1I0FTz35wLXreeXUzf+F8quZBj++DfR9BqDXc7fHAfNXt+twEwUlDfBT0
dZOY8+oBQfo2ZGxcCqoWQq9JmtSgZSrLNMk6uY4am0q3yzITBYTpB6ufdhteSHwn
Eex+lNxbV8dWGTUVjYTxcldPwgzogOFKbufZctk9VVdW+odzK5CYlWUdpAdV8ndS
5ix0kXVjMzQwxc7Rkyk3MR4VymP678aw4M4MxRpdRAqNS4Xj8X02wNIoPeb+r+JS
DcJawFWMDt25UnBIj1XOMSaAF8OyDUEWStvrtDYWUvomEe7CElkLj4cBz9jJWMgG
j1lwqZVjPnvg7T7Ad4qRAeBdNm8YpzOfk7SmLBle1mvEh/Ns7hwFaDf3UAMNJ82G
9mCE5wlrV1drNwgxgDPZaqiO8GR1RVgKruF2T4wX9QMKl19UeE0=
=6cON
-----END PGP SIGNATURE-----

--nextPart4451015.LvFx2qVVIh--




