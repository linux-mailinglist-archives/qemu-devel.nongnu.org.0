Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920DE6A11F6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:25:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJ5z-0005Pl-15; Thu, 23 Feb 2023 16:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJ5v-0005Ny-O9
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:25:40 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJ5s-0000yh-Go
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:25:39 -0500
Received: by mail-wm1-x32e.google.com with SMTP id p26so10004606wmc.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JP/Oh76mN6Cg+YU8sgO0Pw9l1PSXNnWsm3AkK8yVEB4=;
 b=lGkcbmQK+7sSZps5vrtnFwaVOJGkSXXkwHma+q0/AX7HIebpNft47g0W8YBLavdMjJ
 Af9dJIWYSLSzc+xsmjZvKN5rURPHVKX8mb1nzpZmWLPe5KtgU4/DatwalIKUR45vQ8vU
 i20Sd82nmiDFcssTagOQMbaWtQBt8cRB3CeQ2jfA1XGUpoUET48MJ4o20cjpbbvA8D/r
 BS0uqZAnppxqZauYJ/iPMDNyABdCQJf52KOkOj6k8hp0aVpIwXwVDaJvWGC/4UpLhnNL
 XKbcJZ0AkD0W9ve40PCvpory666Vml4pfRLbW3sY4eA2HhtztD9jA0jaa2pSaC64dx5k
 /7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JP/Oh76mN6Cg+YU8sgO0Pw9l1PSXNnWsm3AkK8yVEB4=;
 b=YH0MmvG5aOm5DObOINlpRVLmKczUCtqpsqKS9PC3Hsjg8lQ2Sj46+mZpLOW7Wu7Qr0
 cgCImq+Vq889Wf5+C5kUsChWwrA0G7/P1AYh7vmzu4mSpvIit105iHdLadUYJO1VtQef
 fg7D21bjVawRyo0xCr+ZKIltDpsx6HoPPP/TGe/c9On5Ux1hKgEn900/OCIxL8BnLMLt
 mecRmlG/vJY/M4iaKuEC381cEy2RcE+uLt+wEEhwLzzvcwDhWscfHy0XZkp+En5hXnBN
 G0UCzoA51v7H2Bz+XQKHGA5fX6ISFHiePXM9GQ9+BQheblYI/JVNrZ/81eaf4exQKwPt
 u/4Q==
X-Gm-Message-State: AO0yUKUTrsO2jBbIQKG9EOtPoDjLysEunkeGbArQLEaUPCri/m7N+yvw
 Ly+ejJIpBAezFWpJLwNgw2O78w==
X-Google-Smtp-Source: AK7set9zroF1bOT+f++56W3hqtxvZuLJvm/EpzTt2C84DPU/QeUeSwDCEGo/RMa8Ta/InzSpgUF1lA==
X-Received: by 2002:a05:600c:706:b0:3dc:438a:c381 with SMTP id
 i6-20020a05600c070600b003dc438ac381mr3965152wmn.28.1677187506312; 
 Thu, 23 Feb 2023 13:25:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a1cf414000000b003e71a6be279sm475080wma.37.2023.02.23.13.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:25:05 -0800 (PST)
Message-ID: <d65c998b-a061-85c8-8719-7fa0ec1aff8f@linaro.org>
Date: Thu, 23 Feb 2023 22:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 01/13] target/sparc: Use tlb_set_page_full
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223204342.1093632-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 23/2/23 21:43, Richard Henderson wrote:
> Pass CPUTLBEntryFull to get_physical_address instead
> of a collection of pointers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> ---
>   target/sparc/mmu_helper.c | 121 +++++++++++++++++---------------------
>   1 file changed, 54 insertions(+), 67 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


