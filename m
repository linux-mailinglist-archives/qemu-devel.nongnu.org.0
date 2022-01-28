Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C452949F7A1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 11:53:41 +0100 (CET)
Received: from localhost ([::1]:54162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDOsu-0003Ig-BY
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 05:53:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDOqP-0001Pa-P0
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:51:08 -0500
Received: from [2a00:1450:4864:20::431] (port=34330
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDOqM-00035d-Kv
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:51:04 -0500
Received: by mail-wr1-x431.google.com with SMTP id f17so10136001wrx.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 02:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aQyN94duJXexWxI36pp2rVCw83t6s9vLpOMLUkHi5eA=;
 b=vHQcVxgOckzMDckiYgiz1zM5A6sGP8qAcio+8mX4k7WdDsMKR4MNb5XsSMsVN+OWG1
 aDgGNVUXXvmW1Fow92ufak6ty91vx7LxjM3+YLGTP3A6StbjSHk7OfuxiB/OXreMPmW6
 JbS6R32Kykl2HwJiNilnGEU3GOF6hAcn8QuJ201Dszh641EKtwn2dNWEBAJpSywZvN8n
 ZWTLA0mT0fRE2GV9e1kcnEEqAZ91ovPtU//mv7rEapaPmNbmqytEPP2UqqIEitpItlj7
 KcGjpt44MswvEri+NunjdXgwwVU75QX0c0fQA8V0kZiMfS8cTCZhQzvXMItoMnpfbCDj
 3r4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aQyN94duJXexWxI36pp2rVCw83t6s9vLpOMLUkHi5eA=;
 b=OhyRA1AKYJQK0ewcQV6UObgSApxy20ThzvlsGDs1wHfd8osZ/3/wzMO1xWM6zYiWix
 g4K0xxPFgHUBxS5XV93Xp4K35hzWXmobBLQA9x0HXXCXyXORJvDESoS8tmSZJ9Vjy9Ti
 vq3FF/ZUOHKEYtTpEzrG+ZcWcwbc3jTemH7W4Y5CrqBwygO1K6Ei4c5UJO6xI1yTs32T
 gkGkCqwFIG84rxd4MV2I0xIyPkYff3aPXlIvzyYNvaovw9708DvjUCIORTI8k3wnoHwE
 B+gYGpO2JVF1CgEew6a6gJQPzubGhHUhscQag42hu0cbAuT/3Oc9UlR3KKiVz66ZVDsu
 15vw==
X-Gm-Message-State: AOAM533tBBUtJVy90PZcyXSWsKpW2kvMVd3vKEQw5RsKXlgEgRaUTqb9
 5Qzoyc0R35ZbzqSYvVLvOMlwEeJ9y6Vbz+Euw6EJzg==
X-Google-Smtp-Source: ABdhPJzIo0eKjyI4wWkgld4YACXagC/fnbq0ShzIWaValSKlycbUaSnHjZb8CCnnh+Gmzpkpr12i5RbyI1MvmVIvYn0=
X-Received: by 2002:a5d:438a:: with SMTP id i10mr6438225wrq.295.1643367059789; 
 Fri, 28 Jan 2022 02:50:59 -0800 (PST)
MIME-Version: 1.0
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-2-peter.maydell@linaro.org>
 <e81fe48e-af20-5e4e-959c-be8e2265a513@linaro.org>
In-Reply-To: <e81fe48e-af20-5e4e-959c-be8e2265a513@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 10:50:48 +0000
Message-ID: <CAFEAcA8Qf4aG70bCqxXfCT1a_df5xpBBYi84Z+tupEMUp7nzNA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] hw/intc/arm_gicv3_its: Fix event ID bounds checks
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Jan 2022 at 01:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/12/22 04:10, Peter Maydell wrote:
> > In process_its_cmd() and process_mapti() we must check the
> > event ID against a limit defined by the size field in the DTE,
> > which specifies the number of ID bits minus one. Convert
> > this code to our num_foo convention:
> >   * change the variable names
> >   * use uint64_t and 1ULL when calculating the number
> >     of valid event IDs, because DTE.SIZE is 5 bits and
> >     so num_eventids may be up to 2^32
> >   * fix the off-by-one error in the comparison
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   hw/intc/arm_gicv3_its.c | 18 ++++++++++--------
> >   1 file changed, 10 insertions(+), 8 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> > +        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
>
> Could be written 2 << N, instead of 1 << (N + 1).

It could, but the spec defines the field as containing
"number of supported bits, minus 1", so I think that
using an expression that matches that is clearer.

Aside: clang optimizes both of these expressions to
the same thing; gcc does not:

https://godbolt.org/z/nsz4Mdxhq

(not that it will make a perf difference we care about here).

-- PMM

