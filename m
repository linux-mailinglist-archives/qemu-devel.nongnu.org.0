Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168A03EC17B
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 11:03:13 +0200 (CEST)
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEpZP-00044n-GF
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 05:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpXX-00039E-J3; Sat, 14 Aug 2021 05:01:15 -0400
Received: from redisdead.crans.org ([185.230.79.39]:35270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpXV-0003vd-5U; Sat, 14 Aug 2021 05:01:15 -0400
Received: from [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939]
 (2a02-8428-04db-b001-83b5-0a75-e190-e939.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 8505846F;
 Sat, 14 Aug 2021 11:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628931661; bh=TkeFYcChyDU6Jsom+FJLwp4/FDBtAN1AwORDqA4DVEM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oL0t2pREvlvc5YsXDddbXZ378bqbB4ti3TuadL3kNlm+tE99fgCB2DAGT5/dFz55x
 xqmFwvV19RozmPN5cRXXxi4IGFdzDW3Kbqq5N1fKLToVADykyEO0ucOaPD5zDEluu3
 xNZ99QNFQur9FISN8JAfYm4SM/w0M+/wDu5AZ9jPdHZJ6zXgknP7GPpNkuVHeIR/WR
 83r9pasPEmKCHQRDNXSbJw+YAnWZtoiGfaenSW4tOGkAiNYDqZ9V6VSOzPcLmKoBLs
 SbD9fel78M1YWuLh1qfuM4/gz3z9Nanh4yJzBDyuGJ1t+GOArdIZeX2yIikOkk1EwO
 Vr8N9U3128geqa8l/B6ZSFcDlwSWzxxfQNyqUv34Lie8UcUyrv0w4TJvRwoucsM/ZR
 yX5Y5pxKfUVhhd18k7B8VUoKBkGU6hy1vNKqSVDOp3oWhU7z4SoIp6U1ri/KcCDB5/
 AwV26JIUQm/pq2GuU/mYPle1gYIToygpx1WJ5QduujH62nXjIZvfRYCnE7lrGONraN
 ggFdxSykYorZDAj7HtcF7I10i1PNnIQKHPoxz6UwPBnluEayrhDD3rWC8c7/COgoFU
 42HPl9tJs58ef0lKyDlpICAvsfnNrtnmb2Te+dN2nw17y3wHwhxFO2gChl6Gk3ktQq
 +HN8YjFOrAYCmkCo9SdgviBM=
Subject: Re: [PATCH for-6.2 11/25] hw/arm/stm32f100: Wire up sysclk and refclk
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-12-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <e7a42824-89d9-75f1-7c72-a97df8b52615@crans.org>
Date: Sat, 14 Aug 2021 11:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-12-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2i3JHgCfAylnbZl1oVrMtJZgSCKS1Nfp0"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
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
--2i3JHgCfAylnbZl1oVrMtJZgSCKS1Nfp0
Content-Type: multipart/mixed; boundary="qOX3WHJHfHH3p17ELrw2lTLRWcHkGAVjN";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <e7a42824-89d9-75f1-7c72-a97df8b52615@crans.org>
Subject: Re: [PATCH for-6.2 11/25] hw/arm/stm32f100: Wire up sysclk and refclk
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-12-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-12-peter.maydell@linaro.org>

--qOX3WHJHfHH3p17ELrw2lTLRWcHkGAVjN
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/12/21 11:33 AM, Peter Maydell wrote:
> Wire up the sysclk and refclk for the stm32f100 SoC.  This SoC always
> runs the systick refclk at 1/8 the frequency of the main CPU clock,
> so the board code only needs to provide a single sysclk clock.
>=20
> Because there is only one board using this SoC, we convert the SoC
> and the board together, rather than splitting it into "add clock to
> SoC; connect clock in board; add error check in SoC code that clock
> is wired up".
>=20
> When the systick device starts honouring its clock inputs, this will
> fix an emulation inaccuracy in the stm32vldiscovery board where the
> systick reference clock was running at 1MHz rather than 3MHz.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

-- Alexandre


--qOX3WHJHfHH3p17ELrw2lTLRWcHkGAVjN--

--2i3JHgCfAylnbZl1oVrMtJZgSCKS1Nfp0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEXhkwFAwAAAAAACgkQbHknjz/NzALL
Ew/9HwwbqXQn3bMh6m6u+iHonCxIplfihawK7SyLGwAh7tJP4+poqq54s9Jy8OkaQ3iWzWzEZEMJ
IUYoCsht3xwz9KAPIEnRjlVCkCDVh8ggTL92/NRPEbH9zdEmPkNis46dyFHrt8za0ASvyhF0Mk7m
otPNRwMQQ2O56K1cRueTdHTKByOPQN5xaeeUUWKop6rE9MTA14gtG/B8cHz+a6C7dnFLf8AthUKa
UDBaUkWXnixb+SGZW6UmJmEhSGHA1aSgwlKGTZ+9EX++DUL+sy/SJ2XBSyn7775HFS1oVB9jC6FK
deMU9/13tS79fYBAjF7jNyXbq2HiFWUN/wv0OBbmr9e28AKRmO+r8grKX1F92mSdlN5LJCtjipQF
wg3vue1MH4CLWiWJGTzFzsVZOlwXVf9EsIUTVmSXqdK5GimlwDZjabPArpGYtUFF6b9zwvAVdMRK
NDMi757Nyh2QZyrGL06JGzH1z5MXgtcrIpQlX/nR+vPdpHwwEmpmG7az3YAVYxnQgWQaVM484pRs
SY0xZyYBOqoNcbAl88hJ5RhnrFLdPXas/QwrrlH1j6iikKWoN5nDsZbsFfIaTN0GUHS/z29TvogG
cTyMDnF7RkSu2W/pv7NUUR/ONt0/uRp1DFbmqPH0EFlIwRgPxd6SDbXzool5A39jLDJnjXiT4rTF
pWE=
=aeGe
-----END PGP SIGNATURE-----

--2i3JHgCfAylnbZl1oVrMtJZgSCKS1Nfp0--

