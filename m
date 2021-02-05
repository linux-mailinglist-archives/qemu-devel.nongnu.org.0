Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA8310D19
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:21:48 +0100 (CET)
Received: from localhost ([::1]:59842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82vb-0000Xr-2g
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82pr-0001Xu-MH; Fri, 05 Feb 2021 10:15:52 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82pp-0007k4-J7; Fri, 05 Feb 2021 10:15:51 -0500
Received: by mail-ej1-x62e.google.com with SMTP id w2so12392752ejk.13;
 Fri, 05 Feb 2021 07:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r6OrfmsXvRp8qjnXlPAo1idyDSFLBLJyAmI+Tvv42fA=;
 b=YByeI9wD/bPApYWQLmcVnSWee3i5olpO/48Oe2bPaele+4OabVXIiX0VSat8JhDnkP
 +ZLQAksyAulIs+f+3r8zU2ypsmXuv+YVPsrPvHTA82l6LG/krUKxSG7ukANYM5N/zpYI
 Jg2wDfPGg46Z13N7q+i4E85u+HR9U8m4adwbQPY+gJoLp+aOouXfck5OZMzk+tGIl/UI
 maPKdt6CHiY8wGM4F6zOpHD4t89vZRVnt99NXHR9psH2v1cc0RDpzYX45Ye5ZAyCr+vf
 k9fWCHQaBB55xQVOOb2xup1d9HvrqI4yxKCNGIpg7plFQ+ryux7QPhVYwJkuYoRox7CI
 oP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r6OrfmsXvRp8qjnXlPAo1idyDSFLBLJyAmI+Tvv42fA=;
 b=AkCD2B6D88qkobG8z0gSs5EXmR2NB35WhBPCmkH4WI4zJmuXjg2j1jBhyWEtCBV1/+
 BAWZd6wXr1GAOBk8AD5fzN6SGCBjoK2gwoLx7q9czGmTryP2i0hJNQoJZYhOfMhk/qmB
 glTqEihTaUH5G3DxKbdnFlcjUemY+PLpl6/eJiAoQayVmwvCfeD8r3YOWBvzEjiqJJo8
 vZzHcGsV7w0kItoBF+RLg234viJNnakwgG2KoPUDsGhwVw49Z8OzMeTj3lwHXA+fGdnF
 6AKvExvsnMbSxMiTo/WAsqaEE8T623ZQE3Tpm4aOTFlBbKIMyWjvtOAb5gaBn0ZebQNS
 lRgw==
X-Gm-Message-State: AOAM533zLkL1a7kGQj0b0uY6/5uULeltGX2SgXCEqXmJsOa0elYu+esO
 4MXJnGlMT9vvOEu7E3nY6PM=
X-Google-Smtp-Source: ABdhPJwqu33a6uki5Dn9X0dGBThGT2EG09Iu1oMwYpwr/fL6bU3J64Z5A/C0FjxapNI2Ztaf38JLUA==
X-Received: by 2002:a17:906:19cf:: with SMTP id
 h15mr4515608ejd.167.1612538147578; 
 Fri, 05 Feb 2021 07:15:47 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bm9sm4067167ejb.14.2021.02.05.07.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 07:15:46 -0800 (PST)
Subject: Re: [PATCH 1/9] tests/qtest/arm-cpu-features: Remove Cortex-A15 check
To: Andrew Jones <drjones@redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-2-f4bug@amsat.org>
 <20210205145938.dvjk7jsfatgm56cy@kamzik.brq.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <83662416-8eb6-eab9-fe90-c70daad29e44@amsat.org>
Date: Fri, 5 Feb 2021 16:15:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205145938.dvjk7jsfatgm56cy@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
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

Hi Drew,

On 2/5/21 3:59 PM, Andrew Jones wrote:
> On Fri, Feb 05, 2021 at 03:43:37PM +0100, Philippe Mathieu-Daudé wrote:
>> Support for ARMv7 has been dropped in commit 82bf7ae84ce
>> ("target/arm: Remove KVM support for 32-bit Arm hosts"),
>> no need to check for Cortex A15 host cpu anymore.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/qtest/arm-cpu-features.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
>> index 8252b85bb85..c59c3cb002b 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -515,10 +515,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>>          QDict *resp;
>>          char *error;
>>  
>> -        assert_error(qts, "cortex-a15",
>> -            "We cannot guarantee the CPU type 'cortex-a15' works "
>> -            "with KVM on this host", NULL);
>> -
> 
> This isn't testing anything regarding 32-bit KVM host support. It's
> testing that an error is returned when a given cpu type that can't
> be known to work with KVM is used. We know that the cortex-a15 can't
> be known to work. If we were to use a 64-bit cpu type here then there's
> a chance that it would work, failing the test that an error be returned.

This was my first understanding, but then why does it fail?

PASS 1 qtest-aarch64/arm-cpu-features /aarch64/arm/query-cpu-model-expansion
**
ERROR:../../tests/qtest/arm-cpu-features.c:543:test_query_cpu_model_expansion_kvm:
assertion failed: (g_str_equal(_error, "We cannot guarantee the CPU type
'cortex-a15' works " "with KVM on this host"))
ERROR qtest-aarch64/arm-cpu-features - Bail out!
ERROR:../../tests/qtest/arm-cpu-features.c:543:test_query_cpu_model_expansion_kvm:
assertion failed: (g_str_equal(_error, "We cannot guarantee the CPU type
'cortex-a15' works " "with KVM on this host"))
make: *** [Makefile.mtest:905: run-test-111] Error 1

FWIW when tracing (cavium thunderX1 host, dmesg reports 0x431f0a11):
kvm_vcpu_ioctl cpu_index 0, type 0x4020aeae, arg 0xffff9b7f9b18

> 
>>          assert_has_feature_enabled(qts, "host", "aarch64");
>>  
>>          /* Enabling and disabling pmu should always work. */
>> -- 
>> 2.26.2
>>
>>
> 
> This file could use a cleanup patch regarding the dropping of 32-bit KVM
> support though. At least the comment in main(), "For now we only run KVM
> specific tests..." could be reworded. It was written that way when we
> planned to try testing on 32-bit KVM too eventually, but we never did,
> and now we'll never need to.
> 
> Thanks,
> drew
> 
> 

