Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B35A3A789D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:57:40 +0200 (CEST)
Received: from localhost ([::1]:51044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3x5-0004Ty-AI
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lt3pm-0000D7-8F; Tue, 15 Jun 2021 03:50:06 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:49328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lt3pj-0008KN-Me; Tue, 15 Jun 2021 03:50:05 -0400
Received: from [IPv6:2a02:8428:4db:b001:f255:832d:4007:dcd0]
 (2a02-8428-04db-b001-f255-832d-4007-dcd0.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:f255:832d:4007:dcd0])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 501A7205;
 Tue, 15 Jun 2021 09:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1623743400; bh=IGV4xOD+EP3wxVoSZkvo1W/mXJOBIiNU97X3RqNzKDw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MsFFdlzP4gDKuhfcyu/U9x662G4DMeKlrrYVMjJqUdKXw2xtHdwayjAT7S1B4ma8y
 QI3aMG59FwbqEWC9973twDYIkFxGQ758eZDWPpat99Kdr+jfwLS2KptggERMN3Bl5g
 vB0LPHqmgScbdpCw9JousvpscMHDwluB//ajfNH+lhyXR7cRbEcvUuwGHtuJVXaqx+
 4JfggGB8apLYdGS6bPwehykwYeWO1cHEaiU01zVwAu5NB3rzlNOzl+1enAyjB9Rjx3
 cVhRcO3r4XtWMduGo1cf87owRfO0Co0u4SgtJamcDwGQU5GvawDZ7i5jdyQCeWMUbw
 U/3OaJlUsuokNezWvTuRlprF/J+NMntYmBUY/EYpT3TL8fvVhc/R8SbXcQzui6w2U3
 xCHXOPxNCMsyPDZiFyscAfzp7n2b3PNSivYrR46ZmZIEpwPDrtj2OzagT1VWGMZkPB
 D+qHhx2IsuWfcRzBkoTlqAAnq7toE3WQ/ebnVik3tTeFlq0vTR+ietOskYZ2J4VrGm
 aCqMc2fkbuo1vo4qAqXE3Wk+FT3cK7eVmpdbfCSXXcJ5wxDAwT/TNrwqvMQdFcwhtv
 FPTBMPhneS8EZa9k9uB1qQ/3H4c3GwDp5E0EZZhKyAbt+sMVcyxmTSvNE02l8vV1PC
 Oe8WOaYJ5d3MC3w3Q2udo9s4=
Subject: Re: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
To: Alistair Francis <alistair23@gmail.com>
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-2-erdnaxe@crans.org>
 <CAKmqyKMs4Sr9oXR8k3jeXo=Umy3F6k-CfQW4Fz3zB++uFKkmDg@mail.gmail.com>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <6bcf8d1b-7caf-ded5-937a-4c1bf96e2d85@crans.org>
Date: Tue, 15 Jun 2021 09:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMs4Sr9oXR8k3jeXo=Umy3F6k-CfQW4Fz3zB++uFKkmDg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="c3wOUuVGaTg0xZxv7TfkLPrytQrW3HSHf"
Received-SPF: pass client-ip=2a0c:700:2::ff:fe01:2402;
 envelope-from=erdnaxe@crans.org; helo=redisdead.crans.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--c3wOUuVGaTg0xZxv7TfkLPrytQrW3HSHf
Content-Type: multipart/mixed; boundary="GKfrKOfbcFsLAO6MNsGRDp64JazJiIRfo";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Message-ID: <6bcf8d1b-7caf-ded5-937a-4c1bf96e2d85@crans.org>
Subject: Re: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-2-erdnaxe@crans.org>
 <CAKmqyKMs4Sr9oXR8k3jeXo=Umy3F6k-CfQW4Fz3zB++uFKkmDg@mail.gmail.com>
In-Reply-To: <CAKmqyKMs4Sr9oXR8k3jeXo=Umy3F6k-CfQW4Fz3zB++uFKkmDg@mail.gmail.com>

--GKfrKOfbcFsLAO6MNsGRDp64JazJiIRfo
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/15/21 9:41 AM, Alistair Francis wrote:
> Aren't you missing some timers, like timer[5] 0x4000_0C00?
>=20
> Alistair

I double-checked using the reference manual and the datasheet and there=20
is not timer[5]:
- page 36 of=20
https://www.st.com/resource/en/reference_manual/cd00246267-stm32f100xx-ad=
vanced-arm-based-32-bit-mcus-stmicroelectronics.pdf
- page 30 of https://www.st.com/resource/en/datasheet/stm32f100cb.pdf

I believe ST is skipping numbers to guarantee that timer[n] will have a=20
consistent address on different STM32 SoC.

Thanks,
-- Alexandre


--GKfrKOfbcFsLAO6MNsGRDp64JazJiIRfo--

--c3wOUuVGaTg0xZxv7TfkLPrytQrW3HSHf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDIW6cFAwAAAAAACgkQbHknjz/NzAIa
qQ/9EgdS0hPVI92tjW2/7+Da0vWu4xOPVaY2m+q/6+Qw98ntLDMlPweNulKqgQ2Pb2nILOpSl4oP
/FVfGbZtxz2VZsE5ZOJfyVcoi9EhckBMmm6qiTy96GWGAVF77A8KAm9ZrAuf/0yfiJsXDK54nTV8
vG1y+ZEZ9e6UpYT1XAyNg9i5rj8N/HeQU8ifvpM/JQmfgtG3AutvNVkg2GYC+kyO8EY0vSRp44zn
19jLHsfqkf0ENWwIJzAZOaTH8RdjqLDA4cTX7ALaR/X3iSjQ8le5fGJDI8tXobHuphEA1KM6vgTD
XZEkjdJ5Mfb/DETmsqs7AGOnB8kM0OJvC8q16b4r/HWntE2WJQsDnhd4ylfRQAcxo4PEv1BZSk2M
bMXOSoRdAlXvJlqc8Y8E1bHVAQDdCbM19ICBDbLuSbODHNJkQ1BWYASccxmtXPbuteYyuOU+wGlG
GOglKjl+QZLojONfh7UDpCK6ZLz7gywXXYmNfdlNkb4IwvKyLs3SJPXJEwgF4Etl7YbanqqdgLCk
sEzLSHVLiyy2D3QXRzA3ZFmEu+DO3y96pPYGjvWj5YeN649R8sN2/H1zu6JiaoEzKZhTVLvfCgE5
J2BQqaI7fBHXPbJew/yDAr7gQAwIJDSZ2KE5NNRJ3RJR7fd16xz4PnQT7lJiAngqyMkoPDAg3Mly
Pqc=
=U0kp
-----END PGP SIGNATURE-----

--c3wOUuVGaTg0xZxv7TfkLPrytQrW3HSHf--

