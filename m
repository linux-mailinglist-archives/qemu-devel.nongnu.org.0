Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA962332F28
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:39:38 +0100 (CET)
Received: from localhost ([::1]:39874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiCf-0006xx-Tp
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1lJfqv-0000nE-Le
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:09:01 -0500
Received: from home.keithp.com ([63.227.221.253]:59086 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1lJfqt-0001Dz-UU
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:09:01 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 3E03E3F2EE63;
 Tue,  9 Mar 2021 09:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1615309738; bh=/7AnatEB9N4WbDxJk1qR3+rHyWFPIyGqPduovBaKBS4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WG49MDNf9Z/d1UecmXlhSUh0Ipac/FsszGJIzmhxmrriygjQGzx2bxi/es9gKjVb7
 Fd+rI2PtABjeJf8IY7P43aB/fM7CfwOgRv0q6nhbGOlIgsQ+qbE+Dw5JyZVCUUkDZj
 i7p1CJFqNPbHElaN0MjTcA6IVmLgCvsCRRXUnAptQDjS5cUBM8PiEJ0TLReqLVsFOL
 F0V4tYwBfokn+0YeUWz4an8qiS8oGmRtYSACjd5HIm/dRxFGj3yLssp2yo12EIGVTb
 Yf0ThUcFxkyD9osLx2kSHPqTB+8g7Io0IYuTacJ6BiIMrUJJND2BM1+7AwOYF0XnxK
 aiTCYkhhXa4Dw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id EiNF2WPCT8hA; Tue,  9 Mar 2021 09:08:58 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id EB4B33F2EE62;
 Tue,  9 Mar 2021 09:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1615309737; bh=/7AnatEB9N4WbDxJk1qR3+rHyWFPIyGqPduovBaKBS4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=REHQBHBbEuLkOff2ZDK1kWLByINSr8RoedIJleE9u4Vg82Mrt9i96vbMSVyYZu1hU
 g8hHE/ukO6eM+QHpqTUiK3bZK7lFbASWkvQNFbhn4d+xP4OLE2H/6lx6QXA21qJR94
 Jss9Gamn2Wn030ijb/M5/iXfC9woKgr5DkeYWh7YJvGwfHhpTScThGojruX/wRyGUt
 CTmgE2ICo6m5NRKUc+xJVxJ5kTi93GvENgYlJ1zFin/MB+xOiVrwvzRw9vEgsSzlG5
 3XM92RtCdSLiXLM4Byqt35O/NUdUt36des5qbjXSV07k9wrcF4CzNVOfuKyvaKDLHV
 OxwjxyK5bKtew==
Received: by keithp.com (Postfix, from userid 1000)
 id D5E6A15821A3; Tue,  9 Mar 2021 09:08:57 -0800 (PST)
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v2 4/4] tests/tcg: add HeapInfo checking to semihosting
 test
In-Reply-To: <20210309141727.12522-5-alex.bennee@linaro.org>
References: <20210309141727.12522-1-alex.bennee@linaro.org>
 <20210309141727.12522-5-alex.bennee@linaro.org>
Date: Tue, 09 Mar 2021 09:08:57 -0800
Message-ID: <87v9a0dzkm.fsf@keithp.com>
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

> +    asprintf(&heap_info, "heap: %p -> %p\n", info.heap_base, info.heap_l=
imit);
> +    __semi_call(SYS_WRITE0, (uintptr_t) heap_info);
> +    if (info.heap_base !=3D brk) {

That requires qemu to know a lot about the run-time environment, which
it rarely does in my experience of embedded systems...

All I've been able to check is whether the heap base is not below the
heap limit and the stack base is not above the stack limit. Not exactly
great validation, but at least it caught the case where I set the stack
limit to the top of the stack?

	if (block.heap_base !=3D NULL && block.heap_limit !=3D NULL) {
		/* Error if heap base is above limit */
		if ((uintptr_t) block.heap_base >=3D (uintptr_t) block.heap_limit) {
			printf("heap base %p >=3D heap_limit %p\n",
			       block.heap_base, block.heap_limit);
			exit(1);
		}
	}
	if (block.stack_base !=3D NULL && block.stack_limit !=3D NULL) {
		/* Error if stack base is below limit */
		if ((uintptr_t) block.stack_base < (uintptr_t) block.stack_limit) {
			printf("stack base %p < stack_limit %p\n",
			       block.stack_base, block.stack_limit);
			exit(2);
		}
	}
	exit(0);


=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmBHq6kACgkQ2yIaaQAA
ABEa9Q//Sa3gV+q4cNY++svKK7B3TXSkKAM4MkCkuilqfzSMfs1dqA3j15F68Gtn
zqGlim3c/uTG+q8oCx/MDNgloT+HRGErGlrffhibuybtWLac9uDJCZdfDxz8+r4u
fO7FAUnFMyXO+mesFi5ic1fTouBsQ4rnovw8hy6pU65eFCoUAdUH38gZdKhKTf0B
a95j5gDmCOrmsHZHKy042tFbcfeLiPCwNiHTQYpQiT4P2HaHesVW5BTrUe7yFBhh
EpJQ1MVvzgyjH4wtwe6fQvCUcylfrhQeHKO0kL0NwdJ0zkhhz6Hjub5RPzYFANIm
tBcyq1A3TnOAz93Ov/+DSYGNLmXLit73IQwnlisLc3zcYpu84xa/MzbuPVr44pcL
CrVSfHWjbbA/oGGBeVzvcDUQv5NV6eeO3SrquYk6+JcaeiN5shaICMUydLmy7ZfB
+fsv2AtQf+In8rRjePx18krzaI1L8qFHGpFCdiGlytsBwol0jKuL0qnKw2OvqcFQ
t8BR9uzaWqr/0wf2mL7JnopHsAVevQQ0vhYum8zy1PJx3c+CPFzmjUL1yxde8ay1
yk5jwKrhakQdH6j9Ip/NnsG8e6uTPbCRfYG/+feq2DxFIXcngwcgZ5QOClU6mjDQ
dvMFfazT53JI5rmBkC08wmfxT6SYMnQqMQR/vt1jIxiyruQZA2E=
=oWL6
-----END PGP SIGNATURE-----
--=-=-=--

