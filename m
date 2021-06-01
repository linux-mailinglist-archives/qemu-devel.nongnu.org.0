Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48570397100
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 12:10:06 +0200 (CEST)
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo1LZ-0002eY-Ca
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 06:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo1J5-0001GF-Kh
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:07:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo1J2-0001AK-H6
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:07:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id f2so2572793wri.11
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 03:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:message-id
 :in-reply-to:mime-version:content-transfer-encoding;
 bh=6RjK8RtTmGOnMmqg4dzaMJdy9n3kz8IEifafrE9sjQo=;
 b=XPWPrhbENC9KwRTHn+axWBXW3jiTvrz8pixhp3Ub2n2ndY61K9FK+Y4UuSnVphXMFY
 sAtEwu+Q15jUXBmF+jBdNAjYS0JE90O8thY1gnCmjNGgJoBhZCnH83uXNFxvDy+c/yzb
 /085wEicsqb99o3WDHcCO16gKb4lscfNAOD9QaWbeu31GCMPXFZ8QgWDBKggbpRJ6iS7
 Phr0Lqb292gpkPhpJUCyLOg4Ia2fneEpC9IHKhDC2mzKrj/MUMo8/5xV7ueJzwltgndS
 SMwb/w5IqL2T3F7rU0bavOWeE3xD9rNQMmqc+gmNG7O5m4PGtrmewWeb2F34F2BxDQXy
 R1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :message-id:in-reply-to:mime-version:content-transfer-encoding;
 bh=6RjK8RtTmGOnMmqg4dzaMJdy9n3kz8IEifafrE9sjQo=;
 b=b5OTwuatrnhcA/+KewOvbabwGSv8DxushuaS7wH837ZmUR723f+QBDh8Hdo4bQTgkd
 C7dvz+7kbGOlm7T/2c1rf7xkTojl6YztK5+xtiInCshCxfbIiFMXO3AiuY7JO9FyJGCs
 3vMbH9NnLlznRzn26beBoQOGbj+AZdV9dF4Eqb25kaVdLhy8J+ced1XxsWz8VuzMpPhb
 FGKQvAnwFkKHhy07/Nm0vnZ+pEEl4tmgZXGrA3Zt9KAY+rYcoYzCPpQqr6d/ZOXF3txp
 V0Xt2IAGi2EdW4b3tC/rWAxuJpBvjT8NDHRKwn/JbL8CWMxu9Hn2TBGqatQoMx05ceTN
 KiPA==
X-Gm-Message-State: AOAM533HQENI2yRw29u9Fx+J+Ueko8i5EWAzwP4lWanm8Ks0o38JY+3u
 EAFoF/dTcaj+tMdvzeT9cH1/Xw==
X-Google-Smtp-Source: ABdhPJzp57F0SMV1c1poWzux+/tatUzadl9CEdssNWvHvGDp1XNkp1sdw08ohPocIlFu7gaVR7whjw==
X-Received: by 2002:a05:6000:156d:: with SMTP id
 13mr27075820wrz.181.1622542046742; 
 Tue, 01 Jun 2021 03:07:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n12sm2861236wrs.19.2021.06.01.03.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 03:07:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 041BE1FF7E;
 Tue,  1 Jun 2021 11:07:25 +0100 (BST)
References: <20210601090715.22330-1-alex.bennee@linaro.org>
 <CAFEAcA-zzg4Yh0pX2q-9OfFKEbX_uGkVb_8kZbQJJETLRo_zOQ@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
Date: Tue, 01 Jun 2021 11:04:17 +0100
Message-ID: <87fsy1dhke.fsf@linaro.org>
In-reply-to: <CAFEAcA-zzg4Yh0pX2q-9OfFKEbX_uGkVb_8kZbQJJETLRo_zOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Andrew <astrauss11@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 1 Jun 2021 at 10:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> The previous numbers were a guess at best. While we could extract the
>> information from a loaded ELF file via -kernel we could still get
>> tripped up by self decompressing or relocating code. Besides sane
>> library code has access to the same symbols in run time to make a
>> determination of the location of the heap.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Andrew <astrauss11@gmail.com>
>> ---
>>  semihosting/arm-compat-semi.c | 19 ++++++++++---------
>>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> This seems like a pretty good candidate for breaking existing
> working binaries. How much testing against different varieties of
> guest-code-using-semihosting have you done ?

None, which is why it's an RFC - but at least one user reported newlib
attempts to use the numbers we gave it rather than falling back to
numbers it knew from the build and getting it wrong. I suspect any code
that doesn't have a fallback path is getting it right more by luck than
judgement though. I'd be curious to hear of code that relies on the
numbers it gets from QEMU.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

