Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035ED441F65
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:36:06 +0100 (CET)
Received: from localhost ([::1]:33732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbE4-0007it-SY
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhb4F-0007oC-UU
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:25:58 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhb4E-0000BB-0R
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:25:55 -0400
Received: by mail-wm1-x32a.google.com with SMTP id 133so4616453wme.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iCOy8g6b3t+MALRPgEdqc+YQil4cDAdNbp3gsrEXZX8=;
 b=QCTLEfK95GCgbUJzR9hIP5wAS5G8a8yFO/MrwxmGpDpoh2gCa1RAD5ZF/GIqv0qZov
 ulvM0j9QCQe+Tc/rUsMMKhZBFRLBb8HoDq2C1NwMwlSmNAdTdJhhiHPGg0hQkIP9PjBd
 5TB8mpOq4Hx/URJEMP4TxAstpOD4Lt7VXFpprkcBJ2PFJ2LuWLDpsiSsxdCGOGzRc+CI
 3WGmrNScNCTIAn863OSdS8JRRpqnz+dmaY3NJZ3wNI9mz99UpNX46+fad6NPHyAN/Fy3
 bRLFMh4Cu6/nxzM8X1j/HRc3n/3WBLxElCmhz3J53v6mPocldV+6XJAqSNDUksbahQXS
 BCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iCOy8g6b3t+MALRPgEdqc+YQil4cDAdNbp3gsrEXZX8=;
 b=tjnx538vGaXoHkdpJKz1nohleCSBEkNyVssFxjxD4/h77bwxNKwhvklO7qs+SSCCWQ
 1bUyORjBX0bWgtnIV8bdJK4bvRwh9m7/PyOr3w2/eXkSblFoG5xPdeXPqocGbqUKMp9k
 y+S7b12iyJixUyXC8aes1TRLJMME2XhvOjYw77hSsGJcschYfZDzNYn40ouloG6BHHry
 a7tGw3waIaMN1BFSn1NPy/IUeAVDi/1T6ZYx4fMtt0rjP2TN/7UAMF2uakqoZaMnFHgc
 cZgxEKkdS5jNgs7Stq8g/qcFaRNeYZLzphbT0LJhE2mzILAx2kvRzIRiLACfdTnY2UoQ
 XmYQ==
X-Gm-Message-State: AOAM533ytJSJhb7NNwkf731mzG9STOWpVfJMoNAM+Dg38yNm5tRHbL3o
 B8ofLJM1kzaq6N97eE/kFjWxLHClGuj4HUpEbfC7jg==
X-Google-Smtp-Source: ABdhPJxJ0QzYpQZPd8LdnjxbdPoQnW3GurrP4YIr/ewtGCc/V4IpsaXpyy1htvD0j9PTEw9AmNU68KQ1rhM8iiKThBA=
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr287912wmq.21.1635787551079; 
 Mon, 01 Nov 2021 10:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-24-richard.henderson@linaro.org>
 <CAFEAcA-h7xhKFTjOKgOw22Le2wQPUaT2VxtFcNFMP=xHs2stFQ@mail.gmail.com>
 <c194f037-87dd-0b6a-2776-0724aef4b223@linaro.org>
In-Reply-To: <c194f037-87dd-0b6a-2776-0724aef4b223@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:25:40 +0000
Message-ID: <CAFEAcA9wTNNdSzMNV5jyzNCOgJV26uvHQQb8MAG8_ane8kc1zA@mail.gmail.com>
Subject: Re: [PATCH v6 23/66] target/arm: Implement arm_cpu_record_sigsegv
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: f4bug@amsat.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Nov 2021 at 17:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/1/21 12:30 PM, Peter Maydell wrote:
> > We seem to be restricting tlb_fill to sysemu already.
>
> Not true:
>
> > -#endif /* !defined(CONFIG_USER_ONLY) */
> > -
> >  bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >                        MMUAccessType access_type, int mmu_idx,
> >                        bool probe, uintptr_t retaddr)
> >  {
> >      ARMCPU *cpu = ARM_CPU(cs);
> >      ARMMMUFaultInfo fi = {};
> > -
> > -#ifdef CONFIG_USER_ONLY

Yes, that's restricting tlb_fill to sysemu only now (in this patch),
not "later", right ?

-- PMM

