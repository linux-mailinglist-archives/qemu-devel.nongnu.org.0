Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4795F1C91
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 15:59:36 +0200 (CEST)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oed1i-0005PZ-LV
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 09:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oeczS-0003AF-P9
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 09:57:14 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1oeczP-0002Qy-Sa
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 09:57:14 -0400
Received: by mail-pl1-x630.google.com with SMTP id io19so3134401plb.10
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date; bh=dXbxPi2JCovV0o/D4QKvnnc44fWlRXbGaKtrq1W2qWQ=;
 b=cwrfAJnyhvHS4Gt4IvAqaooQNK9exqqXtYvQNgKRSNtWhLsLx9H4b2sUlCe4unFQ8b
 pyqZfijSTcleNR5RnuOZYrdPZW6XrugxvSzsi20pNiVwkF/mtN4x/zI9ZwGYCwEk/Lyo
 ZcQS+dmRV8jhw2FF1rCNji/pJcWxXlq5UJ8g2zQk1FwEEgMBS+4e330MkHVwzn89X8Sl
 D+/bc0Nx+vn2w/mEsh9NZVDGjOOZAAv5Gcil17saBLxPuc+JbeQ9DBz18n6fuBq8yKYr
 pcVifpEnbnqzOPLeIY6jzc46PRsFL1AQ1B0Da+acgGIdvu9662I3PymLooI+gkx8eLnV
 UbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date;
 bh=dXbxPi2JCovV0o/D4QKvnnc44fWlRXbGaKtrq1W2qWQ=;
 b=mjl4ZvSK9gLl7vuVjmVbGZhCRRcOvOuMLXPnRJshNAwhOauF7kBU2FhOh5EuNnmh3k
 XH39ryqOFqhJH+rqd6j6SaS9PmThG8Fdg3zOvTA0+zfl5OnrnqPp+gJCbeYEGSaUmP8h
 R54bsDidyi63l33Bj2Yr4dcyqoYizV8ma9Y7dZpemqn5PwcdrfO1tDblUD70Ho8NGDiZ
 UJHO+O/dW383j/3AE/a4zK/25Hv4VYPGLeJmBoyjE5h3MRJE/7LG1ib8qkiRKaDM88Ik
 9+w0O0HNmJoxlOOJS67OZaiHkH8BuEg95g2TU9dCjLIAalDKm+AQutWp+bEp44sCm9pt
 FHOw==
X-Gm-Message-State: ACrzQf2WsyAMycBKXga4AEqTzbOIH8TIn20196m7jMKHNubKiZN9b26z
 /aGSJUwFV90uANxiG3gdcdpImw==
X-Google-Smtp-Source: AMsMyM4B0EZILxcPnAQbOkxykN73ylQ6M3LrgIV08v+YqYBf7fqUPs3LPywshJ47WQK53xp2GzecdQ==
X-Received: by 2002:a17:90b:3b91:b0:202:91d7:6a5d with SMTP id
 pc17-20020a17090b3b9100b0020291d76a5dmr3386239pjb.101.1664632629860; 
 Sat, 01 Oct 2022 06:57:09 -0700 (PDT)
Received: from ThinkPad-T490 ([182.70.42.58]) by smtp.gmail.com with ESMTPSA id
 d4-20020a170902cec400b0017bb38e4588sm1230697plg.135.2022.10.01.06.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 06:57:08 -0700 (PDT)
Message-ID: <57e1d1e600ef6d6adb3b3672a272e565993cfdd2.camel@ventanamicro.com>
Subject: Re: [PATCH v9 1/4] target/riscv: Add smstateen support
From: mchitale@ventanamicro.com
To: Alistair Francis <alistair23@gmail.com>, weiwei <liweiwei@iscas.ac.cn>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>, Alistair Francis
 <alistair.francis@wdc.com>
Date: Sat, 01 Oct 2022 19:27:02 +0530
In-Reply-To: <CAKmqyKO3UFDgFuGjae_vi=4BUw7weRAy0iqiuvow4CEBSRWHYA@mail.gmail.com>
References: <20220919062908.643945-1-mchitale@ventanamicro.com>
 <20220919062908.643945-2-mchitale@ventanamicro.com>
 <5d3b9e2d-ab2f-68ae-4218-944f6db102cb@iscas.ac.cn>
 <CAKmqyKO3UFDgFuGjae_vi=4BUw7weRAy0iqiuvow4CEBSRWHYA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 2022-09-29 at 11:43 +1000, Alistair Francis wrote:
