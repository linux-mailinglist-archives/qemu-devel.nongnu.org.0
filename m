Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D624FA961
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 17:55:58 +0200 (CEST)
Received: from localhost ([::1]:41086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndDRM-0002D1-GU
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 11:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDPp-0001Wf-An
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 11:54:21 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndDPn-0005YE-Ny
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 11:54:20 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b15so10947275pfm.5
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=nyiNLf1fuFijQODFO7InsTDiOf4ZfxgPK6gQmK7Hjrs=;
 b=ddTnbB8whXbvYDzvfRHcB55Rm5k8kjb+J4dvQQwMYrdnK8fNQarN8W4ymOXRKHdOAS
 HPCu549WwCfoqDcYfFHMK/ysii8/37twBZyp0ttxWtCYOe8XC9I/Nu9WxNnLxHbVp1Ci
 GIwG0f0to8pzn1gys03B+O5CooEYFT0c2O4EcVPtwSj9IjWTaARzdy2z8auXm1RrEj6G
 sNpwhv60us23Krnx+QuH8t9hGDhskfXqHIw6RJmQForssCoRaxOh+4tl70kwiqwwqvvu
 IelXq+GWR1QMtdJzurNuUw18pjZC7ojXqncF59wXKJezT/SjEfkPWkffhGdnVk7n1fyY
 3cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nyiNLf1fuFijQODFO7InsTDiOf4ZfxgPK6gQmK7Hjrs=;
 b=StNCbvuPeuDfFXJT5pSSPLgF3kJiZkKgdjVDjf02J4PWjfXCH6a0kLHlT7SUZmU52X
 C2iuWBUA4aCnhcUohfT546gZF+IfSMfB8M87OvHDzvii/TNOqTGfFZZ5pMzpVXEQ7LZ6
 1djp0fxczUobuJObyHg5F9WcaVKwzLQ3RSUMUd+1UwCOaPIJNm6H3uolk0bsOsAiu2mz
 8KZGsZvhsDpzyI+ZSZ13C/msXlPwKiSe/fZk8uZ3eI9j5Qqyy1rZAMzHKjjvAaepTaWf
 snYAC4X/dhJqvg7GJNjajBxGKPlK3t9MFwpGbhH3hBa9RSd/ph1RbVjv9rIvkffcTtBJ
 eSEw==
X-Gm-Message-State: AOAM533eVmBdEtsM/BvW0DZ9XY/7NF9FwojRdnbI8rzN3kjFcsu6THOU
 ux3kbcQz6mlwZDf+7t27Dw8onw==
X-Google-Smtp-Source: ABdhPJxaDIKUoDSAvdhdzOnnTPUC2RE5RzuTPDnDkCzLduCevtt9AVUpEO+fjFXA2OiEeVxCqfntdQ==
X-Received: by 2002:a65:46c2:0:b0:385:fb1c:f0c4 with SMTP id
 n2-20020a6546c2000000b00385fb1cf0c4mr19707228pgr.405.1649519658142; 
 Sat, 09 Apr 2022 08:54:18 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a056a001acc00b004fb37ecc6b2sm29392817pfv.29.2022.04.09.08.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 08:54:17 -0700 (PDT)
Message-ID: <ab16e28e-08bf-e9f3-94ed-1cc9362d7b92@linaro.org>
Date: Sat, 9 Apr 2022 08:54:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 04/15] accel/tcg: move trace events to correct location
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
 <20220408164742.2844631-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408164742.2844631-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 4/8/22 09:47, Alex Bennée wrote:
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   accel/tcg/cputlb.c     | 2 +-
>   accel/tcg/trace-events | 4 ++++
>   trace-events           | 4 ----
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

