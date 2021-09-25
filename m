Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20353418359
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 18:08:41 +0200 (CEST)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUAEB-0002zV-LV
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 12:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUA7m-0006J2-Tq
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 12:02:03 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUA7h-0004DA-Gg
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 12:02:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id r23so11539381wra.6
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G5iQ7zkhWl4kUsFvcav5m/m5f/D9IC3MPBgd8VnVDKg=;
 b=l1whS+2ttL2HkpGq1O9huT8ZqILAH1FLS1/xktsI4fdwsTWdpQevceqNd5wC/qPUOv
 2JHsr2h9p2VNi766KIj0Z6mshK8X8kTEW2WqtWrj0V9PUzxcjQz5HH7YFQauU9oe2+9U
 a0fZW7/4S5PgJ/tzs72/zpmqxqe6GQO/Z5hSy/6Hvqf7cxLfczx3hEPThZX9KtShQgCW
 DaK+LBVs6hcGdh+DU2XsJbTNV/0S/urMNgl4Qcxmko2IcE+jxaRRNWRVx48AKUYIZQxf
 H0J4ike6x4/E8Pz5zm0rkh8AQFD+7VWvVXs1i+K1NWWM9hFg4kw5rwWuJWJ+w6GALBYQ
 1T5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G5iQ7zkhWl4kUsFvcav5m/m5f/D9IC3MPBgd8VnVDKg=;
 b=lsia4xgLr1mA3NxqKMkrOhfBuIC4VGCuIwReltB2hhr79ilS5uGV+7B3Z7EyxcfEHy
 j7bp35geKfjy6PSVNoyaeIZeGzWqo+bxxigvIplzHbeUEW/hjEDy3tpFaj+hVh0Zi7EY
 mBr2V6ZqaBpPVmyiJQA+Z+/l31k54i6Rz43HXae3x5RxY8roUTKRZJeRHQOzgXyNvaZj
 +V16bWvQkFi60bWAxq0VuQlQwqW+96MHSpc5hQjGHeymUSER+gLBxWkO8YOGlis9MFT6
 KoF2DWQWp15SOWgUb9GNyk1sZRa1K4Ce6CsjHKeX0ECOiyzVbXKtZl99BUg9uVDT1PPm
 vy/Q==
X-Gm-Message-State: AOAM530eWJLpuy+dzfs/PeavCt+5iAJ8142ZXeZrP1Da2B+OA0oBy3pb
 KkExfavvQFSD4IbuNVPqpps=
X-Google-Smtp-Source: ABdhPJy33lMCbofcwugdgktG8pKzq2W5cNVjqMnvndK+I0cN/hXzKtWU94p7W2JiTquTJ/ZULawqNw==
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr18006627wri.288.1632585715968; 
 Sat, 25 Sep 2021 09:01:55 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d11sm4608767wrx.22.2021.09.25.09.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 09:01:55 -0700 (PDT)
Message-ID: <b5f7eccb-7b19-02c2-bef7-c8cf9e544440@amsat.org>
Date: Sat, 25 Sep 2021 18:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v7 12/40] accel/qtest: Implement AccelOpsClass::has_work()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210925145118.1361230-1-f4bug@amsat.org>
 <20210925145118.1361230-13-f4bug@amsat.org>
 <8b882c1d-933a-448b-ec76-010b36d12096@amsat.org>
 <e1c7cb21-459e-15a3-7d99-da30c174ea76@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <e1c7cb21-459e-15a3-7d99-da30c174ea76@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/21 17:32, Richard Henderson wrote:
> On 9/25/21 11:27 AM, Philippe Mathieu-Daudé wrote:
>>> +static bool qtest_cpu_has_work(CPUState *cpu)
>>> +{
>>> +    g_assert_not_reached();
>>> +}
>>
>> Sigh, this triggers:
>>
>> Running test qtest-i386/cpu-plug-test
>> **
>> ERROR:../accel/qtest/qtest.c:52:qtest_cpu_has_work: code should not be 
>> reached
>> ERROR qtest-i386/cpu-plug-test - Bail out! 
>> ERROR:../accel/qtest/qtest.c:52:qtest_cpu_has_work: code should not be 
>> reached
>> Broken pipe
> 
> Ha ha, yes.  You beat me to the reply within minutes.
> 
>> I suppose it is in my interest to 'return false' here and call it
>> a day...
> 
> I *think* that's the right thing, but I could see maybe "true" also 
> makes sense.  I'll try and have a closer look.

So first I tested using "-machine pc,accel=qtest" -> no crash.

Looking closely at how check-qtest calls QEMU, it does:
"-machine pc -accel qtest". Isn't the sugar property supposed
to work that way?

Then the backtrace is:

Thread 5 "qemu-system-i38" hit Breakpoint 1, qtest_cpu_has_work 
(cpu=0x555556a08400) at accel/qtest/qtest.c:52
52          g_assert_not_reached();
(gdb) bt
#0  qtest_cpu_has_work (cpu=0x555556a08400) at accel/qtest/qtest.c:52
#1  0x0000555555c330ba in cpu_has_work (cpu=0x555556a08400) at 
softmmu/cpus.c:254
#2  0x0000555555c32ac8 in cpu_thread_is_idle (cpu=0x555556a08400) at 
softmmu/cpus.c:91
#3  0x0000555555c33584 in qemu_wait_io_event (cpu=0x555556a08400) at 
softmmu/cpus.c:417
#4  0x0000555555d8a7f4 in dummy_cpu_thread_fn (arg=0x555556a08400) at 
accel/dummy-cpus.c:53
#5  0x0000555555f469f6 in qemu_thread_start (args=0x5555574edae0) at 
util/qemu-thread-posix.c:557
#6  0x00007ffff4ff3299 in start_thread () at /lib64/libpthread.so.0
#7  0x00007ffff4f1b353 in clone () at /lib64/libc.so.6

dummy_cpu_thread_fn() content didn't change since its introduction
in commit c7f0f3b1c82 ("qtest: add test framework"):

    "The idea behind qtest is pretty simple.  Instead of executing
     a CPU via TCG or KVM, rely on an external process to send events
     to the device model that the CPU would normally generate."

Based on that description, qtest should provide a command to notify
whether the CPU has work to do or not.

Meanwhile, no qtest command = no work = 'return false'.

