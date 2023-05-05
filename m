Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838DA6F83D3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:21:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvMp-0003dN-Iz; Fri, 05 May 2023 09:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvMh-0003Zk-Rw
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:20:53 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvMf-00076h-BV
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:20:51 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc22805d3so2724145a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292848; x=1685884848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wOfsIYmGehy/PrmqaBmIeEzKTK4/WjPNoIZKiJF5Ryo=;
 b=TLrLp/BC2oyO/HPI0ycmB0htMiW2MXTqxSzvSVlYHeI6toMTWO+xke02S/R7TunZ10
 PCuQ3R89MvogknYuM/NsGF4hMNlia2k8GQodnCvisgTzAsPAX6oUmPXVA6e8YOL4UKTr
 a7M5DEtNecbyG2jiY4WUwhExw3K5OYhjlxr/QHGNaXmhFOiO0xYZDrG22VYREy6V96p2
 gnFt0Hcq2U/NEZiayjoVSl1QBdfdWhyYSLM9EStd9ycVk/91WFYxyZhV0Ot/hU///k9r
 qNQf9fY2ckhES3wCJmomHpATCk8MsQo+lfD1TTqP8/KvM3N/U679i4qyqsuG+lSY8lSG
 BG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292848; x=1685884848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wOfsIYmGehy/PrmqaBmIeEzKTK4/WjPNoIZKiJF5Ryo=;
 b=O9HWzYG40vhfZQtE5TyxWlUifn5Jo527Q0voo7fKYBryqTibMVE4go/ykGR140bnXH
 qOtydvH514fxryBctPncCkIp+M/OQP46XRFbxGOyLcYJKTwopVAiXzu3z6m1z+nK6vy5
 ZEiKSnCC9IlAJkwT88FUOg7de17DzpDduWLN6C13hgHrfylvircNofBv43hY7Rft065k
 As4U9rnMrud+g8mQDlYvsAAFV8TrA/dgTS1om+w1jEC5dHaQFfGERXii3+dm6XSFqLr1
 J/BcCW5VXlTjb88Yonaiw7moPUM4gy8xDG+95jUGwleJvglEbakpZMKQa4Gi7nq2uMXb
 1B+A==
X-Gm-Message-State: AC+VfDwnwzjOCvQA4gDVFGlDj6JJd6DiQ3VxZivfDz4Iu8ms/iSnGNBj
 iXZBoA9461VIlJtxL5oq6ibD5TuXZKgDiL19v5eOUOgLZ8GODwC1
X-Google-Smtp-Source: ACHHUZ6Rqqpskuzb/F3uiX74cU6bnhROvEqLAs5P5shhn/hHScfyYe/jRSC2w9woxzL1mctpR/f1WlQbTTSf/GO/2/8=
X-Received: by 2002:aa7:d71a:0:b0:506:6008:995f with SMTP id
 t26-20020aa7d71a000000b005066008995fmr1390243edq.39.1683292847994; Fri, 05
 May 2023 06:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-52-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-52-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:20:37 +0100
Message-ID: <CAFEAcA-HNQinkZvwCrqg9OQZcQvoL+LeBgfFhHqvWorjye0Xfg@mail.gmail.com>
Subject: Re: [PATCH v4 51/57] tcg/sparc64: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index bb23038529..4f9ec02b1f 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -1028,11 +1028,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>  {
>      TCGLabelQemuLdst *ldst = NULL;
>      MemOp opc = get_memop(oi);
> -    unsigned a_bits = get_alignment_bits(opc);
> -    unsigned s_bits = opc & MO_SIZE;
> +    MemOp s_bits = opc & MO_SIZE;
> +    MemOp a_bits, atom_a, atom_u;
>      unsigned a_mask;
>
>      /* We don't support unaligned accesses. */
> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
> +                                    MO_ATOM_IFALIGN, false);
>      a_bits = MAX(a_bits, s_bits);
>      a_mask = (1u << a_bits) - 1;
>
> --

No changes to HostAddress struct again?

-- PMM

