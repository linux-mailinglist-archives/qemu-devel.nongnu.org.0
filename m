Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5435690C43
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:56:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ8Kr-000714-No; Thu, 09 Feb 2023 09:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ8Ko-00070M-LS
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:55:38 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ8Kj-0002tB-3O
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:55:34 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m14so2007222wrg.13
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 06:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=coDwj6ZOpBZEhCOwnd4teFTDz9H1p5c3IkknQvQUlAs=;
 b=tAFqsTyKaSF+w42/CQ/CHEIyJn2N/Z0rbLmaXBhigI87Gf6Y+TqREP9zVCSBsCqvcz
 wgIBymqHDxBD0q7OQVpdWUrM691PK+zgo+nzO7NYBD091IaHlgkNtgs8PVKms9OpmjEM
 G3WDCFNpZD9ezpKhdt7U8gwyQMrlo/6acc2DHV/Kx5t76UrP/g9w7ikC10p6zLwX5m1c
 GATgJJrHMgSu/SVWW7IUAsepCyKXcs+0TsLUx2c4/tqO3Mg0Jbmedw5Qwl9K1sVZpysz
 JJAZXcjjnPl75IO9yTpvSP2SOGrf3Uq3KzcE3KKQhlg6L15uHhJ9Ta2spO68IrT95NTF
 Z1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=coDwj6ZOpBZEhCOwnd4teFTDz9H1p5c3IkknQvQUlAs=;
 b=nC6zbrfSbn/0TNnyPLf0HXLl2nYgx9JOKIzYjeu08Zg0iVyOAug54tKOvH3aMfs4rU
 CM9isYnNIBQ5jS1MkWWWZpfzn4FNwnCUumJu7ckQEnzzq7AbxRI3O8Xe8uw/nWzEhu7b
 ZWgjzPBrjJMWVXF3VDbFDlpGBZL0riDWXn7HxI9IOLPOe6yHY3yYolahGER3G+2qO/oB
 ogZLXupBIEOXIk1ZSeHEqdqCdZpJkN7HZ7eSICeLJCVEp4hrcj5FXGWMEVD30lQFDqxQ
 tSpIZrn3x8BFZRbc1ccoyEc3eZW/M37OChV/4EvDwvea2WGUP/4DBxhPA++7tzOWZPvI
 iSrw==
X-Gm-Message-State: AO0yUKWR1CCaicAstwXzL8vvFLOKbV8CTenSiE8im59+uUhMrI6Bc87z
 woYrXdc/LrH1AGaDBZLHcE1Tnw==
X-Google-Smtp-Source: AK7set8QemOAxhDLACoP3BwJicVaZqtl96Pr19CxPjZm5z7OdCWKoYU+KOGAtwWXibE2TBlY81SCYw==
X-Received: by 2002:a5d:61cb:0:b0:2bc:67d:c018 with SMTP id
 q11-20020a5d61cb000000b002bc067dc018mr10750827wrv.48.1675954531239; 
 Thu, 09 Feb 2023 06:55:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d16-20020a5d5390000000b002c4008f0daasm1341845wrv.107.2023.02.09.06.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 06:55:30 -0800 (PST)
Message-ID: <11ede763-00d4-5498-53ae-492a7d4482b0@linaro.org>
Date: Thu, 9 Feb 2023 15:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] tests/qtest/npcm7xx_pwm-test: Be less verbose unless V=2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Havard Skinnemoen
 <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
References: <20230209135047.1753081-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230209135047.1753081-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 9/2/23 14:50, Peter Maydell wrote:
> The npcm7xx_pwm-test produces a lot of output at V=1, which
> means that on our CI tests the log files exceed the gitlab
> 500KB limit. Suppress the messages about exactly what is
> being tested unless at V=2 and above.
> 
> This follows the pattern we use with qom-test.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> An example job log that got truncated because of this is:
> https://gitlab.com/qemu-project/qemu/-/jobs/3742560168
> 
>   tests/qtest/npcm7xx_pwm-test.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


