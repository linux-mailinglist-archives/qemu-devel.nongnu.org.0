Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9348D40C795
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:37:32 +0200 (CEST)
Received: from localhost ([::1]:52116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQW2V-0000uS-Lj
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQW1H-0007qL-CI
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:36:15 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQW1E-0005eW-7h
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:36:15 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso4995933wmb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5QZGFGPjF0C7Lig7wvQtlLsEnnIuhwXE287z3nzxPnM=;
 b=hh6q5iBnyyoQpXq0cwG3GM6sVyQM1eEJQDpWrxibZ+CrS2VxVSbqVQqiv0mL+oouay
 Q3Mc9wZAhwJ/yhOG15l6qZ6ujoSn6H+iVyyXSm0/Wqy1LTk+8dVotdQIHkZoXZKHurKc
 viRIn0WOSacK+JGn9TYNC9UfBzNRAOHUfy3eI5RMjtNybA7blQbvxv0HzIvQqCUCwjhv
 qMci3YSVcnAgbMYDiVRHl3b+tVKvUA/co/SLbzVqLJ4urEtXOxHFM5RvugPAoAep8crD
 uqjmpx+C5Ixw7tWByqw9kPNwmqYCw3jcQeGlte8nkHPJsNUQHjplVG9JcZkIxYwtjqtO
 nSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5QZGFGPjF0C7Lig7wvQtlLsEnnIuhwXE287z3nzxPnM=;
 b=XlJGPnYDeDTR7gfp0nJZlZx9XCMq8P5b0yZlfDoRpclcue2hGEs09Vah7rx+rVBSvN
 SfGHkhz1vmzYYI7TM+wvhgN4oAmyp5jZ5Aacsn8rkOt5aaZUtijREoj/FtaJpBKKM/xT
 u5tfwP0anKAJXotiPHRPT+JEG+xPSF3G1MBce3lUynGJBaEN1LLej00GSCfP9xhIjdbP
 7m61WKZYvcPG2/M/8njPk2T5Ev6x/kf7/aUokblwCnZzMfuAXA7LiqTiFE/dVAbEwhKK
 y33ivwG+xptfV5YSUMVkj6AszG/IL8tSsWPhsiq/A2kAOAbNtQkkeYg9by2M+tnoMeyC
 ePfw==
X-Gm-Message-State: AOAM532/daO9gIZJx3sqKn/eIzhwtCR2Xhw8x4xtB3gc+Z+YTvsENkv0
 0BERmRoYyAIOKS2Hr2PaeKA=
X-Google-Smtp-Source: ABdhPJzV2UYq/ifyKLCu0luZxs/3Cs6KK3maXJdiENXxmo/3wi4QOaaFmsAK4MmdhKfmumHepZ8hCg==
X-Received: by 2002:a05:600c:b41:: with SMTP id k1mr5017576wmr.4.1631716570336; 
 Wed, 15 Sep 2021 07:36:10 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id z12sm144747wro.75.2021.09.15.07.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 07:36:09 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Include 'hw/i386/apic.h' locally
To: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210902152243.386118-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <66a53499-bd20-e422-3b47-cdbb1ef28480@amsat.org>
Date: Wed, 15 Sep 2021 16:36:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902152243.386118-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.698,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Colin Xu <colin.xu@intel.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:22 PM, Philippe Mathieu-Daudé wrote:
> Instead of including a sysemu-specific header in "cpu.h"
> (which is shared with user-mode emulations), include it
> locally when required.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

Ping?

> ---
>  target/i386/cpu.h                    | 4 ----
>  hw/i386/kvmvapic.c                   | 1 +
>  hw/i386/x86.c                        | 1 +
>  target/i386/cpu-sysemu.c             | 1 +
>  target/i386/cpu.c                    | 1 +
>  target/i386/gdbstub.c                | 4 ++++
>  target/i386/hax/hax-all.c            | 1 +
>  target/i386/helper.c                 | 1 +
>  target/i386/hvf/x86_emu.c            | 1 +
>  target/i386/nvmm/nvmm-all.c          | 1 +
>  target/i386/tcg/seg_helper.c         | 4 ++++
>  target/i386/tcg/sysemu/misc_helper.c | 1 +
>  target/i386/whpx/whpx-all.c          | 1 +
>  13 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index c7cc65e92d5..eddafd1acd5 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2046,10 +2046,6 @@ typedef X86CPU ArchCPU;
>  #include "exec/cpu-all.h"
>  #include "svm.h"
>  
> -#if !defined(CONFIG_USER_ONLY)
> -#include "hw/i386/apic.h"
> -#endif
> -
>  static inline void cpu_get_tb_cpu_state(CPUX86State *env, target_ulong *pc,
>                                          target_ulong *cs_base, uint32_t *flags)
>  {
> diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
> index 43f8a8f679e..7333818bdd1 100644
> --- a/hw/i386/kvmvapic.c
> +++ b/hw/i386/kvmvapic.c
> @@ -16,6 +16,7 @@
>  #include "sysemu/hw_accel.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/runstate.h"
> +#include "hw/i386/apic.h"
>  #include "hw/i386/apic_internal.h"
>  #include "hw/sysbus.h"
>  #include "hw/boards.h"
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 00448ed55aa..e0218f8791f 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -43,6 +43,7 @@
>  #include "target/i386/cpu.h"
>  #include "hw/i386/topology.h"
>  #include "hw/i386/fw_cfg.h"
> +#include "hw/i386/apic.h"
>  #include "hw/intc/i8259.h"
>  #include "hw/rtc/mc146818rtc.h"
>  
> diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
> index 1078e3d157f..65709e41903 100644
> --- a/target/i386/cpu-sysemu.c
> +++ b/target/i386/cpu-sysemu.c
> @@ -30,6 +30,7 @@
>  #include "hw/qdev-properties.h"
>  
>  #include "exec/address-spaces.h"
> +#include "hw/i386/apic.h"
>  #include "hw/i386/apic_internal.h"
>  
>  #include "cpu-internal.h"
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 97e250e8760..04f59043804 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -33,6 +33,7 @@
>  #include "standard-headers/asm-x86/kvm_para.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/i386/topology.h"
> +#include "hw/i386/apic.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "exec/address-spaces.h"
>  #include "hw/boards.h"
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
> index 098a2ad15a9..5438229c1a9 100644
> --- a/target/i386/gdbstub.c
> +++ b/target/i386/gdbstub.c
> @@ -21,6 +21,10 @@
>  #include "cpu.h"
>  #include "exec/gdbstub.h"
>  
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/i386/apic.h"
> +#endif
> +
>  #ifdef TARGET_X86_64
>  static const int gpr_map[16] = {
>      R_EAX, R_EBX, R_ECX, R_EDX, R_ESI, R_EDI, R_EBP, R_ESP,
> diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
> index bf65ed6fa92..cd89e3233a9 100644
> --- a/target/i386/hax/hax-all.c
> +++ b/target/i386/hax/hax-all.c
> @@ -32,6 +32,7 @@
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
>  #include "hw/boards.h"
> +#include "hw/i386/apic.h"
>  
>  #include "hax-accel-ops.h"
>  
> diff --git a/target/i386/helper.c b/target/i386/helper.c
> index 533b29cb91b..874beda98ae 100644
> --- a/target/i386/helper.c
> +++ b/target/i386/helper.c
> @@ -26,6 +26,7 @@
>  #ifndef CONFIG_USER_ONLY
>  #include "sysemu/hw_accel.h"
>  #include "monitor/monitor.h"
> +#include "hw/i386/apic.h"
>  #endif
>  
>  void cpu_sync_bndcs_hflags(CPUX86State *env)
> diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
> index 7c8203b21fb..fb3e88959d4 100644
> --- a/target/i386/hvf/x86_emu.c
> +++ b/target/i386/hvf/x86_emu.c
> @@ -45,6 +45,7 @@
>  #include "x86_flags.h"
>  #include "vmcs.h"
>  #include "vmx.h"
> +#include "hw/i386/apic.h"
>  
>  void hvf_handle_io(struct CPUState *cpu, uint16_t port, void *data,
>                     int direction, int size, uint32_t count);
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index 28dee4c5ee3..4c07cfc7194 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -22,6 +22,7 @@
>  #include "qemu/queue.h"
>  #include "migration/blocker.h"
>  #include "strings.h"
> +#include "hw/i386/apic.h"
>  
>  #include "nvmm-accel-ops.h"
>  
> diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
> index 13c6e6ee62e..71fd2bf8d06 100644
> --- a/target/i386/tcg/seg_helper.c
> +++ b/target/i386/tcg/seg_helper.c
> @@ -28,6 +28,10 @@
>  #include "helper-tcg.h"
>  #include "seg_helper.h"
>  
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/i386/apic.h"
> +#endif
> +
>  /* return non zero if error */
>  static inline int load_segment_ra(CPUX86State *env, uint32_t *e1_ptr,
>                                 uint32_t *e2_ptr, int selector,
> diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
> index e7a2ebde813..dbeda8d0b0f 100644
> --- a/target/i386/tcg/sysemu/misc_helper.c
> +++ b/target/i386/tcg/sysemu/misc_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/cpu_ldst.h"
>  #include "exec/address-spaces.h"
>  #include "tcg/helper-tcg.h"
> +#include "hw/i386/apic.h"
>  
>  void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
>  {
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index 3e925b9da70..9ab844fd05d 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -20,6 +20,7 @@
>  #include "qemu/main-loop.h"
>  #include "hw/boards.h"
>  #include "hw/i386/ioapic.h"
> +#include "hw/i386/apic.h"
>  #include "hw/i386/apic_internal.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> 

