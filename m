Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11B03A77D3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:17:58 +0200 (CEST)
Received: from localhost ([::1]:35736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3Kf-0007bN-HK
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lt3JR-0006i3-W3; Tue, 15 Jun 2021 03:16:42 -0400
Received: from redisdead.crans.org ([185.230.79.39]:58814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lt3JK-0007YP-3j; Tue, 15 Jun 2021 03:16:41 -0400
Received: from [IPv6:2a02:8428:4db:b001:f255:832d:4007:dcd0]
 (2a02-8428-04db-b001-f255-832d-4007-dcd0.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:f255:832d:4007:dcd0])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 31C5F1D4;
 Tue, 15 Jun 2021 09:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1623741391; bh=jNirEwy9JSQYTq/XVM588MPQYKqKKReMRmd0Dszbex0=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=QSp5yqsdHjmhtJ/dNujUfwKi/pvjAGHnsCz6vMqN87h9mBqOiD9aXMLX0cxRJJPYj
 mMEEMkEEQoP401uJMinxh4FztBZLFntHD7h6kwBN6sMnGnd75pvhRaNLen10+ou9/C
 Rv5Lj8GYclw3G2X9Jv2Srk15N8xOev4WAY3fmCt+P4tlS4hTJPvOQ74IV+eygF1izR
 TM6VKQkaT4f24d6+Zju/i2dkOGvG1m1iOStmBmiGFbC7gQ87KrVVKXIxVhepMrzidO
 VRD/olRfqzgsYoxM9zkTwrWnPmKxztaxPtXa/c0H+aMsqO8fGnnrLS5K4SsZlYSQHB
 7q3ivF3Sk9a9SJxPfERHr7bU1+5+qTHHrd0F/CFJsugL3nedVT5dApZuOHvkaVlJnR
 p5UXvYujwLJEQ8pTV+IZYX9mAhe/Ks5lJqXHOUvUtH8vr8VVHR0pcZlfRxtQPnUb33
 jcsPStcJQhmE+H0mTUn2oqVtnZ1E78ZIODtkHc6SycFHNmfeVW1Qqs+nsTEuC35Xen
 KPF7ywa2V5eG06z/LXQlzU5ktPARVrUCStTWNMXGFQaqu58RE+cBAmTINm4RIEWrbn
 74SUy5VvXcfvegeMG6cSiuahbIFfMVcyqP4H1XESEN355NcNEl8i8fS6h4H49SlrPg
 SwoYttdPzzTW7N4nzqD532/s=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-3-erdnaxe@crans.org>
 <CAFEAcA9EEOg92Vz3ZiyV3XeWXn8PV=sGm7wiaqoj==K6PoPM-w@mail.gmail.com>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Subject: Re: [PATCH 2/2] stm32vldiscovery: Add the STM32VLDISCOVERY Machine
Message-ID: <4fdbc225-3c4a-ba38-2fa6-5a031e6a1845@crans.org>
Date: Tue, 15 Jun 2021 09:16:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9EEOg92Vz3ZiyV3XeWXn8PV=sGm7wiaqoj==K6PoPM-w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MdNfrgbCTdfdc8pJkigDo7k2O1CjIpffF"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
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
Cc: "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MdNfrgbCTdfdc8pJkigDo7k2O1CjIpffF
Content-Type: multipart/mixed; boundary="wYamCvl3EFYuTv7n8ndkRibS8nhOCWq03";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>
Message-ID: <4fdbc225-3c4a-ba38-2fa6-5a031e6a1845@crans.org>
Subject: Re: [PATCH 2/2] stm32vldiscovery: Add the STM32VLDISCOVERY Machine
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-3-erdnaxe@crans.org>
 <CAFEAcA9EEOg92Vz3ZiyV3XeWXn8PV=sGm7wiaqoj==K6PoPM-w@mail.gmail.com>
In-Reply-To: <CAFEAcA9EEOg92Vz3ZiyV3XeWXn8PV=sGm7wiaqoj==K6PoPM-w@mail.gmail.com>

--wYamCvl3EFYuTv7n8ndkRibS8nhOCWq03
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/14/21 5:52 PM, Peter Maydell wrote:
> On Tue, 8 Jun 2021 at 17:10, Alexandre Iooss <erdnaxe@crans.org> wrote:=

>>
>> This is a Cortex-M3 based machine. Information can be found at:
>> https://www.st.com/en/evaluation-tools/stm32vldiscovery.html
>>
>> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
>=20
> The commit message says this is Cortex-M3 based, but the
> code gives it a Cortex-M4. Which is correct?

This is an typo. The board is Cortex-M3 so I will fix the machine code=20
in next version of this patchset.

>> ---
>>   MAINTAINERS                             |  6 +++
>>   default-configs/devices/arm-softmmu.mak |  1 +
>>   hw/arm/Kconfig                          |  4 ++
>>   hw/arm/meson.build                      |  1 +
>>   hw/arm/stm32vldiscovery.c               | 66 +++++++++++++++++++++++=
++
>>   5 files changed, 78 insertions(+)
>>   create mode 100644 hw/arm/stm32vldiscovery.c
>=20
> Could you add some documentation for the new board, please?
> This lives in docs/system/arm. Commit c9f8511ea8d2b807 gives
> an example of adding docs for a board.
>=20
> thanks
> -- PMM
>=20

Should I rather:
1. Add `docs/system/arm/stm32vldiscovery.rst` to document only this new=20
machine?
2. Add `docs/system/arm/stm32discovery.rst` to document this new machine =

and future STM32 Discovery boards?
3. Add `docs/system/arm/stm32.rst` to document all STM32-based boards?

STM32 boards share a lot in common so I believe option 3 is more=20
appropriate, what is your opinion?
If we go with option 3, I can also try to document the Netduino Plus 2=20
(maybe in another commit, or another patchset later).

Thanks,
-- Alexandre


--wYamCvl3EFYuTv7n8ndkRibS8nhOCWq03--

--MdNfrgbCTdfdc8pJkigDo7k2O1CjIpffF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDIU84FAwAAAAAACgkQbHknjz/NzAJ/
kBAAos3zsY+12jtEgkSCk/XOf5OpKzTp3sKo7MSqe6yEiXcwImOJW6uekGep+FJAeTVXxUAhCAwa
UfpoHP92Fj2i0d93GzCNUtdU8P0vJtiAYGPZTTlP2Y9L/YiqyJNibsezHnosJGp/iRzOpCZsbKE5
ItLBtX322RXC4Xdw1s7pbXV4xeKgPBQ/OKIi6ePPerMJWTZ3BgeT3gGUzsz00ImLpHsClMC7nZtl
Ghs3lk6p9QGQY5H9/8DjwV5TS8oj2H7q6e2OaW1i7gBylTNLNsDFtVlfd0smdhqKtUII/7hb4ZVX
b/x2u6GhxMxTh+hz/rrV1z3tlhsaQQ/uPZoGacLFgMiT6bA8cOTTrxoDCIzDRkIZDp7MhaJoPpeG
r4TdsvgO0un4/fh389lA+ewqkMTyrOzmnr7xw+qIIY99xEfCVNDFP4gVHsDMjX7B036SWg5HV/ZF
vxMY2ftH6u92ncKAHmL58fvGhbqBOrZ33MrgVsVeNjFRBIKW+rJSZJtVXXnN/PDYALKBPGhj4wqM
BSYi31FF7W/6S7go4EVnsKTJj4F4Mw1/tZkqZDQg8vE9D9ezhCwhSA61FQQKx8x/mamlNEu8Nm0j
QuBYY4JJGjaPtO+Za+c3EJrleQIuYh64K0ywrM1S9xLoXcEfmaPdm5iw0HmLkLOFvSTMpaSZjBMW
7ac=
=kgti
-----END PGP SIGNATURE-----

--MdNfrgbCTdfdc8pJkigDo7k2O1CjIpffF--

