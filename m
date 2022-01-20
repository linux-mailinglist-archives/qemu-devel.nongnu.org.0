Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6B3495352
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:34:20 +0100 (CET)
Received: from localhost ([::1]:59118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbKF-0004Hu-8o
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:34:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWdf-00038a-3f
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:34:03 -0500
Received: from [2a00:1450:4864:20::333] (port=53831
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWda-0001J9-Ib
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:34:01 -0500
Received: by mail-wm1-x333.google.com with SMTP id n8so11751619wmk.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BLNlod0Z9IcYl6zl7EwGYDyiwNBP/JJpIw6rTP7cNV8=;
 b=jOSQu5UjR3go5m8FGkCFR0ENf0IdxdbGiJRmTxevhLGItwnQSoOYppgfI8DW87I9dD
 gxFnLHmExRfvWnl/27AGkaYkxqXlxuSE+OgxTjg+DPWcN2oQNXdK8VZXbQ3NAJu29MFN
 ruXw48M4v8PQhEd3K+rVRz/VqmvxGP/XsQPblYWhIkTymNXBl349SMgS64J5XhIsAWKn
 A39FyagE/i3WWlmM5awMkB1/44st+NwWDOJN+w3BV+ar28/LKD/NjbElMvDoCYSN/zuQ
 l19xvvNH1i4STi+lS0fPCk4gcfmk64DkzMYU9mhHzNN4EZuH6Mlzby5zHaPc5t0JDUus
 F/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BLNlod0Z9IcYl6zl7EwGYDyiwNBP/JJpIw6rTP7cNV8=;
 b=G3L7WW5Jiuu61Z80QQvsUcOoQR3uAa++WibE9juCv/JVATmKkAFckXBL3tFMI3CtSz
 v7hG4ZxrpsiJR7p7HfFnnnLztNnkhaZ/DxHYRO8UKFsE8VMufMjETmnNRdAIjQOBCG7A
 Q7vHahrEI/ZsPNDnYrSbYKs2onyKiI1EvF/1ZzkczkXXic0njxYFQhkMhSKwxFVo5vjX
 ZWmIkKgGP5mSJ9qqU13iPbE1VPKr7li4LzeT+m6Pn1p3DxN4kapRpMjQDRNmTDxUgAAo
 /G/U4WA0ML/mp2xJT2Wv3+TUCRgXd805/twxdja5b9hBaEaHNw448+3yJmrcM7r7jEVT
 SkPA==
X-Gm-Message-State: AOAM531yjK0JK9oNc6T88lhKNBC2K2TQEZS09WXEFFBQa/tSqPFU/8kb
 lME/TOGJ/eI6aChQtgGOCJGcTaqxdgn4U+j5eGI2Aw==
X-Google-Smtp-Source: ABdhPJxaHj+RWe4IwrA4TF23mi3Yap+RPJMiXpWWNp0UXKU5q2/IbLUEBJ6qYOP3SLNvjRwEDPlNB6IpZWuAfESUac4=
X-Received: by 2002:adf:bb52:: with SMTP id x18mr3500604wrg.319.1642681969891; 
 Thu, 20 Jan 2022 04:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20220114004033.295199-1-idan.horowitz@gmail.com>
 <CAFEAcA96gKH8r_a2aV0bfcOR418WnRkmEsV73Uss0kDEQ2Tx4w@mail.gmail.com>
 <CA+4MfE+nh4LRAbmT2GnNiZWTU=xfmkReNWWTgOhqWLddXdV_hQ@mail.gmail.com>
In-Reply-To: <CA+4MfE+nh4LRAbmT2GnNiZWTU=xfmkReNWWTgOhqWLddXdV_hQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 12:32:38 +0000
Message-ID: <CAFEAcA-MnRazq5GNZSbK_a_LmF3F4dcaJWadR9ni6JeS9wPhug@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Allow only specific instructions based on the
 SCTLR_EL1.UCI bit
To: Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Jan 2022 at 12:00, Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> On Thu, 20 Jan 2022 at 13:42, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> >
> > But for all of these instructions the reginfo struct
> > sets ".access = PL1_W". The .access field is always
> > checked before the .accessfn, so for any of these instructions
> > executed from EL0 I think we will always fail the .access
> > check and UNDEF the insn without calling the .accessfn.
> > So it doesn't matter that the .accessfn has "if EL0 then
> > check SCTLR_EL1.UCI", because when running the accessfn
> > for these insns we can never be in EL0.
> >
> > Am I missing something?
> >
>
> Hey, you are not missing anything, this patch indeed does not change
> any external behaviour.
> I should have specified, but the point of this patch is optimization:
> during benchmarking of the various AArch64 instructions I found that
> the cache flush instructions were quite slow, simply due to their
> heavy access functions, so this is an attempt at simplifying them.

But the code you are effectively removing is never executed
for the instructions where you're changing the access function.
If you're proposing this as a performance improvement, can
you provide before-and-after benchmarks demonstrating that
improvement ?

thanks
-- PMM

