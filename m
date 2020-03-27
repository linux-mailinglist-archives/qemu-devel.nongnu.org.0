Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA16C195555
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 11:32:42 +0100 (CET)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHmI5-0005pm-I7
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 06:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54373)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jHmGs-00058o-Ag
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 06:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jHmGr-0003wP-64
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 06:31:26 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39066)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jHmGq-0003sn-UC
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 06:31:25 -0400
Received: by mail-wm1-x344.google.com with SMTP id a9so11697979wmj.4
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 03:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ttJTtxfcNKfgLxVBPdLWZVZYak8/+Q7UNd6XN6THxAc=;
 b=lE+xozEuF+Lw6fsXCQ2Gj6cqFuPgDIFUXdAPhvT/VzTANYaLHyU+Wv6MG3Py/VurQm
 N29V9RSfisPvF6vdzsL5W/OtfK7qU4fnD3OdaSj8cgrhhgXs/mp8Ny1LOAQZUNE/AKsa
 2C+MLTz0HiwJND7cy2i7ST3TDPFnVRYFLVnYMYFtO/oobAeNFHjDUMeUkOcx6OvpuuBL
 DxvdaeeCZlGkBHwdmH8tIwD8HVBBCZwz6Wh+Eaanv5U2RcePs2deXjyUVV6t7ugWox23
 oXJI55VqYkFqkPUI7ZSy4gbFqiCZBFXDzv9ZwgI0RPjQIlzfMnsqKbjQKbnD1jpxwP2f
 +nnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ttJTtxfcNKfgLxVBPdLWZVZYak8/+Q7UNd6XN6THxAc=;
 b=CQAOLGedSK12zoGEAL559PKYviftFVCMNbV5v3iBHtAnI0p30geRXJmoyinKVnjJRv
 HExu0HWhap6/j1APD8PlLyPc2AWs9heqKo5W0w+NiHKM8JO7aojxg1UdG2P5ZrYv+E9e
 R/aMs6fSHSilIjOe5mal3I0uxGkgKE5Q4xrCZGxXkqRFYqnxEV55FAfAVDI7y8t2+Ort
 S8USoRXO0tRkNNOSN1sc2vtqWUlZQflpyuoyRfdftOTIKok9+JK08Ucknu/q7UtlCare
 H1KDAUGxuzbokKOcZIatALbagMKn2b3SVRxDYehugyX19NLU3O2f39uVnilLQj+JCvt7
 Tndw==
X-Gm-Message-State: ANhLgQ1nl8jriBWkOq39wU+/qnjqjCgOWY/usXLZwx+XqR9kPyPPVuPJ
 9Y3jEcX99ueD6Mn71xLlqLN6ww==
X-Google-Smtp-Source: ADFU+vt/FnneyM4jauBU5+A9SF9PPyqF9689Nn49VisohhVhC/v2vBPIIa0S3CG/B1u0EbiTxI25Gw==
X-Received: by 2002:a1c:f607:: with SMTP id w7mr4680859wmc.162.1585305083647; 
 Fri, 27 Mar 2020 03:31:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i5sm7885524wrr.12.2020.03.27.03.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 03:31:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB5991FF7E;
 Fri, 27 Mar 2020 10:31:21 +0000 (GMT)
References: <20200327094945.23768-1-alex.bennee@linaro.org>
 <20200327094945.23768-6-alex.bennee@linaro.org>
 <CAHiYmc6kw1LYK=97zxvsKdY8VL4CgZMAcWGgRcuoEjHT=qX8zw@mail.gmail.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: Re: [PATCH v1 5/7] fpu/softfloat: avoid undefined behaviour when
 normalising empty sigs
In-reply-to: <CAHiYmc6kw1LYK=97zxvsKdY8VL4CgZMAcWGgRcuoEjHT=qX8zw@mail.gmail.com>
Date: Fri, 27 Mar 2020 10:31:21 +0000
Message-ID: <87v9mqm6me.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> writes:

> 11:53 Pet, 27.03.2020. Alex Benn=C3=A9e <alex.bennee@linaro.org> =D1=98=
=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>>
>> The undefined behaviour checker
>
> Alex, what exactly is "undefined behaviour checker"? If this is a test, c=
an
> you give us a link?

It's enabled by our sanitizers build:

  ../../configure --cc=3Dclang-8 --cxx=3Dclang++-8 --enable-sanitizers

>
> Sincerely,
> Aleksandar
>
>> pointed out that a shift of 64 would
>> lead to undefined behaviour.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  fpu/softfloat.c | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
>> index 301ce3b537b..444d35920dd 100644
>> --- a/fpu/softfloat.c
>> +++ b/fpu/softfloat.c
>> @@ -3834,9 +3834,14 @@ void normalizeFloatx80Subnormal(uint64_t aSig,
> int32_t *zExpPtr,
>>  {
>>      int8_t shiftCount;
>>
>> -    shiftCount =3D clz64(aSig);
>> -    *zSigPtr =3D aSig<<shiftCount;
>> -    *zExpPtr =3D 1 - shiftCount;
>> +    if (aSig) {
>> +        shiftCount =3D clz64(aSig);
>> +        *zSigPtr =3D aSig << shiftCount;
>> +        *zExpPtr =3D 1 - shiftCount;
>> +    } else {
>> +        *zSigPtr =3D 0;
>> +        *zExpPtr =3D 1 - 64;
>> +    }
>>  }
>>
>>
>  /*----------------------------------------------------------------------=
------
>> --
>> 2.20.1
>>
>>


--=20
Alex Benn=C3=A9e

