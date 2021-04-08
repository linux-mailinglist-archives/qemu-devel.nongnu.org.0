Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5773580EF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:38:33 +0200 (CEST)
Received: from localhost ([::1]:51792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUS3U-0002Xk-2h
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUS1q-0001lp-Jw
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:36:50 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUS1o-0005a7-Py
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:36:50 -0400
Received: by mail-ed1-x532.google.com with SMTP id w23so1788765edx.7
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 03:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FZbAxJ2ONLEw7javmCo8rSOkw/pl8pWxbSXi99nEeps=;
 b=RiXvMnCTBmhC24ylOtSSaZQBInjlejJN7aFoCA8HEn+/EaeJuiw0Fp0tlzkTWVvBfK
 ouReQC0sV2ARrdChsUBcyzkShL0sJ2v8prjgtR21/zvKw3sRoRdlX9sfI5g76kc74ZZJ
 gN9Ou4V46F/p6cQrM/4hJz/jz0WMFhQnxG44eXeINScP6KraYOGp7MP9rd4TdZ9Q8KRf
 Vph9fIbdIigxzXjJiBkwGfnFFZg/ij3X2d0NLG33dF0ec7+rSp1k0i+lIvjcaPHAV0EG
 EPaNxQ69Ed2upDHSDyGaLKZeMKnIl8Qp3VRfPaTRSKWJPDRmYceUGtO6kGmchrkrieXc
 Abqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FZbAxJ2ONLEw7javmCo8rSOkw/pl8pWxbSXi99nEeps=;
 b=J3ik4W/28lLOA0yYcPjMwOQj+0nLHQ5rpHAYu2/6p8IrdAj5S6MyOXBawhnPUyiUbP
 6ODjX31YU+R5Gsm1kdO0XIG/kYNwB5ciSyM1HjeVSydXJMa4zeYWljuRSMa/LCVus7O7
 8YeQaj985MBZ5iwqp/BPnT/XNVeTJrArPyG/pLTtehWfdoPkOq/iIuyL1yyd2kSRyxW3
 gLmiCN2NfKu0SP7gWf5rbxcsHZG3sICIgx8/QRWpBOmXryVo89iWyOwNzonLOqAYeDvX
 dlo48glONwKPbJ4WBc46s//lLg7kL+BLCWGz2SgAyjy6nxDo9BFkICoGEOODIuniPtBd
 TpuQ==
X-Gm-Message-State: AOAM530FYP+W7cvJZnVgAI2Xu0YlgjmY495Z53joVpdULLSMs+nnnBbg
 ofCal7VbK6xAjmXJanfpDGG3A+HJobUx1vFyZH7afA==
X-Google-Smtp-Source: ABdhPJwydz/RaahPGMRvShVB9aFYVO/HLKYAkillg+iDFNIbACZJgQRzktR5s7INwc7Xh6+mu4LgUgQFXcFAueiD3q0=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr10322005edb.204.1617878205665; 
 Thu, 08 Apr 2021 03:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-28-cfontana@suse.de>
 <e49aa062-0958-1d4e-c682-28d0a2897493@linaro.org>
 <87e94d27-a1ec-cd6a-8079-0f975121d479@suse.de>
In-Reply-To: <87e94d27-a1ec-cd6a-8079-0f975121d479@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 10:36:05 +0000
Message-ID: <CAFEAcA-hqUehQ9chX_H4M9karU9XksirqC=daekRk=ymDRvzwQ@mail.gmail.com>
Subject: Re: [RFC v12 27/65] target/arm: split a15 cpu model and 32bit class
 functions to cpu32.c
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Apr 2021 at 11:23, Claudio Fontana <cfontana@suse.de> wrote:
> Mainly for this code here a question from my side: is the current code actually already "wrong"?
>
> I mean, we unconditionally set the aarch64-capable cpu classes to all use aarch64_gdb_arch_name and gdbstub64,
> but what about an aarch64-capable cpu running in 32bit mode?

This is somewhere between a bug and a missing feature. The 'bug' part is
that for running a guest on AArch64 KVM with -cpu aarch64=off' (ie a
32-bit guest) we should be presenting an aarch32 gdb stub, and we don't.
The 'missing feature' part is that in an ideal world we would support
mixed aarch64-and-aarch32 guest debugging, and we don't. This needs
support on the gdb side as well as on our side, AIUI.

> Why don't we have, like tentatively done here for arm_cpu_dump_state,
>
> an arm_gdb_arch_name and an arm_cpu_gdb_read_register that check is_a64() and call aaarch32_cpu_gdb_read_register or aarch64_cpu_gdb_read_register accordingly?

Because the gdb on the other end of the gdbstub does not expect the
target to suddenly change in the middle of execution like that.
gdb is really a userspace-process debugger at heart, and it only
negotiates "what are all the register types, what is the debuggee
architecture, etc" once when it connects. Once we've told gdb
what the registers are we need to stick to them.

Properly supporting mixed-mode debugging would require support
for telling gdb "I support both this set of registers for aarch64
and this other set for aarch32" and notifying it about which mode
we were in (and support in gdb for understanding this). I don't
think anybody's ever seriously tried to work out a design for this.

thanks
-- PMM

