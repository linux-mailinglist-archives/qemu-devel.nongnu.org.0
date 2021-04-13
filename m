Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7518635E44D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:44:19 +0200 (CEST)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWM9C-00079b-Jz
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWLrT-0002si-66
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:26:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWLrN-00076V-7l
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618331151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UyzVXPm06xid7WZRO0ycGgH+l4t6vdGXgJBFtM+qvbk=;
 b=PZSktz6ctQAam5h1kNMYuNnfNjB9DEq2ucLkWkJ7v8JO/B/upFXkts1eC0fYWg+1bw8Vwg
 ji/bocmKeLHn1TkyM0NU53yndoBpIsi1+P/WIubLmFlIdhd6hht1ltGIpOQ/bV/XA4QSiu
 8VYh/I+90Q+ChVZA8bZ2MBmO4LMTv2w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-Oz5yuX_mPn2jLsHWJSXoIg-1; Tue, 13 Apr 2021 12:25:50 -0400
X-MC-Unique: Oz5yuX_mPn2jLsHWJSXoIg-1
Received: by mail-wr1-f70.google.com with SMTP id p16so943894wre.2
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UyzVXPm06xid7WZRO0ycGgH+l4t6vdGXgJBFtM+qvbk=;
 b=PcPoxAtdk88ltPPLwCNrslD57uBnfG8g+TEvWfw1+oriAxVRacM+QU1U7lsYUWA9Ua
 q/hlcTWg125sulZV785qzFxC/TSz882xXloUzPxgSkOC93lZQWTJgDTSyiAW4lHRXdNV
 fgzem7c0l6mK3HyYphdtCWVxExT/4lXN711JqV7qc91lIKFxqJPVz7FL7Dl6GHsTDynb
 2YtXuomxVK38r7DXDkuhiJK1uxlZgJ/styAWZVgNmgwb2EaAUeWaMDVjlUiRqpJYM7qI
 VrtMPtPfiF6yU6bWSeXBsZVuM/YVsiofomfkjIzH7bqh5RXTmIW9lOLyx7YXBD31mBBy
 krfA==
X-Gm-Message-State: AOAM533A0EI1JiVNe//z9wzU+c1h0yjCrr3p6qWFVzfXZknWrsxcmpqF
 ll1aPqfA67l8YXSlYp5CMANwVWDqT2bWDPVFCcbGS4hhNJT2lj8ZUc+Q1opDeNauThO0XygDn2M
 Lvq0UUJs6GBmoXOoRQN5eeiDJfh4z/rNeKqkGIGW2R/0jZqvah/QOULNzKzWsk/o4
X-Received: by 2002:adf:ba54:: with SMTP id t20mr9484568wrg.353.1618331148749; 
 Tue, 13 Apr 2021 09:25:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvu11KdawEvYWUPtcby3fvuv2tpUdv8o+LzLYPgHxXXmWS3CAMlQeUsJKRt/6UhzJ9iPDHlg==
X-Received: by 2002:adf:ba54:: with SMTP id t20mr9484540wrg.353.1618331148460; 
 Tue, 13 Apr 2021 09:25:48 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f25sm4588116wrd.43.2021.04.13.09.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 09:25:48 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200929224857.1225107-1-philmd@redhat.com>
 <87eefvnx3s.fsf@linaro.org> <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
 <87ft03wd3w.fsf@linaro.org> <b9fa6362-7899-884e-58b9-f670143de6ae@redhat.com>
Message-ID: <a2a463cb-e2a1-1884-cc97-8c5b4689341b@redhat.com>
Date: Tue, 13 Apr 2021 18:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b9fa6362-7899-884e-58b9-f670143de6ae@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 4/12/21 7:55 PM, Philippe Mathieu-Daudé wrote:
> On 4/6/21 7:12 PM, Alex Bennée wrote:
>>
>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>
>>> On 3/31/21 5:45 PM, Alex Bennée wrote:
>>>>
>>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>>
>>>>> The current 'virt_kvm' test is restricted to GICv2, but can also
>>>>> work with a GICv3. Duplicate it but add a GICv3 test which can be
>>>>> tested on some hardware.
>>>>>
>>>>> Noticed while running:
>>>>>
>>>>>  $ avocado --show=app run -t machine:virt tests/acceptance/
>>>>>  ...
>>>>>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: ERROR: Unexpected empty reply from server (1.82 s)
>>>>>
>>>>> The job.log content is:
>>>>>
>>>>>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-kernel GICv2 emulation\n'
>>>>>
>>>>> With this patch:
>>>>>
>>>>>  $ avocado --show=app run -t device:gicv3 tests/acceptance/
>>>>>  (1/1)
>>>>>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>>>>>  PASS (55.10 s)
>>>>
>>>> On the new aarch64 machine which is GICv3 I get the following:
>>>>
>>>>  (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2: ERROR: Unexpected empty reply from server (0.47 s)
>>>>
>>>> which it shouldn't have run. However:
>>>>
>>>>   ./tests/venv/bin/avocado --show=app run -t device:gic3 tests/acceptance/
>>>>   Test Suite could not be create. No test references provided nor any other arguments resolved into tests
>>>>
>>>> Is this something that has regressed or am I doing it wrong?
>>>
>>> Typo in the tag: "device:gic3" -> "device:gicv3"
>>
>> Doh!
>>
>> But what about:
>>
>> /tests/venv/bin/avocado run tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2
>> JOB ID     : 396696d8f9d31d970878cb46025b2ced76f3623f
>> JOB LOG    : /home/alex/avocado/job-results/job-2021-04-06T17.11-396696d/job.log
>>  (1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2: ERROR: Unexpected empty reply from server (0.65 s)
>> RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>> JOB TIME   : 0.96 s
>>
>> why doesn't that skip?
> 
> /home/phil/avocado/job-results/job-2021-04-12T17.51-efdca81/job.log
> 2021-04-12 17:52:44,589 machine          L0389 DEBUG| Output:
> "qemu-system-aarch64: Could not find ROM image
> '/home/phil/qemu/build/host/pc-bios/edk2-aarch64-code.fd'\n"
> 
> Missing prerequisite:
> 
> $ ninja pc-bios/edk2-aarch64-code.fd
> [1/1] Generating edk2-aarch64-code.fd with a custom command (wrapped by
> meson to capture output)
> 
> Then we are good:
> 
> $ avocado --show=app,console run -t device:gicv3 tests/acceptance
> JOB ID     : e84401e5cc3ae53a3094c79491e661385cc7b4a7
> JOB LOG    :
> /home/phil/avocado/job-results/job-2021-04-12T17.53-e84401e/job.log
>  (1/1)
> tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
> PASS (16.38 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
> CANCEL 0
> JOB TIME   : 16.70 s
> 
> Probably some missing dependency in Makefile/Meson?

Are you using multiple build directories?

I could reproduce doing:

$ mkdir A B
$ cd A
$ make check-qtest-aarch64
$ avocado --show=app,console run -t device:gicv3 tests/acceptance
$ cd ../B
$ ninja qemu-system-aarch64
$ avocado --show=app,console run -t device:gicv3 tests/acceptance

In A edk2-aarch64-code.fd has been expanded in A/pc-bios/,
in B it isn't.

check-acceptance is a Makefile rule, not a ninja one...
I suppose we need to convert it to ninja to be able to use the
rest of the dependencies checks.

Cc'ing Paolo because I'm not sure what the best move and where
to plug things.


