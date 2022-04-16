Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD95031FE
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 02:14:35 +0200 (CEST)
Received: from localhost ([::1]:52188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfW5B-0001RR-KC
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 20:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfW48-0000my-A2
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 20:13:28 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfW46-0007dC-8X
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 20:13:27 -0400
Received: by mail-pg1-x532.google.com with SMTP id t13so9035993pgn.8
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 17:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1HPXaFhDPIvU51//4NSlEtLXYv896w73E5MnLZxI9YI=;
 b=k4ydB1meaciSAPxH2UaIt4ugllETtOVtJI7f+UK+jpxbHd71bsp0rlES75ZWjffKY6
 GKT4lV6kKnLnFqxIQa/VON7tl2ZqiC9BtXb1O6i/Qdbdv0vz40tR2+6e3KkQQNRhrvSX
 cr3DojvwF5QAzemkb4sK8Tv3/q5+ABH3fRz/LEdQxQe1e0yCzhRyWymqwWkLi5w26LIe
 ZREz+jqjOmmF8vUTl16eWkTOVqXXv/ww6CT21aOZNa0KWh3FXJHx3BcN8/KqO8QF7hs4
 DqSqRndgj+SryWfobKl/1p/qxE5nQGcMEiKYyG+Q5IFmdPQy2yE7/VdxmWbMbZ3c9eIW
 Y6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1HPXaFhDPIvU51//4NSlEtLXYv896w73E5MnLZxI9YI=;
 b=C7lHIdA5pgkMwfXSYPeHlAf0Ct/Bidc9v8dkuO+yVNTvrbaJmz0isJPUeyz9ZpEIBD
 B4oNzylzzujy8lyCIiyVxAhTzQ+2uJTsdZWdwc7JrndBDYNYLuokr+cJFBr57c/Jg0xR
 /TQoO7oafEsZ5d27ExZMoNi5fd2FnA/bwqntyQaHVvdI14FCHBo4/c+QNyECyPRLnBj+
 3T2xhG6Nn9W+v8dGjB39Q1VJrK5VavjWL0GGncHdN4aMI2TuDnXOSz3FKEaWBlFEvzCE
 1ex8I+1pKoLW3uvs5c8kkgYfSeCDUkSeOZcSlTpliUzH8l+MY3ZSDIWCeu6cFLhLgwvX
 DaTg==
X-Gm-Message-State: AOAM533wScF8iPF0hntwtYerJu3/aspYDuaC4s3W/A+SGU1uT8LevNzZ
 s59tMwoXiuUcEHz7jyxbFF0omQ==
X-Google-Smtp-Source: ABdhPJx2u6CU+P0OCUOkl54hrU4vK0I1uaZTOmekAYPYWScSAa4xnAo5piy39oX/C8h0vlxerDKRRQ==
X-Received: by 2002:a63:fd53:0:b0:386:66d:b40c with SMTP id
 m19-20020a63fd53000000b00386066db40cmr1100147pgj.266.1650068004654; 
 Fri, 15 Apr 2022 17:13:24 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z188-20020a6265c5000000b0050602bec574sm3798115pfb.209.2022.04.15.17.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 17:13:24 -0700 (PDT)
Message-ID: <e34ca328-cee0-0604-186f-57738ffd85e9@linaro.org>
Date: Fri, 15 Apr 2022 17:13:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 23/43] target/loongarch: Add LoongArch interrupt and
 exception handle
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-24-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-24-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +    if (level) {
> +        env->CSR_ESTAT |= 1 << irq;
> +    } else {
> +        env->CSR_ESTAT &= ~(1 << irq);
> +    }

This is

     env->CSR_ESTAT = deposit64(env->CSR_ESTAT, irq, 1, level != 0);

> +static inline unsigned int get_vint_size(CPULoongArchState *env)
> +{
> +    uint64_t vs = FIELD_EX64(env->CSR_ECFG, CSR_ECFG, VS);
> +    uint64_t size = 0;
> +
> +    if (vs == 0) {
> +        return 0;
> +    }
> +
> +    if (vs < 8) {
> +        size = 1 << (vs + 2);
> +    }
> +
> +    if (vs > 8) {
> +        qemu_log("%s: unexpected value", __func__);
> +        assert(0);
> +    }
> +
> +    return size;
> +}

