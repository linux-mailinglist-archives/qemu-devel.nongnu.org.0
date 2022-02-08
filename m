Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C024AD7C5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:48:23 +0100 (CET)
Received: from localhost ([::1]:55452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOyr-00054b-7a
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:48:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHOU2-0002wV-49
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:16:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHOTz-0006cZ-CL
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644318986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZBPL3JtQbFY7U5gmnYgYu+75ct66bBeSe0HDj9Xno8=;
 b=eLwPStt2OCqoaO+xxiEftfpFT1E13djdVSS/2K5tyYAi4rXT13aAQdqxE7tOSPg42A/qH0
 XQ1wIAdKz/guVJmc4sx0QVmoVQUCxnC6uS03F/tIYEaWIZSXBEd3KZ5J0UR2BHNgf+BaFs
 WpQvwHEs1XM94lyI4uoUkOV7VHx1l48=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518--W3BZcRaMTGqTCF5Wl1ZFA-1; Tue, 08 Feb 2022 06:16:25 -0500
X-MC-Unique: -W3BZcRaMTGqTCF5Wl1ZFA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h24-20020adfaa98000000b001e33eb81e71so193116wrc.9
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cZBPL3JtQbFY7U5gmnYgYu+75ct66bBeSe0HDj9Xno8=;
 b=4SA5Hg0vPzhRsW/O5Vjy2/eCE9Ek7eb2mR9wIBooZ8baih6xK2Jy8EHfALJmCb8LtP
 uiuXKRYVzIS/ladoLlyYkT010kMkrGTsu4Ac0bUn2stHzTOolPS601P/M1iNKmFltMsF
 rjRZO0Gb07FcnNg1G9Ym0gKvrvGv7Zqh6ZHJpkqxK90gYwiEMB76riEnwWeGKtZFpMKy
 mePWHGhsUkLcBObNBiNicgqZL9wyFgXy0zhy3qDAGPOMdeoeZlY/2QBLDq+EkTjKi1sc
 5XnMZuYhyw+PIqxhYm8zDfp/xADQRCd/XcsDfCoo63Ayzve15RpuoDxOvcWuoVCiSZ6k
 kNjQ==
X-Gm-Message-State: AOAM533tbXZUpr7yps1XCqANaS+sgAqmhvKsotKuJD1Mq8Kgyai7Rzh3
 xEFWcLaQQPEfnbszYbcGsWB7aao3z3512hK05uvF57fFwy/r/ezFsWAqxj1GQyRFnxWD3OUpakx
 ZbiNffcXlCsjBDnw=
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr3242041wri.438.1644318984517; 
 Tue, 08 Feb 2022 03:16:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmJ0tO/tAtaDEkSuA+E+Nwic6PtLU4NrKmK/cr22kA1/7jnypYeXkodFbQUXHtq2TDFAw0aw==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr3242022wri.438.1644318984306; 
 Tue, 08 Feb 2022 03:16:24 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id g7sm2198536wmq.3.2022.02.08.03.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 03:16:23 -0800 (PST)
Message-ID: <63b891db-ce52-6c57-5c24-723be29df770@redhat.com>
Date: Tue, 8 Feb 2022 12:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/6] tests: Do not treat the iotests as separate meson
 test target anymore
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-6-thuth@redhat.com>
 <CAFEAcA_xMXYyMvaC8B=x1N7wX-=8y1XMTJouJvetqFYX87z1dQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA_xMXYyMvaC8B=x1N7wX-=8y1XMTJouJvetqFYX87z1dQ@mail.gmail.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2022 11.26, Peter Maydell wrote:
> On Tue, 8 Feb 2022 at 10:18, Thomas Huth <thuth@redhat.com> wrote:
>>
>> Now that we add the single iotests directly in meson.build, we do
>> not have to separate the block suite from the other suites anymore.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   meson.build            | 6 +++---
>>   scripts/mtest2make.py  | 4 ----
>>   tests/Makefile.include | 9 +--------
>>   3 files changed, 4 insertions(+), 15 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 5f43355071..b203402ee1 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -3,9 +3,9 @@ project('qemu', ['c'], meson_version: '>=0.58.2',
>>                             'b_staticpic=false', 'stdsplit=false'],
>>           version: files('VERSION'))
>>
>> -add_test_setup('quick', exclude_suites: ['block', 'slow', 'thorough'], is_default: true)
>> -add_test_setup('slow', exclude_suites: ['block', 'thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
>> -add_test_setup('thorough', exclude_suites: ['block'], env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
>> +add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
>> +add_test_setup('slow', exclude_suites: ['thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
>> +add_test_setup('thorough', env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
>>
>>   not_found = dependency('', required: false)
>>   keyval = import('keyval')
>> diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
>> index 4d542e8aaa..304634b71e 100644
>> --- a/scripts/mtest2make.py
>> +++ b/scripts/mtest2make.py
>> @@ -101,10 +101,6 @@ def emit_suite(name, suite, prefix):
>>   testsuites = defaultdict(Suite)
>>   for test in introspect['tests']:
>>       process_tests(test, targets, testsuites)
>> -# HACK: check-block is a separate target so that it runs with --verbose;
>> -# only write the dependencies
>> -emit_suite_deps('block', testsuites['block'], 'check')
>> -del testsuites['block']
> 
> This code being deleted claims to be doing something to ensure that
> the tests get run and output the useful messages on failure.

No, AFAIK that --verbose switch just influences how meson prints the 
progress during the test runs (i.e. either a brief or a slightly more 
verbose output).

> What is the mechanism for this in the new meson setup ?

cat meson-logs/testlog.txt

... I guess we should either dump that to stdout or publish that file as a 
test artifact?

  Thomas


