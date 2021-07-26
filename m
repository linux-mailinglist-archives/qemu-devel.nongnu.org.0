Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D63D658B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 19:17:31 +0200 (CEST)
Received: from localhost ([::1]:55158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m84EM-0001TW-JT
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 13:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m84Cy-000056-GH
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 13:16:04 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m84Cw-00087P-Ut
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 13:16:04 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso12286895pjq.2
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 10:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TIwcmFJ8ftLQSfMD7wCrH93sIomORdxm1KxXckz3UGg=;
 b=HYlmDuUxZRkA1e6CmjvE8O4ybV5HvRixIiLUp1v800hl/rUyqg/v5Z6bfujSxdTr4l
 ax6CrcJ+77/9nMOzXiEc2XfKadm+TO2no5+8woi6u7yMcrMA6ssnWetku+GibiY6/EAW
 Vgjbvz5iL4+WgvxFkKIK0JsUE0GSH6mWGtrsuTc2gwsgbIXwowwDenehhlmdPj0G7Ass
 62XVI2ySQaq324Pbcn2Y8qNnvDDZhXNoKhdKDl3PI4yOUv8RTiHFEIa67QUOC1HH4KeP
 6hXvvmFxiFpDAaLf0w5n5H13IuDiT21BjAbZsqOr4c+tEyqR/bFQqnov7dCtmSp27nnt
 pDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TIwcmFJ8ftLQSfMD7wCrH93sIomORdxm1KxXckz3UGg=;
 b=D6bkPuqL8+lWBkQchcIgWT1udfQEOjLlcB0/IOvpKEAasIjBSve6/0dmbEp2oHbbd2
 TmoLW17cjlCCBIJrlgIcUykmzPY/010llHx7o35DWbzwbIHi7qGx+Sjoggj2uh+42jYm
 h+DeDnjbnfeUi+UjWT6aCTe/pn7BqsCpdjQPr+2gqA2WMruxglnOG4JHUc+O1vNE8OhM
 4boPS5Ns9M97gxzfrIMzctcWm/75beU3XSJKQeAsT3S04gWd85XD84Sv5xaLYSWKl5ed
 ymXpXYw22Bs/D6oKMaGSuCnipMp8xrv09TJq8tZW9fwTiEDH6GvbxYRsYihP950zERzN
 HoTQ==
X-Gm-Message-State: AOAM532gIeTR6+SB8nKu62k7uWyeGb8KE6xOFFs3xJ/MM1PL+5mHahni
 /pTHh8GD3mesyYHzS0majMSbEg==
X-Google-Smtp-Source: ABdhPJw5X98SjZvuMRODEEX1RvQvHJnKU1mcApvpsFj7jpZM2kR8OKHUT+Wr43oXEZ2s8uWgsGFmyA==
X-Received: by 2002:a17:90a:fef:: with SMTP id 102mr46905pjz.148.1627319761363; 
 Mon, 26 Jul 2021 10:16:01 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id i14sm268451pgh.79.2021.07.26.10.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 10:16:01 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/nseries: Display hexadecimal value with '0x' prefix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210726150953.1218690-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96e9e3a8-e643-deb2-f3ed-9cea98bccc11@linaro.org>
Date: Mon, 26 Jul 2021 07:15:58 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726150953.1218690-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 5:09 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/nseries.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

