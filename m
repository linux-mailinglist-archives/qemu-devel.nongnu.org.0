Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BC74D1561
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:02:17 +0100 (CET)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXbc-0000RG-P8
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:02:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXZj-00082d-Dl
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:00:19 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=45786
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRXZh-0008Jl-KK
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:00:19 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id w16so36927506ybi.12
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gulIl41nVG0UfuODR+JiM491N6e1Dq0v1efzshAIbn8=;
 b=TCEGoCkNqrZEzV58Xa90mRjm/VbF/jB2QVZjs1qR9suvR0E6xSGMAUzumYO1n1Am9x
 q3CyDMpNzHNwdoKgZcH3wP9tjXX+YXqWg3nxFkgqdO22TFQ0+0P1XWDX1D06pGQxqJ0d
 cjgb3D8vlTHaNpx6PwKXswYP+Smw9pWYdue0yWGVOWIGbpPieEkNY4o9+vPB24qd1L7g
 5RPGevXIW2zuwV7JrWGaTEXINsD+4FoD5TrIXjtzIe9n1RQIohrlw2HWhbRhLpv0xra5
 a0TUbtqTN/W/4F/97D3zmDgfjwy7YqtyDC9jnFgsIFF8vhVpkw6yKTrAaRQtEVMwtuOL
 sdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gulIl41nVG0UfuODR+JiM491N6e1Dq0v1efzshAIbn8=;
 b=XzpctXaHlNLHSjQjAN85LJHEIp5IuFVg1zcWCMr3/jt9MVGFAPPi+aYrqeVgDRkdJe
 zIfbByrpZbUA0vg7LDHwPkyjaZxIQpoBnW2yvdPTWjJiPhPTF4f7SR1U3G8W9Tjj3HLJ
 +pC1QvFS6i+bg2B62286qVYFcXiiRk66/i0DeZfRFA5nn4iDvgsgvwPNZzMl8shwkTfL
 PR+kDmK1pix2m+IjhgVHKY2a+v+ppu7i/wUCp+oNouGhB6RaeHAQS8NBxsdtxKOXNv2D
 gJzIkzHlkey5N7wv/rvr4RAfTpY++uibUom5HnWk6tvHvdGlpT5qQ1uTZP92eYwwz+Oy
 KDsg==
X-Gm-Message-State: AOAM530QturyHGZWluMPbfYMZa1a2wFCKlwsHFhvnoyq3y2qD0bNkV/D
 QUpyj0YvEXKCUoo2QkNoVqqpaMUct0siurC4xcgpNrlCqMbIVQ==
X-Google-Smtp-Source: ABdhPJxSM0TZPWZlFTeQ5yYezqMQiZT8PsiGZJ+k3l44OfH5JiF4eAnFfaRFp0ZXpnj+Pjp6A2T7Z7WWuPySM5swbIQ=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr11380167yby.193.1646737216622; Tue, 08
 Mar 2022 03:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-22-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 11:00:05 +0000
Message-ID: <CAFEAcA99Bo0_xGZbpLbf1N09o2Wfv3CmoBqqkt=0+X9RnUqrfA@mail.gmail.com>
Subject: Re: [PATCH v4 21/33] target/nios2: Use tcg_constant_tl
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
> Replace current uses of tcg_const_tl, and remove the frees.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -675,8 +663,8 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
>
>      TCGv t0 = tcg_temp_new();
>      TCGv t1 = tcg_temp_new();
> -    TCGv t2 = tcg_const_tl(0);
> -    TCGv t3 = tcg_const_tl(1);
> +    TCGv t2 = tcg_constant_tl(0);
> +    TCGv t3 = tcg_constant_tl(1);

Maybe just use tcg_constant_tl(0) and (1) in-place at
the only two uses of t2, t3 rather than retaining the TCGv
local variables ?

>
>      tcg_gen_ext32u_tl(t0, load_gpr(dc, instr.a));
>      tcg_gen_ext32u_tl(t1, load_gpr(dc, instr.b));
> @@ -684,8 +672,6 @@ static void divu(DisasContext *dc, uint32_t code, uint32_t flags)
>      tcg_gen_divu_tl(cpu_R[instr.c], t0, t1);
>      tcg_gen_ext32s_tl(cpu_R[instr.c], cpu_R[instr.c]);
>
> -    tcg_temp_free(t3);
> -    tcg_temp_free(t2);
>      tcg_temp_free(t1);
>      tcg_temp_free(t0);
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

