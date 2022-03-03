Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E7B4CC59C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:06:55 +0100 (CET)
Received: from localhost ([::1]:36068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqms-0002wR-6H
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:06:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nPqbZ-00089L-3Y
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:55:13 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=39511
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nPqbX-0002mV-0N
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:55:12 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id x200so12145327ybe.6
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kVuCR/pyCkFF2TUk0sy0E1lxmvFCNPykHi1eRA8jMc4=;
 b=I267LkXuxE3posBKqqz6mfJMs5OVWF3QusBBXQjKNSBW18/SqMjZTCSmEbiDvE1xS8
 u7zQeUUqCRIzao8Jvqi5EMvaHLrGfFhY+dWw+vROULDC6qU17Wlh9mQFLSIZI44JopnC
 udkj/dIGUjrBIdRP/0tarcSpgmoKrYNxeUTXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kVuCR/pyCkFF2TUk0sy0E1lxmvFCNPykHi1eRA8jMc4=;
 b=F3HrV2d5+oStefB+xk7xItO6NUDP+aLqqAn7NoYjgoWvWosJ8w85cBeZzzv3H9/vqb
 miEHi8JzdQpP2N16tJDi4BmULGTUep8VTDfcZwOXCQRNQN/Tz/32lwmjlHv1/LXUyKqZ
 yMFa6JV/QZmbpwpc+c2WF9/DoirXWpBQ0djAYmGIL2p1k3fc/qHtHAwAjaqWpqwlcxrT
 AfdL/oP84kw7/KZq293WFXXegjBqKizsjkQD4bPi/K4aTTxk0M6GmXwAvjAX76G1lCLd
 S1fxlQfN20+mYkmAgwPNebresAZYGHQB3OprTU8AbdL0nobU1MvwC3nZTaOcHw0W5UYc
 Ky5g==
X-Gm-Message-State: AOAM531v7TPNiLyV4IoaKscEEhlM0wq597c5giDyy0UY5+2zkRRS2KYW
 YqtpsPMsKrBLMFwqkyefiKLJnQnNpOVhNB1vgCeo
X-Google-Smtp-Source: ABdhPJxZxhoHP+Say6TqmYoLRorg9rTP9tpz6MwqkRRbNKAR9Z7d90TK7RbBp2wTt7rwKqQpD8Qdvnd26cBLxuZaydo=
X-Received: by 2002:a5b:9c2:0:b0:611:ad59:be04 with SMTP id
 y2-20020a5b09c2000000b00611ad59be04mr35113137ybq.405.1646333709432; Thu, 03
 Mar 2022 10:55:09 -0800 (PST)
MIME-Version: 1.0
References: <20220222220704.2294924-1-atishp@rivosinc.com>
 <20220222220704.2294924-6-atishp@rivosinc.com>
 <CAKmqyKM4LxJvE+4KOVQzJAxJYDFfrnQe9KKcv4o9OiKULXTBvQ@mail.gmail.com>
In-Reply-To: <CAKmqyKM4LxJvE+4KOVQzJAxJYDFfrnQe9KKcv4o9OiKULXTBvQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 3 Mar 2022 10:54:58 -0800
Message-ID: <CAOnJCULU+pAZtjZi1vDjtC_7NW_=v9ubwF0H8jrdu4bS0FXs8w@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] target/riscv: Add *envcfg* CSRs support
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2b.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 8:34 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Feb 23, 2022 at 8:09 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > The RISC-V privileged specification v1.12 defines few execution
> > environment configuration CSRs that can be used enable/disable
> > extensions per privilege levels.
> >
> > Add the basic support for these CSRs.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> Do you mind rebasing this on:
>
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next
>

Done.


