Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839FC4119A9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:19:49 +0200 (CEST)
Received: from localhost ([::1]:38700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSM1E-0000m2-Ib
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSLz5-0006oC-TE; Mon, 20 Sep 2021 12:17:35 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSLz0-00082Q-I8; Mon, 20 Sep 2021 12:17:35 -0400
Received: by mail-wr1-x434.google.com with SMTP id t8so31295433wrq.4;
 Mon, 20 Sep 2021 09:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jbC00DvnLlq9bjaNjuvq/E00Cm7HdHkItRKZFy60HD8=;
 b=cLQc8r999iXfJ3UjlJWmoKbwSJ0/XHkEaheMSTCopEkLdDJ0ut6U/QZSTj7C3zDRUR
 yX9JG+4txffDUhYIfrYXgAtmTq3wvWYBuIV77mIy8pvlgDHQyJSVbffVD41rWbsq7fG9
 DScUcBjYuzJYKU7SXXv67rKcT2WYP2e0rYv+eFUYHw6K3Q+kT0LemCVEzzLGUS1zwfBZ
 O+e6lXjCOerZfmtDtRu8E6HlvTc+tosjApcgILFkQ7LKMQ2tb2W1wMVLksf29S5KKMz7
 mgvPjNr/QGxA/RF9xcwu9lOqqDw7jllPHc7blvQCW4kM3iEB/Zaz+8BrECtTpKb0tjUB
 jPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jbC00DvnLlq9bjaNjuvq/E00Cm7HdHkItRKZFy60HD8=;
 b=Y+UU2NZBSA5rELYOa980hwMe9GILnXTRFGGbzB79IBg3DzN1VjUGxxH973CtqZVWm7
 yuhsbp8XNojERKWYbMpcArjiSZadiuDoWPuQQlQ+t0ePELw+QyUN+ucIw7aMEQ3HvHEw
 Whj1YBu+qxLtRXF1bz0f2k6gQKvbdGTD18RrZJou3GUPhyYKH8P3xmLg0rHYMeEmTbH6
 myiJskNlcuet6kz8wdQyVb6E+z+H/jR+qhPynlV0wsmXsFgcv6RRx1R11jMWhZuJ+OPj
 w6il7Bxf805hf/0Q2RWZ7NlW8VOy1ckmjbhd92tbDdG0EIB77/tzee6DOl/8Zeb/WV7s
 k2gw==
X-Gm-Message-State: AOAM533BsB6tVYw0Wo5zkPSGIJmbib01ROj08edAo0KjJ8IlVKv5dDou
 6u1ByWPWClddR9YIIBS1hDg=
X-Google-Smtp-Source: ABdhPJzbp2WPH7A4HZtTtzs0noRGTuOeov/22YdV+moBHaW+Uj656mo2lpnlFFWSMSwYQsvCJIuuEg==
X-Received: by 2002:a05:600c:ac5:: with SMTP id
 c5mr26242649wmr.191.1632154646942; 
 Mon, 20 Sep 2021 09:17:26 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id n26sm19307287wmi.43.2021.09.20.09.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:17:25 -0700 (PDT)
Message-ID: <d4859cae-d9c1-2879-0682-080d4b5efe90@amsat.org>
Date: Mon, 20 Sep 2021 18:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 00/10] hvf: Implement Apple Silicon Support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
References: <20210916155404.86958-1-agraf@csgraf.de>
 <CAFEAcA-LrvO7sg9gY0ZKnvXJyJuFc2Ej1Ve1245FZ7YkH-Oj2A@mail.gmail.com>
 <CAFEAcA_Hkqg16VbA1qACK4RG22iXHo8b3VZWQoBRZL0HuBazZA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA_Hkqg16VbA1qACK4RG22iXHo8b3VZWQoBRZL0HuBazZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 15:15, Peter Maydell wrote:
> On Mon, 20 Sept 2021 at 11:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de> wrote:
>>>
>>> Now that Apple Silicon is widely available, people are obviously excited
>>> to try and run virtualized workloads on them, such as Linux and Windows.
>>>
>>> This patch set implements a fully functional version to get the ball
>>> going on that. With this applied, I can successfully run both Linux and
>>> Windows as guests. I am not aware of any limitations specific to
>>> Hypervisor.framework apart from:
>>>
>>>   - gdbstub debugging (breakpoints)
>>>   - missing GICv3 support
>>>   - Windows will not work due to UDEF SMC implementation
>>>
>>> To use hvf support, please make sure to run -M virt,highmem=off to fit
>>> in M1's physical address space limits and use -cpu host.
>>
>> Applied to target-arm.next, thanks (with the unnecessary #include
>> in patch 6 removed).
> 
> Turns out that the final patch breaks "make check-acceptance".
> All the orangepi boot tests timeout:
> 
>  (15/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '15-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/...
> (90.24 s)
>  (16/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '16-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang...
> (90.24 s)
>  (17/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '17-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tes...
> (90.24 s)

Works for me on x86_64 Fedora 34 built with
--enable-trace-backends=log --enable-debug:

$ ./tests/venv/bin/avocado run
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
Fetching asset from
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi
Fetching asset from
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd
Fetching asset from
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd
Fetching asset from
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
Fetching asset from
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd
Fetching asset from
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08
Fetching asset from
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9
Fetching asset from
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9
JOB ID     : b19f151f7320def3a432255f3a99c0dde3da95c0
JOB LOG    :
/home/phil/avocado/job-results/job-2021-09-20T18.12-b19f151/job.log
 (1/5)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
PASS (6.29 s)
 (2/5)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd:
PASS (51.23 s)
 (3/5)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd:
PASS (76.53 s)
 (4/5)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08:
SKIP: storage limited
 (5/5)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9:
SKIP: storage limited
RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 2 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 135.18 s

