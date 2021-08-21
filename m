Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDAF3F3A4B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 12:44:31 +0200 (CEST)
Received: from localhost ([::1]:57196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHOUJ-00037t-2R
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 06:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1mHOSp-0001mA-G3
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 06:43:00 -0400
Received: from redisdead.crans.org ([185.230.79.39]:48132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1mHOSk-0008GC-ET
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 06:42:58 -0400
Received: from [IPv6:2a02:8428:4db:b001:1574:dec0:2234:7168]
 (2a02-8428-04db-b001-1574-dec0-2234-7168.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:1574:dec0:2234:7168])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 326E828E;
 Sat, 21 Aug 2021 12:42:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1629542565; bh=VTmsTDYkg8vCHQ9zrAr1xgMB59x4o5/1zYOEjO+AcA4=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=LuMg4qbUaf2b52VUeZubAOpG1T/SLjvVY3XQLtmpbErBgpxG8uKox1FPUucOYGk8R
 RiEccw+bdLNlB7lSPMNE8ldTRG0qizBMBVZTCqwU64643egyE0VoZE8qtkjQoq1948
 jDg/Lq/MlRTuzB6npNvcDTHAw4Jo87KCn1Mj6EbRgL7kCQt6nLewXtjtEi22cPLHOe
 q32S/D0igvm/QslkKVMCl8krqYyeweYK35hQ0WoDLD/NmIiaOuHeIOH4NdIYNwcDDF
 Z7EXXQuWG+McUOYNSxkPM71lAK+K4luIPU6R1BvIFbDoWV+I/sAyxfjwsys8A+dMnA
 6E6+v/axl5f575eaN5bLnnuI26fGkpXoydrsLb6j3vB1WmH0sAn7BRh2UWijJLPmbi
 0ybRCK5t48/QkPekIMqeu61mdNLmIQnfzogR53CpBILpFbW6GMOqlkv/W2PyRBZtuc
 pb6lxQSzergBQemETfkrTxl8o/GeOKPndLXl6CFHjsOZNJ/nqmjNFV8jLaE746kmOZ
 sICuqkg4RIr4lMeSQI8Z9MzvTA8EFkMb3OspQMZ9lIkVTpYPfmTp6/TFZvcNL/oh4f
 lTUPt3QwtynVV3lTsCMswzX2gETiUzsOT25XFq9r6PNWOeic0FKa5r2fMujvYSkVUs
 68py30rv5SrKm6lX7OY9S+qo=
To: Florian Hauschild <florian.hauschild@fs.ei.tum.de>, qemu-devel@nongnu.org
References: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Subject: Re: [RFC PATCH 0/1] QEMU TCG plugin interface extensions
Message-ID: <9f946305-f5a7-71b9-8435-4f72b2df7478@crans.org>
Date: Sat, 21 Aug 2021 12:42:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XpYAT79hUc6sFKOuOo8IPtc4YOrU3hW0O"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.49,
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XpYAT79hUc6sFKOuOo8IPtc4YOrU3hW0O
Content-Type: multipart/mixed; boundary="AnAvf6LFmGpJTRvXZVgow1Zft4oJKOONO";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: Florian Hauschild <florian.hauschild@fs.ei.tum.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Message-ID: <9f946305-f5a7-71b9-8435-4f72b2df7478@crans.org>
Subject: Re: [RFC PATCH 0/1] QEMU TCG plugin interface extensions
References: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
In-Reply-To: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>

--AnAvf6LFmGpJTRvXZVgow1Zft4oJKOONO
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/21/21 11:45 AM, Florian Hauschild wrote:
> Hi all,
>=20
> I extended the plugin interface with additional functionalities.
> I wrote the extensions for fault injection/exploration reasearch using
> QEMU. The additional functionalities for a plugin are:
>    * Read and write guest memory
>    * Read and write guest registers
>    * Allow plugin to force QEMU into single step mode
>    * Flush TB cache from plugin

If something is added to read a register from a plugin, then execlog=20
plugin could print the operands value of each instruction. This would=20
definitely be helpful for side-channel analysis: the Hamming weight (sum =

of bits) of the last operand roughly models the power consumption=20
side-channel leakage.

If I recall correctly, there are some concerns about allowing to access=20
registers inside plugins. Past threads about reading/writing registers:
https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg08741.html
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg04588.html

Thanks,
-- Alexandre


--AnAvf6LFmGpJTRvXZVgow1Zft4oJKOONO--

--XpYAT79hUc6sFKOuOo8IPtc4YOrU3hW0O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmEg2KQFAwAAAAAACgkQbHknjz/NzAIl
DRAAnvLyiWtDVyXh38+f3PRsEyyihrG/Zvuf9vy/KTwPvMn1Mm/oVsEvWXVHct7mIBC975C3/7ls
VFMA69cK+QuGLL3IndKOylp+wGgpkX5mYxsadR3Er9oUy28WGaR5WAyUfcxpCgddtL8Wu3xKsluj
5lBQ8zUacHRFIyjdn5aftTB5m2OkJwoEJbqVWu/B9NJ0MeN4JJdg4gBqSpXVHR35QzeUHsb3tPDe
IHABiblOGMjzH4B9Izgn//WbB6z2l4XvUynew6cBEaxDgyhrojd7soceUE3RXe3j7rcB1cdHIsgb
8q6urJJapPuETlxf50n4nkg0oMgqvFZMbkZyOp0H7ktG/bqQGEPrAccWsqEO/INfsFezgUqEFW6w
7TocW4t+6NvQiQwlBGaJ94mSt5wKtA6EVMsXG8dcVdDzZv2OaTC5q2AYEuA3w4Wt0hcwgl1+8MiY
/8wf2i5nfhcHVhANwwKIn6ck6Op/8TGLrXvdah0hwiVEYtEOLnMv/xvGyoGTWc98ms9W/sX3YWb+
0pzlL+8oz3/OZI/W2tXO1NtD/YbWZpnIhN9d+S5m9VSOI/Ta7KhZXCB/suMCF6MBW8EJsBz546bk
kKADcJ/+hq3PzO6SK+LaNJl7c1MoLi4+rMP1pz+LdSNO3SSX33x7X+ht+avJsfJ6+RAmjWmIJK1g
MoU=
=Z6KV
-----END PGP SIGNATURE-----

--XpYAT79hUc6sFKOuOo8IPtc4YOrU3hW0O--

