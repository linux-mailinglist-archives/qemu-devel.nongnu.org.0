Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424E73A3B33
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 06:59:16 +0200 (CEST)
Received: from localhost ([::1]:39710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrZGE-0000SQ-R8
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 00:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lrZFU-00088m-Qb
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 00:58:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lrZFT-0001a4-0W
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 00:58:28 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso7853598wmh.4
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 21:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g33IntimCDVfnGstKmtjsEch5gJ/9wxopUYb9GOeWnY=;
 b=EYpLMEBHVSrzlPpNEnbPFOAd6aWUaE8eYwem6LUXUsqVrrVydJaL19G78h+YOpT0An
 pYYxs8Rl8VJ7dven1Qpq+m8J5anmDkMF8c0M8jw7a/rTSA3GH7/Al5+kWeVHFihUx7WW
 3dE+xusgz4XXnkJhqJcSY1wm9F1kcVMjefcBF9GWbOC5nR/YOodxw4SFeV/iZwhTQ1VH
 Xmf6uI3zs2wEfpTlVaIoPYn1qW2clus4KP/eqgIRPAMMMGxB/xdvLoa8PuVr92l7Y4dX
 Cj53QPYKGxuhI7MdGgPHOc63hifjUt05fEanUb5VIgfcHR/SkFf4t0N5wFE1MIgVaZhf
 e4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g33IntimCDVfnGstKmtjsEch5gJ/9wxopUYb9GOeWnY=;
 b=pBDcG5Z7UfJgYzW7STo4gzICSWzTGMt3HIWN2wV8H+nNICwObE/DDgkNPI73v/deNi
 2PUqAsgL/SylJWXk+dGpIOh5lOOQuR6sbeZrr1BrQMTIaH2TFWCeDjTH8PfOtk4l9Ku6
 sV1dSuGpeI2GKXEr49lOhd1uaAOn5OT+f/MewW5vCktAecZ9Ona7VtXPmrTJzvBGkrmF
 CuvvOJx02nZllPy1fISehu/c56QkI6IIYbo93iA4+gHK4L07uVwSYgQSGMYY4s9tJWUN
 u4rkekenD0nYNyH5VGjPqufQEHusJL7Ju8p8mXcGv8rbfKaA4EtYt0tCcjjc+wtUNxHW
 r5lg==
X-Gm-Message-State: AOAM533VCXOacE8pYH4HbR1tb59YqCPvSSb8jrOsvsoMtkOe+P5wsxEh
 KN20kFo25e1YSERQ8r5GLQHk0s0/WKLJZy3ls16SYw==
X-Google-Smtp-Source: ABdhPJzi9uqPm8H4rdK1P57s1Kx6FFglUpxzrMI9a6ghqE/YF+FR+pMoDbbPglitRsmJyx9dA5n8LZJKwtmFzoEfLhI=
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr2004353wmj.134.1623387504257; 
 Thu, 10 Jun 2021 21:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210514143242.377645-1-anup.patel@wdc.com>
 <20210514143242.377645-3-anup.patel@wdc.com>
 <CAKmqyKNRJaOoWEPkxc1Xc7wJAiAZ8uokZ3UCQEnoShavxohWXA@mail.gmail.com>
In-Reply-To: <CAKmqyKNRJaOoWEPkxc1Xc7wJAiAZ8uokZ3UCQEnoShavxohWXA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Jun 2021 10:28:08 +0530
Message-ID: <CAAhSdy0-kMgSvxQ0FdCKsNjF67-dLTB_T5DSfdgJrVWc=py+Pg@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Add CPU feature for AIA CSRs
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32e;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 4:46 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, May 15, 2021 at 12:35 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We add experimental CPU feature to enable AIA CSRs. This experimental
> > feature can be enabled by setting "x-aia=true" for CPU in the QEMU
> > command-line parameters.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/cpu.c | 5 +++++
> >  target/riscv/cpu.h | 4 +++-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 7d6ed80f6b..f3702111ae 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -414,6 +414,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >          set_feature(env, RISCV_FEATURE_PMP);
> >      }
> >
> > +    if (cpu->cfg.aia) {
> > +        set_feature(env, RISCV_FEATURE_AIA);
> > +    }
> > +
> >      set_resetvec(env, cpu->cfg.resetvec);
> >
> >      /* If only XLEN is set for misa, then set misa from properties */
> > @@ -554,6 +558,7 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> >      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> >      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> > +    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>
> This line should be a seperate patch at the end of the series.
>
> The idea is that we don't allow users to enable the feature until it
> has been fully implemented.

Okay, I will move this into a separate patch towards the end of the series.

Regards,
Anup

>
> Alistair
>
> >      DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 0a33d387ba..f00c60c840 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -80,7 +80,8 @@
> >  enum {
> >      RISCV_FEATURE_MMU,
> >      RISCV_FEATURE_PMP,
> > -    RISCV_FEATURE_MISA
> > +    RISCV_FEATURE_MISA,
> > +    RISCV_FEATURE_AIA
> >  };
> >
> >  #define PRIV_VERSION_1_10_0 0x00011000
> > @@ -303,6 +304,7 @@ struct RISCVCPU {
> >          uint16_t elen;
> >          bool mmu;
> >          bool pmp;
> > +        bool aia;
> >          uint64_t resetvec;
> >      } cfg;
> >  };
> > --
> > 2.25.1
> >
> >

