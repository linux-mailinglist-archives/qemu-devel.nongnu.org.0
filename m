Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3590E8E19E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Aug 2019 02:02:15 +0200 (CEST)
Received: from localhost ([::1]:36698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hy3Da-0003Qc-AL
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 20:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1hy3C0-0002sF-0x
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 20:00:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hy3By-0003l3-W5
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 20:00:35 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:40152)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hy3By-0003kn-Q9
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 20:00:34 -0400
Received: by mail-yw1-xc43.google.com with SMTP id z64so218246ywe.7
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=QUFXMHcmPoUFSLLSifvNiaeF87m8nok0fnCraaksFjA=;
 b=hd9dnsCoTQHpSrYp3gV0/UQvlo4sZOxHWgIpeTqIAlnmxbtI9OYra6A9HlUy/y/a6A
 AIxDWv9TWqYJ2FEcQmGT+9d4CfDXjPpot9n0q83cMsJYQY+fE8PqTUccg0MkTzR0wp2z
 uqBJsWQoHli0zETLj8cQNU6xCIS8Uv09vYhP0yf177pa9HeC5Rh/XdEk/w8J65/J9sQh
 k3C1uVdGDrGku090KXpGpxro9c6fE2aZP0ExRwg/a2mccHtcrkEKSAe6sErFIyUF/LUu
 RlISa5KCWRCA3cfr5jQgrPtK/DRkNMtcCVAL11fS9a94HJTPo5lNlrTT/CHtxui3/5so
 +BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=QUFXMHcmPoUFSLLSifvNiaeF87m8nok0fnCraaksFjA=;
 b=SzAUc32ymofCBaj5VEQWVumMEQVhDRR2Jv/OukNi8j3kC1y2958dzPV3cQCmTsgELd
 KZMOhRNWrpSiDrv7MldF7nqgWUoQa6LZzvCmhXwFAmYyNI9ZjD24Uf+/rB4pt78WMgaJ
 PHhxOAfZUFnQ1TdKkg/7rwSAuZL5TfRaBUksIdNrE3A+XMkADDPdpjQsWX58Hu/uf6Un
 H8Oz73Zjf9yRBYpEksUzQ7js/HjAvO9IJLntvCzpeCJfc72vxRxiZkFbYPbvFLpuZawm
 ZHh5KT+5cq0wn4wykTSHUGc/w1geuhvOnPEfoN/y6YZGZLQVipmqVZSqSs6adSxthHSJ
 X+ig==
X-Gm-Message-State: APjAAAWNDd69AyUdMyi5+gbjxc1cwN/v6nOWZPTPT34EK7XEfjJi0T4c
 pPuXEH0svWy5iMp49dyPh8cINEfl
X-Google-Smtp-Source: APXvYqyiZ0zbRzC6E5qmdu7u37qSv2gbjuvcwLpZpgepWpwm1j7fOxPZFV0NN22YFotivf808iSJKA==
X-Received: by 2002:a0d:d807:: with SMTP id a7mr1447901ywe.112.1565827233701; 
 Wed, 14 Aug 2019 17:00:33 -0700 (PDT)
Received: from ?IPv6:2601:c0:c67f:e390:8a9a:e33f:caf8:f018?
 ([2601:c0:c67f:e390:8a9a:e33f:caf8:f018])
 by smtp.googlemail.com with ESMTPSA id v19sm485370ywa.5.2019.08.14.17.00.32
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 17:00:32 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190810041255.6820-1-jan.bobek@gmail.com>
 <20190810041255.6820-17-jan.bobek@gmail.com>
 <b0bfa230-f508-ace2-6daf-75f2156251d6@linaro.org>
From: Jan Bobek <jan.bobek@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jan.bobek@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <cee901d6-9423-8c0e-3b61-f3b09019ac5d@gmail.com>
Date: Wed, 14 Aug 2019 20:00:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b0bfa230-f508-ace2-6daf-75f2156251d6@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="2MCCWJ4tjjtoJfryM91jeV7QXnIXJIBXs"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
Subject: Re: [Qemu-devel] [RFC PATCH v2 16/39] target/i386: introduce
 instruction operand infrastructure
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2MCCWJ4tjjtoJfryM91jeV7QXnIXJIBXs
Content-Type: multipart/mixed; boundary="fGozyRI7Pk4tWuPuKpl3Od6w5AX0kvdsX";
 protected-headers="v1"
