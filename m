Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E045A6F83B9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:18:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvK1-0008Dg-7G; Fri, 05 May 2023 09:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvJu-0008CS-6h
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:17:59 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvJs-000625-Eq
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:17:57 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso3159704a12.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292675; x=1685884675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5tVPVNzDALYzakMPqGGCIzYb1I80NK4X5006/rlAVmI=;
 b=frvP9ZHmoHETgJ7sufxxO5AlcqpyGRT4YfxFqQCD/p2vY3YbnaMipfdizOrjj7kVP6
 +Kd70NJ0xUMTIpiBmsu9mGsg41g/syixPnakhTe48J35hC00j8KLJaOBt/oOwEaITkX7
 4x1vQ1xqzTtwTpt+HN9QxV5yi7GtajLJKkG/+udrR7CmM91DVujoMVPmeNuxBTd3lZCf
 IFrFlC0+jiy7DEXVdZilZFP1WPPs6EJ22ea2BE5YxUUgdKeq4DCv2wbgadxLqvxfZHpO
 rZ/ny1AiYYbHPQ8G5uSl2iO85l08uKUQ9IdbacaReGpIEgkS8EIozQEhOdYK67iICv43
 ggDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292675; x=1685884675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5tVPVNzDALYzakMPqGGCIzYb1I80NK4X5006/rlAVmI=;
 b=CWfOpPVGgKTewIC0i+Nqc4AAngKYm8Otj4Z2OhgHT9ECYiTZZVyjijss6zQAmlv4iX
 bv2BG1+Kj7FTiowD4kd99VqFWLOrxfFibW4x/VDKpr2Puvw7qx36kS/NBv30OWHsUtTA
 A3IWBBYbXsZYmYkzzaSMMyUWfTfuJy2WbMN+tggzTbv45zWbLjZ2GK9XOT2Y4xwTDzwt
 +Y22oZB39yimP3zzXUgBtkztzx0IUlnIIk7ofTUPfavTgtAKhIF4H/LqQE7v3WPw93YT
 OsS4V781xq3B0ZaQi1lE1IELTSfJjl48VX1kJfCNP6fTMAZCBA7/o5XWls3Fo/o7CrNb
 gYdw==
X-Gm-Message-State: AC+VfDwcamPZfnandGTigxTQUvNvSaTI56FxlpAaqge5yxSA1ElancXV
 fcxZc0/NnZpqi9TdnE+qG+BB39/2yXLHAZpZlDexag==
X-Google-Smtp-Source: ACHHUZ7jjAI+a0ktR8aZM4g5wU2nnGAx4wld0DByEChZv4ZYLFvdP/sEl80EEHfxzEKcIjASq0GJuzTf6blFdtBwrPI=
X-Received: by 2002:a50:fb96:0:b0:504:b511:1a39 with SMTP id
 e22-20020a50fb96000000b00504b5111a39mr1416085edq.12.1683292674989; Fri, 05
 May 2023 06:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-48-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:17:44 +0100
Message-ID: <CAFEAcA9X_JreK4mQ=f3opPhL1+PkmJHJZSEZTrzTpyomfb2wxA@mail.gmail.com>
Subject: Re: [PATCH v4 47/57] tcg/mips: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.c.inc | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index cd0254a0d7..43a8ffac17 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1139,6 +1139,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>  typedef struct {
>      TCGReg base;
>      MemOp align;
> +    MemOp atom;
>  } HostAddress;
>
>  bool tcg_target_has_memory_bswap(MemOp memop)
> @@ -1158,11 +1159,16 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>  {
>      TCGLabelQemuLdst *ldst = NULL;
>      MemOp opc = get_memop(oi);
> -    unsigned a_bits = get_alignment_bits(opc);
> +    MemOp a_bits, atom_u;
>      unsigned s_bits = opc & MO_SIZE;
> -    unsigned a_mask = (1 << a_bits) - 1;
> +    unsigned a_mask;
>      TCGReg base;
>
> +    a_bits = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
> +                                    MO_ATOM_IFALIGN, false);
> +    h->align = a_bits;
> +    a_mask = (1 << a_bits) - 1;
> +
>  #ifdef CONFIG_SOFTMMU
>      unsigned s_mask = (1 << s_bits) - 1;
>      int mem_index = get_mmuidx(oi);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(For a set of functions so new they're not even in master yet
these do seem to have a surprisingly large variance in how
they're setting up these HostAddress structs...)

thanks
-- PMM

