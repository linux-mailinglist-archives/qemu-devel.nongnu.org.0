Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12117421C3B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 03:54:00 +0200 (CEST)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXZeY-0007mM-Sh
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 21:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXZcH-0005jO-UB
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 21:51:38 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXZcF-0008Nk-GQ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 21:51:37 -0400
Received: by mail-pf1-x42c.google.com with SMTP id m5so3288484pfk.7
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 18:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=//DnrnfEnsbx9YcZSoyOGuuCto6VmrDgEVE2aTy/Pg8=;
 b=zgTRvpLhJO84jvzObQl3dN196kZY4eMKNrctxIz4fAaUDNqYo71hgs/H0O1/ZvkPUA
 xJf48iQPDebUUcMCfNYHDPYMLvqXIP+gd/3txBRD2cEXFgcjOQK9yH6BcMGcxdfZzKbN
 /OwNLhYCEcc1/KFapHzQJe2rk73og1Qj+Rw5YiKNXWrW6o1bqamZluOhmR7a/6RXo9RF
 cngq+1fLRQPe+uA+WuTz+miwBBa9UMpkkViTsUckNde6aFtgsADNygbre/KOkYqc1+NA
 o85+oAS7ZGwlbEbkv8/A6bhwPF9XSUX3GlYqjimGjKmLHKCSr48Q3kT8JDZ6JYTgHCZb
 vlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=//DnrnfEnsbx9YcZSoyOGuuCto6VmrDgEVE2aTy/Pg8=;
 b=TCia0sgW2nGBD1hD6iG1q3RHPEz/kL2sxzJZl4AsHTe/3IDGC3s5hlJbFWuukWS4wG
 614T7gcGvEVdQIM0CwqflE5RJAc1YyQRaDXkB4Tnjb6ZWq/c5NNOoCKIFY5YtSkf4/1k
 SzsNL2frMkk0921jJv51Ovz1wx4qeHWC5LfQ1ENWEzRnyx632DepblVBRwDNbp3y0I7q
 hkPyIODaxyrvAyaeKLvjGwvJ08RAubNT6JMqUeA3egSGcptPIqbWpqkqfFCJvNZ6wXe/
 9ReGSi4SHHaq69hoHLgg8BUWhauZpe13qNldlr3gdOGK/JtV7624nLbvjNQrHHvRDXuL
 Zymg==
X-Gm-Message-State: AOAM53244xwzoS/Hjo4PD4Plspl2AAqFbW6Kknswon/J/uGvWpgOq4/v
 s56s854JfHFgB5McdVU0zw+mXsRkpgpyUQ==
X-Google-Smtp-Source: ABdhPJz7JBnr5btyFMjAzWCcq+L0+uOw1LUiZvVxIXbTMnjrG/r+tbQphKBgzFW+Fu+JkG0vs1CboA==
X-Received: by 2002:aa7:8116:0:b0:44b:e0d1:25e9 with SMTP id
 b22-20020aa78116000000b0044be0d125e9mr29037489pfi.53.1633398693780; 
 Mon, 04 Oct 2021 18:51:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q17sm6746639pfs.118.2021.10.04.18.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 18:51:33 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Split HPPA TCG vs HPPA machines/hardware
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211004083835.3802961-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91342bc9-ff06-ed7e-2735-0fdfe740c7a8@linaro.org>
Date: Mon, 4 Oct 2021 18:51:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211004083835.3802961-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 1:38 AM, Philippe Mathieu-Daudé wrote:
> Hardware emulated models don't belong to the TCG MAINTAINERS
> section. Move them to the 'HP-PARISC Machines' section.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   MAINTAINERS | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

