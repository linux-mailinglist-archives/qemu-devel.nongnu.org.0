Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D356300DC4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:32:54 +0100 (CET)
Received: from localhost ([::1]:56906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l336x-0006mF-BP
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l334l-0005hM-Kv
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:30:35 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l334j-0004Xc-Et
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:30:35 -0500
Received: by mail-ej1-x62e.google.com with SMTP id g12so9490508ejf.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pelOE8ZTmqJGpBGxaSCzWRLVAUazkkoMSKZjqx4i55o=;
 b=s0FYiQaPu83WvNDlTmo32lQo7pggd1InqhKUSvSCw+iAPvou+/8/wIcppQMCbZMd6R
 FNyw+zDnQkNNVVc9V25Jl4fFpsfgRDRb3vn9Zmd0C2KStjW1qIKOClNMP5WD5q+sGE0B
 fDUbL3Cd3KiLTtshepBx8G4Cymx3SctlJJaPsWSSkLajMadb+sWv4YlX+kC7zXRVEecE
 ALJkuRnac8b7fO4M8KjIiOBRmqwkdAD4eACYYKhcyA95ssqEYNYtrOgt7vSV075u2We+
 2cxNx/AoMaOfirIsmJ2J5hnFZS81y/Q6tQK3at/cvpfWrXMXpK4vjz01mU35VhWhVE8n
 FCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pelOE8ZTmqJGpBGxaSCzWRLVAUazkkoMSKZjqx4i55o=;
 b=dvMM6eFjHEAWp7m53DHcUQuoZOpPiibdIH/gaM9vQ3TJAY8VSQWHW/XIJQfoCRyCJW
 r8jYpuTsYuN1IrJm1qz9FfgEUqZ2vKJvVtGkEMtagscuq2eZ9dbTf41Gwt1vLocNOWY2
 mPYe3Rd0XVhh+he8Hr1y3TEoRNnTH/vh8v49Dlow5f1GLR04izisIlLAzC+p7oDEp2IW
 jqGPlJ29smpoXtA89N93nnvLF2LJdURahzLqJZg9YvU7iNyWNtDG1TXEdid13jw2c9jN
 NdqwOPCHCUdFXaD461ftXB2UiZSV8lQ+65fkh8bZXE6RHmv5FY+z1aBf9AOx9VFolIgh
 0DkA==
X-Gm-Message-State: AOAM531ICYrSxRks+zTLsUS06MZP5resreDHZv2ChMov+A0qsqgZCOT4
 PaVRCfvhVnlZtE3QK5h2FNQ=
X-Google-Smtp-Source: ABdhPJzW9/I11GoLAsxqTNP9n+QxbkB7BtaezwnbJAnh8hIbpwIbtqAxEeiRWCVqaamNmTdz1xU52g==
X-Received: by 2002:a17:906:1d5a:: with SMTP id
 o26mr4161891ejh.301.1611347431354; 
 Fri, 22 Jan 2021 12:30:31 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z2sm5262167ejd.44.2021.01.22.12.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:30:30 -0800 (PST)
Subject: Re: [PATCH v7 07/35] Hexagon (target/hexagon) scalar core helpers
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-8-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ae9949ca-aa0c-8917-8498-2b0dc5161465@amsat.org>
Date: Fri, 22 Jan 2021 21:30:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611113349-24906-8-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Taylor,

On 1/20/21 4:28 AM, Taylor Simpson wrote:
> The majority of helpers are generated.  Define the helper functions needed
> then include the generated file
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/helper.h    |   85 ++++
>  target/hexagon/op_helper.c | 1066 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 1151 insertions(+)
>  create mode 100644 target/hexagon/helper.h
>  create mode 100644 target/hexagon/op_helper.c
...

> diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
> new file mode 100644
> index 0000000..5186dd1
> --- /dev/null
> +++ b/target/hexagon/op_helper.c
> @@ -0,0 +1,1066 @@
> +/*
> + *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu.h"
> +#include "exec/helper-proto.h"
> +#include "fpu/softfloat.h"
> +#include "cpu.h"
> +#include "internal.h"
> +#include "macros.h"
> +#include "arch.h"
> +#include "hex_arch_types.h"
> +#include "fma_emu.h"
> +#include "conv_emu.h"
> +
> +#define SF_BIAS        127
> +#define SF_MANTBITS    23
> +
> +/* Exceptions processing helpers */
> +static void QEMU_NORETURN do_raise_exception_err(CPUHexagonState *env,
> +                                                 uint32_t exception,
> +                                                 uintptr_t pc)
> +{
> +    CPUState *cs = CPU(hexagon_env_get_cpu(env));
> +    qemu_log_mask(CPU_LOG_INT, "%s: %d\n", __func__, exception);
> +    cs->exception_index = exception;
> +    cpu_loop_exit_restore(cs, pc);
> +}
> +
> +void QEMU_NORETURN HELPER(raise_exception)(CPUHexagonState *env, uint32_t excp)
> +{
> +    do_raise_exception_err(env, excp, 0);
> +}
> +
> +static inline void log_reg_write(CPUHexagonState *env, int rnum,
> +                                 target_ulong val, uint32_t slot)
> +{
> +    HEX_DEBUG_LOG("log_reg_write[%d] = " TARGET_FMT_ld " (0x" TARGET_FMT_lx ")",
> +                  rnum, val, val);
> +    if (env->slot_cancelled & (1 << slot)) {
> +        HEX_DEBUG_LOG(" CANCELLED");
> +    }
> +    if (val == env->gpr[rnum]) {
> +        HEX_DEBUG_LOG(" NO CHANGE");
> +    }
> +    HEX_DEBUG_LOG("\n");
> +    if (!(env->slot_cancelled & (1 << slot))) {
> +        env->new_value[rnum] = val;
> +#if HEX_DEBUG
> +        /* Do this so HELPER(debug_commit_end) will know */
> +        env->reg_written[rnum] = 1;
> +#endif
> +    }
> +}
> +
> +static __attribute__((unused))
> +inline void log_reg_write_pair(CPUHexagonState *env, int rnum,
> +                                      int64_t val, uint32_t slot)
> +{
> +    HEX_DEBUG_LOG("log_reg_write_pair[%d:%d] = %ld\n", rnum + 1, rnum, val);
> +    log_reg_write(env, rnum, val & 0xFFFFFFFF, slot);
> +    log_reg_write(env, rnum + 1, (val >> 32) & 0xFFFFFFFF, slot);
> +}
> +
> +static inline void log_pred_write(CPUHexagonState *env, int pnum,
> +                                  target_ulong val)
> +{
> +    HEX_DEBUG_LOG("log_pred_write[%d] = " TARGET_FMT_ld
> +                  " (0x" TARGET_FMT_lx ")\n",
> +                  pnum, val, val);
> +
> +    /* Multiple writes to the same preg are and'ed together */
> +    if (env->pred_written & (1 << pnum)) {
> +        env->new_pred_value[pnum] &= val & 0xff;
> +    } else {
> +        env->new_pred_value[pnum] = val & 0xff;
> +        env->pred_written |= 1 << pnum;
> +    }
> +}
> +
> +static inline void log_store32(CPUHexagonState *env, target_ulong addr,
> +                               target_ulong val, int width, int slot)
> +{
> +    HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx ", " TARGET_FMT_ld
> +                  " [0x" TARGET_FMT_lx "])\n",
> +                  width, addr, val, val);
> +    env->mem_log_stores[slot].va = addr;
> +    env->mem_log_stores[slot].width = width;
> +    env->mem_log_stores[slot].data32 = val;
> +}
> +
> +static inline void log_store64(CPUHexagonState *env, target_ulong addr,
> +                               int64_t val, int width, int slot)
> +{
> +    HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx ", %ld [0x%lx])\n",
> +                   width, addr, val, val);
> +    env->mem_log_stores[slot].va = addr;
> +    env->mem_log_stores[slot].width = width;
> +    env->mem_log_stores[slot].data64 = val;
> +}
> +
> +static inline void write_new_pc(CPUHexagonState *env, target_ulong addr)
> +{
> +    HEX_DEBUG_LOG("write_new_pc(0x" TARGET_FMT_lx ")\n", addr);
> +
> +    /*
> +     * If more than one branch is taken in a packet, only the first one
> +     * is actually done.
> +     */
> +    if (env->branch_taken) {
> +        HEX_DEBUG_LOG("INFO: multiple branches taken in same packet, "
> +                      "ignoring the second one\n");
> +    } else {
> +        fCHECK_PCALIGN(addr);
> +        env->branch_taken = 1;
> +        env->next_PC = addr;
> +    }
> +}

