Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8B339F94F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:38:07 +0200 (CEST)
Received: from localhost ([::1]:34940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcrm-0001ul-5m
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqcqZ-0008Rx-5r
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:36:51 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqcqX-0006zP-HD
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:36:50 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f2so21809909wri.11
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gu/O7t1C8nUkhv8H6tMBLNhlRWttuok539LawFo6y7g=;
 b=obaihrzOMl2TFm0diFIXPx35p685/S9yfFUztRKhZNc2JlLg65/866Fq4ElA+7K0mg
 gT8m8rA6PL5GP5/Yxvz+zqg/Selne4xCZhM+2snLQEHIOSmhn4DoV0pNHxcaFsm5z3eO
 u/X7wCir6qxrrG0Ik/2IinmEnTp9imNuS/CJ8fYKH9V7mJZy3rS/VpTHV5/0HfOn8NMY
 5qs2ckdK3ksao2GXuEKaMAX5h4F4cbpkuCeYPYV1NauKDSFx9iEKsiWxsRdW7ANf7DFG
 CyynAdAORE57VcCo35EDdBCa8tu1hU6056SRMKDm/8OStkAKRdh5f3/mx2qY+J3Nc+at
 lvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gu/O7t1C8nUkhv8H6tMBLNhlRWttuok539LawFo6y7g=;
 b=bbfm65pjwi2b/tut6Vn3naeoTmfPznQgyH7doNqD3mSsCk5bpjVn38w4lsY23ntnQX
 rwCnA80BCyRyZcPWAX5GLvU3nyX51sPHAxwjhEhsidywDGJj5Y+6zyRQgpm9xl17elqJ
 bWS3htF8mFX9kLOZ4ZpXHBVuu4Ii2Ly16PXg2Ae+fPfW+XIHbJhKBayURzrXVClQWjPk
 TgA3Gjac13IPSRBqTkqzVdO1Ma6X8Ljs2qUprzzRRNo9DmMaorLodT9CC+7VkBc6ubqg
 qdQmglfXyrUDTmpA3zOtw2lxFLdISWSn4flpnkFsaeCnDDvwPIGGlNOY+N9DIblcCG6p
 3J5w==
X-Gm-Message-State: AOAM531FL39sFGwXLe7M46HcRK98+Z36t5JlkC+JKTySwtpaLKgtzek7
 hk4CLs345YwkLzF527KuFOm80g==
X-Google-Smtp-Source: ABdhPJx3D40BJC6fC9q0hE/gwuG33nCIvM6DjBTj3MkKhSYGKXSDUzdsUFRcBW5DsYViVqjLXdscrA==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr22922411wrn.337.1623163008067; 
 Tue, 08 Jun 2021 07:36:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g17sm7287507wrh.72.2021.06.08.07.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 07:36:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B7F11FF7E;
 Tue,  8 Jun 2021 15:36:45 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
Date: Tue, 08 Jun 2021 15:27:00 +0100
In-reply-to: <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org>
Message-ID: <87im2ol8xu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/4/21 8:53 AM, Alex Benn=C3=A9e wrote:
>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>> machines is about to be broken...
>
> Um, what?

Really what we want is to probe the -M (machines) that a binary
supports rather than just barfing the test because we've built a QEMU
that doesn't support all the random 32 bit machines.

> r~
>
>
>
>  and besides it's not likely this is
>> improving out coverage by much. Test the "virt" machine for both arm
>> and aarch64 as it can be used by either architecture.

I think this point still stands though, I don't think we get much from
running the cdrom test with realview et all on qemu-system-aarch64.


>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/qtest/cdrom-test.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
>> index 5af944a5fb..1e74354624 100644
>> --- a/tests/qtest/cdrom-test.c
>> +++ b/tests/qtest/cdrom-test.c
>> @@ -220,13 +220,16 @@ int main(int argc, char **argv)
>>               "magnum", "malta", "pica61", NULL
>>           };
>>           add_cdrom_param_tests(mips64machines);
>> -    } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")=
) {
>> +    } else if (g_str_equal(arch, "arm")) {
>>           const char *armmachines[] =3D {
>>               "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
>>               "realview-pbx-a9", "versatileab", "versatilepb", "vexpress=
-a15",
>>               "vexpress-a9", "virt", NULL
>>           };
>>           add_cdrom_param_tests(armmachines);
>> +    } else if (g_str_equal(arch, "aarch64")) {
>> +        const char *aarch64machines[] =3D { "virt", NULL };
>> +        add_cdrom_param_tests(aarch64machines);
>>       } else {
>>           const char *nonemachine[] =3D { "none", NULL };
>>           add_cdrom_param_tests(nonemachine);
>>=20


--=20
Alex Benn=C3=A9e

