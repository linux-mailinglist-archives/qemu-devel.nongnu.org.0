Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674B879196
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 18:57:21 +0200 (CEST)
Received: from localhost ([::1]:55200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs8xc-0006Vy-Az
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 12:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36128)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hs8wm-0005ve-4v
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:56:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hs8wk-0006QX-6r
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:56:28 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:40286)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hs8wi-0006P8-Sc
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:56:25 -0400
Received: by mail-io1-xd2f.google.com with SMTP id h6so35025228iom.7
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 09:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yFkCbBnxncmMkqatptlnFARvoc8e9243qWK43wD8hm8=;
 b=kQFNCJFFFXNqNZpCXI6KysjCP+hShuchdRr2Yvawa9iPfk0AAqqacsRniKU4B1oe71
 wbOjSQkdWyFnbcjOAoIZiftEEaO7PnLYaryJVLgIpr9/QDkBaq5E4Uhujlea+6sm6Qzx
 WaRgUu8vss7+5OeqWiKMaMqNegkEBJOZ3G0+ARicoEo+j9KZuNJHsS80lhmaj0k2SkTT
 LFsf3JoCIedQOSFxq0B+Yoq82owY54trV1F3w7tNSiWyN0M3I9ZW6pFwfvbtSVYjAI34
 p3G/YoxkzGM07zvi75G7KL5b4x4t+42XTpDUExfduRi/CkYdxYk/VplymhlZHEvZGCFE
 vg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yFkCbBnxncmMkqatptlnFARvoc8e9243qWK43wD8hm8=;
 b=ewaAajJxy1R42lsck9Uld6uHrhPwvbNcnpfo/NkI6JrFI8/2LOE2vVFQXj0LkUZCBg
 891I/98chroYoOC7D4MDoSnyYipIRNO1a9re1M2FxA71frZPTEbAk6Bvj0c5S4eSaiik
 SnS+Y9WWukJDFdPGpx+ACYWVF8lewHSvwZFv6ZPm9DsEtqDczuCrh0wyvi5Dlw151r5b
 6/J/eJLDtwnIUTVDMinDOR1OJ5sHNmFrqr1b7nuzhRBIkIuZLYpuh2m4xHRA9WZ4zaXv
 XKNqGV6TRseW4faGJQucggHwRP5WLTh/TZw4l0Y5ST8pPmSoqHe/1o51h0Xzxy8DHsMt
 6oDA==
X-Gm-Message-State: APjAAAXw4SZ6WTKM3i37OMcm0Rr3EtEhzz2qFS+TmNNPUcpDep5ZiyLD
 zGceVPHC2KOA/UtjheBAF7jG8iDvA1ZB/D6MCJlMfA==
X-Google-Smtp-Source: APXvYqyuv/wf4iyZ+Z8B0vQKbG/OCgbE78Gso+8kkePebiSZnkNSXtgyRrBLeUqAURA/wKcsr0mCHO1N94TCkn9ZB3M=
X-Received: by 2002:a02:b395:: with SMTP id p21mr116521330jan.31.1564419383546; 
 Mon, 29 Jul 2019 09:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <edea77ff4aa6900d01ab7146d5b52c2dae4a856e.1564080680.git.alistair.francis@wdc.com>
In-Reply-To: <edea77ff4aa6900d01ab7146d5b52c2dae4a856e.1564080680.git.alistair.francis@wdc.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Tue, 30 Jul 2019 00:56:12 +0800
Message-ID: <CAEiOBXU-4KLv64pZJ__gszG8RyC6cE_GxwTt+przwbDkmS9vgQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d2f
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [Qemu-riscv] [PATCH-4.2 v1 4/6] target/riscv:
 Create function to test if FP is enabled
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
Cc: Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 26, 2019 at 2:55 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Let's creaate a function that tests if floating point support is
> enabled. We can then protect all floating point operations based on if
> they are enabled.
>
> This patch so far doesn't change anything, it's just preparing for the
> Hypervisor support for floating point operations.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  6 +++++-
>  target/riscv/cpu_helper.c | 10 ++++++++++
>  target/riscv/csr.c        | 19 ++++++++++---------
>  3 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0adb307f32..2dc9b17678 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -255,6 +255,7 @@ void riscv_cpu_do_interrupt(CPUState *cpu);
>  int riscv_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
> +bool riscv_cpu_fp_enabled(CPURISCVState *env);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> @@ -298,7 +299,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState
> *env, target_ulong *pc,
>  #ifdef CONFIG_USER_ONLY
>      *flags = TB_FLAGS_MSTATUS_FS;
>  #else
> -    *flags = cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
> +    *flags = cpu_mmu_index(env, 0);
> +    if (riscv_cpu_fp_enabled(env)) {
> +        *flags |= env->mstatus & MSTATUS_FS;
> +    }
>  #endif
>  }
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f027be7f16..225e407cff 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -71,6 +71,16 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>
>  #if !defined(CONFIG_USER_ONLY)
>
> +/* Return true is floating point support is currently enabled */
> +bool riscv_cpu_fp_enabled(CPURISCVState *env)
> +{
> +    if (env->mstatus & MSTATUS_FS) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
>  {
>      CPURISCVState *env = &cpu->env;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index af3b762c8b..7b73b73cf7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -46,7 +46,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations
> *ops)
>  static int fs(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>  #endif
> @@ -108,7 +108,7 @@ static int pmp(CPURISCVState *env, int csrno)
>  static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>  #endif
> @@ -119,7 +119,7 @@ static int read_fflags(CPURISCVState *env, int csrno,
> target_ulong *val)
>  static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>      env->mstatus |= MSTATUS_FS;
> @@ -131,7 +131,7 @@ static int write_fflags(CPURISCVState *env, int csrno,
> target_ulong val)
>  static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>  #endif
> @@ -142,7 +142,7 @@ static int read_frm(CPURISCVState *env, int csrno,
> target_ulong *val)
>  static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>      env->mstatus |= MSTATUS_FS;
> @@ -154,7 +154,7 @@ static int write_frm(CPURISCVState *env, int csrno,
> target_ulong val)
>  static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>  #endif
> @@ -166,7 +166,7 @@ static int read_fcsr(CPURISCVState *env, int csrno,
> target_ulong *val)
>  static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>      env->mstatus |= MSTATUS_FS;
> @@ -307,6 +307,7 @@ static int write_mstatus(CPURISCVState *env, int
> csrno, target_ulong val)
>  {
>      target_ulong mstatus = env->mstatus;
>      target_ulong mask = 0;
> +    int dirty;
>
>      /* flush tlb on mstatus fields that affect VM */
>      if (env->priv_ver <= PRIV_VERSION_1_09_1) {
> @@ -340,8 +341,8 @@ static int write_mstatus(CPURISCVState *env, int
> csrno, target_ulong val)
>
>      mstatus = (mstatus & ~mask) | (val & mask);
>
> -    int dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
> -                ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> +    dirty = riscv_cpu_fp_enabled(env) |
> +            ((mstatus & MSTATUS_XS) == MSTATUS_XS);
>

  FS are 2bits
  original:
        only 3 is true
  new
       1, 2, 3 all make dirty true

  Since only 3 means dirty, keeps this part unchanged should be reasonable.

chihmin

     mstatus = set_field(mstatus, MSTATUS_SD, dirty);
>      env->mstatus = mstatus;
>
> --
> 2.22.0
>
>
>
