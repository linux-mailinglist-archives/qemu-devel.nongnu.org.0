Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E717355BB18
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:22:52 +0200 (CEST)
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rVj-0000BD-Ix
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5rAn-0007lT-Vk
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:01:14 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:44028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5rAl-0007Z1-To
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:01:13 -0400
Received: by mail-ej1-x634.google.com with SMTP id u15so20107687ejc.10
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0R3aDNwisYBknlWnG8tojf14cv7RBUE7yB0t+qLY9r0=;
 b=NMfdWs1bKzJ9yxuSG8TKMVTTmjdsR1i8ICUOitcG0UZbLSTp0cuIUdnMkKT+AO1Lzy
 OufSq4fDpRVNjSj2zWoKwE4oWhfKBiupSDEmG9H7Q+YuHuvHh1hkYN3v15uNpAupRESP
 pO812GtA4bA5mEy7T7oI2QNX6pFKQvXOfPNiboWHr5qbRTR1fLg9y0yKT0GN9IYQYMk+
 uLYfpjtD+GDyUJx6bAQbgymMj0P4ohjfFrKGwH/ORaNgifBFQADxMqMP1YrK2/x+P2mz
 gs9MJN8ziDKexWD0E04sOqlpK/TyYLMZE/m7fJnDfkSWvGdtukcrNh6hLmswQMA6HgIB
 dJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0R3aDNwisYBknlWnG8tojf14cv7RBUE7yB0t+qLY9r0=;
 b=0KFIdiv2VXuEwG0MERPD/cGjWB82b1t2XQ3PuWwz7tEQcBRt4bK14FhxMCURk4Qpru
 3qsMrrxnaQrle2Ktkp9pwR6oA+aILdGF2IWMd2Dmyo6TmUDwg2kX/L4CEDikum8WEAk6
 74ou7vY9Oidy+DIYDKRZzQdqqypt7DF403blyw+ZHGAwkkIISIuyFCil6szdtywROmN9
 75oCTzuZy5oHFdcE2JzJnglx+vFMHF2vd11hr8sUM53i75ttYBF1tDvESmW4J1Mne3fL
 dzPOJEMRMkhfcaMSeNt6cdBgcZXyiGlu2AZwtOmW4chSc7TgSiEdwf0pFXsXYhEM/kYU
 QPiA==
X-Gm-Message-State: AJIora9dPzZcWc6fODYubIzxOvpWw3L0y45rl1aJrRfxVian8hV3XjO5
 pVnqsgmJQO+vMUhf+BnbMIQ32WL0/AkA7BLzcgHPXw==
X-Google-Smtp-Source: AGRyM1uSUOHLh2H/xAdVcR3rl5z7MYdjbNDYA6l0C4TeBBqv2g2aaWiIVIDvAUeUF8cMwR9y/uFxY5IzG5Fb+VIwBMA=
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr13697831ejc.755.1656345669615; Mon, 27
 Jun 2022 09:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220627094029.1379700-1-rpathak@ventanamicro.com>
 <CAEUhbmUcyDNN5APO4yXALposd8Vt6f5RV=t4_VfPL6bHnGkNUQ@mail.gmail.com>
In-Reply-To: <CAEUhbmUcyDNN5APO4yXALposd8Vt6f5RV=t4_VfPL6bHnGkNUQ@mail.gmail.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Mon, 27 Jun 2022 21:30:33 +0530
Message-ID: <CA+Oz1=Y15iyi85UG+MmBahT-q6pvbt31N5fY7+J5pjrJaex-hg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix user-mode build issue because mhartid
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <apatel@ventanamicro.com>, 
 Rahul Pathak <rpathakmailbox@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=rpathak@ventanamicro.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bin, Victor,

Going to send the v2 by fixing these
silly mistakes.

Thanks
Rahul

On Mon, Jun 27, 2022 at 7:59 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Jun 27, 2022 at 5:40 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
> >
> > mhartid csr is not available in user-mode code path and
> > user-mode build fails because of its reference in
> > riscv_cpu_realize function
> >
>
> Normally a "Fixes" tag should be added, but see below:
>
> > Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> > ---
> >  target/riscv/cpu.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 0a794ef622..03f23d4b6d 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -643,9 +643,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >          if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
> >              (env->priv_ver < isa_edata_arr[i].min_version)) {
> >              isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> > +#ifndef CONFIG_USER_ONLY
> >              warn_report("disabling %s extension for hart 0x%lx because "
> >                          "privilege spec version does not match",
> >                          isa_edata_arr[i].name, (unsigned long)env->mhartid);
>
> I can't find this in the mainline codes, so I assume this code exists
> in Alistair's tree?
>
> If that, please indicate in the commit message that this patch should
> be squashed into the offending commit in Alistair's tree.
>
> > +#else
> > +            warn_report("disabling %s extension for hart 0x%lx because "
> > +                        "privilege spec version does not match",
> > +                        isa_edata_arr[i].name);
> > +#endif
>
> Regards,
> Bin



--

