Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD95387B5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:22:14 +0200 (CEST)
Received: from localhost ([::1]:44224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvkxx-0000fD-Jn
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1nvkwC-00080D-FB; Mon, 30 May 2022 15:20:24 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:46233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1nvkwA-0005bK-Md; Mon, 30 May 2022 15:20:24 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-d39f741ba0so15411685fac.13; 
 Mon, 30 May 2022 12:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJYvyiQx06E5M2Hcff8fAOotWcTjfgerTiMzF//OTj0=;
 b=ETjtyim2pSo97QT06wv4Sj2vhWmDuvBajcZoPWo1SxS4PRIrdBhFmkZugSlgVc0+yH
 xx5aDZXYgIhGZP70+lCvfKRImPTZi/QuHll8uXSClLbV7H1P6NarOkBBaT4on9A01a4Z
 /BpyDuHFyhD/TqWTMrWWlDTte8R3zJbWiu/SOX8QF82IXpALhY2EebGsW/VFjYWnFrYr
 iAMXMVaM/XU6CNyDZzyl0QR1hLvxSaKO+HryZgTBoyihRp3i5YOROwvlW79pvn9/5sFq
 e8SPqmuBMmsAplO4Dr64LhrLOHykNJYQUutXolfhx7JaF4abmWF/yUvb30UFDNfUEyhC
 uKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJYvyiQx06E5M2Hcff8fAOotWcTjfgerTiMzF//OTj0=;
 b=Kipp5FCLKjgPChUynLo6mYjft68n5wae83wSdvr+5WqfeCMUYo9O7kwkc6XB+QUQCl
 DiDGzw417hmRFHzNT/gYj7Ip1htzvVB6Y8NgP0hKWMlEGxhxl6TK8D8uIyCmTbFpLj0n
 8D8NWSbvQXU55g2oNewPvzRNt6akDLewkynMvryoZ5SSJD96CV5uKFXWHrr4RMHwiQSA
 nn5Xmg+7uXqfKOlalsByFCRfjDX8uXYk9Oz1Ocna5b3eRVtbcKTUO/wivlOt3CDy9/2z
 NCQXZIsk/V3oIn/ootCe21ZiZ5kc6GxB+Aa0S+mq/nfl+EJi2zoYFdgLP2LN1SnmBlou
 l33Q==
X-Gm-Message-State: AOAM5306H78MKsVBm2qFECOAO1hyRS6EQ/yo3oQwq97Uo697b6BPV91w
 z7AJj8Whngl5YA82KtUFlhjZAV+67lWQgS7WhCY=
X-Google-Smtp-Source: ABdhPJwX6DR3Z2dM6N3tLKzpcMGLEztPKdWMKmgvmwXHSz2mZjQ1E+GjEc4XaWBxS6CH9BxJkQfZy+hCbEfTdgZxvV4=
X-Received: by 2002:a05:6870:b408:b0:dd:ed4f:b1c7 with SMTP id
 x8-20020a056870b40800b000dded4fb1c7mr11783389oap.41.1653938420534; Mon, 30
 May 2022 12:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220527101104.26679-1-gautamnagrawal@gmail.com>
 <9337daf2-57bf-d2ee-6731-8f10251fbf17@redhat.com>
 <65ab5613-7fe8-038b-b011-eb16b8728a2c@redhat.com>
In-Reply-To: <65ab5613-7fe8-038b-b011-eb16b8728a2c@redhat.com>
From: Gautam Agrawal <gautamnagrawal@gmail.com>
Date: Tue, 31 May 2022 00:50:09 +0530
Message-ID: <CAG-ETXv+rTpnbRkB4zhXjygAHVMYFLFKtajV-u-3RFG-s1zreQ@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg/s390x: Test overflow conditions
To: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, cohuck@redhat.com, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=gautamnagrawal@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
On Mon, 30 May 2022 at 16:05, Thomas Huth <thuth@redhat.com> wrote:
>
>   Hi!
>
> On 30/05/2022 11.50, David Hildenbrand wrote:
> > On 27.05.22 12:11, Gautam Agrawal wrote:
> >> Add a test to check for overflow conditions in s390x.
> >> This patch is based on the following patches :
> >> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5a2e67a691501
> >> * https://git.qemu.org/?p=qemu.git;a=commitdiff;h=fc6e0d0f2db51
> >>
> >> Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
> >> ---
> >>   tests/tcg/s390x/Makefile.target |  1 +
> >>   tests/tcg/s390x/overflow.c      | 58 +++++++++++++++++++++++++++++++++
> >>   2 files changed, 59 insertions(+)
> >>   create mode 100644 tests/tcg/s390x/overflow.c
> >>
> >> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> >> index 3124172736..7f86de85b9 100644
> >> --- a/tests/tcg/s390x/Makefile.target
> >> +++ b/tests/tcg/s390x/Makefile.target
> >> @@ -16,6 +16,7 @@ TESTS+=shift
> >>   TESTS+=trap
> >>   TESTS+=signals-s390x
> >>   TESTS+=branch-relative-long
> >> +TESTS+=overflow
> >>
> >>   VECTOR_TESTS=vxeh2_vs
> >>   VECTOR_TESTS+=vxeh2_vcvt
> >> diff --git a/tests/tcg/s390x/overflow.c b/tests/tcg/s390x/overflow.c
> >> new file mode 100644
> >> index 0000000000..ea8a410b1a
> >> --- /dev/null
> >> +++ b/tests/tcg/s390x/overflow.c
> >> @@ -0,0 +1,58 @@
> >> +#include <stdio.h>
> >> +
> >> +int overflow_add_32(int x, int y)
> >> +{
> >> +    int sum;
> >> +    return __builtin_add_overflow(x, y, &sum);
> >> +}
> >> +
> >> +int overflow_add_64(long long x, long long y)
> >> +{
> >> +    long sum;
> >
> > Just wondering, why "long long" in input and "long" in output?

> It's been like this in the original test program that has been supplied in
> https://gitlab.com/qemu-project/qemu/-/issues/616 and .../618 - but I agree
> it likely makes more sense to use the same type everywhere (i.e. switch sum
> from long to long long).

I will correct the type in next patch.

>
> >> +    return __builtin_add_overflow(x, y, &sum);
> >> +}
> >> +
> >> +int overflow_sub_32(int x, int y)
> >> +{
> >> +    int sum;
> >> +    return __builtin_sub_overflow(x, y, &sum);
> >> +}
> >> +
> >> +int overflow_sub_64(long long x, long long y)
> >> +{
> >> +    long sum;
> >> +    return __builtin_sub_overflow(x, y, &sum);
> >
> > nit: I'd call all local variables "ret" or "res".
>
> Well, "sum" is not the return value here, so "ret" could be confusing, too.
> "res" or "diff" might be a good choice here, though. Gautam, what do you think?

I agree "res" sounds better.

Regards,
Gautam Agrawal

