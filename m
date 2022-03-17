Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC654DCA42
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:45:10 +0100 (CET)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsJJ-0003OB-Nv
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:45:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUsG4-0000tM-Ot
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:41:49 -0400
Received: from [2607:f8b0:4864:20::1132] (port=38288
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUsG2-0005OH-Kl
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:41:48 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e592e700acso62701477b3.5
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nzP7GkLblmFQ+RSqa3DsJDXudDkmZ1KdAKsp6x0jrEc=;
 b=HbzT9LyFW27WXVMWyp97KKCk1vP8G0F4Z5iige1WMbP8zu2Jj+rmjCbhpMrxsGMspT
 sRTcAS8cn4LNlzqXl89m3qwPKmzBjY1khDHpzX9V8+b8CcDNRU30P1H9YxkpcKiI+zyx
 sJuIaGA5nqe5nSuH/TnRSo5SYMRKpASheRtcVc2GSNFvdYks0Lj27twDrsAXwavc+BSr
 2IAdohCldA2Q5egnEcInP940vDy0CwiukqHHGQ5Z9+EjQ2OHQn0snWOh9l3sSPVlz2ie
 D0NfBv6/piwfRufL5TiqBZVkANs8G8S0978X53BwV7m8qObEMotSuTrVeC2661S4yRft
 lA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nzP7GkLblmFQ+RSqa3DsJDXudDkmZ1KdAKsp6x0jrEc=;
 b=SZ+YHYgz8dv5xc8dShC1pn87BeR33Gfa4MxrRzo1K5pZjYLjjANuLKZ4xYMVlZo3SA
 T++nDo5QR0MBXI5tHp7nmQ/ezUL6OpkSSNtPiOqf7nOCv59uSFLrAZlZ5S7/NWzdyumj
 5DCZE7rus0I1WIpfnbSjq2JtqIuttG+EVgbNq7gJzBs6CcIgBfRzTONQsH4pXYSx8N41
 nv99XDahv8Wul9Cfgq/W2n0L4x+2nmr/YZC3tSoyPSwZNy7uBvIrzmJ4ep5Ny9m6qJdS
 xqzwXGfRmC55mq5Wio2M6Z3uRi5aa5UvyORccwJEzIi7p7VKAAf1O9iLWxoTbNQ/gJ/g
 4ynw==
X-Gm-Message-State: AOAM531E0ec+YQpknOF2JUmclwzU487sgvYw4nRM6YnG/bJquazv7icI
 tg11Weu9/4ik5ox5ZwKk+SLTV98huIyBhLQwU0vijQ==
X-Google-Smtp-Source: ABdhPJyrOqZi0eOnKS99lwT4s+IvitosSfn4durxCgab1NyWOnYDahfJEU/bHT29GUTFSO5HuYuCOCGULrZa9QDbwnY=
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr6155860ywk.455.1647531705446; Thu, 17
 Mar 2022 08:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-26-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 15:41:33 +0000
Message-ID: <CAFEAcA8+tJfXEKKyJg63VuEKu_CmegRSzcSnOhCkdcL47UmOHA@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 25/51] target/nios2: Clean up handling of
 tlbmisc in do_exception
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Thu, 17 Mar 2022 at 05:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The 4 lower bits, D, PERM, BAD, DBL, are unconditionally set on any
> exception with EH=0, or so says Table 42 (Processor Status After
> Taking Exception).
>
> We currently do not set PERM or BAD at all, and only set/clear
> DBL for tlb miss, and do not clear DBL for any other exception.
>
> It is a bit confusing to set D in tlb_fill and the rest during
> do_interrupt, so move the setting of D to do_interrupt as well.
> To do this, split EXP_TLBD into two cases, EXCP_TLB_X and EXCP_TLB_D,
> which allows us to distinguish them during do_interrupt.  Choose
> a value for EXCP_TLB_D such that when truncated it produces the
> correct value for exception.CAUSE.
>
> Rename EXCP_TLB[RWX] to EXCP_PERM_[RWX], to emphasize that the
> exception is permissions related.  Rename EXCP_SUPER[AD] to
> EXCP_SUPERA_[DX] to emphasize that they are both "supervisor
> address" exceptions, data and execute.
>
> Retain the setting of tlbmisc.WE for the fast-tlb-miss path, as it
> is being relied upon, but remove it from the permission path.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h    |  13 +++---
>  target/nios2/helper.c | 102 +++++++++++++++++++++++++++++-------------
>  2 files changed, 77 insertions(+), 38 deletions(-)
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index d003af5afc..c925cdd8e3 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -166,13 +166,14 @@ FIELD(CR_TLBMISC, EE, 24, 1)
>  #define EXCP_UNALIGN  6
>  #define EXCP_UNALIGND 7
>  #define EXCP_DIV      8
> -#define EXCP_SUPERA   9
> +#define EXCP_SUPERA_X 9
>  #define EXCP_SUPERI   10
> -#define EXCP_SUPERD   11
> -#define EXCP_TLBD     12
> -#define EXCP_TLBX     13
> -#define EXCP_TLBR     14
> -#define EXCP_TLBW     15
> +#define EXCP_SUPERA_D 11
> +#define EXCP_TLB_X    12
> +#define EXCP_TLB_D    (0x1000 | EXCP_TLB_X)
> +#define EXCP_PERM_X   13
> +#define EXCP_PERM_R   14
> +#define EXCP_PERM_W   15
>  #define EXCP_MPUI     16
>  #define EXCP_MPUD     17
>
> diff --git a/target/nios2/helper.c b/target/nios2/helper.c
> index afbafd1fdc..8b69918ba3 100644
> --- a/target/nios2/helper.c
> +++ b/target/nios2/helper.c
> @@ -49,7 +49,8 @@ void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
>
>  #else /* !CONFIG_USER_ONLY */
>
> -static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
> +static void do_exception(Nios2CPU *cpu, uint32_t exception_addr,
> +                         uint32_t tlbmisc_set, bool is_break)
>  {
>      CPUNios2State *env = &cpu->env;
>      CPUState *cs = CPU(cpu);
> @@ -68,6 +69,16 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
>
>          if (cpu->mmu_present) {
>              new_status |= CR_STATUS_EH;
> +
> +            /*
> +             * There are 4 bits that are always written.
> +             * Explicitly clear them, to be set via the argument.
> +             */
> +            env->ctrl[CR_TLBMISC] &= ~(CR_TLBMISC_D |
> +                                       CR_TLBMISC_PERM |
> +                                       CR_TLBMISC_BAD |
> +                                       CR_TLBMISC_DBL);
> +            env->ctrl[CR_TLBMISC] |= tlbmisc_set;
>          }
>      }
>
> @@ -83,13 +94,14 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
>
>  static void do_iic_irq(Nios2CPU *cpu)
>  {
> -    do_exception(cpu, cpu->exception_addr, false);
> +    do_exception(cpu, cpu->exception_addr, 0, false);
>  }
>
>  void nios2_cpu_do_interrupt(CPUState *cs)
>  {
>      Nios2CPU *cpu = NIOS2_CPU(cs);
>      CPUNios2State *env = &cpu->env;
> +    uint32_t tlbmisc_set = 0;
>
>      if (qemu_loglevel_mask(CPU_LOG_INT)) {
>          const char *name = NULL;
> @@ -98,20 +110,21 @@ void nios2_cpu_do_interrupt(CPUState *cs)
>          case EXCP_IRQ:
>              name = "interrupt";
>              break;
> -        case EXCP_TLBD:
> +        case EXCP_TLB_X:
> +        case EXCP_TLB_D:
>              if (env->ctrl[CR_STATUS] & CR_STATUS_EH) {
>                  name = "TLB MISS (double)";
>              } else {
>                  name = "TLB MISS (fast)";
>              }
>              break;
> -        case EXCP_TLBR:
> -        case EXCP_TLBW:
> -        case EXCP_TLBX:
> +        case EXCP_PERM_R:
> +        case EXCP_PERM_W:
> +        case EXCP_PERM_X:
>              name = "TLB PERM";
>              break;
> -        case EXCP_SUPERA:
> -        case EXCP_SUPERD:
> +        case EXCP_SUPERA_X:
> +        case EXCP_SUPERA_D:
>              name = "SUPERVISOR (address)";
>              break;
>          case EXCP_SUPERI:
> @@ -149,38 +162,60 @@ void nios2_cpu_do_interrupt(CPUState *cs)
>          do_iic_irq(cpu);
>          break;
>
> -    case EXCP_TLBD:
> -        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
> -            env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
> -            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
> -            do_exception(cpu, cpu->fast_tlb_miss_addr, false);
> +    case EXCP_TLB_D:
> +        tlbmisc_set = CR_TLBMISC_D;
> +        /* fall through */
> +    case EXCP_TLB_X:
> +        if (env->ctrl[CR_STATUS] & CR_STATUS_EH) {
> +            tlbmisc_set |= CR_TLBMISC_DBL;
> +            /*
> +             * Normally, we don't write to tlbmisc unless !EH,
> +             * so do it manually for the double-tlb miss exception.
> +             */
> +            env->ctrl[CR_TLBMISC] &= ~(CR_TLBMISC_D |
> +                                       CR_TLBMISC_PERM |
> +                                       CR_TLBMISC_BAD);
> +            env->ctrl[CR_TLBMISC] |= tlbmisc_set;
> +            do_exception(cpu, cpu->exception_addr, 0, false);
>          } else {
> -            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_DBL;
> -            do_exception(cpu, cpu->exception_addr, false);
> +            /*
> +             * ??? Implicitly setting tlbmisc.WE for the fast-tlb-miss
> +             * handler appears to be out of spec.  But, the linux kernel
> +             * handler relies on it, writing to tlbacc without first
> +             * setting tlbmisc.WE.
> +             */

On page 3-21 of
https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/hb/nios2/n2cpu_nii5v1_01.pdf
the description of the WE flag says
"Hardware sets the WE flag to one on a TLB permission violation
exception, and on a TLB miss exception when status.EH = 0."

This is the second of those two cases, isn't it ?

> +            tlbmisc_set |= CR_TLBMISC_WE;
> +            do_exception(cpu, cpu->fast_tlb_miss_addr, tlbmisc_set, false);
>          }
>          break;

> -    case EXCP_TLBR:
> -    case EXCP_TLBW:
> -    case EXCP_TLBX:
> -        if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
> -            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
> -        }
> -        do_exception(cpu, cpu->exception_addr, false);
> +    case EXCP_PERM_R:
> +    case EXCP_PERM_W:
> +        tlbmisc_set = CR_TLBMISC_D;
> +        /* fall through */
> +    case EXCP_PERM_X:
> +        tlbmisc_set |= CR_TLBMISC_PERM;
> +        do_exception(cpu, cpu->exception_addr, tlbmisc_set, false);

And this change is incorrectly dropping the "sets WE on
TLB permission violation exception" part.

Other than that,

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

