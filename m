Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953CF57845D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:53:00 +0200 (CEST)
Received: from localhost ([::1]:38414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRBD-0005P1-MW
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDNO6-00072A-8l
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:50:02 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDNO3-0002nZ-Ck
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:50:00 -0400
Received: by mail-ed1-x535.google.com with SMTP id v12so14473162edc.10
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V+ZAs1OBaKbBTFuQsPWg5xCRJ9oaM8UHlttn98+sKoc=;
 b=QsHbnLXd51HnX5Fgls7IaEw6oi8MXN7axXJL/xJ4D78zk3iLEzHc/i6xDUnQ9U/5xT
 WJ0OnKQPxrXWOdduM3+kq3N6lu+rBqHOTsssxHjURGgFeZVVDOqnmOhAGXR8iHFEBR9H
 alkXXv4+4VE+EXFxohMrAPqQWVv+hzfG1xtZ5COe0Ecz3x0A9IPRYR44NuAAub0F3Imu
 oD3g34SS2J28sCtdS1izLuHmSJGr91aVD8TWn442DHiLf/JEja6XGt6bqwejCx25qZRw
 FzjiAkbm5TXnkM3+5zg/Ers+QN+81v9kPl5gbXnvCm/2BexNk8jv8r07r9pcqJ9aaEYs
 oCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V+ZAs1OBaKbBTFuQsPWg5xCRJ9oaM8UHlttn98+sKoc=;
 b=lhi8aQ8CP4P7vn12WCsBSiLIrfjRN9IGCIYmrJzWTegNuKcYWAaepW6MDbpIGM8sRj
 E3KhBhc7g4NsuiRRBRuG1rTi8w6RlWdsPYqjfR6WCQ7RZfFp6XtQftCKMxr5EyKNRnnO
 bJHGtop6pWLlWunWy8YiBZA1/XLmo3bTf8YjB6ZwM2D+n73oLVjVFi/jSqDAE0DYX2TY
 UrQDJpUDE4uQQSHSa2JrphKpnItx8ipYZch6lfkLsO/QIZywz9mVl8OgQYC4prCC4GXZ
 vWgrrAaJ+0XeXfzqAx96ipAxAGfmCVEXXuJu6S9x1rjpKqRCCZMd+qLZ9ZlrOjqg0t2F
 GlsQ==
X-Gm-Message-State: AJIora8clMbGGI9Ffc0N/Jj2DZyksTDiVEWqg52aA3mhanYd8FPjDn5W
 Whw4bO9lgMX12Q95ZZUDdcTABw==
X-Google-Smtp-Source: AGRyM1uPs+jJ/wXOEA2o5+4YsDmEKcVuSIsETQuXrmTgeqgJc1CLJ8fidl8/rHdQzLjdGh3qlB15KA==
X-Received: by 2002:a05:6402:3553:b0:43a:dba8:9f65 with SMTP id
 f19-20020a056402355300b0043adba89f65mr35462179edd.323.1658137794982; 
 Mon, 18 Jul 2022 02:49:54 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 cw11-20020a056402228b00b0043a8f40a038sm8320635edb.93.2022.07.18.02.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 02:49:54 -0700 (PDT)
Date: Mon, 18 Jul 2022 11:49:53 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2 4/6] target/riscv: add check for csrs existed with U
 extension
Message-ID: <20220718094953.fg3ah7xdjkrp7hzr@kamzik>
References: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
 <20220712063236.23834-5-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712063236.23834-5-liweiwei@iscas.ac.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:49:04 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 12, 2022 at 02:32:34PM +0800, Weiwei Li wrote:
> - add umode/umode32 predicate for mcounteren,menvcfg/menvcfgh

Same commit message and $SUBJECT comments as the other patches.

> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 7d4b6ceced..1edeb69366 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -339,6 +339,25 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
>  
>  }
>  
> +static RISCVException umode(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_has_ext(env, RVU)) {
> +        /* User extension is supported */

This comment isn't very useful, riscv_has_ext(env, RVU) is
self-explanatory.

> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    return RISCV_EXCP_ILLEGAL_INST;
> +}
> +
> +static RISCVException umode32(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_cpu_mxl(env) != MXL_RV32) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return umode(env, csrno);
> +}
> +
>  /* Checks if PointerMasking registers could be accessed */
>  static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>  {
> @@ -3519,7 +3538,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg, write_medeleg },
>      [CSR_MIE]         = { "mie",        any,   NULL, NULL,   rmw_mie       },
>      [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,   write_mtvec   },
> -    [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,
> +    [CSR_MCOUNTEREN]  = { "mcounteren", umode, read_mcounteren,
>                            write_mcounteren                                 },
>  
>      [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,
> @@ -3553,9 +3572,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
>  
>      /* Execution environment configuration */
> -    [CSR_MENVCFG]  = { "menvcfg",  any,   read_menvcfg,  write_menvcfg,
> +    [CSR_MENVCFG]  = { "menvcfg",  umode, read_menvcfg,  write_menvcfg,
>                         .min_priv_ver = PRIV_VERSION_1_12_0              },
> -    [CSR_MENVCFGH] = { "menvcfgh", any32, read_menvcfgh, write_menvcfgh,
> +    [CSR_MENVCFGH] = { "menvcfgh", umode32, read_menvcfgh, write_menvcfgh,
>                         .min_priv_ver = PRIV_VERSION_1_12_0              },
>      [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
>                         .min_priv_ver = PRIV_VERSION_1_12_0              },
> -- 
> 2.17.1
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

