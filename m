Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4C532A6C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:34:16 +0200 (CEST)
Received: from localhost ([::1]:42230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTjr-0001gM-6v
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1ntTN2-0004tI-If
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:10:40 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1ntTN0-0006sx-GY
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:10:40 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x12so1166120wrg.2
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 05:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AzXZ0UGwJCBngpgI4uD8Azmg5dEBbjNzTqsntyumh3E=;
 b=zt19TAKGS29nj9f1IqibbAoDCuibCuEnY2uxGsd2ylIfPoWljMTUbAgA2YGf8Tr8uL
 IJFNZZMRUCz+XTyzy3IAXWxEVoHRanRpm4dF35E/Esdjc5IWLWO3TAvU9kXTnmd9q512
 NLS7dmY3vUVmkhu4vmF5vW6NEUXuhiCZUWBUjI0E/5qDZUstC8/uMg+1rgodkGBNOGWb
 ZyOdcs4CuCURiwsRK6nigXJSxiwIWXchCoeIFrMZslgv0BfeXkoAcQHDFlLLJjTDb+k5
 z/ZPTXSpXCPe9jbqKmjkl6hJc30EvvTem32yKi+hbYguy5NDu2AU0DAFy8bqlW4+Em1b
 5dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AzXZ0UGwJCBngpgI4uD8Azmg5dEBbjNzTqsntyumh3E=;
 b=Wl+AcT4i0mkd5fopLlHNYm5OX+VV1gBzc5fYyDX7gCGdZcW5waGOSwnv7g7YPQKHla
 AvGXz3UgeV2mI+8i69zt++bq9ZV17As2rjCQyY36hQgU+J3j+WXcayCAv40WqsgVgU4z
 +OzVc5vemjNQNRsW8iyqgAXLhsO0mz5RupVL0VimLLgcU17CglVLxBNYDIj5t4AdYyz3
 azAMD397Gd2kB8DZrsFtx317gawHgMrw1619e4XhQq8JqNYJlIKtjV9y7/A0V39zBr2Q
 Rs0tIi5g+c3VwU2/C24ZCSOrWz0gJk0WdQFgV/XNGELqJu/mV8LRs6LxkrHHNAQCClet
 Vfjg==
X-Gm-Message-State: AOAM532Rddzz9TUrmbfTzAlPvHguXpEwdbJhXaMacnz6zho3tfNbEDnI
 1JzK4P4XyzktWJAjkqV26u6XBgIYcxBXfE77QTEjpQ==
X-Google-Smtp-Source: ABdhPJzVz4OWO5u4A1821BG+t8orPZnkQ+O6wPQtwvwGJDa4mj890YntzLFurL2B76GM7sibH5xc98H6gPkSe9UXKDU=
X-Received: by 2002:a05:6000:1f18:b0:20f:e61b:520e with SMTP id
 bv24-20020a0560001f1800b0020fe61b520emr6532049wrb.214.1653394236298; Tue, 24
 May 2022 05:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
 <20220511144528.393530-8-apatel@ventanamicro.com>
 <CAKmqyKN5U927XfL7n_8S=3ykMyHPLM_kyM9qfYV5dq_eSmoEfA@mail.gmail.com>
 <CAAhSdy1SRGnG9An-hKHBaEzoG=0eSZQCwQDhoJ3J387Lwe5Pdg@mail.gmail.com>
 <CAKmqyKMy66XQsgmAnMEEaYrH7k1g2MC6kHqrPaRWKxvSuOz3Xw@mail.gmail.com>
In-Reply-To: <CAKmqyKMy66XQsgmAnMEEaYrH7k1g2MC6kHqrPaRWKxvSuOz3Xw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 May 2022 17:40:24 +0530
Message-ID: <CAAhSdy0iP+js5JTSXBsD-O3KennBR++_v4z7m55bztEyrgwvPQ@mail.gmail.com>
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
Received-SPF: none client-ip=2a00:1450:4864:20::42f;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42f.google.com
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

On Tue, May 24, 2022 at 3:22 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, May 20, 2022 at 1:07 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, May 17, 2022 at 5:46 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Thu, May 12, 2022 at 12:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
> > > >
> > > > We should disable extensions in riscv_cpu_realize() if minimum required
> > > > priv spec version is not satisfied. This also ensures that machines with
> > > > priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
> > > > extensions.
> > > >
> > > > Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
> > > > device tree")
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > >
> > > This will potentially confuse users as we just disable the extension
> > > without telling them.
> > >
> > > Could we not just leave this as is and let users specify the
> > > extensions they want? Then it's up to them to specify the correct
> > > combinations
> >
> > The ISA extensions are not independent of the Priv spec version.
> >
> > For example, we have bits for Sstc, Svpbmt, and Zicbo[m|p|z] extensions
> > in xenvcfg CSRs which are only available for Priv v1.12 spec.
> >
> > We can't allow users to enable extensions which don't meet
> > the Priv spec version requirements.
>
> Fair point. Ok we should at least report a warning if any of these are
> set though

Okay, I will update this patch accordingly.

Regards,
Anup

>
> Alistair
>
> >
> > Regards,
> > Anup
> >
> > >
> > > Alistair
> > >
> > > > ---
> > > >  target/riscv/cpu.c | 34 ++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 34 insertions(+)
> > > >
> > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > index f3b61dfd63..25a4ba3e22 100644
> > > > --- a/target/riscv/cpu.c
> > > > +++ b/target/riscv/cpu.c
> > > > @@ -541,6 +541,40 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> > > >          set_priv_version(env, priv_version);
> > > >      }
> > > >
> > > > +    /* Force disable extensions if priv spec version does not match */
> > > > +    if (env->priv_ver < PRIV_VERSION_1_12_0) {
> > > > +        cpu->cfg.ext_h = false;
> > > > +        cpu->cfg.ext_v = false;
> > > > +        cpu->cfg.ext_zfh = false;
> > > > +        cpu->cfg.ext_zfhmin = false;
> > > > +        cpu->cfg.ext_zfinx = false;
> > > > +        cpu->cfg.ext_zhinx = false;
> > > > +        cpu->cfg.ext_zhinxmin = false;
> > > > +        cpu->cfg.ext_zdinx = false;
> > > > +        cpu->cfg.ext_zba = false;
> > > > +        cpu->cfg.ext_zbb = false;
> > > > +        cpu->cfg.ext_zbc = false;
> > > > +        cpu->cfg.ext_zbkb = false;
> > > > +        cpu->cfg.ext_zbkc = false;
> > > > +        cpu->cfg.ext_zbkx = false;
> > > > +        cpu->cfg.ext_zbs = false;
> > > > +        cpu->cfg.ext_zk = false;
> > > > +        cpu->cfg.ext_zkn = false;
> > > > +        cpu->cfg.ext_zknd = false;
> > > > +        cpu->cfg.ext_zkne = false;
> > > > +        cpu->cfg.ext_zknh = false;
> > > > +        cpu->cfg.ext_zkr = false;
> > > > +        cpu->cfg.ext_zks = false;
> > > > +        cpu->cfg.ext_zksed = false;
> > > > +        cpu->cfg.ext_zksh = false;
> > > > +        cpu->cfg.ext_zkt = false;
> > > > +        cpu->cfg.ext_zve32f = false;
> > > > +        cpu->cfg.ext_zve64f = false;
> > > > +        cpu->cfg.ext_svinval = false;
> > > > +        cpu->cfg.ext_svnapot = false;
> > > > +        cpu->cfg.ext_svpbmt = false;
> > > > +    }
> > > > +
> > > >      if (cpu->cfg.mmu) {
> > > >          riscv_set_feature(env, RISCV_FEATURE_MMU);
> > > >      }
> > > > --
> > > > 2.34.1
> > > >
> > > >

