Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4AC2DFDCE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:56:59 +0100 (CET)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNYQ-0005w1-G5
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krNXI-0005Pu-UN
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:55:48 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:41096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krNXG-0006V7-Vz
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:55:48 -0500
Received: by mail-oi1-x233.google.com with SMTP id 15so11694048oix.8
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 07:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=gqZbovjBHeU00mx8Z3cgjOThT7TNHglg6KSqfvbosvc=;
 b=gLX4XAtixz3HTFWrNqnQx3a8JwvPZmLvjIXF54Uc8vYIBITpC6PQaZgn+IlU9DjFQT
 S7xxeq+LPTOJDvgAaj6ICidGE8vK2MCHvO0Vut1ag0Wv00Pkw1q6Nl1SM0WIH3f6Nf77
 G0fE0YA4Ch+ALNYhZYpCRFQoS+BIJ3WZKtb4wGd/5KqGU55HOg2c4QaHd3fDnUuXEmAm
 bA+E3+biWradoV5hdDKl/RXCICssKIt9R/EqZKWI/l03bmSupHCmmWWCf0HJuxdiewXG
 B/06rW+oelV6IYFRjVgAE3aDQDuu2y3BR1j/EsH6KQX99HAaiQzQDfFR709fdY6ZD2Js
 dmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=gqZbovjBHeU00mx8Z3cgjOThT7TNHglg6KSqfvbosvc=;
 b=npNfdI8wBolkZ3vPapPv/lXX1WqKPqLl4D+4wDDT5vY7BzUiUeVHfMsia8V52f0MLP
 SS/Jq9XM2FGWroY/LdtHJQIWcSV3F2lEf/HCR23kSO+D7a9+kAeNYU5op1sSXxsbZljO
 8woV1nWGmx+X6RkEPL1dGxc7RamQTGJqEQaBApM1IGaePSlq6vL3/deIh1luI1dFU2N9
 vKQOrHelIfVDgoi6mgPk+zkS9z9vkPrcaWvnU/nMBXUQ5w8qJkuhG7HvTTC3+En3xbvj
 EjY9nHgM6JdiaRQBedOWCD+jMz0Qc2LwAyAl4Dqi8vVoFDbQ783SyzRoHskydwXumivs
 bUcg==
X-Gm-Message-State: AOAM533YZ4pex49KLSju5PJeDMPXmAH6WlK3kU9y6Ni1hLwT5nPCh0fP
 plNmdqnGrxbN7qOpOrwl/Jgsduo/IAw=
X-Google-Smtp-Source: ABdhPJxqwkc/oI+sIBDhxML/PFzO2oPAkhwJJ0IXsmRbCaanfntP6k0b5H1F1IHDxV61qbVWyBE+gA==
X-Received: by 2002:aca:4303:: with SMTP id q3mr11584824oia.133.1608566145520; 
 Mon, 21 Dec 2020 07:55:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i25sm3863942oto.56.2020.12.21.07.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 07:55:44 -0800 (PST)
Subject: Re: Dropped/disabled NVME support in qemu
To: Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <bcf1a98d-e86b-7b34-e384-b4b7e0e22747@roeck-us.net>
 <77d714a6-9922-1541-9f32-6ccb6ff9ea0f@redhat.com>
 <X+C8dpngmpVsy0Q3@apples.localdomain>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a9c08af4-50b8-a8f7-b6c2-31cc3a3974e1@roeck-us.net>
Date: Mon, 21 Dec 2020 07:55:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X+C8dpngmpVsy0Q3@apples.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7QWuco0Qw4y9HyXdxt91rL7Zp6JL3IY8i"
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7QWuco0Qw4y9HyXdxt91rL7Zp6JL3IY8i
Content-Type: multipart/mixed; boundary="xj2xnWGS5RXzCLVU2jY4u3Vx49jjPFivv"

--xj2xnWGS5RXzCLVU2jY4u3Vx49jjPFivv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Klaus,

