Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B054CD10
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:34:18 +0200 (CEST)
Received: from localhost ([::1]:59704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1V29-0003Wm-3I
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1UVB-0005if-EQ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:00:15 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1UV9-0002FX-Vk
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:00:13 -0400
Received: by mail-pf1-x435.google.com with SMTP id x4so11667887pfj.10
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LJ0MgiKg4Csz/jID4OcBqdOFWm+wF7v0dZB38YqZcT4=;
 b=ZEZtdGhzJuqmo71SBpILwky4AU8KDqz/LthAi71Lf0Ooi+FJ49yj6kssQwGDnB1QVN
 jvvX6JLeRpetAMcYdt852XY0p1MCai81bJaJE1nNR774NbgvByySZMJtvFVh07iB01bU
 Lfg0++M5n4vYJdz2pwms4gQdMAzQssEd8j48hzcrpDXQPJnRHK9zSTG/BVQfwz4UPj6F
 Z5rP/3wDaL5ZFINX28Q8kaFpyC2QUwz4xpnUWgSmCkD13R28gUvIs7QlovHLLBaNPmnn
 e+Nx5FR5vMhC4iw9+2zlrrdXAb0xs5pbskSiAhf3OCwUfSlYugm55BAhoQV9VXIsWafk
 S1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LJ0MgiKg4Csz/jID4OcBqdOFWm+wF7v0dZB38YqZcT4=;
 b=YSn20bZ/rP5NzHHbOfku3xd8sQFKUZLlwEOOHE5QX5EisxZm18VoC6oZc6bjw5UPOw
 hnv1iOpNR/DqKjx+rOoKxK+v5LFhTJ1gNfpLz0K1cM28ZEKcYP9mgQvLpPHTUGNL6vUM
 HnpvJe/xMIr3XhlE4awERlITSBDkRTbVmCJ19pT5TRnqzq/fPMzl/bBKUXNmNMahbHZN
 ld4vFPJQQqwF+oDPs/pf/JaYgUteqHuXmPQ51qhGq0bYvBUF1IXUFtQOOYawZuB05w6B
 w1uZw1VMU4N3Vv7kzGZ+lf+/uILM5OSjPYP5sFPOUQh/WDLj0B/KoAfunI6uNr4bl4KY
 cstA==
X-Gm-Message-State: AJIora/JHne/PuRYLLna9Trn1GY9bGgBNnVgLWJwBB3InEEC7Zny+9zh
 N9Ovp5X8CmV68r9zcFWnIFppNrN/VkTqZA==
X-Google-Smtp-Source: AGRyM1u125a80odK6CdYkbpxcx5VWO+8tPbbBRUJEKn7kXDMhEWx1sF8ADMVIL56Z0WAh3wu4ywtiQ==
X-Received: by 2002:a63:77cc:0:b0:408:e3bc:6294 with SMTP id
 s195-20020a6377cc000000b00408e3bc6294mr222343pgc.154.1655305210490; 
 Wed, 15 Jun 2022 08:00:10 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b0016362da9a03sm9314976pli.245.2022.06.15.08.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 08:00:09 -0700 (PDT)
Message-ID: <80e72c3b-40e2-402b-6d7b-ea0cc8bb049f@linaro.org>
Date: Wed, 15 Jun 2022 08:00:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v16 2/9] linux-user: Add LoongArch signal support
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220614090536.1103616-1-gaosong@loongson.cn>
 <20220614090536.1103616-3-gaosong@loongson.cn>
 <a50a74b3-f26a-c3cf-7aaf-12735b712968@linaro.org>
 <d537db33-26a6-5518-4292-32be5f8fc61f@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d537db33-26a6-5518-4292-32be5f8fc61f@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/22 02:57, gaosong wrote:
> 
> On 2022/6/15 上午12:15, Richard Henderson wrote:
>>> +static void *get_ctx(struct target_sctx_info *info)
>>> +{
>>> +    return (void *)((char *)info + sizeof(struct target_sctx_info));
>>> +}
>>
>> Return type should be struct target_sctx_info *. 
> 
> I wonder that if we return target_fpu_context * and rename get_ctx to get_fpu_context() 
> would be better.
> 
> So we need't  cast  like this:
> 
>      struct target_fpu_context *fpu_ctx = (struct target_fpu_context *)
>                                           get_ctx(info);

Oh, hmm.  I think I mis-read the kernel code before -- retain the return type of void* so 
that you do not need the cast at all in the caller.

The computation in the function is weirdly over-complicated -- it's really just "return 
info + 1".


r~

