Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB8D52D71A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:12:35 +0200 (CEST)
Received: from localhost ([::1]:33520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrhpK-0004Gq-CL
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nrhkX-0006hr-UU
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:07:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nrhkW-0003sV-8v
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:07:37 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r23so7624632wrr.2
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 08:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RPqYjrgKzcRdBSHhliO8JZCRqHKDKNKVaCi04MWyvT0=;
 b=yusRJuvcxNBXW/VTQ+I47rxpJqY6nHPtevSC/iob199Dn5r4hxljWDKTbtAMlUL3Y3
 GAVxI9LVF+VwpGyBhI2XzmKT+Rd+ukLWWXYT/8mA5sl9/bmT2d5gSqhH946KBZpsY0P/
 BTKlPcetIZbCVKXbM3oDNRrYtE5C8ajoMQSg3MXtgXnLaqbFnQYdNN1Dg3pE/qzkFt2T
 M3xLojQQOOAMP64aq0Ps9RQGbuTqqo3OiiTwOdVYgQWdcEbnCol0ALP5D3DrYlSebwyI
 3ncfGGZmL49N+Ck0Xf3bA7OFXnr7a4O0WrtWIsN6uxs226rj6Y2a+A/WK+vQZfW9ggoc
 pBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RPqYjrgKzcRdBSHhliO8JZCRqHKDKNKVaCi04MWyvT0=;
 b=syGzO/Y2CHtnJNzO9P5TqlKBw10s4LpDdV5ZyM2mRBKkAx1bk+EoewsgqLpqeJVnC0
 fvVpmHHdSrdEOae02PmUdYnlM2f1dQQFNQywEz2tBfj5OmKVoWKseTVvuFnoQiqzZ3ni
 afTbIF9GoI1eS5Y6bi2gC9iGnGrOHKV4wxRZAiYydV55/RpkJ76P8iMZ/9W5y9Nm6oms
 zHrG0vI24o+usE9HXfTNe3JaZ9RCt1HwTcpIztt8kB7OYghWWD6c8LwP6PAFSTUw0KAV
 FL7QiO5bRQQamlGfcxf6yTiT6PjuwdL09fc5zEwDtLq6NRWm342002LGD9yNuNURQw0B
 FSLg==
X-Gm-Message-State: AOAM531ccVCAUFWwwXLmCGW3WDoUMiOMLTQIc9x5tX8rLaJv+NTCPBqr
 TH73/SjDvJbrcPRtc0lHnbXKmTt+88KOKPKTiPdNNQ==
X-Google-Smtp-Source: ABdhPJzwH2GDEC3ui5ts3s6MYcXrcsH62ft26qZIsgSw85AnapHlx+81tzrttZnD5xOYzlNJQhDt3S1jibO2kPQbd2E=
X-Received: by 2002:a5d:6489:0:b0:20e:549b:4414 with SMTP id
 o9-20020a5d6489000000b0020e549b4414mr4414489wri.86.1652972854422; Thu, 19 May
 2022 08:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
 <20220511144528.393530-8-apatel@ventanamicro.com>
 <CAKmqyKN5U927XfL7n_8S=3ykMyHPLM_kyM9qfYV5dq_eSmoEfA@mail.gmail.com>
In-Reply-To: <CAKmqyKN5U927XfL7n_8S=3ykMyHPLM_kyM9qfYV5dq_eSmoEfA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 May 2022 20:37:24 +0530
Message-ID: <CAAhSdy1SRGnG9An-hKHBaEzoG=0eSZQCwQDhoJ3J387Lwe5Pdg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] target/riscv: Force disable extensions if priv
 spec version does not match
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::42a;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 17, 2022 at 5:46 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, May 12, 2022 at 12:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > We should disable extensions in riscv_cpu_realize() if minimum required
> > priv spec version is not satisfied. This also ensures that machines with
> > priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
> > extensions.
> >
> > Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
> > device tree")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>
> This will potentially confuse users as we just disable the extension
> without telling them.
>
> Could we not just leave this as is and let users specify the
> extensions they want? Then it's up to them to specify the correct
> combinations

The ISA extensions are not independent of the Priv spec version.

For example, we have bits for Sstc, Svpbmt, and Zicbo[m|p|z] extensions
in xenvcfg CSRs which are only available for Priv v1.12 spec.

We can't allow users to enable extensions which don't meet
the Priv spec version requirements.

Regards,
Anup

>
> Alistair
>
> > ---
> >  target/riscv/cpu.c | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index f3b61dfd63..25a4ba3e22 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -541,6 +541,40 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >          set_priv_version(env, priv_version);
> >      }
> >
> > +    /* Force disable extensions if priv spec version does not match */
> > +    if (env->priv_ver < PRIV_VERSION_1_12_0) {
> > +        cpu->cfg.ext_h = false;
> > +        cpu->cfg.ext_v = false;
> > +        cpu->cfg.ext_zfh = false;
> > +        cpu->cfg.ext_zfhmin = false;
> > +        cpu->cfg.ext_zfinx = false;
> > +        cpu->cfg.ext_zhinx = false;
> > +        cpu->cfg.ext_zhinxmin = false;
> > +        cpu->cfg.ext_zdinx = false;
> > +        cpu->cfg.ext_zba = false;
> > +        cpu->cfg.ext_zbb = false;
> > +        cpu->cfg.ext_zbc = false;
> > +        cpu->cfg.ext_zbkb = false;
> > +        cpu->cfg.ext_zbkc = false;
> > +        cpu->cfg.ext_zbkx = false;
> > +        cpu->cfg.ext_zbs = false;
> > +        cpu->cfg.ext_zk = false;
> > +        cpu->cfg.ext_zkn = false;
> > +        cpu->cfg.ext_zknd = false;
> > +        cpu->cfg.ext_zkne = false;
> > +        cpu->cfg.ext_zknh = false;
> > +        cpu->cfg.ext_zkr = false;
> > +        cpu->cfg.ext_zks = false;
> > +        cpu->cfg.ext_zksed = false;
> > +        cpu->cfg.ext_zksh = false;
> > +        cpu->cfg.ext_zkt = false;
> > +        cpu->cfg.ext_zve32f = false;
> > +        cpu->cfg.ext_zve64f = false;
> > +        cpu->cfg.ext_svinval = false;
> > +        cpu->cfg.ext_svnapot = false;
> > +        cpu->cfg.ext_svpbmt = false;
> > +    }
> > +
> >      if (cpu->cfg.mmu) {
> >          riscv_set_feature(env, RISCV_FEATURE_MMU);
> >      }
> > --
> > 2.34.1
> >
> >

