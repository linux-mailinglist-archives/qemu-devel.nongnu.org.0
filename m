Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC0634D210
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 16:04:36 +0200 (CEST)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQsVP-0004v7-77
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 10:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQsUU-0004Ue-Vs
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:03:39 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:37828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQsUR-0000E0-DK
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:03:38 -0400
Received: by mail-oi1-x22b.google.com with SMTP id k25so13177550oic.4
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5F8vYwP5FAmwho0Sgj6YGG6PY3HrqcLQSUkJKdmCqls=;
 b=ZJ+jfUU32yvqG9RdE88bWwBI/UbWV0PWPN7+JAeUdiZjr2ALsHcVL92uA6a8llLQw9
 k2s007kYZf7jr4FXDhQmI4Q0PGI+NCEsQri5J00ruTs+mmzncMyIKYf95VkIDT+2Do09
 jhh6bXwoe4rDZP7fLuk37zxRjQgUGpAZHZpcz1uxSj9iFePyD8hFNi+mtqoAtSATfb9I
 Sn36N2jykGl4biJyEQohGyBOXxgKEn5d48MB0Q8p2Hjd3dZXqRtegj4xNe0vwg/+3cRc
 SQhoW6Ar/QSpPmY9muCvKwebswPPPsdDVhhpEHYTQ+Ksq2geveOC55TcjSx6zhyRiIlL
 81KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5F8vYwP5FAmwho0Sgj6YGG6PY3HrqcLQSUkJKdmCqls=;
 b=VMcFy4XZkMlXprycq7L8NtdTgSlxZmf82Yvrd3f7nlnSjZrPEOjW5uJqPxBKKXAo4T
 zxHtgBzz6H+0dWd+9ozjmogGSpeZ+2lNVmlQO7J5ojbWkyOiTmSffL0YjY0Ii2xWNu7I
 BC3IaHn1gU50bFqSRExZqNJAdzZkcLZzT7kL8JjSyJjWrTqGS6rXchEGjd0PP7ITEv+9
 AKNCFwEJ28Pa5mAIhV/FDa7Wg6noeQmON4oCDpb4UnWuAc+8vrTTWZpPvud7/NmqpTvv
 eOHjQxgkUqUBthBlQOpDuh0zgbVJgKB6wou4f/A5ApXBC8yJyqIbFct0kiIcaZWJvGyM
 lC+w==
X-Gm-Message-State: AOAM5337DgSzJzWclSunOYCOgPEPP3kwEPo4rix8qqmsgYw9f4Uq5Z/c
 9lDLwK21SWE7tct1saGWZE0sng==
X-Google-Smtp-Source: ABdhPJz1SHj8tTf9uITI34w+KuGZ8zCfowWicjkTog7ZuBasmHCHvA0kYCEL6U8BenqxKADu2M/dMw==
X-Received: by 2002:a05:6808:904:: with SMTP id
 w4mr18369101oih.1.1617026613975; 
 Mon, 29 Mar 2021 07:03:33 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id z3sm1229520oop.41.2021.03.29.07.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 07:03:33 -0700 (PDT)
Subject: Re: [RFC v12 40/65] tests/qtest: skip bios-tables-test
 test_acpi_oem_fields_virt for KVM
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-41-cfontana@suse.de>
 <be6e704a-8c61-052a-daaf-deddd683c6cc@linaro.org>
 <4d052899-9645-d98b-50d2-17d91271bc39@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d399b384-53e9-e5f5-e21d-bcf96d3134c6@linaro.org>
Date: Mon, 29 Mar 2021 08:03:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4d052899-9645-d98b-50d2-17d91271bc39@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 1:02 AM, Claudio Fontana wrote:
> On 3/28/21 7:21 PM, Richard Henderson wrote:
>> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>>> test is TCG-only.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>    tests/qtest/bios-tables-test.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>>> index e020c83d2a..bd7b85909c 100644
>>> --- a/tests/qtest/bios-tables-test.c
>>> +++ b/tests/qtest/bios-tables-test.c
>>> @@ -1488,6 +1488,13 @@ static void test_acpi_oem_fields_virt(void)
>>>        };
>>>        char *args;
>>>    
>>> +#ifndef CONFIG_TCG
>>> +    if (data.tcg_only) {
>>> +        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
>>> +        return;
>>> +    }
>>> +#endif /* CONFIG_TCG */
>>
>> Why is this an ifdef and not tcg_enabled()?
> 
> We want to launch this whenever TCG is compiled in.
> 
>> We're using kvm_enabled() elsewhere...
> 
> where?

Whoops, there's a local re-definition of the function at the top of 
tests/qtest/arm-cpu-features.c.  Hmm.

r~