I'm getting:

In file included from ../target/hexagon/op_helper.c:23:
../target/hexagon/op_helper.c: In function ‘log_reg_write_pair’:
../target/hexagon/op_helper.c:74:19: error: format ‘%ld’ expects
argument of type ‘long int’, but argument 4 has type ‘int64_t’ {aka
‘long long int’} [-Werror=format=]
   74 |     HEX_DEBUG_LOG("log_reg_write_pair[%d:%d] = %ld\n", rnum + 1,
rnum, val);
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       ~~~
      |
       |
      |
       int64_t {aka long long int}
../target/hexagon/internal.h:28:22: note: in definition of macro
‘HEX_DEBUG_LOG’
   28 |             qemu_log(__VA_ARGS__); \
      |                      ^~~~~~~~~~~
../target/hexagon/op_helper.c:74:50: note: format string is defined here
   74 |     HEX_DEBUG_LOG("log_reg_write_pair[%d:%d] = %ld\n", rnum + 1,
rnum, val);
      |                                                ~~^
      |                                                  |
      |                                                  long int
      |                                                %lld
In file included from ../target/hexagon/op_helper.c:23:
../target/hexagon/op_helper.c: In function ‘log_store64’:
../target/hexagon/op_helper.c:109:19: error: format ‘%ld’ expects
argument of type ‘long int’, but argument 4 has type ‘int64_t’ {aka
‘long long int’} [-Werror=format=]
  109 |     HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx ", %ld [0x%lx])\n",
      |                   ^~~~~~~~~~~~~~~~
  110 |                    width, addr, val, val);
      |                                 ~~~
      |                                 |
      |                                 int64_t {aka long long int}
