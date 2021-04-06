Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49048355DAF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 23:12:56 +0200 (CEST)
Received: from localhost ([::1]:41434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTt0I-0002Lk-Rq
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 17:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTszN-0001vv-Sg
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:11:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTszM-00051v-7c
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:11:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so128737pjg.5
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 14:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Nsq7XF3yzF8fSDtsmd0/rEK1lmTrEOrQuhT3DTUWGc=;
 b=GLyeUA1KHozp9wCyczuY3isilRUtnbqpotA8WjRxAGcIcqiavjg3071BhDH7o3PunL
 QAUMi0m0Jvqi5xLPEcG/Z5hTNtXVUFjgDRoKW+pE2494sefc8oT6f5neIhdBgFYPmLMH
 NqWnjZhYht4sbmtG3a+FLKcmmAsgqZHt+yj5uSg3lrE6dAkS63hQisadmB0oAyBK/7B0
 LxuXGEWFwp+K3CDMRDz99koorsTjCwi41mk8eemWsnzQZMJcs9rWu+i5BrzQusNRbXa4
 DGzrzmmKJHD4xXx6XBj3fF7Lz/PzlDCu0l6vJfdMBvar7/RirUqTnN5gTyCyoT9xz2Gi
 5y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Nsq7XF3yzF8fSDtsmd0/rEK1lmTrEOrQuhT3DTUWGc=;
 b=IDLemkoWktmlAqx5XAnBYjRYDEV77kiPGu1cZfBl8/W5DM0tLAkpGZuzU2zrE8+5WG
 m/vwpkBPKntoWGp+uMd9qbp3JoS3Ms7qfIKckq2zgyFWFD3F8FHZbvM5gUO4IveKw1wJ
 MTUnjxwXv6aAaQqy3sAmqnGLs25wFROiVifqCUXVZ2XEcWSWiCDn3Q7LDAHhEJRsMgy8
 +BPvqrE0PUpmeu+5L0JAXG5cKkT1qBYEAJjMCg3sn6ir3r2U+WEFxrgTq0aLuZvh+U6k
 hUKCK4irn1LB4OfLIXUdIDHCghl5BeXUupIY40gKM/UzT1RI50LQhH9qYpjr14oIhffg
 GdvQ==
X-Gm-Message-State: AOAM530hAd1DuKcg2ef7kFl5xhr+kp3IT9qmMgPBVM8kDJFjOrJVvw28
 /m0UKr4QFv1/uURIFthmUuVyZA==
X-Google-Smtp-Source: ABdhPJw4M2tJcnNYEaObNAxGsaqCAhlbFFB+kXNPvrqSg4c7Ry7iiaulGZr45RRx9cRAhuSHuqDOiA==
X-Received: by 2002:a17:90b:2414:: with SMTP id
 nr20mr121163pjb.122.1617743514675; 
 Tue, 06 Apr 2021 14:11:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id e7sm2706808pfv.107.2021.04.06.14.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 14:11:54 -0700 (PDT)
Subject: Re: [PATCH v2 16/21] Hexagon (target/hexagon) add A4_addp_c/A4_subp_c
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-17-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97ee7d14-fdfb-30d8-0b75-42df768d35ef@linaro.org>
Date: Tue, 6 Apr 2021 14:11:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-17-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> +#define fGEN_TCG_A4_addp_c(SHORTCODE) \
> +    do { \
> +        TCGv_i64 carry = tcg_temp_new_i64(); \
> +        TCGv_i64 zero = tcg_const_i64(0); \
> +        tcg_gen_extu_i32_i64(carry, PxV); \
> +        tcg_gen_andi_i64(carry, carry, 1); \
> +        tcg_gen_add2_i64(RddV, carry, RssV, zero, carry, zero); \
> +        tcg_gen_add2_i64(RddV, carry, RddV, carry, RttV, zero); \
> +        tcg_gen_extrl_i64_i32(PxV, carry); \

Note that this is already a single bit, always.

> +static TCGv gen_8bitsof(TCGv result, TCGv value)
> +{
> +    TCGv zero = tcg_const_tl(0);
> +    TCGv ones = tcg_const_tl(0xff);
> +    tcg_gen_movcond_tl(TCG_COND_NE, result, value, zero, ones, zero);
> +    tcg_temp_free(zero);
> +    tcg_temp_free(ones);
> +
> +    return result;

There's little point in a conditional move.
Just multiply by 0xff.

Unless you had another non-boolean use for gen_8bitsof?

Anyway, I guess it's all sane,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

