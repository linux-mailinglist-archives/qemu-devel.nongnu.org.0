Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A4530E88
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 13:09:42 +0200 (CEST)
Received: from localhost ([::1]:55974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt5wS-0007c0-Us
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 07:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt5jM-0007PH-Qo
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:56:09 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:45889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt5jH-0004Cv-0J
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:56:07 -0400
Received: by mail-yb1-xb34.google.com with SMTP id b124so12686982ybg.12
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 03:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=awegB8OFbldli0p5F0DajVz7a15Uup5UV/uPDI7w2xk=;
 b=PUttnVemG8qEG9WLcec/dwis/OxdAnLljxUbu23ALEGZygtQpVG2Wkz1WAmK+elEZ7
 J8QR8Olw7eP/jQK+J9CPx2dUEFC1OedRlfOQ5H63tZBOvFrOw18bLeLzFlzhHrxa4WSr
 dnOSBJyf4h+g+046lxi1k90Dt2NsfiGCRwx8CreAMV7c3U6OT4tWcA00f20wRuFBMKSa
 +RBzuaFlGPvWkdeOCQNlP7JA1ozVQRw9YcygOG8yiW7esjKTU6bd36gX0v1VtlirIKnm
 dohkMfZzdv094Y2oFRZbpt4GAkR/SElJFvKHLZJOEzAYF/Py3EUcV9Dj1DvMqnCeojda
 EegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=awegB8OFbldli0p5F0DajVz7a15Uup5UV/uPDI7w2xk=;
 b=IE6RmEa5Uzl0PhjkgEmu74/tvVMo61Yh7oFdmQNhW1lQ6vKi4uvE3wu17M7Lee4LQ4
 wZv4Mxb3qLD0QZadAOKBJ2bi7tZ095JZht576GOUw5TRCy6pFPtI/JugDp9xoMQHap0m
 ZWL2hwZBnguAVzTH89En3nlJ0s0329qcjEGY3O3bGdJOwYASh8PCp9wAUTarCC0ctYo+
 J3ssNxGjmhETrzCHe1LFi7jlNdc/Ku7ehg3Lg8s7JlQrKDHcTsqMHRwlFTx8QLJ/1n8m
 VGIbY7UhxGau1k8P9GKI8FfsOYRfhyl2nPT3KmKINvXmuUmm/+27PEIiMKkE+lXb+C5I
 MlDw==
X-Gm-Message-State: AOAM531o4acwBLEtPxbT4TYqpmncbo4oRYArTwkKdWbrsU/g/Rs5xu2J
 cvrpFAtoIzuD47Fd28rUzN14Va60H0jrS0L567hz/A==
X-Google-Smtp-Source: ABdhPJx5ixkDS9a8HXx2yvVjESx7pjWtI1WMDIvhzMSwYEs9Df2C8BMkLFCWVlpICiwj0SoVfjRHepaFWEXRjSvgsw8=
X-Received: by 2002:a25:2e06:0:b0:64d:b6a5:261a with SMTP id
 u6-20020a252e06000000b0064db6a5261amr20147049ybu.140.1653303361836; Mon, 23
 May 2022 03:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-6-richard.henderson@linaro.org>
 <ac96f55e-8884-e763-6308-6b41a89eb46a@linaro.org>
In-Reply-To: <ac96f55e-8884-e763-6308-6b41a89eb46a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 11:55:50 +0100
Message-ID: <CAFEAcA_qf0VGksQTYZR953+Q1M6EkWcESKxgFEPg1JAyzi8WYA@mail.gmail.com>
Subject: Re: [PATCH v3 05/49] semihosting: Add target_strlen for
 softmmu-uaccess.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Sat, 21 May 2022 at 05:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/20/22 17:03, Richard Henderson wrote:
> > Mirror the interface of the user-only function of the same name.
> > Use probe_access_flags for the common case of ram, and
> > cpu_memory_rw_debug for the uncommon case of mmio.
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> > v3: Use probe_access_flags (pmm)
>
> Ho hum.  MIPS still selects semihosting without TCG, which means that
> probe_access_flags is not present.
>
> At present I'm assuming that semihosting can't work with KVM, and that we should disable
> the feature.
>
>
> r~
>
> > ---
> >   include/semihosting/softmmu-uaccess.h |  3 ++
> >   semihosting/uaccess.c                 | 49 +++++++++++++++++++++++++++
> >   2 files changed, 52 insertions(+)
> >
> > diff --git a/include/semihosting/softmmu-uaccess.h b/include/semihosting/softmmu-uaccess.h
> > index 03300376d3..4f08dfc098 100644
> > --- a/include/semihosting/softmmu-uaccess.h
> > +++ b/include/semihosting/softmmu-uaccess.h
> > @@ -53,4 +53,7 @@ void softmmu_unlock_user(CPUArchState *env, void *p,
> >                            target_ulong addr, target_ulong len);
> >   #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
> >
> > +ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr);
> > +#define target_strlen(p) softmmu_strlen_user(env, p)
> > +
> >   #endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
> > diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
> > index 0d3b32b75d..51019b79ff 100644
> > --- a/semihosting/uaccess.c
> > +++ b/semihosting/uaccess.c
> > @@ -8,6 +8,7 @@
> >    */
> >
> >   #include "qemu/osdep.h"
> > +#include "exec/exec-all.h"
> >   #include "semihosting/softmmu-uaccess.h"
> >
> >   void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
> > @@ -23,6 +24,54 @@ void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
> >       return p;
> >   }
> >
> > +ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
> > +{
> > +    int mmu_idx = cpu_mmu_index(env, false);
> > +    size_t len = 0;
> > +
> > +    while (1) {
> > +        size_t left_in_page;
> > +        int flags;
> > +        void *h;
> > +
> > +        /* Find the number of bytes remaining in the page. */
> > +        left_in_page = -(addr | TARGET_PAGE_MASK);

This works but I'm never really a fan of expressions that mix
arithmetic and logical operations -- I always have to start writing
out bit patterns and checking what 2s-complement representation
involves in order to find out what they really do.

left_in_page = TARGET_PAGE_SIZE - (addr & ~TARGET_PAGE_MASK);

seems to me like it would be clearer.

You're correct that MIPS shouldn't be selecting semihosting in
a KVM-only compile -- there's no code to handle getting from the
guest executing the sdbbp insn to QEMU userspace to the code in
QEMU to deal with a semihosting call.

So for this patch:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

