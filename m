Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7464BA6CC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:14:41 +0100 (CET)
Received: from localhost ([::1]:40182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkMa-0000qj-Lq
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1nKkJT-0007WI-OQ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:11:27 -0500
Received: from home.keithp.com ([63.227.221.253]:42228 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1nKkJR-0001ln-8B
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:11:27 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 965723F320F5;
 Thu, 17 Feb 2022 09:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1645117878; bh=85VbeqcBQAtCT2bxPPBmP13Ocf40fXxXIDpHz1WB2rc=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=L1jmM2LBNlS7OpJAW4xgtV8lwrP/OE+h9MupEzDmpS0LeAIPq6YiFx9LmhVRTaURu
 /dm+DRz17F4TqjYTiT9j+nAj+hLA+KVEYGc0hQyxE9SdrB/gPqASr2Mxn/f6OzX2VL
 dRHCHe/IbdFjK+D4mwVIL31H2Jx3sr0nwWTouFXpwkD35M18Hhv3usoM81POpX59of
 geNt9H6fAArf0wgq8W/kajqDZobRuq9nf9YthjeOCaYKglDhTBRsAwMyNQO3R1dUoM
 6cWOEOG7L6bPN+wvOQahFzW5TnMalL28rZ0yJEN3TXWfOM3HHSmwewsGUTZpYoVKd6
 9xzDKq9/T0fsQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id iSpNxY3B1MMR; Thu, 17 Feb 2022 09:11:18 -0800 (PST)
Received: from keithp.com (koto.keithp.com [192.168.11.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id EBE963F320DF;
 Thu, 17 Feb 2022 09:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1645117877; bh=85VbeqcBQAtCT2bxPPBmP13Ocf40fXxXIDpHz1WB2rc=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=YFuOGywogwU60k3gu9TrAv2Ot11f1vHlMkTWxKAlOJk7plDxNinpJeMFZb92fRRc6
 4ZF3UmIBvf+z7u5Wu7tkSt1gMj2tRuKa+0f1OemWB7EWFi0ILYu6MH5Bx6BN5i6SD3
 Nzt/cqX9TS9+J2jB8ZQW9GfzJzS/mE/2BwB4G/DUhTnHrw1MKCqJee1bFiH8e/jWLz
 2RvHCOaRkJmvUnJhvBDYGvWbQlcU9i5ie+Itn/CThvU0LGTzNZRHECsaJAaOOMXKLo
 sFBZSjkQKh271ADTuGv6GjT31VpevsurYr5FViX6Tpe6Nfj8le6IPCE95uVMuXJ71o
 V+HM4/Pax+Sdg==
Received: by keithp.com (Postfix, from userid 1000)
 id B569E1E6017A; Thu, 17 Feb 2022 09:11:17 -0800 (PST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] tcg: Remove dh_alias indirection for dh_typecode
In-Reply-To: <20220217034725.272552-1-richard.henderson@linaro.org>
References: <20220217034725.272552-1-richard.henderson@linaro.org>
Date: Thu, 17 Feb 2022 09:11:17 -0800
Message-ID: <87bkz5zadm.fsf@keithp.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Keith Packard <keithp@keithp.com>
From:  Keith Packard via <qemu-devel@nongnu.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Richard Henderson <richard.henderson@linaro.org> writes:

> Reported-by: Keith Packard <keithp@keithp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Looks good to me, and it passes my very simple test when run on s390.

Tested-by: Keith Packard <keithp@keithp.com>

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAmIOgbUACgkQ2yIaaQAA
ABEL9Q//VPx8HFzLnmzswVTYSvZfKNSui12dh+xdLfUzpuva65ehUFgMpc8Bnt6q
Cq0Mr/s9fAuW4oPdiOBkamxV5kuN12LqWv+UxVjhsFo06wrmuv3vDLezrm/OHUbf
/LHmhaeZe+zIl8KTUlMaCFejpnRXtbHGmrU5g6v/7w4Q+rJq38UguZ+eIv6xQE45
d4DMZ/3LkG3ZIJ2n6W1xer1fyafHuIjdebhriiJOo4dqdLJJWO7QN44t6q+J3GU1
MB24JZW+gDnVD9aNWTAiHZ65cnzdE40iY6vHtT4RBfnezF5Cu6hOMINfYjyq7rZX
AvGKvWkyFCb+LwFfDx2NvAd8PFwMWViOdeZIe9AgFVIlk0NDNeaLGqRAUJDeeuuj
ZufbjtwC5gj6ClgfQFM4HcpV9A4s+9lIUSV5Xfkh/0SpGGRTrynso70Hg8uiQqbx
GnIk59wGgZNlxzxjsfZFjU/0bZTA6esU/bpn4/eZXkGXpJKyAXsBaxLx8zmS2xOi
gg8SBBhGwiu8V8bcyZWIGmxds57rH7gYBO5cD5Cbbnun25E4vgIjETX0PQaFvxbZ
V/oDCqC+3JtMSj1tYALWykEmDdiQSb6bRkRqD4Ni6nFuDC6z9/YUSQF3KRQd65ln
yf3/bGzFQGzvkvUcyq8FDOripCQaGeYBXS4M10Jmrzj+G3CFMVQ=
=NpjF
-----END PGP SIGNATURE-----
--=-=-=--

