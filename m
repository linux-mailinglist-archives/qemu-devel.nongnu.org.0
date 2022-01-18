Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E074921AD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 09:54:56 +0100 (CET)
Received: from localhost ([::1]:45020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kGV-0002ng-WF
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 03:54:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9kDG-0000jN-8c
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:51:34 -0500
Received: from [2607:f8b0:4864:20::102b] (port=37861
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9kD8-00013Y-H7
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 03:51:33 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z17-20020a17090ab11100b001b4d8817e04so855719pjq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 00:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E15Gt2XLm8DjBYjlAIAwUgpja/zxHmz+mgVIKW7NL+g=;
 b=kmvYnz1M2w7DN9mp9jwir2BWaQp7C+ia2mQV+peqk8dWmmiTFf8g8XIw/p2nim3kep
 ZigZt1ZcuNo+2gowt21xOMJ6hzsi1PbccqDdGgQ2Sd+ey4sR4lhf6pYtGRi58OAmjJK0
 jAw5jY2DFnMbqrh+/v36SNtkZyI//eaITSiUDXivKBi0bnKX0+42qmOHhN/fRl8CGDdd
 EVFE258RHjbrDIx95vC0oHyam/5bvLkzoGpDVWRt1Zp13ZixK6sMuILGkuVDN8B97Pn5
 zYY12KHpGdAD6+8c8nhyUCsY0J2wnbNdL62/faxOLsduco8ZIqCIaVzwu64+K4cb+PbB
 VyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E15Gt2XLm8DjBYjlAIAwUgpja/zxHmz+mgVIKW7NL+g=;
 b=ISGhJ0KkyW/s4dJW+u71iTaM0RL6hHDR1q/ToIS8mKSCppeUhnO2vyunYOCOi3lZcl
 ExfW3jznkySlZ0cb9S5UkRSVphVAoPsD/B+XSDlRkuDoR2utugsM/1jt0QUu44MoK9Ok
 ZHGLZDOU8vphCNksXN/9K9Kniyd83emYrxdWmn3OK/MAG8CVDqeN3ZqsVG/Sy0Ripf50
 b3T3ePBhOFCd6D+BPBQbZxtkOBPJ4aeQIfFzCabjAAi2HPwfEjSDfTGltHtunzkxp0i1
 S1NTuBFIJxhh3cmVSBVPQw8n1yySCaTINZQnccmEoYdTi5mTLDtfTowtVuDqp+7LMeSv
 2whA==
X-Gm-Message-State: AOAM530rg7gkpseww2kqGrpRT6g6jJSGizbNuXHccqv7dQ/3g/iZufnR
 8zfJjz3beGP3JyCsc/aFjHYWBN/rpMyeczUTxSZheg==
X-Google-Smtp-Source: ABdhPJzVaUJKigUcUtMAsghv4XtgwjDPHHOS+hJ3G88Zqk+EdwZ3/RJn4ag4Uj7YrT324o8GXZ3RGHqf1IFpcHKHtWs=
X-Received: by 2002:a17:902:bd94:b0:149:c926:7c26 with SMTP id
 q20-20020a170902bd9400b00149c9267c26mr26680849pls.64.1642495878056; Tue, 18
 Jan 2022 00:51:18 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
 <CAJF2gTSztdr_geRwQAU=Y3T14urwwpi8+K5uzjf8K_R5ecfLqQ@mail.gmail.com>
In-Reply-To: <CAJF2gTSztdr_geRwQAU=Y3T14urwwpi8+K5uzjf8K_R5ecfLqQ@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 18 Jan 2022 14:21:06 +0530
Message-ID: <CAK9=C2Wr1aci6Z3wAKh3Bh_BYyY86BZ_0SRF7pfvKak6HXNvsQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 2:16 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Jan 18, 2022 at 11:32 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> > >
> > > From: Guo Ren <ren_guo@c-sky.com>
> > >
> > > Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
> > > need to ignore them. They cannot be a part of ppn.
> > >
> > > 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
> > >    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
> > >    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
> > >
> > > 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
> > >
> > > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > > Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  target/riscv/cpu_bits.h   | 7 +++++++
> > >  target/riscv/cpu_helper.c | 2 +-
> > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > index 5a6d49aa64..282cd8eecd 100644
> > > --- a/target/riscv/cpu_bits.h
> > > +++ b/target/riscv/cpu_bits.h
> > > @@ -490,6 +490,13 @@ typedef enum {
> > >  /* Page table PPN shift amount */
> > >  #define PTE_PPN_SHIFT       10
> > >
> > > +/* Page table PPN mask */
> > > +#if defined(TARGET_RISCV32)
> > > +#define PTE_PPN_MASK        0xffffffffUL
> > > +#elif defined(TARGET_RISCV64)
> > > +#define PTE_PPN_MASK        0x3fffffffffffffULL
> > > +#endif
> > > +
> >
> > Going forward we should avoid using target specific "#if"
> > so that we can use the same qemu-system-riscv64 for both
> > RV32 and RV64.
> >
> > >  /* Leaf page shift amount */
> > >  #define PGSHIFT             12
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index 434a83e66a..26608ddf1c 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -619,7 +619,7 @@ restart:
> > >              return TRANSLATE_FAIL;
> > >          }
> > >
> > > -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
> > > +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> >
> > Rather than using "#if", please use "xlen" comparison to extract
> > PPN correctly from PTE.
> Do you mean?
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9fffaccffb..071b7ea4cf 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -619,7 +619,11 @@ restart:
>              return TRANSLATE_FAIL;
>          }
>
> -        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> +        if (riscv_cpu_mxl(env) == MXL_RV32) {
> +               hwaddr ppn = pte  >> PTE_PPN_SHIFT;
> +       } else {
> +               hwaddr ppn = (pte &  0x3fffffffffffffULL) >> PTE_PPN_SHIFT;
> +       }

Yes, something like this but use a define for 0x3fffffffffffffULL

Regards,
Anup

>
>          RISCVCPU *cpu = env_archcpu(env);
>          if (!(pte & PTE_V)) {
>
> >
> > Regards,
> > Anup
> >
> > >
> > >          if (!(pte & PTE_V)) {
> > >              /* Invalid PTE */
> > > --
> > > 2.17.1
> > >
> >
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/
>

