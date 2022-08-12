Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194E65911DD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 16:07:19 +0200 (CEST)
Received: from localhost ([::1]:45210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMVJj-0001Lb-Gf
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 10:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oMVG5-0007b4-RN
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:03:31 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oMVG4-0002TX-1W
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 10:03:29 -0400
Received: by mail-ej1-x631.google.com with SMTP id gk3so2196882ejb.8
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 07:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=ET6LCnfm56bY9bauPGbviCH/syCoFNpSb7IaucL4v7g=;
 b=XSpdkHRwRYApWYGd+dlz661EMnYRAc87miBwAYegAGguM+sxTUIBeujh2WO4kVN1Gf
 6cc7piufJtuAiU8bxgQWzT2zFTr+oYfr+L2Sb63ww3m6aaLatxOFubjXzMy8U38b1vL2
 KQMFcx3lfdKBUZQFKlif+/21ZJ8VEACRjofYwkIb/G9OvCr1Ab9EDgD54ZRTL2by1HxP
 KMXSB1d5sVX+tJHmzN7w2VhJW6NZ7FDNC45NFHdE2JnU/h96r9YtYSpzhFuzj0VogtlJ
 QfzjLcjBCh1aW+MsfG8lKqt3/DD1tMo362xe6pKnMlp46RWKug37fKYKkElkO+Zkj6DY
 /GBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=ET6LCnfm56bY9bauPGbviCH/syCoFNpSb7IaucL4v7g=;
 b=3xiVKLIEh27gSLSMtwxzac3QJGWHEVuhUYmJ+YZIwrqGdza2OI+6t7gyJld01VUOvL
 VwqbLLn20irEtz7s6NampOBy6XtvoLu+Na1PUqnnF0UU9UYlwpoR9ai96059Qk01Qdxh
 vH/DG/v+qvPNIifuJBbpLKV/g1nJ5UUhbmRUT1tj06IAt+YoA/KapRjsPCZGix1ZCV+y
 /fRbY2Uyd9+7osAGKo97i393HwFTpLxd2toqBPAkVFc9qj7A6svJ1Ez3AUAFe4wpSH3e
 oOrLg4JK+jagh4UxRtAJncWdazDM8TjCThBfhOwUbFmVb7H/4u13CJuSzzwHBaKDaA3N
 ORxQ==
X-Gm-Message-State: ACgBeo2E5ViNl9YAQq2FwgrWr4WESrSuIqR1FgudgKPmKuhEP7LcR7Bm
 gJjg2p0ynotdNXg/x2pFFGUTssOthgIUrQ==
X-Google-Smtp-Source: AA6agR7r4CtFpff7YhHwCN8SzRy1wFLde4KwP2Eqi+iNAVVZG/cNkcE2Pitp/ueQKtEt3uMvydqIew==
X-Received: by 2002:a17:907:1689:b0:731:e57:bf23 with SMTP id
 hc9-20020a170907168900b007310e57bf23mr2829082ejc.388.1660313006431; 
 Fri, 12 Aug 2022 07:03:26 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 eq20-20020a056402299400b0043bbcd94ee4sm1368005edb.51.2022.08.12.07.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 07:03:25 -0700 (PDT)
Date: Fri, 12 Aug 2022 16:03:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 2/2] target/riscv: fence: reconcile with specification
Message-ID: <20220812140324.w2geesnjhbhcdack@kamzik>
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
 <20220812131304.1674484-2-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812131304.1674484-2-philipp.tomsich@vrull.eu>
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x631.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 12, 2022 at 03:13:04PM +0200, Philipp Tomsich wrote:
> Our decoding of fence-instructions is problematic in respect to the
> RISC-V ISA specification:
> - rs and rd are ignored, but need to be 0
> - fm is ignored
> 
> This change adjusts the decode pattern to enfore rs and rd being 0,
> and validates the fm-field (together with pred/succ for FENCE.TSO) to
> determine whether a reserved instruction is specified.
> 
> While the specification allows UNSPECIFIED behaviour for reserved
> instructions, we now always raise an illegal instruction exception.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> 
> ---
> 
>  target/riscv/insn32.decode              |  2 +-
>  target/riscv/insn_trans/trans_rvi.c.inc | 19 ++++++++++++++++++-
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 089128c3dc..4e53df1b62 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -150,7 +150,7 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
>  sra      0100000 .....    ..... 101 ..... 0110011 @r
>  or       0000000 .....    ..... 110 ..... 0110011 @r
>  and      0000000 .....    ..... 111 ..... 0110011 @r
> -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> +fence    fm:4 pred:4 succ:4 00000 000 00000 0001111
>  fence_i  000000000000     00000 001 00000 0001111
>  csrrw    ............     ..... 001 ..... 1110011 @csr
>  csrrs    ............     ..... 010 ..... 1110011 @csr
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index ca8e3d1ea1..515bb3b22a 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -795,7 +795,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
>  
>  static bool trans_fence(DisasContext *ctx, arg_fence *a)
>  {
> -    /* FENCE is a full memory barrier. */
> +    switch (a->fm) {
> +    case 0b0000:
> +         /* normal fence */
> +         break;
> +
> +    case 0b0001:
> +         /* FENCE.TSO requires PRED and SUCC to be RW */
> +         if (a->pred != 0xb0011 || a->succ != 0b0011) {
> +            return false;
> +         }
> +         break;
> +
> +    default:
> +        /* reserved for future use */
> +        return false;
> +    }
> +
> +    /* We implement FENCE(.TSO) is a full memory barrier. */

s/is/as/

Thanks,
drew

>      tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
>      return true;
>  }
> -- 
> 2.34.1
> 
> 

