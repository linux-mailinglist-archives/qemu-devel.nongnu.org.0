Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A9F4AD57C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:27:43 +0100 (CET)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNio-0005U9-Hv
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:27:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHNb5-00071m-Ku
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:19:43 -0500
Received: from [2a00:1450:4864:20::32c] (port=38540
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHNb3-0004RG-Nu
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:19:43 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so994941wme.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yod2CPGFw7c9c+iB/b9zvtNyMGeOf0+vIu17LP0GihE=;
 b=ewriFT7FuFnVgCuSIaVay1FONF5rd4f59RRAwkGlna69hdCF95Vfw+Y8HXi35WHswG
 lTxtuf/AI1ecTA+a/Vd8CBFdvtzygVWjcaVb7IZYM6LNk45GC66gI61+McDeC7aOYdAJ
 DrHJEnDd79QhKYvwdyOyGntaqZV5YCWn904FwxUV5pqHHPPrV3nUbd/aQpKn/PlCwr8J
 EhKBvFtE1ADh+O05ECCbZkrgoYW0BAZeUFXrywKMmlGv4EWE8Tncm1/VAQLm0TkLYEPS
 AVUHvJJYcyVeQnx7pwN8NAj6WYuH6tv2tSc1XE3hFg673TzPShq47QPC9tIBOGcn2rZW
 2elQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yod2CPGFw7c9c+iB/b9zvtNyMGeOf0+vIu17LP0GihE=;
 b=N5lr7MYmeg+8b3u1G1etg0YelDdRl369Xcg+PtUKses5hEvcrLv7beImUMxlU+1J7U
 42DIZJ8IBiEbdyU+BEMqhg5I2onfA9QOP+jM/bsIh3WnNnPajFMl5scjp8dGpk6Ig8OL
 IczkCVWfVxRudKH8TA6iX9gaPxXA2x0crPIeoHwAqAC99UxfcUtVORSa2kJiNmT9wwn6
 Z1/flofN/GfX8oaARswiCkDMq0xOi+i81VjszyF+R3KYBG0meinqnrYlLm3ATFR4GN9j
 n11Mofen/MoILl/6za++wsiWN40KgZVbaBGuX80luxfogk1hZ8In9jM3qmCLHZFx8ugh
 N4Vg==
X-Gm-Message-State: AOAM531bG5UxJW9P4WlkABRXqyZVCPLaMgPIw1MIHm6ba574navWwWZU
 CU/qDzxPLg82zgL5G7L+Vi2WLT9TVQ4bIl5hM5V8fHFaF2s=
X-Google-Smtp-Source: ABdhPJy1lF8pZPydLxnR57JUzcClLYOWWPMXw+sRdqMJY0aL2THy2VrNzZYhKnj/dW6IjtzuaZZ4C3r64bHj0OLXw6Q=
X-Received: by 2002:a1c:544d:: with SMTP id p13mr502832wmi.37.1644315580041;
 Tue, 08 Feb 2022 02:19:40 -0800 (PST)
MIME-Version: 1.0
References: <662aca02-da99-524f-d9df-cd61427ca520@ispras.ru>
 <CAFEAcA_U1hgz55mGX7DZp36aOHGriU0wjr9Dvt4Y=f2EGNgF+A@mail.gmail.com>
 <6bf3ba6a-0694-21c6-dbcc-d77f69fda4cb@ispras.ru>
In-Reply-To: <6bf3ba6a-0694-21c6-dbcc-d77f69fda4cb@ispras.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 10:19:29 +0000
Message-ID: <CAFEAcA9Td+1f+qDgSrbm=SScqK4TODH9atq95k7Tg0vM0E5x3g@mail.gmail.com>
Subject: Re: target/arm: cp15.dacr migration
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 04:56, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wrote:
>
> On 07.02.2022 16:44, Peter Maydell wrote:
> > On Mon, 7 Feb 2022 at 12:13, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wrote:
> >>
> >> I recently encountered a problem with cp15.dacr register.
> >> It has _s and _ns versions. During the migration only dacr_ns is
> >> saved/loaded.
> >> But both of the values are used in get_phys_addr_v5 and get_phys_addr_v6
> >> functions. Therefore VM behavior becomes incorrect after loading the
> >> vmstate.
> >
> > Yes, we don't correctly save and restore the Secure banked
> > registers. This is a long standing bug (eg it is the
> > cause of https://gitlab.com/qemu-project/qemu/-/issues/467).
> > Almost nobody notices this, because almost nobody both runs
> > Secure-world AArch32 code and also tries migration or save/restore.
>
> We actually did it for reverse debugging of custom firmware.
>
> >> I found that kvm_to_cpreg_id is responsible for disabling dacr_s
> >> migration, because it always selects ns variant.
> >
> >> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> >> index c6a4d50e82..d3ffef3640 100644
> >> --- a/target/arm/cpu.h
> >> +++ b/target/arm/cpu.h
> >> @@ -2510,11 +2510,6 @@ static inline uint32_t kvm_to_cpreg_id(uint64_t
> >> kvmid)
> >>            if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
> >>                cpregid |= (1 << 15);
> >>            }
> >> -
> >> -        /* KVM is always non-secure so add the NS flag on AArch32 register
> >> -         * entries.
> >> -         */
> >> -         cpregid |= 1 << CP_REG_NS_SHIFT;
> >>        }
> >>        return cpregid;
> >>    }
> >
> > This change is wrong, or at least incomplete -- as the comment notes,
> > a guest running under KVM is always NonSecure, so when KVM says "this is
> > DACR" (or whatever) it always means "this is the NS banked DACR".
> > (Though now AArch32 KVM support has been dropped we have some flexibility
> > to not necessarily use KVM register ID values that exactly match what
> > the kernel uses, if we need to do that.)
>
> Unfortunately, I can't test anything with AArch32 KVM.

As I say, it doesn't exist any more, so you don't need to.
In any case, this patch isn't sufficient on its own.

thanks
-- PMM

