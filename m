Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D8D4B006B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:38:09 +0100 (CET)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvbE-0004Do-Hj
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:38:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvXS-0002Hz-Hy
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:34:15 -0500
Received: from [2607:f8b0:4864:20::632] (port=33387
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvXN-0002RR-TK
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 17:34:14 -0500
Received: by mail-pl1-x632.google.com with SMTP id k17so243709plk.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 14:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hwmkMg7bSmv9JEnRG7OyGB+jw30Jg+cuA81adS8Aobg=;
 b=YltlH5+oaTb+OrwAJKrVv08xmuHVF9n5ftINuMHI+vVIAqzgHSPqt320wlrgJncGbk
 qPETUxK/zk8+Sm+11vJ8BNjDF7nuMb32feUJ84Q9fdkrW4XuUeo7nGbu/JN2ggeeeIcm
 lSzVBCog9YxEpDK6gPfOUn/SWubP413I/Sd9FN9qh8cs70AxO1NzNytmRr+SlVwPInfC
 5zWB6WXGQCqXEEIU16nqM7r82FNq7+1bOCaZBtC1plRilOErdPG9TBsfXMVxcf4CEN2u
 I+XRwN4Rlyzu5Cm6Ss2n8AKQNasyG/kJ6/zoZXyh3y1ro1uBN4nmUJYuC7oLl8IkkWac
 g94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hwmkMg7bSmv9JEnRG7OyGB+jw30Jg+cuA81adS8Aobg=;
 b=3e57oRjeqVjs8whfNDuBlhv85R/1ERluwjX70aEDCcN/jCY7BZU01N7SoS36LIjeI3
 /fgkDk0shS/LqLTvzoIej9jF9exe6+u8dKcK+HBbCPYZHtgfG4DI5uxfG6xF3SqS6TXY
 vMul04a38Isox2DTPQV7zAVgsisTzeGbubOGHj3mo8q060Hiv9Ns+Jc5SN6GVOsW23KQ
 vst5vtJX9GTrsyaMerCtWD4h0GHUR9dnTjNzIUG9VXWTVM1x7rDNhpaTmQHqWVreWSHX
 EcO+ORl9v2uApIFutTCah3Iwxct4rmQYTiisZX86FAVyKr3+PjuE2vtqgr7AmRH2axZv
 FS5g==
X-Gm-Message-State: AOAM532s3tz+dFH0je9iQ+frN6zfCyckOsDmVqYJaAKKAfwqN89oZhwS
 K7RUpA2K+r7zW+OBmQZaQq8w9xRKJQ0=
X-Google-Smtp-Source: ABdhPJxsOLwVWHgzuAhqvjOyfzh9dBe3RarDunu78pfF1+DRYkLpJRmujHoVXG/KbY7OHpfx7yMQJw==
X-Received: by 2002:a17:902:a9c2:: with SMTP id
 b2mr4464044plr.135.1644446028060; 
 Wed, 09 Feb 2022 14:33:48 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id w19sm22220275pfu.47.2022.02.09.14.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:33:47 -0800 (PST)
Message-ID: <2f53c9a2-5716-5b92-a4f7-0b8495e24403@amsat.org>
Date: Wed, 9 Feb 2022 23:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 11/15] target: Use ArchCPU as interface to target CPU
Content-Language: en-US
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-12-f4bug@amsat.org>
In-Reply-To: <20220209215446.58402-12-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 9/2/22 22:54, Philippe Mathieu-Daudé wrote:
> ArchCPU is our interface with target-specific code. Use it as
> a forward-declared opaque pointer (abstract type), having its
> structure defined by each target.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/qemu/typedefs.h     |  1 +
>   target/alpha/cpu-qom.h      |  4 +++-
>   target/alpha/cpu.h          |  4 +---
>   target/arm/cpu-qom.h        |  4 +++-
>   target/arm/cpu.h            |  2 --
>   target/avr/cpu-qom.h        |  4 +++-
>   target/avr/cpu.h            |  6 ++----
>   target/cris/cpu-qom.h       |  4 +++-
>   target/cris/cpu.h           |  4 +---
>   target/hexagon/cpu.h        |  2 +-
>   target/hppa/cpu-qom.h       |  4 +++-
>   target/hppa/cpu.h           |  4 +---
>   target/i386/cpu-qom.h       |  4 +++-
>   target/i386/cpu.h           |  4 +---
>   target/m68k/cpu-qom.h       |  4 +++-
>   target/m68k/cpu.h           |  4 +---
>   target/microblaze/cpu-qom.h |  4 +++-
>   target/microblaze/cpu.h     |  6 +++---
>   target/mips/cpu-qom.h       |  4 +++-
>   target/mips/cpu.h           |  4 +---
>   target/nios2/cpu.h          |  4 ++--
>   target/openrisc/cpu.h       | 11 ++++-------
>   target/ppc/cpu-qom.h        |  4 +++-
>   target/ppc/cpu.h            |  4 +---
>   target/riscv/cpu.h          |  5 ++---
>   target/rx/cpu-qom.h         |  4 +++-
>   target/rx/cpu.h             |  4 +---
>   target/s390x/cpu-qom.h      |  4 +++-
>   target/s390x/cpu.h          |  4 +---
>   target/sh4/cpu-qom.h        |  4 +++-
>   target/sh4/cpu.h            |  4 +---
>   target/sparc/cpu-qom.h      |  4 +++-
>   target/sparc/cpu.h          |  4 +---
>   target/tricore/cpu-qom.h    |  4 +++-
>   target/tricore/cpu.h        |  4 +---
>   target/xtensa/cpu-qom.h     |  4 +++-
>   target/xtensa/cpu.h         |  4 +---
>   37 files changed, 76 insertions(+), 77 deletions(-)
...

> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index a22bd506d0..b0a0724e8c 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -27,7 +27,9 @@ struct arm_boot_info;
>   
>   #define TYPE_ARM_CPU "arm-cpu"
>   
> -OBJECT_DECLARE_TYPE(ARMCPU, ARMCPUClass,
> +typedef struct ArchCPU ARMCPU;
> +
> +OBJECT_DECLARE_TYPE(ArchCPU, ARMCPUClass,
>                       ARM_CPU)
>   
>   #define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index a95a070647..a137c564c4 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3410,8 +3410,6 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
>       }
>   }
>   
> -typedef ARMCPU ArchCPU;
> -
>   #include "exec/cpu-all.h"
>   
>   /*
...

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

Sorry I messed while rebasing, this hunk is missing:

-- >8 --
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a137c564c4..a4bbca1812 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -774,7 +774,7 @@ typedef struct ARMISARegisters ARMISARegisters;
   *
   * An ARM CPU core.
   */
-struct ARMCPU {
+struct ArchCPU {
      /*< private >*/
      CPUState parent_obj;
      /*< public >*/
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 05def159b1..6a243cfc06 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -171,7 +171,7 @@ struct CPUArchState {
   *
   * A Nios2 CPU.
   */
-struct ArchCPU {
+typedef struct ArchCPU {
      /*< private >*/
      CPUState parent_obj;
      /*< public >*/
@@ -188,7 +188,7 @@ struct ArchCPU {
      uint32_t reset_addr;
      uint32_t exception_addr;
      uint32_t fast_tlb_miss_addr;
-};
+} Nios2CPU;


  void nios2_tcg_init(void);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5981be47d9..d8fefcbc4e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -309,7 +309,7 @@ struct RISCVCPUClass {
   *
   * A RISCV CPU.
   */
-struct ArchCPU {
+typedef struct ArchCPU {
      /*< private >*/
      CPUState parent_obj;
      /*< public >*/
@@ -357,7 +357,7 @@ struct ArchCPU {
          bool epmp;
          uint64_t resetvec;
      } cfg;
-};
+} RISCVCPU;

  static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
  {
---

