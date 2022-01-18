Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC40492514
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:43:17 +0100 (CET)
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mtP-0002ey-Vy
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:43:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9mfO-0005N7-Ku
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:28:47 -0500
Received: from [2a00:1450:4864:20::329] (port=43655
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9mfL-0000Pt-8y
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:28:46 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so4344423wmq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 03:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oAHXc4l1gAho/jBjM07HWwh4Wk1Wumfqz0S/jU8qNCc=;
 b=07DQ86MCEPkKpfTA12P4VxcH1BCCyOAzOSRjdIAUadjlpSGlWDR33OTkvHjVZk8h7e
 9Wh6iFGLIG7Rgu80Td0q02tU3FfBndpVrUBIE0iDnJOR2F8TS7uYi+ooXXrF1GtbLBJ5
 SKBuAW/C7R2dv4u+dz3DsQPKycHbMrFi1r6dRCeVbfNH8ae1rLiT7T6q1soALZbpGZ9K
 J07CfbUYNcAfi7+AcmcXz68temwlhggvnnGy1MrDA31qtKDeXJAD5IOFdAcKn6VIrH9M
 hS0jFtTbiEcalVv8vbHXGuYc6tp9ErJwh6DRa7LaAOiZKV5Elgx8dvfV603TsDhWID2F
 CaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oAHXc4l1gAho/jBjM07HWwh4Wk1Wumfqz0S/jU8qNCc=;
 b=l40mgv9yF2lnXbB+zrbhjaVy1i/Kyfbsvqddd5j7Bys4/gu4QKsnQt6ArHXwEoYonu
 ooeCbDffu8R3QHVUc7lFgQtJ7fh6Yz/QV+yD7ymoqaPtE4c2b+u5G2/UiLqCIxkGuaTw
 0JQS4RlvwzMlC+3xs2LDuOWGyZqqgZyyAqMS6j9f0WdwpOLTJG2UDuzJ66YDkCiIWHM3
 OpZGkiLydzMC3o8JzmcP5t/+rd00tOdCAS2nNDNayVj/MWsun39DYcTjitg7MfN+MGL3
 nG75talAPhtrAVXSzZZXuOD62PZFx48AX+Vubf8p3j0vt/46M3aWxB+ch5bMkW1/K0Oo
 duiA==
X-Gm-Message-State: AOAM530MPijuaTBlvcBD9pvMs+ULCEPoRNe6gfHiDBAhysFL5hJ14tbf
 umG9Gm354cQ17ThbTHZHW3mOeJ5wEHYQEVYw9Q3m6A==
X-Google-Smtp-Source: ABdhPJwzWy+zXknXIeYQPlMzcX0IL5Ffu38BYeyE6UD2tUayTCzKbSLwVffuLyZDZPyvjaNquu+sRQyU62nUXkwAEgw=
X-Received: by 2002:a05:600c:4e15:: with SMTP id
 b21mr10791805wmq.59.1642505321730; 
 Tue, 18 Jan 2022 03:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
 <CAJF2gTSztdr_geRwQAU=Y3T14urwwpi8+K5uzjf8K_R5ecfLqQ@mail.gmail.com>
 <CAK9=C2Wr1aci6Z3wAKh3Bh_BYyY86BZ_0SRF7pfvKak6HXNvsQ@mail.gmail.com>
 <CAJF2gTQp3RTbj51-5J4md_6UWT7qTYxXvvyZmSK5LN91h4fB0w@mail.gmail.com>
In-Reply-To: <CAJF2gTQp3RTbj51-5J4md_6UWT7qTYxXvvyZmSK5LN91h4fB0w@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jan 2022 16:58:29 +0530
Message-ID: <CAAhSdy2Pvo5AFk-FJEcwYOKBuOxcS8P-T0W=BtLm4fzR+K8_OQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::329;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x329.google.com
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
Cc: Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Weiwei Li <liweiwei@iscas.ac.cn>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 4:45 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Jan 18, 2022 at 4:51 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > On Tue, Jan 18, 2022 at 2:16 PM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > On Tue, Jan 18, 2022 at 11:32 AM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> > > > >
> > > > > From: Guo Ren <ren_guo@c-sky.com>
> > > > >
> > > > > Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> > > > > need to ignore them. They cannot be a part of ppn.
> > > > >
> > > > > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
> > > > >    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> > > > >    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> > > > >
> > > > > 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
> > > > >
> > > > > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > > > > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > > > > Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > ---
> > > > >  target/riscv/cpu_bits.h   | 7 +++++++
> > > > >  target/riscv/cpu_helper.c | 2 +-
> > > > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > > > index 5a6d49aa64..282cd8eecd 100644
> > > > > --- a/target/riscv/cpu_bits.h
> > > > > +++ b/target/riscv/cpu_bits.h
> > > > > @@ -490,6 +490,13 @@ typedef enum {
> > > > >  /* Page table PPN shift amount */
> > > > >  #define PTE_PPN_SHIFT       10
> > > > >
> > > > > +/* Page table PPN mask */
> > > > > +#if defined(TARGET_RISCV32)
> > > > > +#define PTE_PPN_MASK        0xffffffffUL
> > > > > +#elif defined(TARGET_RISCV64)
> > > > > +#define PTE_PPN_MASK        0x3fffffffffffffULL
> > > > > +#endif
> > > > > +
> > > >
> > > > Going forward we should avoid using target specific "#if"
> > > > so that we can use the same qemu-system-riscv64 for both
> > > > RV32 and RV64.
> > > >
> > > > >  /* Leaf page shift amount */
> > > > >  #define PGSHIFT             12
> > > > >
> > > > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > > > index 434a83e66a..26608ddf1c 100644
> > > > > --- a/target/riscv/cpu_helper.c
> > > > > +++ b/target/riscv/cpu_helper.c
> > > > > @@ -619,7 +619,7 @@ restart:
> > > > >              return TRANSLATE_FAIL;
> > > > >          }
> > > > >
> > > > > -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> > > > > +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> > > >
> > > > Rather than using "#if", please use "xlen" comparison to extract
> > > > PPN correctly from PTE.
> > > Do you mean?
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index 9fffaccffb..071b7ea4cf 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -619,7 +619,11 @@ restart:
> > >              return TRANSLATE_FAIL;
> > >          }
> > >
> > > -        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> > > +        if (riscv_cpu_mxl(env) == MXL_RV32) {
> > > +               hwaddr ppn = pte  >> PTE_PPN_SHIFT;
> > > +       } else {
> > > +               hwaddr ppn = (pte &  0x3fffffffffffffULL) >> PTE_PPN_SHIFT;
> > > +       }
> >
> > Yes, something like this but use a define for 0x3fffffffffffffULL
> Just as Alistair said: This will need to be dynamic based on get_xl()
>
>  I still prefer:
> +#if defined(TARGET_RISCV32)
> +#define PTE_PPN_MASK        0xffffffffUL
> +#elif defined(TARGET_RISCV64)
> +#define PTE_PPN_MASK        0x3fffffffffffffULL
> +#endif
>
> +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;

Actually, using cpu_get_xl() is even better because it allows
having lower privilege mode running at different XLEN.

Regards,
Anup

>
> >
> > Regards,
> > Anup
> >
> > >
> > >          RISCVCPU *cpu = env_archcpu(env);
> > >          if (!(pte & PTE_V)) {
> > >
> > > >
> > > > Regards,
> > > > Anup
> > > >
> > > > >
> > > > >          if (!(pte & PTE_V)) {
> > > > >              /* Invalid PTE */
> > > > > --
> > > > > 2.17.1
> > > > >
> > > >
> > >
> > >
> > > --
> > > Best Regards
> > >  Guo Ren
> > >
> > > ML: https://lore.kernel.org/linux-csky/
> > >
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

