Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66946673AAA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:46:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVFa-0001Zo-1f; Thu, 19 Jan 2023 08:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIVFP-0001Ov-S3
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:46:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIVFN-00049i-OO
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:46:31 -0500
Received: by mail-wr1-x42a.google.com with SMTP id z5so1911145wrt.6
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 05:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3/LZW3PmpdXlxZ0fOjBSrkyY10AW7C/jltZnooLW4/I=;
 b=M3nYdZHZQt2/o88LKNlRX8M0QGvNihLLkI7dpQ6lQJTnzRk1NpkETtmO1wxxgXMZOI
 ywMDW9/mrL/87cKta8mYJHqaIHS3o55znIZKTGv2M/8DW1siAP+0FQWk8eZ2MErf6snk
 B42R6CuoQDJrQ2CR7GsWnWxARKRSwlK6nXOegZHmCngx5yOoqMK6vOyzcjMckI2WUalD
 oYnqRNXuY5MeiKVBBS1WO2/1u52G58CPtmPO4UTXCZo5RJ61eMtyQvGkjcqZfi4Yr+mv
 j7iFlB9WeDv03j18SYvqwStlGACoIWWnks6SVUZvEgoa3+6NvmT0yVjJqRjWKhclYLNs
 SLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3/LZW3PmpdXlxZ0fOjBSrkyY10AW7C/jltZnooLW4/I=;
 b=O8oH+VOEFwMaHTv/NxRrgEJ3qgPqhXYUUo7QgqVtogOAQp9RPbN2m6GhvYMrWvFm4N
 +LVnQxFTAmGvzR1X3bJh7UZsuC6+nfWP524CziumGvopbcRviA40PrhkQ875QjAtgIkr
 X9OxEry3qT9G3xN7040XbUP0iaMeAS7M+qzjV5yvnlMeyNOLWzF54V7hRxjBuX001lkP
 rLHb5nZ/VqLvL6c7mEY16O9S5b4p4IiresAOYxE9uVrWdnsps8Ky0WdcdHNPBXHimrYC
 83tom4sWVrM5lAFsbF0H+VhBh3WzsfzMyX/GDNkGAV8/C/co65e7os/oOckixA+s078U
 FS1g==
X-Gm-Message-State: AFqh2kpl0B+mMBGBak8zsG1tLEc7ylSxBJ1JzoqZPie7I0CF50ZXUYPz
 6G7iOJR0uH73TTMqWOJRkr94wQ==
X-Google-Smtp-Source: AMrXdXsLudCCY6n2BBffHZs3NSEZ4Jx+gvTKbeJ9a9qj1uQ/7+d+e4veVgtay4lzyJDHcqbeBNBiMQ==
X-Received: by 2002:a5d:6447:0:b0:2be:34f9:5284 with SMTP id
 d7-20020a5d6447000000b002be34f95284mr4357277wrw.48.1674135988056; 
 Thu, 19 Jan 2023 05:46:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b00286ad197346sm33665783wrq.70.2023.01.19.05.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:46:27 -0800 (PST)
Message-ID: <d8da1d01-c87d-a226-0914-448a7da144c5@linaro.org>
Date: Thu, 19 Jan 2023 14:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>
References: <20230118193518.26433-1-farosas@suse.de>
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org> <87bkmu1z8v.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87bkmu1z8v.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 19/1/23 13:32, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 18/1/23 20:34, Fabiano Rosas wrote:
>>> These are the already reviewed patches from the first half of my
>>> previous series:
>>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>>
>>> This unbreaks the --disable-tcg build, but there are issues in runtime
>>> that are still being hashed out in the other series.

Are you saying, we can *link* this configuration but not *run* it yet?

