Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A916514DD51
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 15:52:05 +0100 (CET)
Received: from localhost ([::1]:33774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixBAq-00026J-PT
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 09:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42802)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ixB7K-0007OV-CA
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 09:48:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ixB7I-0006vx-2q
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 09:48:26 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42400)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ixB7H-0006rg-QY
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 09:48:24 -0500
Received: by mail-wr1-x444.google.com with SMTP id k11so4346730wrd.9
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 06:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:cc:from:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=I6b9tbcf2qRe2eaqO1hVqipLBJjsZPr8F+kVgM3mU+g=;
 b=l10OOL1U+1N5rhHX+hrqFmLPMfEh+3Lhrr8CyPxvnwrDZjEaLDjLTTG7y2hOJ/j8Mh
 CiQAOwdM7hbdWy5f2+Bcs1rEILfZla1n1gHi4NOk9WnDrF4CwWcu0vo1l0bjmPE18dNY
 /gaMOOPJLZNHtZNB9OU6CZe8oE0UsVl0aVksb46nshN2Rgg1xzxQF29jA7CuAIg2BQiI
 OeJ7y/GJNSoPda0ugBBb6eIhY0b2TL3PO/OnQHBFCi6rwKZS0CwiRcUeVXQetBRCJSGf
 AFnu3lVttYgOK1I0NCxKx2LXhcJB5Nf9U5W6/VrN0uLtUSeBoyOM53lV/Rj2H4PnZDfs
 CsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=I6b9tbcf2qRe2eaqO1hVqipLBJjsZPr8F+kVgM3mU+g=;
 b=pjiEUq+Km6v45BJRsUYZU3NLKk5afUvc1z9kUHvkCrTqQpIXV/rdGhEbTjrzTnr5xZ
 0G7v6wY6QEM3LKbEoPy3X23SJ3Jqj0jbP/Gdphh2AJaH2VS+oAaE8ew85OuWxbHl5/HR
 jUSwIbWLyFw+JyX7WfNECqngvxsau7OTgkUdAVkOgQIvtU3nfU2zu4dONDcEg1nhw2UO
 RVJMaBXPjTDEArPl2cGZlaPTOp8vqnFksqWv9ufpcgHmhSqTVjVz4LShl9DCQT3DoLhJ
 GZ80JoiaeYIDrtAOAMFc11+5hCgnyb67nBWaCQjUaYb3OYmlmySXaaTpDbf1qUFF3mV1
 0xcg==
X-Gm-Message-State: APjAAAVdshRWu9EChgICcEtFaiVxD8Zz/PK6LJft1xwyzyXwqyIaqxAh
 wpWZv0opJX9Re+Y+Lp8qvYDxTWtj/rg=
X-Google-Smtp-Source: APXvYqwK0EFLm20i50GxUh2RA3gJGw11M7xo8TFrP2SoAwio4HAT6RI385quPCEmUkcep30Us+MMYQ==
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr6309879wrp.182.1580395701515; 
 Thu, 30 Jan 2020 06:48:21 -0800 (PST)
Received: from localhost ([2a00:79e0:d:11:1da2:3fd4:a302:4fff])
 by smtp.gmail.com with ESMTPSA id w8sm6767414wmm.0.2020.01.30.06.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 06:48:20 -0800 (PST)
Date: Thu, 30 Jan 2020 06:48:20 -0800 (PST)
X-Google-Original-Date: Thu, 30 Jan 2020 14:48:18 GMT (+0000)
Subject: Re: [PATCH v1 15/36] target/riscv: Convert mstatus to pointers
CC: qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: alistair23@gmail.com
In-Reply-To: <CAKmqyKPOn_ULNu6i+s-0k-GGkZ0Gz9adNQcD1UU77u9t77ZXXQ@mail.gmail.com>
References: <CAKmqyKPOn_ULNu6i+s-0k-GGkZ0Gz9adNQcD1UU77u9t77ZXXQ@mail.gmail.com>
 <cover.1575914822.git.alistair.francis@wdc.com>
 <8c0eebc3868757e9ed312ac35e1f5325d5a18e76.1575914822.git.alistair.francis@wdc.com>
 <mhng-b22b75ac-a0c4-4d53-909c-2a8fd9506cd3@palmerdabbelt-glaptop>
