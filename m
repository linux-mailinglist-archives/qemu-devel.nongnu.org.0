Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F30A4B00B4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:53:11 +0100 (CET)
Received: from localhost ([::1]:51954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvpm-0002DP-Ly
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:53:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHvoU-0000qM-BI
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:51:50 -0500
Received: from [2607:f8b0:4864:20::629] (port=44717
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHvo5-0007zO-JF
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:51:49 -0500
Received: by mail-pl1-x629.google.com with SMTP id y18so213933plb.11
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 14:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Q9tBxsh3gNnaWuurWjNanZH494aMhzbaCik5LPNI+MM=;
 b=fLAgwEWBHIlLqgerrv4QjL8PJ2+j/UhVZeroX1ImSEk+/cDj/VqEvy+W9II63aA+sO
 rTJlmS4NoV0dVFY0FyQbbKVZcgpxJYzhPbQfrJz9rhUtZGIuJFWnEh5PZeuSfyDJhF+l
 CzjbTcT1wYi91v3aJmchhl6aJpGha/t/nx9g3jK1RWwPzmAuboa86xen+6Fo3KwyKbdc
 dzy7Dd7ehm5dFs90XKVnFkaevGqrGXvVVOHlU3vCNmbVClW+YZ26sTTqyYuqZ9CKCxlI
 zbKDsfTTy0HZB0DrOSLdGSvIHT8ypGCItYt4ep8LL8wFhLV4LZZ/4ogQJ0pvLfRuOJoX
 KgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q9tBxsh3gNnaWuurWjNanZH494aMhzbaCik5LPNI+MM=;
 b=2IheZ23+BNjQ43LrkQkJMHExO4+k2zA/u2hfybroBLOIciaicvXNa65fUebJpOafBZ
 hkeRoEMIwaOplitY4+p90HDsZhZBtXrcq5JQvesTPqwAUUDpHiAltqbDGRGanVHja0hw
 Ug6DttZpVzZtPxp8RTwOwS1ZyetRmVEVgJ98paO6QRhlnq5r386r0/zarSYKpk0ppjCd
 hfndoZt5y6o+7fsYPrOFjkuITASQ+gvYzSw9c8GnLK4Me6Iu2Ci1gXZraG7sFG4ID0sf
 F67yk1DF2l6mrn95gn0IYcUCMf7Djg8BCFQNarj6Q6UfykImkeKr9HRp3zwgiIY3vwBL
 vDRQ==
X-Gm-Message-State: AOAM531DE5LKaSqe84eIfhM4qMtEBv8DyhpRPIZ+sTbEzRAvGwPtM/+m
 GOQDjBqnRyPbCGILxO+5CGO0AGT1r0uW5xTn
X-Google-Smtp-Source: ABdhPJyK6zU2Wpj8DO+mvxT6/r6Ag2cLDvEIrtagh8gHFPuT2LU9T02/njm7a7wb+jkaykViHiF0lA==
X-Received: by 2002:a17:902:d3ca:: with SMTP id
 w10mr4527378plb.33.1644447019262; 
 Wed, 09 Feb 2022 14:50:19 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id z13sm15305998pga.84.2022.02.09.14.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:50:18 -0800 (PST)
Message-ID: <8070b23a-7072-58a2-f3dd-fbf5f626674a@linaro.org>
Date: Thu, 10 Feb 2022 09:50:14 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 12/15] hw/m68k: Restrict M68kCPU type to target/ code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209215446.58402-13-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 08:54, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/m68k/mcf.h | 3 +--
>   target/m68k/cpu-qom.h | 2 --
>   target/m68k/cpu.h     | 4 ++--
>   3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/m68k/mcf.h b/include/hw/m68k/mcf.h
> index 8cbd587bbf..e84fcfb4ca 100644
> --- a/include/hw/m68k/mcf.h
> +++ b/include/hw/m68k/mcf.h
> @@ -3,7 +3,6 @@
>   /* Motorola ColdFire device prototypes.  */
>   
>   #include "exec/hwaddr.h"
> -#include "target/m68k/cpu-qom.h"
>   
>   /* mcf_uart.c */
>   uint64_t mcf_uart_read(void *opaque, hwaddr addr,
> @@ -16,7 +15,7 @@ void mcf_uart_mm_init(hwaddr base, qemu_irq irq, Chardev *chr);
>   /* mcf_intc.c */
>   qemu_irq *mcf_intc_init(struct MemoryRegion *sysmem,
>                           hwaddr base,
> -                        M68kCPU *cpu);
> +                        ArchCPU *cpu);
>   
>   /* mcf5206.c */
>   #define TYPE_MCF5206_MBAR "mcf5206-mbar"

This part is ok.

> diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
> index c2c0736b3b..ec75adad69 100644
> --- a/target/m68k/cpu-qom.h
> +++ b/target/m68k/cpu-qom.h
> @@ -25,8 +25,6 @@
>   
>   #define TYPE_M68K_CPU "m68k-cpu"
>   
> -typedef struct ArchCPU M68kCPU;
> -
>   OBJECT_DECLARE_TYPE(ArchCPU, M68kCPUClass,
>                       M68K_CPU)
>   
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 872e8ce637..90be69e714 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -156,14 +156,14 @@ typedef struct CPUArchState {
>    *
>    * A Motorola 68k CPU.
>    */
> -struct ArchCPU {
> +typedef struct ArchCPU {
>       /*< private >*/
>       CPUState parent_obj;
>       /*< public >*/
>   
>       CPUNegativeOffsetState neg;
>       CPUM68KState env;
> -};
> +} M68kCPU;

I don't like these.  Rationale?


r~


