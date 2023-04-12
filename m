Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51E26DF4F9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:21:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZTX-0001na-2r; Wed, 12 Apr 2023 08:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1pmZT9-0001Td-5p
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:21:05 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1pmZT7-0001xp-1l
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:20:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1681302036; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=nNWEYc1CUaOGs3xvhxJ4wAooMc1jDnPb5W5pMtdF1D+w9E82eFdRgfXnsoaY6Pqsmn
 mQECTkfk3fv0kD6wTwAsw6p0huhDZOf0qQ7X1LrDyezTI3elJ6q63G1pUR8o+4O3jKbR
 2jQw82HYwpfQGGEU6b0FCUpWKsyqJUXG+RbADG0f3Ai2iOskmpFUjy4tjZdB3GLeZiyH
 VuO+zMAokBJnKWw/e0s0/6GnzQpHce7oRjV52+Bl7r6lYbgBdbKdYRKu+wjkk8LoVoxl
 b9bd2j2g/fMY4yjyArrTdqQ4Jv27Ro7yKMs5omXE/TSaDVCY7/VIUHpjPU2x8+wabq/T
 3RGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681302036;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=eC1DnLQfg/T0Y5hbg3BWuxpgJcQcgnqh8dlqRoQTGSI=;
 b=sGnlFJqRHblvgZ2wA0/TBk8yYgJR/jaoHCxwKiaG+J7P+bKwf6Goipoo7nDRrGN8GU
 7OjX0EZMo2v0InQh/sp8bVliUkSmNFze/rPv+CIy6KNSBUOjsvgJ661De6Fn1dYR0CSf
 OXj8ZewbPOTHd88Z98CSQcJvNp+TySf6+xMcSWuyhKIXzgWwY97EpPBXS1e8Ct/xFbq3
 P4kQ++53uWtChp7M6uVKquWGae7yeDR1RDvy4fLUyqGyW3ripZ2YqWD3f2EKNCDDEoHc
 5zYPSuPEeJ2MSPHZo0+CwzY3VpIycyYy8RfUfbtmh46+U8AO4aK4tHDmUr3GgEuBUrR9
 ddFw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681302036;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=eC1DnLQfg/T0Y5hbg3BWuxpgJcQcgnqh8dlqRoQTGSI=;
 b=S1jf65+YouQ0rVjDETxZqLeTHouKpOEKdW8Z9XAEoxVnylaRWOG0aCcbDUhYlvOPg4
 SDePs98ZUnIrkpmc5UScXClzKrHbpQiguKSTOuI0/UmK908HwMzPNKpjLrXKLY/dG7Sv
 GkxrpPzlifdgZstnE9XNs2JTFMVy8qPl0C0Ex5V97oC7FS0Xlzqn3yvnO2ngAx6psHgr
 XLuhq0JjnGlrvqXUmMUjialwmN0DW4nh2XZIapa2NiXogYmlz/x2/38HAe0Vv4S62xRf
 P5t53yuJHKpOzBvtJ0nYEsydKR77pEggges4lo88dAahApMVmz44B112VWYP8Ig0JKAh
 u3Tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681302036;
 s=strato-dkim-0003; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=eC1DnLQfg/T0Y5hbg3BWuxpgJcQcgnqh8dlqRoQTGSI=;
 b=NBAJsJZDY4kPIrkx/wDVKmk70zdKBvayuKz8b5ZfiJ/XjsoI9NCn4LassbopAYZ1Y8
 To3PeXycHDk2F3WdrnCg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AEWIPBvsPI52f2TnxTwFPmhSWhc+9ByBCFU+BA=="
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3CCKaRsE
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 12 Apr 2023 14:20:36 +0200 (CEST)
Date: Wed, 12 Apr 2023 14:20:22 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, David Woodhouse <dwmw@amazon.co.uk>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: qemu v8.0-rc3 fails to compile with Xen
Message-ID: <20230412142022.4b88df69.olaf@aepfle.de>
In-Reply-To: <873555pakr.fsf@linaro.org>
References: <20230412125842.573dc418.olaf@aepfle.de>
 <873555pakr.fsf@linaro.org>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem,
 kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+X11/9k4_Dn.1iPSqQR5HcD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=81.169.146.218; envelope-from=olaf@aepfle.de;
 helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/+X11/9k4_Dn.1iPSqQR5HcD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Wed, 12 Apr 2023 12:46:23 +0100 Alex Benn=C3=A9e <alex.bennee@linaro.org>:

> Olaf Hering <olaf@aepfle.de> writes:
> > Qemu v7.2.1 can be compiled with Xen 4.6, but v8.0.0-rc3 needs now at l=
east Xen 4.7. =20
> Was this caused by the addition of the KVM Xen target support or some oth=
er churn since?

I did not bisect this failure, just checking if bisect is worth the effort.


Olaf

--Sig_/+X11/9k4_Dn.1iPSqQR5HcD
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmQ2ogYACgkQ86SN7mm1
DoDlsw/9Em2U1FFBVzujXLo8u+obSlv8LuFWY3Ke7lo1KIinjJZ8/Vhynb5lQ04G
m1baqNXE0esmcOqq2tsTsBX7nPB3GKB1sSinzN+2f6wNOPmDHuIP+92gIRiMEizP
wnSadqKEU6UyO/l7gZEyzZr/S5z7mTcuq4LUkrlxviBuvt+i9icTWhwg1GV9551Q
mNahB41XHGWXMZMej7F3A5ghN5VOUELSTvgYz1PNwEP62sek/y4NnqWvMj8Fv0Sf
cJLV6QsBnkCGf4gZJ289ushU1OLUr0CA/g9thyW/UBMnFprv92tCqMEi2CMH2Ae+
WGrVkwjZjGOqYGCGbUCef4hEUv2dL5fzfm9S1NAUT7E8ECYewzWjz0enXTGncWVW
L0VKMMh5v3lh+ebT44832y1D6Zszf76CfkJ5Wkm4xhB7HWotqiFH4glbzi7srWRg
dJ9DQAO08nFYKNo8Fy/DYRXVVAf8+FVt4w6tQ1vveuLBlKVGNnVU3zgADwIGxAeM
xPS10j0f/D7NC1DRVTb9F0lM7xd1V4u0z4PtbusevVICGyr6d9El62Avg7seuFnc
WnmBEg/2hL1/pdL0PjJkYCq0FVTBRhR5LbAZswb8jgYj29p90P3pXevOsgg3/qCg
keNsTcpBBCVgaMx73Z1x96Nh8/uKo0oZifm5vLoOKwa4vXeT4QM=
=AfbP
-----END PGP SIGNATURE-----

--Sig_/+X11/9k4_Dn.1iPSqQR5HcD--

