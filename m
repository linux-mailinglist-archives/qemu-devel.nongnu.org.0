Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0A46194F7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 11:59:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oquPQ-00017n-Ba; Fri, 04 Nov 2022 06:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquPI-00016c-D5
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:58:40 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquPG-0001pf-TF
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:58:40 -0400
Received: by mail-pl1-x635.google.com with SMTP id y4so4548167plb.2
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6eQnMFRq+0jX07f3sVeSEhNp3L0U8ozJCTQw23crN94=;
 b=G6FFCQvC97B5IeLhL4riPrxFt/GnDHcK/6mzFnc0i69l+JLNlBX8x6PwBQYyQm6KCv
 AWYJyMZ2i2KvsXvZV9/2H/Z50FqV9QTiNM+vnAvCLKwEMtJfX14yo2bU0xeAb2xHKj+C
 T3QPhYbojODYSu42bH3ZRy5MN5ehOtTjnHZI33WoFsQALvtWiIOXJmkY823G7Y/QJjPR
 OYnR4CjtXMinhIb7Iy8ypavZ9N1s/uD2TlINSwdCrUz0qc6Mmp+ycQLuHAWCULJhaZO4
 YCXPPBR2gzxGMPCq150xvvOOz+9vUDoElJSVq0F1k3CYm3aZ/FAEh/1hoIXhdXPOK6rh
 pQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6eQnMFRq+0jX07f3sVeSEhNp3L0U8ozJCTQw23crN94=;
 b=1IhjHuOfq7fgTPQfoCt7rkSNa2VQ02jazLEmgEDuZnbxilDvLeqeFRSr0p292245AH
 ycaI8Hm1U/MqoTSIxb4zxMELA1kaNdiT8lkzB7tlEIYuQPitjI9j7ZNIkR6dBpLHIRl8
 MWnLIBkgtYImKzDZGrA9VTAzsxAbNCjKE5+hSCM7IXYaV+92hJBf9v9D15bM41/YM56X
 HTSizO2wG7uG83s88eo1+/x7nRhNNcswzHg0EdgWsBAXExaMJKqPqDVbkzCHCPxYcvzn
 ajdgE6Bp7zvBzhxKv7KDFoW7qgTUoO3Q1d+4DTwVzVfrXhtnpz8SjERt0n+/aCMtPvM+
 gBng==
X-Gm-Message-State: ACrzQf3Z7CdAOqtXNjcc1VOWEJzMhXJOX+uk87JhYYL5enb4ObMLaYhs
 odCaeFaH4qxSrd5dPBlyeyhSai+qXF/K6L5z/1BRDw==
X-Google-Smtp-Source: AMsMyM6PGNTEqHDeaREmKMHlk6GbhWmScrfGCwloZs8/qayDASiS7Z8us21FS1HBjazNCiMvXUeHY10Fy+ExptW0FXI=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr35036416plb.60.1667559517488; Fri, 04
 Nov 2022 03:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221102054706.1015830-1-richard.henderson@linaro.org>
 <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
 <2d9a7f5e-0ec0-89da-53f0-b5624f540ae8@linaro.org>
In-Reply-To: <2d9a7f5e-0ec0-89da-53f0-b5624f540ae8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Nov 2022 10:58:26 +0000
Message-ID: <CAFEAcA-XqHm+bFk4QSzG=QJCwUncGmD43qxK0FBSXZbVaPY4pQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Two fixes for secure ptw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 3 Nov 2022 at 20:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/4/22 00:19, Peter Maydell wrote:
> >> @@ -2671,6 +2671,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
> >>       bool is_secure = ptw->in_secure;
> >>       ARMMMUIdx s1_mmu_idx;
> >>
> >> +    /*
> >> +     * The page table entries may downgrade secure to non-secure, but
> >> +     * cannot upgrade an non-secure translation regime's attributes
> >> +     * to secure.
> >> +     */
> >> +    result->f.attrs.secure = is_secure;
> >> +
> >>       switch (mmu_idx) {
> >>       case ARMMMUIdx_Phys_S:
> >>       case ARMMMUIdx_Phys_NS:
> >> @@ -2712,12 +2719,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
> >>           break;
> >>       }
> >>
> >> -    /*
> >> -     * The page table entries may downgrade secure to non-secure, but
> >> -     * cannot upgrade an non-secure translation regime's attributes
> >> -     * to secure.
> >> -     */
> >> -    result->f.attrs.secure = is_secure;
> >>       result->f.attrs.user = regime_is_user(env, mmu_idx);
> >
> > Do we also need to move this setting of attrs.user ?
> > get_phys_addr_disabled() doesn't set that either.
>
> I don't think so.  The only cases which don't pass through the setting of attrs.user are
> the two Phys mmu_idx.  Which was by design per the comment up there about artificially
> deciding which EL regime they belong to.

OK. Do we ever do anything with the attrs for a phys tlb lookup
except use them internally for details of the stage 2 tlb walk ?
I guess they get used for the memory transaction to do the walk.
That matches the old code that just had a local MemTxAttrs in
arm_ldq_ptw() to do the walk which therefore implicitly got
user == false.

-- PMM

