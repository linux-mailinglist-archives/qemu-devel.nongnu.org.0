Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF94C3A2D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 01:13:15 +0100 (CET)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNOEU-0001fD-El
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 19:13:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNOCA-00008i-7s
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 19:10:50 -0500
Received: from [2607:f8b0:4864:20::52f] (port=45898
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNOC8-0000kn-OK
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 19:10:49 -0500
Received: by mail-pg1-x52f.google.com with SMTP id z4so3107214pgh.12
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 16:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=seSkQMaZzKKa2t+1KKRKdmajWUHM1oigvmy8TtRGWu0=;
 b=TcWxrOIJCWgyVc7NaR/hlBBD4BlS8roP1ao0ewjtuSTBRCNFt1JXdhhbK2FP2ELP/R
 4MKMdhECkB/9Mo5IcagrnBPuC3kLzx55aeIKNpP3NX/VBtSN99Fc37faTflb+Mga69bz
 34K4orskpOHZ9jZW+1pN4Le35Cfwa/hLJbVSAjf8flT5lWMvOQqkTQiFcX/lob+J+hCw
 HrHjSqis6GOiTZFT16DO82O4PP7VbOv0wRb+RuGDMFn6tsxck7/trz7j4qKUAJC15BFg
 p9Ls0+nc7dTFxkJj1UsJxiO19ne5nkj1+AaoLreuu/5dkewTuIZoAfyCAEldB8HVb4RA
 UwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=seSkQMaZzKKa2t+1KKRKdmajWUHM1oigvmy8TtRGWu0=;
 b=bh4r6RZ1d51MUhyACdApS5B1JK+jXJ76CXGYwULTfCOgGvA4Casxt6rhHgzH8Zn232
 YvaSXnbNY2nG+ObVhryDDWfpXYJIJCHzm+Lerr6tu/Q+jTcPlCSiO0vonLIXQdEgb1U2
 3FfUl1O4J8C1hzR11XrTysXvPjHGAjz/aBJhnmS8R1g99zX5BwRkngFq6CLoyEaIsCao
 HA+TADWwtMCQ5582amcjXmHx+5LrY6HW5Bff4hrkCgoxc3BEbAHm5CzdveMIrwoFWnJs
 5WID5oogxiz0TQTch+r9U76zTJXUrbn7PWCklpDdMJFcWJu9FescJcaMiwDGANDHM7uq
 QBbw==
X-Gm-Message-State: AOAM5335Uegw/SPortV5UMGNHjvrPiif6f9ETcmsWQnOQ0VbMZalztWO
 benU5nBqeyG38xJ0tBLLXMoxfw==
X-Google-Smtp-Source: ABdhPJwo7CtIf7Ee0SL96WwJzV5zkvmO5OSEKBwifd5ZGYIx+a6Wo5lLf4qV/Gmy9bD+Wu0vVdGELQ==
X-Received: by 2002:a05:6a00:1a47:b0:4e1:5bc7:840d with SMTP id
 h7-20020a056a001a4700b004e15bc7840dmr5184597pfv.10.1645747847102; 
 Thu, 24 Feb 2022 16:10:47 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm7115217pjp.39.2022.02.24.16.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 16:10:46 -0800 (PST)
Message-ID: <9f1f4aaf-b7d4-b655-a001-37fec4c90247@linaro.org>
Date: Thu, 24 Feb 2022 14:10:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 14/14] target: Use ArchCPU as interface to target CPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220214183144.27402-1-f4bug@amsat.org>
 <20220214183144.27402-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220214183144.27402-15-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 08:31, Philippe Mathieu-Daudé wrote:
> ArchCPU is our interface with target-specific code. Use it as
> a forward-declared opaque pointer (abstract type), having its
> structure defined by each target.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h   | 4 ++--
>   include/qemu/typedefs.h | 1 +
>   target/alpha/cpu.h      | 2 +-
>   target/arm/cpu.h        | 2 +-
>   target/avr/cpu.h        | 2 +-
>   target/cris/cpu.h       | 2 +-
>   target/hexagon/cpu.h    | 2 +-
>   target/hppa/cpu.h       | 2 +-
>   target/i386/cpu.h       | 2 +-
>   target/m68k/cpu.h       | 2 +-
>   target/microblaze/cpu.h | 2 +-
>   target/mips/cpu.h       | 2 +-
>   target/nios2/cpu.h      | 2 +-
>   target/openrisc/cpu.h   | 2 +-
>   target/ppc/cpu.h        | 2 +-
>   target/riscv/cpu.h      | 2 +-
>   target/rx/cpu.h         | 2 +-
>   target/s390x/cpu.h      | 2 +-
>   target/sh4/cpu.h        | 2 +-
>   target/sparc/cpu.h      | 2 +-
>   target/tricore/cpu.h    | 2 +-
>   target/xtensa/cpu.h     | 2 +-
>   22 files changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 2a0893b1dc..0efc6153ed 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -70,8 +70,8 @@ DECLARE_CLASS_CHECKERS(CPUClass, CPU,
>    * The object struct and class struct need to be declared manually.
>    */
>   #define OBJECT_DECLARE_CPU_TYPE(CpuInstanceType, CpuClassType, CPU_MODULE_OBJ_NAME) \
> -    OBJECT_DECLARE_TYPE(CpuInstanceType, CpuClassType, CPU_MODULE_OBJ_NAME); \
> -    typedef CpuInstanceType ArchCPU;
> +    typedef struct ArchCPU CpuInstanceType; \
> +    OBJECT_DECLARE_TYPE(ArchCPU, CpuClassType, CPU_MODULE_OBJ_NAME);
>   

Nice.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

