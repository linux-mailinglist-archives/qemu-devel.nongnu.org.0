Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BCD666FE5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:41:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFupA-0004o2-4t; Thu, 12 Jan 2023 05:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFup5-0004mP-Dh
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:28:39 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFup3-00015r-S1
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:28:39 -0500
Received: by mail-ed1-x52c.google.com with SMTP id b4so6649951edf.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z9Ret/egr1eOnzbgY8Q9luonnBXl+ddvhcMJdI7R0+A=;
 b=oQZEOPZaciOaWeocfz3+EB2o6XVgwDNnJaH8aPM1y7wM2QtyPhNlhbZ485WgNCBqGJ
 tn8jZhgRUu2WRGjUcMLGfSLJmcGQWYOHTUGqZwsmVT1YtoHpEPfpOcOG9GoB2IkH/6PN
 RKLEoRjHpcdVDJBVCtlXM+8APRxgzN8umrYDUG8eQQ8tEMBtqU7qtHqw8PG/UPzf9bJH
 sRcBmDil1Z379/uHGXpU0DCSzwEhYyLj7VLwuYFlETKp17cWVtUGKa3Wlmx21yNcM5PH
 mS9BPKfTQcrNE7VEGg2GcTVO9ycCgq0ISa89alFKZidB01Zti3BLCl97F3ZRYMtlmA/j
 jvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9Ret/egr1eOnzbgY8Q9luonnBXl+ddvhcMJdI7R0+A=;
 b=SMjueoTQnugjhEwwI2Pco8gzE88qFF0mtABCHlE6gIWNpp9ASQk4IsTJqgWlBDMC/9
 H3+7VZsohD10b6n5tLR0tCh2t0lbknkUghhvm4NjYKs3jaR92tibqXPV1tR6ILIABdNp
 ZOh0ZX3FCqvFali5cBSukBA3ajFb+LjJgAs7BN1UqA7bZtlfmDNzLboxZpNg6tA7CyK7
 JLwPeOgaUuXZtLxqOgkBJwChA7Oz7jszVTfE0dfNUfRqh/TRrrt1zp3mTkJjOWDnqkPP
 yJ9T994ekcgmj1USwBS4V7H1tPTWciSttAyGwwwwvvPkzRx42wOKTcfsJDCwG4Z37ax3
 MIjQ==
X-Gm-Message-State: AFqh2kpg14Kfp7PR29SwUynpSzZrCPIHJWkP78hGpNa53Kbs9U5AupR5
 EO96TFlWbU9wmHCeR47PL4CNZg==
X-Google-Smtp-Source: AMrXdXv7ODCJbJ6D3nFvrIsjVXo0+nRI+J7S6sXFgQxXCoAMiuFWXZhcM7or6AZ+sqh0fclnCc/Diw==
X-Received: by 2002:a05:6402:d55:b0:499:c294:77b6 with SMTP id
 ec21-20020a0564020d5500b00499c29477b6mr8797476edb.9.1673519316072; 
 Thu, 12 Jan 2023 02:28:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b003d96b8e9bcasm28542578wmq.32.2023.01.12.02.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:28:35 -0800 (PST)
Message-ID: <5d4e2cdc-76ba-c597-a9d1-4ffce299085c@linaro.org>
Date: Thu, 12 Jan 2023 11:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/qtest: Poll on waitpid() for a while before sending
 SIGKILL
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com, peter.maydell@linaro.org
References: <20230111223018.3965423-1-stefanb@linux.ibm.com>
 <7799fdd7-755e-11c5-fe10-3f4afc00376b@linaro.org>
 <Y7/Yu+MBxrfRJNaT@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y7/Yu+MBxrfRJNaT@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/1/23 10:54, Daniel P. Berrangé wrote:
> On Thu, Jan 12, 2023 at 10:18:01AM +0100, Philippe Mathieu-Daudé wrote:
>> On 11/1/23 23:30, Stefan Berger wrote:
>>> To prevent getting stuck on waitpid() in case the target process does
>>> not terminate on SIGTERM, poll on waitpid() for 10s and if the target
>>> process has not changed state until then send a SIGKILL to it.
>>>
>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>>> ---
>>>    tests/qtest/libqtest.c | 18 +++++++++++++++++-
>>>    1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>>> index 2fbc3b88f3..362b1f724f 100644
>>> --- a/tests/qtest/libqtest.c
>>> +++ b/tests/qtest/libqtest.c
>>> @@ -202,8 +202,24 @@ void qtest_wait_qemu(QTestState *s)
>>>    {
>>>    #ifndef _WIN32
>>>        pid_t pid;
>>> +    uint64_t end;
>>> +
>>> +    /* poll for 10s until sending SIGKILL */
>>> +    end = g_get_monotonic_time() + 10 * G_TIME_SPAN_SECOND;
>>
>> Maybe we could use getenv() to allow tuning / using different value?
> 
> I'd rather we picked a value large enough that it will work
> reliably out of the box for all scenarios with no magic
> env required. We're just trying to prevent infinite waits if
> something unexpected happens. We don't need to use an
> aggressively short value, as most users will never hit this
> scenario. I think 30 seconds is large enough to be reliable
> but we could easily go higher to 60/120 if we want to be
> really really sure.

I read your other comment later and I agree with you.


