Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C8C70161
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 15:43:16 +0200 (CEST)
Received: from localhost ([::1]:33786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpYax-0006oT-Qg
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 09:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54845)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hpYZM-0008JK-2f
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:41:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hpYZK-0005PE-Uz
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:41:35 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37250)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hpYZK-0005Nb-N2
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:41:34 -0400
Received: by mail-ot1-x344.google.com with SMTP id s20so40218950otp.4
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=n7qcthL4nGkUtzxUB4TCi9vj2TOzPlBAN/P39sHrxik=;
 b=nmDcbSjscmW+594WH8vIlt8gq7YzbKSRxdVrhQr5zBK+BlhgVbHffo0ksbfTSB0S+e
 l1tCtckrOAhuKxkx56rQ0cdRcgHzK03j5Ij8TFfjTKxC1b4g8fbshckvGZXhnz+zdQjh
 vzvJ8xg4sPbrJhfbBNj6+xQBjWzZnNYrEQi+2rVYtBpx7F/GhagVSGC8ubkNVjSS06Us
 IGblMLK2Qrcbxm/5LfYBD3DtnVcEwjieUaz1BHiRjOYWWwtx+P+GSTOc5urk08dJkV3Q
 aY6cOMb7MP5AaVnn/prxUXlVRTPgKTYlIDukNEc3joRQ8ye0Jxa3OkqXEpVAc8kodC22
 EHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=n7qcthL4nGkUtzxUB4TCi9vj2TOzPlBAN/P39sHrxik=;
 b=MMqQKNwXyVPxH96CakITy88CYlwUr/BT/Btueqo/JuXV5dfK0qOjcwj2yVhLyYjHs/
 LFQfhQtXP3fNkJXxNQal8JyFAR5f+j1ZPQ8ERDhBfarCLFX+tKGH7THfpkxKPh51l8KA
 xRfOG4UKKdpD5ZssGg/ihr+DFbLbEAaZukMN4Uag/K1NtaQuQ0/YIvN1dH+sBywJq6lM
 1LfCEPI1Z+BTI1JJ9XKkqV6zELNij8hwvyDjhCkX4pU66y5DPfW6rtsZbE/3tdaefx+e
 cirGNnjIlJfIXZheCt5TNgLMLiR01mTgKumaHjiuJXa1590+HZWhhjelsgzYN2RDH7jx
 mAoQ==
X-Gm-Message-State: APjAAAWBpnwnUMeAWYPmMakF8coEoLlQIsTOgG/ithGKv/KhnUnqUZIg
 ih2vD/sNYBviUUrNe83yYyQ=
X-Google-Smtp-Source: APXvYqzOMNy8Ee18zJ71Ili8+wJgRwAdp5rNoElKjo2whWEudZQ2y3gZFQV8mJYK7djgXOEl/ZKJeg==
X-Received: by 2002:a05:6830:14e:: with SMTP id j14mr4062otp.246.1563802893189; 
 Mon, 22 Jul 2019 06:41:33 -0700 (PDT)
Received: from [192.168.1.96] (69-222-133-165.lightspeed.tukrga.sbcglobal.net.
 [69.222.133.165])
 by smtp.googlemail.com with ESMTPSA id s1sm13833922otq.28.2019.07.22.06.41.32
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 06:41:32 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190711223300.6061-1-jan.bobek@gmail.com>
 <20190711223300.6061-5-jan.bobek@gmail.com>
 <aae968d1-acbd-9b9c-56ff-3cca13b8abce@linaro.org>
From: Jan Bobek <jan.bobek@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jan.bobek@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <838129d6-6c44-49f0-020b-ca5574a787ee@gmail.com>
Date: Mon, 22 Jul 2019 09:41:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <aae968d1-acbd-9b9c-56ff-3cca13b8abce@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="OjgvbhRqtIthyDvv4wtHKANyWnc6RUk5l"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [RISU PATCH v3 04/18] risugen_x86_constraints: add
 module
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
--OjgvbhRqtIthyDvv4wtHKANyWnc6RUk5l
Content-Type: multipart/mixed; boundary="088Ak3iwam6SCZDc14efCQYofniaP4eTu";
 protected-headers="v1"
From: Jan Bobek <jan.bobek@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Message-ID: <838129d6-6c44-49f0-020b-ca5574a787ee@gmail.com>
Subject: Re: [RISU PATCH v3 04/18] risugen_x86_constraints: add module
References: <20190711223300.6061-1-jan.bobek@gmail.com>
 <20190711223300.6061-5-jan.bobek@gmail.com>
 <aae968d1-acbd-9b9c-56ff-3cca13b8abce@linaro.org>
