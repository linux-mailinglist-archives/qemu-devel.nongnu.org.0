Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7C46779F5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 12:16:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJuna-0006Ul-Gm; Mon, 23 Jan 2023 06:15:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pJunM-0006SM-36
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 06:15:25 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pJunJ-0000eC-Sd
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 06:15:23 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n7so10441037wrx.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 03:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I4iyZij1GOgkgv+ODM4VNeORqp8b+qBDsCSiugb6yB0=;
 b=IAS5ye4RabLcbLlnu1oaQ+h9Kfm9uxcrBXk2h9+DweOcB3stiyzQsvO6PvVxne0BqX
 lFEVxeLav4kCf98wC6hUzH22jPgSmLb+DCzIQTXjbYSUxEbT6Z+BQJTiwvLWH2R3oW0J
 5OPNqC9iF3jKy1emlrM+moW4NOiix7DRppMg+ILQ3btSnKXXKIzAZAzO9jGvO1YZL8MC
 MDp5OB+5z01PQf69K1B7nK/cuesC1AGSTJXn/JuEUSb35IllJkKcHZ2h/cA4l07dTWbF
 qimOhDCVK/TNAKg8LfBvrALpUoHVp528vErxhswA3Vi1grYg72AfSYMTZDTy9ajvtLmg
 262g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I4iyZij1GOgkgv+ODM4VNeORqp8b+qBDsCSiugb6yB0=;
 b=RaK75E5kQ5LUpkIO3ZYAg3ENoQRMSv7fQZZVBRM+wtWuEZGf3MhuxZPbi2m6WnaLij
 xuM91QMwr3+5VDN1/dzw/HHrgTZkCHF8DFqN3wffZCDgY/0X8mHBZfl16ZcCvsdYA00N
 TWYDuEfGiDiRr6S0V+oN2Z40U5hwNMd0zG7QfQTqEVrIaoupMo0xhTIcm4B3omTWMhaT
 phyn/Pm/a+VGKmVCaiNtC2h7m3KRecw/RCgdewNR+n+OhqQYMGUKkpmcSYWcRj5hPNJL
 100jM5qJzWVWnTywSXlFRDdvC5FSbBeLyj4SGJ9FuRnv4UWkP4tU0Gmo6CwuY9WFnuTE
 ROuw==
X-Gm-Message-State: AFqh2krtWfnZ0eqt16BsJKHEXtDx3II/CAnwpVM4v69Xq4HwB70ilvK3
 U5w41ao/hEU1qkmf38PfO88Zt/fmrWvMJI8GRFaFTA==
X-Google-Smtp-Source: AMrXdXuAxty8SYB9+X0IEXIu2ZtUdFqJWlLycRWIGphwVqP+xm7UiqT6w8GeSlXJIkkCpRKzt8rLFh9wQpSq70KgdbY=
X-Received: by 2002:a5d:5190:0:b0:2bd:d6bc:e35c with SMTP id
 k16-20020a5d5190000000b002bdd6bce35cmr1056204wrv.144.1674472519667; Mon, 23
 Jan 2023 03:15:19 -0800 (PST)
MIME-Version: 1.0
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-6-alexghiti@rivosinc.com>
 <20230123105112.zidabgiswkpnzo5r@orel>
In-Reply-To: <20230123105112.zidabgiswkpnzo5r@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 23 Jan 2023 12:15:08 +0100
Message-ID: <CAHVXubg77ywMLWh=JOmdhWA=pYeQ5nLAif_9VhRmkcpD6wKZng@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] riscv: Introduce satp mode hw capabilities
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 23, 2023 at 11:51 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jan 23, 2023 at 10:03:24AM +0100, Alexandre Ghiti wrote:
> > Currently, the max satp mode is set with the only constraint that it must be
> > implemented in qemu, i.e. set in valid_vm_1_10_[32|64].
> >
> > But we actually need to add another level of constraint: what the hw is
> > actually capable of, because currently, a linux booting on a sifive-u54
> > boots in sv57 mode which is incompatible with the cpu's sv39 max
> > capability.
> >
> > So add a new bitmap to RISCVSATPMap which contains this capability and
> > initialize it in every XXX_cpu_init.
> >
> > Finally, we have the following chain of constraints:
> >
> > Qemu capability > HW capability > User choice > Software capability
>
>                                                   ^ What software is this?
>                          I'd think the user's choice would always be last.
>
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  target/riscv/cpu.c | 78 +++++++++++++++++++++++++++++++---------------
> >  target/riscv/cpu.h |  8 +++--
> >  2 files changed, 59 insertions(+), 27 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index e409e6ab64..19a37fee2b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -292,24 +292,39 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
> >      g_assert_not_reached();
> >  }
> >
> > -/* Sets the satp mode to the max supported */
> > -static void set_satp_mode_default(RISCVCPU *cpu, bool is_32_bit)
> > +static void set_satp_mode_max_supported(RISCVCPU *cpu,
> > +                                        const char *satp_mode_str,
> > +                                        bool is_32_bit)
> >  {
> > -    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> > -        cpu->cfg.satp_mode.map |=
> > -                        (1 << satp_mode_from_str(is_32_bit ? "sv32" : "sv57"));
> > -    } else {
> > -        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> > +    uint8_t satp_mode = satp_mode_from_str(satp_mode_str);
> > +    const bool *valid_vm = is_32_bit ? valid_vm_1_10_32 : valid_vm_1_10_64;
> > +
> > +    for (int i = 0; i <= satp_mode; ++i) {
> > +        if (valid_vm[i]) {
> > +            cpu->cfg.satp_mode.supported |= (1 << i);
>
> I don't think we need a new 'supported' bitmap, I think each board that
> needs to further constrain va-bits from what QEMU supports should just set
> valid_vm_1_10_32/64. I.e. drop const from the arrays and add an init
> function something like

This was my first idea too, but those arrays are global and I have to
admit that I thought it was possible to emulate a cpu with different
cores. Anyway, isn't it a bit weird to store this into some global
array whereas it is intimately linked to the CPU? To me, it makes
sense to keep those variables as a way to know what qemu is able to
emulate and have a CPU specific map like in this patch for the hw
capabilities. Does it make sense to you?

>
>  #define QEMU_SATP_MODE_MAX VM_1_10_SV64
>
>  void riscv_cpu_set_satp_mode_max(RISCVCPU *cpu, uint8_t satp_mode_max)
>  {
>      bool is_32_bit = cpu->env.misa_mxl == MXL_RV32;
>      bool *valid_vm = is_32_bit ? valid_vm_1_10_32 : valid_vm_1_10_64;
>
>      g_assert(satp_mode_max <= QEMU_SATP_MODE_MAX);
>      g_assert(!is_32_bit || satp_mode_max < 2);
>
>      memset(valid_vm, 0, sizeof(*valid_vm));
>
>      for (int i = 0; i <= satp_mode_max; i++) {
>          valid_vm[i] = true;
>      }
>  }
>
> The valid_vm[] checks already in finalize should then manage the
> validation needed to constrain boards. Only boards that care about
> this need to call this function, otherwise they'll get the default.
>
> Also, this patch should come before the patch that changes the default
> for all boards to sv57 in order to avoid breaking bisection.

As I explained earlier, I didn't change the default to sv57! Just
fixed what was passed via the device tree, which should not be used
anyway :)

Alex

>
> Thanks,
> drew

