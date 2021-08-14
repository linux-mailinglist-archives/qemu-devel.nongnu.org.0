Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073C03EC184
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 11:08:34 +0200 (CEST)
Received: from localhost ([::1]:46098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEpeb-00029o-1n
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 05:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpcz-0001Aw-81; Sat, 14 Aug 2021 05:06:53 -0400
Received: from redisdead.crans.org ([185.230.79.39]:35844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpcx-0007mP-RO; Sat, 14 Aug 2021 05:06:53 -0400
Received: from [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939]
 (2a02-8428-04db-b001-83b5-0a75-e190-e939.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id D4055467;
 Sat, 14 Aug 2021 11:06:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628932010; bh=cVZnRBsI10F6QqnfNvzWZPWrloFJlFUJgKtoNaZeMXE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WIGHmpJs68MeBquqVhSwvDZqR9LpyhiZd85ddnMYTJx/axZmE703ZfWPqckm+7emd
 po6npa2XEq7NvOaQYsVUwA+VLtlakUmqY5eINJE3HU1ExqCDjJER1H/a7k9sJeUnM+
 QulAKF9Q8Mp4LhP4hDmVs6/VjivYhls8RzepDQaFBXLdOz1/K9E+AhBV7i0RHlKiTl
 +jvU8zr59eadkSrnyX56ZSxa/vKf8e7dBGdJwb4t9euvDXkIxY24AfB2I3IzrWcY3a
 EfQD29bLDl9U9cpgPDhSAjiQFV9767smSRhZ0RKygjgVFTA/OGpaL013/WKY52p/BL
 tXKuTQMTKmRP5jvVaMDKNtNoiucOdf5DfwfGuRJQJMZ2/VTjUbmXMXuhrvymWWI1UB
 0bPv63zrkvt3uPd0HdH5hAX2BuZcpMMXVJ3Xhpou48m4VTS1hP3tIUUYWvnzRqEaU4
 10pU1wmfwyo8pqQ93++nET52Re6DUXA9lolmCQm3OLje3K1BPU7DmKlz4IWw+z2JKe
 hIjLs+fdk6jYmd/F4EZ9F9m6GZog+9jJazolIeqkNBThQDZbwnl+kQDTDqXAjTPuAf
 DEZdJD1TTsIYzLppokn277/Pecex1/rwuerQLZkygPe3SkZY6y794egWL5sBN+V2pO
 l46yp26Vtv3s+FpQtWB4/Fik=
Subject: Re: [PATCH for-6.2 15/25] hw/arm/nrf51: Wire up sysclk
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-16-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <b7aecf71-530b-7446-049a-5224fed61e30@crans.org>
Date: Sat, 14 Aug 2021 11:06:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-16-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nF9pEssTnE3JZgKvKxFALAusWD2IMARjC"
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
--nF9pEssTnE3JZgKvKxFALAusWD2IMARjC
Content-Type: multipart/mixed; boundary="lE70ojTysbq5PnAX5JGIesfdN2sYeh1v6";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <b7aecf71-530b-7446-049a-5224fed61e30@crans.org>
Subject: Re: [PATCH for-6.2 15/25] hw/arm/nrf51: Wire up sysclk
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-16-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-16-peter.maydell@linaro.org>

--lE70ojTysbq5PnAX5JGIesfdN2sYeh1v6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/12/21 11:33 AM, Peter Maydell wrote:
> Wire up the sysclk input to the armv7m object.
>=20
> Strictly this SoC should not have a systick device at all, but our
> armv7m container object doesn't currently support disabling the
> systick device.  For the moment, add a TODO comment, but note that
> this is why we aren't wiring up a refclk (no need for one).
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

-- Alexandre


--lE70ojTysbq5PnAX5JGIesfdN2sYeh1v6--

--nF9pEssTnE3JZgKvKxFALAusWD2IMARjC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEXh6kFAwAAAAAACgkQbHknjz/NzAId
HQ//XVC6N+ImeJjup1YN9s0h/t2KIYEhj5e+PGvx7rLwbZMn35y+P/ZG96n5QIof2HLZT5CsAH33
5h5LhRAeDoF6xxWjW/F81+7OhvJ2mYfwusKu4j6lUoWEjiImjHZhirZsNnOBKY2OoIbo28qGrRwo
aixoJrI5htetYX9VzdG0RrxOqh5meYpa2+3ZDn2L+kCVsSLyRZCcSQOeyuiIlhQki5muM1QBX+SW
wGhh8lFqlip+qEVI8L4HQzLvlSh5uj/hFvjy7RC6obY8WEq2bet9tvCU38FqZlY2X7FH7t4LMwZo
0LvCzmoZQFAPTazyi1AR0JVgMicEeoCR2YwKdJ2K24FiHZf61wBU0wbZy+o0i6C+vqV2f5OBUpOy
5wXuE1d/2pmaKx4uLBBAMDVqZlv3Q5fxUQ3j0C7tH8/xFweEMNBVXm2Ddr1v8wnaxWwXLNzr1DR5
bBdx6RYkaBIjQFffzpEoEE/puH6d54HsUBXFmDRT7TTh+NrPEuX+ZmPGnRLRT7mD440bfq5HNIvd
9wFIwai1yhXJrajMPxB7YXn7uoS/K578DWxWBOhkimF+yjoP2bc+ODRyiNihaBWrBFuHzbSHxP9O
CHd+WzuEQ0a7WCvc6DopmWxMcEMWrRWF6ic/anlFvEgtFXqm+s5ILRaF0+NE75WRMxiqVFn+XPkv
IjU=
=8MFd
-----END PGP SIGNATURE-----

--nF9pEssTnE3JZgKvKxFALAusWD2IMARjC--

