Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40B47CF1F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 10:23:14 +0100 (CET)
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzxq5-0000Pk-6n
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 04:23:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mzxon-000832-As
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 04:21:53 -0500
Received: from [2a00:1450:4864:20::42d] (port=33283
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mzxol-0002ER-7d
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 04:21:52 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d9so3666874wrb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 01:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CdpsWbpmfVOm1srHfBrUthHDr/pq8aMO9TIQNY/fLlY=;
 b=cJRJM+DiK1rz5NB/qVhgxgUzZl1qmDxq7Tg/hwPpbLyiXeEnX+P67DyTR4YT+G5yO6
 zUDnO4ComvRkCu1ZDAdy4A1i1JCdjmFRRNRbCRomvCd3KdxlSO6y1Uo5ROLeczHDtv9+
 ++1ANXRuqMDxWR/IxmfOxfaz1b9NesRK6b8VW/DQkrvo9ljIE9MAgb5J6eAsRrRrhMxi
 KVMz/smVYxjbKmD6iOPSRbqJ6AfJjNX9kHpGLk3HefJHUNrCe4tFJbO2/NRt8kjDpJU0
 XI/Jn2/CwzBD8Q/K+0vy1KaFYl+ZhYnC/raT2oFcdGnCd+9LbGALy3WQWj84DIlfMrHM
 u+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CdpsWbpmfVOm1srHfBrUthHDr/pq8aMO9TIQNY/fLlY=;
 b=qno7E0tKdSthJw8r6lY+H51h1twWY0PkKObuLahqAOTbCCjWDsHbbMlG43GYFL0KkD
 T1YzttrISX0+C0I2aEkzE8QcQXDQZ/0HLRAMQtQEoa9yAUBRzpp+jOvUw4CjhR5LBLUn
 mFjp6pq+GGH+5zxl6CHZTcoMfMiGSPtwUMVwoOmk2rMyVC7rnmzZ1CVJaHMcEXpPof6R
 P4JhuF32T6I3eqfgGbF/Qlr2UQa2nmevaUOeX6SE3NJDGDqucbJ/Vx9WqqS8pogbfusu
 hv9CwwGQocMjblw/ETTs0C6f25NHW9Cugs/tFv8I2LbtkHRhRwV3/vtoITDBiA29S6G6
 qngw==
X-Gm-Message-State: AOAM532bNvmU2mSCWe1Y4mxXNmDqzGkz9xznJPyjVl2i0Eimlw2y+s9m
 peLkpGloRBz5n7kixibS637l4qrMtPgbOZTAZGVjRA==
X-Google-Smtp-Source: ABdhPJzlEo9yWtrHfOUTwlmMPmriT19osxSDv2x+Rgq7z0ACImykp0UIbHfOVSEYP2sebLqca7Ksfo19vuC9RN7ccBU=
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr1483467wrn.690.1640164909026; 
 Wed, 22 Dec 2021 01:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20211211041917.135345-1-anup.patel@wdc.com>
 <20211211041917.135345-14-anup.patel@wdc.com>
 <CAKmqyKNTF7mQP-oxeWL94XgywQGehSL6y6U_JJws9wOkT8dUPg@mail.gmail.com>
In-Reply-To: <CAKmqyKNTF7mQP-oxeWL94XgywQGehSL6y6U_JJws9wOkT8dUPg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 22 Dec 2021 14:51:37 +0530
Message-ID: <CAAhSdy04d5hbFLArjkZiyc4M58bXtbj5ezR25SB697M3yhUfcg@mail.gmail.com>
Subject: Re: [PATCH v5 13/23] target/riscv: Implement AIA mtopi, stopi, and
 vstopi CSRs
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42d;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 12:18 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Dec 11, 2021 at 2:34 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The AIA specification introduces new [m|s|vs]topi CSRs for
> > reporting pending local IRQ number and associated IRQ priority.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/csr.c | 155 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 155 insertions(+)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 4b3edc1043..6f613d182d 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -189,6 +189,15 @@ static int smode32(CPURISCVState *env, int csrno)
> >      return smode(env, csrno);
> >  }
> >
> > +static int aia_smode(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return smode(env, csrno);
> > +}
> > +
> >  static int aia_smode32(CPURISCVState *env, int csrno)
> >  {
> >      if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > @@ -833,6 +842,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
> >      return ret;
> >  }
> >
> > +static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    int irq;
> > +    uint8_t iprio;
> > +
> > +    irq = riscv_cpu_mirq_pending(env);
> > +    if (irq <= 0 || irq > 63) {
> > +       *val = 0;
> > +    } else {
> > +       iprio = env->miprio[irq];
> > +       if (!iprio) {
> > +           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_M) {
> > +               iprio = IPRIO_MMAXIPRIO;
> > +           }
> > +       }
> > +       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> > +       *val |= iprio;
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
> >                                   target_ulong *val)
> >  {
> > @@ -1362,6 +1393,121 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    int irq, ret;
> > +    target_ulong topei;
> > +    uint64_t vseip, vsgein;
> > +    uint32_t iid, iprio, hviid, hviprio, gein;
> > +#define VSTOPI_NUM_SRCS 5
>
> This should be defined at the top of the file.

Okay, I will update.

Regards,
Anup

>
> Alistair

