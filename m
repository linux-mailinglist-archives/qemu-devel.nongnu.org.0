Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AC2143E41
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:42:41 +0100 (CET)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittnj-0005bc-Jg
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fintelia@gmail.com>) id 1itt5X-0005M5-7Z
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:57:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1itt5T-0001cI-54
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:56:59 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:37990)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1itt5K-0001Wz-FA; Tue, 21 Jan 2020 07:56:46 -0500
Received: by mail-lf1-x142.google.com with SMTP id r14so2191224lfm.5;
 Tue, 21 Jan 2020 04:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FDvPMzAHMoXjuNfDyxj0jOSrdWS7zzwnOWbYAaKU5EI=;
 b=sEQ/f8ry9o8sEbgI91iiG5WMAkD5n2kLn/L99u3dJTFtGV2dzf8yeFl7WdlgqwAQvO
 rmoteh01QWrvHaFYJpenfW8t+MahXR0/URJcuNMUMJGPma41bEvZpHf8AsjORvh2f+IZ
 D3+Vv3qkrR2KrCym/QMpeCAFKPzHrj51g03TOEml8vAy28ug7Vcqh9h6wwhlZ+oV35+l
 E4nIjCnzow87b2yXz69EnK/qxdRmdeYlKdLp7ZrjrfivdU3F5HDcnyGNcTJrKEpdqVTc
 Ef5EZgkSh3gLDYb2KKLjdhnnqtrDNh/m11k7yJ9NqTP0Z3M+VJ48gsDH9+Qf0H8OmNk8
 cVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FDvPMzAHMoXjuNfDyxj0jOSrdWS7zzwnOWbYAaKU5EI=;
 b=EQu6W7D+gCr0+Ys7AuL2jFRPbYxHOthL9xKaQ1xBvwP9NwD5bKjFEUcuM/CYaWns8x
 cCXDEghLZ5r6m3Lr1Cq+28CQqiHP72+VhX2M+zmvMg9lSZ+nFz7WRdDCtwi4WLTQoP0w
 uFdQovzcApuTajy5N2KbPz4GEaQ/j/E4xHl+IigbDl57yU/Qxt29IkTEHwUalZfLfLXv
 Y+jZHKirs2hSn1oVel/hwnnW5ZoHdfyA4d+e0hH5S/dpMOVqrc2Wc7U4lO/QM2frQgn2
 zpFpacPm8LsGL/4Bo4qbFtx1brw9z8K5EOQekKj2O9YP9aMg3B7EXiqH9KpIFMRrloct
 BBJg==
X-Gm-Message-State: APjAAAUjGe0fMTZwsYyoBtGXhgHgHQJ8JzYd20nzHz6v15oV0T8l9wPe
 ivqCaq4QBvfhEZhMqV88EBSHj2D7S+FzP5D2PfQ=
X-Google-Smtp-Source: APXvYqzl3wjtmPSOese8tkTs4D+ugcorUUE6BexHxE26Bv3d4jYV3xocJ42oih2r6nPOmzU4ydAsngbb71nt7KiNB2c=
X-Received: by 2002:ac2:5a43:: with SMTP id r3mr2653717lfn.150.1579611404292; 
 Tue, 21 Jan 2020 04:56:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575914822.git.alistair.francis@wdc.com>
 <8c0eebc3868757e9ed312ac35e1f5325d5a18e76.1575914822.git.alistair.francis@wdc.com>
 <mhng-b22b75ac-a0c4-4d53-909c-2a8fd9506cd3@palmerdabbelt-glaptop>
 <CAKmqyKPOn_ULNu6i+s-0k-GGkZ0Gz9adNQcD1UU77u9t77ZXXQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPOn_ULNu6i+s-0k-GGkZ0Gz9adNQcD1UU77u9t77ZXXQ@mail.gmail.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Tue, 21 Jan 2020 07:56:18 -0500
Message-ID: <CANnJOVHAYA4uij86C0aBMp6FnZW=+i-v_K7iAcbTiEuUfkT8dQ@mail.gmail.com>
Subject: Re: [PATCH v1 15/36] target/riscv: Convert mstatus to pointers
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a2d688059ca5f073"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a2d688059ca5f073
Content-Type: text/plain; charset="UTF-8"

When I looked through the relevant code a few months ago, I couldn't find
anywhere that could actually be agnostic to whether the real or virtual
registers were in effect (other than emulating the actual CSR modification
instructions). For almost all state, the VS behavior is filtered by HS-mode
code. For example, you can grab satp in either mode but to properly do
address translation you also have to factor in hgatp so you need to know
the virtualization state anyway. Similarly, floating point co-proccessor
state is tracked in two places with V=1 so that both the host and the guest
can independently track dirty bits, but of course only the one in the
"real" mstatus applies in non-virtualized mode.

The idea of using an array to track the two versions of registers seemed
really elegant to me. If you know you want the host version you access
element zero. If you know you want the guest version you access element
one. And if you want the version that the running code would see you index
by the virtualization mode. In any case, the choice indicates that you
thought though which was the right option to use in that instance.

Jonathan

