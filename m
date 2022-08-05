Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0522A58A9D3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:58:58 +0200 (CEST)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJv2e-0005ZZ-IH
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJuzB-0000e0-5r
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:55:21 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:36659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJuz9-0005VJ-I9
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 06:55:20 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31e7ca45091so20824717b3.3
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=aWgNgq87BiMzqr6FacSOHVfmv49hvt9KMA9PEOwdIgM=;
 b=pwM/nD2LCL9qtstFbb0az9WZZSgra61/FGWHELV+g69pGVRFlCJe2qGUMzw1v1fZxP
 VIbTDDC9ojCJcrL6VSe1d/YUiwM9V8zQwPlcoBcNCTxU2sZIZx/6JUq2W3iKBi3iCmnW
 F3VgKA9J5F46u1WokJGt4fYiK0Rqf/HlVD+QxfKpYJV5IOGwq9WAaEXxXKpa5e0o1chc
 0BJHJMWrHNovojxEevs1V7l9M4UVvtAr5RRtx94f/VBoFpaakTa4JP/aCaPNP9Zy1KTD
 U2Rhf/9JEjCEDgVeQAROyJAIe4yfhjRre6RB7UAWDOPe34UdIyEVJw6P96h/mNhuzZGC
 oG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=aWgNgq87BiMzqr6FacSOHVfmv49hvt9KMA9PEOwdIgM=;
 b=t3Nrk/0dGfcQB/j6Qzdr/8HHr4zxYOkBeVHI68Vseb9Ib/9Gp5IGjhMKlVcRkNKNGI
 up7fcAv0G9tPBzvZ2Mk1p05KK0v5mpBp6XiZ4/2suKlpI+IadhLFQrRNe1a3PLFCbKcb
 jN9G1DfouChXWuheoEEvQM+JDaVNwnr7yxQV3IqdskpaZyI75kxJ/feVh4Zi6vallHBs
 ZHfpql0IIXc9uOKu/6PAPwbaoteMYunRjdDsn4968VWcq3VYhhhQ58rUbj1U4w4pACow
 9i6hlDWVGNmiR6f8DsgydsE4SgVYEgtrCcxPLFYaebNVspErLcg/km+Mue1DUDAVuPbK
 kdrQ==
X-Gm-Message-State: ACgBeo0JDUGr8ji9jiD8DD/ueiaawERWRmIPgMYHkqTHk51hcy56kz+G
 NNmaQ5kyDnD2+cK4+FvvzRialSK76jNjwiysN2t+iQ==
X-Google-Smtp-Source: AA6agR6C6AyITaDOK7mhbOXU5bIOyz9QoxQrjvpTJ7xN21hpGCW6f8Vm/+7Uab71Hnv1IY1jnqS73sCrDyc5bz1dBTQ=
X-Received: by 2002:a0d:d2c3:0:b0:31e:62ea:3303 with SMTP id
 u186-20020a0dd2c3000000b0031e62ea3303mr5518094ywd.64.1659696918577; Fri, 05
 Aug 2022 03:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182359.830058-1-iii@linux.ibm.com>
 <20220804182359.830058-2-iii@linux.ibm.com>
 <CAFEAcA9FG+b4=-QNujG5Prx_me8uw7YTWjk-mqr3_X1Wb0wHzg@mail.gmail.com>
 <6aafa461732e7c98670c0e9c765cc95a5d88e8f0.camel@linux.ibm.com>
In-Reply-To: <6aafa461732e7c98670c0e9c765cc95a5d88e8f0.camel@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Aug 2022 11:55:07 +0100
Message-ID: <CAFEAcA87Zfgnrsut6Ld3Zen+d8wc0O6kGx+TLL7ERMD_6So3rg@mail.gmail.com>
Subject: Re: [PATCH 1/2] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, 
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Fri, 5 Aug 2022 at 11:28, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> On Fri, 2022-08-05 at 09:50 +0100, Peter Maydell wrote:
> > Which guests do you observe this on ? I think we should indeed
> > fix this in the translators. More specifically, I think we should
> > get this correct already on Arm, and I would expect it to work
> > correctly on all the fixed-insn-width architectures, which can't
> > have page-crossing-insns to start with. x86 probably gets this wrong.

> I first discovered this on s390x, and then realized x86_64 is broken as
> well. Fixing this in translators means adding page boundary checks to
> all code loads. Actually, on s390x it doesn't look as nasty as I
> thought it would, since we quickly figure out the length and load
> everything in one place:
>
> $ grep ld.*code target/s390x/tcg/translate.c | wc -l
> 6

Yes, it depends a bit on the translator and the architecture
how painful it is to get this right. Note that it's OK to
be pessimistic about whether an insn might cross the page
boundary (you end up with a 1-insn TB for it, which is a bit
inefficient but not wrong behaviour). For Arm we check this kind
of thing in insn_crosses_page() (original fix in commit
541ebcd401ee in 2015, cleaned up to be a bit more efficient later).

I think also that this bug is not specific to linux-user.
In a case with a TB like:

 load/store insn that should fault
 other insn that spans page boundary into a non-executable page

ie where the translator failed to break the TB before the
page-boundary-spanning instruction, we will report the fault for
the execution on the non-executable page, when we should have
reported the fault for the load/store, and this happens in system
mode as well as linux-user.

> On x86_64 it's as bad as expected:
>
> $ grep x86_ld.*code target/i386/tcg/translate.c | wc -l
> 96
>
> Implementing this there would mean changing x86_ldub_code() and friends
> to macros, and then making sure we undo everything that we did since
> the start of the instruction. E.g. bt/bts/btr/btc mix parsing and
> op emission. There might be something that touches DisasContext as
> well. Therefore I thought that the generic approach from this patch
> would be more reliable.

No surprise that x86 is a mess :-)

-- PMM