> Alistair
>
> > ---
> >  target/riscv/cpu.h      |   5 ++
> >  target/riscv/cpu_bits.h |  39 +++++++++++++++
> >  target/riscv/csr.c      | 107 ++++++++++++++++++++++++++++++++++++++++
> >  target/riscv/machine.c  |  24 +++++++++
> >  4 files changed, 175 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 0741f9822cf0..e5c8694cf081 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -303,6 +303,11 @@ struct CPURISCVState {
> >      target_ulong spmbase;
> >      target_ulong upmmask;
> >      target_ulong upmbase;
> > +
> > +    /* CSRs for execution enviornment configuration */
> > +    uint64_t menvcfg;
> > +    target_ulong senvcfg;
> > +    uint64_t henvcfg;
> >  #endif
> >
> >      float_status fp_status;
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 89440241632a..58a0a8d69f72 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -202,6 +202,9 @@
> >  #define CSR_STVEC           0x105
> >  #define CSR_SCOUNTEREN      0x106
> >
> > +/* Supervisor Configuration CSRs */
> > +#define CSR_SENVCFG         0x10A
> > +
> >  /* Supervisor Trap Handling */
> >  #define CSR_SSCRATCH        0x140
> >  #define CSR_SEPC            0x141
> > @@ -247,6 +250,10 @@
> >  #define CSR_HTIMEDELTA      0x605
> >  #define CSR_HTIMEDELTAH     0x615
> >
> > +/* Hypervisor Configuration CSRs */
> > +#define CSR_HENVCFG         0x60A
> > +#define CSR_HENVCFGH        0x61A
> > +
> >  /* Virtual CSRs */
> >  #define CSR_VSSTATUS        0x200
> >  #define CSR_VSIE            0x204
> > @@ -290,6 +297,10 @@
> >  #define CSR_VSIEH           0x214
> >  #define CSR_VSIPH           0x254
> >
> > +/* Machine Configuration CSRs */
> > +#define CSR_MENVCFG         0x30A
> > +#define CSR_MENVCFGH        0x31A
> > +
> >  /* Enhanced Physical Memory Protection (ePMP) */
> >  #define CSR_MSECCFG         0x747
> >  #define CSR_MSECCFGH        0x757
> > @@ -654,6 +665,34 @@ typedef enum RISCVException {
> >  #define PM_EXT_CLEAN    0x00000002ULL
> >  #define PM_EXT_DIRTY    0x00000003ULL
> >
> > +/* Execution enviornment configuration bits */
> > +#define MENVCFG_FIOM                       BIT(0)
> > +#define MENVCFG_CBIE                       (3UL << 4)
> > +#define MENVCFG_CBCFE                      BIT(6)
> > +#define MENVCFG_CBZE                       BIT(7)
> > +#define MENVCFG_PBMTE                      BIT(62)
> > +#define MENVCFG_STCE                       BIT(63)
> > +
> > +/* For RV32 */
> > +#define MENVCFGH_PBMTE                     BIT(30)
> > +#define MENVCFGH_STCE                      BIT(31)
> > +
> > +#define SENVCFG_FIOM                       MENVCFG_FIOM
> > +#define SENVCFG_CBIE                       MENVCFG_CBIE
> > +#define SENVCFG_CBCFE                      MENVCFG_CBCFE
> > +#define SENVCFG_CBZE                       MENVCFG_CBZE
> > +
> > +#define HENVCFG_FIOM                       MENVCFG_FIOM
> > +#define HENVCFG_CBIE                       MENVCFG_CBIE
> > +#define HENVCFG_CBCFE                      MENVCFG_CBCFE
> > +#define HENVCFG_CBZE                       MENVCFG_CBZE
> > +#define HENVCFG_PBMTE                      MENVCFG_PBMTE
> > +#define HENVCFG_STCE                       MENVCFG_STCE
> > +
> > +/* For RV32 */
> > +#define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
> > +#define HENVCFGH_STCE                       MENVCFGH_STCE
> > +
> >  /* Offsets for every pair of control bits per each priv level */
> >  #define XS_OFFSET    0ULL
> >  #define U_OFFSET     2ULL
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 18fe17b62f51..ff7e36596447 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -1366,6 +1366,101 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +/* Execution environment configuration setup */
> > +static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val = env->menvcfg;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
> > +                                  target_ulong val)
> > +{
> > +    uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
> > +
> > +    if (riscv_cpu_mxl(env) == MXL_RV64) {
> > +        mask |= MENVCFG_PBMTE | MENVCFG_STCE;
> > +    }
> > +    env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val = env->menvcfg >> 32;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
> > +                                  target_ulong val)
> > +{
> > +    uint64_t mask = MENVCFG_PBMTE | MENVCFG_STCE;
> > +    uint64_t valh = (uint64_t)val << 32;
> > +
> > +    env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val = env->senvcfg;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
> > +                                  target_ulong val)
> > +{
> > +    uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
> > +
> > +    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val = env->henvcfg;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
> > +                                  target_ulong val)
> > +{
> > +    uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
> > +
> > +    if (riscv_cpu_mxl(env) == MXL_RV64) {
> > +        mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> > +    }
> > +
> > +    env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val = env->henvcfg >> 32;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
> > +                                  target_ulong val)
> > +{
> > +    uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
> > +    uint64_t valh = (uint64_t)val << 32;
> > +
> > +    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >  static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
> >                                  uint64_t *ret_val,
> >                                  uint64_t new_val, uint64_t wr_mask)
> > @@ -3069,6 +3164,18 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> >      [CSR_MVIPH]    = { "mviph",    aia_any32, read_zero,  write_ignore },
> >      [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
> >
> > +    /* Execution environment configuration */
> > +    [CSR_MENVCFG]  = { "menvcfg",  any,   read_menvcfg,  write_menvcfg,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_MENVCFGH] = { "menvcfgh", any32, read_menvcfgh, write_menvcfgh,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HENVCFG]  = { "henvcfg",  hmode, read_henvcfg, write_henvcfg,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
> > +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +
> >      /* Supervisor Trap Setup */
> >      [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
> >                                                read_sstatus_i128                 },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index 9895930b2976..4a50a05937fa 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -220,6 +220,29 @@ static const VMStateDescription vmstate_kvmtimer = {
> >      }
> >  };
> >
> > +/* TODO: henvcfg need both hyper_needed & envcfg_needed */
> > +static bool envcfg_needed(void *opaque)
> > +{
> > +    RISCVCPU *cpu = opaque;
> > +    CPURISCVState *env = &cpu->env;
> > +
> > +    return (env->priv_ver >= PRIV_VERSION_1_12_0 ? 1 : 0);
> > +}
> > +
> > +static const VMStateDescription vmstate_envcfg = {
> > +    .name = "cpu/envcfg",
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .needed = envcfg_needed,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_UINT64(env.menvcfg, RISCVCPU),
> > +        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
> > +        VMSTATE_UINT64(env.henvcfg, RISCVCPU),
> > +
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> >  const VMStateDescription vmstate_riscv_cpu = {
> >      .name = "cpu",
> >      .version_id = 3,
> > @@ -280,6 +303,7 @@ const VMStateDescription vmstate_riscv_cpu = {
> >          &vmstate_pointermasking,
> >          &vmstate_rv128,
> >          &vmstate_kvmtimer,
> > +        &vmstate_envcfg,
> >          NULL
> >      }
> >  };
> > --
> > 2.30.2
> >
> >
>


--
Regards,
Atish

