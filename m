Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF6268A3C9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 21:48:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO2yS-0000iN-CV; Fri, 03 Feb 2023 15:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO2yL-0000hd-K7
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 15:47:53 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO2yK-0007aA-5y
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 15:47:49 -0500
Received: by mail-ej1-x62c.google.com with SMTP id m2so18649813ejb.8
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 12:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ydvcVXnkeVZEZbVAHL26kTHEEt7XjNe4pcearoNg0U=;
 b=CFdM5Qtk2XkUQrWZV8DjJtoOX5UrPazPWQclD1BYhEW3fPhlsWTX//Dk7WkTVYurp/
 qCsZuVbLH1fbAKcvbteravy2nni8oiFKkEk9m4lOKfzcdkZ5p3lUAJe7w7d5le7AvhAL
 6J1M44UgomOEAg3ybrvr3oQ4CQtGSyve0f+aLi5R+DZzzYl9VGxsSpyen6B/SMeh29ew
 FH1erC2eAUvh/rx5EbF0lhV3elFb1vRnAQwpqaQ0Etl0P6jUcAFrD0rRN8XdUGH9Uc8u
 mx20gJdrREg7HlCB3wGWcQD42C/YMzbgZc/W+z89hhf5I+3U1VVKC9Mgb4hCTBPA6yln
 Wk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ydvcVXnkeVZEZbVAHL26kTHEEt7XjNe4pcearoNg0U=;
 b=wKJEDcwMZf4eP4cMgVQEQJyzJJxpNTzIhWGZOgIpBUYCtmW+kLbZwOcpOYzK2Vy3qj
 J23KPJ4rhHmySVoIITfItKTdovIIMXTPhDKgssm0YapgqBXgiwTi6dMknGYe+J2RTECd
 oQp940WgnW1qMxh585fuoIrM5LjE9lf36xG8VJYPaxWXgaewFlFg+15UJomkprtWfHGW
 aFmZhsbnjuAzJCKjGMuGtkBOdnqCuMk75FrMETlMzzjgwOcJDC2zVOCWr1F7ZYyOoB1c
 D8cVBUBxQyxH8F3YVdREmcycVfK7JuEuiHGHFWfNzjrVoqWgvA509fjm58ZRM9SYZxZG
 RoCQ==
X-Gm-Message-State: AO0yUKWEdZnfd1cYUle9IzKxBgAtJubJ9X/hbaDhzAJhKnn58A342j0O
 YCUD3kDiVXh1UFX5aA8pAD/jmg==
X-Google-Smtp-Source: AK7set/ckDdZP+d89Vvk/KLhxv3WrxkEF5tYEjDCdIh9vdk4/3SVOZVInMqGpkJ3w/Eskj3yUQwsbg==
X-Received: by 2002:a17:907:7672:b0:88d:f759:15b0 with SMTP id
 kk18-20020a170907767200b0088df75915b0mr11882742ejc.45.1675457265920; 
 Fri, 03 Feb 2023 12:47:45 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a17090676d600b0088a161c232esm1846721ejn.172.2023.02.03.12.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 12:47:45 -0800 (PST)
Message-ID: <283172a3-41a5-17e0-7d02-3194321025cc@linaro.org>
Date: Fri, 3 Feb 2023 21:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/ppc/pegasos2: Fix a typo in a comment
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230203194312.33834745712@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203194312.33834745712@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/2/23 20:43, BALATON Zoltan wrote:
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/pegasos2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


