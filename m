Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFD4D1423
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:03:26 +0100 (CET)
Received: from localhost ([::1]:38010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWgf-00080Z-0t
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:03:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWds-0005zN-MK
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:00:35 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=33731
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWdp-0006l1-Ev
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:00:31 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id j2so36760413ybu.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y4yt6aKVg1jFu4At2gcY/TrGG9+m5Eya1B1cmCvlpeE=;
 b=jGLv2KwHEnx77DIeU/OqvABMZObbXjcxS6gSQ909N7LNn2IfkHSXngq6eX+HGluUf0
 qbydgo+k40zxzL8VNQBwOgmxGnhbiPfsSf51VRzrAmVfWEDHCbugNK/Awy2+B6rs57ZI
 tYrRVLDeLWUd1R2CSfFG+BRK1Xs4mamEgCgzJNtAGLsqiOAR5TrZHZhAcT1sUXb0kFrc
 BUd6J886NwAKNJLKruNSRAqrk5oaKrE3BRprK7W85SN0lyMGMGd+61Y1gj43m3JxhQcd
 BtXVjUOZ9sZRyRH+jvUfUFR38oWpH0SZkdKKs16+TNZEsagCdD3MRWJk5aZlFYZbTm6Z
 D8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y4yt6aKVg1jFu4At2gcY/TrGG9+m5Eya1B1cmCvlpeE=;
 b=NOPrOyWMkXX2yS6btAE93BKKT1xcafSzP18djQjlZmvbVWKNL81+0MwCM9bO64HKNK
 6v/cNdAMRrSQEkDmMzpMamBuEUljFtQtA30d+dEO6xH/rGjuQehqgCQWWQQZW3PcNZ2/
 SS4/zsOLwViRKVrSK4m/fZVBcKKd03Q+TaP+wIWFvgGIOp15YXwcLBIdjprNW00z64JP
 mpVuU92SOpvSLaSK2Wac9+tttDetrKzUbI5tfhY2tWmcFZBuk3Y3vCrA3YZ1Q+LjOGSg
 rb0HnwBbCJiJtK7sFbAHqxp+h6fkr8pBIWjgZ7LByWnsUDHquh6Mh8hbwBR7KLJlFvza
 aLEw==
X-Gm-Message-State: AOAM530JUN+buzsGActHi/N1dWAjzHMFlTsGRtDYG59/nvTuv1B0cklj
 /ss1Ot7ijXWGEGKnWX2ek70twmlBdQ6DgaaokKt7ZQ==
X-Google-Smtp-Source: ABdhPJyCGAtMxA2FAE3jbVjHOtDEcIabMbV7D183c4KZllJ4u8SFGmgXat2ks5nUwYxXJc3iCXNSoWcAhIbhnuj8D8k=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr11049506ybp.39.1646733627214; Tue, 08
 Mar 2022 02:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-9-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:00:16 +0000
Message-ID: <CAFEAcA8L5_nhMExMbYqxrt9Pk_BRpTe=tZ462Ur-3XDxy+MpYg@mail.gmail.com>
Subject: Re: [PATCH v4 08/33] target/nios2: Remove cpu_interrupts_enabled
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is unused.  The real computation of this value
> is located in nios2_cpu_exec_interrupt.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 727d31c427..14ed46959e 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -227,11 +227,6 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          bool probe, uintptr_t retaddr);
>  #endif
>
> -static inline int cpu_interrupts_enabled(CPUNios2State *env)
> -{
> -    return env->regs[CR_STATUS] & CR_STATUS_PIE;
> -}
> -
>  typedef CPUNios2State CPUArchState;
>  typedef Nios2CPU ArchCPU;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

