Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63234B009B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:49:08 +0100 (CET)
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvlr-0007jZ-8S
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:49:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHvki-00073f-Ky
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:47:56 -0500
Received: from [2607:f8b0:4864:20::62d] (port=36599
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHvkg-0007UJ-Tf
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:47:56 -0500
Received: by mail-pl1-x62d.google.com with SMTP id x3so232100pll.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 14:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lhdTL/462HrEUe5akFaY/N7DywmTUtVDZPnGsq4drqA=;
 b=Dg/+9XA3Liqi1Q+lz8BmCNOKdBy8E/OgK20fbeJsEhcKheRSJU0CG0YqCk+5ao26py
 pNXBCVKzfjOBX9EdAex/mlVTmzQw+nx00TekRI3XojIkZ/v0Oj+APuuZPidGmysmAynq
 VuncAVGH89p0yRTVW9zLPYjG4885HtG/+2MOM51vprbVczzz1m0BV8Z7MXuFwxeuW5wA
 mFqvWbb5NYDWbXirY75vb5dqpuAKxx2u30RQz0gA1RGFN/LWXhl1bXg6hzzQc2uX/kvH
 yTvtzTP7w3otD/fFQC5yVBxagw8PKR0KbO0ZowG2plqCHXX8rLcB0DOtdvlQTUuxL6Ty
 nJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lhdTL/462HrEUe5akFaY/N7DywmTUtVDZPnGsq4drqA=;
 b=qRA1jEZKH/5Qr++Lz9DRi0xe0VMLky2WgHRuK2b0DvmsNHwG57TNIInad+TAqMnKN7
 d/dm2vnP/PdKDa8DY+FLb5or+RLGvAlPWS5+rO7Yf/AEXm2ACJEhi9aY2PGE6BMXKDjr
 e5pEV25H6U1GU7qxlNTUIMWi378Wk+ELJEvdf0ykxU46dY2R2sljF7y9OQUduG57NcUR
 tLmYZ9wf1i0cvBI/Wra5tDpDEeMPtjMBfKTy9HvjHy3/tRoH+pw6WG0z5OP4smybGxkz
 hnGUOqgamBRcKxeLUjrNuCCM9SFKf5o2NKlnmxLdSyDghDzpDj9ercsbIUEoJ0pcbxBb
 k8gw==
X-Gm-Message-State: AOAM532zsDK8jh8ItC+Ia7T3FYTH37O6uReC9SWO5kTLwz1DoGMW3O3T
 GcdzDt0kKOOU9t1Q/L4444y7bQ==
X-Google-Smtp-Source: ABdhPJzTWsMDFxZFLsboRM0pwrI7iVRUi9jNnsiQUFJw5fczw0Tp4JWkKA7hIzb7jpTGLUnIdKojHA==
X-Received: by 2002:a17:902:e743:: with SMTP id
 p3mr3791745plf.161.1644446872173; 
 Wed, 09 Feb 2022 14:47:52 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id f8sm21114731pfv.24.2022.02.09.14.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:47:51 -0800 (PST)
Message-ID: <83e91592-af1b-de86-83ce-a3fcf467fdf7@linaro.org>
Date: Thu, 10 Feb 2022 09:47:43 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/15] target: Use ArchCPU as interface to target CPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209215446.58402-12-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 08:54, Philippe Mathieu-Daudé wrote:
> diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
> index 25c67e43a2..4dce40a360 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -143,7 +143,7 @@ typedef struct HexagonCPUClass {
>       DeviceReset parent_reset;
>   } HexagonCPUClass;
>   
> -typedef struct HexagonCPU {
> +typedef struct ArchCPU {
>       /*< private >*/
>       CPUState parent_obj;
>       /*< public >*/

There's still the typedef of ArchCPU below, which ought to be redundant now.
It may or may not be less confusing to separate out the typedef for HexagonCPU.
It definitely would be worthwhile to convert hexagon to OBJECT_DECLARE_TYPE (cc Taylor).

> diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
> index e520eefb12..8f11fe4d73 100644
> --- a/target/microblaze/cpu-qom.h
> +++ b/target/microblaze/cpu-qom.h
> @@ -25,7 +25,9 @@
>   
>   #define TYPE_MICROBLAZE_CPU "microblaze-cpu"
>   
> -OBJECT_DECLARE_TYPE(MicroBlazeCPU, MicroBlazeCPUClass,
> +typedef struct ArchCPU MicroBlazeCPU;
> +
> +OBJECT_DECLARE_TYPE(ArchCPU, MicroBlazeCPUClass,
>                       MICROBLAZE_CPU)
>   
>   /**
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index acfd35d3f7..d511b6b877 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -25,6 +25,8 @@
>   #include "fpu/softfloat-types.h"
>   
>   typedef struct CPUArchState CPUMBState;
> +typedef struct ArchCPU MicroBlazeCPU;

Duplicate typedef.

> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 629b9e2301..05def159b1 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -32,7 +32,7 @@ typedef struct CPUArchState CPUNios2State;
>   
>   #define TYPE_NIOS2_CPU "nios2-cpu"
>   
> -OBJECT_DECLARE_TYPE(Nios2CPU, Nios2CPUClass,
> +OBJECT_DECLARE_TYPE(ArchCPU, Nios2CPUClass,
>                       NIOS2_CPU)
>   
>   /**
> @@ -171,7 +171,7 @@ struct CPUArchState {
>    *
>    * A Nios2 CPU.
>    */
> -struct Nios2CPU {
> +struct ArchCPU {
>       /*< private >*/
>       CPUState parent_obj;
>       /*< public >*/

Missing Nios2CPU typedef.
Still have the 'typedef Nios2CPU ArchCPU' below.

> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 79144ddc24..5981be47d9 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -285,7 +285,7 @@ struct CPUArchState {
>       uint64_t kvm_timer_frequency;
>   };
>   
> -OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> +OBJECT_DECLARE_TYPE(ArchCPU, RISCVCPUClass,
>                       RISCV_CPU)
>   
>   /**
> @@ -309,7 +309,7 @@ struct RISCVCPUClass {
>    *
>    * A RISCV CPU.
>    */
> -struct RISCVCPU {
> +struct ArchCPU {
>       /*< private >*/
>       CPUState parent_obj;
>       /*< public >*/
> @@ -430,7 +430,6 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>   #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
>   #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
>   
> -typedef RISCVCPU ArchCPU;
>   #include "exec/cpu-all.h"
>   
>   FIELD(TB_FLAGS, MEM_IDX, 0, 3)

Missing RISCVCPU typedef.


r~