> On Thu, Sep 29, 2022 at 10:58 AM weiwei <liweiwei@iscas.ac.cn> wrote:
> > 
> > On 2022/9/19 14:29, Mayuresh Chitale wrote:
> > > Smstateen extension specifies a mechanism to close
> > > the potential covert channels that could cause security issues.
> > > 
> > > This patch adds the CSRs defined in the specification and
> > > the corresponding predicates and read/write functions.
> > > 
> > > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > > ---
> > >   target/riscv/cpu.h      |   4 +
> > >   target/riscv/cpu_bits.h |  37 ++++
> > >   target/riscv/csr.c      | 373
> > > ++++++++++++++++++++++++++++++++++++++++
> > >   target/riscv/machine.c  |  21 +++
> > >   4 files changed, 435 insertions(+)
> > > 
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index 06751e1e3e..e407abbf93 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -362,6 +362,9 @@ struct CPUArchState {
> > > 
> > >       /* CSRs for execution enviornment configuration */
> > >       uint64_t menvcfg;
> > > +    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
> > > +    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
> > > +    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
> > >       target_ulong senvcfg;
> > >       uint64_t henvcfg;
> > >   #endif
> > > @@ -437,6 +440,7 @@ struct RISCVCPUConfig {
> > >       bool ext_ifencei;
> > >       bool ext_icsr;
> > >       bool ext_zihintpause;
> > > +    bool ext_smstateen;
> > >       bool ext_sstc;
> > >       bool ext_svinval;
> > >       bool ext_svnapot;
> > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > index 7be12cac2e..9a3321e27c 100644
> > > --- a/target/riscv/cpu_bits.h
> > > +++ b/target/riscv/cpu_bits.h
> > > @@ -199,6 +199,12 @@
> > >   /* Supervisor Configuration CSRs */
> > >   #define CSR_SENVCFG         0x10A
> > > 
> > > +/* Supervisor state CSRs */
> > > +#define CSR_SSTATEEN0       0x10C
> > > +#define CSR_SSTATEEN1       0x10D
> > > +#define CSR_SSTATEEN2       0x10E
> > > +#define CSR_SSTATEEN3       0x10F
> > > +
> > >   /* Supervisor Trap Handling */
> > >   #define CSR_SSCRATCH        0x140
> > >   #define CSR_SEPC            0x141
> > > @@ -246,6 +252,16 @@
> > >   #define CSR_HENVCFG         0x60A
> > >   #define CSR_HENVCFGH        0x61A
> > > 
> > > +/* Hypervisor state CSRs */
> > > +#define CSR_HSTATEEN0       0x60C
> > > +#define CSR_HSTATEEN0H      0x61C
> > > +#define CSR_HSTATEEN1       0x60D
> > > +#define CSR_HSTATEEN1H      0x61D
> > > +#define CSR_HSTATEEN2       0x60E
> > > +#define CSR_HSTATEEN2H      0x61E
> > > +#define CSR_HSTATEEN3       0x60F
> > > +#define CSR_HSTATEEN3H      0x61F
> > > +
> > >   /* Virtual CSRs */
> > >   #define CSR_VSSTATUS        0x200
> > >   #define CSR_VSIE            0x204
> > > @@ -291,6 +307,27 @@
> > >   #define CSR_MENVCFG         0x30A
> > >   #define CSR_MENVCFGH        0x31A
> > > 
> > > +/* Machine state CSRs */
> > > +#define CSR_MSTATEEN0       0x30C
> > > +#define CSR_MSTATEEN0H      0x31C
> > > +#define CSR_MSTATEEN1       0x30D
> > > +#define CSR_MSTATEEN1H      0x31D
> > > +#define CSR_MSTATEEN2       0x30E
> > > +#define CSR_MSTATEEN2H      0x31E
> > > +#define CSR_MSTATEEN3       0x30F
> > > +#define CSR_MSTATEEN3H      0x31F
> > > +
> > > +/* Common defines for all smstateen */
> > > +#define SMSTATEEN_MAX_COUNT 4
> > > +#define SMSTATEEN0_CS       (1ULL << 0)
> > > +#define SMSTATEEN0_FCSR     (1ULL << 1)
> > > +#define SMSTATEEN0_HSCONTXT (1ULL << 57)
> > > +#define SMSTATEEN0_IMSIC    (1ULL << 58)
> > > +#define SMSTATEEN0_AIA      (1ULL << 59)
> > > +#define SMSTATEEN0_SVSLCT   (1ULL << 60)
> > > +#define SMSTATEEN0_HSENVCFG (1ULL << 62)
> > > +#define SMSTATEEN_STATEEN   (1ULL << 63)
> > > +
> > >   /* Enhanced Physical Memory Protection (ePMP) */
> > >   #define CSR_MSECCFG         0x747
> > >   #define CSR_MSECCFGH        0x757
> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > index b96db1b62b..bbfdd49abd 100644
> > > --- a/target/riscv/csr.c
> > > +++ b/target/riscv/csr.c
> > > @@ -278,6 +278,72 @@ static RISCVException umode32(CPURISCVState
> > > *env, int csrno)
> > >       return umode(env, csrno);
> > >   }
> > > 
> > > +static RISCVException mstateen(CPURISCVState *env, int csrno)
> > > +{
> > > +    CPUState *cs = env_cpu(env);
> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > +
> > > +    if (!cpu->cfg.ext_smstateen) {
> > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > +    }
> > > +
> > > +    return any(env, csrno);
> > > +}
> > > +
> > > +static RISCVException hstateen_pred(CPURISCVState *env, int
> > > csrno, int base)
> > > +{
> > > +    CPUState *cs = env_cpu(env);
> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > +
> > > +    if (!cpu->cfg.ext_smstateen) {
> > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > +    }
> > > +
> > > +    if (env->priv < PRV_M) {
> > > +        if (!(env->mstateen[csrno - base] & SMSTATEEN_STATEEN))
> > > {
> > > +            return RISCV_EXCP_ILLEGAL_INST;
> > > +        }
> > > +    }
> > > +
> > > +    return hmode(env, csrno);
> > > +}
> > > +
> > > +static RISCVException hstateen(CPURISCVState *env, int csrno)
> > > +{
> > > +    return hstateen_pred(env, csrno, CSR_HSTATEEN0);
> > > +}
> > > +
> > > +static RISCVException hstateenh(CPURISCVState *env, int csrno)
> > > +{
> > > +    return hstateen_pred(env, csrno, CSR_HSTATEEN0H);
> > > +}
> > > +
> > > +static RISCVException sstateen(CPURISCVState *env, int csrno)
> > > +{
> > > +    bool virt = riscv_cpu_virt_enabled(env);
> > > +    int index = csrno - CSR_SSTATEEN0;
> > > +    CPUState *cs = env_cpu(env);
> > > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > > +
> > > +    if (!cpu->cfg.ext_smstateen) {
> > > +        return RISCV_EXCP_ILLEGAL_INST;
> > > +    }
> > > +
> > > +    if (env->priv < PRV_M) {
> > > +        if (!(env->mstateen[index] & SMSTATEEN_STATEEN)) {
> > > +            return RISCV_EXCP_ILLEGAL_INST;
> > > +        }
> > > +
> > > +        if (virt) {
> > > +            if (!(env->hstateen[index] & SMSTATEEN_STATEEN)) {
> > > +                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > > +            }
> > > +        }
> > > +    }
> > > +
> > > +    return smode(env, csrno);
> > > +}
> > > +
> > >   /* Checks if PointerMasking registers could be accessed */
> > >   static RISCVException pointer_masking(CPURISCVState *env, int
> > > csrno)
> > >   {
> > > @@ -1856,6 +1922,263 @@ static RISCVException
> > > write_henvcfgh(CPURISCVState *env, int csrno,
> > >       return RISCV_EXCP_NONE;
> > >   }
> > > 
> > > +static inline void write_smstateen(CPURISCVState *env, uint64_t
> > > *reg,
> > > +                                   uint64_t wr_mask, uint64_t
> > > new_val)
> > > +{
> > > +    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
> > > +}
> > > +
> > > +static RISCVException read_mstateen(CPURISCVState *env, int
> > > csrno,
> > > +                                    target_ulong *val)
> > > +{
> > > +    *val = env->mstateen[csrno - CSR_MSTATEEN0];
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_mstateen(CPURISCVState *env, int
> > > csrno,
> > > +                                     uint64_t wr_mask,
> > > target_ulong new_val)
> > > +{
> > > +    uint64_t *reg;
> > > +
> > > +    reg = &env->mstateen[csrno - CSR_MSTATEEN0];
> > > +    write_smstateen(env, reg, wr_mask, new_val);
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_mstateen0(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    uint64_t wr_mask = SMSTATEEN_STATEEN;
> > > +
> > > +    return write_mstateen(env, csrno, wr_mask, new_val);
> > > +}
> > > +
> > > +static RISCVException write_mstateen1(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_mstateen(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException write_mstateen2(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_mstateen(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException write_mstateen3(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_mstateen(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > 
> > I still prefer mstateen1~3 to share the same read/write function
> > currently.
> 
> Yeah, I agree. This is a lot of functions that are all pretty much
> the same.
> 
> I'm not sure we need the write_smstateen() function either, I'm not
> sure it really gets us a lot.
> 
> Alistair

Ok. I will send the updated patch.
> 
> > If you  insist on distinguishing them, I think it's better to pass
> > index
> > directly  than pass csrno to calculate index.
> > 
> > The same to following similar cases.
> > 
> > Otherwise,
> > 
> > Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> > 
> > Regards,
> > 
> > Weiwei Li
> > 
> > > +
> > > +static RISCVException read_mstateenh(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong *val)
> > > +{
> > > +    *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_mstateenh(CPURISCVState *env, int
> > > csrno,
> > > +                                      uint64_t wr_mask,
> > > target_ulong new_val)
> > > +{
> > > +    uint64_t *reg, val;
> > > +
> > > +    reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
> > > +    val = (uint64_t)new_val << 32;
> > > +    val |= *reg & 0xFFFFFFFF;
> > > +    write_smstateen(env, reg, wr_mask, val);
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_mstateen0h(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    uint64_t wr_mask = SMSTATEEN_STATEEN;
> > > +
> > > +    return write_mstateenh(env, csrno, wr_mask, new_val);
> > > +}
> > > +
> > > +static RISCVException write_mstateen1h(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_mstateenh(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException write_mstateen2h(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_mstateenh(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException write_mstateen3h(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_mstateenh(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException read_hstateen(CPURISCVState *env, int
> > > csrno,
> > > +                                    target_ulong *val)
> > > +{
> > > +    int index = csrno - CSR_HSTATEEN0;
> > > +
> > > +    *val = env->hstateen[index] & env->mstateen[index];
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_hstateen(CPURISCVState *env, int
> > > csrno,
> > > +                                     uint64_t mask, target_ulong
> > > new_val)
> > > +{
> > > +    int index = csrno - CSR_HSTATEEN0;
> > > +    uint64_t *reg, wr_mask;
> > > +
> > > +    reg = &env->hstateen[index];
> > > +    wr_mask = env->mstateen[index] & mask;
> > > +    write_smstateen(env, reg, wr_mask, new_val);
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_hstateen0(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    uint64_t wr_mask = SMSTATEEN_STATEEN;
> > > +
> > > +    return write_hstateen(env, csrno, wr_mask, new_val);
> > > +}
> > > +
> > > +static RISCVException write_hstateen1(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_hstateen(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException write_hstateen2(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_hstateen(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException write_hstateen3(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_hstateen(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException read_hstateenh(CPURISCVState *env, int
> > > csrno,
> > > +                                     target_ulong *val)
> > > +{
> > > +    int index = csrno - CSR_HSTATEEN0H;
> > > +
> > > +    *val = (env->hstateen[index] >> 32) & (env->mstateen[index]
> > > >> 32);
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_hstateenh(CPURISCVState *env, int
> > > csrno,
> > > +                                      uint64_t mask,
> > > target_ulong new_val)
> > > +{
> > > +    int index = csrno - CSR_HSTATEEN0H;
> > > +    uint64_t *reg, wr_mask, val;
> > > +
> > > +    reg = &env->hstateen[index];
> > > +    val = (uint64_t)new_val << 32;
> > > +    val |= *reg & 0xFFFFFFFF;
> > > +    wr_mask = env->mstateen[index] & mask;
> > > +    write_smstateen(env, reg, wr_mask, val);
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_hstateen0h(CPURISCVState *env, int
> > > csrno,
> > > +                                       target_ulong new_val)
> > > +{
> > > +    uint64_t wr_mask = SMSTATEEN_STATEEN;
> > > +
> > > +    return write_hstateenh(env, csrno, wr_mask, new_val);
> > > +}
> > > +
> > > +static RISCVException write_hstateen1h(CPURISCVState *env, int
> > > csrno,
> > > +                                       target_ulong new_val)
> > > +{
> > > +    return write_hstateenh(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException write_hstateen2h(CPURISCVState *env, int
> > > csrno,
> > > +                                       target_ulong new_val)
> > > +{
> > > +    return write_hstateenh(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException write_hstateen3h(CPURISCVState *env, int
> > > csrno,
> > > +                                       target_ulong new_val)
> > > +{
> > > +    return write_hstateenh(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException read_sstateen(CPURISCVState *env, int
> > > csrno,
> > > +                                    target_ulong *val)
> > > +{
> > > +    bool virt = riscv_cpu_virt_enabled(env);
> > > +    int index = csrno - CSR_SSTATEEN0;
> > > +
> > > +    *val = env->sstateen[index] & env->mstateen[index];
> > > +    if (virt) {
> > > +        *val &= env->hstateen[index];
> > > +    }
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_sstateen(CPURISCVState *env, int
> > > csrno,
> > > +                                     uint64_t mask, target_ulong
> > > new_val)
> > > +{
> > > +    bool virt = riscv_cpu_virt_enabled(env);
> > > +    int index = csrno - CSR_SSTATEEN0;
> > > +    uint64_t wr_mask;
> > > +    uint64_t *reg;
> > > +
> > > +    wr_mask = env->mstateen[index] & mask;
> > > +    if (virt) {
> > > +        wr_mask &= env->hstateen[index];
> > > +    }
> > > +
> > > +    reg = &env->sstateen[index];
> > > +    write_smstateen(env, reg, wr_mask, new_val);
> > > +
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_sstateen0(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    uint64_t wr_mask = SMSTATEEN_STATEEN;
> > > +
> > > +    return write_sstateen(env, csrno, wr_mask, new_val);
> > > +}
> > > +
> > > +static RISCVException write_sstateen1(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_sstateen(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException write_sstateen2(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_sstateen(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > > +static RISCVException write_sstateen3(CPURISCVState *env, int
> > > csrno,
> > > +                                      target_ulong new_val)
> > > +{
> > > +    return write_sstateen(env, csrno, SMSTATEEN_STATEEN,
> > > new_val);
> > > +}
> > > +
> > >   static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
> > >                                   uint64_t *ret_val,
> > >                                   uint64_t new_val, uint64_t
> > > wr_mask)
> > > @@ -3732,6 +4055,56 @@ riscv_csr_operations
> > > csr_ops[CSR_TABLE_SIZE] = {
> > >       [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh,
> > > write_henvcfgh,
> > >                          .min_priv_ver =
> > > PRIV_VERSION_1_12_0              },
> > > 
> > > +    /* Smstateen extension CSRs */
> > > +    [CSR_MSTATEEN0] = { "mstateen0", mstateen, read_mstateen,
> > > write_mstateen0,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_MSTATEEN0H] = { "mstateen0h", mstateen, read_mstateenh,
> > > +                          write_mstateen0h,
> > > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_MSTATEEN1] = { "mstateen1", mstateen, read_mstateen,
> > > write_mstateen1,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_MSTATEEN1H] = { "mstateen1h", mstateen, read_mstateenh,
> > > +                          write_mstateen1h,
> > > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_MSTATEEN2] = { "mstateen2", mstateen, read_mstateen,
> > > write_mstateen2,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_MSTATEEN2H] = { "mstateen2h", mstateen, read_mstateenh,
> > > +                          write_mstateen2h,
> > > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_MSTATEEN3] = { "mstateen3", mstateen, read_mstateen,
> > > write_mstateen3,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_MSTATEEN3H] = { "mstateen3h", mstateen, read_mstateenh,
> > > +                          write_mstateen3h,
> > > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_HSTATEEN0] = { "hstateen0", hstateen, read_hstateen,
> > > write_hstateen0,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_HSTATEEN0H] = { "hstateen0h", hstateenh,
> > > read_hstateenh,
> > > +                          write_hstateen0h,
> > > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_HSTATEEN1] = { "hstateen1", hstateen, read_hstateen,
> > > write_hstateen1,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_HSTATEEN1H] = { "hstateen1h", hstateenh,
> > > read_hstateenh,
> > > +                          write_hstateen1h,
> > > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_HSTATEEN2] = { "hstateen2", hstateen, read_hstateen,
> > > write_hstateen2,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_HSTATEEN2H] = { "hstateen2h", hstateenh,
> > > read_hstateenh,
> > > +                          write_hstateen2h,
> > > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_HSTATEEN3] = { "hstateen3", hstateen, read_hstateen,
> > > write_hstateen3,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_HSTATEEN3H] = { "hstateen3h", hstateenh,
> > > read_hstateenh,
> > > +                          write_hstateen3h,
> > > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_SSTATEEN0] = { "sstateen0", sstateen, read_sstateen,
> > > write_sstateen0,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_SSTATEEN1] = { "sstateen1", sstateen, read_sstateen,
> > > write_sstateen1,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_SSTATEEN2] = { "sstateen2", sstateen, read_sstateen,
> > > write_sstateen2,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +    [CSR_SSTATEEN3] = { "sstateen3", sstateen, read_sstateen,
> > > write_sstateen3,
> > > +                        .min_priv_ver = PRIV_VERSION_1_12_0 },
> > > +
> > >       /* Supervisor Trap Setup */
> > >       [CSR_SSTATUS]    = { "sstatus",    smode,
> > > read_sstatus,    write_sstatus,
> > >                            NULL,                read_sstatus_i128
> > >                },
> > > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > > index 41098f6ad0..18e47f3764 100644
> > > --- a/target/riscv/machine.c
> > > +++ b/target/riscv/machine.c
> > > @@ -263,6 +263,26 @@ static int riscv_cpu_post_load(void *opaque,
> > > int version_id)
> > >       return 0;
> > >   }
> > > 
> > > +static bool smstateen_needed(void *opaque)
> > > +{
> > > +    RISCVCPU *cpu = opaque;
> > > +
> > > +    return cpu->cfg.ext_smstateen;
> > > +}
> > > +
> > > +static const VMStateDescription vmstate_smstateen = {
> > > +    .name = "cpu/smtateen",
> > > +    .version_id = 1,
> > > +    .minimum_version_id = 1,
> > > +    .needed = smstateen_needed,
> > > +    .fields = (VMStateField[]) {
> > > +        VMSTATE_UINT64_ARRAY(env.mstateen, RISCVCPU, 4),
> > > +        VMSTATE_UINT64_ARRAY(env.hstateen, RISCVCPU, 4),
> > > +        VMSTATE_UINT64_ARRAY(env.sstateen, RISCVCPU, 4),
> > > +        VMSTATE_END_OF_LIST()
> > > +    }
> > > +};
> > > +
> > >   static bool envcfg_needed(void *opaque)
> > >   {
> > >       RISCVCPU *cpu = opaque;
> > > @@ -374,6 +394,7 @@ const VMStateDescription vmstate_riscv_cpu =
> > > {
> > >           &vmstate_kvmtimer,
> > >           &vmstate_envcfg,
> > >           &vmstate_debug,
> > > +        &vmstate_smstateen,
> > >           NULL
> > >       }
> > >   };


