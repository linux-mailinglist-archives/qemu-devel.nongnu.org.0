Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3384F680262
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 23:50:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMGUi-0002hk-0A; Sun, 29 Jan 2023 17:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMGUg-0002h0-2Z
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:49:50 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMGUd-0001GF-VI
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 17:49:49 -0500
Received: by mail-vs1-xe32.google.com with SMTP id p10so6293771vsu.5
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 14:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jUKM1Kj0HMrqyZEgQLYhUUI6/YobGx1FpXrWKJsitSU=;
 b=cdptWhuWDraARaGaD3F5riHMhQdzvWVxghYhln08n1QWWizE43/gt94fFetk9wiR88
 jkF0bcXC+mnqhrlXZKS62Lte3rFsueSbYindZ/McP/NgMelRqbfss6l+oUtpnct5Tkl7
 HfxY4DusFk3QADJ5ckhepSgQLlSogy1Um6xZFCMqYzdbySszeoPVJCTeNAdVy0veExOI
 44CZaQntqOmXbGJnFlRNtSTkxe0TKxn0L+dBmEXT585T54+l/6COyMwWPVDbZSBO48h7
 ioqNbsOl/gY+osU1sroQbMgf4kBwjCexWfz3r4ClMwiQ5FCG2sZPEqboCcGFCuChyPa0
 LVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jUKM1Kj0HMrqyZEgQLYhUUI6/YobGx1FpXrWKJsitSU=;
 b=p8fw1ECd1nlnaOtoq22/NLlcnRo4lOijc0ascoNSNF2mHZFQKDZ0oQCO9Oc2y2vJ0A
 PnaFX6PLvtia10M+uMY+gSZmWdpHS57g2ehCUALsgcmr9mmvvzVeOplybPQy7RSMGZmk
 4J+7Pr6MEpCsulaisAaKYGdxR7bmua1oNj6kc23cN3wxqtc66YGxe6mWtHG1Zq529eIv
 ueB5XIL0zycfDdlv4L2Pxha98NEAU+JM+1DnDQYAs3IebMSRmd3zyzd002nobt7fWIGK
 deKYzIxwS+w1GP+DnlNTxA0Oy8LfUrWhQkUmH535xuj8VWFGzSvSH17WsDNTkxMk5ch8
 dGAg==
X-Gm-Message-State: AO0yUKXYzCVUrwex1dHIqH2RVp7sBuwPB8BdEt1vT4lxeT/pqdv+Ou7T
 Tp53JwPeBWC+f+gpUpBxRK7Ra/J7kGjzd9QpIWs=
X-Google-Smtp-Source: AK7set+JzleIc1Xoq/F1WZDEWKMS43xVHfaSnX0aWPsoEhlm85uS1HSKO1uzCtQCGhMIOcwflUYMuZHjiW6Lg2Ry0Hg=
X-Received: by 2002:a67:e101:0:b0:3f0:89e1:7c80 with SMTP id
 d1-20020a67e101000000b003f089e17c80mr790849vsl.72.1675032587052; Sun, 29 Jan
 2023 14:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20230127191758.755844-1-debug@rivosinc.com>
 <CAKC1njS_wY2J7d-BDMZA9O0eOnxd0xqCU=ns+DJ8B-W9e5PowA@mail.gmail.com>
In-Reply-To: <CAKC1njS_wY2J7d-BDMZA9O0eOnxd0xqCU=ns+DJ8B-W9e5PowA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Jan 2023 08:49:21 +1000
Message-ID: <CAKmqyKM3z6ezNwmsVebewmZiCKQzyNhg4SW60KvSQU9PvC9q2g@mail.gmail.com>
Subject: Re: [PATCH: fix for virt instr exception] target/riscv: fix for
 virtual instr exception
To: Deepak Gupta <debug@rivosinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Jan 28, 2023 at 6:37 AM Deepak Gupta <debug@rivosinc.com> wrote:
>
> Please dis-regard this.
> I've sent the patch to qemu-riscv@nongnu.org

That's not entirely correct either.

You can run the `./scripts/get_maintainer.pl` script on your patch to
get the email addresses to send this patch to. qemu-devel is the main
one, but it's also a good idea to CC the qemu-riscv list as well as
maintainers.

>
> On Sat, Jan 28, 2023 at 12:48 AM Deepak Gupta <debug@rivosinc.com> wrote:
> >
> > commit fb3f3730e4 added mechanism to generate virtual instruction
> > exception during instruction decode when virt is enabled.
> >
> > However in some situations, illegal instruction exception can be raised
> > due to state of CPU. One such situation is implementing branch tracking.
> > [1] An indirect branch if doesn't land on a landing pad instruction, then
> > cpu must raise an illegal instruction exception.
> > Implementation would raise such expcetion due to missing landing pad inst
> > and not due to decode. Thus DisasContext must have `virt_inst_excp`

Isn't a landing pad instruction just an instruction that needs to be
decoded? Or are you doing the check as part of the jump instruction?

Overall the change looks ok, but I'm not sure if it's required. Do you
have an implementation that needs this?

Alistair

> > initialized to false during DisasContxt initialization for TB.
> >
> > [1] - https://github.com/riscv/riscv-cfi
> >
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > ---
> >  target/riscv/translate.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index df38db7553..76f61a39d3 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -1167,6 +1167,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> >      ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
> >      ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> >      ctx->zero = tcg_constant_tl(0);
> > +    ctx->virt_inst_excp = false;
> >  }
> >
> >  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> > --
> > 2.25.1
> >
>

