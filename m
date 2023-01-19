Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A620E6736E8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:32:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIT9L-0007BN-Rf; Thu, 19 Jan 2023 06:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIT9K-0007A7-62
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:32:06 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIT9I-0004ZE-H6
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:32:05 -0500
Received: by mail-wr1-x42c.google.com with SMTP id n7so1551670wrx.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HkZ4YSdEdJ3oXagoToF9f650ZayRoemXcKKG1lIbI8k=;
 b=Ai913Ypi6Mw+v2/li6NEhkec+OHRp4lhiKG6kyIEfmnl084ydQA7UfRD8HD0bAzi0R
 JuQD66Hi1MbcOSIPvRdHxBaUO8ftTrrPKD8CC0bCZ8duRlBDrjwJBrHsQD8KRq9eXUUx
 9IRUbYABwsGGnPz0ciGxxYne0J0nx6fhbYMn/lqJc6eMytqP8BHGdT0GiaVjj4cWvo+P
 wDwCB86FB/VUF0ey47seH+O/O3DIFVFkdjx/+hszp6mMgKEymnFTjnkzhdbD5PeuNVUh
 pINqb5dmSgKgMlTzwEinWCPpnm1N+q/nfSslXfHz92HpAnk6/7D4sgg292bsPT3QAFm3
 NDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HkZ4YSdEdJ3oXagoToF9f650ZayRoemXcKKG1lIbI8k=;
 b=4oHNxAyuu8f/havH9oFDLoaouqdksrLYoArBmAEWni/z2c/8ci2fJPWfsHsIBR5oZQ
 CHqQQhP5f9cGZBKW4y0io3jJc/4gbVvE1pnMCHJDYfEPHGGV0mq19rtwqzMdJUaIPQhT
 Sz2w24aaTO9H6jZL+PiLRGr25VKYqaiPyIVsoCv25Rr6hwwx187BRrA8fktDefHmpA5+
 6/GiAQFAES4wMS57rd52pG3zRLOB9BIcU/vu8hAIo3J+lKSDjYaG6P857brcYaQ4C5sp
 d1UMeVoXB3eaypDrM8kp691q7xRit4vfzsvXIx8xydF0USWfjGtnlhDKsfBtErS9KH1j
 3I1w==
X-Gm-Message-State: AFqh2koe6e6VLp380RpWc+GOKjhlqyWiPi7da2L49omaqPVXxnY7oWEX
 ZiRuZFYZ4jE4Lqr+u3JBBR1TgQ==
X-Google-Smtp-Source: AMrXdXuiLgaMG+AdGFlgACyZmQLm8qEKieU241FaG3aF+5SH+qeSH//B2+4SVB/y3VRriaKlNphiFw==
X-Received: by 2002:a5d:4b52:0:b0:2be:34f7:29bb with SMTP id
 w18-20020a5d4b52000000b002be34f729bbmr4522476wrs.37.1674127919537; 
 Thu, 19 Jan 2023 03:31:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056000024500b00267bcb1bbe5sm34493310wrz.56.2023.01.19.03.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:31:59 -0800 (PST)
Message-ID: <6b459f7c-e0ee-17f6-311c-c105595200f0@linaro.org>
Date: Thu, 19 Jan 2023 12:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 8/8] tests/qtest/migration-test: Allow running with HVF
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-9-philmd@linaro.org> <Y8klwyh3fgmns+Wg@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y8klwyh3fgmns+Wg@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 19/1/23 12:13, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Does it support migration? I don't remember anyone ever mentioning it.

The test doesn't fail, but I have no idea what that means...

>> ---
>>   tests/qtest/migration-test.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> index 1e7f1ea162..7a0fcfb81d 100644
>> --- a/tests/qtest/migration-test.c
>> +++ b/tests/qtest/migration-test.c
>> @@ -47,6 +47,7 @@ unsigned start_address;
>>   unsigned end_address;
>>   static bool has_tcg;
>>   static bool has_kvm;
>> +static bool has_hvf;
>>   static bool uffd_feature_thread_id;
>>   
>>   /*
>> @@ -614,6 +615,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>>                                  args->use_dirty_ring
>>                                  ? ",dirty-ring-size=4096" : "");
>>       }
>> +    if (has_hvf) {
>> +        g_string_append(cmd_common, "-accel hvf ");
>> +    }
>>   
>>       bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>>       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>> @@ -2472,6 +2476,7 @@ int main(int argc, char **argv)
>>   
>>       has_tcg = qtest_has_accel("tcg");
>>       has_kvm = qtest_has_accel("kvm");
>> +    has_hvf = qtest_has_accel("hvf");
>>   
>>       g_test_init(&argc, &argv, NULL);
>>   
>> -- 
>> 2.38.1
>>


