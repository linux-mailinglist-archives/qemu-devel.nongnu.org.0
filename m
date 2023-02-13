Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDEF694C84
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:23:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbcG-0001gD-0i; Mon, 13 Feb 2023 11:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRbcD-0001cA-2o
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:23:41 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRbcB-0008Ot-7y
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:23:40 -0500
Received: by mail-pl1-x62a.google.com with SMTP id r8so14039474pls.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6l2/UFdvX+slMeMMiN5z/2mBC0bdhmSyJAGs5dm5osw=;
 b=GQYcdRr3A2Da/rQearnq6vJ+QfKuOUzimbLJSC/PH4ZpehYEu1RaqLT5Pl0xMDwWEG
 WaYoSs8mHZCcs6vNgd4ucMFNvcu+V+Fchag3c17VG13g0ZxOaDrtgPxvGR1CQWsEj3kU
 bKtl92FAXAtXqrDj/FFXqb7FBWFS+DI0YvCu082gJnmVYl/8DACBjBoKv46esojDodHL
 n47gahR848zmM6P3mVTnQkqFoZiFT0l3bfyj1YS1zdBsC6T+yD8A7TYoHOxlqAYgWvNm
 2Z9mDpmy/tfDV8zUkxQmOliewdeBwgYpTbnJFZULiWuOADz5+3y4mTXux0z/LwZ6Ckef
 S0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6l2/UFdvX+slMeMMiN5z/2mBC0bdhmSyJAGs5dm5osw=;
 b=wma3rVfnlgGRc02/Q4Wy1Hvs0QnIeR8I3ohR7QqmEfSD3TdxvbG1hx8r30yGlCYHf+
 2Tduky8UYE2Tc1gL+G6FRcpkfqveiClQa45cV82q25SA4UxEc+/gEqmBZnFz/bMql2eU
 p4oHlRtHmWIDWUvZ+Oet+fe91sf/akSwYe4+zGJghY3+o+/nmXDXWbhUOAgCRpYngpIQ
 5PCiicVJwvotblLzNW0sPtXKa5ZZ4J7aWwtv/wU8EQrXBv98CYlgom+1SjuTDn45Z+WW
 a7z4/P+qR0FAnE/SE2eh7gdaYkgJIbEUawG2GvXRqQmSryRMgy1GEjEXv007OEgQtiCj
 VpyA==
X-Gm-Message-State: AO0yUKWMsKwBshIx3D+ohalPa9kqQHJMXxTQ4ywfnYgYtKEm6ICl7BwJ
 ozeQ1OJseOxqts064cSM4oPo80jvV01rYT6E3DZYNg==
X-Google-Smtp-Source: AK7set9EYUFyVv2ZxhxcDoPVhUU23HlE7ObkmU3n8anedmYaTWjLXB+lKOMFYmpAPvFqmJJke1ML5bCga+cYKjV0hCg=
X-Received: by 2002:a17:90a:384a:b0:230:bcbd:b871 with SMTP id
 l10-20020a17090a384a00b00230bcbdb871mr3872474pjf.75.1676305417423; Mon, 13
 Feb 2023 08:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
 <20230202211129.984060-4-aaron@os.amperecomputing.com>
In-Reply-To: <20230202211129.984060-4-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 16:23:26 +0000
Message-ID: <CAFEAcA_gL_9CD83jxn2ebXVEfC47+AnC8BTf371xVEDuwnZUTw@mail.gmail.com>
Subject: Re: [PATCH 3/7] target/arm: Implement v8.3 EnhancedPAC
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 2 Feb 2023 at 21:12, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  target/arm/pauth_helper.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index f525ef7fad..a83956652f 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -347,11 +347,15 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
>       */
>      test = sextract64(ptr, bot_bit, top_bit - bot_bit);
>      if (test != 0 && test != -1) {
> -        /*
> -         * Note that our top_bit is one greater than the pseudocode's
> -         * version, hence "- 2" here.
> -         */
> -        pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
> +        if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
> +            pac = 0;
> +        } else {
> +            /*
> +             * Note that our top_bit is one greater than the pseudocode's
> +             * version, hence "- 2" here.
> +             */
> +            pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
> +        }
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

