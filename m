Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762524D14A7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:22:47 +0100 (CET)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWzN-0006J7-4U
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:22:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWwa-0004VB-EL
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:19:53 -0500
Received: from [2607:f8b0:4864:20::b34] (port=43763
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWwY-0001XF-IC
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:19:51 -0500
Received: by mail-yb1-xb34.google.com with SMTP id g26so36708932ybj.10
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=66Wc3eUR+qiPSLzaLarj4icG12vt2/6aG2HjcmayIZ8=;
 b=ZPU2p00ABEeaQiOC51IsMDa9diW5Iu4uKNmFoiERD6ghsmvKIAaIrU8VRmtDypLRsD
 IJBAIpJgTP6DSkxdbxoPoYHCH7jlzm85b1WEZ/CYKVnIn6N/tVBsdOjusdY6iITlimnJ
 D3HA6KSlpy+fFqACwXqNfgOATZ9prguowLQZtEWRLCsWNbaR9FhWzJbpjv0hKKCn4icQ
 /JH8q6W98ciaLoxp0hbg5myjsCkVG/pSDMOSWdE7CptHXMDP2qAswq3s5Si1qDrdSAfn
 5g/Zder1EFfKpPpfC9XTbMTnXh9aS7sJFrtkPjf44A8sRVkgR0yjB4dAevvcJoQkQSFw
 PyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=66Wc3eUR+qiPSLzaLarj4icG12vt2/6aG2HjcmayIZ8=;
 b=XFzVl6kCwiBMVksBTdOgTgIogkiydVXg3Hs/EiyKNgPaPrxqemA8PwDa/2M8FhT0UV
 Qu1+5wsOjSwvIl7R2OqqDycpAeK0/dt2TqodgfBGHyIfq/cprz4WOoG6A9EUJ7MsUWkT
 g6gsDVmJZV2p+yxrbLQjRUW2YgTGbdr4oa2w7SSvTTIxIEzJmqH5ckFOP+OA+s0zgXpp
 vtVW1biCu0+TZp39IHF6JHrfma6ViawNOm1UO/ZUdEYbb5F7JZnGK3kVeuVlPiYJSqtn
 YxyFY7+TO9bAWgy8khnvqQOGH9ms7e3En+2B+ONDAbAP/VlPq3LuJuQqvqgXnwQ0FBVV
 kiEQ==
X-Gm-Message-State: AOAM531ZrEsWKgTV8q8rsNPSK6I7N1Jm/WGUnSmnpVSgVGGLk7fpFMLA
 W6EvTrGt1HiKAhkw3AJ37OASv3YEzAN4xuX0kVBrTw==
X-Google-Smtp-Source: ABdhPJzVmsMkfHERhIoxl8hg1ldS6olRXGqF9bxyB/dpdH91MMY5Z4dEKK519Frxcgul+azenVc+vJMP5zfqUbD+Av4=
X-Received: by 2002:a25:32c6:0:b0:629:130:a037 with SMTP id
 y189-20020a2532c6000000b006290130a037mr11288816yby.193.1646734789369; Tue, 08
 Mar 2022 02:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-15-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:19:38 +0000
Message-ID: <CAFEAcA_WezNjvZsWO7Q5kYhi=DvZwKKtHzyu2iKOSuibdeT6CA@mail.gmail.com>
Subject: Re: [PATCH v4 14/33] target/nios2: Use hw/registerfields.h for
 CR_TLBACC fields
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

Empty body.

You might also mention:

"Since we're rewriting the references to CR_TLBACC_IGN_* anyway,
we correct the name of this field to IG, which is its name in the
official CPU documentation."

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h | 23 +++++++++++++++--------
>  target/nios2/mmu.c | 16 ++++++++--------
>  2 files changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 84138000fa..024ef3ccc0 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -115,14 +115,21 @@ FIELD(CR_PTEADDR, VPN, 2, 20)
>  FIELD(CR_PTEADDR, PTBASE, 22, 10)
>
>  #define CR_TLBACC        9
> -#define   CR_TLBACC_IGN_SHIFT 25
> -#define   CR_TLBACC_IGN_MASK  (0x7F << CR_TLBACC_IGN_SHIFT)
> -#define   CR_TLBACC_C         (1 << 24)
> -#define   CR_TLBACC_R         (1 << 23)
> -#define   CR_TLBACC_W         (1 << 22)
> -#define   CR_TLBACC_X         (1 << 21)
> -#define   CR_TLBACC_G         (1 << 20)
> -#define   CR_TLBACC_PFN_MASK  0x000FFFFF
> +
> +FIELD(CR_TLBACC, PFN, 0, 20)
> +FIELD(CR_TLBACC, G, 20, 1)
> +FIELD(CR_TLBACC, X, 21, 1)
> +FIELD(CR_TLBACC, W, 22, 1)
> +FIELD(CR_TLBACC, R, 23, 1)
> +FIELD(CR_TLBACC, C, 24, 1)
> +FIELD(CR_TLBACC, IG, 25, 7)
> +
> +#define CR_TLBACC_C  (1u << R_CR_TLBACC_C_SHIFT)
> +#define CR_TLBACC_R  (1u << R_CR_TLBACC_R_SHIFT)
> +#define CR_TLBACC_W  (1u << R_CR_TLBACC_W_SHIFT)
> +#define CR_TLBACC_X  (1u << R_CR_TLBACC_X_SHIFT)
> +#define CR_TLBACC_G  (1u << R_CR_TLBACC_G_SHIFT)

again,
#define CR_TLBACC_C R_CR_TLBACC_C_MASK
etc

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

