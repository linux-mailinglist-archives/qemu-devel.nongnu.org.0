Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8230869EA1C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:25:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUb4R-0003Jf-Hd; Tue, 21 Feb 2023 17:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUb4L-00030l-TL
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:25:06 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUb4J-000792-B5
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:25:05 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 iv11-20020a05600c548b00b003dc52fed235so4033596wmb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1PJvAzbYpCKSn6NS/R8lV+dcF7Spcmk/Y0SYGCTM7WE=;
 b=qaagUhfiMAbMikYMfWAoz3rUOTlLrFLu3mM427+xHdcBk9NB+AT4hEDtvkllsxkLs2
 6VkHWhn9RQ5Oo/DAEuZiPtj67/k2vyhN8xHc+mWXNEA6Ja8vcz1eXHl/s1xUX20Nsqtk
 9G8wSAOIipkM0+qNLCXDVEAMibjL8wEBBDVHZMHo7mzPPJRiTBFiGLAFVNaptiD/1W3O
 vcnMIGH5milGW8AsrS8ACTe4FDVixP8YyYIxCwqi4RmSPfadqionBFMJslBmEZIZOnJB
 ZYjHdnVy8bXCYNsYKpDMl6MYR6SS5krWnD41jDp3dGg9kWJTTzhOvrjKDnkdTAvqow/s
 9U4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1PJvAzbYpCKSn6NS/R8lV+dcF7Spcmk/Y0SYGCTM7WE=;
 b=8LsvpEN6kAnKONqWqIHgNyO1wSHgaosE86zwhCnAE7lkO1WehKWBeJdopn5js0iysP
 YX7Fi3lIFaDG9wcuQhk62zblP7Wy9sqNmoAc8aFE06cikmHQw7IgpHWg/G0mdW37W8XJ
 eEZJj4g5mDBN3H1opjGTH8MEZHsEGKRz84c9GHk9gI1P6bmVA24Psshh7gQpD3UOgTIB
 5IQaslmlz/IDZWDtievSr3Jt/dzn4SJyh2fJ++mHtUap8gcpmtYBAFt6ODJhqoJAJ5CR
 rHI+xoMtJqUI/jHdSmpsUqUXDpq99aIMlbWFSlp8f74nMcF4+rvI20SotaomT8SUXMbD
 gHGA==
X-Gm-Message-State: AO0yUKUBN6kD6EX8ARHkfSU9V/e3ATDEHo8TzSXAAbcftRYep5CGUPkT
 Pzgkv1PxLKKiUIZDFTwyUnOSWQ==
X-Google-Smtp-Source: AK7set9kVzmZie5m5dh34Oti7OGRWW70FIggarqnXUYM+/HNo8ebtpRGp3cRxDlzSNQgL5x3EHTYMA==
X-Received: by 2002:a05:600c:4393:b0:3df:dc29:d69 with SMTP id
 e19-20020a05600c439300b003dfdc290d69mr11509379wmn.36.1677018301208; 
 Tue, 21 Feb 2023 14:25:01 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a7bc7d4000000b003e6efc0f91csm4461902wmk.42.2023.02.21.14.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 14:25:00 -0800 (PST)
Message-ID: <949b026a-50d7-6635-079c-8fc7d4ab4192@linaro.org>
Date: Tue, 21 Feb 2023 23:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] tests: Disable migration-test
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>
References: <20230221132726.2892383-1-peter.maydell@linaro.org>
 <Y/Thas4efx14JsBi@work-vm>
 <CAFEAcA9=p0XYti45m0sW+iO9qgF9iXpeOPvHd7Xpy32yCUL3sw@mail.gmail.com>
 <Y/TlB36EjrWwr2ne@work-vm> <194fc94a-b028-92cf-f07a-c7fdaaede1c5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <194fc94a-b028-92cf-f07a-c7fdaaede1c5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 21/2/23 18:35, Thomas Huth wrote:
