Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931893AFFFA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:11:28 +0200 (CEST)
Received: from localhost ([::1]:51504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcRL-0003lc-Kz
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lvcPH-0000op-Pj
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:09:19 -0400
Received: from redisdead.crans.org ([185.230.79.39]:40858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lvcPE-000345-9q
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:09:19 -0400
Received: from [IPv6:2a02:8428:4db:b001:fc01:7e3f:bfe5:ef8d]
 (2a02-8428-04db-b001-fc01-7e3f-bfe5-ef8d.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:fc01:7e3f:bfe5:ef8d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id C6A7824B;
 Tue, 22 Jun 2021 11:09:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1624352945; bh=t0KDDwQ9t1mYELCqZcyPKc13m2Bkvm+5k/kOFkT1e9A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pIl1WEYnam5zflaLqf1WUWC+xiZZmUy/7cLR2gRT5VyUvACPQERcq35ehgFv2O+4s
 EaInFCSw21F/ZadW1iMrmY0E+3VmCdf0xTPNUjrGru8f73tyJg5i2yYMFDQg5WIPIS
 J3C9TNg+Q11m1+eDRA4KwlQ+7LZaWiEkCpyQljuv4mpRwnF+TXKpcpVvfZO0qc2l+K
 DiuBeWlj7v5gU6Ns40nibMDPBtq/jbzeAszyfbu7E4e97r+q7qTTW+wM2jkn2oYIua
 ZVF6CINTATB8aawHlBhS+6VgY0/uBOzVUuEQddPGIOZPqtyFEbkG3vxUPgaT59jF+G
 Mh69ZpHEuA2Qckdau3qf+Ahua/oyIQ19VuYNHcIfeCoHSAC9LcD4aFGktpq5YHSnAJ
 AyBuZ5CYP0UPgRmeBOLfDSZjTcpnxx5aEX6kaT4Xy7eIRXaMud7NF5PPLQW8ev88tY
 fuUoD3lf3sgj7ZV7oLgvlXOKnMg96bT+7nJKWPCxytpMlhdFlOMB/mT2mJOVoGgiGv
 U+3v0HiYk5ZYlqbEQflvsJaoul4ZOFLsAmuGairWEguDec9DS6vwWCLB0v4ltIhDCL
 Gfor6dALJNfPjstfZg4r09wrUjfdwrqDUfPPOchAZsBqchScsULpazmi06VM4UGHWC
 x+tp98qJwloaXLQj+8ErZ6c8=
Subject: Re: [PATCH v2 1/2] contrib/plugins: add execlog to log instruction
 execution and memory access
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-2-erdnaxe@crans.org> <871r8uthe1.fsf@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <a4798470-76ea-0241-b154-0820e6c0518c@crans.org>
Date: Tue, 22 Jun 2021 11:09:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <871r8uthe1.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4ZSjd49fXrqxYiPZpzHsC6RvDSzJVJTEQ"
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4ZSjd49fXrqxYiPZpzHsC6RvDSzJVJTEQ
Content-Type: multipart/mixed; boundary="fDxvqPCTkElLskQTFvxQft0a9lW6v4YAd";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "open list : All patches CC here" <qemu-devel@nongnu.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Message-ID: <a4798470-76ea-0241-b154-0820e6c0518c@crans.org>
Subject: Re: [PATCH v2 1/2] contrib/plugins: add execlog to log instruction
 execution and memory access
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-2-erdnaxe@crans.org> <871r8uthe1.fsf@linaro.org>
In-Reply-To: <871r8uthe1.fsf@linaro.org>

--fDxvqPCTkElLskQTFvxQft0a9lW6v4YAd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/22/21 10:37 AM, Alex Benn=C3=A9e wrote:
> We only allocate last_exec for system.max_vcpus here. You need to check=

> the system_emulation bool before using that information and error out i=
f
> it's not system emulation.

My bad, I did not test user mode emulation after converting last_exec to =

an array. Should I consider only one vCPU in user mode emulation?

-- Alexandre


--fDxvqPCTkElLskQTFvxQft0a9lW6v4YAd--

--4ZSjd49fXrqxYiPZpzHsC6RvDSzJVJTEQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDRqLEFAwAAAAAACgkQbHknjz/NzAK/
Bg//Tffwz3Q/njZhd3oMhgPEPsxw2kKuy1c49GsiRPzMMOSVxckngE0T83bPxHU9BeuMK5XkzvOB
3k9J/L7InRGcRYrINJfjb7iXQb5twx88oPXp5xWrQKEIau2Yd9uqDcPU06Ywi45jW59TJHc38rNy
w8LGSAme1gmDNtzpYBy8t41UhLCJVlQSEXc3l0twXG9FsC42a2FLOg6oeYm3mNl3o7XlnPSUK5QU
XDlWnZtRyHg5yw8lyto0HiPYkGDpUCP8zIeg+uYZuppk0rtmrlFK3/chm/yc7t0uaJhl0hnLcC9f
eaWoEEY/D77Yf1ywjUXU38AzMFhDK4zOYSSYuP6hQAze/hrZZcJIYOKFwbOYhGCXqMTYeA9j6FJS
GZXIMRlQpezcnsVOoajZ9ckenjcfzLfpFH77vt8rxreUsSNtxB6x7BcsBy+QApG7VnxWmzWZlmlI
exwqXvXc8HNfRzt81+fZ20FrfHk6Au8pNFcQQAI9ziMYkrRAUJ/Va5YukwSU1UBDw2B5uy2/Dx+v
mILLf4HHh0uhsG8eNzgMRTohq7FJUgECS5RYsjV4s+caWN1O96lYR/GnQ5MLBVXfFwqOhiQUADEB
Ir2dVyLVfyl9Cq8BfpnbaVdt1KJzXIenFYcaBrRoYcp3waRseVsCjD4yHKL+SOiMqi4R9FCtrf3Q
gWM=
=+OC7
-----END PGP SIGNATURE-----

--4ZSjd49fXrqxYiPZpzHsC6RvDSzJVJTEQ--

