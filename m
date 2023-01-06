Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0136606F1
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 20:13:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDs8g-0006MP-Cg; Fri, 06 Jan 2023 14:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDs8e-0006Lr-QF
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:12:24 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDs8c-0005Ii-LN
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 14:12:24 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so6097569pjk.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 11:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jUdaKqPCchsdehZg9U+3Y9vGMaKKcROpaopv049ndRQ=;
 b=KRemSDJimtheihLCCIvUvsYUdOz230jOvFB04aBwPkbLjCcRYZtcap4MRyeYlOq/GC
 PKYRhYAZ3imicdPPzm3+4v8+rUdk6HBckfZc4JeIWQAk/PYEoFeaSvCfMbWSArDkpxvg
 tb4eqGt4D4oiBGShHmyWniXzWByjzEuxQCXGb4yUz0p1SIJgnDF/121qWRIgeDYeZqhN
 WcH/SNeBSXUWYC8qE9RVSyz5v8ZEtHSc+JyL8ypyHohYBhQfZPxNAPSxGvw21/CEq+x1
 CNf1FzPHOI3EvzaDB5rXG8qek70OAsKtTh8UDPbLJsJ5LB0fbS6KMJitQ2Pt4jn42oO/
 FWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jUdaKqPCchsdehZg9U+3Y9vGMaKKcROpaopv049ndRQ=;
 b=BGm8GvbCJs4XbGu30jpBrJS6w7z5PCg71j1qB9Wno9w/IjGK59MuZQk1FLcEe76NEn
 7/abtkJFkL3hzGsygKDxGd9sq4kWsMd8Qe0A5NxjOyN/wWD0uTQ/r1Jcejk+f74jAimA
 gTnkKUHm8sbiLPIudYIUy6B95CfHukxCSi9bg/7uLvGgB+O293YRYeqGb+uIjjf9FHQN
 xYQsabJP8EuA6VrOZKD71X7K+jjz1tvy38oMFwZhey6qcG3Vkd932O9Lc8xWjbM69u87
 RWMGAGkmYs4KbhaZ3jz0TYhnnErA8CFbfIIPWbII8FryQU7uOqwagBjvzFNRFQyEloV5
 SAvA==
X-Gm-Message-State: AFqh2kopO6/T5ilboPLbs+jTbR7mUIvwQsm5tXSCioHnY8trYstbk6Q5
 7YEANXdraxqTNLFV4M5oTPs5J/6Nsrrz4218UaRnaw==
X-Google-Smtp-Source: AMrXdXuzR7Y2yyzyrByVd+5vroHH2BPdRzvDi9ck2njBkc6nOertWmB/kTq9pCeVvC4q3vXx7f9D/uG1+TjKgfLIwEE=
X-Received: by 2002:a17:903:2653:b0:189:cdc8:7261 with SMTP id
 je19-20020a170903265300b00189cdc87261mr3794768plb.168.1673032341062; Fri, 06
 Jan 2023 11:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20230103181646.55711-1-richard.henderson@linaro.org>
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 19:12:09 +0000
Message-ID: <CAFEAcA8K=1CNZfDG8i3bSXXSWT7D2oWg4jyupwYmw8oR7MJVsQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/40] Toward class init of cpu features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, armbru@redhat.com, ajones@ventanamicro.com, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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

On Tue, 3 Jan 2023 at 18:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The specific problem I'm trying to solve is the location and
> representation of the coprocessor register hash table for ARM cpus,
> but in the process affects how cpu initialization might be done for
> all targets.
>
> At present, each cpu (for all targets) is initialized separately.
> For some, like ARM, we apply QOM properties and then build a hash
> table of all coprocessor regs that are valid for the cpu.  For others,
> like m68k and ppc, we build tables of all valid instructions
> (ppc is slowly moving away from constructed tables to decodetree,
> but the migration is not complete).
>
> Importantly, this happens N times for smp system emulation, for each
> cpu instance, meaning we do N times the work on startup as necessary.
> For system emulation this isn't so bad, as N is generally small-ish,
> but it certainly could be improved.
>
> More importantly, this happens for each thread in user-only emulation.
> This is much more significant because threads can be short-lived, and
> there can be many hundreds of them, each one performing what amounts
> to redundant initialization.
>
> The "obvious" solution is to make better use of the cpu class object.
> Construct data structures once to be shared with all instances.

The trouble with this idea is that not all instances of the same
class are actually necessarily the same. For instance, if you
have a system with both (a) a Cortex-A53 with a PMU, and
(b) a Cortex-A53 without a PMU, then they're both instances of
the same class, but they shouldn't be sharing the coprocessor
register hashtable because they don't have an identical set of
system registers.

This kind of same-CPU-type-heterogenous-configuration system is
not something we're currently using on A-profile, but we do have
it for M-profile (the sse200 has a dual-core setup where only one
of the CPUs has an FPU), so it's not totally outlandish.

thanks
-- PMM