> On 21/02/2023 16.36, Dr. David Alan Gilbert wrote:
>> * Peter Maydell (peter.maydell@linaro.org) wrote:
>>> On Tue, 21 Feb 2023 at 15:21, Dr. David Alan Gilbert
>>> <dgilbert@redhat.com> wrote:
>>>> Damn this is really going to impact the stability of migration if we
>>>> don't regularly test.
>>>> But fundamentally, I've never been able to debug much of the reports
>>>> that come from flakyness in gitlab ci; we're not getting the most basic
>>>> information like which subtest or where we're upto in the test which
>>>> makes it very very hard to debug.
>>>
>>> Right, but if you want more information you need to change the
>>> tests and/or test harness to provide it.
>>
>> I don't think the migration test is doing anything odd in that respect;
>> We've just got a bunch of qtest tests; having a test framework which
>> doesn't tell you which test failed is very difficult.
> 
> FWIW, I just saw another failure, on a s390x host,
> last lines of the log are:
> 
> ok 10 /s390x/migration/postcopy/recovery/tls/psk
> # End of tls tests
> # End of recovery tests
> # Start of preempt tests
> # starting QEMU: exec ./qemu-system-s390x -qtest 
> unix:/tmp/qtest-7847.sock -qtest-log /dev/null -chardev 
> socket,path=/tmp/qtest-7847.qmp,id=char0 -mon chardev=char0,mode=control 
> -display none -accel kvm -accel tcg -name source,debug-threads=on -m 
> 128M -serial file:/tmp/migration-test-03MJ01/src_serial -bios 
> /tmp/migration-test-03MJ01/bootsect    -accel qtest
> # starting QEMU: exec ./qemu-system-s390x -qtest 
> unix:/tmp/qtest-7847.sock -qtest-log /dev/null -chardev 
> socket,path=/tmp/qtest-7847.qmp,id=char0 -mon chardev=char0,mode=control 
> -display none -accel kvm -accel tcg -name target,debug-threads=on -m 
> 128M -serial file:/tmp/migration-test-03MJ01/dest_serial -incoming 
> unix:/tmp/migration-test-03MJ01/migsocket -bios 
> /tmp/migration-test-03MJ01/bootsect    -accel qtest
> ok 11 /s390x/migration/postcopy/preempt/plain
> # Start of recovery tests
> # starting QEMU: exec ./qemu-system-s390x -qtest 
> unix:/tmp/qtest-7847.sock -qtest-log /dev/null -chardev 
> socket,path=/tmp/qtest-7847.qmp,id=char0 -mon chardev=char0,mode=control 
> -display none -accel kvm -accel tcg -name source,debug-threads=on -m 
> 128M -serial file:/tmp/migration-test-03MJ01/src_serial -bios 
> /tmp/migration-test-03MJ01/bootsect   2>/dev/null -accel qtest
> # starting QEMU: exec ./qemu-system-s390x -qtest 
> unix:/tmp/qtest-7847.sock -qtest-log /dev/null -chardev 
> socket,path=/tmp/qtest-7847.qmp,id=char0 -mon chardev=char0,mode=control 
> -display none -accel kvm -accel tcg -name target,debug-threads=on -m 
> 128M -serial file:/tmp/migration-test-03MJ01/dest_serial -incoming 
> unix:/tmp/migration-test-03MJ01/migsocket -bios 
> /tmp/migration-test-03MJ01/bootsect   2>/dev/null -accel qtest
> ----------------------------------- stderr 
> -----------------------------------
> Broken pipe
> ../tests/qtest/libqtest.c:193: kill_qemu() detected QEMU death from 
> signal 11 (Segmentation fault) (core dumped)
> 
> (test program exited with status code -6)

I get some of these too, but qtest parent debug info isn't very helpful,
I'd rather get the child info. I tried this some time ago but per Paolo
it wasn't correct: 
https://lore.kernel.org/qemu-devel/20200707031920.17428-1-f4bug@amsat.org/
I still use this patch when running my tests as it helps me to
understand where the child crash, so I didn't really looked at
what is the correct fix.

