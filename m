Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FCE64BE7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 20:09:44 +0200 (CEST)
Received: from localhost ([::1]:35924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlH2F-0002Zw-Js
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 14:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35778)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hlH1U-0001rm-8H
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 14:08:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hlH1S-0008B6-LU
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 14:08:56 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46849)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hlH1S-00085E-8D
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 14:08:54 -0400
Received: by mail-ot1-x343.google.com with SMTP id z23so3041038ote.13
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=lzzA9XwcT+iY7Qeb/waYVWtesydnrNYCbNcfL+TGpyE=;
 b=OPrEki+hdhPMn/Sx7c9mOxy38lvTnr0Z9qjaBoXs2qhyG5tqoMAHtOW9LfOZUvTfF0
 qWgYSUV0sE7tzrQJvAwPttHKYKua/h/qVndiBu3lYul6xjtI7HkNxBxWrvB6Bas6uW07
 i+k0opuZkW5XlGLhwZdJoeJf0BVHNJL3s4Y2AT0K6A1KwRn/Iu2uJWlEIMjeNuw75h0P
 pMAqvZx9OyHPV1EG7k705eNNyiQvxvOB/mqg51Hz3VxuFBtAfYccOhim+o8rZQTh89ar
 bZPr1k8thgIMjUyr5nyBUNdKB8DJXz34ii+dxnP+KnJgH/CXBSNszblEcBKQS3fkkFZU
 d+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=lzzA9XwcT+iY7Qeb/waYVWtesydnrNYCbNcfL+TGpyE=;
 b=dNMOCycy0HQXjYq6r87oi+/jpLsMrXaeVU3XO4msNYoh9jAbRUaxKO/AyUBVqCo8sp
 jQ17xEdos5KQ8NFnIkzf10OzD/HCSBgFkD36JG3zfjvaYcU2FZYjRittA3msjrL3JYIO
 RklVmZv4ZXziK/HkBzJBeRFNC/81NWffCjuff+eLXEYjwYIvdyjboZVb8M0/3ElSGXLp
 kLzeFWDZcRPOKhIjFW6eG+jrY9XrMyqv7m6CTdOBhLbrXfFvWpIEZ8GtNPpFHqJpKU2I
 DrU7uZMBbtKfuW2Rl5qfbAgnGc2zrsVdUG6pY9Ddd453Y1RHDRpY4KfHZgzFRUuFo0lw
 k6Jw==
X-Gm-Message-State: APjAAAVGOb0yLs8oO6/k6hWgtCBFfYkV+h0hU1k3K63ZlobV6xVYrH1W
 QngKyVoYjnPlbSGeV8auk60=
X-Google-Smtp-Source: APXvYqwfasZuUwToIJOumMc32R6FVx6NheQnwM9rjIEJhnDf05BAstFc29YXRapAAU924Tl/xwQPdQ==
X-Received: by 2002:a9d:529:: with SMTP id 38mr24836106otw.145.1562782129050; 
 Wed, 10 Jul 2019 11:08:49 -0700 (PDT)
Received: from [192.168.1.96] (69-222-133-165.lightspeed.tukrga.sbcglobal.net.
 [69.222.133.165])
 by smtp.googlemail.com with ESMTPSA id v203sm1107657oie.5.2019.07.10.11.08.48
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 11:08:48 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190701043536.26019-1-jan.bobek@gmail.com>
 <20190701043536.26019-4-jan.bobek@gmail.com>
 <4e13bccc-9498-8514-b828-c8d79652bfd6@linaro.org>
From: Jan Bobek <jan.bobek@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jan.bobek@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <dbc3b954-c8dc-db9c-ff6d-836113ad8762@gmail.com>
Date: Wed, 10 Jul 2019 14:08:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4e13bccc-9498-8514-b828-c8d79652bfd6@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="UXr2gkUMm17ksSUTRM2z4edMzuPkbETk6"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [RISU RFC PATCH v2 03/14] risugen_x86_emit: add
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
--UXr2gkUMm17ksSUTRM2z4edMzuPkbETk6
Content-Type: multipart/mixed; boundary="6rtPqmrWtvrSAoiZ1maYXGsykF2AUgO7K";
 protected-headers="v1"