Given that VS is 3 bits, the two tests against 8 are unnecessary.

> +
> +static void loongarch_cpu_do_interrupt(CPUState *cs)
> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +    CPULoongArchState *env = &cpu->env;
> +    bool update_badinstr = 1;
> +    int cause = -1;
> +    const char *name;
> +    bool tlbfill = FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR);
> +
> +    if (cs->exception_index != EXCCODE_INT) {
> +        if (cs->exception_index < 0 ||
> +            cs->exception_index > ARRAY_SIZE(excp_names)) {
> +            name = "unknown";
> +        } else {
> +            name = excp_names[cs->exception_index];
> +        }
> +
> +        qemu_log_mask(CPU_LOG_INT,
> +                     "%s enter: pc " TARGET_FMT_lx " ERA " TARGET_FMT_lx
> +                     " TLBRERA " TARGET_FMT_lx " %s exception\n", __func__,
> +                     env->pc, env->CSR_ERA, env->CSR_TLBRERA, name);
> +    }
> +    if (cs->exception_index == EXCCODE_INT &&
> +       (FIELD_EX64(env->CSR_DBG, CSR_DBG, DST))) {
> +        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DEI, 1);
> +        goto set_DERA;
> +    }

Seems like this block could be moved into the switch, and fall through into EXCCODE_PIF.

> +    uint32_t vec_size = get_vint_size(env);
> +    env->pc = env->CSR_EENTRY;
> +    env->pc += cause * vec_size;
> +    if (tlbfill) {
> +        /* TLB Refill */
> +        env->pc = env->CSR_TLBRENTRY;
> +    }

The first 3 statements seem better placed as an else to the if (tlbfill).
Also, probably all of this should be pushed down, into the non-interrupt branch.


> +    if  (cs->exception_index == EXCCODE_INT) {
> +        /* Interrupt */
> +        uint32_t vector = 0;
> +        uint32_t pending = FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS);
> +        pending &= FIELD_EX64(env->CSR_ECFG, CSR_ECFG, LIE);
> +
> +        /* Find the highest-priority interrupt. */
> +        while (pending >>= 1) {
> +            vector++;
> +        }

Use clz32 to compute this, not a loop.

> +        env->pc = env->CSR_EENTRY + (EXCCODE_EXTERNAL_INT + vector) * vec_size;
> +        qemu_log_mask(CPU_LOG_INT,
> +                      "%s: PC " TARGET_FMT_lx " ERA " TARGET_FMT_lx
> +                      " cause %d\n" "    A " TARGET_FMT_lx " D "
> +                      TARGET_FMT_lx " vector = %d ExC %08lx ExS %08lx\n",
> +                      __func__, env->pc, env->CSR_ERA,
> +                      cause, env->CSR_BADV, env->CSR_DERA, vector,
> +                      env->CSR_ECFG, env->CSR_ESTAT);
> +    }
> +
> +    if (!tlbfill) {
> +        env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, ECODE, cause);
> +    }

This second if appears to be misplaced, and needs to be above the first if -- in 
particular, we will have just logged an incorrect value for ESTAT.

After that is moved...

> +    if (cs->exception_index != EXCCODE_INT) {
> +        qemu_log_mask(CPU_LOG_INT,
> +                      "%s: PC " TARGET_FMT_lx " ERA " TARGET_FMT_lx
> +                      " cause %d%s\n, ESTAT " TARGET_FMT_lx
> +                      " EXCFG " TARGET_FMT_lx " BADVA " TARGET_FMT_lx
> +                      "BADI " TARGET_FMT_lx " SYS_NUM " TARGET_FMT_lu
> +                      " cpu %d asid 0x%lx" "\n", __func__, env->pc,
> +                      tlbfill ? env->CSR_TLBRERA : env->CSR_ERA,
> +                      cause, tlbfill ? "(refill)" : "", env->CSR_ESTAT,
> +                      env->CSR_ECFG,
> +                      tlbfill ? env->CSR_TLBRBADV : env->CSR_BADV,
> +                      env->CSR_BADI, env->gpr[11], cs->cpu_index,
> +                      env->CSR_ASID);
> +    }

... this becomes an else for the first if.


r~