>>> For the build _with_ TCG, this should behave the same as master.
>>>
>>> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
>>> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org
>>>
>>> Claudio Fontana (5):
>>>     target/arm: rename handle_semihosting to tcg_handle_semihosting
>>>     target/arm: wrap psci call with tcg_enabled
>>>     target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
>>>     target/arm: move helpers to tcg/
>>>     target/arm: Move psci.c into the tcg directory
>>>
>>> Fabiano Rosas (15):
>>>     target/arm: Move PC alignment check
>>>     target/arm: Move cpregs code out of cpu.h
>>>     target/arm: Move cpregs code into cpregs.c
>>>     target/arm: Move define_debug_regs() to cpregs.c
>>>     target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
>>>     target/arm: move translate modules to tcg/
>>>     target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
>>>     target/arm: Move hflags code into the tcg directory
>>>     target/arm: Move regime_using_lpae_format into internal.h
>>>     target/arm: Don't access TCG code when debugging with KVM
>>>     cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
>>>     target/arm: Move cortex sysregs into cpregs.c
>>>     tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
>>>     tests/avocado: Skip tests that require a missing accelerator
>>>     tests/avocado: Tag TCG tests with accel:tcg
>>
>> Testing on Darwin:
>>
>> 14/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp
>>   
>> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code
>> should not be reached
>> 17/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test
>>           qemu-system-aarch64: unknown type 'arm-gicv3'
>> 18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
>> qemu-system-aarch64: -accel tcg: invalid accelerator tcg
>> 19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
>> qemu-system-aarch64: No machine specified, and there is no default
>> 20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
>> qemu-system-aarch64: -accel tcg: invalid accelerator tcg
>>
>> Reproducers:
>>
>> $ ./qemu-system-aarch64 -display none -S -M mps3-an547 -accel qtest
>> -monitor stdio
>> QEMU 7.2.50 monitor - type 'help' for more information
>> (qemu) gva2gpa 0
>> **
>> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code
>> should not be reached
>> Bail out!
>> ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code
>> should not be reached
>> Abort trap: 6
>>
>>       frame #4: 0x0000000101fdd6cc
>> libglib-2.0.0.dylib`g_assertion_message_expr + 116
>>       frame #5: 0x0000000100360ce0
>> qemu-system-aarch64`arm_v7m_mmu_idx_for_secstate(env=<unavailable>,
>> secstate=<unavailable>) at helper.c:2495:5
>>       frame #6: 0x000000010035f7f4
>> qemu-system-aarch64`arm_mmu_idx_el(env=<unavailable>, el=<unavailable>)
>> at helper.c:2514:16
>>       frame #7: 0x00000001002d17ec
>> qemu-system-aarch64`arm_cpu_get_phys_page_attrs_debug(cs=<unavailable>,
>> addr=0, attrs=0x000000016fdfda50) at ptw.c:2982:23
>>       frame #8: 0x00000001003c660c
>> qemu-system-aarch64`hmp_gva2gpa(mon=0x000060000390f0c0,
>> qdict=<unavailable>) at misc.c:714:12
>>
>> $ ./qemu-system-aarch64 -display none -machine sbsa-ref -accel qtest
>> qemu-system-aarch64: unknown type 'arm-gicv3'
>> Abort trap: 6
>>
>>       frame #2: 0x00000001958522c8 libsystem_c.dylib`abort + 180
>>       frame #3: 0x00000001003d32e8
>> qemu-system-aarch64`qdev_new(name="arm-gicv3") at qdev.c:164:9
>>       frame #4: 0x00000001002f30d4 qemu-system-aarch64`sbsa_ref_init
>> [inlined] create_gic(sms=0x0000000103ff0d10) at sbsa-ref.c:405:16
>>       frame #5: 0x00000001002f30a0
>> qemu-system-aarch64`sbsa_ref_init(machine=0x0000000103ff0d10) at
>> sbsa-ref.c:773:5
>>       frame #6: 0x00000001000905c0
>> qemu-system-aarch64`machine_run_board_init(machine=0x0000000103ff0d10,
>> mem_path=<unavailable>, errp=<unavailable>) at machine.c:1404:5
> 
> Are these errors without TCG?

Yes.

> If so they will be fixed by the other half
> of the series by removing the machines/cpus that depend on TCG. Nothing
> against fixing this now in the specific tests, of course, but a user on
> the cmdline would also hit these.

I ran 'make check' which calls 'make check-qtest' -> 'make 
check-qtest-aarch64'.

