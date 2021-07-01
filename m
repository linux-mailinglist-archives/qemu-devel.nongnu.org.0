Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E283B9653
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 21:01:58 +0200 (CEST)
Received: from localhost ([::1]:47994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz1wj-0007xj-It
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 15:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lz1uX-00071R-4F
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 14:59:41 -0400
Received: from redisdead.crans.org ([185.230.79.39]:58692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lz1uU-0004Z2-J6
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 14:59:40 -0400
Received: from [IPv6:2a02:8428:4db:b001:7ce6:7b5e:a5dd:8c2c]
 (2a02-8428-04db-b001-7ce6-7b5e-a5dd-8c2c.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:7ce6:7b5e:a5dd:8c2c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 4BAEB467;
 Thu,  1 Jul 2021 20:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1625165968; bh=AcwqyQYhq1gEZDrKblsHwABgIFZHlpcZwo5j4GWLk5o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bc+Uk55asQ9zZGVBK0uzKH8I2PbqvYvCEzG4am/troLCSVgzgbqNUzd5g2s2VkYbj
 VeddSsciM2Cp43DkjK2rQtfZQEmSEgA842oT+fu1ZRWB7nh2wE2CNG0umNn2ga62i4
 S/d/odMMY9ayZauHalIw0V30fW5qsBuOdFLNMlVfmDVHJENRVa1qKuixGkMU0Gv37U
 +1YiijbAtj1E3jgyP4BpjzT05ARYpdv7cVpa1ShXWq/A3N6ptAyK2lVsh+IqZxLfeN
 kqw+cvd1K7EgBuG/htPC1IoOFPofCeQUcuooJEMGGQ+MZRo4JQEZB8SHoyLEWNvbwv
 QDon7zGucX4HZm+ez1DFWLz3XTh/gXW0BAETJFzvgY2SenU0hJ33IP4QBXYzQiNxiG
 PlhdIev+bUda+kkNtZ+64PtQxCSrUb0N2lpqjAeYLHo4SWl5w5KslRqZrdjXVD1VA3
 Pbya8F+DjfEZPVPU3rba1TN6irBHdv5cEhEOIsIYcYCvu+6E9UfLdv+0+M5ZuLBDmm
 VGa8PObnk1o4z6ovcilA/b9p3cROCaWesAAOlzzQ3VOaHpxv/e30bUllRq2j4jsg/5
 ujNdJqtwpQiu/mjzddyP4Cos2cUCxa/Z91JU76ky6NXONvkOP/B3VrR2LUru5kaYHg
 gCpoBn0OTuUPv7P1QDuFXI68=
Subject: Re: [PATCH v2 0/2] execlog TCG plugin to log instructions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <87bl7lq361.fsf@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <fb9922d6-5003-7a16-286b-022e78d72672@crans.org>
Date: Thu, 1 Jul 2021 20:59:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87bl7lq361.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DUPh1UsQMEMG9KzLGwwaXUU1XWakqvBQI"
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
--DUPh1UsQMEMG9KzLGwwaXUU1XWakqvBQI
Content-Type: multipart/mixed; boundary="368HUYXndQNEq2JqUTwJNPducMkOpgnkx";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "open list : All patches CC here" <qemu-devel@nongnu.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Message-ID: <fb9922d6-5003-7a16-286b-022e78d72672@crans.org>
Subject: Re: [PATCH v2 0/2] execlog TCG plugin to log instructions
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <87bl7lq361.fsf@linaro.org>
In-Reply-To: <87bl7lq361.fsf@linaro.org>

--368HUYXndQNEq2JqUTwJNPducMkOpgnkx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/1/21 8:49 PM, Alex Benn=C3=A9e wrote:
>=20
> Alexandre Iooss <erdnaxe@crans.org> writes:
>=20
>> execlog is a plugin that logs executed instructions with some useful
>> metadata including memory access.
>>
>> The output of the plugin is designed to be usable with other tools. Fo=
r
>> example it could be used with a side-channel leakage model to create
>> side-channel traces from QEMU for security evaluation.
>>
>> Changes since v1:
>>   - The output is now easier to parse.
>>   - Use QEMU logging API rather than FILE* to write output.
>>   - Don't reject memory information in user mode.
>>   - Merge memory information with instruction execution. Now one line
>>     means one instruction.
>>   - Add documentation.
>=20
> Where you planning on posting v3? I'm just seeing if we can get this
> merged before code freeze in a weeks time.
>=20

I had a deadline next week but I managed to move it later, so I can try=20
to make the important changes tomorrow and send v3.

I think I will contribute the support for triggering the beginning and=20
end of tracing in another patch as I believe that's something we don't=20
want to rush.

Thanks,

-- Alexandre


--368HUYXndQNEq2JqUTwJNPducMkOpgnkx--

--DUPh1UsQMEMG9KzLGwwaXUU1XWakqvBQI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDeEI8FAwAAAAAACgkQbHknjz/NzAJq
Cw/+N9ikb6CiP1X+25/CKYNg7h2xmldqrY9pWOPBfOzo5bbIC0SuRL0oF+/IlCCVyBkWn8+DONLh
s1uu5OqOTYFVYQp41aeKsFn9zyk59lEVsCnsDgS+tBYWDnOJC4XC1zUAwBcaS4g6fxc8OvJhYfIX
lCAOz7TS8VU3D0JQEFkcI8CDTaOSMdUDyq43/XlhT+wskBmWW+n0pQkyWuNigA6pjS8pdMKyHMmQ
EFKFjto0f5A1mc8On+hV5BLZl2iO+uc3YaBsqDjqsN7JgS+IJ2K2OeAIw1wMHsDKWm27MsFqIXcE
ROlUCB0rmzf+qA9YQQnLm73id63rIYOHN25Oo+wCUgRMpRYZPOOn6RI/uw5QH4WmwTid7IrtvD1k
6M5HZYBjeXXu8JkmrBlZWwpNobTzmw5lZnjo2LIZ6Uh/ABV1GQRjUkauYlhZpJdNzSNRJncSyVQ9
WnWtOZ6dZbC2CKwsi5d/5Uub2Gi135Dq/ttkv0s1waGRHaIZl2Qxgd/eA+Npv075cYI13OAFboab
ExCHXwhbW1ZSPdjpFb5pnBTDgrrslpGYjOkdUWa+bKev7A7bSDfGlfkEhIkbdUqyfmrWSPVDltHn
PyEGmLPLwRLSyeDMvbAGXVqS4G/dRjjcRjujZDashRvfTUceZc9+L0znboH/wkv7PFmQm1fEnSu6
xmk=
=huAC
-----END PGP SIGNATURE-----

--DUPh1UsQMEMG9KzLGwwaXUU1XWakqvBQI--

