Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAF5520D4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:28:03 +0200 (CEST)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JJq-0002z3-DM
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o3JGT-0007Ye-FY
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:24:33 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o3JGK-0001rP-RC
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=to:cc:references:from:subject:message-id:date:
 mime-version:in-reply-to;
 bh=s5ZS3Ych81rPouYq16NU1Y7ssrVD9LYx0lXU9i7D2s4=;
 b=KliR5Scg4TDJPyj+zXCynfUnrZlrUPRUW2gA7QxPL4KOMhGqREhFqQHA
 5AxqYHKVu7LFIUhzvfj634lNOcfPfGnFuVPL4MXH+Z4GJhy1d4bFmtHFj
 01YUZLHPqjvqjkYqwnINeua9frzJ4UpGg/IFJJNIk/S7ZB/f5IcH/Q+x2 o=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,207,1650924000"; d="scan'208";a="17302116"
Received: from clt-128-93-180-184.vpn.inria.fr (HELO [128.93.180.184])
 ([128.93.180.184]) by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 17:24:20 +0200
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Liu Jingqi <jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
References: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
 <20220620152757.5dd721b9@redhat.com>
From: Brice Goglin <Brice.Goglin@inria.fr>
Subject: Re: [PATCH] hmat acpi: Don't require initiator value in -numa when
 hmat=on
Message-ID: <76154956-85a5-9031-0168-1770d70adddc@inria.fr>
Date: Mon, 20 Jun 2022 17:24:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220620152757.5dd721b9@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="y9JSRYU3bTZya0HeGIsrNxA5m6gwU2XE9"
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
--y9JSRYU3bTZya0HeGIsrNxA5m6gwU2XE9
Content-Type: multipart/mixed; boundary="33Zm9eRZw0ZrBJ13kWGxyaoBWg5KPccwH";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Liu Jingqi <jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Message-ID: <76154956-85a5-9031-0168-1770d70adddc@inria.fr>
Subject: Re: [PATCH] hmat acpi: Don't require initiator value in -numa when
 hmat=on
References: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
 <20220620152757.5dd721b9@redhat.com>
In-Reply-To: <20220620152757.5dd721b9@redhat.com>

--33Zm9eRZw0ZrBJ13kWGxyaoBWg5KPccwH
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Le 20/06/2022 =C3=A0 15:27, Igor Mammedov a =C3=A9crit Machine (2966MB to=
tal) +=20
Package P#0
>>     NUMANode P#2 (979MB)
>>     Group0
>>       NUMANode P#0 (980MB)
>>       Core P#0 + PU P#0
>>       Core P#1 + PU P#1
>>     Group0
>>       NUMANode P#1 (1007MB)
>>       Core P#2 + PU P#2
>>       Core P#3 + PU P#3
> here should be a dis-assembled dump of generated HMAT table


Hello

Like what I added at the end of=20
https://github.com/bgoglin/qemu/commit/d9b3f5cb1514adafa644afcc2a363f2dc9=
795a32=20
?


> + a test case, see tests/qtest/bios-tables-test.c
> for the process (at tho top) and test examples


https://github.com/bgoglin/qemu/commit/643dfa2de8b3e1f5b5675825e5d1be5c93=
a9549c

This passes make check V=3D1 but I am really not sure about what I did.=20
The doc is far from easy for new contributors. Only HMAT matters here,=20
but it looks like it wanted some other tables too. Also I don't know=20
about pc vs piix4 vs q35, what "tcg" is, etc.

Advices appreciated.


How are we supposed to send patches that contain binary changes?

Brice




--33Zm9eRZw0ZrBJ13kWGxyaoBWg5KPccwH--

--y9JSRYU3bTZya0HeGIsrNxA5m6gwU2XE9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmKwkSIFAwAAAAAACgkQRJGQ8yNavTvK
kw//QcuL1+O6prZm3n2/l938KtSwo5GvCMhMUqX6Jbj6PmLunQWNpJdZF9s8BYK01qp2Kmbbh9NA
4YfyLzLZWbHG8V1m+CWd6oqusDh4/vxGbgfJdU4XQx7UwxbXQ2sezNG5j/nbZgCNXF4YrHQpbsA+
nbNqo7p7x0rFsIq/Yk7nA4NWIhIZbwFJt9VSxxbY0v1pg7wYFv0RG92eZ05Z21g0pNFsP1uE7DCX
fYTdby/wLFKNBFxN8MUko2hThhFaW/q428VITtHAnzH+smYQjqXUWUXRYuCt2lY8i/mlj/Zqp4Sq
LFQUJ8s2jSZ58zamvRsEMN0mnRqTQQvLf20P0Be3ydhZOXBtYLdx2nI5s7Zu3KRc2KxrdCKcU5yc
RiIMvxREXAFlxtB6rGq/zN4DHof305hvI+49pPp0MFuoVYUZP+wWvGyy9LWXhr8cEOZA+zOXhGfp
SRXoy8PHLfkzooaLO3bk4eePmlgoAxyhH+95MrrTurlqXLe00rYuuTX1FBVLBvuYUdRqoCncDgnB
pa28nhJdu3bwngIeWAxrtcbv/1s12Gs5XP5iv0otX6Z/nyA/CA52soiYl4HQw4UcTTdKMbI3hSw8
/5YIBAEG8Zx8jaWVdoHx/0wFzeX4f2iW5B9W1O3DO9szlywQ0N8e9V4oy322YoxjHyhAf/q9wbm8
/DA=
=BzBP
-----END PGP SIGNATURE-----

--y9JSRYU3bTZya0HeGIsrNxA5m6gwU2XE9--