../target/hexagon/internal.h:28:22: note: in definition of macro
‘HEX_DEBUG_LOG’
   28 |             qemu_log(__VA_ARGS__); \
      |                      ^~~~~~~~~~~
../target/hexagon/op_helper.c:109:19: error: format ‘%lx’ expects
argument of type ‘long unsigned int’, but argument 5 has type ‘int64_t’
{aka ‘long long int’} [-Werror=format=]
  109 |     HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx ", %ld [0x%lx])\n",
      |                   ^~~~~~~~~~~~~~~~
  110 |                    width, addr, val, val);
      |                                      ~~~
      |                                      |
      |                                      int64_t {aka long long int}
../target/hexagon/internal.h:28:22: note: in definition of macro
‘HEX_DEBUG_LOG’
   28 |             qemu_log(__VA_ARGS__); \
      |                      ^~~~~~~~~~~
../target/hexagon/op_helper.c: In function ‘print_store’:
../target/hexagon/op_helper.c:201:27: error: format ‘%lu’ expects
argument of type ‘long unsigned int’, but argument 3 has type ‘uint64_t’
{aka ‘long long unsigned int’} [-Werror=format=]
  201 |             HEX_DEBUG_LOG("\tmemd[0x" TARGET_FMT_lx "] = %lu
(0x%016lx)\n",
      |                           ^~~~~~~~~~~
  202 |                           env->mem_log_stores[slot].va,
  203 |                           env->mem_log_stores[slot].data64,
      |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                    |
      |                                                    uint64_t {aka
long long unsigned int}
../target/hexagon/internal.h:28:22: note: in definition of macro
‘HEX_DEBUG_LOG’
   28 |             qemu_log(__VA_ARGS__); \
      |                      ^~~~~~~~~~~
../target/hexagon/op_helper.c:201:27: error: format ‘%lx’ expects
argument of type ‘long unsigned int’, but argument 4 has type ‘uint64_t’
{aka ‘long long unsigned int’} [-Werror=format=]
  201 |             HEX_DEBUG_LOG("\tmemd[0x" TARGET_FMT_lx "] = %lu
(0x%016lx)\n",
      |                           ^~~~~~~~~~~
......
  204 |                           env->mem_log_stores[slot].data64);
      |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                    |
      |                                                    uint64_t {aka
long long unsigned int}
../target/hexagon/internal.h:28:22: note: in definition of macro
‘HEX_DEBUG_LOG’
   28 |             qemu_log(__VA_ARGS__); \
      |                      ^~~~~~~~~~~

