Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8B93AC80E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 11:53:27 +0200 (CEST)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBBm-0000dd-CW
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 05:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1luBAT-0008G7-3e
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:52:05 -0400
Received: from redisdead.crans.org ([185.230.79.39]:52110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1luBAP-0007X3-Jd
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 05:52:04 -0400
Received: from [IPv6:2a02:8428:4db:b001:bfbb:bd12:fd7f:a169]
 (2a02-8428-04db-b001-bfbb-bd12-fd7f-a169.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:bfbb:bd12:fd7f:a169])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 0E24F22F;
 Fri, 18 Jun 2021 11:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1624009919; bh=39VI25vFPeogmbVVBz82e2YadmQcXrefFNp6PIeNJGo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CGrVo3tstvQ6iW0c79LT8Gkem+s/OOr45/SeEPPrrOfO76cCh2mavphiPyjdiIgZr
 19G9JgserJJwPbBmaR8zqGosg+BGF/24hAJVWkRwpvoYYPny8x5OfFUNGXGWswJ6OU
 b0+nK+u0S35AB5A7R881Jc6ZHaZhIIRn9v2ohL4vkstxRM2xR/Nbl5Q9LTaYw9Y9Dc
 oDmGZEpe2hKUZFWSswnshYIl/FpK0r6QDQukf9FhQ9xk0jgUgE+RBV5Hedh3zlo9pB
 jeRQDqfdNltlaAhuaxWnagxWAWu0xlCsUCD2rWtlgujYRYp3kCDLbyJyM93E8w04D5
 yr0weN+2dtEPGl1VqFV1x6btE6inQWHW3jFFjoyGvKfFeXdHxtwOjKOe9nI1o/MlRP
 9gM+X80MXIFr+o66sQB9i3Tfdv5s/0htMje6UQY0InEvw7yP/8bRm8f9sW8hT0aNP+
 aDsgebunySd7bjLXhbmzi6qGMcHPXSa1SofZqoESCZj9Y6Hy30NmUmzNwwQ8Fh7Nwo
 /oLbtfhc34UE3SOVuW5pJgupblK9BS8fwULgI2h6pyMTtAUMiJn0BRIsYa+mlRxvPb
 h1C2A0hO1147uxl0HJHoEfE6JPZuw84V/UY+22fZNfnPm970Q5+GUnNefZwWVAjF4z
 DBqZSPeEJ6qxpKvziFHXUHR8=
Subject: Re: [PATCH v2 0/2] execlog TCG plugin to log instructions
To: "open list : All patches CC here" <qemu-devel@nongnu.org>
References: <20210618091101.2802534-1-erdnaxe@crans.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Message-ID: <f1dbdf1f-e326-d1e2-b83e-61d57d181ab5@crans.org>
Date: Fri, 18 Jun 2021 11:51:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210618091101.2802534-1-erdnaxe@crans.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="K97kVlFuxzFsWrJhinr3gYnEC4WX4FcVc"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.254,
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
--K97kVlFuxzFsWrJhinr3gYnEC4WX4FcVc
Content-Type: multipart/mixed; boundary="ofcJMou8eJAPds5D8cGpryNgdKYQGSaTl";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: "open list : All patches CC here" <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Message-ID: <f1dbdf1f-e326-d1e2-b83e-61d57d181ab5@crans.org>
Subject: Re: [PATCH v2 0/2] execlog TCG plugin to log instructions
References: <20210618091101.2802534-1-erdnaxe@crans.org>
In-Reply-To: <20210618091101.2802534-1-erdnaxe@crans.org>

--ofcJMou8eJAPds5D8cGpryNgdKYQGSaTl
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Supersedes: <20210614090116.816833-1-erdnaxe@crans.org>

On 6/18/21 11:10 AM, Alexandre Iooss wrote:
> execlog is a plugin that logs executed instructions with some useful
> metadata including memory access.
>=20
> The output of the plugin is designed to be usable with other tools. For=

> example it could be used with a side-channel leakage model to create
> side-channel traces from QEMU for security evaluation.
>=20
> Changes since v1:
>   - The output is now easier to parse.
>   - Use QEMU logging API rather than FILE* to write output.
>   - Don't reject memory information in user mode.
>   - Merge memory information with instruction execution. Now one line
>     means one instruction.
>   - Add documentation.
>=20
> Alexandre Iooss (2):
>    contrib/plugins: add execlog to log instruction execution and memory=

>      access
>    docs/devel: tvg-plugins: add execlog plugin description
>=20
>   MAINTAINERS                |   1 +
>   contrib/plugins/Makefile   |   1 +
>   contrib/plugins/execlog.c  | 123 ++++++++++++++++++++++++++++++++++++=
+
>   docs/devel/tcg-plugins.rst |  22 +++++++
>   4 files changed, 147 insertions(+)
>   create mode 100644 contrib/plugins/execlog.c
>=20

--=20
Alexandre


--ofcJMou8eJAPds5D8cGpryNgdKYQGSaTl--

--K97kVlFuxzFsWrJhinr3gYnEC4WX4FcVc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDMbL0FAwAAAAAACgkQbHknjz/NzAL+
Cg/8DASZyFt0wK8C3E8gLAeQWeoPxDxxxGWGri5pgBQMF8nBgC/opgICuXB5RXhl4Y7Ptol3lYaw
aA7I389xQZ/UfbA+Cfn2uQ0Ax5sNYvwz0gvsDz9q+rTWQHzL6k5IE2Zl9kzd/Q7URV3F58EAaJAY
2CAlNLD4dOAmNKEEWTodixmo/vmsQVlRmkGYYxUORwUozEf+OSCxrb3lDVh9xQVeKjQNMgV2dxRw
Ng5RCxumbC2oJtoSczwbXZlU3FDuiUeRo7455UAJaJC4AAyZIV4ed+/z2CRBfLcRBdymNsBxtt2q
n5fUjDXO/1UUfdfwntT3AMc0YKMpWwvL1vrLCbZ/S60PmV4LVeVVGR1zB3dDZA9dDyaOyUETC492
yE8BgklDRCqx9GBw7RvLSZig7rYgXedyidqEtYFkyTGPG/k+IcUzhAByVopNBdEV/us6P0Vwn2l/
V8Mu/H8x8E7AjNku3X2DbY1IbPa+jsHTSSFGeVXstSVkGCnEFagvwcjYAcZeSXh/h70Mv3++3gBM
btmjEeULkOKG2EYbzNBiRP7QZaTYCkUv90tKhp+cGAztiZtiUqTQPzK06zv6BMgCD6r3aTwC78/+
CJ+6iV3fAJago8JoskbccNNqXyKN9bPdioKC7CRzbCY3B3YGkROteXEsZm/Y1uuBjibCphu8VjXM
TUU=
=jJbg
-----END PGP SIGNATURE-----

--K97kVlFuxzFsWrJhinr3gYnEC4WX4FcVc--

