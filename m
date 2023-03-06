Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA6C6AB9D7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 10:28:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ78j-0002Eo-2F; Mon, 06 Mar 2023 04:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ78g-0002EI-DA
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:28:14 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ78e-0008VY-E2
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:28:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bx12so8026320wrb.11
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 01:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678094890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5s0F1cdvps8I8nSuwMb6XvtNrdfzPS2PRwuoK7+makQ=;
 b=RugbGA0rnsoWCWtCyBCvIhFRadcTe87wqtgHPd8+BMvWQkORXv12x+HD85d+z/lDdu
 xUufpygyQBKg1Im6/xJG9xoff8sCzZJNj608p1H9WjQCmrFYg2Sq+IhuZrey5MWNPBbO
 dIbjLEsoJXLijqGFZPYoHBIwRWbz5+KPbJvfn3fS0++2A/OP5xztWYTtlzFZlZ6k7ha9
 btIqq7ljtvSN7fsUksGnyPUG7CkItykIsyGZmWl1/1CgcQuyOFoKpcfLnyrzS9zA1/09
 kuavgCO9V4R6JZP1Tvn8aBO/D+e2uItc8sM8g6gfNQsmvqyCgtQBCqIu9uwEGlf1fmXh
 czBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678094890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5s0F1cdvps8I8nSuwMb6XvtNrdfzPS2PRwuoK7+makQ=;
 b=ZWC3OQoYxpCJmU71Kpu4RV0qjrd35yzbDVZlW0HntpVMJ7lGUDbT8QkWMiveWWO/VI
 Ai2kMME6gfdUsYYExCoOQDoSd9EBUMzRvcEjeW5dnukjH5XJvb0xqBmAksfWbAAvcrAR
 JCZJ+MXFSilulORkaXDwcPDRB6+yDHx/Ml6hwHIAjWS3NwbJ95UdLWAy4QxHOfRYpURg
 FGzh0SBxizdvIOUs5ckac9Q7ReWSmqWf72y9q7XFPB0EP6BqivtFFUgpHIzifgpnLNbJ
 n6HvsmnjaPjvnOjOy0Ze6jAvLuPSNujQeKSVI09ZJK5osKXdHYU4DansjDr5XYhtnwhH
 SjxQ==
X-Gm-Message-State: AO0yUKXsixwYw8Zpv7DTA3u4H0AyTXTz8hFmcriYBKK5WvKTuaLklgp9
 UmrKKQvEyMYnL45mNjxlS+IlHg==
X-Google-Smtp-Source: AK7set9aB3sq5IESpBhTkSjVY4Fi24IFnrnHKB5m7vxe4nkkJ+wSwxYlxZvwvxBOFm0WzxF7SYqFtQ==
X-Received: by 2002:adf:f44a:0:b0:2c9:ee50:b295 with SMTP id
 f10-20020adff44a000000b002c9ee50b295mr6428123wrp.28.1678094890587; 
 Mon, 06 Mar 2023 01:28:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o16-20020a056000011000b002c703d59fa7sm9300826wrx.12.2023.03.06.01.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 01:28:10 -0800 (PST)
Message-ID: <9749067b-4a66-8177-23f9-69ca0b5af253@linaro.org>
Date: Mon, 6 Mar 2023 10:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 13/16] fsdev: Disable proxy fs driver on Windows
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <20230220100815.1624266-14-bin.meng@windriver.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220100815.1624266-14-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 20/2/23 11:08, Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> We don't plan to support 'proxy' file system driver for 9pfs on
> Windows. Disable it for Windows build.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   fsdev/qemu-fsdev.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fsdev/qemu-fsdev.c b/fsdev/qemu-fsdev.c
> index 3da64e9f72..58e0710fbb 100644
> --- a/fsdev/qemu-fsdev.c
> +++ b/fsdev/qemu-fsdev.c
> @@ -89,6 +89,7 @@ static FsDriverTable FsDrivers[] = {
>               NULL
>           },
>       },
> +#ifndef CONFIG_WIN32
>       {
>           .name = "proxy",
>           .ops = &proxy_ops,
> @@ -100,6 +101,7 @@ static FsDriverTable FsDrivers[] = {
>               NULL
>           },
>       },
> +#endif
>   };

Probably the meson changes moving '9p-proxy.c' in hw/9pfs/meson.build
(patch 16) belong here.

