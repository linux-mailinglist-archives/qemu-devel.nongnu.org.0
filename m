Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3F8701C5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 15:53:55 +0200 (CEST)
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpYlG-00062B-Lq
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 09:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57298)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hpYl2-0005dn-Ns
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:53:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hpYl1-0000fe-QZ
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:53:40 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38307)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hpYl1-0000et-KD
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:53:39 -0400
Received: by mail-ot1-x344.google.com with SMTP id d17so40309696oth.5
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 06:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=Q1tX3qU7i1X6zA0bgXFqF+XaRNoFc7hMz2tCtKtz7Bo=;
 b=NbLZs9m4bSnrXyy8iTzplnF8EyC0wuv7o5ZLXUGvF0uQH5j3254jBgGu2Vgh11AgSs
 SioFKCof99NPxPumwfi6TfSyJMFHvLdLnaICkOlNSj3KCvtr3dvC45EelXcM/y28Oewg
 tWXik5tq6STVHNiBbfxqyc8XaKvYPJNA13F/34HBd1UhMsNRxWKiuQyLwkowGxMQpyu0
 GloYdTi18zeg+aWAr7fI4wO4kQQWQ09VZJ//facqQ49FEr+Bi6FaFCa3hv7GXGqysJsN
 fN15NmLFQ2Ogf2Zqdgcw5bxrqkO572/PmeFTrAkdVL0AyqnXgIMx/RQ+DEOCkQAtxy/p
 uRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=Q1tX3qU7i1X6zA0bgXFqF+XaRNoFc7hMz2tCtKtz7Bo=;
 b=LrVoQioFDFVdPdZN7V4RQCfie6HkB0aaK/nO2dMVT7R8lMAQN5V/ulBNiLs6n3ErNU
 JNLvUmn/QMWtxuEQ+uWGsPOsZz+nyHJDwfTundSetsydxYu0GDRXBIA6pETsL8XhQQGJ
 iXOzILC38KNbnmzvDeJtKeVifekrZ44bMmv4o7/i2KMHaOAhygjIEMTLmwtqz9PH6Efb
 jyQAvSEaPxsH2kYqo9M3zsIPd9vMpTwXozVgEegKEz1x1P8H3ZxzycecxYv5czVv82UK
 2nJ/PlN61w181Zw4zv4XF9NBMnYPVSXrQf/elCNleDQbsN9ISirxHYp+yxDOVysSTh+H
 4zJg==
X-Gm-Message-State: APjAAAXJsMVYiBAVNsz2HqhB3SBJym1w44XHnvnzgQw9Npz9ck5Hva+1
 XNkd9PXOaPEfp431hzSaUTs=
X-Google-Smtp-Source: APXvYqy5bwIDzBJ+ywOXZYxSPEhmPVOB6NXM5F5Vb1czgLTviGs6Ol+9QSp7Cjtl4sysYke9UsYWyg==
X-Received: by 2002:a9d:744f:: with SMTP id p15mr29711372otk.287.1563803618801; 
 Mon, 22 Jul 2019 06:53:38 -0700 (PDT)
Received: from [192.168.1.96] (69-222-133-165.lightspeed.tukrga.sbcglobal.net.
 [69.222.133.165])
 by smtp.googlemail.com with ESMTPSA id g73sm14364516otg.30.2019.07.22.06.53.38
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 06:53:38 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190711223300.6061-1-jan.bobek@gmail.com>
 <20190711223300.6061-6-jan.bobek@gmail.com>
 <a5e745d8-fdd6-d3d7-185d-eb75d2623c18@linaro.org>
From: Jan Bobek <jan.bobek@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jan.bobek@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <531ac82e-de60-e688-40be-2008c3ea75a8@gmail.com>
Date: Mon, 22 Jul 2019 09:53:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a5e745d8-fdd6-d3d7-185d-eb75d2623c18@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="WU0fIbe5Fd5FMuck6uN5hTRzcJfrCqp5H"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [RISU PATCH v3 05/18] risugen_x86_memory: add
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
--WU0fIbe5Fd5FMuck6uN5hTRzcJfrCqp5H
Content-Type: multipart/mixed; boundary="5pjUmC1r7XxQ9inHxh5Dg4wloTkH3QTcX";
 protected-headers="v1"
