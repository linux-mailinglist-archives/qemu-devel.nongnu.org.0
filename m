Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E224EA1A3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:38:37 +0200 (CEST)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYw8K-0002b8-J8
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:38:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYvpz-0007If-7q
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:19:40 -0400
Received: from [2001:4860:4864:20::29] (port=44680
 helo=mail-oa1-x29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYvpx-0003l7-NP
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:19:38 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so16461461fac.11
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+iEEJIhbLw4FOlMj8dP3tgYA6gQkbkYFnetRMFVdd+k=;
 b=CfIMdyNCugBt843V9ZBn919YL1EAvoNc9aH93NvC4gETKqGNsqpVWidBEcqJUv+KS3
 Ei+WVEs0AEMGaAYL5FeBRdiiFNyVTMOy7xx4yVAYV4JvMmIzutJjr9meIKODXbB3tIqm
 IjFwPomNJ6GbDSc74b6wxZLdkjblZIRZWRsbfJ84O/o+ySueibJWlDc43NdA4OpH5MHv
 R4NjxHU/C5AnLSaZwd+edUd2wjv2mZrr8U3fqO2AnIqmuBHNTaH4Uyec0PHlcW6xQkgo
 2Balz6Fjarhceh2kflLcu2E/EN38rKuYsrBhkWvTio9XEM1AIcbvgd5ZhC17VeJH8f7T
 pX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+iEEJIhbLw4FOlMj8dP3tgYA6gQkbkYFnetRMFVdd+k=;
 b=HvUvVBhNyuuKwfFhu3p9H6q6lO2FbmCd1X8zPA9nsarZBZ3MOyXoj4mI/OI2kEToXB
 fGGorLVNP4aPJSrtgE7F0H4MmBpidluhwuLODz3xCd0t9GYPEi7G5Ho9RpU4XBWQmYu6
 eS9y7E2GNxRHMWGUUJf0pCiLv2xcfriAXriYM1CymziSs+8MY/Q9To8PmKi/7Bp/ipl4
 t2XLtlK9HAqrkQA504+ZI966Lh04KOl8ky0vbsINMwm+wU3khLyqPRTK1hPdOdRkBi42
 djkDaWKLDSX4ncGpi1OKUDJPBJG1PbVwr33q7k0gfkR6F+1XGu3mFrExBf4Ip6slQa6N
 ZWMg==
X-Gm-Message-State: AOAM531MsndebHoVH+RfpjDoi93uT9YwHvSFxYhm3xZONSopDM+t8mIn
 xC3Ls52LpUWlcSvjDkKJXf6VDg==
X-Google-Smtp-Source: ABdhPJwQ1qrYuKT4fbIyH3NhbbqW/rnZuQ32P5YmZ/bPB2XOxiH3liAC6xEOJOl6VaOLJtBFpbSaTw==
X-Received: by 2002:a05:6870:b02a:b0:de:aa91:898c with SMTP id
 y42-20020a056870b02a00b000deaa91898cmr460168oae.25.1648498776581; 
 Mon, 28 Mar 2022 13:19:36 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a056870ed9000b000dde87bcdfdsm6931967oab.53.2022.03.28.13.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 13:19:33 -0700 (PDT)
Message-ID: <f2a59dac-34a6-b26b-31d5-59cb4dff75b4@linaro.org>
Date: Mon, 28 Mar 2022 14:19:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 11/29] target/loongarch: Add LoongArch interrupt
 and exception handle
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-12-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-12-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::29
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> 1.This patch Add loongarch interrupt and exception handle.
> 2.Rename the user excp to the exccode from the csr defintions.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   linux-user/loongarch64/cpu_loop.c             |   8 +-
>   target/loongarch/cpu.c                        | 260 +++++++++++++++++-
>   target/loongarch/cpu.h                        |  11 -
>   target/loongarch/fpu_helper.c                 |   2 +-
>   target/loongarch/insn_trans/trans_extra.c.inc |   4 +-
>   target/loongarch/translate.c                  |   2 +-
>   6 files changed, 261 insertions(+), 26 deletions(-)

To repeat my response to the cover letter, the changes in this patch should be folded back 
into the original patches defining the base architecture.


r~

