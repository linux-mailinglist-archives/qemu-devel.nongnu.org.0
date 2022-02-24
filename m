Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BF44C367B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:04:39 +0100 (CET)
Received: from localhost ([::1]:60286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKLu-0008Dv-Cc
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:04:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKIz-0005Y5-LP
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:01:37 -0500
Received: from [2607:f8b0:4864:20::62b] (port=35389
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKIw-0000KL-Tp
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:01:37 -0500
Received: by mail-pl1-x62b.google.com with SMTP id i1so2796639plr.2
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 12:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EvC37QojQlqXdSYTyFGKhyoOqH6i7So5opX0naoX0Os=;
 b=rvdFis/i0BtcGEOyaQwbrJ2ArrAPkavjXdF8Plgv6lVVFwSfuCcSdqO7DHdNHEkjOm
 9j4S/o4zc8eYepZEzAIDQu5r6r3e6Qqd8wuWqGjoN3QkTQiMHaq5/ZxJIMoIh1jITDzE
 G9ETTJJm3h+Z3KtjxAAIzKq4quo1ZqPOMDDk4Oey9npgLWOw58BUOmeQ+kJSV6nfGIhp
 8IbVAk4ML+miT7ceyy0P0tVP420J2ohS6yiE4SAyBH1Qyr244UW0aa9ojUp0XWZtgOK2
 HI3tJ6mk8Lv+tp6h6VFYhQY9FAum47OKYGqFjBK9f8BNeQIFMCLKVn7i7CriMCT+l1+Y
 D5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EvC37QojQlqXdSYTyFGKhyoOqH6i7So5opX0naoX0Os=;
 b=uaKPBOEomFwFXAEHi1hcnoOMXRWqrN0uVsVhewMkXqvE87G+PeOdMM5eaMCMhwYyQm
 HxfSTIDO3pSIhxFQoPZGvvU3GSin0iSKijnzQnn8I1sFVylqQxr+vIq1d9RfkD3q3pXM
 DPOAuuuN2NGKo9LLk93ibVBPnxqy7C4cOzhMp3uz7GcXslVmqc7kG7Z96jzup3ApdD9+
 2960G2/ADuxH/vSzyyVK2GudlA2wCe6NMle/u/jZbkD/kMVexicF/5gz4VBNJGFaIfYA
 LBc6r+UCPRtBFLqoM3G4RnZlmVTK2cQjDcMx1vSsT2dW5kRJcDuY4tWN+YIK1ZQwth/l
 tqUQ==
X-Gm-Message-State: AOAM531eU/c7bhlsFoEEzs0W0SfwSaRMCUzNMWG41DFohNqtWXM29l9J
 W9UUADJRbRVyxPvepaMUkGdqUw==
X-Google-Smtp-Source: ABdhPJz/V9isvCOhuEMXYsMyV7J/N/1JnsioVtFysJf5F1uYuQBgKDpLHaXdYkltzwMO7SKQRqXHXA==
X-Received: by 2002:a17:902:bb89:b0:14d:85a7:6eea with SMTP id
 m9-20020a170902bb8900b0014d85a76eeamr4347996pls.158.1645732893535; 
 Thu, 24 Feb 2022 12:01:33 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 t27-20020aa7939b000000b004ce11b956absm262531pfe.186.2022.02.24.12.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:01:33 -0800 (PST)
Message-ID: <63670297-808e-8b3b-270a-ca70722e6ab5@linaro.org>
Date: Thu, 24 Feb 2022 10:01:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/12] Move HOST_LONG_BITS to compiler.h
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-9-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224183701.608720-9-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 08:36, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> This will help to make common code independent.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/qemu/compiler.h | 3 +++
>   include/qemu/osdep.h    | 3 ---
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

