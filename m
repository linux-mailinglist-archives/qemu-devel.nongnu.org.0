Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B366A16C4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 07:53:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVRx8-00026N-P3; Fri, 24 Feb 2023 01:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVRx6-00025w-54
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 01:53:08 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVRx4-0006yC-BW
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 01:53:07 -0500
Received: by mail-wr1-x432.google.com with SMTP id bt28so6211070wrb.8
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 22:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OhTPpH63seEfU9QY7JrTSm1LhBS/ArIlZT9ZzBNqcm4=;
 b=GtOuv6r0sS/HVSlQED23w4e+uWjgldPFt0epsvwPbVOPjH21DDgR8s8M7gvGfVY4jG
 zfrQFypJLali3M9aGPsu3rGqbuCiNKwYRZztBERW0zddCwZiMm75NnoNY6HzOaDGFo6D
 A7i5FH0IoGcHvM9j6m3I5KM38k3AxXWGf/3+Ozv6BcBhYXVc8vdMHL4Uf9gHQUOI9eMx
 3Z6MLWmobQB53Y1hdfXrNXMl1yaFOSdu/qknr2X+ioHyhzUwV8e1uQtyOdIQ6dFsKYJa
 uKIyTH/1G9RyzfMIjhRTUJuEKpBz3LOkAKzHjOF6TKHYTMmrelkX11jyFHmg9bSUmMBO
 kt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OhTPpH63seEfU9QY7JrTSm1LhBS/ArIlZT9ZzBNqcm4=;
 b=LPvnQZCMeLmAd2suyMaqhYQqgdJKur78Q3E9hgoSIknG6Ee2RORx7SYTMUo6b32zpK
 jvEJ29Eo4eVd8vqUqyVHwuLC417LXcr3ygzMVEXgcrjjeRTx8HiBRg3+ePKBESUIWz9w
 iWsc1yx0IXECWxYxRwImun9Dg1BtIVBkfqadBrL1Gc1vj6mewtxll8/qFrzjCoLRkHfH
 UAjPo6ymUqb6OkEa1Xpdq3ufsIyckvoBUYzq/YAN4n3tkvYCLccDmszAFVUW0C3Qx0PW
 65LG9iwvfj+aUvTF0/o+E9eMHZO/d8IgDtqCGPbHXAXUYYgOoOXY5fp+f70tgavOqeor
 Fpiw==
X-Gm-Message-State: AO0yUKUD0rct1Z6KV0MKFEg03cwooi6RPTbT8ol7pMy2RUAs+u3LgAm6
 R77iTAFnWrZZNMz2KXbIF69HEw==
X-Google-Smtp-Source: AK7set+gOnAizWtKQgZz2MYYzptWVWAe3bohQyAmyq8OqpGOJBaHWqyUarRdayr+gFXF6j5tIFEf/g==
X-Received: by 2002:a5d:4d0a:0:b0:2c5:4ffa:ba62 with SMTP id
 z10-20020a5d4d0a000000b002c54ffaba62mr11614443wrt.17.1677221582704; 
 Thu, 23 Feb 2023 22:53:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b4-20020adff904000000b002c54f39d34csm15537503wrr.111.2023.02.23.22.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 22:53:02 -0800 (PST)
Message-ID: <375154a3-24d8-ea41-45b1-5824b778859c@linaro.org>
Date: Fri, 24 Feb 2023 07:53:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 6/7] dump: Build once by adding stubs for non-x86
 targets
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-7-philmd@linaro.org>
 <13687ac8-a771-eddd-e1b0-5c348d2e141e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <13687ac8-a771-eddd-e1b0-5c348d2e141e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 24/2/23 00:51, Richard Henderson wrote:
> On 2/23/23 13:17, Philippe Mathieu-Daudé wrote:
>> Extract non-x86 stubs to win_dump-stub.c. We can now
>> build dump.o once for system emulation. Update meson.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   dump/dump.c          | 14 --------------
>>   dump/meson.build     |  6 ++++--
>>   dump/win_dump-stub.c | 23 +++++++++++++++++++++++
>>   3 files changed, 27 insertions(+), 16 deletions(-)
>>   create mode 100644 dump/win_dump-stub.c

>> diff --git a/dump/meson.build b/dump/meson.build
>> index 2eff29c3ea..6ae07e6fed 100644
>> --- a/dump/meson.build
>> +++ b/dump/meson.build
>> @@ -1,4 +1,6 @@
>>   softmmu_ss.add(files('dump-hmp-cmds.c'))
>> -specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), 
>> snappy, lzo])
>> -specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'], if_true: 
>> files('win_dump.c'))
>> +softmmu_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), 
>> snappy, lzo])
>> +specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'],
>> +                if_true: files('win_dump.c'),
>> +                if_false: files('win_dump-stub.c'))
> 
> Doesn't this add win_dump-stub.c when !(SOFTMMU && X86_64), i.e. 
> !SOFTMMU || !X86_64?
> 
> I trying to imagine how well this will scale with ARM64, for the ongoing 
> Windows on ARM project.  Would it just be easier have the stubs in 
> win_dump.c, using ifdefs?

Yeah I realized that later, keeping one single file with #ifdef'ry
even simplifies meson rules. I over-engineered that :)
Also various methods from win_dump.c could be reused.

