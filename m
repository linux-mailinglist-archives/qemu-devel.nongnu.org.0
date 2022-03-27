Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D654E89F2
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Mar 2022 22:08:12 +0200 (CEST)
Received: from localhost ([::1]:60084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYZBL-0004B4-EL
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 16:08:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1nYZ9e-0003Sa-D1
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 16:06:27 -0400
Received: from woodpecker.gentoo.org ([140.211.166.183]:46498
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1nYZ9b-0000CG-Du
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 16:06:25 -0400
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] target/mips: Fix address space range declaration on n32
Date: Sun, 27 Mar 2022 22:06:13 +0200
Message-ID: <5931742.taCxCBeP46@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <20220327053456.2552855-1-xen0n@gentoo.org>
References: <20220327053456.2552855-1-xen0n@gentoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5861506.atdPhlSkOF";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=140.211.166.183;
 envelope-from=dilfridge@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: WANG Xuerui <xen0n@gentoo.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nextPart5861506.atdPhlSkOF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org
Date: Sun, 27 Mar 2022 22:06:13 +0200
Message-ID: <5931742.taCxCBeP46@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <20220327053456.2552855-1-xen0n@gentoo.org>
References: <20220327053456.2552855-1-xen0n@gentoo.org>

Am Sonntag, 27. M=E4rz 2022, 07:34:55 CEST schrieb WANG Xuerui:
> This bug is probably lurking there for so long, I cannot even git-blame
> my way to the commit first introducing it.
>=20
> Anyway, because n32 is also TARGET_MIPS64, the address space range
> cannot be determined by looking at TARGET_MIPS64 alone. Fix this by only
> declaring 48-bit address spaces for n64, or the n32 user emulation will
> happily hand out memory ranges beyond the 31-bit limit and crash.
>=20
> Confirmed to make the minimal reproducing example in the linked issue
> behave.
>=20
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/939
> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> Cc: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: Andreas K. H=FCttel <dilfridge@gentoo.org>
> ---

Tested-by: Andreas K. Huettel <dilfridge@gentoo.org>

>  target/mips/cpu-param.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/mips/cpu-param.h b/target/mips/cpu-param.h
> index 9c4a6ea45e2..1aebd01df9c 100644
> --- a/target/mips/cpu-param.h
> +++ b/target/mips/cpu-param.h
> @@ -12,7 +12,7 @@
>  #else
>  # define TARGET_LONG_BITS 32
>  #endif
> -#ifdef TARGET_MIPS64
> +#ifdef TARGET_ABI_MIPSN64
>  #define TARGET_PHYS_ADDR_SPACE_BITS 48
>  #define TARGET_VIRT_ADDR_SPACE_BITS 48
>  #else
>=20


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer
(council, toolchain, base-system, perl, libreoffice)
--nextPart5861506.atdPhlSkOF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEE6W4INB9YeKX6Qpi1TEn3nlTQogYFAmJAw7VfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEU5
NkUwODM0MUY1ODc4QTVGQTQyOThCNTRDNDlGNzlFNTREMEEyMDYACgkQTEn3nlTQ
ogbzmBAAm4bSizmWilkmzftmAJN3HyaHPJbvUe6QoowH8RuIWquw8r3Dhi5CBtSE
3EUF1z0FlGpXNPL7B2fIU1pC7s8DV5PBrnnQlXp2rtFyYeA1lC5LCyEBG0XxBpgy
kQskV6N0/BT+PXrJcZjyjWmh7KjKs1k8ZfbTTEUIpiC/tJM9p0wViGn66CnY5h96
hBLcidN+HPjfHseZUVXqZC5CV7WLy9gBONq1ZumlR8vTxIagv1Gu+p9dnLLtsBet
wfzH9K9mlHkRJ4PCOCX3JPmL+4JYOcv/n5CJTsStsuBtzpcY/XHSPjlJs25erFCP
Tm9D2ExcFVuXko38207y5HCQfZDZBaSYCTk6+80cdcJ9tLQj4+OeZTn/4L7wpYbm
rruL+Hk1+gCWP08dBeIyPSfzqGxtWJO1fGc7HGk4l9BUCeyLj9l9SFpSW9usPXnR
S34exFRTt34lF08TWb6y918jykOtNJBVv78HG/6I7QoT5JJIxFXa0NqoSmW7DcMp
4Y3O7RnRsLYnNEyis8CZNhXZuyf1fESfjbPqBp+aNXCtPfSLGo1D+gzw2eOP50Zg
TapZWMT/Rn3x2aJIAhSGTlG5i/JCI76bVsvrTffn8oFpP+9vI1Wib25pSRcl3SRW
QO+LTkxzA6vSmddKrE0cHeZLluT1KOFQhusyhNnC+dJcrsETIvI=
=QWRR
-----END PGP SIGNATURE-----

--nextPart5861506.atdPhlSkOF--




