Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A783DFDFB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:27:20 +0200 (CEST)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDBH-0008Os-9c
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mBD9x-0007hz-V4
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:25:57 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:46708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mBD9w-0004ka-3p
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:25:57 -0400
Received: by mail-lj1-x22e.google.com with SMTP id b21so1769216ljo.13
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D8AyycCp8FaE2+ZW5F2Y9igfgoEvSiYG7zAtvMA5Rag=;
 b=l2g0qf898V1IkhmkYrG/MSLwc8YxItHOIOPJYt2Zk6+8ayVVqkiU/XAgOvZJ34Q0FK
 L0/FAdFA2l4K+8yHR+mXHZXsvDXs+3rf+kYW/qWg9KVueD8zIOtUfg9QfuTMR0haHuDM
 DWHBaEWFTFDj3UT4fiobF2ppD5PKszd3RIJazJDpeUFFyJzLSAPTrWNakVoFE54REGNG
 h0FC2L11v65I5cOAFCJjrNct876zv03E3WK9tjoUkIl5tL7bI9ujItveEJz47A4KFUC5
 omYnCgx54ycKIIs4mw3BmeilowvDV4x4C1HvD0eJNX9jGnJVUgB5b3ovW5vXKLLrLvyv
 B8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D8AyycCp8FaE2+ZW5F2Y9igfgoEvSiYG7zAtvMA5Rag=;
 b=LfptLJtErsNkrUcskvNuRS120Dzg4ouRVsBoeEU9ujKmThXbtVJfBsf+gOEZtI3mf8
 0DrWhS56tjhZYsV5eocFV6tXm5T3hPmt0qw0Hci+Wuc1ChoslFCVjk9MJ3WIDwNTfPtJ
 MTslPldVoOw5FCaMCHIn9CtX3UcPG/OCU7BnWn86jn83a1cU9e/3xnA8fwqJ1GKWsOUE
 5sNRpky8KGkTx4efN4M4iESx/UBcTkQyLnkSaiTt3WlFSgdfg/PZc/82LfVw50EklhSz
 I4zZm2HnVYdPzk15QOCZTW9BuxHAxBd3k3x0w9fXc0cEcnA2ZHuTHJSw4gmMUaWdYmg/
 SmTA==
X-Gm-Message-State: AOAM5310g8e3Fai9fbJZzpxezTx2mYEqS/z/MK5FeYQ6NCS7EZu7xPtb
 4/oAp9aMlTJZ4sMPNSXEhH4=
X-Google-Smtp-Source: ABdhPJzBjw6vSgChT0cQEd7uGN7S+VRt9nHJJmfSt9PVd1TyjpQ8DLXOVXV989g8637PUG+x1vUHFA==
X-Received: by 2002:a2e:bf29:: with SMTP id c41mr17464694ljr.63.1628069153267; 
 Wed, 04 Aug 2021 02:25:53 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id q23sm143022lfp.169.2021.08.04.02.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 02:25:52 -0700 (PDT)
Date: Wed, 4 Aug 2021 11:25:52 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 06/55] target/microblaze: Do not set MO_ALIGN for
 user-only
Message-ID: <20210804092552.GE3586016@toto>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-7-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803041443.55452-7-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=2.896, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 02, 2021 at 06:13:54PM -1000, Richard Henderson wrote:
> The kernel will fix up unaligned accesses, so emulate that
> by allowing unaligned accesses to succeed.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/microblaze/translate.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
> index a14ffed784..ef44bca2fd 100644
> --- a/target/microblaze/translate.c
> +++ b/target/microblaze/translate.c
> @@ -727,6 +727,7 @@ static TCGv compute_ldst_addr_ea(DisasContext *dc, int ra, int rb)
>  }
>  #endif
>  
> +#ifndef CONFIG_USER_ONLY
>  static void record_unaligned_ess(DisasContext *dc, int rd,
>                                   MemOp size, bool store)
>  {
> @@ -739,6 +740,7 @@ static void record_unaligned_ess(DisasContext *dc, int rd,
>  
>      tcg_set_insn_start_param(dc->insn_start, 1, iflags);
>  }
> +#endif
>  
>  static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
>                      int mem_index, bool rev)
> @@ -760,12 +762,19 @@ static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
>          }
>      }
>  
> +    /*
> +     * For system mode, enforce alignment if the cpu configuration
> +     * requires it.  For user-mode, the Linux kernel will have fixed up
> +     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
> +     */
> +#ifndef CONFIG_USER_ONLY
>      if (size > MO_8 &&
>          (dc->tb_flags & MSR_EE) &&
>          dc->cfg->unaligned_exceptions) {
>          record_unaligned_ess(dc, rd, size, false);
>          mop |= MO_ALIGN;
>      }
> +#endif
>  
>      tcg_gen_qemu_ld_i32(reg_for_write(dc, rd), addr, mem_index, mop);
>  
> @@ -906,12 +915,19 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
>          }
>      }
>  
> +    /*
> +     * For system mode, enforce alignment if the cpu configuration
> +     * requires it.  For user-mode, the Linux kernel will have fixed up
> +     * any unaligned access, so emulate that by *not* setting MO_ALIGN.
> +     */
> +#ifndef CONFIG_USER_ONLY
>      if (size > MO_8 &&
>          (dc->tb_flags & MSR_EE) &&
>          dc->cfg->unaligned_exceptions) {
>          record_unaligned_ess(dc, rd, size, true);
>          mop |= MO_ALIGN;
>      }
> +#endif
>  
>      tcg_gen_qemu_st_i32(reg_for_read(dc, rd), addr, mem_index, mop);
>  
> -- 
> 2.25.1
> 

