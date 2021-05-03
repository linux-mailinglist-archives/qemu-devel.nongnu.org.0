Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3414371940
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:29:24 +0200 (CEST)
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbRj-0007IS-Ob
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbOY-0003Da-UG
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:26:07 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbOR-0007s7-Kt
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:26:05 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so3686904pjv.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BpZ01e/px3ETUh+MIQ7zxYO4qunKC63regl2feMEVVw=;
 b=fxS2V+MXiJTBSvCfo/ZXWVHPEeWk2h0IuwEa5iVchUGUz4HHdjczOi90J5x18LshsO
 7xjQGJI7kcHADYgmAUrgctxiNUm6M3+jsiK7J60CStwhpSHNQdBY2tg5UA5YSGlaKjSM
 q1UaKC6s8++j9viLNzFMFTxfNQAWaRFiKyZpJpYfxJBdToJvNpAw+vC6ZiJJ602cdnng
 7mmwRTcuiumYJ+0qtdFSVVn1lPyPapVO3YxSj4JTPARzUThtlYqFQd16bjvOa7lXuW6s
 lEobjxO3ezY5QjhtsuPT9Q2KS27SaVC/EFWxOCSKrnWmLXKGLDblmrsw9ErWTfJAexem
 Z39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BpZ01e/px3ETUh+MIQ7zxYO4qunKC63regl2feMEVVw=;
 b=TY3ctvpWpatL3ZHHu5vD1ok4NZeKM8ddeE2uHHOzkkZHazVAMHQnHUPqhIYgng7CN/
 f1gtbw+eycf4V02UzenzpEB5BlLsrkoicIq+BSGaMbbZcU6LDhFNpjQiDRG83WR9TME8
 GmAqf68VXBofDraNUnbNvSLJ2gKSyBH8j/+WnyUbhqgPHxj8cKBmotv8q8ExCFkh1+Ev
 RMFJdaOs1k1Cjar7SqCNPfo+MZimlqQIWQC4AD6NKoVnWItKgRBIAZBhgDejP33+1K03
 JwoiGuBaAS+ZoXDSMPDFlUypzzgfSibgrwuLl9pzoFYEE4TJPyydJQlFOJ+pQPi1dKn2
 22CQ==
X-Gm-Message-State: AOAM531sBaK/9NKQfjDVXD2MNlWocLCNo3YjhdJMyEpWBAjL9xpHLXc2
 BpVhmInTVA3+W3eOCSkC9Ik+/g==
X-Google-Smtp-Source: ABdhPJyUWY1VqTc7ekFdz54QG83RJzPu1T9aB5NzKhOnvaoscSGcaSb2lL0/uh8lSDBcLvHeHZ6EQQ==
X-Received: by 2002:a17:90a:bb13:: with SMTP id
 u19mr21738965pjr.96.1620059158387; 
 Mon, 03 May 2021 09:25:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e8sm9314063pfv.177.2021.05.03.09.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 09:25:57 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] hw/sparc/sun4m: Fix code style for checkpatch.pl
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502185441.599980-1-f4bug@amsat.org>
 <20210502185441.599980-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <33dc4b60-1947-4066-3408-613ff0b4e810@linaro.org>
Date: Mon, 3 May 2021 09:25:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210502185441.599980-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> We are going to move this code, fix its style first.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/sparc/sun4m.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

