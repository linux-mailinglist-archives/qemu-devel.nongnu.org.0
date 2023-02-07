Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B665568DC65
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:03:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPUg-0004mv-J7; Tue, 07 Feb 2023 10:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pPPU7-0004gF-Qb
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:02:15 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pPPU4-0006HH-U0
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:02:15 -0500
Received: by mail-ej1-x635.google.com with SMTP id jg8so4189839ejc.6
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8QSI6xEyDzNRq1+hFxVD8msRuusJUCExX7AGbmE2GsE=;
 b=i9olCITxDzO56AU3Gw2u4Es08EiPqrDMaqKU0aRFkBp/VzBJpozOyx6OeZ9uJcugor
 6XHKLZS+ZF0GgqUuulJMc9zGw9+RZl2BTQcF4xtrtw9nI2BjLCoc5wT7pcw8DsTa9LNB
 2+XygCZJUbuhkVcdb5q/KaCMOFLeJxn0W7KKGZYWEfBGRFRHexcj3yIMl88JANVzdljN
 LrvB82tRkR+eAgr4Bt2JwHYBsYAn9oCvHF9tOdNmLI2fVp4i98mHwOGgpi8W1i7pM6Oo
 yDwiZCEt0qzaFpJFad6vwwZQwwPVzpJ4vVcWsG+3DDVmg0Bq4sBvmKmo1x19ZBJxJD+Q
 xd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8QSI6xEyDzNRq1+hFxVD8msRuusJUCExX7AGbmE2GsE=;
 b=7wP20gNE8m5cWtGZeTQkG2cjFdoHEjZb566bkXzNXmkvMa9OszaCuSmgOct3NxG/BX
 GeeV1lN6r3X7ge75tezzv6TKta1X7c4fBF9WKVf0XQ6Gyv5Urz1pwaTo1XbHASfNwvVy
 8tZwbfTnzOzO+3o36rjOEnp6AWqaIeCfiHbtGg0QIWpPdRMJzLkneOUKZtghGTFEyJ1N
 adsCbbBnTYlEuU7DOBvae5FHSIVZpi40JmjUjNeU0WZrr/Pf49ViQkwp+TCKGSSmvnaI
 O7NxnHOYWvqS6okhQQt3CFsnh27pIza/DjGKGKhzmBE9HXEXUOgHU7h5GZX1ZI0OjZJx
 cysg==
X-Gm-Message-State: AO0yUKXVcWsse0S/dSbZsqvoPY/zHKbjti5CKM4RnjePzFNU5kic/NjI
 J21LWOimbfLQIN/L/GbhFJzqKzigBPmXQxxsoxFFkQ==
X-Google-Smtp-Source: AK7set9FZ0iH4aAvwkVJBXUy3TRqC97q9uun7lTlmOR6X8A6E3d35Ewdl8jQIuG5u8FbfOVR4dGM3BWq2xaLmwRN6h8=
X-Received: by 2002:a17:906:151:b0:8aa:bdeb:e659 with SMTP id
 17-20020a170906015100b008aabdebe659mr194528ejh.45.1675782129822; Tue, 07 Feb
 2023 07:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20230127191758.755844-1-debug@rivosinc.com>
 <CAKmqyKNUEiEODbhAd4MESN-dD2qm2jTVC90ko=7MFv1hBBdJhA@mail.gmail.com>
In-Reply-To: <CAKmqyKNUEiEODbhAd4MESN-dD2qm2jTVC90ko=7MFv1hBBdJhA@mail.gmail.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 7 Feb 2023 07:01:50 -0800
Message-ID: <CAKC1njTcRGW2B1j-FAmHzmkZX6eNe8+rdp+0K-HC9jAP6-xX_Q@mail.gmail.com>
Subject: Re: [PATCH: fix for virt instr exception] target/riscv: fix for
 virtual instr exception
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org
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

Thank you!

On Sun, Feb 5, 2023 at 4:02 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jan 28, 2023 at 6:36 AM Deepak Gupta <debug@rivosinc.com> wrote:
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
> > initialized to false during DisasContxt initialization for TB.
> >
> > [1] - https://github.com/riscv/riscv-cfi
> >
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>
> Thanks!
>
> Applied to riscv-to-apply.next
>
> Alistair
>
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
> >

