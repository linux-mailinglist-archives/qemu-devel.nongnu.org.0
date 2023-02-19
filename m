Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C3169BFFD
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 11:58:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pThNn-0006gO-6m; Sun, 19 Feb 2023 05:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pThNk-0006ew-88; Sun, 19 Feb 2023 05:57:24 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pThNi-00080p-8Z; Sun, 19 Feb 2023 05:57:23 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c17so55697wrx.0;
 Sun, 19 Feb 2023 02:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n8H5h1PWjAA5f1hzSENxrjEfVOyaG8BwjIK3ueFPm8k=;
 b=lL6gljGdgxxjB4gEHHvQXjV3Ji/MU/k1idmk5UFgq2gChU25Qn2yVzvfLzSFzmSga0
 kFJomT9u0lp15E1Z5uNaK1KUZ71TZm7Dq+4MvuONrfohAW1ffA2GgMZdle+A4nQxtmka
 H5f5YkqSxaba281bfLMzxHX8DWL3y2yy2mbwdO9q6J43R+H4FGCrUw0UJ2xIPTBlAqkg
 NhEf8y1neinXgZvhTlGiK1iaN7LsMRzx764pgC01VghcwkMxioeijNYKBDM57MtyZ6Jb
 syw/+POn1gC9JbzvwYzRGtK84Stn6sBOTfxJAiT2aIiwIdGYVSFmzCWd7T5DQ2gC+sUg
 BoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n8H5h1PWjAA5f1hzSENxrjEfVOyaG8BwjIK3ueFPm8k=;
 b=Ypu7LB2rofrUtcY+jMFjyKCkaw2CCVVS24aBZ3CRjRwaLfo9LZVDVYNWoyBTIPlfoi
 jVsDH/SyAqAY14nVDYtaIIrdqm59LZ8EWPRm5vf08hDE/tR9bLc2fc4tB/zSILxOaRtm
 e52KqECXUFfQOVGZoxjQ+bsCWmxbeQqVAelbZe0ALQygDepbKcK4eahOURGze8ubI90L
 z0HSTkGWAKflqRCX7KCCTz/gBundaYnK3op5vtISRPqFGOPXHQJUk+Fb/fZXH0/8jTsW
 embei3LGVuu+Hz6+wVCTE2yVFQ3AuUniSl/Ic+wqNitcQUxFFScNyIVb3JZVIPa0Ryl/
 e8FA==
X-Gm-Message-State: AO0yUKV5qCoIDmCkcHxBBfjAc8gl/8EXn1kSpibTMn2TmWfRYFRQ4kyV
 HcOdOuFa7HqaTVwaq4n3NnI=
X-Google-Smtp-Source: AK7set9fvUBiS5FHk1gH4i2GMAcLuy/6Tp1dkhJC2RMyBJ5KBLW1IODPl7FDKC7A+TZf/PC3pP6b0A==
X-Received: by 2002:a05:6000:1009:b0:2c5:788e:3100 with SMTP id
 a9-20020a056000100900b002c5788e3100mr2099008wrx.42.1676804237204; 
 Sun, 19 Feb 2023 02:57:17 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf1ccd0024874f22352bf669.dip0.t-ipconnect.de.
 [2003:fa:af1c:cd00:2487:4f22:352b:f669])
 by smtp.gmail.com with ESMTPSA id
 iz7-20020a05600c554700b003e203681b26sm10217463wmb.29.2023.02.19.02.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 02:57:16 -0800 (PST)
Date: Sun, 19 Feb 2023 10:57:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_target/ppc/translate=3A_Add_du?=
 =?US-ASCII?Q?mmy_implementation_for_dcblc_instruction?=
In-Reply-To: <095e87c0-baad-87bf-56c6-bd20229d00e0@linaro.org>
References: <20230130184950.5241-1-shentey@gmail.com>
 <095e87c0-baad-87bf-56c6-bd20229d00e0@linaro.org>
Message-ID: <03EEB00E-EB90-4461-BCB8-E16ECEA3EB40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 30=2E Januar 2023 22:23:59 UTC schrieb Richard Henderson <richard=2Ehen=
derson@linaro=2Eorg>:
>On 1/30/23 08:49, Bernhard Beschow wrote:
>> The dcblc instruction is used by u-boot in mpc85xx/start=2ES=2E Without=
 it,
>> an illegal istruction exception is generated very early in the boot
>> process where the processor is not yet able to handle exceptions=2E See=
:
>>=20
>> https://github=2Ecom/u-boot/u-boot/blob/v2023=2E01/arch/powerpc/cpu/mpc=
85xx/start=2ES#L1840
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   target/ppc/translate=2Ec | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>=20
>> diff --git a/target/ppc/translate=2Ec b/target/ppc/translate=2Ec
>> index edb3daa9b5=2E=2E8c32e697d9 100644
>> --- a/target/ppc/translate=2Ec
>> +++ b/target/ppc/translate=2Ec
>> @@ -5261,6 +5261,14 @@ static void gen_dcbtls(DisasContext *ctx)
>>       tcg_temp_free(t0);
>>   }
>>   +/* dcblc */
>> +static void gen_dcblc(DisasContext *ctx)
>> +{
>> +    /*
>> +     * interpreted as no-op
>> +     */
>
>Missing
>
>If MSR[UCLE] (user-mode cache lock enable) is set, dcblc[e] may be perfor=
med while in
>user mode (MSR[PR] =3D 1)=2E If MSR[UCLE] is clear, an attempt to perform=
 this instructions
>in user mode causes a DSI=2E ESR[DLK] is set for this DSI=2E
>
>but that's also true for the current implementation of dcbtls=2E  So,
>
>Acked-by: Richard Henderson <richard=2Ehenderson@linaro=2Eorg>

Ping

Does that mean it's ready to be queued or do we need a Reviewed-by as well=
?
>
>
>r~

