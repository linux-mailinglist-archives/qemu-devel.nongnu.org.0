Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761696A0D38
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:42:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDja-0003qt-6k; Thu, 23 Feb 2023 10:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDjV-0003qd-Jw
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:42:09 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDjU-0007WG-3X
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:42:09 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so6666549wmq.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CxhY/v0bgi58Sf4m+IhLKlyGCbxGgHzmKFFFGOEhk/A=;
 b=cXLDNK8bfbJaMgQpCbv8JhGB2SfKhFqCKdETawrMRZl04Tt+5zOAiQlTu7O/1zGDxO
 k6Tiriqv1l2/JJI4ZJq6/te75bCfGMPN+1Hm8VhoY63HZUzQWIhYkCkgQsrokHrknuX/
 3gJgzXzkJoict5szkVpkx7Rbl+5R2z1T6OJHitaXxowFAfJ3Sm9g8wlDtfZhxOSyqVPH
 WwEx+FqhgPu12Rzv9ssb7UlMhUZQzSWE5SNHG1KV11g7RTUKVaozYIenrvlaraSIeTBL
 rVxA3Yppnl1cRnL32PaBzkT62t5bxVQwStuNbh4F0UqpitK4+1Y4M1YjKPty/h3SeZJD
 COGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CxhY/v0bgi58Sf4m+IhLKlyGCbxGgHzmKFFFGOEhk/A=;
 b=pTOWdjC2Gd8n3nva9RYEWgOpy+nND/OiW6xDpbLEhVzVU4g6/vjfuFpQzrzFsRTI1n
 izhWoU040gN9SQ02z3kJl/FfDx3ii3fZsAtc6q+X/xVyxSj4DbqNlVOg2kQeD6rEOsL7
 X2pAOIKR8q/nBw1C9N0cav3RuWcQ1wDXwvEhW+OhmeO+UItgp64jpcHyl9NO7wWimYz5
 vE5vB5H6PCoYdn+AhWBHUiP8ffDq3q4SKyQVku7y2sd2OE137PRQO5zuxF1EydX3fBO8
 9Z5ndNdBGLBYjLXks+1NNrBk5f1AayA42Is0AJ8ZR6x4i73vl0J2kVn14Ew88PqFQvxJ
 3K/g==
X-Gm-Message-State: AO0yUKUKiCmDRM+9cKm5EBjosK7awdJkT7Fx429Cns8yGADzv8ll0SfA
 NStF4Px1QFu2j9wejABMzsSczQ==
X-Google-Smtp-Source: AK7set/KQ05T0tnGMVsQHBOLX0wR9H0KdRQFQUQnRY6QBLotDRjoYxR2sN5NrbojE1UCWT5IG34qBw==
X-Received: by 2002:a05:600c:1817:b0:3df:ef18:b0a1 with SMTP id
 n23-20020a05600c181700b003dfef18b0a1mr8772630wmp.12.1677166926321; 
 Thu, 23 Feb 2023 07:42:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003e01493b136sm11769079wml.43.2023.02.23.07.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:42:05 -0800 (PST)
Message-ID: <41bc8049-8bf5-e44f-2e9d-7621f74311a5@linaro.org>
Date: Thu, 23 Feb 2023 16:42:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] tcg: Allow displaying TCG_TYPE_I128 arguments
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230222212810.53857-1-philmd@linaro.org>
 <84b33d0f-ac04-ebbc-6ca1-d8c249044e5f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <84b33d0f-ac04-ebbc-6ca1-d8c249044e5f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 22/2/23 23:36, Richard Henderson wrote:
> On 2/22/23 11:28, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tcg/tcg.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>> index a4a3da6804..3df2c6a6af 100644
>> --- a/tcg/tcg.c
>> +++ b/tcg/tcg.c
>> @@ -1955,6 +1955,7 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, 
>> char *buf, int buf_size,
>>               break;
>>   #if TCG_TARGET_REG_BITS > 32
>>           case TCG_TYPE_I64:
>> +        case TCG_TYPE_I128:
>>               snprintf(buf, buf_size, "$0x%" PRIx64, ts->val);
> 
> This would be for a 128-bit constant, which we don't have.
> Is this a guess, or hitting the assert, or what?

Doh, right... Guessing while reviewing abort() / assert(0) /
g_assert_not_reached() calls :)

