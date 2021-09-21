Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C024130C9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 11:34:52 +0200 (CEST)
Received: from localhost ([::1]:34304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mScAt-0003Tv-D4
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 05:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSc69-0001hU-AR; Tue, 21 Sep 2021 05:29:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSc64-00012a-1X; Tue, 21 Sep 2021 05:29:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id t8so37173950wrq.4;
 Tue, 21 Sep 2021 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5d5A2cLTjMVGTBj3tzUerJCWDBPdIz3r2OouML/d0KM=;
 b=oSZ1hiee/TsArBrFIE5SyuPyhuHzyT1cxgm6BVr8i1cbzPAFM//61fUQE1ufVXoitq
 wjvU5ds7E5akI2RtAyHXXQ6wHrymseedq9IwD2J7+UD3gEIe325XK/cnBRcmU25y3fiT
 rilBf8xW3CCsb4QgrbH1Fsqr/ATIwZI2BM5TcgwvxAciH5CH/qYVD9gzDkHML2Gxn+qc
 +WDEySXs8O6nBVK6LtvOAfHUVqazIYDjX3sVC2+FTz/ASHs4hvLxUtrMgYJlJP7u6k7A
 a+uWKcs7F5msKsMcQxUT12LfrA/8fLwVMMw5qHkuNLfVKbc9bLp5o6XDIn0VNm5C3m09
 8Xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5d5A2cLTjMVGTBj3tzUerJCWDBPdIz3r2OouML/d0KM=;
 b=GJAoNkW0lsTZEmbwmSRNGhikLj1sGBYhUEcIC+U5rbCCzZ2eknoWEVFg4lOHgBRXCN
 VIrww25NqJGniLiHU9HMuc9y1/8GyjCGeG1y+k1mK7eXsO5/Ld1lqmOj2u3jZ5li0TBb
 mwEBcNGBx7C+yytaZtinSFtctDtEltznC7PW9q1w5WrU4tHg00hBbpceN74LkLWka/Fi
 ONPzDcCQAL7wEgObNAo1Yh/eCB3dTpCxD8VR0VCP4U4OeA7ipXL+FKmQpTlk+hZC4HaY
 NKdaEto8YSUOr7uSC7ReFYE6GI2jVtXWdiYBHyhTHKWzRFcBQfK4iEg75xn9rLJnh6UI
 vQJA==
X-Gm-Message-State: AOAM533AHeBnW6vugh506/H1Ul+NPZmPq37Yh4faoY7DaVkJOol4GESJ
 nPQCsmU2aKF4euQGbEQn3Bw=
X-Google-Smtp-Source: ABdhPJyIfmDu5SsU5F1Vqw3QPQ/6LqH1RLiZK4MqqFNWpguwx0UBTmZt2Q4/PjlqayFMLVYJpifYPw==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr27331939wri.205.1632216590232; 
 Tue, 21 Sep 2021 02:29:50 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k18sm18567407wrh.68.2021.09.21.02.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 02:29:49 -0700 (PDT)
Message-ID: <bdeef51c-901b-f5a8-0415-03c464255b1f@amsat.org>
Date: Tue, 21 Sep 2021 11:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 00/10] hvf: Implement Apple Silicon Support
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20210916155404.86958-1-agraf@csgraf.de>
 <CAFEAcA-LrvO7sg9gY0ZKnvXJyJuFc2Ej1Ve1245FZ7YkH-Oj2A@mail.gmail.com>
 <CAFEAcA_Hkqg16VbA1qACK4RG22iXHo8b3VZWQoBRZL0HuBazZA@mail.gmail.com>
 <d4859cae-d9c1-2879-0682-080d4b5efe90@amsat.org>
 <27a265d5-2e7c-f234-0d09-f40a731e588d@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <27a265d5-2e7c-f234-0d09-f40a731e588d@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 22:21, Alexander Graf wrote:
