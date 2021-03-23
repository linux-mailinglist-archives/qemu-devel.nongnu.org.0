Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C2534612F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:16:25 +0100 (CET)
Received: from localhost ([::1]:37588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhpY-0001ht-FT
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhhy-0002HL-PF
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:08:34 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhhv-0004zr-Tb
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:08:34 -0400
Received: by mail-ed1-x52c.google.com with SMTP id bx7so23588027edb.12
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bixCDyWJ9Oky319Z1a/RfcVgpsWXXrBV+azhXEdT5jg=;
 b=PqcEu/bGQtjFH0agMaNIArXdXw+B03wWGmcJjYl/xJQo/Z+3U1uLDzmK9T2HL8230f
 npgyMo2KyhVaZXzIi0p0YKnpABvVk3edBqnug5gTx16G0UYI7htBBl/nMrac/wL0d77s
 wbTCpPiPPO+hB3hfrDbud+f5fJtCLnasOfvVGLzEYjX5XzS/sszHdaj3H6obQ+03BrPv
 PtkgplBPcIZgwJdqEZ8jM3y6lhobXoxCvpNReFbyO9Re/FoHsp9+2lKhLXEaj3LEAtbR
 eYKQKuT6GItbkrPj8/iJLsANBY75ctEEQpnPohe291z/M1mxJ8Ejp/x50eCxC29A0lbc
 Qz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bixCDyWJ9Oky319Z1a/RfcVgpsWXXrBV+azhXEdT5jg=;
 b=nfkxGXZVyxVwZFUtO3ljYmKuqNNTZNxlVri1n9FKV2KmmuUqoMb7/h4x8XPbW3GIPn
 09Mt+zapDGs4skLUgL65h55+01i8p1PBEOh3SAb9JPq96GfwMgDtOQEL9ZWXaCGSKqox
 Y0cABKeKT/QLpUsrrafvdSE60nnea+uAuTspApRxFcJkPi0KNoDaQeVKMRIc+I2DNtJy
 sfdDEPTltFXlMdk3v1haOmfQyp1Jg8efuwPlYqCLI/9MJsQuEJg3nN+nGXOo3ot7Gmbl
 OiMSJqst8lmTxtZkb1+xQA7DvczJ4hf2ca8Aty0bG8YQQliWPMk6QDz5vO2dAZJGsVvk
 BA+Q==
X-Gm-Message-State: AOAM53327Chrqmq1PUecThuM6Mx+NM0HBdytEVU3dDQuCZe99stTizUt
 4Xso+78n31BuEGWRFMuwn7OWVDC+pG7892jqpMhzpQ==
X-Google-Smtp-Source: ABdhPJzeNRw7UFG0dKSOZsFMc6VDJi5DM1S4OSNUF9Tfo6/TNjg55rBaNoVvoCNXmyUU7sR0MsBvtyq8idJOCPbAQPc=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr4653311edt.251.1616508509014; 
 Tue, 23 Mar 2021 07:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210320000606.1788699-1-richard.henderson@linaro.org>
 <CAFEAcA_gVEMzgaVgE5U6hvoE+H38EiCr7NeZejVHztJta5sM=g@mail.gmail.com>
In-Reply-To: <CAFEAcA_gVEMzgaVgE5U6hvoE+H38EiCr7NeZejVHztJta5sM=g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 14:07:59 +0000
Message-ID: <CAFEAcA-O=NGG97MqmPWof95bOFnY0D72mCPCLpYgNeoEup_-HA@mail.gmail.com>
Subject: Re: [PATCH for-6.0] target/arm: Set ARMMMUFaultInfo.level in
 user-only arm_cpu_tlb_fill
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 at 14:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 20 Mar 2021 at 00:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Pretend the fault always happens at page table level 3.
> >
> > Failure to set this leaves level = 0, which is impossible for
> > ARMFault_Permission, and produces an invalid syndrome, which
> > reaches g_assert_not_reached in cpu_loop.
> >
> > Fixes: 8db94ab4e5db ("linux-user/aarch64: Pass syndrome to EXC_*_ABORT")
> > Reported-by: Laurent Vivier <laurent@vivier.eu>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/tlb_helper.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> > index 9609333cbd..3107f9823e 100644
> > --- a/target/arm/tlb_helper.c
> > +++ b/target/arm/tlb_helper.c
> > @@ -163,6 +163,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >      } else {
> >          fi.type = ARMFault_Translation;
> >      }
> > +    fi.level = 3;
> >
> >      /* now we have a real cpu fault */
> >      cpu_restore_state(cs, retaddr, true);
>
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

...and applied to target-arm.next.

thanks
-- PMM