Message-ID: <mhng-a16e78e8-09fe-467b-b633-c6457a4177ec@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Jan 2020 11:02:01 GMT (+0000), alistair23@gmail.com wrote:
> On Wed, Jan 8, 2020 at 11:30 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> On Mon, 09 Dec 2019 10:11:19 PST (-0800), Alistair Francis wrote:
>> > To handle the new Hypervisor CSR register aliasing let's use pointers.
>>
>> For some reason I thought we were making this explicit?  In other words,
>> requiring that all callers provide which privilege mode they're using when
>> accessing these CSRs, as opposed to swapping around pointers.  I don't actually
>> care that much, but IIRC when we were talking with the ARM guys at Plumbers
>> they were pretty adament that would end up being a much cleaner implementation
>> as they'd tried this way and later changed over.
>
> I think their implementation is different so it doesn't apply the same here.
>
> My main concern is that due to the modularity of RISC-V I don't expect
> all future developers to keep track of the Hypervisor extensions. This
> way we always have the correct state in the registers.
>
> There is only one pointer variable left, so we could drop the pointer
> swapping part, but for now it's still here.

OK, so in the interest of moving things forwards let's just

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

so we can merge this -- it's too big of a patch set to wait around on something
so small for.  I think that was the last one missing a review, right?

>
> Alistair
>
>>
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > ---
>> >  target/riscv/cpu.c        | 11 +++++++++--
>> >  target/riscv/cpu.h        |  9 ++++++++-
>> >  target/riscv/cpu_helper.c | 30 +++++++++++++++---------------
>> >  target/riscv/csr.c        | 20 ++++++++++----------
>> >  target/riscv/op_helper.c  | 14 +++++++-------
>> >  5 files changed, 49 insertions(+), 35 deletions(-)
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index a07c5689b3..e61cf46a73 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -236,7 +236,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>> >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
>> >  #ifndef CONFIG_USER_ONLY
>> >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
>> > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", env->mstatus);
>> > +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", *env->mstatus);
>> >      if (riscv_has_ext(env, RVH)) {
>> >          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
>> >          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ", env->vsstatus);
>> > @@ -336,7 +336,7 @@ static void riscv_cpu_reset(CPUState *cs)
>> >      mcc->parent_reset(cs);
>> >  #ifndef CONFIG_USER_ONLY
>> >      env->priv = PRV_M;
>> > -    env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>> > +    *env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>> >      env->mcause = 0;
>> >      env->pc = env->resetvec;
>> >  #endif
>> > @@ -465,8 +465,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>> >  static void riscv_cpu_init(Object *obj)
>> >  {
>> >      RISCVCPU *cpu = RISCV_CPU(obj);
>> > +#ifndef CONFIG_USER_ONLY
>> > +    CPURISCVState *env = &cpu->env;
>> > +#endif
>> >
>> >      cpu_set_cpustate_pointers(cpu);
>> > +
>> > +#ifndef CONFIG_USER_ONLY
>> > +    env->mstatus = &env->mstatus_novirt;
>> > +#endif
>> >  }
>> >
>> >  static const VMStateDescription vmstate_riscv_cpu = {
>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> > index 21ae5a8b19..9dc8303c62 100644
>> > --- a/target/riscv/cpu.h
>> > +++ b/target/riscv/cpu.h
>> > @@ -122,7 +122,7 @@ struct CPURISCVState {
>> >      target_ulong resetvec;
>> >
>> >      target_ulong mhartid;
>> > -    target_ulong mstatus;
>> > +    target_ulong *mstatus;
>> >
>> >      target_ulong mip;
>> >      uint32_t miclaim;
>> > @@ -145,6 +145,13 @@ struct CPURISCVState {
>> >      target_ulong mcause;
>> >      target_ulong mtval;  /* since: priv-1.10.0 */
>> >
>> > +    /* The following registers are the "real" versions that the pointer
>> > +     * versions point to. These should never be used unless you know what you
>> > +     * are doing. To access these use the pointer versions instead. This is
>> > +     * required to handle the Hypervisor register swapping.
>> > +     */
>> > +    target_ulong mstatus_novirt;
>> > +
>> >      /* Hypervisor CSRs */
>> >      target_ulong hstatus;
>> >      target_ulong hedeleg;
>> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> > index b00f66824a..9684da7f7d 100644
>> > --- a/target/riscv/cpu_helper.c
>> > +++ b/target/riscv/cpu_helper.c
>> > @@ -37,8 +37,8 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>> >  #ifndef CONFIG_USER_ONLY
>> >  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>> >  {
>> > -    target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
>> > -    target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
>> > +    target_ulong mstatus_mie = get_field(*env->mstatus, MSTATUS_MIE);
>> > +    target_ulong mstatus_sie = get_field(*env->mstatus, MSTATUS_SIE);
>> >      target_ulong pending = env->mip & env->mie;
>> >      target_ulong mie = env->priv < PRV_M || (env->priv == PRV_M && mstatus_mie);
>> >      target_ulong sie = env->priv < PRV_S || (env->priv == PRV_S && mstatus_sie);
>> > @@ -75,7 +75,7 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>> >  /* Return true is floating point support is currently enabled */
>> >  bool riscv_cpu_fp_enabled(CPURISCVState *env)
>> >  {
>> > -    if (env->mstatus & MSTATUS_FS) {
>> > +    if (*env->mstatus & MSTATUS_FS) {
>> >          return true;
>> >      }
>> >
>> > @@ -198,8 +198,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>> >      int mode = mmu_idx;
>> >
>> >      if (mode == PRV_M && access_type != MMU_INST_FETCH) {
>> > -        if (get_field(env->mstatus, MSTATUS_MPRV)) {
>> > -            mode = get_field(env->mstatus, MSTATUS_MPP);
>> > +        if (get_field(*env->mstatus, MSTATUS_MPRV)) {
>> > +            mode = get_field(*env->mstatus, MSTATUS_MPP);
>> >          }
>> >      }
>> >
>> > @@ -213,11 +213,11 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>> >
>> >      hwaddr base;
>> >      int levels, ptidxbits, ptesize, vm, sum;
>> > -    int mxr = get_field(env->mstatus, MSTATUS_MXR);
>> > +    int mxr = get_field(*env->mstatus, MSTATUS_MXR);
>> >
>> >      if (env->priv_ver >= PRIV_VERSION_1_10_0) {
>> >          base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
>> > -        sum = get_field(env->mstatus, MSTATUS_SUM);
>> > +        sum = get_field(*env->mstatus, MSTATUS_SUM);
>> >          vm = get_field(env->satp, SATP_MODE);
>> >          switch (vm) {
>> >          case VM_1_10_SV32:
>> > @@ -237,8 +237,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>> >          }
>> >      } else {
>> >          base = (hwaddr)(env->sptbr) << PGSHIFT;
>> > -        sum = !get_field(env->mstatus, MSTATUS_PUM);
>> > -        vm = get_field(env->mstatus, MSTATUS_VM);
>> > +        sum = !get_field(*env->mstatus, MSTATUS_PUM);
>> > +        vm = get_field(*env->mstatus, MSTATUS_VM);
>> >          switch (vm) {
>> >          case VM_1_09_SV32:
>> >            levels = 2; ptidxbits = 10; ptesize = 4; break;
>> > @@ -492,8 +492,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>> >      ret = get_physical_address(env, &pa, &prot, address, access_type, mmu_idx);
>> >
>> >      if (mode == PRV_M && access_type != MMU_INST_FETCH) {
>> > -        if (get_field(env->mstatus, MSTATUS_MPRV)) {
>> > -            mode = get_field(env->mstatus, MSTATUS_MPP);
>> > +        if (get_field(*env->mstatus, MSTATUS_MPRV)) {
>> > +            mode = get_field(*env->mstatus, MSTATUS_MPP);
>> >          }
>> >      }
>> >
>> > @@ -599,12 +599,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>> >      if (env->priv <= PRV_S &&
>> >              cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
>> >          /* handle the trap in S-mode */
>> > -        target_ulong s = env->mstatus;
>> > +        target_ulong s = *env->mstatus;
>> >          s = set_field(s, MSTATUS_SPIE, env->priv_ver >= PRIV_VERSION_1_10_0 ?
>> >              get_field(s, MSTATUS_SIE) : get_field(s, MSTATUS_UIE << env->priv));
>> >          s = set_field(s, MSTATUS_SPP, env->priv);
>> >          s = set_field(s, MSTATUS_SIE, 0);
>> > -        env->mstatus = s;
>> > +        *env->mstatus = s;
>> >          env->scause = cause | ((target_ulong)async << (TARGET_LONG_BITS - 1));
>> >          env->sepc = env->pc;
>> >          env->sbadaddr = tval;
>> > @@ -613,12 +613,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>> >          riscv_cpu_set_mode(env, PRV_S);
>> >      } else {
>> >          /* handle the trap in M-mode */
>> > -        target_ulong s = env->mstatus;
>> > +        target_ulong s = *env->mstatus;
>> >          s = set_field(s, MSTATUS_MPIE, env->priv_ver >= PRIV_VERSION_1_10_0 ?
>> >              get_field(s, MSTATUS_MIE) : get_field(s, MSTATUS_UIE << env->priv));
>> >          s = set_field(s, MSTATUS_MPP, env->priv);
>> >          s = set_field(s, MSTATUS_MIE, 0);
>> > -        env->mstatus = s;
>> > +        *env->mstatus = s;
>> >          env->mcause = cause | ~(((target_ulong)-1) >> async);
>> >          env->mepc = env->pc;
>> >          env->mbadaddr = tval;
>> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> > index 74e911af08..a4b598d49a 100644
>> > --- a/target/riscv/csr.c
>> > +++ b/target/riscv/csr.c
>> > @@ -136,7 +136,7 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
>> >      if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>> >          return -1;
>> >      }
>> > -    env->mstatus |= MSTATUS_FS;
>> > +    *env->mstatus |= MSTATUS_FS;
>> >  #endif
>> >      riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
>> >      return 0;
>> > @@ -159,7 +159,7 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
>> >      if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>> >          return -1;
>> >      }
>> > -    env->mstatus |= MSTATUS_FS;
>> > +    *env->mstatus |= MSTATUS_FS;
>> >  #endif
>> >      env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
>> >      return 0;
>> > @@ -183,7 +183,7 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
>> >      if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>> >          return -1;
>> >      }
>> > -    env->mstatus |= MSTATUS_FS;
>> > +    *env->mstatus |= MSTATUS_FS;
>> >  #endif
>> >      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
>> >      riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
>> > @@ -313,7 +313,7 @@ static int read_mhartid(CPURISCVState *env, int csrno, target_ulong *val)
>> >  /* Machine Trap Setup */
>> >  static int read_mstatus(CPURISCVState *env, int csrno, target_ulong *val)
>> >  {
>> > -    *val = env->mstatus;
>> > +    *val = *env->mstatus;
>> >      return 0;
>> >  }
>> >
>> > @@ -325,7 +325,7 @@ static int validate_vm(CPURISCVState *env, target_ulong vm)
>> >
>> >  static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>> >  {
>> > -    target_ulong mstatus = env->mstatus;
>> > +    target_ulong mstatus = *env->mstatus;
>> >      target_ulong mask = 0;
>> >      int dirty;
>> >
>> > @@ -365,7 +365,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
>> >               ((mstatus & MSTATUS_FS) == MSTATUS_FS)) |
>> >              ((mstatus & MSTATUS_XS) == MSTATUS_XS);
>> >      mstatus = set_field(mstatus, MSTATUS_SD, dirty);
>> > -    env->mstatus = mstatus;
>> > +    *env->mstatus = mstatus;
>> >
>> >      return 0;
>> >  }
>> > @@ -614,7 +614,7 @@ static int read_sstatus(CPURISCVState *env, int csrno, target_ulong *val)
>> >  {
>> >      target_ulong mask = ((env->priv_ver >= PRIV_VERSION_1_10_0) ?
>> >                           sstatus_v1_10_mask : sstatus_v1_9_mask);
>> > -    *val = env->mstatus & mask;
>> > +    *val = *env->mstatus & mask;
>> >      return 0;
>> >  }
>> >
>> > @@ -622,7 +622,7 @@ static int write_sstatus(CPURISCVState *env, int csrno, target_ulong val)
>> >  {
>> >      target_ulong mask = ((env->priv_ver >= PRIV_VERSION_1_10_0) ?
>> >                           sstatus_v1_10_mask : sstatus_v1_9_mask);
>> > -    target_ulong newval = (env->mstatus & ~mask) | (val & mask);
>> > +    target_ulong newval = (*env->mstatus & ~mask) | (val & mask);
>> >      return write_mstatus(env, CSR_MSTATUS, newval);
>> >  }
>> >
>> > @@ -737,7 +737,7 @@ static int read_satp(CPURISCVState *env, int csrno, target_ulong *val)
>> >      if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
>> >          *val = 0;
>> >      } else if (env->priv_ver >= PRIV_VERSION_1_10_0) {
>> > -        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>> > +        if (env->priv == PRV_S && get_field(*env->mstatus, MSTATUS_TVM)) {
>> >              return -1;
>> >          } else {
>> >              *val = env->satp;
>> > @@ -762,7 +762,7 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
>> >          validate_vm(env, get_field(val, SATP_MODE)) &&
>> >          ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
>> >      {
>> > -        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
>> > +        if (env->priv == PRV_S && get_field(*env->mstatus, MSTATUS_TVM)) {
>> >              return -1;
>> >          } else {
>> >              if((val ^ env->satp) & SATP_ASID) {
>> > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
>> > index 331cc36232..d150551bc9 100644
>> > --- a/target/riscv/op_helper.c
>> > +++ b/target/riscv/op_helper.c
>> > @@ -83,11 +83,11 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
>> >      }
>> >
>> >      if (env->priv_ver >= PRIV_VERSION_1_10_0 &&
>> > -        get_field(env->mstatus, MSTATUS_TSR)) {
>> > +        get_field(*env->mstatus, MSTATUS_TSR)) {
>> >          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>> >      }
>> >
>> > -    target_ulong mstatus = env->mstatus;
>> > +    target_ulong mstatus = *env->mstatus;
>> >      target_ulong prev_priv = get_field(mstatus, MSTATUS_SPP);
>> >      mstatus = set_field(mstatus,
>> >          env->priv_ver >= PRIV_VERSION_1_10_0 ?
>> > @@ -96,7 +96,7 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
>> >      mstatus = set_field(mstatus, MSTATUS_SPIE, 0);
>> >      mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
>> >      riscv_cpu_set_mode(env, prev_priv);
>> > -    env->mstatus = mstatus;
>> > +    *env->mstatus = mstatus;
>> >
>> >      return retpc;
>> >  }
>> > @@ -112,7 +112,7 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>> >          riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, GETPC());
>> >      }
>> >
>> > -    target_ulong mstatus = env->mstatus;
>> > +    target_ulong mstatus = *env->mstatus;
>> >      target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
>> >      mstatus = set_field(mstatus,
>> >          env->priv_ver >= PRIV_VERSION_1_10_0 ?
>> > @@ -121,7 +121,7 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
>> >      mstatus = set_field(mstatus, MSTATUS_MPIE, 0);
>> >      mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
>> >      riscv_cpu_set_mode(env, prev_priv);
>> > -    env->mstatus = mstatus;
>> > +    *env->mstatus = mstatus;
>> >
>> >      return retpc;
>> >  }
>> > @@ -132,7 +132,7 @@ void helper_wfi(CPURISCVState *env)
>> >
>> >      if (env->priv == PRV_S &&
>> >          env->priv_ver >= PRIV_VERSION_1_10_0 &&
>> > -        get_field(env->mstatus, MSTATUS_TW)) {
>> > +        get_field(*env->mstatus, MSTATUS_TW)) {
>> >          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>> >      } else {
>> >          cs->halted = 1;
>> > @@ -147,7 +147,7 @@ void helper_tlb_flush(CPURISCVState *env)
>> >      if (!(env->priv >= PRV_S) ||
>> >          (env->priv == PRV_S &&
>> >           env->priv_ver >= PRIV_VERSION_1_10_0 &&
>> > -         get_field(env->mstatus, MSTATUS_TVM))) {
>> > +         get_field(*env->mstatus, MSTATUS_TVM))) {
>> >          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>> >      } else {
>> >          tlb_flush(cs);