From: Jan Bobek <jan.bobek@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Message-ID: <531ac82e-de60-e688-40be-2008c3ea75a8@gmail.com>
Subject: Re: [RISU PATCH v3 05/18] risugen_x86_memory: add module
References: <20190711223300.6061-1-jan.bobek@gmail.com>
 <20190711223300.6061-6-jan.bobek@gmail.com>
 <a5e745d8-fdd6-d3d7-185d-eb75d2623c18@linaro.org>
In-Reply-To: <a5e745d8-fdd6-d3d7-185d-eb75d2623c18@linaro.org>

--5pjUmC1r7XxQ9inHxh5Dg4wloTkH3QTcX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/20/19 9:58 PM, Richard Henderson wrote:
> On 7/11/19 3:32 PM, Jan Bobek wrote:
>> +sub load(%)
>> +{
>> +    my (%args) =3D @_;
>> +
>> +    @memory_opts{keys %args} =3D values %args;
>> +    $memory_opts{is_write}   =3D 0;
>> +}
>> +
>> +sub store(%)
>> +{
>> +    my (%args) =3D @_;
>> +
>> +    @memory_opts{keys %args} =3D values %args;
>> +    $memory_opts{is_write}   =3D 1;
>> +}
>=20
> I was thinking maybe we should add a mem() that allows a "store =3D> $d=
", which
> would simplify the "$d ? store(size =3D> x) : load(size =3D> x)" patter=
n.
>=20
> Anyway, that's incremental improvement.

It's possible. I suppose the reason why I did it like I did was that I
wanted the config file to be more descriptive: if you specify a
constraint like mem(store =3D> 0, ...), it might not be immediately
clear that it actually means a load. It's not an issue when you know
the code, but if somebody were just browsing the x86.risu without
prior knowledge of anything, they might find it more cryptic.

Anyway, so much for my reasoning; I agree that it would make the
conditions simpler, so feel free to change it if you like.

-Jan


--5pjUmC1r7XxQ9inHxh5Dg4wloTkH3QTcX--

--WU0fIbe5Fd5FMuck6uN5hTRzcJfrCqp5H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEESPYOqtMR3qRZrEutZeg2ldrjNs8FAl01v+AACgkQZeg2ldrj
Ns/5Mw/+LMvEwwkCiSHEZPvq99gueRSgFj/XbZak8TyYbAJ2xkSJZlWUq2MXLP7d
bRAJZ3igYOikPQQoC4se1e72RoIhUZ1KKSuQRZ4ODZe1VM4AY0zLxQNc7xi9d766
+5GeFjluOvFU9c+vyGCQ92RmQdm52DcSlTFn/u+U64XtZQ6jGF/aNlUnPFLf2eP2
Ra+Nomzczsn3x638XHqAxaAddQBImXkfOd5TzmAJ0pVbQfVgzdkeiNG4UnqhPlL3
Uvip9H9NVVG3FVvC27SUMvEAmChPx67d8MW6cKxQNHVZiAVKGPe+/ZvimTi5ZkJt
6PicMvuxS3S3+kOkLzUrs3lB9EiXVE/pG6ztP8HtixM5fxpVL75eeMT37fI5O0FT
aS53LtHM6u2rjDwD4Ge40XAViGL8wEZGujLM9mAT1GagXqqrRR/7vDcaFkc/dJcv
L3U2K0uXkAzfyvjAwRIdMBb3o7CoWymjdee38ami3C2ppC1UqAwkCKlh/1GnUrKG
DC6jfFN2zEks9K4UPvLr3GRfn8y+LdfXeMD27mPBurLm5ZmFhKqH5pMUgcN5G589
jGqbi0gTDa8kcBDUEeu7PfxN7YGbgXizM41FtXYSzv7mA5EQRECGvrDcWGIEcsUM
9x4HJ/ERFOD9OVDwD2ski8cvNFPVUJ04hqyAE+UfEeaH13V9zKQ=
=mAQ5
-----END PGP SIGNATURE-----

--WU0fIbe5Fd5FMuck6uN5hTRzcJfrCqp5H--

