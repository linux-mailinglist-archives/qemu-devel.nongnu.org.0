Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8D46732B0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:42:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIPXz-0004Vd-Ak; Thu, 19 Jan 2023 02:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIPXw-0004VA-U5
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:41:17 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIPXm-0006FU-G7
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:41:16 -0500
Received: by mail-wr1-x435.google.com with SMTP id r2so945999wrv.7
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QLJZZ/xKF6K9vLVszmMBOOMFL0e4QgKdmUNSk7oF4f0=;
 b=XyBq2oXNhyLtGG5omd53Pm/J1qcw4o6bVNgeaAOds0gDKtcxbt6NTRinF+ARqeTQ6z
 pamG7T0OvX2BtDq7yyBVB3pQ8+LVCz2gAWkN8fIRjrpfYWUHvUF6QiABWxlz5/6lK8vj
 ovZoFGXfufn7qJGgvtqIbOaKaHkQui1U2rOiBUqi27wX+jRYV/LkIJ3s5Q9bd6G1ZoBY
 fGj1AuB6qswkqXH6k/i7KkXNqkU7FJrEIJ5MVlgmBktzPwwIPsKUGuf5iuQjoCnCnc+I
 Aprv9a3Nqao6G8tsQm7c7vnj/5F8OnDidKy72ZKz7XCe6u7xmb0PXCNSHRofcKh+7UCP
 YcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QLJZZ/xKF6K9vLVszmMBOOMFL0e4QgKdmUNSk7oF4f0=;
 b=cIEglk0qFQSJBRTIFWCtRBkXduUcwpz7QVibah/T6IH0NSElcQIfQDOQMlNWZ+ig5R
 CwFJHTdZ+tOxj/G7VBWiS51PAKjt+TUxxExSY2woa/xwFDaNjz65b0B+h5aadRBhLhR+
 w/BZhvG3zn2fzDiXGyzPis01NQh8asLajeLRIconTsh9G1q6ic1byrssGHkx3Eqp3Hmu
 E7w/Qh5w90EiR8VahMEJ8gAJrWvKDzbFvml3Y/pZ5SwRmt1O53StFg1V5mZOJU7y/W/D
 m53sdh+yQX9X0cnW/IiFuaeAFyHSNVgrxhnsVv90mdlAkgCsqqpmsZePTjEmupfoSf7U
 c44Q==
X-Gm-Message-State: AFqh2kqi1q1AGxj9dyizoOCiOs8I+HBjLUbUJwkT+vJZbHiJYM16H50C
 hWWASG57rFV0iKW5rPLKNB8TwQ==
X-Google-Smtp-Source: AMrXdXvWUp0ijWDHICHHw1oJJgcvmrhh6JoTZFAV/cYbr5y7R5SKSTE+zuH+z8fd6KPumELgQvE3kQ==
X-Received: by 2002:a5d:4591:0:b0:2bc:7dec:9588 with SMTP id
 p17-20020a5d4591000000b002bc7dec9588mr8596486wrq.54.1674114062468; 
 Wed, 18 Jan 2023 23:41:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f8-20020a0560001b0800b002423edd7e50sm32761517wrz.32.2023.01.18.23.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 23:41:02 -0800 (PST)
Message-ID: <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Date: Thu, 19 Jan 2023 08:41:00 +0100
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 18/1/23 20:34, Fabiano Rosas wrote:
> These are the already reviewed patches from the first half of my
> previous series:
> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
> 
> This unbreaks the --disable-tcg build, but there are issues in runtime
> that are still being hashed out in the other series.
> 
> For the build _with_ TCG, this should behave the same as master.
> 
> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org
> 
> Claudio Fontana (5):
>    target/arm: rename handle_semihosting to tcg_handle_semihosting
>    target/arm: wrap psci call with tcg_enabled
>    target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
>    target/arm: move helpers to tcg/
>    target/arm: Move psci.c into the tcg directory
> 
> Fabiano Rosas (15):
>    target/arm: Move PC alignment check
>    target/arm: Move cpregs code out of cpu.h
>    target/arm: Move cpregs code into cpregs.c
>    target/arm: Move define_debug_regs() to cpregs.c
>    target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
>    target/arm: move translate modules to tcg/
>    target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
>    target/arm: Move hflags code into the tcg directory
>    target/arm: Move regime_using_lpae_format into internal.h
>    target/arm: Don't access TCG code when debugging with KVM
>    cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
>    target/arm: Move cortex sysregs into cpregs.c
>    tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
>    tests/avocado: Skip tests that require a missing accelerator
>    tests/avocado: Tag TCG tests with accel:tcg

Testing on Darwin:

14/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp 
 
ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code 
should not be reached
17/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test 
         qemu-system-aarch64: unknown type 'arm-gicv3'
18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
qemu-system-aarch64: -accel tcg: invalid accelerator tcg
19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
qemu-system-aarch64: No machine specified, and there is no default
20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Reproducers:

$ ./qemu-system-aarch64 -display none -S -M mps3-an547 -accel qtest 
-monitor stdio
QEMU 7.2.50 monitor - type 'help' for more information
(qemu) gva2gpa 0
**
ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code 
should not be reached
Bail out! 
ERROR:../../target/arm/helper.c:2495:arm_v7m_mmu_idx_for_secstate: code 
should not be reached
Abort trap: 6

     frame #4: 0x0000000101fdd6cc 
libglib-2.0.0.dylib`g_assertion_message_expr + 116
     frame #5: 0x0000000100360ce0 
qemu-system-aarch64`arm_v7m_mmu_idx_for_secstate(env=<unavailable>, 
secstate=<unavailable>) at helper.c:2495:5
     frame #6: 0x000000010035f7f4 
qemu-system-aarch64`arm_mmu_idx_el(env=<unavailable>, el=<unavailable>) 
at helper.c:2514:16
     frame #7: 0x00000001002d17ec 
qemu-system-aarch64`arm_cpu_get_phys_page_attrs_debug(cs=<unavailable>, 
addr=0, attrs=0x000000016fdfda50) at ptw.c:2982:23
     frame #8: 0x00000001003c660c 
qemu-system-aarch64`hmp_gva2gpa(mon=0x000060000390f0c0, 
qdict=<unavailable>) at misc.c:714:12

$ ./qemu-system-aarch64 -display none -machine sbsa-ref -accel qtest
qemu-system-aarch64: unknown type 'arm-gicv3'
Abort trap: 6

     frame #2: 0x00000001958522c8 libsystem_c.dylib`abort + 180
     frame #3: 0x00000001003d32e8 
qemu-system-aarch64`qdev_new(name="arm-gicv3") at qdev.c:164:9
     frame #4: 0x00000001002f30d4 qemu-system-aarch64`sbsa_ref_init 
[inlined] create_gic(sms=0x0000000103ff0d10) at sbsa-ref.c:405:16
     frame #5: 0x00000001002f30a0 
qemu-system-aarch64`sbsa_ref_init(machine=0x0000000103ff0d10) at 
sbsa-ref.c:773:5
     frame #6: 0x00000001000905c0 
qemu-system-aarch64`machine_run_board_init(machine=0x0000000103ff0d10, 
mem_path=<unavailable>, errp=<unavailable>) at machine.c:1404:5


