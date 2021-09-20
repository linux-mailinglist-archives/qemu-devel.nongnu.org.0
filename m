Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B98412683
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 20:58:12 +0200 (CEST)
Received: from localhost ([::1]:44660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSOUV-0007YV-Bd
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 14:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSORZ-0005FD-5x
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:55:09 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSORX-0004SR-Jz
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:55:08 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so137689pjc.3
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 11:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=noVEGSfwWr2Rlxs2R1lRAzsDLzxX6IqBJXx3Sgsejsg=;
 b=R3DUUtwJnmMD+VrT+TPSjXH+hD1O4oUoyfeMxr1DaWENX9Cnvns0F9/Fs0XEC2lKp7
 HA4CPqu8OsWsHXgJ6eCiPvUr2G2lvI2KKT1MAn3dO+eMXASSvsE9WpxpvENPHBi49MhF
 fQhp58uE24Czm4HqdfZdpHHu2jMLoZdbOAeW+e30YHLx7WHb7HjYIYIlnPPxD3P6dkvY
 VYRmh89nkozAn2UirtaPJCdOQE0gcSOOuouog8EsfJ1+CzeemDuu16ibmAzLJr0oyBFs
 e6iMeirJ0q2WtjXNegSOLtGIikYv9dLq8BF2dNv5MOzLiZ1HIyvb6M/JIH8NJoN6/Jw1
 2b7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=noVEGSfwWr2Rlxs2R1lRAzsDLzxX6IqBJXx3Sgsejsg=;
 b=R1rx8Y5jbxZhkRqMO7r/wBLxg8s+VFpG52KE6L5pRrrQy5/9vgWoqHIW2GXpphp3xi
 952Yw7h3Cz+oy6owLXtrjttvwwAskKFkIXTVuA5nbW4D1pdwXga1tfLTCOjVLqF7ju7Y
 82Ys0b67dBWZU05sh4wsHXY/w2hnwnlS+o2DBm2Skfrd71jFRkPfT9eohOs+RIHFHxD5
 3yEAUD9hiNCo93EYaS7phARfBmxBtgk/bKxKHZMGQvsYSXA5divGxNHxe/OJ/O6ZaZt2
 RmDS8izdyyEswfWDnfptJYPppSJ0zubPtIaAwwQilUXPr0XdWLngnNEaVVmtBfuqjj1z
 oWCw==
X-Gm-Message-State: AOAM530bgkqVNi5dPQMc9r8lOO3H3sX+xCSahknZwjTvBRu3L+zjcZQ1
 ATsL8YRSQQmL+0RfMX7cgCvMqA==
X-Google-Smtp-Source: ABdhPJyjkz5kzR6zfEVWaZ9WWJN/7iycAayO+03Q4RNiCRJR86k0lH6YGE2GvtUxRCR2N2mtS17DvA==
X-Received: by 2002:a17:90b:168a:: with SMTP id
 kv10mr546391pjb.35.1632164105955; 
 Mon, 20 Sep 2021 11:55:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e5sm730559pfj.181.2021.09.20.11.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 11:55:05 -0700 (PDT)
Subject: Re: [PATCH v6 02/21] target/loongarch: Add core definition
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
 <1631866380-31017-3-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a491f4af-0f42-4ee4-f32c-b4bebbc02eda@linaro.org>
Date: Mon, 20 Sep 2021 11:55:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631866380-31017-3-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 1:12 AM, Song Gao wrote:
> +static bool loongarch_cpu_has_work(CPUState *cs)
> +{
> +    return true;
> +}

Note that this function will shortly disappear for user-only.

> +static bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                       MMUAccessType access_type, int mmu_idx,
> +                       bool probe, uintptr_t retaddr)
> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +    CPULoongArchState *env = &cpu->env;
> +
> +    env->badaddr = address;
> +    cs->exception_index = EXCP_ADE;
> +    do_raise_exception(env, cs->exception_index, retaddr);
> +}

As will this.  But in the meantime,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

