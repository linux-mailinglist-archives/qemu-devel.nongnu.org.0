Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0536DF0E7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 11:49:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmX5C-00068y-Hf; Wed, 12 Apr 2023 05:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmX5A-00068N-IY
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 05:48:04 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmX58-0001nt-FZ
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 05:48:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id w24so649507wra.10
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681292880; x=1683884880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yfrw79jGmMW2T5MHwxV0Q+298SVlWJpm2gRXeVkgbgs=;
 b=NNHVldTa5uBjGhfd/o8iJ7wy2S0Wn8YcRNFNwRA+7bupmYUXqFXPMdi9J613xWzf6n
 H6Ul63b8r/OiYTUj7IiBbs9y+Ho7wuaOADz7HpRMXQMSiOhBfdQeUpwL3KoVlK4VKEC7
 EdHT345+ecza9gyGxYldVPy69h4L/gZzVeilMUMj5AXH75S01WDdGZARk1EDRT/sw/VL
 A5uLwaOqX2deOaCAJYmu8h3v5eJh9XJVwxM8EebeIZsZlXwQxtAHOxNf6trx1gGdk+k8
 kjx7le69VGFeiCtbtdEGcgzfjvYgWrXKhENz89aiffOQ133J4h/yQrER7v/WnWPeCSjL
 4R2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681292880; x=1683884880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yfrw79jGmMW2T5MHwxV0Q+298SVlWJpm2gRXeVkgbgs=;
 b=gufBwKCl3fYVikKXPBdlHgUxQwHmSoFDa58cEHhETneGeSA88YJ76YMK4Sm+tfbiqc
 tTe94P3kFTKk4m+nmw2HhgNn8GCHgOnkr4rMQ/1dAo6AE5bLS3sdxRJVkTQQVzZdBhEU
 e3vYLYhS8g4rfOpmi4Cp6MhyqNG8Mn++O1C8F9Ja5toVocwEUTDDOpAGzl8nJXhx+2JS
 NZOjFPsdpwuj8YFqAQSYI/jRGotslHXsGCkRduKwx5mlacEgCFniUbW0v881AumbKR8J
 J/MOAtMxHl/M56PB+LT3zYw/CHF3HNq2IxLk7a3k6+F5dXIXx2Zv8SKAgl/0WY7lsPU5
 i1gw==
X-Gm-Message-State: AAQBX9f5stCDccr18nhMk0NthoecMVMWc4VMsfvkEnRn7ZN97K8h6jF2
 riMLvzg4Am+2Ubbpw2mIWGegmA==
X-Google-Smtp-Source: AKy350Y5JHUpuh5/JEBj6dd2NH1eiQ7T0OBYnvw71qPTNgjzFDmsaoUrFgsEnOKv7yC68eB280/28Q==
X-Received: by 2002:a05:6000:1a48:b0:2ef:727c:d357 with SMTP id
 t8-20020a0560001a4800b002ef727cd357mr9548708wry.14.1681292880009; 
 Wed, 12 Apr 2023 02:48:00 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.216.226])
 by smtp.gmail.com with ESMTPSA id
 f1-20020adfe901000000b002f0442a2d3asm8508344wrm.48.2023.04.12.02.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 02:47:59 -0700 (PDT)
Message-ID: <03c52495-d40e-3e67-c564-6f1a5400e5a4@linaro.org>
Date: Wed, 12 Apr 2023 11:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] hw/nvme: fix memory leak in fdp ruhid parsing
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Busch
 <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
References: <20230411190448.64863-1-its@irrelevant.dk>
 <20230411190448.64863-2-its@irrelevant.dk>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411190448.64863-2-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 11/4/23 21:04, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Coverity reports a memory leak of memory when parsing ruhids at
> namespace initialization. Since this is just working memory, not needed
> beyond the scope of the functions, fix this by adding a g_autofree
> annotation.
> 
> Reported-by: Coverity (CID 1507979)
> Fixes: 73064edfb864 ("hw/nvme: flexible data placement emulation")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ns.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


