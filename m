Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E16652D34
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:18:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tLE-0006hp-Ex; Wed, 21 Dec 2022 02:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tKu-0006Xq-05
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:16:20 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tKr-0008NF-VT
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:16:19 -0500
Received: by mail-wr1-x429.google.com with SMTP id bx10so14058527wrb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 23:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dD9OcS9dhPhnWdTVhyUVnRBRQyOg/tkXlZTQonGB08A=;
 b=rBaaP/YChnNAhAmuWhUCiJDSEjQY+XhsMUchtM7A689/bP0er96IDXx8SZrkGs1Xsk
 M/7A1OG/Rx48piI8rx4lT55X1OWHO/9z5phXcO2fteT7LA+rjqnDdDYjkgg1lsEpQpx1
 T23jPUpHk/0Wj+b2/hN6/X/XL8swbtRY4Jc81wBkE7yQAzdBczhD2gb94Ed1XvmbCZX5
 +v5VTaEEd32yTQrG6I6WadF7ReDpj3t9b8wd/qWx8GCux5H4nytWjGHU2mJngfrc9GXw
 zapAo3FwTs4MxnQQ9fzo9XTQCGfOsUv6ap802YM8yRz8YLXTsw5wG4AO39ZyMBwcTKkO
 P/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dD9OcS9dhPhnWdTVhyUVnRBRQyOg/tkXlZTQonGB08A=;
 b=vnh3a4qycCY5fTr62PSPOdOE4KtSkyRj9eafpS/D4clOuEe6MqU6ecCAH3hwKLSBS3
 UqrudTR0a+QVHztJ2V2/SAtYJv5iKEpDtJp6wMwHd8F5cT36RD3n9tngC1qp26DMCBHs
 deU2dmy54R1cOkhwQoRyPewJvwQItedub1MLP0t3nZKzwj5pn7CHY2aM73km1LFjcDRD
 PbICjf30hDHMavcuZrfdbsSIvWTfRxO5tXMQPHkWWaI9VEEtgJ8bqYQ89VxS0g8d49/x
 p8UdAmUf9oZXv5rEHPRtwJ0y1xcuPAt0Uren3Qxiwdtg4hJoc3j/Z945bE3ZNSFZxC3h
 IOFQ==
X-Gm-Message-State: AFqh2koQVP/u3yN1p2q+ti0z5QygefuHfUzE/5BgG19AhvFp4mnvqiaY
 v4ozVaFWeA4zK80mgL8gu3/d7A==
X-Google-Smtp-Source: AMrXdXvRz6nnnvglsDKaH6ul6CK56HGg9ZgKqRFIPm94pfXJEjtg2XCVBavUuW8A5EJ+rvtttfVZNQ==
X-Received: by 2002:adf:f742:0:b0:242:1551:974f with SMTP id
 z2-20020adff742000000b002421551974fmr443918wrp.13.1671606975699; 
 Tue, 20 Dec 2022 23:16:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 cc6-20020a5d5c06000000b002428c4fb16asm14586593wrb.10.2022.12.20.23.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 23:16:15 -0800 (PST)
Message-ID: <4398ae9e-c29a-503f-0738-4a4a161eb714@linaro.org>
Date: Wed, 21 Dec 2022 08:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] hw/arm/nseries: Silent -Wmissing-field-initializers
 warning
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20221220142520.24094-1-philmd@linaro.org>
 <20221220142520.24094-4-philmd@linaro.org>
 <eac96f81-8cd5-5951-6b0f-69da5985d47c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <eac96f81-8cd5-5951-6b0f-69da5985d47c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 21/12/22 02:01, Richard Henderson wrote:
> On 12/20/22 06:25, Philippe Mathieu-Daudé wrote:
>> Silent when compiling with -Wextra:
>>
>>    ../hw/arm/nseries.c:1081:12: warning: missing field 'line' 
>> initializer [-Wmissing-field-initializers]
>>        { NULL }
>>               ^
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>>   hw/arm/nseries.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> Not a fan of this specific warning.

Me neither, and I don't think we can enforce it on QEMU codebase.

However I find '{ /* end of list */ }' cleaner/clearer than assigning
the first field.


