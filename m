Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB353D4F40
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 19:47:31 +0200 (CEST)
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7iDq-0008Pg-92
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 13:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7iCB-0006FD-Rw
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 13:45:47 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7iCA-0007cQ-7N
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 13:45:47 -0400
Received: by mail-ej1-x62a.google.com with SMTP id hs23so12529374ejc.13
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 10:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7r7bLAOakrv2P+jlcns7O9dm8V4qinS8ZyvYmYF/Qt0=;
 b=Xy5kyWGXya+CtQJQ+sVa1cMdS+ImjFBj5byA11UB1PFGGwrb5L2E0bH9zM8JBHpXZC
 oUh2roE4Jf/9eu1BDtcMOa/f4s01VbxsMIvUfAMRirmdVH0SpenXSm25o+L5rvNCV3op
 VLjebiPUU/ZYEHONwA/KGpUScjj0eh85zFtsS+hqXNyy5xpWmtmGmk8+sr/JI4VVguSr
 ssq/m0+HagrciK3AZMqqFG5VFbASH+2oo3Zg7/JTdwFeNm4nZem0YyA1OirRgV56ksYz
 +HV0AHIteRuYNUOaLAWpDCsUZgb/guWLY/zYhO0T7IX2c4Lwn0s4B8OabS3r7PnVVYnP
 1Rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7r7bLAOakrv2P+jlcns7O9dm8V4qinS8ZyvYmYF/Qt0=;
 b=LYQRMPUKW7GIyMzEugL4p9GJsTq5hBhgteCqEuHoixrsptLAaaFXHEtaUawgl9hhT+
 P/2vuSGgEqfUHsNa8C77vKAzArJrdE+oqBGRfKeDZUPFddGkOfjZmkYAPtmyzFbYwHrd
 xNMqFyRdvZ1YNV5PVN2zZpSvgffPKsnqEt+0949SyP6qH2tHVo8w/KzXpefFunIqKP8z
 ORXbL0xxfwposk7DHQocb0IlsiqDFhU6mDdIf6MUJ3W0MjVSV1ef/0wFh9Lx55puYzi6
 OkyBsewfaNO1jqKoC4T3HTPLnXTgvJAmKnm48j8eY+g4fyqp/BIoI6k7SSYo2EP8D0k9
 E83Q==
X-Gm-Message-State: AOAM531/bcqhKT2H3hfN4SQuTtKniECjNnsFz+RO8jLwREUHS1aJJUvP
 y9dcXQQi91wWNl1oHuBGhc6qffPrCfwhnHTjQOxoH2qQX8w=
X-Google-Smtp-Source: ABdhPJz5mdUhpxlJuvqe/z1Tf0g5PQna7iaxa6uIUYWrZdJhE13r+e6rCBGnEV41pc9VsST6QGwshMxsm/813OlZKLg=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr617383ejb.382.1627235144585; 
 Sun, 25 Jul 2021 10:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210725174405.24568-1-peter.maydell@linaro.org>
 <20210725174405.24568-3-peter.maydell@linaro.org>
In-Reply-To: <20210725174405.24568-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Jul 2021 18:45:02 +0100
Message-ID: <CAFEAcA-yUhjXwK5yPm1-uPTO+KmC5Lyv5UQbA5S3qFhzQNo4nQ@mail.gmail.com>
Subject: Re: [PATCH for-6.1 2/2] accel/tcg: Remove unnecessary check on
 icount_extra in cpu_loop_exec_tb()
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 25 Jul 2021 at 18:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In cpu_loop_exec_tb(), we decide whether to look for a TB with
> exactly insns_left instructions in it using the condition
>  (!cpu->icount_extra && insns_left > 0 && insns_left < tb->icount)
>
> The check for icount_extra == 0 is unnecessary, because we just set
>   insns_left = MIN(0xffff, cpu->icount_budget);
>   icount_extra = icount_budget - insns_left;
> and so icount_extra can only be non-zero if icount_budget > 0xffff
> and insns_left == 0xffff. But in that case insns_left >= tb->icount
> because 0xffff is much larger than TCG_MAX_INSNS, so the condition
> will be false anyway.
>
> Remove the unnecessary check, and instead assert:
>  * that we are only going to execute a partial TB here if the
>    icount budget has run out (ie icount_extra == 0)
>  * that the number of insns we're going to execute does fit into
>    the CF_COUNT_MASK
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> You could argue that we don't need the asserts, if you like.
> The first one would have caught the bug fixed in the previous
> commit, though.

"first" in the bulleted list, "second" in the order I put them in the code...

> ---
>  accel/tcg/cpu-exec.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 6e8dc291197..5aa42fbff35 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -843,7 +843,9 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
>       * execute we need to ensure we find/generate a TB with exactly
>       * insns_left instructions in it.
>       */
> -    if (!cpu->icount_extra && insns_left > 0 && insns_left < tb->icount)  {
> +    if (insns_left > 0 && insns_left < tb->icount)  {
> +        assert(insns_left <= CF_COUNT_MASK);
> +        assert(cpu->icount_extra == 0);
>          cpu->cflags_next_tb = (tb->cflags & ~CF_COUNT_MASK) | insns_left;
>      }
>  #endif

-- PMM

