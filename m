Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7CF4DA25E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:26:42 +0100 (CET)
Received: from localhost ([::1]:47010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBsX-0001bo-V6
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:26:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBl3-0005iG-4q
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:18:57 -0400
Received: from [2607:f8b0:4864:20::1129] (port=44995
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBl1-0001mD-Kg
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:18:56 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so212039827b3.11
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6grNoADTT+T2yahG9oP6AWYgykkuuTYI1in4uTHk5t8=;
 b=PbKAEF3eK/DGOeYjkjDWd82Uep05iZ2KpXGY2WKWEytv17J605XopyZGqbGPLIy8QZ
 2LTArJ511DOb6EZwehnfMlA6zvBcca5hGJdZvINkQS4BdGKmIJa2DAPFnbyFlvGPKfml
 gEmZelZtgIKaiUyXer3WxrIdg5igxF7xSeuRYHPmnXpXbd0Jzdoef3TlnI2lOVMslDXE
 CpCqrJb8Cc/OdPpqShFv+kojBhLm0irSWB9iT4rpWAqAAPjr9NQxSc2DLcL2/LICq1nM
 Ctrty064DmLlYBWv0HyjQ0+blu0yiPMcmdSvGhQLgsuFOycMFVB/FwCXqyOOfhW8EBNb
 hLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6grNoADTT+T2yahG9oP6AWYgykkuuTYI1in4uTHk5t8=;
 b=m7Ffjv3cqIJFZ9R+JKCJZDdm3m25IITvcnz+FScSo+YUki71Ra8G+88AO3afSr2V5Q
 ca55DOAw82ioUAyBNW9WSO6Zwd5EVDE9F9JNuIz6WpiYd1JOOmQiclTazYjJrdcVkTWw
 9N+J/ZLxZBnm7h4pBjmAuUlUvBRIE4g6+FSsL0yeKQaN10S3SSmTwKW2Q9WJRdP7vSlg
 6Uf31BsvNhLvC2H8d7xcpeT9y1pJFj2X0gLfY+k+bdgykkwFEKdrJT0bk5hkXUtBtjfo
 iJrCmTGYcHu7ANu5AEY95b1JGTS3WK8qHjJvJVqrZ1DW8hoCNTyl1/jD00tkyCn3EiEz
 UbnA==
X-Gm-Message-State: AOAM5328eiuMbcnI3EGs57Y7guVfqgsloIq0Wxpg7a26QZV/CMWQ2PWX
 usuHNb0ztWYT5dMPqzNVgJQfBoBg2eZdOlUyzS3ljQ==
X-Google-Smtp-Source: ABdhPJxSRRtG84QXlLVloLWx4oKKTQzbFqJnkx8hg5+3b7o64dvMBkzA5jhfzMtgoQ1cmcqsJOfV71T2+GMl4aeyDhw=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr26887036ywf.469.1647368334020; Tue, 15
 Mar 2022 11:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-4-richard.henderson@linaro.org>
In-Reply-To: <20220314044305.138794-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:18:42 +0000
Message-ID: <CAFEAcA_8vJOJBatwFiX255n3HgTBBhCtiquGfJ8U5ryuL+-v0g@mail.gmail.com>
Subject: Re: [PATCH 3/3] linux-user/arm: Implement __kernel_cmpxchg64 with
 host atomics
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 04:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> If CONFIG_ATOMIC64, we can use a host cmpxchg and provide
> atomicity across processes; otherwise we have no choice but
> to continue using start/end_exclusive.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> -segv:
> -    end_exclusive();
> -    /* We get the PC of the entry address - which is as good as anything,
> -       on a real kernel what you get depends on which mode it uses. */

This comment about the PC the guest signal handler is going
to see when we take the SEGV is still valid, I think ?

> -    /* XXX: check env->error_code */
> -    force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
> -                    env->exception.vaddress);
> + segv:
> +    force_sig_fault(TARGET_SIGSEGV,
> +                    page_get_flags(addr) & PAGE_VALID ?
> +                    TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR, addr);
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