In-Reply-To: <aae968d1-acbd-9b9c-56ff-3cca13b8abce@linaro.org>

--088Ak3iwam6SCZDc14efCQYofniaP4eTu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/20/19 9:54 PM, Richard Henderson wrote:
> On 7/11/19 3:32 PM, Jan Bobek wrote:
>> +sub data16($%)
>> +{
>> +    my ($insn, %data16) =3D @_;
>> +    $insn->{data16} =3D \%data16;
>> +}
>> +
>> +sub rep($%)
>> +{
>> +    my ($insn, %rep) =3D @_;
>> +    $insn->{rep} =3D \%rep;
>> +}
>> +
>> +sub repne($%)
>> +{
>> +    my ($insn, %repne) =3D @_;
>> +    $insn->{repne} =3D \%repne;
>> +}
>=20
> What do you think of replacing these with p($_, 0x66), etc?
>=20
> It kinda matches up with the "p =3D> 0x66" within vex(), and it is easi=
er for the
> eye to match up with the comments before each pattern.

Good idea!

>> +sub modrm($%)
>> +{
>> +    my ($insn, %args) =3D @_;
>> +    modrm_($insn, indexk =3D> 'index', %args);
>> +}
>> +
>> +sub modrm_vsib($%)
>> +{
>> +    my ($insn, %args) =3D @_;
>> +    modrm_($insn, indexk =3D> 'vindex', %args);
>> +}
>=20
> I'm thinking of adding a few more exports for very common patterns:
>=20
> modrm_reg    -- force use of register.
> modrm_mem    -- force use of memory.
> modrm_mmx_1  -- crop reg1 to 0-7 for mm register.
> modrm_mmx_2  -- crop reg2 to 0-7 if in use.
> modrm_mmx_12 -- crop both reg1 and reg2.
>=20
> I think these would significantly shorten some of the !constraints.

I agree. I thought of something similar when I was preparing the v3
series; I didn't include it only because it would have further delayed
getting the v3 out.

> I'm willing to do these changes myself; for the GSoC project I'd rather=
 you
> continue to the next phase instead of iterating on risugen further.

Of course, and thank you!

-Jan


--088Ak3iwam6SCZDc14efCQYofniaP4eTu--

--OjgvbhRqtIthyDvv4wtHKANyWnc6RUk5l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEESPYOqtMR3qRZrEutZeg2ldrjNs8FAl01vQcACgkQZeg2ldrj
Ns/kLxAAsc8MPYtOrd12vvQod70CRXqgn6QObtysd516QSmz92uEMGlyW4CAuZAj
9BBdqtONVAWiTZxsT0ZL+omUqa7kNjS7MdWCZ1O4LM29l4SM6m6gbMoC2mpTv3on
Aj8aF6V+blzATOzyjwQLSFenNY6Gook+uTRHCW0um6qRmPjGZErLBemDj7NL4ZoF
iwdiWDQthRplKe6O9WNzNVV7GqOEkOjW6lLdS0Oc95/Fr+SPvz3QaayPUZnQl0Ip
RSvPJsxYSFNQhGvAUQ5VugvWKezKhWn61JFJs2hUfa/c6AtQLFEZACsAUL/G2YgG
vhx9bp2q1ULCWpCkWis+cjoAd2DT5huRYum4gYsXm985W931itdUSr4RYTr3nBx0
TZkaGtCTGBtwldZ2kowtOlCnB9NZSrR2u0GebI1nY/0Oe3Zod1IkpnTC/824lJGj
H5vXO70kse4XEYxdFuxtTjOr/zTJ1g2uerNFZycQtCbMFWA/p1WCy2aqhFnyOFu7
KyGBEp7Ae1+qbWkV8HGbERpxj4GgJcVeFpaYnvZj8wslKREATT4NjrwEf4hWQFUm
4ORfNjz84N87i/csrs2uiB9/opp5JEqjC7ifuqosyM4O6baQ3oMDBROBb31D8d5S
11JXiTgJ5Tf5HlFZ240ZsfI2n7mcCTPqSo9ltiIOdYjDTqRLydc=
=Qu9v
-----END PGP SIGNATURE-----

--OjgvbhRqtIthyDvv4wtHKANyWnc6RUk5l--

