Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECDD31B3D4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 02:05:03 +0100 (CET)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBSJx-0005FT-Io
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 20:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSIy-0004qE-NK
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:04:00 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:56015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSIw-0001aI-Tg
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:04:00 -0500
Received: by mail-pj1-x1035.google.com with SMTP id cv23so2761097pjb.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 17:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tVQKlXmYelTqclqkTi3dKKitQ7XZYfz3QLUNX7aYovU=;
 b=HFqAZk7PlwofXKftPQFQjNj25EngrkS2+CNyDc+dk3ifkPvSSdJszGBEklhE7NcZ9i
 jiablyyav0SV15BhKz1BXXD7drC3T0m0ZZR4pPbzHUiHntx1I6XMX3zV45h4SvOY59+0
 HZ6oRdWCXhbaCwRF6NKSQkStCgQblL973wqPaXQwCgkaLPBN8LrdU8CMlFS3akq5VwoQ
 MIe/JL2QN6liZuZXDWb7Pw7tlaUKsDyjPy1zWPZ2uEekeY8sLRtRH6HMAEU5m3ZRALSW
 HgtosbhNlpBhuCtmSZfjqOJGNsfEKuZnhwK9vRgLwmT84R3DosRp8O/skjItwd0rlwrx
 MxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tVQKlXmYelTqclqkTi3dKKitQ7XZYfz3QLUNX7aYovU=;
 b=CdkHhrqqqiGedlnout2DAOMRJ2PoqvzdEMFJcdyAXEg4TpuRmoQLHVYcJ0IgaZNuNd
 ksCqp6WdEfDT47rRIfHgUuYN3Hvug191EwroDjwEqr4rvDTSxYZcd5HmFdgKm36T5Ljo
 vk9qTo+glBB+GHsbqVlACZMDtkCgE1WUX4eHqiijJk0V0RPAlalMA49NUFMl+iSb+Gqb
 ITzcoueQ07eSv62enmL/eEAr4sd/eKmKXkHLl6qcct4lxHssXhGNKZLo9gmHeas+ephx
 X1ZxewyYeh9mZCtR3e/dF2WYqs8+AR2K4JNu2dr2hE5BGLmg52nMjgJYL9NTSoQI78tx
 Mq2Q==
X-Gm-Message-State: AOAM533VxwXPodUiYGqZVNPpsUUeYbyvOii6g9umKvrIJ8QtRkNLD4vA
 S4f6efB7BoLD7T7JfhS9FlvK5g==
X-Google-Smtp-Source: ABdhPJz7Nrli0g1wOKiLg3xuamJMJ1mg4lUpXhfXmIsylc9GbeF7J044jlW4GDdVNwr30jJUIjvysw==
X-Received: by 2002:a17:90b:1008:: with SMTP id
 gm8mr14031803pjb.174.1613351037223; 
 Sun, 14 Feb 2021 17:03:57 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 ms24sm3135605pjb.18.2021.02.14.17.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 17:03:56 -0800 (PST)
Subject: Re: [PATCH v8 29/35] Hexagon (target/hexagon) translation
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-30-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <152e99c9-675a-1fc8-c44c-e80d5af8ce70@linaro.org>
Date: Sun, 14 Feb 2021 17:03:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-30-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> +static inline void ctx_log_reg_write(DisasContext *ctx, int rnum)

Drop the inline markup throughout.

> +static int read_packet_words(CPUHexagonState *env, DisasContext *ctx,
> +                             uint32_t words[])
> +{
> +    bool found_end = false;
> +    int nwords, max_words;
> +
> +    memset(words, 0, PACKET_WORDS_MAX * sizeof(uint32_t));
> +    for (nwords = 0; !found_end && nwords < PACKET_WORDS_MAX; nwords++) {
> +        words[nwords] = cpu_ldl_code(env,
> +                                ctx->base.pc_next + nwords * sizeof(uint32_t));

translate_ldl, so that a plugin has access to the packet data.  (Note that
pkt_crosses_page is fine, because that's read-ahead, not reads for the current
packet.)

> +#if HEX_DEBUG
> +static inline void gen_check_store_width(DisasContext *ctx, int slot_num)
> +{
> +    TCGv slot = tcg_const_tl(slot_num);
> +    TCGv check = tcg_const_tl(ctx->store_width[slot_num]);
> +    gen_helper_debug_check_store_width(cpu_env, slot, check);
> +    tcg_temp_free(slot);
> +    tcg_temp_free(check);
> +}
> +#define HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num) \
> +    gen_check_store_width(ctx, slot_num)
> +#else
> +#define HEX_DEBUG_GEN_CHECK_STORE_WIDTH(ctx, slot_num)  /* nothing */
> +#endif

Fold this to a simple function call:

static void gen_check_store_width(...)
{
    if (HEX_DEBUG) {
       ....
    }
}

> +#if HEX_DEBUG
> +        /* When debugging, only put one packet per TB */
> +        ctx->base.is_jmp = DISAS_TOO_MANY;
> +#endif

Why?  You can always add -singlestep to the command-line.

> +    case DISAS_NORETURN:
> +        gen_exec_counters(ctx);
> +        tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], hex_next_PC);
> +        if (ctx->base.singlestep_enabled) {
> +            gen_exception_debug();
> +        } else {
> +            tcg_gen_exit_tb(NULL, 0);
> +        }

DISAS_NORETURN says that we have *already* exited the TB.  None of the code you
emit here will be reachable.


r~