On Tue, Jan 21, 2020 at 6:02 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Wed, Jan 8, 2020 at 11:30 AM Palmer Dabbelt <palmerdabbelt@google.com>
> wrote:
> >
> > On Mon, 09 Dec 2019 10:11:19 PST (-0800), Alistair Francis wrote:
> > > To handle the new Hypervisor CSR register aliasing let's use pointers.
> >
> > For some reason I thought we were making this explicit?  In other words,
> > requiring that all callers provide which privilege mode they're using
> when
> > accessing these CSRs, as opposed to swapping around pointers.  I don't
> actually
> > care that much, but IIRC when we were talking with the ARM guys at
> Plumbers
> > they were pretty adament that would end up being a much cleaner
> implementation
> > as they'd tried this way and later changed over.
>
> I think their implementation is different so it doesn't apply the same
> here.
>
> My main concern is that due to the modularity of RISC-V I don't expect
> all future developers to keep track of the Hypervisor extensions. This
> way we always have the correct state in the registers.
>
> There is only one pointer variable left, so we could drop the pointer
> swapping part, but for now it's still here.
>
> Alistair
>
> >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  target/riscv/cpu.c        | 11 +++++++++--
> > >  target/riscv/cpu.h        |  9 ++++++++-
> > >  target/riscv/cpu_helper.c | 30 +++++++++++++++---------------
> > >  target/riscv/csr.c        | 20 ++++++++++----------
> > >  target/riscv/op_helper.c  | 14 +++++++-------
> > >  5 files changed, 49 insertions(+), 35 deletions(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index a07c5689b3..e61cf46a73 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -236,7 +236,7 @@ static void riscv_cpu_dump_state(CPUState *cs,
> FILE *f, int flags)
> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
> > >  #ifndef CONFIG_USER_ONLY
> > >      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ",
> env->mhartid);
> > > -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ",
> env->mstatus);
> > > +    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ",
> *env->mstatus);
> > >      if (riscv_has_ext(env, RVH)) {
> > >          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ",
> env->hstatus);
> > >          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
> env->vsstatus);
> > > @@ -336,7 +336,7 @@ static void riscv_cpu_reset(CPUState *cs)
> > >      mcc->parent_reset(cs);
> > >  #ifndef CONFIG_USER_ONLY
> > >      env->priv = PRV_M;
> > > -    env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
> > > +    *env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
> > >      env->mcause = 0;
> > >      env->pc = env->resetvec;
> > >  #endif
> > > @@ -465,8 +465,15 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
> > >  static void riscv_cpu_init(Object *obj)
> > >  {
> > >      RISCVCPU *cpu = RISCV_CPU(obj);
> > > +#ifndef CONFIG_USER_ONLY
> > > +    CPURISCVState *env = &cpu->env;
> > > +#endif
> > >
> > >      cpu_set_cpustate_pointers(cpu);
> > > +
> > > +#ifndef CONFIG_USER_ONLY
> > > +    env->mstatus = &env->mstatus_novirt;
> > > +#endif
> > >  }
> > >
> > >  static const VMStateDescription vmstate_riscv_cpu = {
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index 21ae5a8b19..9dc8303c62 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -122,7 +122,7 @@ struct CPURISCVState {
> > >      target_ulong resetvec;
> > >
> > >      target_ulong mhartid;
> > > -    target_ulong mstatus;
> > > +    target_ulong *mstatus;
> > >
> > >      target_ulong mip;
> > >      uint32_t miclaim;
> > > @@ -145,6 +145,13 @@ struct CPURISCVState {
> > >      target_ulong mcause;
> > >      target_ulong mtval;  /* since: priv-1.10.0 */
> > >
> > > +    /* The following registers are the "real" versions that the
> pointer
> > > +     * versions point to. These should never be used unless you know
> what you
> > > +     * are doing. To access these use the pointer versions instead.
> This is
> > > +     * required to handle the Hypervisor register swapping.
> > > +     */
> > > +    target_ulong mstatus_novirt;
> > > +
> > >      /* Hypervisor CSRs */
> > >      target_ulong hstatus;
> > >      target_ulong hedeleg;
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index b00f66824a..9684da7f7d 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -37,8 +37,8 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool
> ifetch)
> > >  #ifndef CONFIG_USER_ONLY
> > >  static int riscv_cpu_local_irq_pending(CPURISCVState *env)
> > >  {
> > > -    target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
> > > -    target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
> > > +    target_ulong mstatus_mie = get_field(*env->mstatus, MSTATUS_MIE);
> > > +    target_ulong mstatus_sie = get_field(*env->mstatus, MSTATUS_SIE);
> > >      target_ulong pending = env->mip & env->mie;
> > >      target_ulong mie = env->priv < PRV_M || (env->priv == PRV_M &&
> mstatus_mie);
> > >      target_ulong sie = env->priv < PRV_S || (env->priv == PRV_S &&
> mstatus_sie);
> > > @@ -75,7 +75,7 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
> > >  /* Return true is floating point support is currently enabled */
> > >  bool riscv_cpu_fp_enabled(CPURISCVState *env)
> > >  {
> > > -    if (env->mstatus & MSTATUS_FS) {
> > > +    if (*env->mstatus & MSTATUS_FS) {
> > >          return true;
> > >      }
> > >
> > > @@ -198,8 +198,8 @@ static int get_physical_address(CPURISCVState
> *env, hwaddr *physical,
> > >      int mode = mmu_idx;
> > >
> > >      if (mode == PRV_M && access_type != MMU_INST_FETCH) {
> > > -        if (get_field(env->mstatus, MSTATUS_MPRV)) {
> > > -            mode = get_field(env->mstatus, MSTATUS_MPP);
> > > +        if (get_field(*env->mstatus, MSTATUS_MPRV)) {
> > > +            mode = get_field(*env->mstatus, MSTATUS_MPP);
> > >          }
> > >      }
> > >
> > > @@ -213,11 +213,11 @@ static int get_physical_address(CPURISCVState
> *env, hwaddr *physical,
> > >
> > >      hwaddr base;
> > >      int levels, ptidxbits, ptesize, vm, sum;
> > > -    int mxr = get_field(env->mstatus, MSTATUS_MXR);
> > > +    int mxr = get_field(*env->mstatus, MSTATUS_MXR);
> > >
> > >      if (env->priv_ver >= PRIV_VERSION_1_10_0) {
> > >          base = (hwaddr)get_field(env->satp, SATP_PPN) << PGSHIFT;
> > > -        sum = get_field(env->mstatus, MSTATUS_SUM);
> > > +        sum = get_field(*env->mstatus, MSTATUS_SUM);
> > >          vm = get_field(env->satp, SATP_MODE);
> > >          switch (vm) {
> > >          case VM_1_10_SV32:
> > > @@ -237,8 +237,8 @@ static int get_physical_address(CPURISCVState
> *env, hwaddr *physical,
> > >          }
> > >      } else {
> > >          base = (hwaddr)(env->sptbr) << PGSHIFT;
> > > -        sum = !get_field(env->mstatus, MSTATUS_PUM);
> > > -        vm = get_field(env->mstatus, MSTATUS_VM);
> > > +        sum = !get_field(*env->mstatus, MSTATUS_PUM);
> > > +        vm = get_field(*env->mstatus, MSTATUS_VM);
> > >          switch (vm) {
> > >          case VM_1_09_SV32:
> > >            levels = 2; ptidxbits = 10; ptesize = 4; break;
> > > @@ -492,8 +492,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
> address, int size,
> > >      ret = get_physical_address(env, &pa, &prot, address, access_type,
> mmu_idx);
> > >
> > >      if (mode == PRV_M && access_type != MMU_INST_FETCH) {
> > > -        if (get_field(env->mstatus, MSTATUS_MPRV)) {
> > > -            mode = get_field(env->mstatus, MSTATUS_MPP);
> > > +        if (get_field(*env->mstatus, MSTATUS_MPRV)) {
> > > +            mode = get_field(*env->mstatus, MSTATUS_MPP);
> > >          }
> > >      }
> > >
> > > @@ -599,12 +599,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >      if (env->priv <= PRV_S &&
> > >              cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
> > >          /* handle the trap in S-mode */
> > > -        target_ulong s = env->mstatus;
> > > +        target_ulong s = *env->mstatus;
> > >          s = set_field(s, MSTATUS_SPIE, env->priv_ver >=
> PRIV_VERSION_1_10_0 ?
> > >              get_field(s, MSTATUS_SIE) : get_field(s, MSTATUS_UIE <<
> env->priv));
> > >          s = set_field(s, MSTATUS_SPP, env->priv);
> > >          s = set_field(s, MSTATUS_SIE, 0);
> > > -        env->mstatus = s;
> > > +        *env->mstatus = s;
> > >          env->scause = cause | ((target_ulong)async <<
> (TARGET_LONG_BITS - 1));
> > >          env->sepc = env->pc;
> > >          env->sbadaddr = tval;
> > > @@ -613,12 +613,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >          riscv_cpu_set_mode(env, PRV_S);
> > >      } else {
> > >          /* handle the trap in M-mode */
> > > -        target_ulong s = env->mstatus;
> > > +        target_ulong s = *env->mstatus;
> > >          s = set_field(s, MSTATUS_MPIE, env->priv_ver >=
> PRIV_VERSION_1_10_0 ?
> > >              get_field(s, MSTATUS_MIE) : get_field(s, MSTATUS_UIE <<
> env->priv));
> > >          s = set_field(s, MSTATUS_MPP, env->priv);
> > >          s = set_field(s, MSTATUS_MIE, 0);
> > > -        env->mstatus = s;
> > > +        *env->mstatus = s;
> > >          env->mcause = cause | ~(((target_ulong)-1) >> async);
> > >          env->mepc = env->pc;
> > >          env->mbadaddr = tval;
> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > index 74e911af08..a4b598d49a 100644
> > > --- a/target/riscv/csr.c
> > > +++ b/target/riscv/csr.c
> > > @@ -136,7 +136,7 @@ static int write_fflags(CPURISCVState *env, int
> csrno, target_ulong val)
> > >      if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> > >          return -1;
> > >      }
> > > -    env->mstatus |= MSTATUS_FS;
> > > +    *env->mstatus |= MSTATUS_FS;
> > >  #endif
> > >      riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
> > >      return 0;
> > > @@ -159,7 +159,7 @@ static int write_frm(CPURISCVState *env, int
> csrno, target_ulong val)
> > >      if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> > >          return -1;
> > >      }
> > > -    env->mstatus |= MSTATUS_FS;
> > > +    *env->mstatus |= MSTATUS_FS;
> > >  #endif
> > >      env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
> > >      return 0;
> > > @@ -183,7 +183,7 @@ static int write_fcsr(CPURISCVState *env, int
> csrno, target_ulong val)
> > >      if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> > >          return -1;
> > >      }
> > > -    env->mstatus |= MSTATUS_FS;
> > > +    *env->mstatus |= MSTATUS_FS;
> > >  #endif
> > >      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
> > >      riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
> > > @@ -313,7 +313,7 @@ static int read_mhartid(CPURISCVState *env, int
> csrno, target_ulong *val)
> > >  /* Machine Trap Setup */
> > >  static int read_mstatus(CPURISCVState *env, int csrno, target_ulong
> *val)
> > >  {
> > > -    *val = env->mstatus;
> > > +    *val = *env->mstatus;
> > >      return 0;
> > >  }
> > >
> > > @@ -325,7 +325,7 @@ static int validate_vm(CPURISCVState *env,
> target_ulong vm)
> > >
> > >  static int write_mstatus(CPURISCVState *env, int csrno, target_ulong
> val)
> > >  {
> > > -    target_ulong mstatus = env->mstatus;
> > > +    target_ulong mstatus = *env->mstatus;
> > >      target_ulong mask = 0;
> > >      int dirty;
> > >
> > > @@ -365,7 +365,7 @@ static int write_mstatus(CPURISCVState *env, int
> csrno, target_ulong val)
> > >               ((mstatus & MSTATUS_FS) == MSTATUS_FS)) |
> > >              ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> > >      mstatus = set_field(mstatus, MSTATUS_SD, dirty);
> > > -    env->mstatus = mstatus;
> > > +    *env->mstatus = mstatus;
> > >
> > >      return 0;
> > >  }
> > > @@ -614,7 +614,7 @@ static int read_sstatus(CPURISCVState *env, int
> csrno, target_ulong *val)
> > >  {
> > >      target_ulong mask = ((env->priv_ver >= PRIV_VERSION_1_10_0) ?
> > >                           sstatus_v1_10_mask : sstatus_v1_9_mask);
> > > -    *val = env->mstatus & mask;
> > > +    *val = *env->mstatus & mask;
> > >      return 0;
> > >  }
> > >
> > > @@ -622,7 +622,7 @@ static int write_sstatus(CPURISCVState *env, int
> csrno, target_ulong val)
> > >  {
> > >      target_ulong mask = ((env->priv_ver >= PRIV_VERSION_1_10_0) ?
> > >                           sstatus_v1_10_mask : sstatus_v1_9_mask);
> > > -    target_ulong newval = (env->mstatus & ~mask) | (val & mask);
> > > +    target_ulong newval = (*env->mstatus & ~mask) | (val & mask);
> > >      return write_mstatus(env, CSR_MSTATUS, newval);
> > >  }
> > >
> > > @@ -737,7 +737,7 @@ static int read_satp(CPURISCVState *env, int
> csrno, target_ulong *val)
> > >      if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
> > >          *val = 0;
> > >      } else if (env->priv_ver >= PRIV_VERSION_1_10_0) {
> > > -        if (env->priv == PRV_S && get_field(env->mstatus,
> MSTATUS_TVM)) {
> > > +        if (env->priv == PRV_S && get_field(*env->mstatus,
> MSTATUS_TVM)) {
> > >              return -1;
> > >          } else {
> > >              *val = env->satp;
> > > @@ -762,7 +762,7 @@ static int write_satp(CPURISCVState *env, int
> csrno, target_ulong val)
> > >          validate_vm(env, get_field(val, SATP_MODE)) &&
> > >          ((val ^ env->satp) & (SATP_MODE | SATP_ASID | SATP_PPN)))
> > >      {
> > > -        if (env->priv == PRV_S && get_field(env->mstatus,
> MSTATUS_TVM)) {
> > > +        if (env->priv == PRV_S && get_field(*env->mstatus,
> MSTATUS_TVM)) {
> > >              return -1;
> > >          } else {
> > >              if((val ^ env->satp) & SATP_ASID) {
> > > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > > index 331cc36232..d150551bc9 100644
> > > --- a/target/riscv/op_helper.c
> > > +++ b/target/riscv/op_helper.c
> > > @@ -83,11 +83,11 @@ target_ulong helper_sret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
> > >      }
> > >
> > >      if (env->priv_ver >= PRIV_VERSION_1_10_0 &&
> > > -        get_field(env->mstatus, MSTATUS_TSR)) {
> > > +        get_field(*env->mstatus, MSTATUS_TSR)) {
> > >          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> > >      }
> > >
> > > -    target_ulong mstatus = env->mstatus;
> > > +    target_ulong mstatus = *env->mstatus;
> > >      target_ulong prev_priv = get_field(mstatus, MSTATUS_SPP);
> > >      mstatus = set_field(mstatus,
> > >          env->priv_ver >= PRIV_VERSION_1_10_0 ?
> > > @@ -96,7 +96,7 @@ target_ulong helper_sret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
> > >      mstatus = set_field(mstatus, MSTATUS_SPIE, 0);
> > >      mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
> > >      riscv_cpu_set_mode(env, prev_priv);
> > > -    env->mstatus = mstatus;
> > > +    *env->mstatus = mstatus;
> > >
> > >      return retpc;
> > >  }
> > > @@ -112,7 +112,7 @@ target_ulong helper_mret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
> > >          riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, GETPC());
> > >      }
> > >
> > > -    target_ulong mstatus = env->mstatus;
> > > +    target_ulong mstatus = *env->mstatus;
> > >      target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
> > >      mstatus = set_field(mstatus,
> > >          env->priv_ver >= PRIV_VERSION_1_10_0 ?
> > > @@ -121,7 +121,7 @@ target_ulong helper_mret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
> > >      mstatus = set_field(mstatus, MSTATUS_MPIE, 0);
> > >      mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
> > >      riscv_cpu_set_mode(env, prev_priv);
> > > -    env->mstatus = mstatus;
> > > +    *env->mstatus = mstatus;
> > >
> > >      return retpc;
> > >  }
> > > @@ -132,7 +132,7 @@ void helper_wfi(CPURISCVState *env)
> > >
> > >      if (env->priv == PRV_S &&
> > >          env->priv_ver >= PRIV_VERSION_1_10_0 &&
> > > -        get_field(env->mstatus, MSTATUS_TW)) {
> > > +        get_field(*env->mstatus, MSTATUS_TW)) {
> > >          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> > >      } else {
> > >          cs->halted = 1;
> > > @@ -147,7 +147,7 @@ void helper_tlb_flush(CPURISCVState *env)
> > >      if (!(env->priv >= PRV_S) ||
> > >          (env->priv == PRV_S &&
> > >           env->priv_ver >= PRIV_VERSION_1_10_0 &&
> > > -         get_field(env->mstatus, MSTATUS_TVM))) {
> > > +         get_field(*env->mstatus, MSTATUS_TVM))) {
> > >          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> > >      } else {
> > >          tlb_flush(cs);
>
>

--000000000000a2d688059ca5f073
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>When I looked through the relevant code a few months =
ago, I couldn&#39;t find anywhere that could actually be agnostic to whethe=
r the real or virtual registers were in effect (other than emulating the ac=
tual CSR modification instructions). For almost all state, the VS behavior =
is filtered by HS-mode code. For example, you can grab satp in either mode =
but to properly do address translation you also have to factor in hgatp so =
you need to know the virtualization state anyway. Similarly, floating point=
 co-proccessor state is tracked in two places with V=3D1 so that both the h=
ost and the guest can independently track dirty bits, but of course only th=
e one in the &quot;real&quot; mstatus applies in non-virtualized mode.<br><=
/div><div><br></div><div>The idea of using an array to track the two versio=
ns of registers seemed really elegant to me. If you know you want the host =
version you access element zero. If you know you want the guest version you=
 access element one. And if you want the version that the running code woul=
d see you index by the virtualization mode. In any case, the choice indicat=
es that you thought though which was the right option to use in that instan=
ce.<br></div><div><br></div><div>Jonathan<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 21, 2020 at =
6:02 AM Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alista=
ir23@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Wed, Jan 8, 2020 at 11:30 AM Palmer Dabbelt &lt;<a href=3D=
"mailto:palmerdabbelt@google.com" target=3D"_blank">palmerdabbelt@google.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, 09 Dec 2019 10:11:19 PST (-0800), Alistair Francis wrote:<br>
&gt; &gt; To handle the new Hypervisor CSR register aliasing let&#39;s use =
pointers.<br>
&gt;<br>
&gt; For some reason I thought we were making this explicit?=C2=A0 In other=
 words,<br>
&gt; requiring that all callers provide which privilege mode they&#39;re us=
ing when<br>
&gt; accessing these CSRs, as opposed to swapping around pointers.=C2=A0 I =
don&#39;t actually<br>
&gt; care that much, but IIRC when we were talking with the ARM guys at Plu=
mbers<br>
&gt; they were pretty adament that would end up being a much cleaner implem=
entation<br>
&gt; as they&#39;d tried this way and later changed over.<br>
<br>
I think their implementation is different so it doesn&#39;t apply the same =
here.<br>
<br>
My main concern is that due to the modularity of RISC-V I don&#39;t expect<=
br>
all future developers to keep track of the Hypervisor extensions. This<br>
way we always have the correct state in the registers.<br>
<br>
There is only one pointer variable left, so we could drop the pointer<br>
swapping part, but for now it&#39;s still here.<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; &gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.fr=
ancis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++++++=
+--<br>
&gt; &gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +++=
+++++-<br>
&gt; &gt;=C2=A0 target/riscv/cpu_helper.c | 30 +++++++++++++++-------------=
--<br>
&gt; &gt;=C2=A0 target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20 ++++++++=
++----------<br>
&gt; &gt;=C2=A0 target/riscv/op_helper.c=C2=A0 | 14 +++++++-------<br>
&gt; &gt;=C2=A0 5 files changed, 49 insertions(+), 35 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; &gt; index a07c5689b3..e61cf46a73 100644<br>
&gt; &gt; --- a/target/riscv/cpu.c<br>
&gt; &gt; +++ b/target/riscv/cpu.c<br>
&gt; &gt; @@ -236,7 +236,7 @@ static void riscv_cpu_dump_state(CPUState *cs=
, FILE *f, int flags)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot; TARGET_FMT_l=
x &quot;\n&quot;, &quot;pc=C2=A0 =C2=A0 =C2=A0 &quot;, env-&gt;pc);<br>
&gt; &gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot; TARGET_FMT_l=
x &quot;\n&quot;, &quot;mhartid &quot;, env-&gt;mhartid);<br>
&gt; &gt; -=C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot; TARGET_FMT_lx &qu=
ot;\n&quot;, &quot;mstatus &quot;, env-&gt;mstatus);<br>
&gt; &gt; +=C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot; TARGET_FMT_lx &qu=
ot;\n&quot;, &quot;mstatus &quot;, *env-&gt;mstatus);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (riscv_has_ext(env, RVH)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot=
; TARGET_FMT_lx &quot;\n&quot;, &quot;hstatus &quot;, env-&gt;hstatus);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fprintf(f, &quot; %s &quot=
; TARGET_FMT_lx &quot;\n&quot;, &quot;vsstatus &quot;, env-&gt;vsstatus);<b=
r>
&gt; &gt; @@ -336,7 +336,7 @@ static void riscv_cpu_reset(CPUState *cs)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mcc-&gt;parent_reset(cs);<br>
&gt; &gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;priv =3D PRV_M;<br>
&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus &amp;=3D ~(MSTATUS_MIE | MSTATUS_M=
PRV);<br>
&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus &amp;=3D ~(MSTATUS_MIE | MSTATUS_=
MPRV);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;mcause =3D 0;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;pc =3D env-&gt;resetvec;<br>
&gt; &gt;=C2=A0 #endif<br>
&gt; &gt; @@ -465,8 +465,15 @@ static void riscv_cpu_realize(DeviceState *d=
ev, Error **errp)<br>
&gt; &gt;=C2=A0 static void riscv_cpu_init(Object *obj)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);<br>
&gt; &gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; &gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; &gt; +#endif<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 cpu_set_cpustate_pointers(cpu);<br>
&gt; &gt; +<br>
&gt; &gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; &gt; +=C2=A0 =C2=A0 env-&gt;mstatus =3D &amp;env-&gt;mstatus_novirt;<b=
r>
&gt; &gt; +#endif<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 static const VMStateDescription vmstate_riscv_cpu =3D {<br>
&gt; &gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; &gt; index 21ae5a8b19..9dc8303c62 100644<br>
&gt; &gt; --- a/target/riscv/cpu.h<br>
&gt; &gt; +++ b/target/riscv/cpu.h<br>
&gt; &gt; @@ -122,7 +122,7 @@ struct CPURISCVState {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong resetvec;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mhartid;<br>
&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus;<br>
&gt; &gt; +=C2=A0 =C2=A0 target_ulong *mstatus;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mip;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint32_t miclaim;<br>
&gt; &gt; @@ -145,6 +145,13 @@ struct CPURISCVState {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mcause;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mtval;=C2=A0 /* since: priv-1.10=
.0 */<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 /* The following registers are the &quot;real&quot=
; versions that the pointer<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* versions point to. These should never be u=
sed unless you know what you<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* are doing. To access these use the pointer=
 versions instead. This is<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* required to handle the Hypervisor register=
 swapping.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus_novirt;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Hypervisor CSRs */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hstatus;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong hedeleg;<br>
&gt; &gt; diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.=
c<br>
&gt; &gt; index b00f66824a..9684da7f7d 100644<br>
&gt; &gt; --- a/target/riscv/cpu_helper.c<br>
&gt; &gt; +++ b/target/riscv/cpu_helper.c<br>
&gt; &gt; @@ -37,8 +37,8 @@ int riscv_cpu_mmu_index(CPURISCVState *env, boo=
l ifetch)<br>
&gt; &gt;=C2=A0 #ifndef CONFIG_USER_ONLY<br>
&gt; &gt;=C2=A0 static int riscv_cpu_local_irq_pending(CPURISCVState *env)<=
br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus_mie =3D get_field(env-&gt;mst=
atus, MSTATUS_MIE);<br>
&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus_sie =3D get_field(env-&gt;mst=
atus, MSTATUS_SIE);<br>
&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus_mie =3D get_field(*env-&gt;ms=
tatus, MSTATUS_MIE);<br>
&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus_sie =3D get_field(*env-&gt;ms=
tatus, MSTATUS_SIE);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong pending =3D env-&gt;mip &amp; en=
v-&gt;mie;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mie =3D env-&gt;priv &lt; PRV_M =
|| (env-&gt;priv =3D=3D PRV_M &amp;&amp; mstatus_mie);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong sie =3D env-&gt;priv &lt; PRV_S =
|| (env-&gt;priv =3D=3D PRV_S &amp;&amp; mstatus_sie);<br>
&gt; &gt; @@ -75,7 +75,7 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int=
 interrupt_request)<br>
&gt; &gt;=C2=A0 /* Return true is floating point support is currently enabl=
ed */<br>
&gt; &gt;=C2=A0 bool riscv_cpu_fp_enabled(CPURISCVState *env)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 if (env-&gt;mstatus &amp; MSTATUS_FS) {<br>
&gt; &gt; +=C2=A0 =C2=A0 if (*env-&gt;mstatus &amp; MSTATUS_FS) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; @@ -198,8 +198,8 @@ static int get_physical_address(CPURISCVState=
 *env, hwaddr *physical,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int mode =3D mmu_idx;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (mode =3D=3D PRV_M &amp;&amp; access_type =
!=3D MMU_INST_FETCH) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_field(env-&gt;mstatus, MSTAT=
US_MPRV)) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D get_field(env=
-&gt;mstatus, MSTATUS_MPP);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_field(*env-&gt;mstatus, MSTA=
TUS_MPRV)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D get_field(*en=
v-&gt;mstatus, MSTATUS_MPP);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; @@ -213,11 +213,11 @@ static int get_physical_address(CPURISCVSta=
te *env, hwaddr *physical,<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 hwaddr base;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int levels, ptidxbits, ptesize, vm, sum;<br>
&gt; &gt; -=C2=A0 =C2=A0 int mxr =3D get_field(env-&gt;mstatus, MSTATUS_MXR=
);<br>
&gt; &gt; +=C2=A0 =C2=A0 int mxr =3D get_field(*env-&gt;mstatus, MSTATUS_MX=
R);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv_ver &gt;=3D PRIV_VERSION_1_1=
0_0) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D (hwaddr)get_field(env-=
&gt;satp, SATP_PPN) &lt;&lt; PGSHIFT;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sum =3D get_field(env-&gt;mstatus, M=
STATUS_SUM);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sum =3D get_field(*env-&gt;mstatus, =
MSTATUS_SUM);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vm =3D get_field(env-&gt;satp, =
SATP_MODE);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (vm) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case VM_1_10_SV32:<br>
&gt; &gt; @@ -237,8 +237,8 @@ static int get_physical_address(CPURISCVState=
 *env, hwaddr *physical,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D (hwaddr)(env-&gt;sptbr=
) &lt;&lt; PGSHIFT;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sum =3D !get_field(env-&gt;mstatus, =
MSTATUS_PUM);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm =3D get_field(env-&gt;mstatus, MS=
TATUS_VM);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sum =3D !get_field(*env-&gt;mstatus,=
 MSTATUS_PUM);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm =3D get_field(*env-&gt;mstatus, M=
STATUS_VM);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (vm) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case VM_1_09_SV32:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 levels =3D 2; ptidxbits =
=3D 10; ptesize =3D 4; break;<br>
&gt; &gt; @@ -492,8 +492,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr a=
ddress, int size,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 ret =3D get_physical_address(env, &amp;pa, &a=
mp;prot, address, access_type, mmu_idx);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (mode =3D=3D PRV_M &amp;&amp; access_type =
!=3D MMU_INST_FETCH) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_field(env-&gt;mstatus, MSTAT=
US_MPRV)) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D get_field(env=
-&gt;mstatus, MSTATUS_MPP);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_field(*env-&gt;mstatus, MSTA=
TUS_MPRV)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D get_field(*en=
v-&gt;mstatus, MSTATUS_MPP);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; @@ -599,12 +599,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv &lt;=3D PRV_S &amp;&amp;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cause &lt; TARGET=
_LONG_BITS &amp;&amp; ((deleg &gt;&gt; cause) &amp; 1)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* handle the trap in S-mode */=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong s =3D env-&gt;mstatus;<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong s =3D *env-&gt;mstatus;=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_SPIE=
, env-&gt;priv_ver &gt;=3D PRIV_VERSION_1_10_0 ?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(s, MSTA=
TUS_SIE) : get_field(s, MSTATUS_UIE &lt;&lt; env-&gt;priv));<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_SPP,=
 env-&gt;priv);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_SIE,=
 0);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mstatus =3D s;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *env-&gt;mstatus =3D s;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;scause =3D cause | ((ta=
rget_ulong)async &lt;&lt; (TARGET_LONG_BITS - 1));<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;sepc =3D env-&gt;pc;<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;sbadaddr =3D tval;<br>
&gt; &gt; @@ -613,12 +613,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_mode(env, PRV_S);=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* handle the trap in M-mode */=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong s =3D env-&gt;mstatus;<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong s =3D *env-&gt;mstatus;=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_MPIE=
, env-&gt;priv_ver &gt;=3D PRIV_VERSION_1_10_0 ?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(s, MSTA=
TUS_MIE) : get_field(s, MSTATUS_UIE &lt;&lt; env-&gt;priv));<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_MPP,=
 env-&gt;priv);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D set_field(s, MSTATUS_MIE,=
 0);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mstatus =3D s;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *env-&gt;mstatus =3D s;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mcause =3D cause | ~(((=
target_ulong)-1) &gt;&gt; async);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mepc =3D env-&gt;pc;<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mbadaddr =3D tval;<br>
&gt; &gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; &gt; index 74e911af08..a4b598d49a 100644<br>
&gt; &gt; --- a/target/riscv/csr.c<br>
&gt; &gt; +++ b/target/riscv/csr.c<br>
&gt; &gt; @@ -136,7 +136,7 @@ static int write_fflags(CPURISCVState *env, i=
nt csrno, target_ulong val)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_cpu_f=
p_enabled(env)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt; &gt;=C2=A0 #endif<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_fflags(env, val &amp; (FSR_AEXC=
 &gt;&gt; FSR_AEXC_SHIFT));<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; @@ -159,7 +159,7 @@ static int write_frm(CPURISCVState *env, int =
csrno, target_ulong val)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_cpu_f=
p_enabled(env)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt; &gt;=C2=A0 #endif<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;frm =3D val &amp; (FSR_RD &gt;&gt; FS=
R_RD_SHIFT);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; @@ -183,7 +183,7 @@ static int write_fcsr(CPURISCVState *env, int=
 csrno, target_ulong val)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_cpu_f=
p_enabled(env)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus |=3D MSTATUS_FS;<br>
&gt; &gt;=C2=A0 #endif<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;frm =3D (val &amp; FSR_RD) &gt;&gt; F=
SR_RD_SHIFT;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_fflags(env, (val &amp; FSR_AEXC=
) &gt;&gt; FSR_AEXC_SHIFT);<br>
&gt; &gt; @@ -313,7 +313,7 @@ static int read_mhartid(CPURISCVState *env, i=
nt csrno, target_ulong *val)<br>
&gt; &gt;=C2=A0 /* Machine Trap Setup */<br>
&gt; &gt;=C2=A0 static int read_mstatus(CPURISCVState *env, int csrno, targ=
et_ulong *val)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mstatus;<br>
&gt; &gt; +=C2=A0 =C2=A0 *val =3D *env-&gt;mstatus;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; @@ -325,7 +325,7 @@ static int validate_vm(CPURISCVState *env, ta=
rget_ulong vm)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 static int write_mstatus(CPURISCVState *env, int csrno, tar=
get_ulong val)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus =3D env-&gt;mstatus;<br>
&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus =3D *env-&gt;mstatus;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mask =3D 0;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int dirty;<br>
&gt; &gt;<br>
&gt; &gt; @@ -365,7 +365,7 @@ static int write_mstatus(CPURISCVState *env, =
int csrno, target_ulong val)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((mstatus &=
amp; MSTATUS_FS) =3D=3D MSTATUS_FS)) |<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((mstatus &amp; M=
STATUS_XS) =3D=3D MSTATUS_XS);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus, MSTATUS_SD, di=
rty);<br>
&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus =3D mstatus;<br>
&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus =3D mstatus;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; @@ -614,7 +614,7 @@ static int read_sstatus(CPURISCVState *env, i=
nt csrno, target_ulong *val)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mask =3D ((env-&gt;priv_ver &gt;=
=3D PRIV_VERSION_1_10_0) ?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sstatus_v1_10_mask : sstatus_v1_9_mask);<br>
&gt; &gt; -=C2=A0 =C2=A0 *val =3D env-&gt;mstatus &amp; mask;<br>
&gt; &gt; +=C2=A0 =C2=A0 *val =3D *env-&gt;mstatus &amp; mask;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; @@ -622,7 +622,7 @@ static int write_sstatus(CPURISCVState *env, =
int csrno, target_ulong val)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong mask =3D ((env-&gt;priv_ver &gt;=
=3D PRIV_VERSION_1_10_0) ?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sstatus_v1_10_mask : sstatus_v1_9_mask);<br>
&gt; &gt; -=C2=A0 =C2=A0 target_ulong newval =3D (env-&gt;mstatus &amp; ~ma=
sk) | (val &amp; mask);<br>
&gt; &gt; +=C2=A0 =C2=A0 target_ulong newval =3D (*env-&gt;mstatus &amp; ~m=
ask) | (val &amp; mask);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return write_mstatus(env, CSR_MSTATUS, newval=
);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; @@ -737,7 +737,7 @@ static int read_satp(CPURISCVState *env, int =
csrno, target_ulong *val)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!riscv_feature(env, RISCV_FEATURE_MMU)) {=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D 0;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else if (env-&gt;priv_ver &gt;=3D PRIV_VERS=
ION_1_10_0) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S &amp;&=
amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S &amp;&=
amp; get_field(*env-&gt;mstatus, MSTATUS_TVM)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;=
satp;<br>
&gt; &gt; @@ -762,7 +762,7 @@ static int write_satp(CPURISCVState *env, int=
 csrno, target_ulong val)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 validate_vm(env, get_field(val,=
 SATP_MODE)) &amp;&amp;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((val ^ env-&gt;satp) &amp; (SA=
TP_MODE | SATP_ASID | SATP_PPN)))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S &amp;&=
amp; get_field(env-&gt;mstatus, MSTATUS_TVM)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S &amp;&=
amp; get_field(*env-&gt;mstatus, MSTATUS_TVM)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if((val ^ env-&gt=
;satp) &amp; SATP_ASID) {<br>
&gt; &gt; diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c<=
br>
&gt; &gt; index 331cc36232..d150551bc9 100644<br>
&gt; &gt; --- a/target/riscv/op_helper.c<br>
&gt; &gt; +++ b/target/riscv/op_helper.c<br>
&gt; &gt; @@ -83,11 +83,11 @@ target_ulong helper_sret(CPURISCVState *env, =
target_ulong cpu_pc_deb)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv_ver &gt;=3D PRIV_VERSION_1_1=
0_0 &amp;&amp;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;mstatus, MSTATUS_T=
SR)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(*env-&gt;mstatus, MSTATUS_=
TSR)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISC=
V_EXCP_ILLEGAL_INST, GETPC());<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus =3D env-&gt;mstatus;<br>
&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus =3D *env-&gt;mstatus;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong prev_priv =3D get_field(mstatus,=
 MSTATUS_SPP);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;priv_ver &gt;=3D PRIV_V=
