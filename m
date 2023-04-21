Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136966EADD3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 17:12:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppsQP-0003H5-8I; Fri, 21 Apr 2023 11:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppsQM-00036F-BG
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 11:11:46 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppsQK-0002R4-Qx
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 11:11:46 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-504eccc8fc8so2554772a12.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682089903; x=1684681903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k+WRw2YpIYlBr5FzzuZUd9F+0uyvdpSEvz/22/EyJtk=;
 b=aMaDUeDoccqyPUvKefurc3ObbddqtdiXuh+p69FAv3Psx1n/+3qurBEdSZaEFMj82t
 cB3K0vHHJwL1RLjIodjCBc6AO+msruP+gzZQL1GZwHPNYVlc7hJmtALreNVVd95Ey0xN
 Bn8BSQseK/WmvWC7Vsx1Rfj2j0wy5gCn6YX+Hu57J2nQAO7UCyYJE+JbK3H//Xno1MmQ
 RaLMNutor8GvedlT7vMq3oJnDUwYabydtgxV8szwjNyV3dgxLdJd2LxXjhajpCyaFwnX
 cE//2M2+oLJUafcNNUq/UcIGVLdYqYWOHbMyNFxoqVK+QqglcS18sZJygJyKnKQfhypF
 hjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682089903; x=1684681903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k+WRw2YpIYlBr5FzzuZUd9F+0uyvdpSEvz/22/EyJtk=;
 b=BP5J6XiuImLGJ/cL51Ql7yNs4Bry1ANL4+Oru3faZ40e23tIEPsTin9rToz1W9YGGO
 /OSGHDtcRWHhwm6IsMqJh5UlCR3ax7AWRtvvoomWDbAlz9R4ODGW9YnHZqBPcXp2/IA3
 m6+4WqNTmYjk98G5ZcI+TvIksmVl/EH8q7ISvl1w9rRxwA/dYXkNh+aDfYQ3JukcHeli
 wk3I/SFwRhFYUKf+VlUmbZCbfX7rjv+MeJLVs0WPDVuWgB65HQI/3gaMnjcIXAO1fxFh
 Lgbd6ZLodgCzXsUeLfQ42tScKiyFbpJgYOPp2ufqIhMtLZre/l5MquA6Em6rdpLJqW3l
 hKxg==
X-Gm-Message-State: AAQBX9evVI9ZWLxUdURUySQ4SIkLM8m7+4d8wBZ46KwxqDodBLTNQY5J
 DAot/ohG4dGi7veHwmK2dAoakR0hX4maIpaZnTQ8mQ==
X-Google-Smtp-Source: AKy350YgIdVxnTnsMaZvd83k0UsS8iW69f2kkcyuXacBAGaDG2R9Ef7kXeOYma2pcFXLqVePPKQqquH2uhSsJtUiOtI=
X-Received: by 2002:aa7:c592:0:b0:504:b228:878d with SMTP id
 g18-20020aa7c592000000b00504b228878dmr5488694edq.25.1682089902940; Fri, 21
 Apr 2023 08:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230414105111.30708-1-quic_jiles@quicinc.com>
In-Reply-To: <20230414105111.30708-1-quic_jiles@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Apr 2023 16:11:31 +0100
Message-ID: <CAFEAcA8nAe5_40S3w4-G+ufScHfpf6z2fZCd7rChiHuBMB5ejQ@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
To: Jamie Iles <quic_jiles@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 14 Apr 2023 at 15:48, Jamie Iles <quic_jiles@quicinc.com> wrote:
>
> The round-robin scheduler will iterate over the CPU list with an
> assigned budget until the next timer expiry and may exit early because
> of a TB exit.  This is fine under normal operation but with icount
> enabled and SMP it is possible for a CPU to be starved of run time and
> the system live-locks.
>
> For example, booting a riscv64 platform with '-icount
> shift=0,align=off,sleep=on -smp 2' we observe a livelock once the kernel
> has timers enabled and starts performing TLB shootdowns.  In this case
> we have CPU 0 in M-mode with interrupts disabled sending an IPI to CPU
> 1.  As we enter the TCG loop, we assign the icount budget to next timer
> interrupt to CPU 0 and begin executing where the guest is sat in a busy
> loop exhausting all of the budget before we try to execute CPU 1 which
> is the target of the IPI but CPU 1 is left with no budget with which to
> execute and the process repeats.

Coincidentally, I just ran into a fairly similar issue on Arm,
where CPU0 is in a loop waiting for CPU1 to do something
but CPU1 never gets to execute any instructions at all
because it's run out of timeslice. This patch fixes that
livelock for me.

Tested-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

