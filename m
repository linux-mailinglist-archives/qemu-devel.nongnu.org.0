Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8431C3EC18A
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 11:11:46 +0200 (CEST)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEphh-0004DH-J9
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 05:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpg5-000319-0Y; Sat, 14 Aug 2021 05:10:05 -0400
Received: from redisdead.crans.org ([2a0c:700:2::ff:fe01:2402]:52200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1mEpg3-0001K7-Ey; Sat, 14 Aug 2021 05:10:04 -0400
Received: from [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939]
 (2a02-8428-04db-b001-83b5-0a75-e190-e939.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:83b5:a75:e190:e939])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id D705D47C;
 Sat, 14 Aug 2021 11:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1628932202; bh=jFaM5e050PYC8AaGl2uybL7AdTy85W5/YPP2EhA+efg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=L/BpIw5UK0szz2yUqh/4uX2lMm/yZP0xIWkvaRnEepH88QQ9HPdiOM94vWUpWd89/
 OKMmu7uw8wvzK3VMNsdi6zPgZiGIlZzZj8O94p/w+x6Vt2rxwgdSq3ecDnnUHoNSfs
 ZgfQdBOgl5/TMiXeVuLppgyAkSqsghtojjFIMSQ88jzdDqKyX/m/Bi7Zrzo+aQPKok
 LQul7KinSxEXn0mcOkbYMpphCmUw1OLxvsdsD8Hg3POnXb5t9y46zn13Fp3BiRKv1z
 C9fw7kXbU6bXoH4wq+faIfFfccd1aeI9FC6pkiRbpk1oCPLQ6uV+EuB5Ci+ScUAlBz
 /Lxv6bsCBbNIBQKZ3yKRJsNd4Su6QAJEkIc7aI76r4Acx2g7nXpuHpfpQlJrEcTN1+
 JzXkUnDCVZljpPb6NgTvUT8SOhGvMR38+bhLUppQ+UVMparVqW3I6zaEWOEHNZ3t9/
 /Ms2kOsyZoRWvb1IN/hRC/XgeEyYHNzphCujZT7GSPAECOzoCQ9/QuJLkaDy97HhLO
 QVojrLn3EggZ+lw8O4qkm1ks+Q6BhTPieYUEUTlQrHLGz8KvLG7goddeTjqMixPvh3
 +GlwNQqx06/D3hgNohTaI3vp1WjuvWzgf52c47YVGhaKVj64t6hmV3CJQLtrM/b8Pe
 7BXvYM+Uk9N/dGKzmvBJaQpQ=
Subject: Re: [PATCH for-6.2 16/25] hw/arm/stellaris: split stellaris_sys_init()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-17-peter.maydell@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <f45a06fb-a63b-5698-0ffb-a76fc2568dba@crans.org>
Date: Sat, 14 Aug 2021 11:10:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-17-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jOHqhybiObnUoWndBuK1TkUIkuZdis4JI"
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
--jOHqhybiObnUoWndBuK1TkUIkuZdis4JI
Content-Type: multipart/mixed; boundary="gOaraNprvZoMnEIQWa6vhoMEgaQ8qgvD8";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Damien Hedde <damien.hedde@greensocs.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Message-ID: <f45a06fb-a63b-5698-0ffb-a76fc2568dba@crans.org>
Subject: Re: [PATCH for-6.2 16/25] hw/arm/stellaris: split
 stellaris_sys_init()
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-17-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-17-peter.maydell@linaro.org>

--gOaraNprvZoMnEIQWa6vhoMEgaQ8qgvD8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 8/12/21 11:33 AM, Peter Maydell wrote:
> Currently the stellaris_sys_init() function creates the
> TYPE_STELLARIS_SYS object, sets its properties, realizes it, maps its
> MMIO region and connects its IRQ.  In order to support wiring the
> sysclk up to the armv7m object, we need to split this function apart,
> because to connect the clock output of the STELLARIS_SYS object to
> the armv7m object we need to create the STELLARIS_SYS object before
> the armv7m object, but we can't wire up the IRQ until after we've
> created the armv7m object.
>=20
> Remove the stellaris_sys_init() function, and instead put the
> create/configure/realize parts before we create the armv7m object and
> the mmio/irq connection parts afterwards.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>

-- Alexandre


--gOaraNprvZoMnEIQWa6vhoMEgaQ8qgvD8--

--jOHqhybiObnUoWndBuK1TkUIkuZdis4JI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEXiGkFAwAAAAAACgkQbHknjz/NzAI5
ihAAkUcITu5BSFp95yKm6x6bFTX6xXjmQXg1jZUouDYs84HD8Y16ht658X5CJUnOtPi7rO6I9W8t
WYALUQOXxVUqc2bO4eNsxynkv5Jjw2OYH1zkYzNBBf/zbk22XyJshxnMaO5CGDn9J4Qj4Mu+LqPC
GPtekoYMAyM/kq1IH4Gw7+JstnGhAJ7cAw3PFy1fsoqn71uDiUv9pqdKaXJYMsFEWSGLxdRHGvNc
PIUNG4ob165d2RMoGeKjxJuUJLQXol8NIE2DOe6RrTweTI7ACxwfJPpgrifQ0KZBYN05gRGwMvWR
PAIkWnktz91kXY66KQshr83gc63rtYZW7/bb7fbYpzAjJRVM6dVLi1vxK6xdYvy4rYUBkWHEKpWH
ZKCmLfQTzE2t6agxTK9/kbgn2rpqpbnSusVgC3IqZ2IjRLZQhikQraBvj+E1JgEzKXObCTlxDzjI
cU8aoR6xioERq7rY2Wj3cyy+kjZRSd2KuzLNfOu18vpOQvR2eAKCqKSJsXPVALjfyX/O7GzS+3IP
tgOOFcu0x2+YU7ydya2X74tH/ag3rjEfkd20l7A/mpH2Ci6p1+D3bV900t8gOHhkhdVfuSqm+pgV
SDT3q9lp4Xa1ZElTJu51evCQdp48ZYd6DvIdjvAccSt4tnzvuFBTupDPWLH4JS83gZ7Yosn/kkM0
HUI=
=hQoa
-----END PGP SIGNATURE-----

--jOHqhybiObnUoWndBuK1TkUIkuZdis4JI--

