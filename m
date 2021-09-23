Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE7141718A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:11:14 +0200 (CEST)
Received: from localhost ([::1]:36500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTk2r-00052A-TT
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrc-0005yr-JA
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:36 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:38518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjrb-0002I0-6M
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:59:36 -0400
Received: by mail-qk1-x736.google.com with SMTP id q81so24005334qke.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e2HT48gFRsmTc2RBsXxxFzvWIKUptN4SEVyHkGxp2Q4=;
 b=vRyvBXtIaFtQ+RvT0VmoM4QIKTYjTkiZd4uB0mGELCzBGNVnSsGdUviG3x3iQLa4qR
 QZbDI++kRn589uRnaY8fZYD/z0txR5CmxXu2u8xZ3H2LpL+8GKrjEqiFDMA5wUuGh+LR
 ubN4Q9zxC2+wg+FUAk5ShHWhsmTFotmmDGXmRPpAvbQ34+lzyTut+UpCJCZDQCoqo1Pt
 ktdw3gog0eNOlrXevE1QaelsIaoxELMNK6CL7IqaJXiiz9gTYBIZPYVUN9eJ3E/eqLuv
 q1lEW0SP2n4yD+KkI1o2FfAJEDsZD0e0H4MX51MbWI/iKEhcJcvD3j7c18qAlg3esvp1
 LA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e2HT48gFRsmTc2RBsXxxFzvWIKUptN4SEVyHkGxp2Q4=;
 b=5czoPxufLxK55r+SK7oX04F6Wno/wwVi3N64B8rBdanMkTwVLL9bqjTgC+PEc34Ixw
 HTf0EoaxuGlbyxUcmmaiED1+lYpx/9mAChuELZUaOCT5SSANHkeMnalLdpNeAa8/Rgxv
 fRzaJvX6ksFNU5SBEt/KnqGVMvcuaXPoN47cQ5R8BaZBfiDNXHa+6a29+cgNzR1+InC8
 hvm3mcrltY+yYsuvk6SXNhHhRU/lR/s6S3sT0/pERG/OPL73eNLSSz/svxZq7gExJ4jX
 DTTJPZhxnHfj3q3JWUayp+hqTCnBYH4JN5DWLBqApOxZOk0IsGr3iUGt6fyqmfOXgAjQ
 eTuA==
X-Gm-Message-State: AOAM532tySyLXFTuY2xZ8eL3CWPV79UfK+lgygejJ9qCm+34qr3f56Yf
 4+ZlyJmKScQziQHDub8MYai17htv4ujAuQ==
X-Google-Smtp-Source: ABdhPJyKIh0XSGvLWrNjT2liqNmLigoFCWYWCFngqb/KExcxX7HQ4e9ZCiPE6lzA/Y9o6EaF+061sQ==
X-Received: by 2002:a37:2e03:: with SMTP id u3mr10119738qkh.313.1632484774327; 
 Fri, 24 Sep 2021 04:59:34 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id k4sm4154410qtq.88.2021.09.24.04.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 04:59:34 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (target/hexagon) probe the stores in a packet at
 start of commit
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632335718-13541-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45c6326b-2b01-1ef3-c362-dcb5a11a3d02@linaro.org>
Date: Thu, 23 Sep 2021 10:05:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632335718-13541-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 11:35 AM, Taylor Simpson wrote:
> +static inline void probe_store(CPUHexagonState *env, int slot, int mmu_idx)
> +{
> +    if (!(env->slot_cancelled & (1 << slot))) {
> +        size1u_t width = env->mem_log_stores[slot].width;
> +        target_ulong va = env->mem_log_stores[slot].va;
> +        uintptr_t ra = GETPC();
> +        probe_write(env, va, width, mmu_idx, ra);
> +    }
> +}
> +
> +void HELPER(probe_pkt_stores)(CPUHexagonState *env, int has_st0, int has_st1,
> +                              int has_dczeroa, int mmu_idx)
> +{
> +    if (has_st0 && !has_dczeroa) {
> +        probe_store(env, 0, mmu_idx);
> +    }
> +    if (has_st1 && !has_dczeroa) {
> +        probe_store(env, 1, mmu_idx);
> +    }
> +    if (has_dczeroa) {
> +        /* Probe 32 bytes starting at (dczero_addr & ~0x1f) */
> +        target_ulong va = env->dczero_addr & ~0x1f;
> +        uintptr_t ra = GETPC();
> +        probe_write(env, va +  0, 8, mmu_idx, ra);
> +        probe_write(env, va +  8, 8, mmu_idx, ra);
> +        probe_write(env, va + 16, 8, mmu_idx, ra);
> +        probe_write(env, va + 24, 8, mmu_idx, ra);
> +    }
> +}

You know at translate time the value of all of these has_* variables.

Since has_dczeroa disables the other two probes, surely probe_pkt_dczeroa should be its 
own helper.

That said, if dczeroa (apparently) cannot be paired with other stores, why do you need to 
probe for it at all?  Since the operation is 32-byte aligned, surely the first real store 
will validate the write for the entire block.

Once you eliminate dczeroa from this helper, the only time it will be called is with both 
has_st0 and has_st1 true, at which point you don't need to pass the arguments in at all.


r~

