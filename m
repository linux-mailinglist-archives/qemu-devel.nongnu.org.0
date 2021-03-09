Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74294332EC1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:09:15 +0100 (CET)
Received: from localhost ([::1]:36350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhjG-0004xb-7J
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1lJflF-0002s6-1L
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:03:11 -0500
Received: from home.keithp.com ([63.227.221.253]:59048 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1lJflB-0000bg-V6
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:03:08 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id E217C3F2EE63;
 Tue,  9 Mar 2021 09:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1615309380; bh=2wsjMqEvNVti+NT3RQ0xAgDMxByL67YTuEkGWgOk200=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SsqeMV0xRXf4HvfCsQ6/q7F6AxfjEHEWkkH/imP9y6oc1sKJgTG1Ow5dzlYljog48
 sNZ5ry7RKuq7ZwBj06kPk1hwKLulYE923o6iWG2rvkq4DzIwa+ehqi8FSlTKco79fC
 oZYe5yCxMLthcaFe/hpuwsgzXDIjWF75UGN61G6am/KucviSp5RzOMHnkBGRLIpuQV
 8FEHCzntwACxY+P5Hd/zeTCjMgZhmm4sFBR+EUGqDz8dWXzw97LrfMkQQRcATcl//G
 ki3SFuDzK+olJgqxu5hCxrE97IdgYWuCMIsbOviKlUwMY9IkixH72J6+enK3eqIS5P
 4nMucNSM/3Q1A==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 7BZ9mMIb6Fp0; Tue,  9 Mar 2021 09:02:59 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id BE78C3F2EE62;
 Tue,  9 Mar 2021 09:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1615309379; bh=2wsjMqEvNVti+NT3RQ0xAgDMxByL67YTuEkGWgOk200=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EOUTNaLrqCXKPeiTNUGy0phMgVBYaFt3SBHYd1mELHCAUZPJ3s+rVgV75h3Hi3E2N
 nXIliDdtPywj9d6GV/HV2l3PjFVBUV90jbuYWaIenGzVfq0uOud5R9730NW9qB6Y2L
 Ed7SCFiESqWgiPIwWWLJfE+wuDdps2rLxOfdYIwrcFKrIXGNEGFH6YSXmazEKf/HT+
 xbtJf7eNL44rdgVot33XYAsmHgWHLriKcen11jzM3DEO+tpo0MkbC6FzIiYUkpezXW
 7vJdlScKofNifDEjvQ1qdYq9vzs0cvZR+nBSisxZQQPE8nLf3a030vCu9xvtsG0kpg
 +77iA0Jesk/sA==
Received: by keithp.com (Postfix, from userid 1000)
 id A897B15821A3; Tue,  9 Mar 2021 09:02:59 -0800 (PST)
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v2 2/4] semihosting/arm-compat-semi: unify GET/SET_ARG
 helpers
In-Reply-To: <20210309141727.12522-3-alex.bennee@linaro.org>
References: <20210309141727.12522-1-alex.bennee@linaro.org>
 <20210309141727.12522-3-alex.bennee@linaro.org>
Date: Tue, 09 Mar 2021 09:02:59 -0800
Message-ID: <87y2ewdzuk.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Keith Packard <keithp@keithp.com>
From:  Keith Packard via <qemu-devel@nongnu.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Note: we aren't currently testing riscv32 due to missing toolchain for
> check-tcg tests.

That's surprising -- the usual risc-v toolchain supports both 64- and
32- bit targets.

Othewise, this patch is

Reviewed-by: Keith Packard <keithp@keithp.com>

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmBHqkMACgkQ2yIaaQAA
ABGJPxAAm0yEsEjoqP+2tmkNpVtl/G+lXcPjrXpGxIuMU1QMn4kya8oDVI7Iwuyl
Mu4pmwWNuqpA8H9E2CsjXvSmc7hgf+LkTTbXEvGOe5CKMQW7Y/tnt82WY6ru/aEe
mRtFX40nqCFQ9hscomeAgXJzFHVSxOAbgfR7YDQGSpMnjSnllb+OxciywJy571KQ
aiI2OXIHhu4HK8EWxcGarhHL4a676BIxH8lMro7Wt53j6zroxvQ2r//TuRYEhVOv
cnknJ5teYJZgb3DvZ3K9Khd6fQydEBrlpRDkByWZqLkq4Emjuxq6+jkJfBhi8q1T
sEmrbPHWhj0Kj5Ju2H8gguketa/jRnIU2f+sKaRA4bSxQGM+upOnwuTCm9kO7TDr
YvAppSjEUGMlsD4rbN69+bS17A83a1DpC9iP0SbdLwFm1Dk2WdWSZs+9DX/zve5c
HZGR86yCgN2OA4ZsoSzHdR9o7VGeG0Xz2Pnjri8S5m1O0T0BleXT2Ud6/REOjQLq
ESVhPGbovRC8McJJyJIgsygFUFI7EIENd8IoaVDD7EMC7pcJ4n43YybN2Stl8zJd
MGMsqIRoykT9JiV1TEc52KipUe3iesvTkWEW7b452V9H/1zVgwPmgBoXRVahLdoY
xo+ZLCrEtyQRpTkEAVJUvWdmnVO1PXlBsSRbht7sPmmlbEAyW/E=
=awt4
-----END PGP SIGNATURE-----
--=-=-=--

