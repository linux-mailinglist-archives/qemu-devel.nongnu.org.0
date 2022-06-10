Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43056546978
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 17:37:26 +0200 (CEST)
Received: from localhost ([::1]:55524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzghQ-0004ps-Um
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 11:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgfu-0003qo-U9; Fri, 10 Jun 2022 11:35:50 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgft-0002SM-8O; Fri, 10 Jun 2022 11:35:50 -0400
Received: by mail-pg1-x530.google.com with SMTP id h192so18316076pgc.4;
 Fri, 10 Jun 2022 08:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IVRhQTQWOalqB/HHm1HM0Yh8KLRY+8/QMzEpkCNeFg0=;
 b=g2wYJEfWUY0N7ttSQc97IHYk3WFmhLfK8gLTHx0IUjrKrhMBp5QcIsUaF+OqQWBCqD
 reo1ZGRz0FcUApEqju89jWqne6vrV8ti8Cyz6gZO6i0q0h14jZW9SFcKbbeFPviDWgbX
 9bVn20Xp02wd6jRT1Dcj8Uq8SeYVj8KWhohYPrZ6TifitIs3+tR8X3LZW/EcfQ6YQl0f
 /exnhRJwsuwG/puEFjaTBMXeBFO/mQMaz7sv87b+bp3lu2N1PZpLsQ0pvxNNkebwCLed
 2gYJV2lxfqqnMoRa1OBDGMRa7D3iTwPqCEB4DVD3qN7BphVpBPwVbe67w+64weamx8Je
 GH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IVRhQTQWOalqB/HHm1HM0Yh8KLRY+8/QMzEpkCNeFg0=;
 b=kCZ+FIfnApJImdpf25Vl323Pz3j3boykJ2JCk8JkgpP4EQgp3KpEaX1hFORDMqZUrS
 KAxt3JM7NVhyMcAQd5xQwI0qB0DjnZwBAs/Xohg7C1dUGgKLXzdsImeYFo9aGPsidR6k
 4SuvSH5LcvQCsqpZbXLQ1Mm14w1pBR/uOoINJnYaD016K58JKy79nOsFXgGvl8edSIiX
 se3XRWSHwwnLZd8t8ilqZALCiD8/zYs4YqLlrpAzU3Dvqz3y5vOAjjc7rX6xz4wHWVsn
 +rfSBF9dt9iv4Bj/veu+aqDTAILrOVqRt+G1pvBEyVIWfNOltQMeXX5P+MADfYNHf7Pf
 6/Nw==
X-Gm-Message-State: AOAM531EFiwMiNRu+tsNpmc0IWYaG8CerM5hTHq3kf8gA0xneru0lpir
 C7zkZpKtMJ0NIbCUJuxQUsc=
X-Google-Smtp-Source: ABdhPJwIOdQyQ3bKdPos5MnD14BBiylXt73nlmk5K+qEdL51AZmM98DgLJXopm7Afr+O69+J6DRnLQ==
X-Received: by 2002:a63:8a42:0:b0:3fc:f8b5:291f with SMTP id
 y63-20020a638a42000000b003fcf8b5291fmr37254465pgd.550.1654875347559; 
 Fri, 10 Jun 2022 08:35:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a17090a058100b001e2fed48f48sm1873598pji.41.2022.06.10.08.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 08:35:47 -0700 (PDT)
Message-ID: <aee30abd-bfad-d023-ae38-ad1600b02016@amsat.org>
Date: Fri, 10 Jun 2022 17:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 00/50] PS2 device QOMification - part 1
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <9608d355-8582-69e0-50ee-de48e0ef561f@ilande.co.uk>
In-Reply-To: <9608d355-8582-69e0-50ee-de48e0ef561f@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 7/6/22 17:54, Mark Cave-Ayland wrote:
> On 22/05/2022 19:17, Mark Cave-Ayland wrote:
> 
>> This series came about when looking at improving the LASI PS2 device for
>> the HPPA machine: there were improvements that I was keen to make, but
>> was restricted because the PS2 device(s) weren't QOMified.
>>
>> Trying to do everything in a single patchset would be a very large series
>> indeed, so here is part 1 of the series which does the basic QOMification
>> process and consists of:
>>
>> - QOMifying the basic PS2, PS2 keyboard and PS2 mouse types
>>
>> - Moving any functionality that exists in a global device init function
>>    directly into the relevant device, so that all device behaviour is
>>    configured using qdev properties and QOM
>>
>> - Introducing a new I8042_MMIO type for use by the MIPS magnum machine
>>
>> - Switch all PS2 devices to use qdev gpios for IRQs instead of using the
>>    update_irq() callback function along with the update_arg opaque
>>
>> Once this work has been done, a follow-up part 2 series will finish the
>> remainder of the work which involves i) improving the QOM object model
>> now QOMification is complete and ii) removing the legacy global device
>> init functions for PS2 and related devices.
>>
>> Testing for this series has comprised of booting a machine with each type
>> of PS2 device and confirming that i) the machine responds to keypresses
>> when using a graphical console and ii) completing a successful migration
>> from a machine with this series applies back to a machine running latest
>> git master. The test machines I used were:
>>
>> - qemu-system-x86_64 -M pc for the I8042 device
>> - qemu-system-hppa for the LASIPS2 device
>> - qemu-system-arm -M versatilepb for the PL050 device
>> - qemu-system-mips64el -M magnum for the I8042_MMIO device
>>
>> Finally the QOM tree changes caused by QOMification of the PS2 devices
>> trigger a failure due to a bug in the bios-tables-test qtest for subtest
>> /x86_64/acpi/q35/viot. This can be fixed by applying the series at
>> https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg04266.html
>> "hw/acpi/viot: generate stable VIOT ACPI tables" first.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>>
>> Mark Cave-Ayland (50):
>>    ps2: checkpatch fixes
>>    ps2: QOMify PS2State
>>    ps2: QOMify PS2KbdState
>>    ps2: QOMify PS2MouseState
>>    ps2: move QOM type definitions from ps2.c to ps2.h
>>    ps2: improve function prototypes in ps2.c and ps2.h
>>    ps2: introduce PS2DeviceClass
>>    ps2: implement ps2_reset() for the PS2_DEVICE QOM type based upon
>>      ps2_common_reset()
>>    ps2: remove duplicate setting of scancode_set in ps2_kbd_init()
>>    ps2: implement ps2_kbd_realize() and use it to register
>>      ps2_keyboard_handler
>>    ps2: implement ps2_mouse_realize() and use it to register
>>      ps2_mouse_handler
>>    ps2: don't use vmstate_register() in ps2_kbd_init()
>>    ps2: don't use vmstate_register() in ps2_mouse_init()
>>    pl050: checkpatch fixes
>>    pl050: split pl050_update_irq() into separate pl050_set_irq() and
>>      pl050_update_irq() functions
>>    lasips2: spacing fixes
>>    lasips2: rename ps2dev_update_irq() to lasips2_port_set_irq()
>>    pckbd: checkpatch fixes
>>    pckbd: move KBDState from pckbd.c to i8042.h
>>    pckbd: move ISAKBDState from pckbd.c to i8042.h

> Ping? I've had an R-B from Phil for patches 1-20 along with a Tested-by 
> from Helge for the entire series, but that still leaves the last 30 
> patches unreviewed...

I'm queuing patches 1-20 (fixing the typo in patch 9) via mips-next,
and will review v2.

