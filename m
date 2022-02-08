Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3044AE4D4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 23:42:43 +0100 (CET)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZC4-0001uy-Vh
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 17:42:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZ1h-0004zu-MZ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:31:58 -0500
Received: from [2607:f8b0:4864:20::429] (port=41881
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZ1f-000407-Iy
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:31:57 -0500
Received: by mail-pf1-x429.google.com with SMTP id i30so914627pfk.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eQttTyellAhNPlnsqa7cGjm8nwHf8F4uXask9MOaqRE=;
 b=XdVfx3uljsAU/fAAIxK6hcH0DTLcMg6DJkcjm5xp9QkNOJFa3eHy2GTVRNWb4pW/Mq
 uaLKt2w609KXzx9sX5XnO2OabdM1HIRL5Ofk91MkbcebNVVBkVhDlF3E+YaeksXu9VkN
 7KVzetEfudNbeo+6L6XgFRIiXn/lkXIN/YOwGrBndB7biHAyCygJjw4xC1TWoZJ3byBr
 1+AyKNW0kzpvSrCxy15Sq1nOaTkMH8aFbI5l6LGPlqKLWX0XBa3i6hctFeKezPr1SS+l
 cWZpdql7O9sOUiMbMtISWuX0xYumN2Q8ZSARcnK6UROx3h2IzpqMrCCBt6eJaSD9ElyH
 eURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eQttTyellAhNPlnsqa7cGjm8nwHf8F4uXask9MOaqRE=;
 b=Ip3xHg2bxuwqF1vxdJw5kkZOQ7VKu8o6u0dKP6ktkMfFaqEe5PlojTjfkY1M1qcdOd
 hQrHTBtyhqQIcjG+RBmH1maopImFTzF+erVCP4zVJdEZK7geV4xMPD54qQ0GSKjCVoxk
 kqKJC7LlKRmuZsKefAm4IshTBYk1Dm2LJH87yRdvkQQyUkpQ7HFjtTzcQqOTgfYLR4qh
 KwA0/e7EwPweCPbR8DEvyfS/kqYWThce75XEZKTZx8vWWfdNTFtOYgWrFu2DBbkiBA3e
 3wB+Ey8p0VbIyNLVDjLL8f/6cciHVP4pMwFDJPdMtZz+qhODT6YS5XJFf/8GgrCN1Cjd
 P+pw==
X-Gm-Message-State: AOAM530GU9BgNZCiD3Vdgw8C0weeBUMhtayA8PxUBnsgwAbnRLcI7JTn
 d13y13nukO+ACaDn0UZTX517oA==
X-Google-Smtp-Source: ABdhPJxITQTEcN3bIhI5r5KON5S1VJUSQ/6XTIQgVobkjDnkZ2Hwy4w3jlYk3+NlEo+JH/959sAlwg==
X-Received: by 2002:a65:63d2:: with SMTP id n18mr5264976pgv.245.1644359514108; 
 Tue, 08 Feb 2022 14:31:54 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id q17sm17012638pfu.160.2022.02.08.14.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:31:53 -0800 (PST)
Message-ID: <47a3b787-00e5-d34f-66b8-089923492bd5@linaro.org>
Date: Wed, 9 Feb 2022 09:31:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/13] target: Use forward declared type instead of
 structure type
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-10-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> The CPU state is forward declared.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h | 14 +++++++-------
>   target/xtensa/cpu.h    |  2 +-
>   2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

