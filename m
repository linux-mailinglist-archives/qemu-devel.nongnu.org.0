Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B999B6C159C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:53:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peGru-0007Rk-67; Mon, 20 Mar 2023 10:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGro-0007R7-G6
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:52:08 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGrm-0002IK-In
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:52:08 -0400
Received: by mail-wm1-x333.google.com with SMTP id p34so2680540wms.3
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679323924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HBPgA5ZTWsal5oBuRn+VO7Jcx+UaJEt+6bHlSHLrCHg=;
 b=y9q+pNNgssDNWzjtfdk57vNtRPabVHS5R0lX+zOTdfeE/Ad9H/vMu1W7K2u2jad/Eo
 ZkBp6mp/+PH3ysR+wfWwan5kmIX6Tkb+Ak+gsBSPZfrpZBQZfSnv1bCX1U3t7XseTc4C
 g+PgJSM/9DbXPPC5cZPMj6LjZQwo7Sx6JyHdA22TiVxCin1ycq+bptKDVfPNVNWvNXUI
 bibbMASu6XPO5sZmrFblnI6+g2P6ia3fH9iwfMl6mO+qpCSTNi7IYZy9zFIIe29uxOPv
 bApKwnoKzHXYFgj29MTFOeAiCE0o5xbnyAITah0ewrAlM0LojCJBxxrgqNSERNJduCSl
 Mw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323924;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HBPgA5ZTWsal5oBuRn+VO7Jcx+UaJEt+6bHlSHLrCHg=;
 b=6hC0ZxX9laAuXNxbtGaSiE5n3iXeg5fFHZtl45QIJ1my5wwlZzSLgmP4Wb1gkRAs1I
 miAO5Pq8TIHiA5Qyg1tuLoaNq8GX0LIQK4p0CngxD8kWpHdoKO33nh9U4s9heQs6GXfR
 hBtsARl3swXRVdDUah0sRO2u5UmOEkflw+ichu8NCFttk/n7G/MB5iyD48stNlesQLoZ
 /JT6PpnFeXbb21k6Vc11TottJQGoRc9wXZSzsxsDGz/L8qRuu+ulXqJM57HYnHoirj2Y
 XSBhc+7u6UU6JbSxfVpjnl4in/Lphm0B3DLarYAjWQTgpRxJwx0tQE03+LSG9wW0HYpt
 EHFA==
X-Gm-Message-State: AO0yUKXSP/FSZwR8iRGADdHK0ujr7pLThnTif+hCL4CMBApFFH+rCVSi
 Aaur+QRW8PDut4foUeVnFwR40w==
X-Google-Smtp-Source: AK7set8XBs/EJ+mc6dDJZ1MFtkXMzY9msdmOvNOjHmdanVaF8uTY8U5SOVfe5eC6qou+dtt9MRYQCA==
X-Received: by 2002:a1c:7419:0:b0:3ee:1239:1ba7 with SMTP id
 p25-20020a1c7419000000b003ee12391ba7mr1554368wmc.27.1679323924448; 
 Mon, 20 Mar 2023 07:52:04 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c4f5100b003ed51cdb94csm13718248wmq.26.2023.03.20.07.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:52:04 -0700 (PDT)
Message-ID: <a8ffdade-2519-9139-65a9-d1d5f8477b13@linaro.org>
Date: Mon, 20 Mar 2023 15:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 03/10] accel/tcg: move i386 halt handling to sysemu_ops
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230320101035.2214196-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 20/3/23 11:10, Alex Bennée wrote:
> We don't want to be polluting the core run loop code with target
> specific handling, punt it to sysemu_ops where it belongs.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/core/sysemu-cpu-ops.h |  5 +++++
>   target/i386/cpu-internal.h       |  1 +
>   accel/tcg/cpu-exec.c             | 14 +++-----------
>   target/i386/cpu-sysemu.c         | 12 ++++++++++++
>   target/i386/cpu.c                |  1 +
>   5 files changed, 22 insertions(+), 11 deletions(-)


> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
> index 28115edf44..e545bf7590 100644
> --- a/target/i386/cpu-sysemu.c
> +++ b/target/i386/cpu-sysemu.c
> @@ -18,6 +18,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
>   #include "cpu.h"
>   #include "sysemu/xen.h"
>   #include "sysemu/whpx.h"

Missing "hw/i386/apic.h" which declares apic_poll_irq() ...


> @@ -310,6 +311,17 @@ void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
>        }
>   }
>   
> +void x86_cpu_handle_halt(CPUState *cpu)
> +{
> +    if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
> +        X86CPU *x86_cpu = X86_CPU(cpu);
> +        qemu_mutex_lock_iothread();
> +        apic_poll_irq(x86_cpu->apic_state);

... used here.

> +        cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
> +        qemu_mutex_unlock_iothread();
> +    }
> +}

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


