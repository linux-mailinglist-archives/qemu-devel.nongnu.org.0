Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8FD688005
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:25:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNaWQ-0003y0-Kl; Thu, 02 Feb 2023 09:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNaWI-0003vl-Sb
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 09:25:04 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNaWG-0002jv-S6
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 09:24:58 -0500
Received: by mail-ej1-x634.google.com with SMTP id m2so6388275ejb.8
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gyNeh/9jkYVPY2dOsex4uScI7zBsxh0FthHS454uNKw=;
 b=pbGlRKq3/SKOW4MjtJF0+ZU2h5eUUKACQ/sat4zTpPpIssG17bCydHnm6JYuAXKZSh
 0Rcsjyp4yTwnftfpXB+BMZnFyJ0qnoDZJG+co7iL0CVYhX2O04li+q5Z+ONz4y76hcNK
 qro69yMeGEI5grVvNhGijVlTS0bHiZ9WnnEfNWJ6ksceIcS1qRD6WxyFIr8gDOadOxQw
 1mg1fTiHEvT0yX/GryH2OccPyDKM/p78oqNaVZoNP5WOvzsWKjCqEm0owkEb9/VdWW+9
 dRte4bq+BrJit0ZCHbgp8NJbZw0TF04r86pkDjjNymoKNJhDRFpuy4E8W0k6r+b6c4pd
 ZpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gyNeh/9jkYVPY2dOsex4uScI7zBsxh0FthHS454uNKw=;
 b=g5UJ5YT3er6n7thSwNPgks8kVt35hXaNKz3XvqPNez92tng+xa/+LmNxoClEuOcWcF
 BgbYs92NE6afl2mqm3oNx4l5VGbWOa+n7oDc7KdZEVoZOoScSrk1aZxhxepl/nQ9AUPe
 0LgIIvavLd0RPfOpvKX0A4/A87JDfTCNqbaHnXVorRuWUfU9D39PvAxxViLYcMyw2W1I
 NfV811cs+ERK8GlMNb7MD0msQSoyQiLUTmeVZvHU6mPaZpwmLjsw1dfJpY6tDe6+A09A
 kvG1QyYSbLAGXPF27+s9zkTVBUomxHeHgCIjoCP0QyZbSi68L/YHWbScq+AwRIhS4nSi
 OKIg==
X-Gm-Message-State: AO0yUKUXg+9HIMnrcF4+J50Iu4GszDudUHlajDCT9aWdpyOJYY8gTENL
 AaCSmJjzsCB+ZYne2NU5lTSW0SCrYsWhnrcmtJHT2A==
X-Google-Smtp-Source: AK7set88XIVwLLwCSDNQQZGMnYtAU2tzBNATjP4+Lk6kUFlcufUp9XhStFVxV44y95zksieDiNUHWxLIjLy1UD77tU4=
X-Received: by 2002:a17:906:950e:b0:882:a9d3:9aa9 with SMTP id
 u14-20020a170906950e00b00882a9d39aa9mr2064753ejx.70.1675347895199; Thu, 02
 Feb 2023 06:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
 <20230202124230.295997-11-lawrence.hunter@codethink.co.uk>
 <CAAeLtUC3OrdKY8FptTq5Wc32EeHwZjAdrVqaM948fwPaSCMjEA@mail.gmail.com>
In-Reply-To: <CAAeLtUC3OrdKY8FptTq5Wc32EeHwZjAdrVqaM948fwPaSCMjEA@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 2 Feb 2023 15:24:44 +0100
Message-ID: <CAAeLtUBBxguM3kLrB-6vAkqV9E84xXvKbsJn7A-Z4FK8RA5bZA@mail.gmail.com>
Subject: Re: [PATCH 10/39] target/riscv: expose zvkb cpu property
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Cc: qemu-devel@nongnu.org, dickon.hood@codethink.co.uk, 
 nazar.kazakov@codethink.co.uk, kiran.ostrolenk@codethink.co.uk, 
 frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, pbonzini@redhat.com, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 2 Feb 2023 at 15:23, Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> On Thu, 2 Feb 2023 at 13:42, Lawrence Hunter
> <lawrence.hunter@codethink.co.uk> wrote:
> >
> > From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> >
> > Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
>
> You might want to squash this onto the patch that first introduces the property.
>
> Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
>
> > ---
> >  target/riscv/cpu.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index bd34119c75..35790befc0 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -1082,6 +1082,8 @@ static Property riscv_cpu_extensions[] = {
> >
> >      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
> >
> > +    DEFINE_PROP_BOOL("zvkb", RISCVCPU, cfg.ext_zvkb, false),

I missed this earlier: the extension is not ratified. So please: "x-zvkb".
And it needs to go under the comment:
  /* These are experimental so mark with 'x-' */

> > +
> >      /* Vendor-specific custom extensions */
> >      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
> >
> > --
> > 2.39.1
> >

