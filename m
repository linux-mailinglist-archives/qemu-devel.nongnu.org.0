Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3E533F00F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:15:08 +0100 (CET)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMV4o-0001AD-5V
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMV3Z-0000iS-6a
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:13:45 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMV3W-0005wS-QN
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:13:44 -0400
Received: by mail-ej1-x62f.google.com with SMTP id jt13so2247599ejb.0
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 05:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=WZZg/HU6qsH/zRqJKRvKvvXinG77k6UMZ4fAn5YRII8=;
 b=XutBpl37Ci03jaNzkiD1v31LxpiwY5rIIgL1NjfDEIuYGw8bvpF0LYwdcp3PKSTZ96
 V1MKZPshIofpBYz2693ooyMIPmxkCvyR5Jmqq/WBFRlAooyNPLjZW05VpYNwtWjolFM8
 UIIJQmiNXhxsd78kre/21ASLzCOaxtQMZ1T2xZYZm4IkxN0X1j139V/ZdZ10Gt8EJ6fa
 gJzQ4FbEWYmT/8C9SraNmBFeVRsnpJ154AqQrJ7PHb8uFsyWYQp8tt+W2UY0JoX3U5Ww
 fr6YBywJDXJS4STEyCVYijWb7V2B2qGci9Z3JvmhHraos6m92GQjM60STYwtSQ8ezlbw
 RKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=WZZg/HU6qsH/zRqJKRvKvvXinG77k6UMZ4fAn5YRII8=;
 b=GBTJGUQRR09Kd8JoOgijFf8PaJpDUcEicW+eBYF81IBTr5uv7GcMSsFRsqoDqk57Cr
 KdplMvM8Izs/e7A43soN7N8MaFnfNtZD0u0V/LP1W4+/ZfmwuxS1V4gtgxJf77DQtNqu
 qRf2d/hG9hCG3EN+NNF1GAH5bAgXG0Rm13poP34EmImbyP1ftYMHA+ShgC5EWFxmt1FM
 C5WNSR2DRL3h0dDitlkAhFKYEMtez4twvg4pSzib39ym5mkSB/qv7roEa72Ajdq0D2NN
 HrL6K8NHUeyqGyNUVrlHvguxc0FFTQX/kgnDw0MM/62Z4LS88ifIo1tWAA8dTAlM8lYy
 /stw==
X-Gm-Message-State: AOAM5332JPkLZuqL87xJ1IEJA9H7Xm1/JUmy1uqsl6PX/CN5TVtFyLC9
 SSZqjO+eEnOe6TVhyem2XV0zkQ==
X-Google-Smtp-Source: ABdhPJzkoitHBtXdmlldh3a58domZvrKU2lB5ah3RgA0ZF6NJWkkBn6dVnHpRgDU1vcjR6NOhGAsVQ==
X-Received: by 2002:a17:906:a157:: with SMTP id
 bu23mr34017520ejb.491.1615983221076; 
 Wed, 17 Mar 2021 05:13:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j14sm12291717edr.97.2021.03.17.05.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 05:13:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6DD2E1FF7E;
 Wed, 17 Mar 2021 12:13:39 +0000 (GMT)
References: <20210317072216.16316-1-alex.bennee@linaro.org>
 <20210317072216.16316-2-alex.bennee@linaro.org>
 <a6e34081-89bd-2af1-fa0d-72a8fc8daa04@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PULL v2 01/15] utils: Use fixed-point arithmetic in qemu_strtosz
Date: Wed, 17 Mar 2021 12:13:15 +0000
In-reply-to: <a6e34081-89bd-2af1-fa0d-72a8fc8daa04@redhat.com>
Message-ID: <87h7lac70s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Alex,
>
> On 3/17/21 8:22 AM, Alex Benn=C3=A9e wrote:
>> From: Richard Henderson <richard.henderson@linaro.org>
>>=20
>> Once we've parsed the fractional value, extract it into an integral
>> 64-bit fraction.  Perform the scaling with integer arithmetic, and
>> simplify the overflow detection.
>>=20
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20210315185117.1986240-2-richard.henderson@linaro.org>
>
> Something is odd with your tooling, the '---' separator is missing.

Surely that's only when you have bellow the line comments? b4 strips
then when applying series.

>
> The covers' tag is OK although.
>
>>=20
>> diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
>> index bad3a60993..e025b54c05 100644
>> --- a/tests/unit/test-cutils.c
>> +++ b/tests/unit/test-cutils.c
>> @@ -2128,7 +2128,7 @@ static void test_qemu_strtosz_float(void)
>>      str =3D "12.345M";
>>      err =3D qemu_strtosz(str, &endptr, &res);
>>      g_assert_cmpint(err, =3D=3D, 0);
>> -    g_assert_cmpint(res, =3D=3D, (uint64_t) (12.345 * MiB));
>> +    g_assert_cmpint(res, =3D=3D, (uint64_t) (12.345 * MiB + 0.5));
>>      g_assert(endptr =3D=3D str + 7);
>>  }


--=20
Alex Benn=C3=A9e