ERSION_1_10_0 ?<br>
&gt; &gt; @@ -96,7 +96,7 @@ target_ulong helper_sret(CPURISCVState *env, ta=
rget_ulong cpu_pc_deb)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus, MSTATUS_SPIE, =
0);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus, MSTATUS_SPP, P=
RV_U);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_mode(env, prev_priv);<br>
&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus =3D mstatus;<br>
&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus =3D mstatus;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return retpc;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; @@ -112,7 +112,7 @@ target_ulong helper_mret(CPURISCVState *env, =
target_ulong cpu_pc_deb)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISC=
V_EXCP_INST_ADDR_MIS, GETPC());<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 target_ulong mstatus =3D env-&gt;mstatus;<br>
&gt; &gt; +=C2=A0 =C2=A0 target_ulong mstatus =3D *env-&gt;mstatus;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 target_ulong prev_priv =3D get_field(mstatus,=
 MSTATUS_MPP);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;priv_ver &gt;=3D PRIV_V=
ERSION_1_10_0 ?<br>
&gt; &gt; @@ -121,7 +121,7 @@ target_ulong helper_mret(CPURISCVState *env, =
target_ulong cpu_pc_deb)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus, MSTATUS_MPIE, =
0);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mstatus =3D set_field(mstatus, MSTATUS_MPP, P=
RV_U);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_mode(env, prev_priv);<br>
&gt; &gt; -=C2=A0 =C2=A0 env-&gt;mstatus =3D mstatus;<br>
&gt; &gt; +=C2=A0 =C2=A0 *env-&gt;mstatus =3D mstatus;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return retpc;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; @@ -132,7 +132,7 @@ void helper_wfi(CPURISCVState *env)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (env-&gt;priv =3D=3D PRV_S &amp;&amp;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;priv_ver &gt;=3D PRIV_V=
ERSION_1_10_0 &amp;&amp;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;mstatus, MSTATUS_T=
W)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(*env-&gt;mstatus, MSTATUS_=
TW)) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISC=
V_EXCP_ILLEGAL_INST, GETPC());<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;halted =3D 1;<br>
&gt; &gt; @@ -147,7 +147,7 @@ void helper_tlb_flush(CPURISCVState *env)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (!(env-&gt;priv &gt;=3D PRV_S) ||<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp=
;&amp;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;priv_ver &gt;=3D =
PRIV_VERSION_1_10_0 &amp;&amp;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_field(env-&gt;mstatus, MST=
ATUS_TVM))) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_field(*env-&gt;mstatus, MS=
TATUS_TVM))) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISC=
V_EXCP_ILLEGAL_INST, GETPC());<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tlb_flush(cs);<br>
<br>
</blockquote></div>

--000000000000a2d688059ca5f073--

