Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA36D310D93
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:05:21 +0100 (CET)
Received: from localhost ([::1]:49144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83bk-0001Aj-WA
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l83Zk-0007oD-2n; Fri, 05 Feb 2021 11:03:16 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l83Zh-0003cM-QE; Fri, 05 Feb 2021 11:03:15 -0500
Received: by mail-ed1-x52a.google.com with SMTP id y8so9359020ede.6;
 Fri, 05 Feb 2021 08:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JXIKh7KHCoB6EbmcmZ8xMuwNrNXc+Wrpk2ClWIuaPnQ=;
 b=ogi4KXj32IRjLCpRu8NUsheECmN4Ptps7CJ8A6mrBULUKDGKa2i7o8TkyOosDERwsd
 4v507YBGOZI9X9OAjXClgQS+K03WQAEcsiflxV9DgrOIrrRXtlnGz3VMrH4/d9q0FN0L
 ENNTMhXI45WYFRwpRNQd0encBxGzNk4044V5k1/WrQ+/6UwoqSI317vnMmyW9ltpL8nK
 jELWFcT29bU3VO0DsCB4amVghRjlekyKoOAvOP5yTeOofNwenqM/ZJjtc8gYP3ud2/vF
 f8DZK5N5nda9FB0BQZZgCn+qN+m4VjYUQnk4lRACg0MvtkiSiuWARiO3LxBtKJR11f2+
 09Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JXIKh7KHCoB6EbmcmZ8xMuwNrNXc+Wrpk2ClWIuaPnQ=;
 b=If5b5Vptu6qxlXBcj2xySB/4+JsK9lxyu+1CHo0e/wwD5/6yWl6ZMHCSoAIzrdsyQH
 DvIuqBO9Xlc5yD+npI+YQlPkO3tT1E61xs7UYGNulDfE7noEQkUUZQTxUl+YnB7Y2hRB
 /xRRsqRrZUNWKoieqaEQ16BGZ6Y21D/++3rw53Hs0qeH4ZTX3xFf8J/+AvmPDGjrpofy
 Y2GgK32MP03Xdke2gHxqYLp9j2r+FUJMwFizAMPRyccR6fGrmK0Ctb15Y9AnWIRiqpby
 MvvgPIWy/oMRM5haQv0gie6zzoQ3VcNyNt1KoNiif5Qa4EaUnlp6UkWNckkTo5iaj8y5
 reVQ==
X-Gm-Message-State: AOAM531Ju+ue1sf5lmo6ttseBqKX1PlMcaVNYp97YrG36V+J5UgYGzuW
 Ld9kHiKfK4+QiEwpeFK8150=
X-Google-Smtp-Source: ABdhPJw6c52VW/vRaeg6xoZ7LNw+nCAJKhIbR7T9lx7IErCIPbyUiJ0Jvnfpm9yxRdeFo0EsgRCfBw==
X-Received: by 2002:a05:6402:110b:: with SMTP id
 u11mr4229839edv.57.1612540991330; 
 Fri, 05 Feb 2021 08:03:11 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w8sm4077066edd.39.2021.02.05.08.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:03:10 -0800 (PST)
Subject: Re: [PATCH 1/9] tests/qtest/arm-cpu-features: Remove Cortex-A15 check
To: Andrew Jones <drjones@redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-2-f4bug@amsat.org>
 <20210205145938.dvjk7jsfatgm56cy@kamzik.brq.redhat.com>
 <83662416-8eb6-eab9-fe90-c70daad29e44@amsat.org>
 <20210205153357.q73y2xo6oazheyma@kamzik.brq.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7173ad26-fc28-171e-b159-4b777fbaeb3a@amsat.org>
Date: Fri, 5 Feb 2021 17:03:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205153357.q73y2xo6oazheyma@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 4:33 PM, Andrew Jones wrote:
> On Fri, Feb 05, 2021 at 04:15:45PM +0100, Philippe Mathieu-Daudé wrote:
>> Hi Drew,
>>
>> On 2/5/21 3:59 PM, Andrew Jones wrote:
>>> On Fri, Feb 05, 2021 at 03:43:37PM +0100, Philippe Mathieu-Daudé wrote:
>>>> Support for ARMv7 has been dropped in commit 82bf7ae84ce
>>>> ("target/arm: Remove KVM support for 32-bit Arm hosts"),
>>>> no need to check for Cortex A15 host cpu anymore.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>  tests/qtest/arm-cpu-features.c | 4 ----
>>>>  1 file changed, 4 deletions(-)
>>>>
>>>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
>>>> index 8252b85bb85..c59c3cb002b 100644
>>>> --- a/tests/qtest/arm-cpu-features.c
>>>> +++ b/tests/qtest/arm-cpu-features.c
>>>> @@ -515,10 +515,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>>>>          QDict *resp;
>>>>          char *error;
>>>>  
>>>> -        assert_error(qts, "cortex-a15",
>>>> -            "We cannot guarantee the CPU type 'cortex-a15' works "
>>>> -            "with KVM on this host", NULL);
>>>> -
>>>
>>> This isn't testing anything regarding 32-bit KVM host support. It's
>>> testing that an error is returned when a given cpu type that can't
>>> be known to work with KVM is used. We know that the cortex-a15 can't
>>> be known to work. If we were to use a 64-bit cpu type here then there's
>>> a chance that it would work, failing the test that an error be returned.
>>
>> This was my first understanding, but then why does it fail?
>>
>> PASS 1 qtest-aarch64/arm-cpu-features /aarch64/arm/query-cpu-model-expansion
>> **
>> ERROR:../../tests/qtest/arm-cpu-features.c:543:test_query_cpu_model_expansion_kvm:
>> assertion failed: (g_str_equal(_error, "We cannot guarantee the CPU type
>> 'cortex-a15' works " "with KVM on this host"))
>> ERROR qtest-aarch64/arm-cpu-features - Bail out!
>> ERROR:../../tests/qtest/arm-cpu-features.c:543:test_query_cpu_model_expansion_kvm:
>> assertion failed: (g_str_equal(_error, "We cannot guarantee the CPU type
>> 'cortex-a15' works " "with KVM on this host"))
>> make: *** [Makefile.mtest:905: run-test-111] Error 1
>>
>> FWIW when tracing (cavium thunderX1 host, dmesg reports 0x431f0a11):
>> kvm_vcpu_ioctl cpu_index 0, type 0x4020aeae, arg 0xffff9b7f9b18
> 
> Hmm... I don't know. It works for me
> 
> $ QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/arm-cpu-features
> /aarch64/arm/query-cpu-model-expansion: OK
> /aarch64/arm/kvm/query-cpu-model-expansion: OK
> /aarch64/arm/kvm/query-cpu-model-expansion/sve-off: OK
> /aarch64/arm/max/query-cpu-model-expansion/sve-max-vq-8: OK
> /aarch64/arm/max/query-cpu-model-expansion/sve-off: OK

Thanks, that helped.

I ran my tests including the "Restrict v7A TCG cpus to TCG accel"
patch which removes the A15 in KVM-only build:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg08051.html
 So when TCG is disabled,

So I get:

{ "execute": "query-cpu-model-expansion", 'arguments': { 'type': 'full',
'model': { 'name': 'cortex-a15' }}}
{
    "error": {
        "class": "GenericError",
        "desc": "The CPU type 'cortex-a15' is not a recognized ARM CPU type"
    }
}

which fails the g_str_equal().

BTW is there some easy way to dump QMP traffic on stdio?

> 
> $ lscpu
> Architecture:        aarch64
> Byte Order:          Little Endian
> CPU(s):              48
> On-line CPU(s) list: 0-47
> Thread(s) per core:  1
> Core(s) per cluster: 16
> Socket(s):           -
> Cluster(s):          3
> NUMA node(s):        1
> Vendor ID:           Cavium
> Model:               1
> Model name:          ThunderX 88XX
> Stepping:            0x1
> BogoMIPS:            200.00
> NUMA node0 CPU(s):   0-47
> Flags:               fp asimd evtstrm aes pmull sha1 sha2 crc32 cpuid
> 
>>
>>>
>>>>          assert_has_feature_enabled(qts, "host", "aarch64");
>>>>  
>>>>          /* Enabling and disabling pmu should always work. */
>>>> -- 
>>>> 2.26.2
>>>>
>>>>
>>>
>>> This file could use a cleanup patch regarding the dropping of 32-bit KVM
>>> support though. At least the comment in main(), "For now we only run KVM
>>> specific tests..." could be reworded. It was written that way when we
>>> planned to try testing on 32-bit KVM too eventually, but we never did,
>>> and now we'll never need to.
>>>
>>> Thanks,
>>> drew
>>>
>>>
>>
> 
> 

