Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C77D39455E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 17:45:23 +0200 (CEST)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmefp-0000YY-Mh
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 11:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmeej-0007ci-EF
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:44:13 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmeeh-00058m-9J
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:44:12 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so2636050wme.5
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1jdMAP1op1ibXbDBqj4zcPxAY/ZSoy4NG4Q2dQum3l4=;
 b=CtdQMOlha2kattiNhBiwBYQdjwHmKXjW8YSv0+2wpj/cuXg1o7MZftLl5eB5JoxUz1
 Q21oKMja7zrfKH69BLkKAqNHsKW+wZMJSFFhEbZPq74llFKppjULB60DoRrj3UVlkWv2
 ZOt1y31W20lNq1SGEndfMu6FXVC9MrWzc/Li09Ci3UEOOZ4PZ0ZmELF9QGHk1hPNLnQ9
 zp5x6CpYOLc919uOrb6jIfkxFJF6OU/eEzG8JC0arZOziv1ZhoPRSA5d7XMB6UDvOmSX
 XRPXtjsgM32F8wD9iiDBnoDoEzAn5XZcoPnsPO0iIqLY8LtKcQ6OlcfObjjpbEnak0K3
 sVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1jdMAP1op1ibXbDBqj4zcPxAY/ZSoy4NG4Q2dQum3l4=;
 b=gp1MNBbiCnG93Sw1L1hcUm2vMYlMVCqGYKF6/hIwH8iTXDkEwRff7wFmmyFlSTFAws
 JUmTCF8FkHyOmEJbQhZlP2MzgrSVK144XrC7+ZLOA/xUuzYNgWeX/Lxoc7P3GQcbeQRL
 25tabdLtnyCvqzztKq81TRoK8EWFOs9so4O9VCjXm7i6ru/hcXGXdZ1NOdkYjOWwDjs8
 5GiIw1Yg/zuPmIIk4hXeFKQFbScyvJBPvFdcsebH3NnsITR9PTSkP5Z5TGvWW8jC9sC+
 EWkBLsuwj3+OxM0IxZU2nStN3+lvcEXuSfAGt01Xiq02nfELTIUs4LRvHLmcq8Iy/ktD
 9/Zw==
X-Gm-Message-State: AOAM5302pShoTF3cH3Ztm33kKbv77qD6+HIgWQcL8OiC27GIHp38kKrj
 DSf5EggDQDF+ifVU0YSzjI0=
X-Google-Smtp-Source: ABdhPJzNEbDq6W4KaKYoQ3WU2H8g+Fc5r2cDDfxBf18Udcy+9lirljtdzW8RT/w5R6WjjREr2RW7CQ==
X-Received: by 2002:a1c:b783:: with SMTP id h125mr1216783wmf.182.1622216647963; 
 Fri, 28 May 2021 08:44:07 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id s1sm15525807wmj.8.2021.05.28.08.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 08:44:07 -0700 (PDT)
Subject: Re: [PULL 07/31] accel/tcg: Reduce 'exec/tb-context.h' inclusion
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210526234710.125396-1-richard.henderson@linaro.org>
 <20210526234710.125396-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <68e915dd-f4dc-a21f-2bbb-e95dd917b98f@amsat.org>
Date: Fri, 28 May 2021 17:44:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526234710.125396-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 1:46 AM, Richard Henderson wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Only 2 headers require "exec/tb-context.h". Instead of having
> all files including "exec/exec-all.h" also including it, directly
> include it where it is required:
> - accel/tcg/cpu-exec.c
> - accel/tcg/translate-all.c
> 
> For plugins/plugin.h, we were implicitly relying on
>   exec/exec-all.h -> exec/tb-context.h -> qemu/qht.h
> which is now included directly.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210524170453.3791436-2-f4bug@amsat.org>
> [rth: Fix plugins/plugin.h compilation]

Ah, I see you squashed:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg810344.html
I was hoping it goes via Alex's testing-next tree or trivial first,
so this wouldn't be a problem when you apply this patch.
Thanks anyway :)
Phil.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h   | 1 -
>  include/tcg/tcg.h         | 1 -
>  plugins/plugin.h          | 1 +
>  accel/tcg/cpu-exec.c      | 1 +
>  accel/tcg/translate-all.c | 1 +
>  5 files changed, 3 insertions(+), 2 deletions(-)

> diff --git a/plugins/plugin.h b/plugins/plugin.h
> index 1aa29dcadd..55017e3581 100644
> --- a/plugins/plugin.h
> +++ b/plugins/plugin.h
> @@ -13,6 +13,7 @@
>  #define _PLUGIN_INTERNAL_H_
>  
>  #include <gmodule.h>
> +#include "qemu/qht.h"
>  
>  #define QEMU_PLUGIN_MIN_VERSION 0

