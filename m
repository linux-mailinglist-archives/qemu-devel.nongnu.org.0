Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B61536A25C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:25:35 +0200 (CEST)
Received: from localhost ([::1]:37426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laM2A-0002ul-LM
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM09-0001jQ-EN
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:23:29 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM07-0002RD-9t
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:23:29 -0400
Received: by mail-pl1-x631.google.com with SMTP id n10so15608821plc.0
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZxZ9rNRqxbiNewoTeeMwflZpODl1gGdbiz8sFSISa6M=;
 b=FCchGgwJxVAu/8zj0+jlxjaYBICJNf9H7fBLZ+/bkTjQjR10oqiTK0XK81MduvJhOa
 jEh2748OTvU9Xw/+SNtBhkUUOpFc4BWdwHDohUlqeTko4z3JKscYQkx9ifVGeAkBbEUk
 EZJXfOeG+GFwuuK2Y96o1EtjzxmeXxqEOsILB/L9jHCfCu9cnaDDIuByiLSWxv9D1qcd
 AiNCjDPrqW1MSgrFXVxg1lTszrt4z/Sf0cyzIYoGJh64xZa96+i1tYTRYQU3P+Krgaly
 MJSSUwf3qJCe7QQ6SnoBF3wPsQx/D39jsasGEQWR6YFyF3nUz5GzmG5K+qFUFkHuBuE/
 lljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZxZ9rNRqxbiNewoTeeMwflZpODl1gGdbiz8sFSISa6M=;
 b=GWdqGpFAyqtzPB0xKopDrNX1hiwo1FPejpzbS1hg0X8+ThU0UEEkDdtOo0EHalzwOM
 RQDxmGTRE3n08uyrFCxBYA9MbyI1OZ2W49vN+aXTrD+TZg67HirSnDUHcFSCMptHF7Ph
 rRXTj6EdjhNfTL4DpWiIPOY5aAezQUmOi//IywMAWAg0VmOaHqtlzGiuYkWQmggH5CBe
 M2ZxnTFrvWgdxAMHiEQbOTyudcG3MsibzaaxcsSp9i2gryCwaijt4/kI2/wmrXMnDtNX
 YAaiKRa4ViD/s/ClRl8psecckudI0svvynvSEzvetqFSmfwVCcEJ2bIi6Qb/cWtM4gGU
 JOZg==
X-Gm-Message-State: AOAM533olpsk0C83HYb9SfSKBsptC/v+cecK22EYC4AUJVUDe2cBE35N
 wZvI0JuHkkCEzQPGIuvwOZktqA==
X-Google-Smtp-Source: ABdhPJyJ5wIcjAChwMHg+WqF9WOotw6pfFhBAm7ANkmNNRPTo30w/D6ehSyrRbqvW0Gw6gpvZASI2w==
X-Received: by 2002:a17:90b:19ca:: with SMTP id
 nm10mr11001506pjb.175.1619285005737; 
 Sat, 24 Apr 2021 10:23:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id mq2sm9901352pjb.24.2021.04.24.10.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:23:25 -0700 (PDT)
Subject: Re: [PATCH v2 12/48] bsd-user: style tweak: Remove #if 0'd code
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-13-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a83ba02-528c-0991-0cdc-a1ebc74eea86@linaro.org>
Date: Sat, 24 Apr 2021 10:23:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-13-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 143 ------------------------------------------------
>   1 file changed, 143 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


