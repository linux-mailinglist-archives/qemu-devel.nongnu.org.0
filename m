Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDCB687018
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 21:51:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNK4L-0001JK-E4; Wed, 01 Feb 2023 15:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pNK4I-0001Hj-KK
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:50:58 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pNK4G-0007dq-Km
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:50:58 -0500
Received: by mail-ej1-x635.google.com with SMTP id k4so231661eje.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 12:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B7LuTqcZJ1B9Rr79blfcpexpLPh40ANjPfLZfwylXnA=;
 b=I6qVl7mHRimVgIgokqcyVsks0lHLt/PXLvJ/mBQnAj84pSh0qpb1xMn8E7WpslsjBF
 dUYKY8Gbt/Xui2xVMy5ysxW36kgrdk+/XHN9bs3JkMYOoIKYn7DZkyXEA9wpEDjKHbc8
 67yFWklWhRO8Zu/ut+0E7hoKGQdW9HH010/xIlacT2VxlK1jUYC1vS/sWGfHmmoHqLCD
 p3teYZV2xvq2hklZV7Uv5f+CX3iaiwdUMYEjg7OV4R19H0FYe/APxOaqluocZHA8P2/A
 DNhp7VBrDsY6IkuDoWWKW4KmmJUJRxNb6tZ/lRjEgxhRvm8UWGitD4mDxlqEaHwtNiMC
 /VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B7LuTqcZJ1B9Rr79blfcpexpLPh40ANjPfLZfwylXnA=;
 b=LbWtcKmIjlwunnAtAHd8lfEdVvJOHOeSte8vsqi/UcAgUkdtZ6GyjjLTFd7EfGepiq
 JC9WRR0JMR1Ryeffs1ZAKxvAcKOhF7Yeu8mgr8+s5QlI4w3L1NBGcXlDeLNXcb+OvoP/
 4IGkGu3cBuzTy/X0IKC6ydiA//40yvUYqMMyBvrFnC0zUUYRle+QILcpt0gxzBVPJCwP
 wu1/zRUSXHpNknSI9AEsgDpYholmppRt9O9sMZEhDb1J31cQQl/ThXLEGIurxiCQKl7+
 +WpCKw2/cgwqgo5Hwpn/Y4SfJdZxFkUBugqA1X9Ur2V5sqOEkdAO0nIF9ZG1NEJtF4Yd
 GPDw==
X-Gm-Message-State: AO0yUKXhs9jZIYzoj7xntSr9bTLXOk7PuNE3OLFl7AoDKx/kj8SJ2dJK
 q7PJ3qO1SWZ6cVFR72LMsVqjU7YOyy1t5ubzejYFrA==
X-Google-Smtp-Source: AK7set8Iuj+JM5Yw2bsy3NsvmYx0ucsH7nA+OeM2KhGxPXg9cVQqgyLT4loioLOhYFVizBIfOSUFfP7Gr+Cs5kc+BGo=
X-Received: by 2002:a17:906:1806:b0:882:4e87:8848 with SMTP id
 v6-20020a170906180600b008824e878848mr1307441eje.86.1675284653736; Wed, 01 Feb
 2023 12:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20230127191758.755844-1-debug@rivosinc.com>
 <CAKC1njS_wY2J7d-BDMZA9O0eOnxd0xqCU=ns+DJ8B-W9e5PowA@mail.gmail.com>
 <CAKmqyKM3z6ezNwmsVebewmZiCKQzyNhg4SW60KvSQU9PvC9q2g@mail.gmail.com>
In-Reply-To: <CAKmqyKM3z6ezNwmsVebewmZiCKQzyNhg4SW60KvSQU9PvC9q2g@mail.gmail.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 1 Feb 2023 12:50:39 -0800
Message-ID: <CAKC1njSUNYBYZC45jBqyFMnXfzsDrvFmKMZ8q5uzLE9TGyEKHg@mail.gmail.com>
Subject: Re: [PATCH: fix for virt instr exception] target/riscv: fix for
 virtual instr exception
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=debug@rivosinc.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

I was traveling. Sorry for the late reply.

On Sun, Jan 29, 2023 at 2:49 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jan 28, 2023 at 6:37 AM Deepak Gupta <debug@rivosinc.com> wrote:
> >
> > Please dis-regard this.
> > I've sent the patch to qemu-riscv@nongnu.org
>
> That's not entirely correct either.
>
> You can run the `./scripts/get_maintainer.pl` script on your patch to
> get the email addresses to send this patch to. qemu-devel is the main
> one, but it's also a good idea to CC the qemu-riscv list as well as
> maintainers.

Noted.

>
> >
> > On Sat, Jan 28, 2023 at 12:48 AM Deepak Gupta <debug@rivosinc.com> wrote:
> > >
> > > commit fb3f3730e4 added mechanism to generate virtual instruction
> > > exception during instruction decode when virt is enabled.
> > >
> > > However in some situations, illegal instruction exception can be raised
> > > due to state of CPU. One such situation is implementing branch tracking.
> > > [1] An indirect branch if doesn't land on a landing pad instruction, then
> > > cpu must raise an illegal instruction exception.
> > > Implementation would raise such expcetion due to missing landing pad inst
> > > and not due to decode. Thus DisasContext must have `virt_inst_excp`
>
> Isn't a landing pad instruction just an instruction that needs to be
> decoded? Or are you doing the check as part of the jump instruction?

Presence of landing pad instruction will not raise any illegal
instruction exception.
It's the absence of landing pad instruction at the target on an
indirect jump that must raise
illegal instruction exception.
The way I am implementing it is by leveraging the TB generation
mechanism and a TB flag.
An indirect jmp/call will be last instruction in a translation block
and thus can set a flag in TB flags.
Subsequent translation block must have landing pad instruction at the
start and it's translation will clear the TB flag.
If there is no landing pad instruction at start of translation block,
TB flag will not be cleared allowing to raise illegal instr exception.

In this case however it's raising an illegal instruction exception
because `virt_inst_excp` is initialized to probably `non-false` value.
More on the implementation below.

>
> Overall the change looks ok, but I'm not sure if it's required. Do you
> have an implementation that needs this?

RISCV Zisslpcfi extension: https://github.com/riscv/riscv-cfi
Qemu implementation for Zisslpcfi :
https://github.com/deepak0414/qemu/tree/gh_Zisslpcfi-0.2
Tests using which I am testing:
https://github.com/deepak0414/riscv-tests/blob/cfi_tests/isa/rv64zcfi/cfi.S

>
> Alistair
>
> > > initialized to false during DisasContxt initialization for TB.
> > >
> > > [1] - https://github.com/riscv/riscv-cfi
> > >
> > > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > > ---
> > >  target/riscv/translate.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > > index df38db7553..76f61a39d3 100644
> > > --- a/target/riscv/translate.c
> > > +++ b/target/riscv/translate.c
> > > @@ -1167,6 +1167,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> > >      ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
> > >      ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> > >      ctx->zero = tcg_constant_tl(0);
> > > +    ctx->virt_inst_excp = false;
> > >  }
> > >
> > >  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> > > --
> > > 2.25.1
> > >
> >

