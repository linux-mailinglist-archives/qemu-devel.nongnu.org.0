Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9293963D378
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:32:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KOA-0002tX-Uv; Wed, 30 Nov 2022 05:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KO7-0002sj-5u
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:32:24 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KO5-00038C-NR
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:32:22 -0500
Received: by mail-wr1-x429.google.com with SMTP id bx10so14280414wrb.0
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jfN+Sxj3gTxP38XwIEpHOXHDt+rxrZq4g2VlxOqtmss=;
 b=e7bM7NyaP7I4se6SH2NIWb30aepza2abHxR9wetKTE3132BG2eKSOdvO7SodiAoMCU
 aZRml6YGStUPA/7VaFBxuiowOfVEJ4Yof8N3Sij+xgC2dny0x6h6IY5QpoHZ1O9rsftx
 dIUg+cWPpPJIZ1gLV8yDEU31rf3BBNwlUxZJ2UU7/nKEEd1cnAkf4xibizEtlmrD6Rn4
 7YPmNQGXlrQmFwuBIfqSCpayfZB9b2HSBTYIAe64+CXgNyEdMKARb21yPqURUjAxxEVt
 BLtOkNoA3jORjkzNVdX3yiXO1iRn5mT69+f3vpuak9S3+pmLCxsOJVBGxs0X+plN2UDu
 X6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jfN+Sxj3gTxP38XwIEpHOXHDt+rxrZq4g2VlxOqtmss=;
 b=Qcu9sd1z1gkBrlC0gokfz8QSkb6k87ks+xybm22rH3eprVECQvsY1xLmjZc7LdRJ18
 fzY3KazWFyEX5vIBqbX/W2Ms12vLWWFb3GBO13ZL8geIp89UI67snQWdlrwy8gG67wjK
 /n0g8nnh2Yr6GN79GEEHkJwqIGf46rIIRzHOHtGixWX8wtDFsc2nxdqH7h8Vy88/Zwj3
 6d+HVzGUpxfPa2Dnc6AkVIUA2uZlH18NmDYmGaIxhUuiE1oAy4ROVirZUuRVEjgO4puN
 evbS3OeMlFgPqC72WsKs3+Z7h2x0FPTP7MM4NO1u5iLjaBHfOqWbBqNLkZoyNrriWraF
 VynQ==
X-Gm-Message-State: ANoB5plmal+sJWI8VZviF8kojuIYYLqJwr+rB2r7iqIZ9GZgtPOQNBJb
 gefsmOVhP+D1UZTHxCYWbM/tmiY9jfHspZ0T
X-Google-Smtp-Source: AA0mqf7J2bQnSXKO1XP2Yi75HmHnT1QFINGfDGSGw81B4jehOoMjwSKyzNXcKb0emFgnhkCN/PyZjA==
X-Received: by 2002:a5d:5387:0:b0:236:86f2:b444 with SMTP id
 d7-20020a5d5387000000b0023686f2b444mr37578292wrv.58.1669804339411; 
 Wed, 30 Nov 2022 02:32:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c305300b003cf6a55d8e8sm1418778wmh.7.2022.11.30.02.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:32:19 -0800 (PST)
Message-ID: <3ec4dec0-1faf-15fa-27d3-a0e6d8f9305d@linaro.org>
Date: Wed, 30 Nov 2022 11:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 6/9] hw/intc: Convert TYPE_KVM_ARM_GICV3 to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_KVM_ARM_GICV3 device to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_kvm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


