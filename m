Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3055E7541
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 09:54:55 +0200 (CEST)
Received: from localhost ([::1]:48362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obdWQ-0003kA-IG
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 03:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obdP8-0000FV-KG
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:47:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obdP4-0007Kn-8h
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663919236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMAMpIiWQgqqinSvZ0H+H8YfhDBhHvehGAK0k2Z+eBM=;
 b=NSkkqF37+cc9Lno4n3BmzdT2L+n1Hg6QtdVcTfvTtK3KqSbby+6xuiE++mTepA5jLgvLhj
 Cv5pXDX68Mm7LZ0oNk1BJzHAyTPj2yjNy7u3OerQDMAQjPhKAPgdjJAlhMD5DZZjDo9wEZ
 d8pBzI3e7GX7bdqSOkiHK9pWgdq7sK4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-xLX6TTLEOzq9aBvVqTrpnQ-1; Fri, 23 Sep 2022 03:47:04 -0400
X-MC-Unique: xLX6TTLEOzq9aBvVqTrpnQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 p36-20020a05600c1da400b003b4faefa2b9so3363623wms.6
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 00:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=rMAMpIiWQgqqinSvZ0H+H8YfhDBhHvehGAK0k2Z+eBM=;
 b=Beu+xT+NvVMKfkygUTdzmLaaICdy56MRcYK8oqOzditraHQY4JYOrxt0Xl1wguAL6h
 vFYpN+sOshX3DMcqm0nRd13Th18c4+VAyNApA0Lk9JJ5I9EjX9Xs6qkubmRI9QkjH0vZ
 5bI2OkLRD8Ap6TggbtKZZhSjO2E4SypB7flwm3I2oKrGcV5kb766OKXnuDuGI/0j04/L
 ct7tPXyXilXFdEaOawbIB4DPWsYXWbaSOMVTAJ8ru91VWlNT1+WQhJKbSPzDCP2taoLY
 2ZaHjYmF4qIqDnGx2qHNG9ZBiKqpHFKpH3MKt9hqBkPk0G/WeeD7aQ7lmkkENZNi+2yG
 HWMg==
X-Gm-Message-State: ACrzQf0dM4O8aJSjqJOoQRrTXU7OhDruTmYfMm1b20XmBKA6QsW2Bk+f
 BZABVO3aCQ/pPEPK4Nzih5G7HjzAS3G44k3AMqZSLx9tF9INr0er+8XQavtldw0T6z5XUxf4Iyq
 WkyBtZBNC4qwC6C4=
X-Received: by 2002:a05:600c:1c22:b0:3b4:b2bc:15e4 with SMTP id
 j34-20020a05600c1c2200b003b4b2bc15e4mr4995086wms.69.1663919223627; 
 Fri, 23 Sep 2022 00:47:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vs6NuPMQnXECliuI28LpyFF05+m8fSFiePSVC+75eppfjoBD430IGwzW5QO5T93BQ1WqIpQ==
X-Received: by 2002:a05:600c:1c22:b0:3b4:b2bc:15e4 with SMTP id
 j34-20020a05600c1c2200b003b4b2bc15e4mr4995063wms.69.1663919223281; 
 Fri, 23 Sep 2022 00:47:03 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-37.web.vodafone.de.
 [109.43.179.37]) by smtp.gmail.com with ESMTPSA id
 bj1-20020a0560001e0100b0022b0214cfa6sm8267365wrb.45.2022.09.23.00.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 00:47:02 -0700 (PDT)
Message-ID: <6a52db60-0ec8-ca7c-795a-b62743b1383f@redhat.com>
Date: Fri, 23 Sep 2022 09:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <YyyxrNp+5XrmLi1Y@fedora> <Yy1gB1KB3YSIUcoC@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Inscrutable CI jobs (avocado & Travis s390 check-tcg)
In-Reply-To: <Yy1gB1KB3YSIUcoC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/2022 09.28, Daniel P. Berrangé wrote:
> On Thu, Sep 22, 2022 at 03:04:12PM -0400, Stefan Hajnoczi wrote:
>> QEMU's avocado and Travis s390x check-tcg CI jobs fail often and I don't
>> know why. I think it's due to timeouts but maybe there is something
>> buried in the logs that I missed.
>>
>> I waste time skimming through logs when merging qemu.git pull requests
>> and electricity is wasted on tests that don't produce useful pass/fail
>> output.
>>
>> Here are two recent examples:
>> https://gitlab.com/qemu-project/qemu/-/jobs/3070754718
>> https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/583629583
>>
>> If there are real test failures then the test output needs to be
>> improved so people can identify failures.
>>
>> If the tests are timing out then they need to be split up and/or reduced
>> in duration. BTW, if it's a timeout, why are we using an internal
>> timeout instead of letting CI mark the job as timed out?
>>
>> Any other ideas for improving these CI jobs?
> 
> The avocado job there does show the errors, but the summary at the
> end leaves something to be desired. At first glance it looked like
> everything passed because it says "ERROR 0" and that's what caught
> my eye. Took a long time to notice the 'INTERRUPT 5' bit is actually
> just an error state too.  I don't understand why it has to have so
> many different ways of saying the same thing:
> 
>    RESULTS    : PASS 14 | ERROR 0 | FAIL 0 | SKIP 37 | WARN 0 | INTERRUPT 5 | CANCEL 136
> 
> 
>    "ERROR", "FAIL" and "INTERRUPT" are all just the same thing
> 
>    "SKIP" and "CANCEL" are just the same thing
> 
> I'm sure there was some reason for these different terms, but IMHO they
> are actively unhelpful.
> 
> For example I see no justiable reason for the choice of SKIP vs CANCEL
> in these two messages:
> 
>   (173/192) tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_pre_launch_set_up:  SKIP: sudo -n required, but "sudo -n true" failed: [Errno 2] No such file or directory: 'sudo'
> 
>   (183/192) tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_4_1_alias:  CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
> 
> It would be clearer to understand the summary as:
> 
>   RESULTS: PASS 14 | ERROR 5 | SKIP 173 | WARN 0
> 
> I'd also like to see it repeat the error messages for the failed
> tests at the end, so you don't have to search back up through the
> huge log to find them.
> 
> 
> On the TCG tests we see
> 
> imeout --foreground 90  /home/travis/build/qemu-project/qemu/build/qemu-s390x  noexec >  noexec.out
> 
> make[1]: *** [../Makefile.target:158: run-noexec] Error 1
> 
> make[1]: Leaving directory '/home/travis/build/qemu-project/qemu/build/tests/tcg/s390x-linux-user'
> 
> make: *** [/home/travis/build/qemu-project/qemu/tests/Makefile.include:60: run-tcg-tests-s390x-linux-user] Error 2
> 
> 
> I presume that indicates the 'noexec' test failed, but we have zero
> info.

I think this is the bug that will be fixed by Ilya's patch here:

  https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg02756.html

But I agree, it is unfortunate that the output is not available. Looking at 
this on my s390x box:

$ cat tests/tcg/s390x-linux-user/noexec.out
[ RUN      ] fallthrough
[       OK ]
[ RUN      ] jump
[  FAILED  ] unexpected SEGV

so there is an indication of what's going wrong in there indeed.

Alex, would it be possible to change the tcg test harness to dump the .out 
file of failing tests?

  Thomas


