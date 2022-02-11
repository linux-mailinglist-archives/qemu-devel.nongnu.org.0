Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807CE4B277E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 15:02:51 +0100 (CET)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWVb-0000ML-8s
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 09:02:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nIWNH-0003BZ-CZ
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 08:54:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nIWNB-0006jQ-HC
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 08:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644587640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdCikF8rBB7yeeFFiIPDUdq4ZLrmRAahw5KAhQ6MJwQ=;
 b=KefJNz3FvFvOINAtCu8tbcHmWFAaGejWEI/jxy29GOEvjpJMVWpjdN+iHgJBJfcqxizFqB
 6zWlstVqmimyX8+TcinY8fdFNys8AgnQcXxjAfyU8Jg7FQxAtjGXxxaOWR0/XGnNP089dY
 8Vc/7luCcYdqST5PpW/uWtssSvEpQp8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80--QeaklFINWqEsu_q73Xy9Q-1; Fri, 11 Feb 2022 08:53:59 -0500
X-MC-Unique: -QeaklFINWqEsu_q73Xy9Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 m3-20020a7bcb83000000b0034f75d92f27so2550013wmi.2
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 05:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sdCikF8rBB7yeeFFiIPDUdq4ZLrmRAahw5KAhQ6MJwQ=;
 b=vgnPMgQTnl36NWJiluiLtx4O4HJyVbxUBFTwhC5I5gGp3oYm1WZXmBkE+R4g4lG5Gz
 IM/hEmz/KZwE8M6OOJv/EQvjnn732ZFcb/1kFIIqpL6DAo2NL20g/DE5IpW1wVmG0M2F
 e6a2nGNHkVHgzHwKRanPHOiq+8SF/ZVJbbnSv0FXBLr8h+celu8LJYaplVSIJOX7oZtl
 q2d/NLAtncApW0CLecOGLLx/omBIh5WdIsd/4trk0gvBCNMRqJ1lqu8Ve4HhkydzP7k1
 2L5lkE5vPaOOiVVLtdnHkM1RpRPVVi3WDHjJj4xlgdbuDkme/SquVytWk6wCBc1BIf8v
 26aQ==
X-Gm-Message-State: AOAM532aTxDE92SDfmneoBTwXPHmzE5rJF1GX92t01+dyuIjEHHGrXms
 vTkSR3IKRbbN8yGxdjZvNabpQQJh+NRylUmiD6i0jUQtTRlsLXE4k+bBpwvTSvttuQ/30JIpxF/
 2cxidgsCKdfZ/sPM=
X-Received: by 2002:a05:600c:4fcf:: with SMTP id
 o15mr355131wmq.145.1644587637881; 
 Fri, 11 Feb 2022 05:53:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcb5xY6ufEL86JS/EVfFHXN5llhMxYWb9epeP6WwBXZ0avNg9wE72QOCQlPxtXgvmzyl6IUg==
X-Received: by 2002:a05:600c:4fcf:: with SMTP id
 o15mr355112wmq.145.1644587637603; 
 Fri, 11 Feb 2022 05:53:57 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id m12sm25521990wrp.61.2022.02.11.05.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 05:53:56 -0800 (PST)
Message-ID: <362412d7-4676-1733-fef6-825fda8e34a0@redhat.com>
Date: Fri, 11 Feb 2022 14:53:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/8] tests/qemu-iotests/testrunner: Allow parallel test
 invocations
To: Kevin Wolf <kwolf@redhat.com>
References: <20220209101530.3442837-1-thuth@redhat.com>
 <20220209101530.3442837-2-thuth@redhat.com> <YgYsbRc9XNYjUH2L@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YgYsbRc9XNYjUH2L@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/02/2022 10.29, Kevin Wolf wrote:
> Am 09.02.2022 um 11:15 hat Thomas Huth geschrieben:
>> If multiple tests run in parallel, they must use unique file
>> names for the test output.
>>
>> Suggested-by: Hanna Reitz <hreitz@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/qemu-iotests/testrunner.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
>> index 0eace147b8..9d20f51bb1 100644
>> --- a/tests/qemu-iotests/testrunner.py
>> +++ b/tests/qemu-iotests/testrunner.py
>> @@ -259,7 +259,7 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
>>           """
>>   
>>           f_test = Path(test)
>> -        f_bad = Path(f_test.name + '.out.bad')
>> +        f_bad = Path(f'{os.getpid()}-{f_test.name}.out.bad')
>>           f_notrun = Path(f_test.name + '.notrun')
>>           f_casenotrun = Path(f_test.name + '.casenotrun')
>>           f_reference = Path(self.find_reference(test))
> 
> Hmm... It does make sense, but nobody ever cleans those files up.
> Currently, the next run of the test will just overwrite the existing
> file or delete it when the test succeeds. So after running the test
> suite, you have .out.bad files for every failed test, but not for those
> that succeeded.
> 
> After this change, won't the test directory accumulate tons of .out.bad
> files over time?

True ... but we certainly want to keep the file for failed tests for further 
analysis instead of immediately deleting them ... maybe it would be enough 
to encode the image format (qcow2, qed, vmdk, ...) into the output name, 
instead of using the PID, so that "make check SPEED=thorough" works as 
expected here?

  Thomas


