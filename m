Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C776698001
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:57:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSK8L-0006Ra-Gh; Wed, 15 Feb 2023 10:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSK8K-0006RE-4T
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:55:48 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSK8I-0000wv-5J
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:55:47 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so1885323wmb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JMHkgZm5OD5dKfvdlBVUzZCVK+HUYexeT8pyqA68848=;
 b=IOQjmrq78tqEh6qKP4+0D5rDlj1p4IUJ1ifBlLHsnAstSDe9pMuGBpxgJxnb98Te1j
 2RZ/OSs+j1kKDwbzWlwRBnZZ7BsVn5GkzFxgtYqZZLlxZmKi/gyjm+Xjmb9NbAqRrE7e
 MxGRAtd0IOKrilpz/SYhd+t7KLlvFXTrwSqgT4vaWsEKwAfWsSNQtIuq2B3yoP5rcWOW
 eGZ106WahD6rf3BB4dzFfyEYx6DUB2ICN8yycHXBqLPTyPmsKlyR7MiLDo1Qf2iVK2vp
 cJbD6EhAsW3guF1TfVjqJS+pcXvBYeoKR7snhqvRte+21ICT4j2fQ+wu/7DxP801cliZ
 KflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JMHkgZm5OD5dKfvdlBVUzZCVK+HUYexeT8pyqA68848=;
 b=DNCXmcP4kBZcf1bUq8trqIVRGM/20vWp8j0blvR3d3JG0fet/JxZFrOjCLIHYQdbWn
 ULqQj1pDFap5rn4s/3sLX+XH7nMp+vI68jQHR1Z/AFeKd8b2eefkGGb+IWL3x2NQzCRL
 SY0GMvkkCxrBe6nRcAviDCIavF0sloAlShAW2vxcOA9MsTOOPc7K7k1mQvykIqBhoLqo
 LIY4y5iXGLue65E7Jh/CyltifW33yrMO+3Mx3M7NzEk2YZSmcZ/nBFKE1+G9ooL4dq+U
 dawkfJegE5MKfB7wEwYRiHkEE40l+QoCnukx4vsnLEHaJ4Ip0mWqiQ4Zr1NNvAKNmyaL
 D/Ug==
X-Gm-Message-State: AO0yUKV9uevf905ReqBlKitWsy0zbuvGMj35sAqmCR2QB994O1HyHLET
 BZCH0KFtYtA4n7zuKjanC46gCQ==
X-Google-Smtp-Source: AK7set+MNA7o/ilp8GCPBs+UxSR3QDokyxHJdmt2OepAg5+MjETbOya+FpCYeshKVCbVju2ua9u37A==
X-Received: by 2002:a05:600c:746:b0:3de:d52:2cd2 with SMTP id
 j6-20020a05600c074600b003de0d522cd2mr2264801wmn.4.1676476544072; 
 Wed, 15 Feb 2023 07:55:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c3b1600b003daf6e3bc2fsm7303917wms.1.2023.02.15.07.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 07:55:43 -0800 (PST)
Message-ID: <beebbbb8-d83f-7c89-6adc-21ecc33ced82@linaro.org>
Date: Wed, 15 Feb 2023 16:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] gitlab-ci: Use artifacts instead of dumping logs in the
 Cirrus-CI jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230215142503.90660-1-thuth@redhat.com>
 <32f0a378-2ae9-c711-19c8-837397c87c4a@linaro.org>
 <4ba57bbf-3712-8958-e7c6-b164854e35ce@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <4ba57bbf-3712-8958-e7c6-b164854e35ce@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 15/2/23 16:45, Thomas Huth wrote:
> On 15/02/2023 15.57, Philippe Mathieu-Daudé wrote:
>> Hi Thomas,
>>
>> On 15/2/23 15:25, Thomas Huth wrote:
>>> The meson log files can get very big, especially if running the tests in
>>> verbose mode. So dumping those logs to the console was a bad idea, since
>>> gitlab truncates the output if it is getting too big. Let's publish the
>>> logs as artifacts instead. This has the disadvantage that you have to
>>> look up the logs on cirrus-ci.com now instead, but that's still better
>>> than not having the important part of the log at all since it got
>>> truncated.
>>>
>>> Fixes: 998f334722 ("gitlab: show testlog.txt contents ...")
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   Note: I also tried to publish the junit xml files as artifacts
>>>   instead, but while the cirrus-ci docs claim to support it, I only
>>>   got unreadable XML output in my browser that way, so the .txt
>>>   files look like the better option to me.
>>>
>>>   .gitlab-ci.d/cirrus/build.yml | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/.gitlab-ci.d/cirrus/build.yml 
>>> b/.gitlab-ci.d/cirrus/build.yml
>>> index 7ef6af8d33..a9444902ec 100644
>>> --- a/.gitlab-ci.d/cirrus/build.yml
>>> +++ b/.gitlab-ci.d/cirrus/build.yml
>>> @@ -32,6 +32,9 @@ build_task:
>>>       - $MAKE -j$(sysctl -n hw.ncpu)
>>>       - for TARGET in $TEST_TARGETS ;
>>>         do
>>> -        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
>>> -        || { cat meson-logs/testlog.txt; exit 1; } ;
>>> +        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1 ;
>>>         done
>>> +  always:
>>> +    build_result_artifacts:
>>> +      path: build/meson-logs/*log.txt
>>> +      type: text/plain
>>
>> How long is that log kept available?
> 
> No clue, I haven't seen anything related in the docs:
> 
>   https://cirrus-ci.org/guide/writing-tasks/#artifacts-instruction
> 
> ... but I assume they will at least be available for a couple of days so 
> you've got enough time to look at them in case a job failed.

OK thanks.


