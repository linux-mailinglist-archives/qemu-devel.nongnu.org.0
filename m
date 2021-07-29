Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5501D3DAB49
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:45:57 +0200 (CEST)
Received: from localhost ([::1]:38872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9B2Z-0001jY-Qz
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1m9B13-00013f-Bs
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:44:21 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:41943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1m9B11-0007Av-Rm
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:44:21 -0400
Received: by mail-lf1-x12c.google.com with SMTP id y34so12797461lfa.8
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XFE3Bn4De7JTR/GpwAdD8JE2K5FV0QKHVanE7DAjP/o=;
 b=SDXDu0/Op3AHFOSZR7En8mjY0XPXo8d2H5qoRVNvjfGepyIdYDik2Ea43muxqlVoWL
 B9iA/fq/GIIDnc0RwhPCSfzgGDd2ve0y947hwcbL3Q9iVwHUIv4kPISs4L0rMvCtTujH
 1G4mqHjdMbIMSJ0IflP2IuItwx/chtb/aV69cLNIWPxAIfhK77idqHx1k7GmpSTDsBJs
 VsG1lLaRXUfftmfcV2AOaNfpY3leIAlMj7QR275myYlCQ6/YmyWUP2QSmal7Dg2Xl86x
 e1dQUJoYc3PU2POeS8fZZa8OgSPagx7SLUxOFWmFxtkysxngQs3RYKvgRje3C8aKVZyb
 2eVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XFE3Bn4De7JTR/GpwAdD8JE2K5FV0QKHVanE7DAjP/o=;
 b=mImSwNdRfPvV6N4jvQvppmIrFVIT+rCKCCJo1Xtj7JDOY/pWNzIBBd0smHdw3py7HI
 kaAQFdmLVC37dDIMLOBcAdOr0OlvbR4W6r+HRHibjpGA+YVOvpto6w99iBID6tfmxOPv
 ErObib38rK2hlYxLjkyBQTGSbocPODFk1+igPtIuV64MPLUKswEW0CTwBJwH18+6tr4j
 s27ysz0otda8Zx69hmZ0FQWJfrdRW1UnkvUEjkTQYn3hHM3oeiapbgYV3Sj2tTYVZhoO
 OWDEmKJX04sCeSUVTck6hR886cDw9z3q8gEiHBG2nYTkiN0gy+tgRqUhmzDsQXsOIPTr
 aFkw==
X-Gm-Message-State: AOAM531jV+oy6Vvz7OescfZSrIn7782Oymqgf5xQFa+IbG0wpkf7GBSD
 v5il+nt0Cyu9yvZCF9kniWw=
X-Google-Smtp-Source: ABdhPJw+xj0w2JlmyQzXdcxpCDLwjvweXfxTnDd/0fxGTZClE3QREGygPBAitrD8CC0imBmooQx5QQ==
X-Received: by 2002:a19:7101:: with SMTP id m1mr4945207lfc.233.1627584257483; 
 Thu, 29 Jul 2021 11:44:17 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id j14sm411829lfc.20.2021.07.29.11.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 11:44:16 -0700 (PDT)
Date: Thu, 29 Jul 2021 20:44:16 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-6.2 05/43] target/microblaze: Implement
 do_unaligned_access for user-only
Message-ID: <20210729184416.GD3586016@toto>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-6-richard.henderson@linaro.org>
 <CAFEAcA-gkse1PAzXuOwCrEbQXDiaMRWctyFSk46CC=A=oZg_tw@mail.gmail.com>
 <890da7f4-accc-078e-e731-72d48c2122eb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <890da7f4-accc-078e-e731-72d48c2122eb@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=2.896, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 29, 2021 at 08:00:50AM -1000, Richard Henderson wrote:
> On 7/29/21 3:26 AM, Peter Maydell wrote:
> > On Thu, 29 Jul 2021 at 01:54, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> > > 
> > > Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > ---
> > >   target/microblaze/cpu.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> > > index 72d8f2a0da..cbec062ed7 100644
> > > --- a/target/microblaze/cpu.c
> > > +++ b/target/microblaze/cpu.c
> > > @@ -367,11 +367,11 @@ static const struct TCGCPUOps mb_tcg_ops = {
> > >       .synchronize_from_tb = mb_cpu_synchronize_from_tb,
> > >       .cpu_exec_interrupt = mb_cpu_exec_interrupt,
> > >       .tlb_fill = mb_cpu_tlb_fill,
> > > +    .do_unaligned_access = mb_cpu_do_unaligned_access,
> > > 
> > >   #ifndef CONFIG_USER_ONLY
> > >       .do_interrupt = mb_cpu_do_interrupt,
> > >       .do_transaction_failed = mb_cpu_transaction_failed,
> > > -    .do_unaligned_access = mb_cpu_do_unaligned_access,
> > >   #endif /* !CONFIG_USER_ONLY */
> > >   };
> > 
> > If I'm reading the kernel sources correctly, for Microblaze it always
> > fixes up unaligned accesses, so for our linux-user code we want
> > "ignore unaligned access errors" rather than reporting them up
> > to cpu-loop.c, I think ?

Yes, I think so.

> 
> Ah, in that case we should not be setting MO_ALIGN for some -cpu xxx, I
> think?  Or does the MSR_EE bit cover that?  Anyway, it looked reachable at
> first glance.

Hmm yeah, perhaps we shouldn't be setting MO_ALIGN for linux-user...

Best regards,
Edgar

