Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676BB485B26
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:54:28 +0100 (CET)
Received: from localhost ([::1]:33624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5EEl-00085b-Fi
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:54:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1n5E8r-0001QS-GS
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:48:21 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=33611
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1n5E8p-0007bG-FG
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:48:21 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id g80so1987587ybf.0
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 13:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6/bePZKGyS6DrAn8EM6Yj0uXx9KNK1m3twdxQBOOSlA=;
 b=FALxJUtg/QVhHIPClS1LF3z3luffJD9yV2zWY4vHSBGjR7oY/00jn9q/wPADJaoiPy
 qe+lxOZbsk39zOzdp4Sv3Gy3Ao88QhjeuzdW0Xq0cI9JTLCTgGSBc5Z/jeENlTAa/c90
 bIQeCU9HfFOj/bsCGNLCDvSOsiX9fDpF+GiPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6/bePZKGyS6DrAn8EM6Yj0uXx9KNK1m3twdxQBOOSlA=;
 b=Js6+RcRJgr6xIqe3089gjTHHaPCOWx1Uk6OC/6qdVSkmD9tk9FLigsuRC/iQtUmlpC
 qi7DeS9jKB2Lljp9olv+hY1o5+QgCl44sTYR5HU3GrGgNK1XUccECkKz2mqBkOtBO1SR
 rMkU9y9XtXIZfDdZ5XJa+j3JFnyQV2Y4jxnbB/3rOqvJaBttOlZGLdzif6vQ3hZ7Flnh
 kENboO23eKGM9XqlkdV9K5k3QSuf6vD+xzDoCQ4LZvOW5njlaEBB+pbH0Wbun9DYoRBJ
 KC1Ize/E1rhwHsWf0gJXa48v1r/CQIzSf7ACncovpvzgmzW8otyj5X5kRkH5n2CfcrCB
 cAcw==
X-Gm-Message-State: AOAM530MXqV//w7xfkG9hALvm510zYl1O9MxUJteD+wRCmlwAr+sdNMg
 tQb8xPgajsbmFJiEizR14U+AsCandwyxGYwa9aC/
X-Google-Smtp-Source: ABdhPJzTmqAn0nLIxULYYPsnksu68megwgawsknnURJu8lbfQJFrnw8FBnf5/Igp5T7H2cbipYS2/VgxxmyP0OiSPLc=
X-Received: by 2002:a05:6902:154e:: with SMTP id
 r14mr43199674ybu.494.1641419298523; 
 Wed, 05 Jan 2022 13:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-4-atish.patra@wdc.com>
 <CAEUhbmVVM7YOOaoax1JWuO-wHWCZN+FO42CyiaDKNLwbBaR7Eg@mail.gmail.com>
In-Reply-To: <CAEUhbmVVM7YOOaoax1JWuO-wHWCZN+FO42CyiaDKNLwbBaR7Eg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 5 Jan 2022 13:48:08 -0800
Message-ID: <CAOnJCU+nk+BUA0C+BKx2XZ8sZVhHQbbqk_u7t7tnmceZbqFNxA@mail.gmail.com>
Subject: Re: [ PATCH v3 03/10] target/riscv: pmu: Rename the counters
 extension to pmu
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 4, 2021 at 4:11 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Oct 26, 2021 at 4:02 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > The PMU counters are supported via cpu config "Counters" which doesn't
> > indicate the correct purpose of those counters.
> >
> > Rename the config property to pmu to indicate that these counters
> > are performance monitoring counters. This aligns with cpu options for
> > ARM architecture as well.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  target/riscv/cpu.c | 2 +-
> >  target/riscv/cpu.h | 2 +-
> >  target/riscv/csr.c | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 1d69d1887e63..3b55f5ed0036 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -598,7 +598,7 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
> >      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
> >      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
> > -    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> > +    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
> >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> >      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 9e55b2f5b170..ebc1a8754032 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -294,7 +294,7 @@ struct RISCVCPU {
> >          bool ext_zbb;
> >          bool ext_zbc;
> >          bool ext_zbs;
> > -        bool ext_counters;
> > +        bool ext_pmu;
> >          bool ext_ifencei;
> >          bool ext_icsr;
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index de484c74d3b4..c486eeaffeb8 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -64,7 +64,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
> >      RISCVCPU *cpu = RISCV_CPU(cs);
> >      int ctr_index;
> >
> > -    if (!cpu->cfg.ext_counters) {
> > +    if (!cpu->cfg.ext_pmu) {
> >          /* The Counters extensions is not enabled */
>
> %s/Counters extensions/PMU extension
>

Thanks. Fixed it.

> >          return RISCV_EXCP_ILLEGAL_INST;
> >      }
> > --
>
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>


-- 
Regards,
Atish