From: Jan Bobek <jan.bobek@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Message-ID: <dbc3b954-c8dc-db9c-ff6d-836113ad8762@gmail.com>
Subject: Re: [RISU RFC PATCH v2 03/14] risugen_x86_emit: add module
References: <20190701043536.26019-1-jan.bobek@gmail.com>
 <20190701043536.26019-4-jan.bobek@gmail.com>
 <4e13bccc-9498-8514-b828-c8d79652bfd6@linaro.org>
In-Reply-To: <4e13bccc-9498-8514-b828-c8d79652bfd6@linaro.org>

--6rtPqmrWtvrSAoiZ1maYXGsykF2AUgO7K
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/3/19 11:47 AM, Richard Henderson wrote:
> On 7/1/19 6:35 AM, Jan Bobek wrote:
>> +sub parse_emitblock($$)
>> +{
>> +    my ($rec, $insn) =3D @_;
>> +    my $insnname =3D $rec->{name};
>> +    my $opcode =3D $insn->{opcode}{value};
>> +
>> +    $emit_opts =3D {};
>> +
>> +    my $emitblock =3D $rec->{blocks}{"emit"};
>> +    if (defined $emitblock) {
>> +        eval_with_fields($insnname, $opcode, $rec, "emit", $emitblock=
);
>> +    }
>=20
> And if !defined?  Silently discard?
>=20
> Is this just weirdness higher in the risugen stack,
> such that this might be called maybe_parse_emitblock?

If !defined, there _is_ no emit block, and we treat that as an empty
block. The caller gets an empty hash, and it's up to them to decide
what that means. I could rename it, but the difference doesn't seem
that important to me...?

-Jan


--6rtPqmrWtvrSAoiZ1maYXGsykF2AUgO7K--

--UXr2gkUMm17ksSUTRM2z4edMzuPkbETk6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEESPYOqtMR3qRZrEutZeg2ldrjNs8FAl0mKa8ACgkQZeg2ldrj
Ns+gAg/7BJMHNuAvPUyFXg34XyZjeMwQaZ7omHUUON+F/mobrdlW2kuirhY3S81X
+2NmumEUVnikQcq+lgb7xoUR0iVrSJzhqsuhdRrl6cLiFnyqMX4INDtjhYfZufF5
XH6aan79EcSoLw2z9sKmK9KIXyIdA8nLB5aGkwJ1fhb5+egVJylssLbjomtkSbHC
WHgKjT9q5AwsQfNaDFSGN2xU0vOMnTjlrpn6Yfw5EoY5mdEF3bS7Bj150/J/w/eJ
0OM0fxyhpu5as++brh/EJzjdKZlMFwfhL7/gF+Cq82cORa1ORr9e4nT1eWnXSLxU
V3cv3xK/f7Eju1NhuulcJoWmQIQUWCDDkDM3kv/rvL+sjdOKdKI75Lez15D7sqDK
/mWTIr0genADJSowvey4iceNGP5kfdC2uTd+zc0nvtiw297pHKbekP6HZe/Z+gEa
aKQx9tAoTJQJvV//QoYVOyd0NU8catq1R8LI4cHSyYFTO9ZIX/bek8wol05FiONX
jZbILOJf/W5J4S+nb5M30WVizjeDcFKjH7vDHrKHIv7wxhfC96Z1TVDZwmc4+v7n
naPiRWIwOsOXUYYCs5Xvn8hHSVibF2TlK7cwfJp14V0jYy/2ZJKrY5XbC5TrCkzE
d1QdRou2h83DDZlCHwOok4g8FoDGS+GbRQtUvmduGe+m3EsV8Vo=
=2qLg
-----END PGP SIGNATURE-----

--UXr2gkUMm17ksSUTRM2z4edMzuPkbETk6--

