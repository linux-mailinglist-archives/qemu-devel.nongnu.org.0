Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3ED638B2B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:29:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYl0-0003iE-MG; Fri, 25 Nov 2022 08:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyYks-0003hl-W9
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:28:36 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyYkq-0002Vk-OL
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:28:34 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so6210498wmb.2
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 05:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6aeSmHdufI2rHnwdyjocMLRkBSwcMj5JjPnTrEnc9zU=;
 b=XKKNCmdSwPaN7mws/831TWUCsmr9K93IfHTpZHve332APIxWuRnbezpklATLcs/3Ff
 ppVuYrunEnIVvBkn/hBZYXaCBZovwUANRXs5IIDybzeQY3kqLLSlTSjvXAk0sXb8pGhZ
 Q0kAe40jgiCcsd/muD1/OByafm3snxRoIiKO/GaFiiwtLmgiVouXYpbPWO/R+JGUoHYB
 nRCE/xGB02lzTt3GAmALW8z1teV16cM9eFwKXduTcayFgvFvGLZ6W784lNvvD3BxSBJB
 PRPkbvMhM6BLlgTSrhdb1Kaq825BaajKFAjo/N8YJf9rJyhOPyo8X1KKI8TPlJdU8n56
 WNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6aeSmHdufI2rHnwdyjocMLRkBSwcMj5JjPnTrEnc9zU=;
 b=8HWTbCi2NKmNvHxw6VgXzuVgTb5yL4j9hmAHupgv08II0zptIqcH2Aq53d7gUTDWS0
 9F2r1MKSz1n/xYxwn/GcADuH0WBLXL8mQjQL6B9jzjJhuslbnxEbzdHzmj3ZVfu7M3Jz
 3+HLF6hLeQS9zpMNkfA8OSndxC9pL3eY769vQyrnVvvR43A0cYFQGZseWP82VE6b9bQy
 O6Pel0r/6iiwi9kT+mWzGFHQkz2u4yOSsQoYybbBtMbxu4OmWOOgm0euWgW+AwIVqIt2
 NaLJA9nh3IBkmo77XIZ+KdHezedOuA17I1z24jEvyLMrKLJv+dnFUZc0B4uKBkdD/KvD
 gjUQ==
X-Gm-Message-State: ANoB5pnHSrcjwToxgnSIoiVpHYIvBhYKo+R1eyiOoGmWWXPL6tQSpY4F
 LL/+cwb8mO5gsTggViQy9kPbZQ==
X-Google-Smtp-Source: AA0mqf6R6w4sO+DPQX/eOzqtfdnGwr2C1R0/Dwa1+N6IVz6jah8sK0h2NeDIQyivWaPFMsa2Tx8abw==
X-Received: by 2002:a05:600c:1604:b0:3cf:7fb1:e217 with SMTP id
 m4-20020a05600c160400b003cf7fb1e217mr27925085wmn.92.1669382910115; 
 Fri, 25 Nov 2022 05:28:30 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003cfd4cf0761sm10214655wmq.1.2022.11.25.05.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 05:28:29 -0800 (PST)
Message-ID: <6b4ed1c6-b218-042c-e83a-1bb249da1fa7@linaro.org>
Date: Fri, 25 Nov 2022 14:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 1/3] hw/intc: Add missing include for goldfish_pic.h
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20221124212916.723490-1-jiaxun.yang@flygoat.com>
 <20221124212916.723490-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221124212916.723490-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 24/11/22 22:29, Jiaxun Yang wrote:
> hw/sysbus.h is missed in goldfish_pic.h.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   include/hw/intc/goldfish_pic.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/hw/intc/goldfish_pic.h b/include/hw/intc/goldfish_pic.h
> index e9d552f796..3e79580367 100644
> --- a/include/hw/intc/goldfish_pic.h
> +++ b/include/hw/intc/goldfish_pic.h
> @@ -10,6 +10,8 @@
>   #ifndef HW_INTC_GOLDFISH_PIC_H
>   #define HW_INTC_GOLDFISH_PIC_H

Also:

    #include "qom/object.h"
    #include "exec/memory.h"

> +#include "hw/sysbus.h"
> +
>   #define TYPE_GOLDFISH_PIC "goldfish_pic"
>   OBJECT_DECLARE_SIMPLE_TYPE(GoldfishPICState, GOLDFISH_PIC)
>   


