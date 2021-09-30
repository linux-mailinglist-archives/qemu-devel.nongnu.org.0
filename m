Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C752E41E374
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 23:42:30 +0200 (CEST)
Received: from localhost ([::1]:33728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW3oz-0007LT-KB
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 17:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mW3nt-0006ai-L6
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 17:41:21 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mW3nr-0002Km-AV
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 17:41:21 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 r11-20020a1c440b000000b0030cf0f01fbaso2496329wma.1
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 14:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0HUo69Cc97Iz0LZTc04ZGkEz9meb+luDhnkRckVuZ/I=;
 b=nRqyQg2SjnJeQfDqkQkcSh5MKzbANsBAmq2cICTLPwU/Tcm6rLTrxbm5rdT0jbqCaP
 uobTePpNoAj2hDFPM0iw68oY/+lhyuiBiERXkvTADgHTUBB6d+31JILxS2QeDrLxLRuF
 Eghb3nz3Hn2+3vSKceWO3pUKK9Gb/7nCEN4EUxQPA1ly4YvOgqYk1bV64ooiJBlofzqk
 9+WNTYt9Cx8i/ZBienwGdtG3mro7XWkisIyKplOSAEyip8kn9dd6NIWwqrWLE98OBkgJ
 A2X1C7pfflgLUSKhBZic6RTq0DDci3BOSX7PvH/VXe+nPUSF54Ie0ezoPBlxZ3aPlbcx
 2YCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0HUo69Cc97Iz0LZTc04ZGkEz9meb+luDhnkRckVuZ/I=;
 b=eDpJwAt1qNAzywol75BLND3RJOwY8n5GNDiuuRaBWyQr+Qp6n9Iyy1d6XJQ9xjEuPB
 mjloeZpPmwsXf6tglLzLYEQJoa05hvAkPEo2lLmeklkdfLUxOlgRGjWaD/HIgil0z0hp
 XTb+wTPuM0ItM7+hmoBzNs6CACWCoJ5dcNuhkUN9HvKKgrrIZSBywS8anajV0TyZjfsX
 WZouh4q/TscPG6OLYqwINj0WxTg2qFLPRrNJpl6faXTk6yH4zgCNMBtyQg7eDr5njAku
 ka6CL2QhTa/CLYixEyhJ7DXd6L9tMs5f1sAM0nGTWjlOvTppg3F/Kn2ON0XIYXUPpLkZ
 2fpQ==
X-Gm-Message-State: AOAM531xKTER8I63PCpr7TEJ6iMk9tfnwdEKf+1qvfsr0Xb9fjY2WyS0
 V1eYRVwuvNEZU8PbTNzw6NM=
X-Google-Smtp-Source: ABdhPJxDTPqHW+gmB/34sF5redu9D2HuYsqwBlqObmLXwdFgAzF4IgbbZy0IUlJg8OtXITNRzhnq5Q==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr1273610wmp.165.1633038077330; 
 Thu, 30 Sep 2021 14:41:17 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z12sm4219591wrv.31.2021.09.30.14.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 14:41:16 -0700 (PDT)
Message-ID: <06480ee3-6fa4-c4b8-efe8-d0c6f1999fc3@amsat.org>
Date: Thu, 30 Sep 2021 23:41:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] Hexagon (target/hexagon) probe the stores in a packet
 at start of commit
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1633036599-7637-1-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1633036599-7637-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.127,
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Taylor,

