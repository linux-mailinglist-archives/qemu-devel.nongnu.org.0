Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBCC46B88D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:13:22 +0100 (CET)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXTN-0002hm-3U
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:13:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1muXPC-0005aL-SZ
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:09:02 -0500
Received: from [2a00:1450:4864:20::42c] (port=38749
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1muXPB-0003Bo-8q
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:09:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q3so28334206wru.5
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 02:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8MZEczad7TrkxfpuAcU2gPQugacmN72JMORCufPCdxI=;
 b=bCw+qqgh20M5JrbazDLWp7cqLzkE8PtTvaJrYzwk4Sw8Y4UAZ/OgeHXN0KTfWKwCL/
 6wKTf9dP7vp+U69UgNCv/tDEuDorBtbbtOvCzkq3usFVvK/GVtL5xPlTVjGcvmJeFBrx
 KwoiqgTlJVXVRmUEbDSButOMrMtS7Q8CAsRRWPt/1fl+oTgTTvUnSJCiMC3xHKGPSazy
 RfGSbgs2bU9VRil+F5R7zFvqaniPhPp5WAAX8Ik8WX6XlTQXRnB9JkTzfIaSXFStbV3r
 5mUuTSDHTaP54KTtOqekza3q0dHAXuM5nbTbVqDAMZUJzvMRh6w8eaOSLmL45JswrEit
 5klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8MZEczad7TrkxfpuAcU2gPQugacmN72JMORCufPCdxI=;
 b=ksfhPWsW0aZAli1mUEimgSSpYUBJXk/x/OE0wZXre3eAhADO1pP6spvfOs5W1sp5wD
 VP/b4v6+JSLHEHbRHeXSueETaWDRB6GuWdNz6aeRnp/swZ3gu8RubSvFa/U65FzJY6ub
 Y893IU+AB2axK+2n9/OUIUrcY2EM4bPT4FQ0GpOd3IKFw+e4oxtjJ0qLlysaQXuGSj/H
 8YB+9s99iv0Ui5w81Y4bxCEvEQlKKWMoMfEkOpSHTwCHlJTahagUnCh3f2MsRzo0nweL
 V9aMSOpCvdrHRJlpL1lN21M5RYrya8uBq/3O0EnIdZK1WuuEdxGadZ0hKi3jjorX+llB
 bqzg==
X-Gm-Message-State: AOAM530iBnc2ztuq2feFfdSruTjkJNWRIgNq0pJv0wel2iktpWVb01/i
 CwnZOmi+SJvRuiNjiQrKxiW+dM+VmCsPkpD5y6lMXA==
X-Google-Smtp-Source: ABdhPJyfYpobDQ+zcZjXkax34+OZAR6UMrK09k3PqHM0sXgoCLbn3MbVOJyEMWxpwSrE9nIKTWFzCCGsJxE4Ih09S0Q=
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr49559165wrs.222.1638871738891; 
 Tue, 07 Dec 2021 02:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-9-anup.patel@wdc.com>
 <CAKmqyKOQm1Cz39vmaz0McP6OD=GoOptL0BxC+z6bzFwUCnx0pQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOQm1Cz39vmaz0McP6OD=GoOptL0BxC+z6bzFwUCnx0pQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Dec 2021 15:38:47 +0530
Message-ID: <CAAhSdy2FzJXxXVi2jrDWcpioaZ5msm5zs3fOtFReXoSDo-fM5g@mail.gmail.com>
Subject: Re: [PATCH v4 08/22] target/riscv: Allow AIA device emulation to set
 ireg rmw callback
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42c;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 4, 2021 at 10:23 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Oct 26, 2021 at 6:00 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The AIA device emulation (such as AIA IMSIC) should be able to set
> > (or provide) AIA ireg read-modify-write callback for each privilege
> > level of a RISC-V HART.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/cpu.h        | 19 +++++++++++++++++++
> >  target/riscv/cpu_helper.c | 14 ++++++++++++++
> >  2 files changed, 33 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 7182fadd21..ef4298dc69 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -239,6 +239,18 @@ struct CPURISCVState {
> >      uint64_t (*rdtime_fn)(uint32_t);
> >      uint32_t rdtime_fn_arg;
> >
> > +    /* machine specific AIA ireg read-modify-write callback */
> > +#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein) \
> > +    ((((__vgein) & 0x3f) << 24) | (((__virt) & 0x1) << 20) | \
> > +     (((__priv) & 0x3) << 16) | (__isel & 0xffff))
> > +#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
> > +#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
> > +#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 20) & 0x1)
> > +#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 24) & 0x3f)
>
> These should be added when they are used

Actually, these define help us encode/decode AIA indirect register number
passed as "reg" parameter to aia_ireg_rmw_fn() below.

Regards,
Anup

>
> Alistair
>
> > +    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
> > +        target_ulong *val, target_ulong new_val, target_ulong write_mask);
> > +    void *aia_ireg_rmw_fn_arg[4];
> > +
> >      /* True if in debugger mode.  */
> >      bool debugger;
> >  #endif
> > @@ -380,6 +392,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
> >  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
> >  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
> >                               uint32_t arg);
> > +void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
> > +                                   int (*rmw_fn)(void *arg,
> > +                                                 target_ulong reg,
> > +                                                 target_ulong *val,
> > +                                                 target_ulong new_val,
> > +                                                 target_ulong write_mask),
> > +                                   void *rmw_fn_arg);
> >  #endif
> >  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 04df3792a8..d70def1da8 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -375,6 +375,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
> >      env->rdtime_fn_arg = arg;
> >  }
> >
> > +void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
> > +                                   int (*rmw_fn)(void *arg,
> > +                                                 target_ulong reg,
> > +                                                 target_ulong *val,
> > +                                                 target_ulong new_val,
> > +                                                 target_ulong write_mask),
> > +                                   void *rmw_fn_arg)
> > +{
> > +    if (priv <= PRV_M) {
> > +        env->aia_ireg_rmw_fn[priv] = rmw_fn;
> > +        env->aia_ireg_rmw_fn_arg[priv] = rmw_fn_arg;
> > +    }
> > +}
> > +
> >  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
> >  {
> >      if (newpriv > PRV_M) {
> > --
> > 2.25.1
> >
> >

