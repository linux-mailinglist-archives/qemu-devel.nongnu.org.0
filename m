Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12DE698EA5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 09:26:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZZm-0006Yg-SI; Thu, 16 Feb 2023 03:25:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZZk-0006YJ-DU
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:25:08 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZZi-00024Q-8F
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 03:25:07 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m14so988218wrg.13
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 00:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e+01m903JqpZMXJPyaUtc3JX2FbGAX3wErHabitUQEQ=;
 b=BgC54FXoNOhf1uOcPCygQjuDFpdXEPSzJsn2uJTpjk3tRaOaO0869XeypjPOHDPI/C
 yQ1LMv+Cw7RU1dVWgHGQ2nB7tr1ot9wf98D/zEe5MKZUqYYd1rkK+yaLpRICgpSh9FxC
 S4JGQy6d4P1Gn6pEGHWX60ZGIiY3nBK+spbQAJ5duLM4iJG3+JxrQ9I20chXLB0NjblO
 di7aWSmknjJrCqS36OmNSrSl0jamfvYJFwv+mTpm0Wh9wQFcd0VmZxEb2iBDjtthcKdj
 mpYSqZWvUv1OG/WK36mwhZtgO1jX1SZuqrLyk5ALhrSVlj0m+ruG60ja1Zh7MvrPbqKZ
 hl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e+01m903JqpZMXJPyaUtc3JX2FbGAX3wErHabitUQEQ=;
 b=Zl+6HnHRUJ+yfjdbn6TMCnvK/8+/83QsGOOcUupQoWPM45Hq/56UaQDtgpvYP0Q05J
 MkhQKmjWX+5gpmlsohVX0v2J/EvvGrD8BcGe/VViO4CoqcELd6/12o4tFy+2fL1tCMcD
 V/9pHf4hm0hdl4Ge25LoXCEdjk++GJsF0ZfM1F2q6t7Fvfe3CD3Bq2VU3a8ibvTpvf7Q
 Me9Qv9OWB7DgPsDpGwb7scmWWVbSg7GnxKr05ag/tUu0lZL49rQ3Sl9d9jmIYYzQM/P5
 1t3gG+4KjfRU/tQRH/TDtKPmLCoiYRqsfmb4MSgYhrxXvG09J4l95xxvaI+bTJVAdFxl
 zqxA==
X-Gm-Message-State: AO0yUKXjyu7Bkr6wus7cDKwgAY3rkzSo14P426zYaOyt3jl3hdqKjMh2
 asMgK42ZtA+a7blzhWInyxhChQ==
X-Google-Smtp-Source: AK7set/RikBX4Vyjb25qO7uqgGA1xedqPDZf2TYVQkQGHRtWacGZ30FoimnmLTUxEijumtHIZkFTpQ==
X-Received: by 2002:a05:6000:120e:b0:2c5:63df:1171 with SMTP id
 e14-20020a056000120e00b002c563df1171mr4644914wrx.19.1676535904297; 
 Thu, 16 Feb 2023 00:25:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f18-20020adff592000000b002c592535838sm273550wro.2.2023.02.16.00.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 00:25:03 -0800 (PST)
Message-ID: <0f69bfe5-3c49-c072-833c-24e19b91ad1b@linaro.org>
Date: Thu, 16 Feb 2023 09:25:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH qemu 1/2] hw/at24c : modify at24c to support 1 byte
 address mode
Content-Language: en-US
To: ~ssinprem <ssinprem@celestica.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, srikanth@celestica.com, kgengan@celestica.com
References: <167636845806.2107.2382940753543768501-1@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <167636845806.2107.2382940753543768501-1@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 10/2/23 07:20, ~ssinprem wrote:
> From: Sittisak Sinprem <ssinprem@celestca.com>
> 
> ---
>   hw/nvram/eeprom_at24c.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 2d4d8b952f..693212b661 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -87,7 +87,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
>       EEPROMState *ee = AT24C_EE(s);
>       uint8_t ret;
>   
> -    if (ee->haveaddr == 1) {
> +    if (ee->rsize > 256 && ee->haveaddr == 1) {
>           return 0xff;
>       }

What represents this '256' magic value? Please add a definition.

