Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB593EC190
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 11:14:56 +0200 (CEST)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEpkl-0007Uq-Dv
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 05:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpji-0006ck-IG; Sat, 14 Aug 2021 05:13:51 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:52446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpjh-00047J-41; Sat, 14 Aug 2021 05:13:50 -0400
Received: from [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939]
 (2a02-8428-04db-b001-83b5-0a75-e190-e939.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 98DCF483;
 Sat, 14 Aug 2021 11:13:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628932427; bh=Iaozxfa5RdgYYYhKdX6m2j8tVq5cU8TjAW6DI/GXJYs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sZgVDsgyKO1RqeImfIwnHQ2Nr0KNBNvAICnRyUx2HSTHIXdDyMl0RtWUpYwrocojD
 oBQzkzLwGhSBY2b5J5qYRzeqn3bWPkp5YayIlzqBEKnwC0xVCgBobKO2XKx94nnEgz
 EA8SKuPTmzTTx1ukNBpHzzfRMYi+Y9m8B8WC4lWtj/I2ZJ9P3m5A3bRJTnKu1gZSq3
 6EEFFkXrNLcBsYfQnD15tiS+eSWLQmUXb4tUma8B53Flg5fDrqWDJHQVhHO0ICewCR
 JIBj6JV1CxEiMkxUS8+m64NZGdAKs5R8aP1Wt7VolaWbejPiBOuafYit/EksQoW9WS
 gnlS7ryR8w5x2uVA1WS3on5cV+UHKrHtbBN+9UJ6CRlC7+199vzJfgO9ybydF+K8IL
 TfumYczMIGCZiIJ3DxL1PR3dNPtsWd5D2qQmT/UuP98UwnJKAtKo3xSC2K62m8Di5O
 WEIu6Zpz4H5Z9RS5Xv5yUjQdSh6t88ew9wXQdJT6hpJs2aXhsXfv3jn84nCf2orjdO
 g6dHm53852YSdhkYtWEgV8BbipPVrWoAtrsgArWJjNEHuazHIxH3VqdE5/JNTE26fq
 V7UKUvOcsnlDGSYuPS7q2WyXXQyJAI2PsohbcZFqPv6z2cHwyzZLqLqoZc97LCCap2
 9MEa3Xa/PldwPm4yklSDTgQU=
Subject: Re: [PATCH for-6.2 18/25] hw/arm/msf2_soc: Don't allocate separate
 MemoryRegions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-19-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <8b5cebe2-ca51-d605-dcc8-30c842cf0dc2@crans.org>
Date: Sat, 14 Aug 2021 11:13:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-19-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AoypgDWRhBqrRUwr1xW63tuxv2rCUjZV4"
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
--AoypgDWRhBqrRUwr1xW63tuxv2rCUjZV4
Content-Type: multipart/mixed; boundary="CNiefpYU98sau8OrjYlEgOhuJQFXMqmYX";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <8b5cebe2-ca51-d605-dcc8-30c842cf0dc2@crans.org>
Subject: Re: [PATCH for-6.2 18/25] hw/arm/msf2_soc: Don't allocate separate
 MemoryRegions
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-19-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-19-peter.maydell@linaro.org>

--CNiefpYU98sau8OrjYlEgOhuJQFXMqmYX
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/12/21 11:33 AM, Peter Maydell wrote:
> In the realize method of the msf2-soc SoC object, we call g_new() to
> create new MemoryRegion objects for the nvm, nvm_alias, and sram.
> This is unnecessary; make these MemoryRegions member fields of the
> device state struct instead.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

-- Alexandre



--CNiefpYU98sau8OrjYlEgOhuJQFXMqmYX--

--AoypgDWRhBqrRUwr1xW63tuxv2rCUjZV4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEXiUsFAwAAAAAACgkQbHknjz/NzAIT
WA/9GQ13zKp1WrmEI670V8x1vUbQCGkbwpXvamrDy6izNN3qhKelEB599h/5NS7kWeSNwgz5gfAW
y3+aGZ38yuLChe2s7Zec2UfEMc13/NA8RI59kllCcw1ODWmEwKb2HPr2aWfIb4QRO0u0QM5Zi8bM
ArsHxLKOGY7WULt/sxf3xJYU8Ia5ajm6y4zfzf94rCtemouXO4k64jbtVfe7vB8C7A07ipYuDlqj
jKAyc+zBrK1T74u9L6TrY/SiYy6xH6Ll7oLFq7Nr0qQOSZXeHd1IQy8QZXM82pw3iQL/Xnr+9QyB
jFMVUAhnOICuBO8hEdNDCVusIuFpI2oRV93mltF/Sc5p/fz6A//XzvekiWY6ek60C4wxnIYz4ur4
yavu2u4CxG0prjq66nOgLoZ7fVkbuLwouRjDnqAt2C/CPbKQBjExJmcRyD+dD3jsuwLZdONFFTqv
7CdPS19mtHt2zyxlSsiQyHiMzMyqe4TN9Oxv1SEgd6BtyI82/xtXASpkyg1VQ3S/q7Meb65XJpU0
6ZUEvQIcBkfmEE8D2O2DYAwKRhkVpORzacTp9hl4/2CiSK4g1TTtess5IKYRiVcuJtfphBKZyy7m
wJTrf61rLKwHSSW/nyAH5a2kVHukKziiyTVvgDmYzpfSVAZQHYrhSwll7aTI0vxVj3F/hO3LIHSE
M+U=
=s4f5
-----END PGP SIGNATURE-----

--AoypgDWRhBqrRUwr1xW63tuxv2rCUjZV4--

