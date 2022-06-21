Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CE2553025
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 12:51:10 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3bTR-0005HT-Af
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 06:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o3bRb-0004WK-3c
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 06:49:15 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:46381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o3bRY-0000SN-QW
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 06:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=to:cc:references:from:subject:message-id:date:
 mime-version:in-reply-to;
 bh=EcdnTLr7ozu9Ygz76JgmFTimaZKQL07Aezm1ZEP9xoo=;
 b=g67Gvo46v9+o8HVEoiu2A+GbhGBe4Uh253I1OZldCRjt66n69C4jKk6N
 CDworm3adYChv97v15yOQENOHBXRJdkubL3Mx/Mgz8i40Vutp9yHhwDcM
 a1UmWvoXABtOI/hxhQmZnJJi4BxR5bYA+5i7HtkrCwkOS/3GbBZ473Rn6 0=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,209,1650924000"; d="scan'208";a="17376404"
Received: from nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr (HELO
 [10.204.4.69]) ([194.199.1.52])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 12:49:10 +0200
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Liu Jingqi <jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
References: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
 <20220620152757.5dd721b9@redhat.com>
 <76154956-85a5-9031-0168-1770d70adddc@inria.fr>
 <20220620180549.787983ec@redhat.com>
From: Brice Goglin <Brice.Goglin@inria.fr>
Subject: Re: [PATCH] hmat acpi: Don't require initiator value in -numa when
 hmat=on
Message-ID: <7eb4ef82-1e03-1135-2160-9673d2576849@inria.fr>
Date: Tue, 21 Jun 2022 12:49:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220620180549.787983ec@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RD3eYRxhdoBxIwLJ4dPohodGT5v2xalRX"
Received-SPF: pass client-ip=192.134.164.104;
 envelope-from=Brice.Goglin@inria.fr; helo=mail3-relais-sop.national.inria.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RD3eYRxhdoBxIwLJ4dPohodGT5v2xalRX
Content-Type: multipart/mixed; boundary="kObwiP5ZNOZh4Nkvz3mIlhtAUpavgLzz4";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Liu Jingqi <jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Message-ID: <7eb4ef82-1e03-1135-2160-9673d2576849@inria.fr>
Subject: Re: [PATCH] hmat acpi: Don't require initiator value in -numa when
 hmat=on
References: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
 <20220620152757.5dd721b9@redhat.com>
 <76154956-85a5-9031-0168-1770d70adddc@inria.fr>
 <20220620180549.787983ec@redhat.com>
In-Reply-To: <20220620180549.787983ec@redhat.com>

--kObwiP5ZNOZh4Nkvz3mIlhtAUpavgLzz4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


Le 20/06/2022 =C3=A0 18:05, Igor Mammedov a =C3=A9crit=C2=A0:
> On Mon, 20 Jun 2022 17:24:18 +0200
> Brice Goglin <Brice.Goglin@inria.fr> wrote:
>
>> Le 20/06/2022 =C3=A0 15:27, Igor Mammedov a =C3=A9crit Machine (2966MB=
 total) +
>> Package P#0
>>>>      NUMANode P#2 (979MB)
>>>>      Group0
>>>>        NUMANode P#0 (980MB)
>>>>        Core P#0 + PU P#0
>>>>        Core P#1 + PU P#1
>>>>      Group0
>>>>        NUMANode P#1 (1007MB)
>>>>        Core P#2 + PU P#2
>>>>        Core P#3 + PU P#3
>>> here should be a dis-assembled dump of generated HMAT table
>>
>> Hello
>>
>> Like what I added at the end of
>> https://github.com/bgoglin/qemu/commit/d9b3f5cb1514adafa644afcc2a363f2=
dc9795a32
>> ?
> yep, only full version including headers.


Thanks,

I split the patch adding the new test in 3 patches, reduced memory to=20
128M total, etc.

I am not sure I understood what I am supposed to put in commit messages. =

Can you check the 4 patches on top of=20
https://github.com/bgoglin/qemu/commits/hmat-noinitiator before I resend =

them to the list?

Brice




--kObwiP5ZNOZh4Nkvz3mIlhtAUpavgLzz4--

--RD3eYRxhdoBxIwLJ4dPohodGT5v2xalRX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmKxoiUFAwAAAAAACgkQRJGQ8yNavTt0
qg//Z4+0sEo2UHUomcWCAx1ksVTXXDV1os1J0mZcHAywTKiWdghBIDTO5Y9obf1Zs5+tR70V3fkx
sK7A9y0wM/YP2H/cAmbUkRfrL8FYQLt3KjAYqk+EJS4NEE8w+PM7AChNvOBeHVVlD1wiFaQcfXhS
pmpstwBDi3nG9wmpxJBIPGstm0VeLzsPW82ZgvMdWgRfIrKptV11h7AZ0zj6DQsqqQkTM/w5NUvC
9hT1HGNjoDJI42mvwUQJYFLDUdDxy/8Oy2SuEBNZqkwaZK0MeKI8jEJvP6M0XP0r3voLhIejmZMP
OT9s6s6LLxcVYvJStPBFtozZwDrJv/SM13NQ8yUHbMw0UDCwgb+kC1zWb0I3NnC5A7oXSwjB0eOh
M75mLtAQBTdwW54hR3YFzbWVQ8lQvoNpi7ysd0gk3ASJKKNF0XDH9VI+mi4Vw1yh5+TpCpMKubX8
MF4klYLjfRSlfWprQL/E8oIEVN21LgklLGUHmNTENTPeOqfamt8UrrCbmNMN2JE8Igzo2bgOiVCI
Vw8SMcWjQDPaXisV+XdqpYQHXVhA++8OHMp0SfvHZF6IcuAoGTc5nvQcT+i5QsYhhkKVkOrD+z6/
DC5mOIWzo1FshhoFFc8wxZh8gaSXZBpIZr57Va8z2tCicIH7uYj/BJDuxEDJr/f0FXNTtqcK9Xrw
RyQ=
=wVix
-----END PGP SIGNATURE-----

--RD3eYRxhdoBxIwLJ4dPohodGT5v2xalRX--

