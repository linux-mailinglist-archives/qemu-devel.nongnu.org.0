Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079BA4402FE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:15:51 +0200 (CEST)
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXLs-0003n8-JM
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgX0K-0000lV-VO
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:53:28 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgX0J-0006nx-7a
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:53:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id p20so4784519pfo.12
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 11:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qIUbdvFSXMllAw9mbEZSsjEKL1OSbyjqtHYwXASlskU=;
 b=vlpSOf2FTwxPj1qICo7jJFzfcKT7FPKyvlp2wINExCimhfFuOHYQxXZe3gvdM8Tjuj
 iFik0+3jFjn3dzx9fgAybrhqDv+52lPHIAF9pxHta4YvZ0EA9Cp6wLbgfmW0na9pBaix
 7/3CVu0+ryesCTcT+dWK3DzfJdNtlgeezsPpj4MklcinlqdvNinEn1ai8ZzV3hKwp+Oo
 QYocW2HOkgXA+ZL1Ny5qD4r6WjSjtKtfjhcZNBsxA9vOZwwx4aAR9eh6y8U95FfIRmab
 vRgPYtIADvPxB94i4TJKGJsDcThpE9RDdhyCWmpPFj7UiSxzYWBBTgmEYvmXl5oVt26j
 7jqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qIUbdvFSXMllAw9mbEZSsjEKL1OSbyjqtHYwXASlskU=;
 b=R9igxJoWR5GZWCFRby/ElMzIcJzfeQXUQfRkpYzrD7xViJ3rebof78J6aKYsWm5t/l
 LZnamYqXMhUun+B2cZKg3uSIVWs3d74tIcTXhXYDHqz3y4NqRzIM1207WJpkwKiV+E7W
 kWLSCyZaZ7P21BNi5cWbvSnoo+5vueCJM/GR3Hy4xe2cBEhuMJ1EQtcZJThBxqQPM7RC
 ArgXnJv0KulJ+cZX7udbBxSN8Mqcp8CaVoH0vdZP0awCNZqHr7xQUVVo+sCRUiplH/Cq
 KZliSlphENJIAMdfHnQB5cw7YN28MEHhwHYa0d6fEiUPtRxcRtspnHxhMD2gw0DUDtS8
 rhWQ==
X-Gm-Message-State: AOAM531bBuYUofQ3m4wsCSbZsK78gl5650TZXX6/q57F5xGMcznKAOyF
 V9i1Vb5hmdaaWNhKrUuSa5QHCw==
X-Google-Smtp-Source: ABdhPJyg1pinfsvOIfQGjKmcisjel+c0t6bRoy7JX+3RGC5TIQX9sCSM0zSxWIK5TAaw0oQ6hKPs3g==
X-Received: by 2002:a62:88d1:0:b0:47b:ef7f:996b with SMTP id
 l200-20020a6288d1000000b0047bef7f996bmr12475904pfd.19.1635533605571; 
 Fri, 29 Oct 2021 11:53:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 145sm71314pfx.87.2021.10.29.11.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 11:53:24 -0700 (PDT)
Subject: Re: [PATCH v4 10/30] Hexagon HVX (target/hexagon) instruction utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-11-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23d04fd0-82ae-2f7f-95a9-051daf179bbb@linaro.org>
Date: Fri, 29 Oct 2021 11:53:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634033468-23566-11-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 3:10 AM, Taylor Simpson wrote:
> +void mem_vector_scatter_init(CPUHexagonState *env, int slot,
> +                             target_ulong base_vaddr,
> +                             int length, int element_size)
> +{
> +    int i;
> +
> +    for (i = 0; i < sizeof(MMVector); i++) {
> +        env->vtcm_log.data.ub[i] = 0;
> +    }
> +    bitmap_zero(env->vtcm_log.mask, MAX_VEC_SIZE_BYTES);
> +
> +    env->vtcm_pending = true;
> +    env->vtcm_log.op = false;
> +    env->vtcm_log.op_size = 0;
> +    env->vtcm_log.size = sizeof(MMVector);

Init really wants size != 0 here?  Because it's not that way for gather...

Otherwise it looks like you want

     memset(&env->vtcm_log, 0, sizeof(env->vtcm_log));


> +void mem_vector_gather_init(CPUHexagonState *env,
> +                            target_ulong base_vaddr,
> +                            int length, int element_size)
> +{
> +    int i;
> +
> +    for (i = 0; i < sizeof(MMVector); i++) {
> +        env->vtcm_log.data.ub[i] = 0;
> +        env->vtcm_log.va[i] = 0;
> +        env->tmp_VRegs[0].ub[i] = 0;
> +    }
> +    bitmap_zero(env->vtcm_log.mask, MAX_VEC_SIZE_BYTES / 8);
> +    env->vtcm_log.op = false;
> +    env->vtcm_log.op_size = 0;
> +}

Likewise memset of vtcm_log, with a second memset for tmp_Vregs[0].


r~