On 12/21/20 7:17 AM, Klaus Jensen wrote:
> On Dec 21 15:11, Philippe Mathieu-Daud=C3=A9 wrote:
>> Cc'ing NVMe emulation maintainers.
>>
>> On 12/21/20 6:12 AM, Guenter Roeck wrote:
>>> Hi all,
>>>
>>> since qemu v5.1, nvme support has been dropped from several architect=
ures.
>>> Well, it was not exactly dropped, but disabled.
>>>
>>> On those architectures, trying to boot from an nvme drive now results=

>>> in the following or a similar error message.
>>>
>>> qemu-system-alpha: -device nvme,serial=3Dfoo,drive=3Dd0: MSI-X is not=
 supported by interrupt controller
>>>
>>> This is the result of the following two commits.
>>>
>>> fbf2e5375e ("hw/block/nvme: Verify msix_vector_use() returned value")=

>>> 1c0c2163aa ("hw/block/nvme: verify msix_init_exclusive_bar() return v=
alue")
>>>
>>> Affected architectures are alpha, parisc, ppc, sh, and sparc, and eve=
ry other
>>> architecture/platform where the interrupt controller does not support=
 MSI-X.
>>> After reverting above patches, I can boot from nvme again.
>>>
>>> This does not really matter for me - I run my own versions of qemu an=
yway,
>>> and don't mind carrying reverts if I have to. However, for my educati=
on,
>>> I would like to understand why nvme support was disabled, especially =
since
>>> it seemed to work for me just fine for years. Can someone please expl=
ain ?
>>>
>>> Thanks,
>>> Guenter
>>>
>>
>=20
> Hi Guenter,
>=20
> Thanks for reporting this. My apologies - this is an unintended
> regression. I'll get a revert staged.
>=20
> I'll of course also look into why this was not picked up doing testing.=

> There is an nvme QTest that should have picked this up, but it obviousl=
y
> was not run for these architectures.
>=20

Ah, that explains a lot. Just a thought: instead of reverting the patches=
,
it might possibly make sense to handle lack of MSI-X support explicitly.

Thanks,
Guenter


--xj2xnWGS5RXzCLVU2jY4u3Vx49jjPFivv--

--7QWuco0Qw4y9HyXdxt91rL7Zp6JL3IY8i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl/gxX4ACgkQyx8mb86f
mYH4Xw/9HJa3GhYl2FxFpuDG7+mV3rmsuUPg6O2esPsiPbDTHvufpQ9SYiZO1Fz5
42rhWZfJyfU+dVy8paferZBC4cQvmYkG6ml1BHkSI0MqMVdB8n8hsjGAWVMp83hB
D8ii766yAOFezPpyzgIAfBx/jxuhY5VwBN0R+jITgWVWY2uYJm+gz26iJzwjT4UZ
ZBZzuuH3xoZsR7gmmZO+HZn86BKpz7FXaMjBYgC4Y1CehjkTacbALgrmf3S28Rob
xkoUrzLC8hsBAll/Y5tKp7KA/Vhwvi3Q2d0jxHXL/cL6uy8AdrvjL4qxKL5iUVE5
amdBhGc1rIKGe/z6iWshv93MFBcecg0C3jL2KM6dIM+5ZOACR/NQpMp2HbL/i0k9
6lowb1M5nDPaN/f70ex3TB1V2TQyRd3uL6eGND4XuowCATYB+CCIjQKT78BMwg55
38u032Lr/O+fwuQQIhLcdrG0phStXMcp3gSCSAbM7Bx7N4ZUolXN/w+kAPFsC3uM
DdLVhL1SgYfQfAFwAPJtTWcDG64YOKB3oBdXIi/GJthMotpxbJDvpEmfz/AQLcsG
35SdIXhiDpNUK4GsqT1Dnh8mWzR2reAUNUUdeI8SYliYibseFEr+/LS72ZljcKlT
JNyYCQ7UMOuFLWunzIHDKrNmtwqXfIvTSZN8PQxlSkhgF0yrXhk=
=7Ck+
-----END PGP SIGNATURE-----

--7QWuco0Qw4y9HyXdxt91rL7Zp6JL3IY8i--

