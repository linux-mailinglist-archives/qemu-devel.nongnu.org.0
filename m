Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90167A715
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 00:46:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKSxs-0006fT-6b; Tue, 24 Jan 2023 18:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKSxp-0006eU-PF
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 18:44:29 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKSxo-0003Po-5X
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 18:44:29 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h12so11448648wrv.10
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 15:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QQaPZ89/dEGk8+jZrS4JjtCYwRVbqNLIeykBX3O51K8=;
 b=RUu1VPf4E1kgQXcemkfBYdNuJPB0p2OQdXgyP9u24UEsRqByLirhIUEf3/P/2BS2c+
 a2jBOvEZzQCKGsDmcSDXnXdxVqjC7s0I7c2+i7qqUlu6uRJlZgBGHZFoxmK/N+R4Mlu1
 wG2UYT2CMlbq0te/HLgdKrv+IyVarJKkCfonh2LJFwKqk1xOr28c00GqVws4OGydl6tt
 wGunJb0CBG/9KB88luRhQf8ZlPnyXRTFEDl9CtTgGZWi/2OoeBdfkN77BQSn3bDCdoqi
 uaCeqLyKaTEYKhnOVrRMTBgH2aiKa+kdD66IQ62GkZpJmxgrbUZk8FJmZuifQOIT/0oR
 UTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QQaPZ89/dEGk8+jZrS4JjtCYwRVbqNLIeykBX3O51K8=;
 b=SrBrEEQn/j/12tIxioQM3bRKYXANa8ZbtbOh4Aow5hTzWwDAKw020xrS7srz11njQa
 WHu004+Puy8ugo1Cn9YlGiWxGc3UAjlGxpatZegDR+bO57iWfJqf0jXttQQ36SClGGeA
 4cyWX643NBq1FeDDtxyishMjQJ2ZNAQLp17e1d09JnR68Xa74YzVC8Xxb5XI7kfDHEDT
 EZHFLumE39egzxnv8/+o7urLzgFZKNDdqaDQUIU588IYR8LNVJXlbncwaOkhRPQR5/H4
 JLkQah5sB73UM0Hb/TsbTwgKf5ZGxhD6CUIyEYFdNUMGQJExV2ggyJh4yRkDsbO4lF0c
 bAgg==
X-Gm-Message-State: AFqh2kqEUBxBJ8ZyUWYQEQc8jvk8GFm8xwhseZgGZwCLgNCVk1tozV6t
 hbgexYXR2cZp1Kw+OqBjaRa3bg==
X-Google-Smtp-Source: AMrXdXskc+wkPHXDYTP+przZCcrrttDDIsjtSV0ZWQHXcvuBXjp+q2C8SirlLlCaxb8XcOSfrfmG+A==
X-Received: by 2002:a05:6000:a03:b0:2b9:9e7b:be6b with SMTP id
 co3-20020a0560000a0300b002b99e7bbe6bmr28455429wrb.45.1674603866538; 
 Tue, 24 Jan 2023 15:44:26 -0800 (PST)
Received: from [192.168.0.114] ([196.89.153.183])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adff943000000b002bfae43109fsm2793612wrr.93.2023.01.24.15.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 15:44:26 -0800 (PST)
Message-ID: <4add4fd6-3996-8e5a-e75d-3eb262a251ed@linaro.org>
Date: Wed, 25 Jan 2023 00:44:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/36] tcg: Define TCG_TYPE_I128 and related helper
 macros
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/1/23 03:36, Richard Henderson wrote:
> Begin staging in support for TCGv_i128 with Int128.
> Define the type enumerator, the typedef, and the
> helper-head.h macros.
> 
> This cannot yet be used, because you can't allocate
> temporaries of this new type.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/helper-head.h |  7 +++++++
>   include/tcg/tcg.h          | 17 ++++++++++-------
>   2 files changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