From: Jan Bobek <jan.bobek@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Message-ID: <cee901d6-9423-8c0e-3b61-f3b09019ac5d@gmail.com>
Subject: Re: [RFC PATCH v2 16/39] target/i386: introduce instruction operand
 infrastructure
References: <20190810041255.6820-1-jan.bobek@gmail.com>
 <20190810041255.6820-17-jan.bobek@gmail.com>
 <b0bfa230-f508-ace2-6daf-75f2156251d6@linaro.org>
In-Reply-To: <b0bfa230-f508-ace2-6daf-75f2156251d6@linaro.org>

--fGozyRI7Pk4tWuPuKpl3Od6w5AX0kvdsX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/13/19 2:07 AM, Richard Henderson wrote:
> On 8/10/19 5:12 AM, Jan Bobek wrote:
>> +#define INSNOP_INIT(opT, init_stmt)                                \
>> +    static int insnop_init(opT)(CPUX86State *env, DisasContext *s, \
>> +                                int modrm, insnop_t(opT) *op)      \
>> +    {                                                              \
>> +        init_stmt;                                                 \
>> +    }
> ...
>> +#define INSNOP_INIT_FAIL        return 1
>> +#define INSNOP_INIT_OK(x)       return ((*(op) =3D (x)), 0)
>=20
> Return bool and true on success.

So, the reason why I did this "inverted" logic (0 =3D success, 1 =3D
failure) is because I was anticipating I might need to differentiate
between two or more different failures, in which case returning
different non-zero values for different error cases makes perfect
sense. I have not made use of it yet, but I'd rather hold on to this
idiom at least for now, until I am 100 % sure it really is
unnecessary.

-Jan


--fGozyRI7Pk4tWuPuKpl3Od6w5AX0kvdsX--

--2MCCWJ4tjjtoJfryM91jeV7QXnIXJIBXs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEESPYOqtMR3qRZrEutZeg2ldrjNs8FAl1UoJwACgkQZeg2ldrj
Ns/S5g/9Fm8i1KbJh6nZg2iH02Os8iKu1FFdTuMhSVUcIbdJtesrS+m9vsloYiov
49uV91jwEw7sHLbD5YrGKpuDlvfaa/2E+rVBgIFKoauPbnn5mLx49ubm8RIbpMJh
b27J1VzeOG/pJ2ViT7MGquEEsELjGGMpVGlZvy5mVhBl55ZmOtH7IEKHTSy/s3/D
NzQrvKReUOcn6jn21fmZ2sQu2kmN+Umut1KrD7t4fHjMj7Ofxvs+jWc3YQoUtmIp
fWDKxEOC/tjco+la1McG2uUA538XrX9rAU04xaR6l11Vx+Z3CUQuO/7k1SJMrtQo
woV4nmzl4coQIu8Uqtp+SpeQN4Mbe8UkhUq43mycpDZbpgfHaeodXre968rGKR27
tLdt5STnzD/ZyeuEJKSf56Ej0aIw8lQiqm1bg9LZya2x0Gpw0qR8mPN9+yyXHfLc
rVS2UJ6h4io++HLLOdfyyccq35qD3nlJXFCKjL2vOBYysf562KuZr2yD4cuq89QH
zvEFEWHE8L0laplmCU35IOm+F9IPVKaFI6DpspydxaYToFefrXkMG8Va0K2dOheT
G1h+AhvhrL/UfNILFlS5h68IeTBFok0GT/y9LoMjjPmnSZcQiXe/UkHzMk5HQK0t
A90aue0SKsrnr1lDgHXc9NTovfkBoAc7u+T1dnvSQ+RCKye9Bdg=
=r/k+
-----END PGP SIGNATURE-----

--2MCCWJ4tjjtoJfryM91jeV7QXnIXJIBXs--

