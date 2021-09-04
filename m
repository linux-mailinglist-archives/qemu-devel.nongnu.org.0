Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13415400A77
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 11:46:29 +0200 (CEST)
Received: from localhost ([::1]:41584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMSFn-0004Oh-G8
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 05:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMSDw-0003XW-Bb
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 05:44:32 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMSDu-0001J7-Li
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 05:44:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id u9so2079335wrg.8
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 02:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JrGTCcVfn6BEeZv8S++wadMUoGu2Hy/uy1IDS7ct5i8=;
 b=ZroJMAQ9j4h53A+xud/kyJCEtxJe3P+MQ541ayrX8ZCH1WnPlfEKnZSuO0KgGdkpeH
 9gdz35YJOkF7uysmXg74PiTzgDgyUfgdvnwCj4mxA0G/u/VypHHSb4HZ08rxFZUbvVhN
 zrFPD4p8wicr0zpg9hPVmb/vhuL17QMyTs1mVDI6EHKnXN+sd5Xsnl72TfpJ0jP6iOUs
 ddaFBId7qYlLCqJON4A8KwNG5TEhOwF9mGkZnTHZQ+JhIW4huguJa0WiIZHPCFmEIC+H
 dcAuz0B8FYG/+XsAlA3V91uj15jJwYn08McJaxwRpj9bl7Ra9iNhXIvIybj92dnI9wBQ
 4ySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JrGTCcVfn6BEeZv8S++wadMUoGu2Hy/uy1IDS7ct5i8=;
 b=QE6MydFJBYL2DU+vyTeGyCgy8P0uexXwZ4R2cui7zUTaqS55C3o3/fgVUWLbLz0yz0
 Aw6oNip/LWjrUX1E7ynoiWSriMswT5ftiojNk0gGdBQ+kBuu1UlVS1sT69xZBe9hboe5
 TFsX8TfY2CN8p8d+HFbIW+ese1cbJf/Ou4ZUrhUqZYz62TLlQuqUora+LdooaE8y4tOr
 iC1vOalnLJLZhjXI3h65Wr9kEfd1sxMqspeBPUd75KdH8yihgn6+Lv0nYUKsygrTK2S1
 Ut1XvkjtgxlrMlA1Ov4eSRBet/c6uPF/TTjQtzBMth+2c8UZxmT4nGxOFp7BxuWs2ago
 eedQ==
X-Gm-Message-State: AOAM5323UyAOmMTaGf3j6TWXr6k7/6VthiwfNWk0BAJpxj2k4qLTYgaF
 vhuXqMVeSQxtE3XMqQGR9zDAig==
X-Google-Smtp-Source: ABdhPJyqo002PYYQAgFRmSEYpiLG/9/nO53ato3IqW9DA2Qc8/ZswxIR6BIDj3YrI4IA9nkNOH+M3Q==
X-Received: by 2002:a5d:5490:: with SMTP id h16mr3222888wrv.170.1630748668902; 
 Sat, 04 Sep 2021 02:44:28 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id d9sm2038254wrb.36.2021.09.04.02.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 02:44:28 -0700 (PDT)
Subject: Re: [PATCH v4 02/21] target/loongarch: Add core definition
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-3-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b86c8179-27df-b7e2-8d47-1aa2629097c3@linaro.org>
Date: Sat, 4 Sep 2021 11:44:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-3-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:40 PM, Song Gao wrote:
> +#define FCSR0_M1    0x1f         /* FCSR1 mask, Enables */
> +#define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
> +#define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
> +#define FCSR0_RM    8            /* Round Mode bit num on fcsr0 */
> +#define GET_FP_CAUSE(reg)        (((reg) >> 24) & 0x1f)
> +#define GET_FP_ENABLE(reg)       (reg & 0x1f)
> +#define GET_FP_FLAGS(reg)        (((reg) >> 16) & 0x1f)
> +#define SET_FP_CAUSE(reg, v)      do { (reg) = ((reg) & ~(0x1f << 24)) | \
> +                                               ((v & 0x1f) << 24);       \
> +                                     } while (0)
> +#define SET_FP_ENABLE(reg, v)     do { (reg) = ((reg) & ~(0x1f) | (v & 0x1f); \
> +                                     } while (0)
> +#define SET_FP_FLAGS(reg, v)      do { (reg) = ((reg) & ~(0x1f << 16)) | \
> +                                               ((v & 0x1f) << 16);       \
> +                                     } while (0)
> +#define UPDATE_FP_FLAGS(reg, v)   do { (reg) |= ((v & 0x1f) << 16); } while (0)

Better to use "hw/registerfields.h":

FIELD(FCSR, ENABLES, 0, 5)
FIELD(FCSR, RM, 8, 2)
FIELD(FCSR, FLAGS, 16, 5)
FIELD(FCSR, CAUSE, 24, 5)

Then e.g.

#define GET_FP_CAUSE(REG)    FIELD_EX32(REG, FCSR, CAUSE)
#define SET_FP_CAUSE(REG, V) FIELD_DP32(REG, FCSR, CAUSE, V)

#define UPDATE_FP_FLAGS(REG, V) \
     do {
         (REG) |= FIELD_DP32(0, FCSR, FLAGS, V);
     } while (0)

> +static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
> +                                        target_ulong *pc,
> +                                        target_ulong *cs_base,
> +                                        uint32_t *flags)
> +{
> +    *pc = env->pc;
> +    *cs_base = 0;
> +}

Missing *flags = 0.


r~

