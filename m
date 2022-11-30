Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5F63D37B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KPs-0003dX-88; Wed, 30 Nov 2022 05:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KP6-0003U7-C2
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:33:24 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KOm-0003C9-AN
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:33:06 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so1051798wmb.2
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MBItDnDBYwieEMCoUclWJhcJ5T4qms5qJ5S0BUrno+4=;
 b=EoFFw3lps9zsAQB16dsTXqq7RR2jXhH7aCmZAaoAjVF8b8NdqWdZ8DnVyAN4ts8Lc5
 8xUpIRI4DRCS/wE5iX+YD1aqzSv5Utm2aGk9E3jql3kz8QApDv7sq2N/7E7niv2IHrko
 wB71qDv2gUIolDxNlJOFHog3/VHQzNoywCejZcFvM3yQ02RWi19n0rYdil0DnnPPQptT
 XKt1a16mA9l5L9zqO5mAgSfTjcPW8v7tR252UxxiXe2y29+rBUKked0plrweYWcNak7e
 0OfBBLfTHPm3xZnwKskC5v0dRLLkDzKnreZ9EygkxtUKp7gSUAcPGApE1o+2VKKdakEa
 Fu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MBItDnDBYwieEMCoUclWJhcJ5T4qms5qJ5S0BUrno+4=;
 b=QtJ35qQRz1/JMIuquhsMN3jcvkuY1aliIhOTTw/pGrPWniOIccydheMRmIXq+1Vcvi
 B74OdJtP4lGYjG3PZTsQ25TuBLj/EX9dHjdQWnmVVzabYvb7YrHwOF0E1KRAY3cIIF8C
 kKGsbdZnH9ecO+dE7VPTUeIhzhQFJxEMRpGT6Ly7OrbrGu3JKrdxoUFhKnddVbn9ZI44
 K3mfQem9+C/1aVCx89xlr587kcHB79mnhdZs46ePjQXIZyF+40GWQ+sKx67QytfY+/Cm
 KIdjkz+Nsn9GK/dCwsUzUEMHwpsaZ06dSOwv7NXSfIC1i3So8bgkpDn29uY2/EWQ6vb/
 AtQw==
X-Gm-Message-State: ANoB5pldk8fFckA/ghxfsoDgz0r+ObmG+nDH3HDM0B1iw9NEgxrCYEEr
 q5eP0qDeWO1X2Vpoz0FWaiA9DDQh3vdF36iA
X-Google-Smtp-Source: AA0mqf7Mm5R328zZO/UlcVVNjWxAbPIfwzROll1CHGPfaQmg55oF+GxIgF6imEkD9z8qkStX9FNFGA==
X-Received: by 2002:a1c:7715:0:b0:3cf:d18d:3bfe with SMTP id
 t21-20020a1c7715000000b003cfd18d3bfemr46939414wmi.203.1669804383013; 
 Wed, 30 Nov 2022 02:33:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b003b47e75b401sm5660232wmq.37.2022.11.30.02.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:33:02 -0800 (PST)
Message-ID: <6069b769-ecce-8f00-2337-e5c997f766c3@linaro.org>
Date: Wed, 30 Nov 2022 11:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 8/9] hw/intc: Convert TYPE_ARM_GICV3_ITS to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_GICV3_ITS device to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


