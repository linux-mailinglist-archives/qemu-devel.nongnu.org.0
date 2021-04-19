Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69428364B28
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:31:51 +0200 (CEST)
Received: from localhost ([::1]:40976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaYg-0005yP-8e
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZcT-0003oK-Sn
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:31:41 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZcS-0006rY-1P
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:31:41 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i190so23879698pfc.12
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a4wEgIbJvIvSn621BVtatAoY5ABmsDtKCc0FX8VxaOg=;
 b=fHkJGw5l1yNO4kM8QqcKr35eubj1Ry72c9CdB12mIpphGrAAjGVSex54t8CGMQpOhu
 Px6yuNb6yMqPGe2LCYnZhEvlnvffW4bXrSkiZLpKC36UfMVle98c8uc4jJz4VY3uvpuC
 sk56MzaF4dLIvgE9h55YQeZ6c/G5RwRDhp7bqyuseJ6F1+p2TeAgzPd+fhw8WVT7Ie6/
 3ORBxQqynNZ82zn3erZa5vUY/XHG+WlbsaFpgvBnKU0tuLYXkAT9OL3FOAjVMNweZQbQ
 FD2hnBsfZphY2j/XscEKW/WPOry6WZ1u1nNi4EfR+y4oK19YBIUDsNQVQH/UEBqicu5/
 2yOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a4wEgIbJvIvSn621BVtatAoY5ABmsDtKCc0FX8VxaOg=;
 b=GamETLxYDX0sXsItUEPjiHD8Ky0ANRFqbkUzA34LfOUQonxqBFtLTsjWWLIn5QvxVr
 B9SNL0U2J6JhG9Z2dHdyVe6Gi0ecyY6C7VaUXzraMLMWMojQXxChSursOvyTtOEOodjd
 PCejy5LWtDqzzAdHNFcf8rKCl05cZJlqeVB1F99x/tCAYyLBVx6mG5MSE9M3P1o4y/AR
 +hWaWhitejbHENthyLVMYSw827d8y8Q1pM73X7f3XlEedE0J7IJZSTKElkiGPdKemoJf
 Cu/FNvEbrvA9hEz2dZLKlMA833xTm4LHOZP3FgRrKS0+4mkkhTOjRH/wWqEs/+LuRn/G
 8P2g==
X-Gm-Message-State: AOAM5319XS/xE5LPVtWToy6WyOv/dYokfCEG9C8N8ETnW8P52odlj+Fo
 8Kv95WTurtexM69sLMIEQhuUsnyuUTqIhA==
X-Google-Smtp-Source: ABdhPJwDjcqmdom7+qsIP0nqLgtSyjVSUMcqp+GX89I6U6OOXMv0XPt4upD9a9EJb2Py7a8h45n5mw==
X-Received: by 2002:a63:e515:: with SMTP id r21mr13231678pgh.412.1618860698389; 
 Mon, 19 Apr 2021 12:31:38 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c7:aba4:3594:91a:8889:c77a?
 ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id x2sm12863055pfx.41.2021.04.19.12.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 12:31:38 -0700 (PDT)
Subject: Re: [PATCH v3 09/30] target/mips: Merge do_translate_address into
 cpu_mips_translate_address
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419191823.1555482-1-f4bug@amsat.org>
 <20210419191823.1555482-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a73c5b2c-5211-a388-b791-a91f4522fb47@linaro.org>
Date: Mon, 19 Apr 2021 12:31:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419191823.1555482-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 12:18 PM, Philippe Mathieu-Daudé wrote:
> Currently cpu_mips_translate_address() calls raise_mmu_exception(),
> and do_translate_address() calls cpu_loop_exit_restore().
> 
> This API split is dangerous, we could call cpu_mips_translate_address
> without returning to the main loop.
> 
> As there is only one caller, it is trivial (and safer) to merge
> do_translate_address() back to cpu_mips_translate_address().
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h   |  2 +-
>   target/mips/op_helper.c  | 20 ++------------------
>   target/mips/tlb_helper.c | 11 ++++++-----
>   3 files changed, 9 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

