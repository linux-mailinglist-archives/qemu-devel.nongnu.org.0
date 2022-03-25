Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7D04E7349
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 13:24:46 +0100 (CET)
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXizl-0000hf-4f
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 08:24:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXipv-000213-TK
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:14:43 -0400
Received: from [2607:f8b0:4864:20::b31] (port=34350
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXipt-0006Uz-0C
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:14:34 -0400
Received: by mail-yb1-xb31.google.com with SMTP id g9so11263711ybf.1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QSehcYA2tHOoXmrlV6cO2OR3lWHg9KB8JtoIMv5bOPI=;
 b=eKtsqfdftxmCkDGRQneUioz8C/uvXYnkodSQqYkpOrd4dDZefyXVf4qIU3tY2UcHvA
 Am6sI+BbrMCIPbl6DsE9em7bRHZ3v67Xa0FTbVjT48wZTz6SgYPoXL22YzIRNHOQGQc1
 WhmBBsQqb0GkQ6CViQXO8807amxmuqls8TXqlulagXIx3KmhkNsgfRNCdA3dQ9FhS/0I
 NDBub5B0jrJm9tFjMBRSkwVAX/aJ8D0dpmtoDobcG2JsTF/hoM2wz+J6qKpC194RwAQM
 iFIXMs/Jjjoxb5VYIbZHpD7Vsox6QkVh13/Qwc8CTBBKsa2PxuFl/gDB4u90ZsALKnwJ
 L4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QSehcYA2tHOoXmrlV6cO2OR3lWHg9KB8JtoIMv5bOPI=;
 b=czaUzsla2wlRzyC1tVLGyECwN+lZvhEPapzKEdYTGT+HICnPezE9RCJM9gT8IKIW2H
 ug2Fzl4k+BdcpeM11Mn01R0zTOCwb5qKPhG7cRFllbTe1Dy8WhzbkGkRPXP6X74Jkf0d
 eAOhti4D+h7IOkZO9UbaaBVj8do19/UrZ3n1IbKQ7yhw62m6SnJBAm/iO8bae3LwH7Rt
 v40tKgJ+BzyFM6Vr+0OSgdZAG37QyZLJtSIxxJP6PptJ3b1NFGhXjWJgs8OrYhY/x4i3
 l8Hzd7Uty/hfhSMHiKrSO2wc+OFykSPYTk7Zle25fYuOI3tYoMewaf6yX52yhrmoduNb
 jH1w==
X-Gm-Message-State: AOAM530sThAhp1ZhPMOrol4GKlqQhlzA0TnWm1d5+YfKM5Orc7/Ymdll
 TBtfWr+9eWg5Z3r7W299BI6ZB/7jERW+OMvgPTrWnvYi7na3nQ==
X-Google-Smtp-Source: ABdhPJxSkNNUWMpNK4vShRNJ8JWa3mgwTAeybVcKYOMD2X/VEei8tjOf6JOzRL28Z5litnE638yDo48TZg3fNyvl060=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr9636318ybq.67.1648210471475; Fri, 25 Mar
 2022 05:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
 <20220320160009.2665152-6-richard.henderson@linaro.org>
In-Reply-To: <20220320160009.2665152-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 12:14:18 +0000
Message-ID: <CAFEAcA_1-NUp9G5LhNo=g5s8-n8zccgqAXaw3-qceHknS9_-hw@mail.gmail.com>
Subject: Re: [PATCH 5/7] linux-user/nios2: Remove do_sigreturn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Mar 2022 at 16:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is no sigreturn syscall, only rt_sigreturn.
> This function is unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/signal.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
> index 517cd39270..133bc05673 100644
> --- a/linux-user/nios2/signal.c
> +++ b/linux-user/nios2/signal.c
> @@ -185,13 +185,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>      unlock_user_struct(frame, frame_addr, 1);
>  }
>
> -long do_sigreturn(CPUNios2State *env)
> -{
> -    trace_user_do_sigreturn(env, 0);
> -    qemu_log_mask(LOG_UNIMP, "do_sigreturn: not implemented\n");
> -    return -TARGET_ENOSYS;
> -}
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

