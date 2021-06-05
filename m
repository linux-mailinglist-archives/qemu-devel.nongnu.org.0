Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6923439CB22
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 23:11:01 +0200 (CEST)
Received: from localhost ([::1]:34118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpdZM-0007vY-9d
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 17:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpdYX-0006wp-JY
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 17:10:09 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpdYV-0006FP-7X
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 17:10:09 -0400
Received: by mail-pf1-x42d.google.com with SMTP id h12so7270941pfe.2
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 14:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DV6Erc8PED0Jd4lSzka68vrGoU7Y5MzE624El6lRw6Y=;
 b=QJybwDgH4zuqyEoErQAcVfYe+LBb8Wg2knXXYhLADUUmjGjD3SFL8kRw8qukaOBPqQ
 azwR6jSUFEeRrhYDvF3TcV4gw5CXtmhDa/NRkMkw0NTzxVfsk8NUYFk68Y89zRIqUjxV
 qp91mfYVgNiJcy26NEbF2nTOcIp+TnSLKOXPfpiGgeXiWv8OZi261ckRHYydw/lUuz14
 dhD368lhQmy6q4Q8mHthEoMBk6+FqxsBKIPc1zVlFsmx5u+9eCj5xstkZ7rBceR169y5
 N5DVIqgqORwHuOJYJTNnOWDFJc22eu2drinkC0q9N+tjztICEBsqqIPsqLEmfDGw+iyN
 hdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DV6Erc8PED0Jd4lSzka68vrGoU7Y5MzE624El6lRw6Y=;
 b=b0ZwYfs0KLyXMsYJV3/OV07kejtlRqtpTB7IcU3NL/Vp2xY1JeUnB38O2RfZgxY7o4
 2800DGvezg/EMTt6kPDuqOWg/ERH52wT8XrwDrhRZZOruPNCf0lJnqIOqny3D7JC1xmG
 dxy+wOL7laxpnBcF3gTp2PGHrISPc9dQN4JJ3xSqlcjrunQD/LpNI+xcKBnhkidfjkrK
 Xl2JJ6NJj5Rk7NjSooCbI4vBdSsHGSwIZnlv6URp14yr5wMLosqQGN7E2P91IUbtzqih
 7zT/XxFm5ic/YezexqQFGLHL0xkzaKF0KcwEF+PS00LNZtAuunOXdabq/RHcDiHB0Xsh
 5bZQ==
X-Gm-Message-State: AOAM530V5v7XNeDz4ftJKxdk/OUqVgH0a80Y+XnKtiThVZJdiOjdOlt8
 jlS0b0ZgjB4KvdTeFJiEAnMr/w==
X-Google-Smtp-Source: ABdhPJw5YXonkD+YzR0UIGOTHzc7zTqNBMjJU7eUR1rdtLiQVu8WOXGNk828y08CmdpPqfITDWG96A==
X-Received: by 2002:a63:bf0d:: with SMTP id v13mr11169018pgf.303.1622927405492; 
 Sat, 05 Jun 2021 14:10:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k1sm4560865pfa.30.2021.06.05.14.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 14:10:05 -0700 (PDT)
Subject: Re: [PATCH v16 80/99] target/arm: tcg-sve: import narrow_vq and
 change_el functions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-81-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <484b0d7d-69e2-9a83-d431-4887615723a1@linaro.org>
Date: Sat, 5 Jun 2021 14:10:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-81-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> aarch64_sve_narrow_vq and aarch64_sve_change_el are SVE-related
> functions only used for TCG, so we can put them in the
> tcg-sve.c module.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu.h                 |  7 ---
>   target/arm/tcg/tcg-sve.h         |  5 ++
>   linux-user/syscall.c             |  4 ++
>   target/arm/cpu-exceptions-aa64.c |  1 +
>   target/arm/tcg/cpregs.c          |  4 ++
>   target/arm/tcg/helper-a64.c      |  1 +
>   target/arm/tcg/helper.c          | 87 --------------------------------
>   target/arm/tcg/tcg-sve.c         | 86 +++++++++++++++++++++++++++++++
>   8 files changed, 101 insertions(+), 94 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8614948543..3edf8bb4ec 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1056,9 +1056,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
>   #ifdef TARGET_AARCH64
>   int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>   int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> -void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
> -void aarch64_sve_change_el(CPUARMState *env, int old_el,
> -                           int new_el, bool el0_a64);
>   
>   static inline bool is_a64(CPUARMState *env)
>   {
> @@ -1090,10 +1087,6 @@ static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
>   }
>   
>   #else
> -static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
> -static inline void aarch64_sve_change_el(CPUARMState *env, int o,
> -                                         int n, bool a)
> -{ }
>   
>   #define is_a64(env) ((void)env, false)
>   
> diff --git a/target/arm/tcg/tcg-sve.h b/target/arm/tcg/tcg-sve.h
> index 4bed809b9a..5855bb4289 100644
> --- a/target/arm/tcg/tcg-sve.h
> +++ b/target/arm/tcg/tcg-sve.h
> @@ -21,4 +21,9 @@ uint32_t tcg_sve_disable_lens(unsigned long *sve_vq_map,
>   bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
>                              Error **errp);
>   
> +void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
> +
> +void aarch64_sve_change_el(CPUARMState *env, int old_el,
> +                           int new_el, bool el0_a64);
> +
>   #endif /* TCG_SVE_H */
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index c9f812091c..db4b7b1e46 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -134,6 +134,10 @@
>   #include "fd-trans.h"
>   #include "tcg/tcg.h"
>   
> +#ifdef TARGET_AARCH64
> +#include "tcg/tcg-sve.h"
> +#endif /* TARGET_AARCH64 */
> +
>   #ifndef CLONE_IO
>   #define CLONE_IO                0x80000000      /* Clone io context */
>   #endif
> diff --git a/target/arm/cpu-exceptions-aa64.c b/target/arm/cpu-exceptions-aa64.c
> index 7daaba0426..adaf3bab17 100644
> --- a/target/arm/cpu-exceptions-aa64.c
> +++ b/target/arm/cpu-exceptions-aa64.c
> @@ -21,6 +21,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
>   #include "cpu.h"
> +#include "tcg/tcg-sve.h"
>   #include "internals.h"
>   #include "sysemu/tcg.h"

Ok, sure.

>   
> diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
> index 56d56f7f81..9d3c9ae841 100644
> --- a/target/arm/tcg/cpregs.c
> +++ b/target/arm/tcg/cpregs.c
> @@ -16,6 +16,10 @@
>   #include "cpu-mmu.h"
>   #include "cpregs.h"
>   
> +#ifdef TARGET_AARCH64
> +#include "tcg/tcg-sve.h"
> +#endif /* TARGET_AARCH64 */

Don't like the ifdef here.  If in the previous patch we had moved zcr to 
cpregs-a64.c, it certainly wouldn't be required.

> diff --git a/target/arm/tcg/tcg-sve.c b/target/arm/tcg/tcg-sve.c
> index 99cfde1f41..908d2c2f2c 100644
> --- a/target/arm/tcg/tcg-sve.c
> +++ b/target/arm/tcg/tcg-sve.c
> @@ -24,6 +24,7 @@
>   #include "sysemu/tcg.h"
>   #include "cpu-sve.h"
>   #include "tcg-sve.h"
> +#include "cpu-exceptions-aa64.h"

Unnecessary.


r~

