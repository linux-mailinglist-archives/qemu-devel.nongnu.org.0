Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D7E125659
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 23:13:25 +0100 (CET)
Received: from localhost ([::1]:33148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihhZM-0002jB-6k
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 17:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56289)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <keithp@keithp.com>) id 1ihhYV-0002Cx-Mm
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 17:12:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <keithp@keithp.com>) id 1ihhYO-0008ES-Nd
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 17:12:30 -0500
Received: from home.keithp.com ([63.227.221.253]:34876 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <keithp@keithp.com>) id 1ihhYO-0008BC-Hf
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 17:12:24 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id B0B513F2A0A6;
 Wed, 18 Dec 2019 14:12:12 -0800 (PST)
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ERxuSXDkITRp; Wed, 18 Dec 2019 14:12:12 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 4F9723F2A0A4;
 Wed, 18 Dec 2019 14:12:12 -0800 (PST)
Received: by keithp.com (Postfix, from userid 1000)
 id 094161582169; Wed, 18 Dec 2019 14:12:12 -0800 (PST)
From: "Keith Packard" <keithp@keithp.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH  v1 0/4] semihosting read console support
In-Reply-To: <20191218180029.6744-1-alex.bennee@linaro.org>
References: <20191218180029.6744-1-alex.bennee@linaro.org>
Date: Wed, 18 Dec 2019 14:12:11 -0800
Message-ID: <87h81xz3k4.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 63.227.221.253
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
Cc: pbonzini@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> This series introduces a new "blocking" console read function for
> semihosting and plumbs it in to the ARM semihosting code. The main bit
> of work is Keith's patch (with a few tweaks by me). The other
> preparatory patches make sure the PC is updated after semihosting
> succeeds and a little bit of clean-up.
>
> The following patches need review
>    01 - target arm remove unused EXCP_SEMIHOST leg
>    02 - target arm only update pc after semihosting compl
>    04 - tests tcg add a dumb as bricks semihosting consol

I've reviewed all four of these patches to the best of my (limited)
ability. I've also tested this with picolibc's semihosting support for
cortex-m3

Reviewed-by: Keith Packard <keithp@keithp.com>
Tested-by: Keith Packard <keithp@keithp.com>

Thanks much for the rework, definitely beyond my understanding of QEMU
internals.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl36pDsACgkQ2yIaaQAA
ABH56Q/7B6cTe7VThnjjyW+LuuKgsdIBo7Ikigg8F6DBhoVIs8UdJJMsLRe/VYej
k9eWwFs/btgzG26p6aL1LClCTo0iElHnkcMqaLq1V2zE4gdga0oWYUQ9qjtycACL
1kAUD8iluZbf91lmU+OO8bTEtaqZ894Ig6lah53glGDkfTfDX0q+skn3rhW97jvQ
b12BMuFMahFt2QpOmv5XMpFPqhqoLjm4XSGdeykIVDsyke+0o0lJRPD9RKMAMlAI
iixM3nERO5eho1BbgJHNS4Th7tOixxclRjy4NRUZOZvULbbshxpqtETRze+RvhEB
Bv1caDSFX7ESFtVuhp/JzA9QXFvlp0hHXnbW5mGdp6ox4d84ArJYkd6Qz5mGG3Ls
YXTIa4KGGWawC7KLHRgNqsodRd07Q8JTDBtLCmZJ0SvJBwaMRpXIgGjpYIYIpIif
jPqqrTXvMfTyE/Wzsbp4SH4J+bn1EMo2kH2b2uklfWVw9imJ9DiqJcEeeZNkAFCN
IA+g1qZz95biI5GMBlnafkCB58o0S38KypgY7hLtaykEzqEmSrTsn15RTVI6HQxu
L4nYDBFUIvpucQeE5dj38dlic89XvurjNq6qsdgFu83Zloy0Bnz7/i/DsjfUK/w1
h5ABliSyIFsZFdfD+Jraww09HiatdP0iYCb1wZTS5xfkIlVUVk8=
=wx7h
-----END PGP SIGNATURE-----
--=-=-=--