On 9/30/21 23:16, Taylor Simpson wrote:
> When a packet has 2 stores, either both commit or neither commit.
> At the beginning of gen_commit_packet, we check for multiple stores.
> If there are multiple stores, call a helper that will probe each of
> them before proceeding with the commit.
> 
> Note that we don't call the probe helper for packets with only one
> store.  Therefore, we call process_store_log before anything else
> involved in committing the packet.
> 
> Test case added in tests/tcg/hexagon/hex_sigsegv.c
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> 
> *** Changes in v2 ***
> Address feedback from Richard Henderson <richard.henderson@linaro.org>
> - Since we know the value of all the mask at translation time, call
>   specialized helper
> - dczeroa has to be the only store operation in a packet, so we go
>   ahead and process that first
> - When there are two scalar stores, we probe the one in slot 0 - the
>   call to process_store_log will do slot 1 first, so we don't need
>   to probe
> ---
>  target/hexagon/helper.h           |   2 +
>  target/hexagon/op_helper.c        |  16 ++++++
>  target/hexagon/translate.c        |  32 +++++++++++-
>  tests/tcg/hexagon/hex_sigsegv.c   | 106 ++++++++++++++++++++++++++++++++++++++
>  tests/tcg/hexagon/Makefile.target |   1 +
>  5 files changed, 155 insertions(+), 2 deletions(-)
>  create mode 100644 tests/tcg/hexagon/hex_sigsegv.c
> 
> diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
> index ca201fb..89de2a3 100644
> --- a/target/hexagon/helper.h
> +++ b/target/hexagon/helper.h
> @@ -89,3 +89,5 @@ DEF_HELPER_4(sffms_lib, f32, env, f32, f32, f32)
>  
>  DEF_HELPER_3(dfmpyfix, f64, env, f64, f64)
>  DEF_HELPER_4(dfmpyhh, f64, env, f64, f64, f64)
> +
> +DEF_HELPER_2(probe_pkt_scalar_store_s0, void, env, int)
> diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
> index 61d5cde..af32de4 100644
> --- a/target/hexagon/op_helper.c
> +++ b/target/hexagon/op_helper.c
> @@ -377,6 +377,22 @@ int32_t HELPER(vacsh_pred)(CPUHexagonState *env,
>      return PeV;
>  }
>  
> +static void probe_store(CPUHexagonState *env, int slot, int mmu_idx)
> +{
> +    if (!(env->slot_cancelled & (1 << slot))) {
> +        size1u_t width = env->mem_log_stores[slot].width;
> +        target_ulong va = env->mem_log_stores[slot].va;
> +        uintptr_t ra = GETPC();
> +        probe_write(env, va, width, mmu_idx, ra);
> +    }

Matter of taste probably:

       if (env->slot_cancelled & (1 << slot) {
           return;
       }
       probe_write(env, env->mem_log_stores[slot].va,
                   env->mem_log_stores[slot].width, mmu_idx, GETPC());

> +}
> +
> +/* Called during packet commit when there are two scalar stores */
> +void HELPER(probe_pkt_scalar_store_s0)(CPUHexagonState *env, int mmu_idx)
> +{
> +    probe_store(env, 0, mmu_idx);
> +}
> +
>  /*
>   * mem_noshuf
>   * Section 5.5 of the Hexagon V67 Programmer's Reference Manual
> diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
> index 6fb4e68..8fc2c83 100644
> --- a/target/hexagon/translate.c
> +++ b/target/hexagon/translate.c
> @@ -471,10 +471,38 @@ static void update_exec_counters(DisasContext *ctx, Packet *pkt)
>  
>  static void gen_commit_packet(DisasContext *ctx, Packet *pkt)
>  {
> +    /*
> +     * If there is more than one store in a packet, make sure they are all OK
> +     * before proceeding with the rest of the packet commit.
> +     *
> +     * dczeroa has to be the only store operation in the packet, so we go
> +     * ahead and process that first.
> +     *
> +     * When there are two scalar stores, we probe the one in slot 0.
> +     *
> +     * Note that we don't call the probe helper for packets with only one
> +     * store.  Therefore, we call process_store_log before anything else
> +     * involved in committing the packet.
> +     */
> +    bool has_store_s0 = pkt->pkt_has_store_s0;
> +    bool has_store_s1 = (pkt->pkt_has_store_s1 && !ctx->s1_store_processed);
> +    if (pkt->pkt_has_dczeroa) {
> +        /*
> +         * The dczeroa will be the store in slot 0, check that we don't have
> +         * a store in slot 1.
> +         */
> +        g_assert(has_store_s0 && !has_store_s1);
> +        process_dczeroa(ctx, pkt);
> +    } else if (has_store_s0 && has_store_s1) {
> +        TCGv mem_idx = tcg_const_tl(ctx->mem_idx);
> +        gen_helper_probe_pkt_scalar_store_s0(cpu_env, mem_idx);
> +        tcg_temp_free(mem_idx);

The index is read-only, so you can avoid the temporary:

   gen_helper_probe_pkt_scalar_store_s0(cpu_env,
                                        tcg_constant_tl(ctx->mem_idx));

Maybe add a (better) comment here:

       } else {

           /* default path, all constraints OK, we are good */
> +    }
> +
> +    process_store_log(ctx, pkt);
> +
>      gen_reg_writes(ctx);
>      gen_pred_writes(ctx, pkt);
> -    process_store_log(ctx, pkt);
> -    process_dczeroa(ctx, pkt);
>      update_exec_counters(ctx, pkt);
>      if (HEX_DEBUG) {
>          TCGv has_st0 =
> diff --git a/tests/tcg/hexagon/hex_sigsegv.c b/tests/tcg/hexagon/hex_sigsegv.c
> new file mode 100644
> index 0000000..dc2b349
> --- /dev/null
> +++ b/tests/tcg/hexagon/hex_sigsegv.c

hex_sigsegv is a generic test name ...

> @@ -0,0 +1,106 @@
> +/*
> + *  Copyright(c) 2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
> +/*
> + * Test the VLIW semantics of two stores in a packet

... but you are testing a very specific case.

Maybe rename as "multi_pkt_stores" (or better)?

> + *
> + * When a packet has 2 stores, either both commit or neither commit.
> + * We test this with a packet that does stores to both NULL and a global
> + * variable, "should_not_change".  After the SIGSEGV is caught, we check
> + * that the "should_not_change" value is the same.
> + */

Otherwise LGTM.

Regards,

Phil.

