Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE86E4793
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 14:23:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poNrr-0006XA-QU; Mon, 17 Apr 2023 08:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poNrm-0006Vc-FK
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:21:56 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poNrk-0003nG-6p
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:21:54 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-94f6c285d22so62744666b.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681734110; x=1684326110;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=htAPw8sASkbP8CSe9RqSCM40t3CsDS9ksk0jby1dFjc=;
 b=V8E+7LoHTrqqnDpJ7FCRZvmJCWDgynmlxuwz9gFkZDUUrvTaujDhthBOZysqNzMhYR
 Wvg9xe4Q0UBi0bHLJ9sLOOAf2mZyShoZO1WZFqo0RWcEH19mNavVbz2bfYbYqNoVXk5X
 VoYX5sAdAdwSmFkskg79+Ts3hBEuOC3lYSFetbg2ztm4m694T6tAPfKxVXRZvP2csPl8
 D+L4QGixBSgcR4BXQBQBYQM9hKlI5hEizAy6dia12Dizqi/ADG/ViY3oelJBZ9LPTOCU
 FSrKA+1Z4+QDSTyscuzFcemAxzcv1W4R4icUqxXj1eMCJ8brZjYKs4/7H8YnNSrD3vl2
 2TiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681734110; x=1684326110;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=htAPw8sASkbP8CSe9RqSCM40t3CsDS9ksk0jby1dFjc=;
 b=ILdA2YbbM6Q51Vc/MIIEwCoizPHCkvl5mh2qyU9KjbXTQpzn8hEfZXiTFfUjVgh8gK
 X56YP75COWFMm6cKmpMzWz+dQ8BtNvex3t5qgx0XLCvQX032SpbLlC32/snfIAp0uwnY
 zhf81KsNxpsjypdz+aZ8G8Z/XWD0pqhAZciGyz8LrYbhzuiVTzVRsdPQjtq/zhRlII6i
 UxnzdGdjjjRKh7ll4bmp5jgjP1RnWCWhV1AHF18iD4SbPpOpxFl16q5z9kj4CbDUqRXI
 C94aov+wBhEjtBb52R0CqeVQ0QY1+6acAF1UhV0g/bq6RFyul+KrjPhGlhHaLEW/BzNW
 EzdA==
X-Gm-Message-State: AAQBX9c4GjpkdaYVl1MkDB7blCi76VtNX2tVFDJ0iPGM03vj6fFsbdYS
 nKkMNZPbDDiQt4pUQqTd5JjadPFC0xK1wk/5Lz7gmQ==
X-Google-Smtp-Source: AKy350bJ17KNGWt9uKT+XD1WaldGuMxtrq5jjohaBoizE6+D7vACK7DjU4mslYErN9xzdU8Yzd5kLewKnMnjKmF5y+0=
X-Received: by 2002:a50:8d43:0:b0:4fc:fc86:5f76 with SMTP id
 t3-20020a508d43000000b004fcfc865f76mr7055601edt.6.1681734110239; Mon, 17 Apr
 2023 05:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230403191600.43487-1-fcagnin@quarkslab.com>
 <20230403191600.43487-3-fcagnin@quarkslab.com>
In-Reply-To: <20230403191600.43487-3-fcagnin@quarkslab.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Apr 2023 13:21:39 +0100
Message-ID: <CAFEAcA_CfbuvbL+yuMTcZwF_PUCPiWJ43eaKOJjZ6DJiQUiFQg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hvf: implement guest debugging on Apple Silicon
 hosts
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Mon, 3 Apr 2023 at 20:17, <francesco.cagnin@gmail.com> wrote:
>
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>
> Guests can be debugged through the gdbstub.
>
> While guest debugging is enabled, the guest can still read and write the
> DBG*_EL1 registers but they don't have any effect.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>

> +static void hvf_arm_init_debug(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +
> +    max_hw_bps = arm_num_brps(arm_cpu);
> +    hw_breakpoints =
> +        g_array_sized_new(true, true, sizeof(HWBreakpoint), max_hw_bps);
> +
> +    max_hw_wps = arm_num_wrps(arm_cpu);
> +    hw_watchpoints =
> +        g_array_sized_new(true, true, sizeof(HWWatchpoint), max_hw_wps);
> +}

This function gets called per-CPU but it allocates
memory that is per-VM because it's stored in a global.
That means that in an SMP guest the function gets called
multiple times and leaks all but one of the allocations.

The fix for this is to have the function be called
from a general initialization function, not from the
vcpu init function. Compare this (not yet in master)
patch which fixes the same bug for KVM:
https://lore.kernel.org/qemu-devel/20230405153644.25300-1-akihiko.odaki@daynix.com/

Other than that, the structure of the patch looks OK, but
I think you need to identify the cause of the problems
with SMP setups that you mention in the cover letter,
since they suggest that there's a bug lurking in here
somewhere.

thanks
-- PMM

