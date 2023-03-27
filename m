Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4488B6C9A86
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 06:27:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgeQn-0004xk-0g; Mon, 27 Mar 2023 00:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgeQj-0004wv-TA; Mon, 27 Mar 2023 00:26:02 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgeQh-0004ck-Hw; Mon, 27 Mar 2023 00:26:01 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so7313302pjt.5; 
 Sun, 26 Mar 2023 21:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679891157;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkAzNl4+KmmE8oCN4rlX/9dHNGfm5ZUjb0vJK9clE88=;
 b=mcn7pxJeLWa7bZAAwb8cXNbYJkb+WkcBYWhK3rQB8rxrD1F0nem64Y7jKqTuuTXyYV
 6xm7AFCrvYPm+AAns5LEyzhWXn5E7Hwu67svFPdvBrEy6g2AY8tlJHDcJ9veDR0tl0Em
 holDY4FCjQF1oSu1k+RtLJUV34Nifyv4dXSt4o3/iGdcnchTplbfFqR0HtvZ7HBKwb04
 XODQKfpFoVmascTnvkDk9yv68et/vi2jJzgdrcBpfJc/YgeU/hOuiCoTxY30vmLVkk0f
 q7v5JktcGfe68X45Rgf9dM1yD7TP1AROHLJz6IB9hLNA6+btdOSPnRRmoMXSik0jVLR6
 PglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679891157;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pkAzNl4+KmmE8oCN4rlX/9dHNGfm5ZUjb0vJK9clE88=;
 b=57fk0ko3Ovw6Bhdv94382LvaHLKQBg9KV9B1Gtl6L0OutKMvnExOdXesyrm/VNPGSe
 t/PNVpwo28wMSTxLbA7h7lOsHlaE02LKA+oArFwhVYc7ICnemqHed7FpP7+pbt/xhjdH
 y3n7oIOd6P6fKyxefUuT20qYGNvEXhITVkuWRY1AKUrTorDkIoZsMLt/pfXudaPf+jMH
 lCO2TyNbYGE+DQeo4x1ERWSfCOjVz7aIMcn5H7omAKNCGi45hNsKLd/5EayAiLdg1Viv
 /MGtPmceb45ApzR93axh74b5t7QZ3h9B8L7Tt6vlysBYHN3kdfTQ2NRscX9wyksAIl49
 v2SA==
X-Gm-Message-State: AAQBX9c/IJnVcmz0yDEO/Fl/oEiW3KsbECthITqFIgbyLiQCcC1/3hSF
 nUz3D95b8IF/4XzHg2vY2So=
X-Google-Smtp-Source: AKy350ZV1uh4lNAyjIYuBMnPPHGj5XMWrXQiQogXKWITBtcu8eg6N4vaYHg0Vb8ZFMRt1fS+W8MmWA==
X-Received: by 2002:a17:90b:4b47:b0:23d:29c7:916f with SMTP id
 mi7-20020a17090b4b4700b0023d29c7916fmr10920971pjb.32.1679891156885; 
 Sun, 26 Mar 2023 21:25:56 -0700 (PDT)
Received: from localhost ([203.221.180.225]) by smtp.gmail.com with ESMTPSA id
 21-20020a170902ee5500b0019aafc422fcsm18029332plo.240.2023.03.26.21.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Mar 2023 21:25:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 14:25:52 +1000
Message-Id: <CRGVPPOVV37H.V7I1J7BLKVMS@bobo>
Cc: <qemu-devel@nongnu.org>
Subject: Re: [PATCH 3/6] target/ppc: Fix instruction loading endianness in
 alignment interrupt
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Fabiano Rosas" <farosas@suse.de>, <qemu-ppc@nongnu.org>
X-Mailer: aerc 0.13.0
References: <20230323022237.1807512-1-npiggin@gmail.com>
 <20230323022237.1807512-3-npiggin@gmail.com> <87zg82ff8s.fsf@suse.de>
In-Reply-To: <87zg82ff8s.fsf@suse.de>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri Mar 24, 2023 at 11:30 PM AEST, Fabiano Rosas wrote:
> Hi Nick,
>
> > powerpc ifetch endianness depends on MSR[LE] so it has to byteswap
> > after cpu_ldl_code(). This corrects DSISR bits in alignment
> > interrupts when running in little endian mode.
> >
>
> Just a thought, we have these tests that perhaps could have caught
> this:  https://github.com/legoater/pnv-test
>
> Despite the name they do have (some) support to pseries as well. Not
> sure how the P8 support is these days though.

Hey Fabiano,

Thanks for the review. Good thinking, and actually I did catch some
of these (the SPR size one) when running kvm-unit-tests with TCG. I
ported it to powernv too. I wonder if we should merge pnv-test into
kvm-unit-tests.

> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  target/ppc/excp_helper.c | 27 ++++++++++++++++++++++++++-
> >  1 file changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> > index 287659c74d..5f0e363363 100644
> > --- a/target/ppc/excp_helper.c
> > +++ b/target/ppc/excp_helper.c
> > @@ -133,6 +133,31 @@ static void dump_hcall(CPUPPCState *env)
> >                    env->nip);
> >  }
> > =20
> > +/* Return true iff byteswap is needed in a scalar memop */
> > +static inline bool need_byteswap(CPUArchState *env)
> > +{
> > +#if TARGET_BIG_ENDIAN
>
> TARGET_BIG_ENDIAN is always set for softmmu mode. See
> configs/targets/ppc64-softmmu.mak

I see, I just took it from translate.c and actually stupidly forgot
to actually call it here :) I'll fix it up.

Thanks,
Nick

