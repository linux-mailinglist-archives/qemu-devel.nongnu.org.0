Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53312669B2A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGLRE-0000Xd-Fn; Fri, 13 Jan 2023 09:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGLQx-0000W5-1E
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:53:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGLQv-0003NH-Ak
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:53:30 -0500
Received: by mail-wr1-x429.google.com with SMTP id r2so21304236wrv.7
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nl1xDVoqTlRUrHVPCcsKQv1teTsrFu7kGyxVIDa0GVU=;
 b=MZbGzEfGbVm9eML+3U8PkBQctaaR5+ehiq9NCikiqrFt+qwz+Rr9puCy9RfDaj9b7b
 ooca3VA99+FMzGuRw9S+5fWSiZGvN9ercyZbQ1S9tu91M87g9laXLzFm9rXEJoLrlfRB
 K3kbJIAgplTds3FlUVqrQABM/I/AfJzz0DgRvsuAhMF6Hy6c8ixxIG1S/uG6YliElZX5
 XNkkQZ1LIybpmZuxmHxF6HqDmGrKVEymm2J5hze+TmAjWjN/s+ysro3FwYub/dsFwmBK
 jAw6uQE+JWT2SmKlXuIwjRAIpp0kKmGa5cgVVy5Ch67upbGamOBZZiWW/IOQi6z4ETwP
 idQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nl1xDVoqTlRUrHVPCcsKQv1teTsrFu7kGyxVIDa0GVU=;
 b=2W7Hkup5DZ8HhRNWVCVFRIjB8JtFtPuo7oUnJutUd2mUb4iyRRyFPyYkDRY4Kq/Y76
 hkJ5MdnJvHeAZ9aUtKfsV2P31sWC/Nah1ZKD9whI/gcZVmLWvVe1zAS6J+4C5ipo595f
 K5iv7Bx/TUlm8m+f/vLC2VLZPA44aH1Ea7VapraiYSP836VokUdGBIfU3BVxd5UMSmus
 Ycf2RxBU4RH3tFcUR760GJELaEMDMGMXJG5t7yi4eNz1wdLnhIBdQR1or6KG9JTPeXr9
 Q9r3kzPali+bEAvTqy9K2P/GnBeVpVHvY8eVrjF4do1bukgjWs7FbkyXFbUDFvvayih9
 rm2A==
X-Gm-Message-State: AFqh2kqUYrysrv8Ik8u/wBmIQPlsfbE/JQySFOye9nrWClOc7FZrGZNJ
 bWY4cylZs6uzWP9bdkxTu0w/EQ==
X-Google-Smtp-Source: AMrXdXt14O2mEpW8vBQ1lLpIJTzQ4CV7ey9NU+GYT7DZIGbFh4eLwvMgekHX5hyhoNKC1bOqRRr/Qw==
X-Received: by 2002:a5d:4a4f:0:b0:2bb:f255:6bb4 with SMTP id
 v15-20020a5d4a4f000000b002bbf2556bb4mr13823940wrs.25.1673621607303; 
 Fri, 13 Jan 2023 06:53:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l7-20020a5d6747000000b002b57bae7174sm19236567wrw.5.2023.01.13.06.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 06:53:26 -0800 (PST)
Message-ID: <1f632a48-981a-95a0-6527-e0bb65034d92@linaro.org>
Date: Fri, 13 Jan 2023 15:53:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND v2 0/5] target: Restrict 'qapi-commands-machine.h'
 to system emulation
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
References: <20221220111122.8966-1-philmd@linaro.org>
 <87y1q61qrz.fsf@pond.sub.org>
 <d8f97300-561a-6958-05a3-2789d139f9c4@linaro.org>
In-Reply-To: <d8f97300-561a-6958-05a3-2789d139f9c4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 13/1/23 15:42, Philippe Mathieu-Daudé wrote:
> On 13/1/23 14:57, Markus Armbruster wrote:
>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>
>>> [resend fixing my last name typography...]
>>>
>>> All series reviewed, can patches be picked by corresponding
>>> maintainers?
>>>
>>> The "qapi-commands-machine.h" header is not generated in user-only
>>> emulation. This series removes its use in user-emu code by moving
>>> the QMP code depending on this header into a separate sysemu unit.
>>>
>>> Since v1:
>>> - renamed cpu-monitor.c -> monitor.c on loongarch
>>
>> Quick drive-by remark: we usually name C files containing just QMP
>> commands SUBSYSTEM-qmp-cmds.c, and files containing just HMP commands
>> SUBSYSTEM-hmp-cmds.c.  On the other hand, the existing monitor-related
>> files seem to be named target/TARGET/monitor.c.
>>
>> Keeping QMP and HMP two separate is desirable, but not required.
>> monitor.c is a fine name for a file containing both.
> 
> $ git ls-files | fgrep qmp-cmds.c
> block/monitor/bitmap-qmp-cmds.c
> hw/core/machine-qmp-cmds.c
> hw/pci/pci-qmp-cmds.c
> monitor/qmp-cmds.c
> qom/qom-qmp-cmds.c
> tests/unit/test-qmp-cmds.c
> 
> $ git ls-files | fgrep monitor.c
> monitor/monitor.c
> softmmu/qdev-monitor.c
> stubs/monitor.c
> target/arm/monitor.c
> target/i386/monitor.c
> target/m68k/monitor.c
> target/mips/sysemu/monitor.c
> target/nios2/monitor.c
> target/ppc/monitor.c
> target/riscv/monitor.c
> target/sh4/monitor.c
> target/sparc/monitor.c
> target/xtensa/monitor.c
> tests/unit/test-util-filemonitor.c
> 
> Do you rather 'cpu-qmp-cmds.c'?
> 
> Or is your SUBSYSTEM the $target here?
> Because , target/arm/arm-qmp-cmds.c sounds redundant.

IIUC the SUBSYSTEM is "target" so maybe you meant target-qmp-cmds.c?

