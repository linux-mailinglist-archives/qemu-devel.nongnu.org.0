Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3DD59B6CA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:41:21 +0200 (CEST)
Received: from localhost ([::1]:44854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPuZE-0007DA-RJ
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuWS-0004xG-If
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:38:28 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuWQ-0002cZ-Fw
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:38:28 -0400
Received: by mail-pf1-x42c.google.com with SMTP id z187so8793105pfb.12
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=vkMMkf7zLjQIWY9t9xU5O4QUBtuYO6AJjuLFFWA+tIY=;
 b=qz+F2lK1L3/T/WIRymofRaVccjy5CS4UNFz731btadTGZFAUExNYu5WVX8CvrPnOxi
 Z0SAkn2JNo+NMHO9egod7UnMBeWpKWt8bS2rM+O/nil8y0AQSw3y3FeAdNJxSmLQ0XKP
 0fvbeOzvmXAtyy/d/XI6FtM+DQItqyyXnJc4bN7BLZq5S/FngzQMXz3GvklwvK9wtaKI
 eCix6DXbqF/7ZCK3qsLat74/fO0+WuQnZp2BYjc5dDVXImeu+YTNAXI5feZ/HP+NRNyb
 HPO1fxOs9TMVqqkmfcFbnpQ4uRBAq+Y0HUhhO2TlzI5Ji7zZZQqs9wF7GPqxjUV81M/A
 Vd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=vkMMkf7zLjQIWY9t9xU5O4QUBtuYO6AJjuLFFWA+tIY=;
 b=m7acCIaPbeWgnziDE/3UzFA4YV+EtHGehJplZy+HGztGtUyhLZ9Y5WdCV628tPOTTk
 ebeFhH/xPWsyu8ZFnmzOodt/temN0WyQwsFoMlWBuMCr9sFP5rVROWkbd7KgVyhi0smI
 X8A3QNeFxv2Q9bivIA6aWlSECfnMlUxDVWWIDsOveIsrNZaAWrx8IOMGkTCIR/Pbommy
 suKiDlI9MEHaoJ2IBdbNbfQuExJ9fF5JCNeTLQGd7J/7sy1SUR88Bv/A6q0kWOfSrTNi
 ZiCtbr3lkEtZZ35quGe7NxLZJp/DT7D4/KdvRemFH1OEMDGpeBkpkkeKG8KHZAhH9wZq
 jUkA==
X-Gm-Message-State: ACgBeo2cyZlbnktU7rOcMaH7V1LKb4ctDwl06qmOwsbEuwDGXOxEtvPx
 PC5KDMkHMMvPr++UTiRGG/yaXkIlPg3VG8YQMH0=
X-Google-Smtp-Source: AA6agR6NMeI9dZqWX4Ben8dqJupOH3A7E8om0FYcq9DqemvTdlWnOeteIj8BAWyAiK2O4Gv6Wh2DRDS7jkKLDA/lJ0g=
X-Received: by 2002:aa7:824d:0:b0:536:a186:94dd with SMTP id
 e13-20020aa7824d000000b00536a18694ddmr2589376pfn.79.1661125105043; Sun, 21
 Aug 2022 16:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220819032615.884847-1-richard.henderson@linaro.org>
 <20220819032615.884847-14-richard.henderson@linaro.org>
In-Reply-To: <20220819032615.884847-14-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 09:37:58 +1000
Message-ID: <CAKmqyKNw7fev6NnYOee=GE7Ga9aqXB7TS1CYhA3kU+notMYTyw@mail.gmail.com>
Subject: Re: [PATCH v6 13/21] accel/tcg: Add nofault parameter to
 get_page_addr_code_hostp
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, iii@linux.ibm.com, 
 dramforever@live.com, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 19, 2022 at 1:36 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/exec-all.h | 10 +++++-----
>  accel/tcg/cputlb.c      |  8 ++++----
>  accel/tcg/plugin-gen.c  |  4 ++--
>  accel/tcg/user-exec.c   |  4 ++--
>  4 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 9f35e3b7a9..7a6dc44d86 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -599,6 +599,8 @@ struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
>   * get_page_addr_code_hostp()
>   * @env: CPUArchState
>   * @addr: guest virtual address of guest code
> + * @nofault: do not raise an exception
> + * @hostp: output for host pointer
>   *
>   * See get_page_addr_code() (full-system version) for documentation on the
>   * return value.
> @@ -607,10 +609,10 @@ struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
>   * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
>   * to the host address where @addr's content is kept.
>   *
> - * Note: this function can trigger an exception.
> + * Note: Unless @nofault, this function can trigger an exception.
>   */
>  tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
> -                                        void **hostp);
> +                                        bool nofault, void **hostp);
>
>  /**
>   * get_page_addr_code()
> @@ -620,13 +622,11 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
>   * If we cannot translate and execute from the entire RAM page, or if
>   * the region is not backed by RAM, returns -1. Otherwise, returns the
>   * ram_addr_t corresponding to the guest code at @addr.
> - *
> - * Note: this function can trigger an exception.
>   */
>  static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
>                                                  target_ulong addr)
>  {
> -    return get_page_addr_code_hostp(env, addr, NULL);
> +    return get_page_addr_code_hostp(env, addr, true, NULL);
>  }
>
>  #if defined(CONFIG_USER_ONLY)
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 2dc2affa12..ae7b40dd51 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1644,16 +1644,16 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
>   * of RAM.  This will force us to execute by loading and translating
>   * one insn at a time, without caching.
>   *
> - * NOTE: This function will trigger an exception if the page is
> - * not executable.
> + * NOTE: Unless @nofault, this function will trigger an exception
> + * if the page is not executable.
>   */
>  tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
> -                                        void **hostp)
> +                                        bool nofault, void **hostp)
>  {
>      void *p;
>
>      (void)probe_access_internal(env, addr, 1, MMU_INST_FETCH,
> -                                cpu_mmu_index(env, true), true, &p, 0);
> +                                cpu_mmu_index(env, true), nofault, &p, 0);
>      if (p == NULL) {
>          return -1;
>      }
> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> index 3d0b101e34..8377c15383 100644
> --- a/accel/tcg/plugin-gen.c
> +++ b/accel/tcg/plugin-gen.c
> @@ -872,7 +872,7 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_onl
>
>          ptb->vaddr = tb->pc;
>          ptb->vaddr2 = -1;
> -        get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
> +        get_page_addr_code_hostp(cpu->env_ptr, tb->pc, true, &ptb->haddr1);
>          ptb->haddr2 = NULL;
>          ptb->mem_only = mem_only;
>
> @@ -902,7 +902,7 @@ void plugin_gen_insn_start(CPUState *cpu, const DisasContextBase *db)
>          unlikely((db->pc_next & TARGET_PAGE_MASK) !=
>                   (db->pc_first & TARGET_PAGE_MASK))) {
>          get_page_addr_code_hostp(cpu->env_ptr, db->pc_next,
> -                                 &ptb->haddr2);
> +                                 true, &ptb->haddr2);
>          ptb->vaddr2 = db->pc_next;
>      }
>      if (likely(ptb->vaddr2 == -1)) {
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 58edd33896..e7fec960c2 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -197,11 +197,11 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
>  }
>
>  tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
> -                                        void **hostp)
> +                                        bool nofault, void **hostp)
>  {
>      int flags;
>
> -    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, true, 0);
> +    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, nofault, 0);
>      if (unlikely(flags)) {
>          return -1;
>      }
> --
> 2.34.1
>
>

