Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD933EC17C
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 11:04:27 +0200 (CEST)
Received: from localhost ([::1]:40612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEpac-0006Hb-Ap
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 05:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpYm-00042M-5e; Sat, 14 Aug 2021 05:02:32 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:51518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpYj-0004qz-PN; Sat, 14 Aug 2021 05:02:31 -0400
Received: from [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939]
 (2a02-8428-04db-b001-83b5-0a75-e190-e939.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 311E542A;
 Sat, 14 Aug 2021 11:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628931746; bh=LkaTAdP6WDxZv+oyYqlKJRaTQwR4YdhZEZvDN3UkqdE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dMIXwKeP3omcEFtNqfrvznQOav60LKjHNc3DVQW98P+H70FM3L7417B4KRZqMjAu3
 M2zCUQhXZCFvMi+CajsP/a95xaw+n3am0u8/lAQRSIuZ0rFO0aO/4pxWwpr+iXLipl
 7YXA7coDBtB2qpQGPX8naPridgZo6FmMObVv7M+Fn5nnl8CsbqbDaiHIIdwg72eNhW
 kII1bMPYEfDq1WZn3trrlgKoqnCgOcv0Pkb2p+9oZhoqxNf5ZpxWaajzqrxt+OhAyh
 3bsTOxzv4O/lbfuVG2QsVPma0rXYbeii73OgpcEwNHuabNrNmWdQZN8AMGkNhEVjqm
 wAoYhvuCY384rcB/oFRyMC7MsuD5E3xGp+45wKA4HNYMzWoVJiSVaecrEI5BwYzsMo
 /jcToYpypM04hByHSFrLHSx3IfxtRqjDW7i7g0WYb/YVoSAyemQve9rn2AyF3IAUlX
 HgQyiawLWj0beW4s3hGEnzut5+RDLJEfpz4O3Y6ahif0Qy4Tm6plHLYrIciL5J437m
 852B3cQGE6eGR2ypNzM78DTrS/KtvjlvN6/QhnVUyfzofLriUqUfAysKnou/1PjzNq
 mBvFpmLj9F8+4FcbiHlFH3mBkBhuxUrjY2gsyS8VfnaLgGQHPIIMfXRGqwqbcTk9aC
 kZpYkP8UL3N36yOdeGrXqL8c=
Subject: Re: [PATCH for-6.2 12/25] hw/arm/stm32f205: Wire up sysclk and refclk
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-13-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <50546e3f-1c6c-bdfe-065f-993a7cc39da1@crans.org>
Date: Sat, 14 Aug 2021 11:02:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-13-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hcVs0lQM04e7FUmV52QPEUwYKpbRndaoU"
Received-SPF: pass client-ip=2a0c:700:2::ff:fe01:2402;
 envelope-from=erdnaxe@crans.org; helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hcVs0lQM04e7FUmV52QPEUwYKpbRndaoU
Content-Type: multipart/mixed; boundary="6VjDvIsHknyO8U3v6yyCvB8PtoE7kLb8G";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <50546e3f-1c6c-bdfe-065f-993a7cc39da1@crans.org>
Subject: Re: [PATCH for-6.2 12/25] hw/arm/stm32f205: Wire up sysclk and refclk
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-13-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-13-peter.maydell@linaro.org>

--6VjDvIsHknyO8U3v6yyCvB8PtoE7kLb8G
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/12/21 11:33 AM, Peter Maydell wrote:
> Wire up the sysclk and refclk for the stm32f205 SoC.  This SoC always
> runs the systick refclk at 1/8 the frequency of the main CPU clock,
> so the board code only needs to provide a single sysclk clock.
>=20
> Because there is only one board using this SoC, we convert the SoC
> and the board together, rather than splitting it into "add clock to
> SoC; connect clock in board; add error check in SoC code that clock
> is wired up".
>=20
> When the systick device starts honouring its clock inputs, this will
> fix an emulation inaccuracy in the netduino2 board where the systick
> reference clock was running at 1MHz rather than 15MHz.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

-- Alexandre


--6VjDvIsHknyO8U3v6yyCvB8PtoE7kLb8G--

--hcVs0lQM04e7FUmV52QPEUwYKpbRndaoU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEXhqEFAwAAAAAACgkQbHknjz/NzALl
Wg/9FAYdO3PwLIhyfULe0nWRfveu53SzUEWkJu47Y4SAztfM8gpu5mmkKAK6JyNO+F/b91GCeyja
CxdqWKUkzvviSrrKpgc9RimxNg9v9CzfT1E7V0nw4dP1Vost8z01/DVp4ZYp490+6Jd0md7yo5Lx
qCJ3MRXMDoQ9XvLTTWynzxi3MmyOGuVeplpugZD1gr+ucoXgO774vQQpsiz/Xs8Ae9N+T2naSX6u
0cNyNdVuU60ebGvbvRNjfkORK5Umjoe9EGYNBCRmG2g4TwMOSQYBgp7taQhsQD1nKv0wpgCGHJzr
Qekv576n2L0RJOdytWIWuxnNKqaqPjbEcM4lBi8nNcAgWRD6tvEfST+tUaucNYP6d92eSNh3Mmml
kd0yKQnRMPc794/r76J9EhcMX3arqfdBa7rSL89Yl/JQlZMZudC6rOY6Xlccxd0Hw0aw4mhXm8Ov
o3gUoQYAWs5PCo66KfSvbS80JjJ44K+lOfgCbFOg4Bg8ZBIncu+QqTb9eNnNAJF/2qDRPnkJNqoJ
0nc3XJACDdGooKwVBRwXyec+YelyfjuIyWiSBaNaHVc10948T+nMcwqhZyFav/NkNGkpwyIDqi4+
Grn4zJUBp//3YZKnL3GRmP5yQhE/Bv9aEvaTg16jMmPmW+uCvW+tBl4jM2VSlkImyG6CkgNhp7Kt
wDM=
=hgSx
-----END PGP SIGNATURE-----

--hcVs0lQM04e7FUmV52QPEUwYKpbRndaoU--

