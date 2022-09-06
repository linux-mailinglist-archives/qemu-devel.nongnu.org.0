Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77255AED86
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:46:34 +0200 (CEST)
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZqT-0004Ct-Os
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZXG-0000Pw-Py; Tue, 06 Sep 2022 10:26:42 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZXF-0002nI-7b; Tue, 06 Sep 2022 10:26:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id o4so11457232pjp.4;
 Tue, 06 Sep 2022 07:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=H7fW6OXfekSw2RyBgFwVDvJyZVhaVRyu9cdTGn7FF5k=;
 b=b8+4MESSQwWL7Ydf33KTDpY6p134zXIBz0Isk0n6Cxp0ViVeebb5TzvSiR5s97dhkd
 COzQLH3giGZRpnBoy6lr5749MylxCIfy1unQc3HHrilBxOKaGEyzIP+j1272kevb7zB4
 xI6euY8Xs06sLHwF502Q/KZUikIM2/moTmEupKgMheIaiClcROEz/81Uy5zmIwH6dVSc
 vc074qTIOZzROQJvwRI/+UAwx3HZ8E3P7nRL1yGEFjuluysq21hYZMl3C6EDR6rljzE6
 3heoTmW158N+WbfrVLAIOhPDoXbqEcZ66wR8WZcMwJvmL8swWpLRt9+ch96kwH1d79Os
 BaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=H7fW6OXfekSw2RyBgFwVDvJyZVhaVRyu9cdTGn7FF5k=;
 b=GBEEhaz6oraRu8W7JCY3G4tn4i6MZ4UJjIj5vFJH2nAPemrSed19kb7DSpT2/AjK9E
 C+gy65wOPhYmIB686n83tL70EgNGeQMLPZILZh8/HZiXbQZ8jQnNa2kmEgN77IVm02BQ
 Z1wMEwmWWOEdIeTlExfS+7yLMV4V0Dhb9+mANi5I30l8qKqqIbLw7vlkrZTTt6UlnVs3
 F4AsKgnScnrhGfIrH21rZ2slKBvUQCoSaFteNuP2/zJRYfLIQRiUU6OV2LUCUA+jzRj1
 C/OqX+QNP/grSLCTH+loPcD8jPoutqFh7vtnmi2gudIzTL/rbVpl6fNiLo6KBZHABbSu
 xcaw==
X-Gm-Message-State: ACgBeo1cxV89DQ7uDt0xrM6DnwWjKnGvTHvjIaGw4ZQymLcS8gVW3R0K
 0v81cmxzDV6wf03kgBTuirS60JQOp5Y=
X-Google-Smtp-Source: AA6agR7mCVnEEtYjBRFPdrIR+CIrBvhtIPEexJeSZTwStS4p1I1MClKcGV1mLytJ8F2KZiEWGHtTvg==
X-Received: by 2002:a17:903:2442:b0:176:c8ee:a5d6 with SMTP id
 l2-20020a170903244200b00176c8eea5d6mr5108367pls.20.1662474399567; 
 Tue, 06 Sep 2022 07:26:39 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a654482000000b00432fe163a68sm7477593pgq.80.2022.09.06.07.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:26:39 -0700 (PDT)
Message-ID: <aaa3e245-4800-c68e-364d-b73f3dbe641a@amsat.org>
Date: Tue, 6 Sep 2022 16:26:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 01/26] target/s390x: Use tcg_constant_* in local
 contexts
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20220906101747.344559-1-richard.henderson@linaro.org>
 <20220906101747.344559-2-richard.henderson@linaro.org>
In-Reply-To: <20220906101747.344559-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/9/22 12:17, Richard Henderson wrote:
> Replace tcg_const_* with tcg_constant_* in contexts
> where the free to remove is nearby.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 408 +++++++++++++----------------------
>   1 file changed, 145 insertions(+), 263 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