> On 20.09.21 18:17, Philippe Mathieu-Daudé wrote:
>> On 9/20/21 15:15, Peter Maydell wrote:
>>> On Mon, 20 Sept 2021 at 11:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de> wrote:
>>>>> Now that Apple Silicon is widely available, people are obviously excited
>>>>> to try and run virtualized workloads on them, such as Linux and Windows.
>>>>>
>>>>> This patch set implements a fully functional version to get the ball
>>>>> going on that. With this applied, I can successfully run both Linux and
>>>>> Windows as guests. I am not aware of any limitations specific to
>>>>> Hypervisor.framework apart from:
>>>>>
>>>>>    - gdbstub debugging (breakpoints)
>>>>>    - missing GICv3 support
>>>>>    - Windows will not work due to UDEF SMC implementation
>>>>>
>>>>> To use hvf support, please make sure to run -M virt,highmem=off to fit
>>>>> in M1's physical address space limits and use -cpu host.
>>>> Applied to target-arm.next, thanks (with the unnecessary #include
>>>> in patch 6 removed).
>>> Turns out that the final patch breaks "make check-acceptance".
>>> All the orangepi boot tests timeout:
>>>
>>>   (15/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
>>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>>> Timeout reached\nOriginal status: ERROR\n{'name':
>>> '15-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi',
>>> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/...
>>> (90.24 s)
>>>   (16/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd:
>>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>>> Timeout reached\nOriginal status: ERROR\n{'name':
>>> '16-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd',
>>> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang...
>>> (90.24 s)
>>>   (17/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd:
>>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>>> Timeout reached\nOriginal status: ERROR\n{'name':
>>> '17-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd',
>>> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tes...
>>> (90.24 s)
>> Works for me on x86_64 Fedora 34 built with
>> --enable-trace-backends=log --enable-debug:
>>
>> $ ./tests/venv/bin/avocado run
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
>> Fetching asset from
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
>> Fetching asset from
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd
>> Fetching asset from
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd
>> Fetching asset from
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
>> Fetching asset from
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
>> Fetching asset from
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08
>> Fetching asset from
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9
>> Fetching asset from
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9
>> JOB ID     : b19f151f7320def3a432255f3a99c0dde3da95c0
>> JOB LOG    :
>> /home/phil/avocado/job-results/job-2021-09-20T18.12-b19f151/job.log
>>   (1/5)
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
>> PASS (6.29 s)
>>   (2/5)
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd:
>> PASS (51.23 s)
>>   (3/5)
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd:
>> PASS (76.53 s)
>>   (4/5)
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08:
>> SKIP: storage limited
>>   (5/5)
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9:
>> SKIP: storage limited
>> RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 2 | WARN 0 | INTERRUPT 0 |
>> CANCEL 0
>> JOB TIME   : 135.18 s
>>
> 
> The OrangePi kernel goes into an endless loop here:
> 
>   
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/compressed/head.S?h=v5.10#n637

As you said, this is a Linux specific behavior, ...

> The reason is simple: It tries to install its own HYP code using the old
> "install HYP handler, then invoke it" trick based on SPSR's indication
> that HYP is available, but fails to do so because HYP calls get handled
> by QEMU instead because the PSCI conduit is configured to HVC.
> 
> The patch below seems to fix it for me. Please advise how you want to
> proceed.
> 
> 
> Alex
> 
> 
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 27f1070145..f9b7ed1871 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -237,7 +237,7 @@ static void allwinner_h3_realize(DeviceState *dev,
> Error **errp)
> 
>           /* Provide Power State Coordination Interface */
>           qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
> -                            QEMU_PSCI_CONDUIT_HVC);
> +                            QEMU_PSCI_CONDUIT_SMC);

... so I'd rather follow the approach taken on the Versal board,
see versal_virt_init() in commit 6f16da53ffe ("hw/arm: versal:
Add a virtual Xilinx Versal board"):

1/ add "psci-conduit" property in TYPE_AW_H3,
    forward this property to each core in allwinner_h3_realize()

2/ set property in orangepi_init():

    object_property_set_int(OBJECT(h3), "psci-conduit",
                            machine->kernel_filename
                            ? QEMU_PSCI_CONDUIT_SMC
                            : QEMU_PSCI_CONDUIT_HVC,
                            &error_abort);

That way we don't break non-Linux firmwares.

