Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BAE1CEEDD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 10:11:26 +0200 (CEST)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYQ0b-0005D5-FN
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 04:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jYPzG-00045u-FS
 for qemu-devel@nongnu.org; Tue, 12 May 2020 04:10:02 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jYPzE-0006Qm-P9
 for qemu-devel@nongnu.org; Tue, 12 May 2020 04:10:02 -0400
Received: by mail-wr1-x442.google.com with SMTP id e1so228331wrt.5
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 01:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YEas7VX0nKuVTKSQGXISoX01/3rG7mzxZxjH2RwFXSU=;
 b=PcIDKfpnIu4CkirRLbEKVfXvocdfurhg6r4SrZPfnBN6oS/k87obkWKPF7p1gIKl5i
 jbad4/LsEjCmBslM0RZTmRbTJqddFFJk0cKbUA4MUW4F8wDY3HMWaYcyag2zyKP/ktuD
 eksBj4H9emRTv3S+UVY1SJpkYSViDJLaOBwGPXGAgs2Ps+/i9S3AW0MAajXcwoZrZCTK
 IVNo6H8zKlefFlZmKfoBzluVzVblYKYVohq8LCpi/859H6KaN8g/OUMTfsQ3rY//4FZH
 jmvxtjvuozGhVNQJ3jmtHswo30YymKbfu3CjtlPzwsZdJTsLlneEL6/hUrY+YmwBIaQg
 7bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YEas7VX0nKuVTKSQGXISoX01/3rG7mzxZxjH2RwFXSU=;
 b=qSy2FEZLuVtI7LRMcuLFTAIuiUXQEHgHRus8Von9FGG/Ct2q+dP1aCxQ+wEA4yAmsQ
 cn68OCrf5K5He6vWTr2d1yXQ17xUD49W0fEEC82RhLb3JPsHaiJ2EkmD3A4Dt8/IRuOQ
 YxFk1gM0pttx1uSxFXyAWLeAfuK5frVxoiYUNQhDjFk/d23w2DyJ/xFUjic4akjREpdb
 rt9K5yZJfGVe5qpY3v43DfV+BH0ozktfqxeLkWpUsYt1MN8fC/m3psIX+3ZUoCgDz0ll
 ThcLBvzYuuRe6rEDjBK0My5FE3ovq+//1gE/IvfsuSG5VIJjGz3aQXn2Vsecu75hIyf2
 LqEQ==
X-Gm-Message-State: AGi0PubrbbOENDXnk5u3Z8e7zVc7iEmevoehyWk9OxHqD3FHyKhinSIi
 o4zivRGThr24/gwF7kBMYNc=
X-Google-Smtp-Source: APiQypK8mXj6M864BQp8g7CdWjAO3rrzqwHw8pqi8JD/zd42vu2UAXON5OAg5uBTgQsRW0yay02Fgg==
X-Received: by 2002:adf:c651:: with SMTP id u17mr24194839wrg.416.1589270999127; 
 Tue, 12 May 2020 01:09:59 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id q14sm22398894wrc.66.2020.05.12.01.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2020 01:09:58 -0700 (PDT)
Subject: Re: [PATCH 04/12] hw/mips/fuloong2e: Fix typo in Fuloong machine name
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 chen huacai <zltjiangshi@gmail.com>
References: <20200510210128.18343-1-f4bug@amsat.org>
 <20200510210128.18343-5-f4bug@amsat.org>
 <CABDp7VoD-ieFO+ijrKyCpKWQkLknD3Z+CzmvrkLPfmY7pedOzA@mail.gmail.com>
 <CAHiYmc59K25gXM29R9PiyPgW1n9xO-O4PGMumAz13vCQHZyujw@mail.gmail.com>
 <b6a1017a-c20d-66df-2a4d-1d453ca14259@amsat.org>
 <CABDp7VpFCQgmL4PhZZQR4AoHmRrSpa--JTYK4gzD3_G1cvTGGw@mail.gmail.com>
 <CAHiYmc7=xhnp3JL6xrQE1SxYbyBe+6nWxbT54mgw8k-BTDkELg@mail.gmail.com>
 <CAHiYmc7G7R6oYu1ZwXJau6pWVmRV563aLM4jGAAjdU+F1MB+2g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a52163ab-0a17-ffb5-0512-a8413cf5d8ed@amsat.org>
Date: Tue, 12 May 2020 10:09:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAHiYmc7G7R6oYu1ZwXJau6pWVmRV563aLM4jGAAjdU+F1MB+2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Huacai Chen <chenhuacai@gmail.com>, qemu-level <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Huacai Chen <chenhc@lemote.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/20 10:27 AM, Aleksandar Markovic wrote:
> пон, 11. мај 2020. у 10:12 Aleksandar Markovic
> <aleksandar.qemu.devel@gmail.com> је написао/ла:
>>
>> пон, 11. мај 2020. у 08:52 chen huacai <zltjiangshi@gmail.com> је написао/ла:
>>>
>>> Hi, Philippe and Alexandar,
>>>
>>> On Mon, May 11, 2020 at 2:38 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> On 5/11/20 8:21 AM, Aleksandar Markovic wrote:
>>>>> пон, 11. мај 2020. у 03:11 chen huacai <zltjiangshi@gmail.com> је написао/ла:
>>>>>>
>>>>>> Hi, Philippe,
>>>>>>
>>>>>> On Mon, May 11, 2020 at 5:06 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>>>>
>>>>>>> We always miswrote the Fuloong machine... Fix its name.
>>>>>>> Add an machine alias to the previous name for backward
>>>>>>> compatibility.
>>>>>>>
>>>>>>> Suggested-by: Aleksandar Markovic <amarkovic@wavecomp.com>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>> ---
>>>>>>>    docs/system/target-mips.rst              |  2 +-
>>>>>>>    default-configs/mips64el-softmmu.mak     |  2 +-
>>>>>>>    hw/isa/vt82c686.c                        |  2 +-
>>>>>>>    hw/mips/{mips_fulong2e.c => fuloong2e.c} | 46 ++++++++++++------------
>>>>>> Use mips_fuloong2e.c instead of fuloong2e.c? Other machine file names
>>>>>> also have a "mips_" prefix.
>>>>>>
>>>>>
>>>>> I would leave mips_ prefix for Fuloong, and actually add it to Boston
>>>>> source file, so that we are finally consistent across all MIPS
>>>>> machines.
>>>>>
>>>>> What do you think?
>>>>
>>>> These names were used years ago when all hardware was in the same hw/
>>>> directory, not sorted per target. Now new machines don't use the target
>>>> as prefix name. I'd clean the other way around, and dropping the 'mips_'
>>>> prefix. The positive side is we can 5 more characters to better describe
>>>> a patch while limited by the 72 chars in the subject :)
>>>
>>> All having the prefix, or all dropping the prefix, are both good for
>>> me, just keep consistency.
>>>
>>> Huacai
>>>
>>
>> Philippe, Huacai,
>>
>> Prefix or not, I have mixed feelings. I had consistency more in mind
>> than prefix.
>>
>> So it seems the prevailing opinion is slightly on the side of dropping
>> prefix "mips_".
>>
>> Philippe, if it is not too difficult, could you perhaps make dropping
>> that prefix for all source file names in hw/mips a part of the this
>> series (not to complicate situation with a separate series) in its
>> follow-up version (but perhaps keep that change(s) in separate
>> patch(es))?

Certainly not difficult, but I won't take that as a priority.
I already spend more time trying to document better the MIPS commits, as 
it is important to you, and it also serves the community. Regarding 
unifying the file names I don't care much, so I'll not rename this file 
to stop bikeshredding on futile topics and keep focus on the technical 
changes of the patches.

>>
> 
> Conveniently enough, most of involved files do not have checkpatch
> warnings and errors:
> 
> $ ../../scripts/checkpatch.pl --strict -f ./mips_fulong2e.c
> total: 0 errors, 0 warnings, 404 lines checked
> 
> ./mips_fulong2e.c has no obvious style problems and is ready for submission.
> $ ../../scripts/checkpatch.pl --strict -f ./mips_malta.c
> ERROR: if this code is redundant consider removing it
> #430: FILE: ./mips_malta.c:430:
> +#if 0
> 
> ERROR: if this code is redundant consider removing it
> #518: FILE: ./mips_malta.c:518:
> +#if 0
> 
> total: 2 errors, 0 warnings, 1458 lines checked
> 
> ./mips_malta.c has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> $ ../../scripts/checkpatch.pl --strict -f ./mips_mipssim.c
> total: 0 errors, 0 warnings, 246 lines checked
> 
> ./mips_mipssim.c has no obvious style problems and is ready for submission.
> $ ../../scripts/checkpatch.pl --strict -f ./mips_r4k.c
> total: 0 errors, 0 warnings, 318 lines checked
> 
> ./mips_r4k.c has no obvious style problems and is ready for submission.
> 
> 
> Maybe we should also finally get rid of these segments in mips_malta.c:
> 
> #if 0
>          printf("malta_fpga_read: Bad register offset 0x" TARGET_FMT_lx "\n",
>                 addr);
> #endif
> 
> and
> 
> #if 0
>          printf("malta_fpga_write: Bad register offset 0x" TARGET_FMT_lx "\n",
>                 addr);
> #endif
> 
> possibly replacing them with some logging?

Yes, I had it done before the checkpatch fixes on hw/mips/, now I have 
to rebase. Instead I postpone for the day I find interest in playing 
with the Malta. Remember this is a hobbyist board (the Boston being the 
corporate quality one).

> 
> Philippe?
> 
> Thanks,
> Aleksandar
> 
> 
> 
>> Sincerely,
>> Aleksandar
>>
>>>>
>>>>>
>>>>> Aleksandar
>>>>>
>>>>>> Huacai
>>>>>>>    hw/pci-host/bonito.c                     |  8 ++---
>>>>>>>    tests/qtest/endianness-test.c            |  2 +-
>>>>>>>    MAINTAINERS                              |  4 +--
>>>>>>>    hw/mips/Kconfig                          |  2 +-
>>>>>>>    hw/mips/Makefile.objs                    |  2 +-
>>>>>>>    9 files changed, 36 insertions(+), 34 deletions(-)
>>>>>>>    rename hw/mips/{mips_fulong2e.c => fuloong2e.c} (91%)
>>>>>>>
>>>>>>> diff --git a/docs/system/target-mips.rst b/docs/system/target-mips.rst
>>>>>>> index 2736fd0509..cd2a931edf 100644
>>>>>>> --- a/docs/system/target-mips.rst
>>>>>>> +++ b/docs/system/target-mips.rst
>>>>>>> @@ -74,7 +74,7 @@ The MIPS Magnum R4000 emulation supports:
>>>>>>>
>>>>>>>    -  G364 framebuffer
>>>>>>>
>>>>>>> -The Fulong 2E emulation supports:
>>>>>>> +The Fuloong 2E emulation supports:
>>>>>>>
>>>>>>>    -  Loongson 2E CPU
>>>>>>>
>>>>>>> diff --git a/default-configs/mips64el-softmmu.mak b/default-configs/mips64el-softmmu.mak
>>>>>>> index 8b0c9b1e15..9f8a3ef156 100644
>>>>>>> --- a/default-configs/mips64el-softmmu.mak
>>>>>>> +++ b/default-configs/mips64el-softmmu.mak
>>>>>>> @@ -2,7 +2,7 @@
>>>>>>>
>>>>>>>    include mips-softmmu-common.mak
>>>>>>>    CONFIG_IDE_VIA=y
>>>>>>> -CONFIG_FULONG=y
>>>>>>> +CONFIG_FULOONG=y
>>>>>>>    CONFIG_ATI_VGA=y
>>>>>>>    CONFIG_RTL8139_PCI=y
>>>>>>>    CONFIG_JAZZ=y
>>>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>>>> index d9b51fce8d..fac4e56b7d 100644
>>>>>>> --- a/hw/isa/vt82c686.c
>>>>>>> +++ b/hw/isa/vt82c686.c
>>>>>>> @@ -503,7 +503,7 @@ static void via_class_init(ObjectClass *klass, void *data)
>>>>>>>        dc->vmsd = &vmstate_via;
>>>>>>>        /*
>>>>>>>         * Reason: part of VIA VT82C686 southbridge, needs to be wired up,
>>>>>>> -     * e.g. by mips_fulong2e_init()
>>>>>>> +     * e.g. by mips_fuloong2e_init()
>>>>>>>         */
>>>>>>>        dc->user_creatable = false;
>>>>>>>    }
>>>>>>> diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/fuloong2e.c
>>>>>>> similarity index 91%
>>>>>>> rename from hw/mips/mips_fulong2e.c
>>>>>>> rename to hw/mips/fuloong2e.c
>>>>>>> index 4e1a3646af..624c46a4fd 100644
>>>>>>> --- a/hw/mips/mips_fulong2e.c
>>>>>>> +++ b/hw/mips/fuloong2e.c
>>>>>>> @@ -1,5 +1,5 @@
>>>>>>>    /*
>>>>>>> - * QEMU fulong 2e mini pc support
>>>>>>> + * QEMU fuloong 2e mini pc support
>>>>>>>     *
>>>>>>>     * Copyright (c) 2008 yajin (yajin@vm-kernel.org)
>>>>>>>     * Copyright (c) 2009 chenming (chenming@rdc.faw.com.cn)
>>>>>>> @@ -11,8 +11,8 @@
>>>>>>>     */
>>>>>>>
>>>>>>>    /*
>>>>>>> - * Fulong 2e mini pc is based on ICT/ST Loongson 2e CPU (MIPS III like, 800MHz)
>>>>>>> - * http://www.linux-mips.org/wiki/Fulong
>>>>>>> + * Fuloong 2e mini pc is based on ICT/ST Loongson 2e CPU (MIPS III like, 800MHz)
>>>>>>> + * https://www.linux-mips.org/wiki/Fuloong_2E
>>>>>>>     *
>>>>>>>     * Loongson 2e user manual:
>>>>>>>     * http://www.loongsondeveloper.com/doc/Loongson2EUserGuide.pdf
>>>>>>> @@ -46,13 +46,13 @@
>>>>>>>    #include "sysemu/reset.h"
>>>>>>>    #include "qemu/error-report.h"
>>>>>>>
>>>>>>> -#define DEBUG_FULONG2E_INIT
>>>>>>> +#define DEBUG_FULOONG2E_INIT
>>>>>>>
>>>>>>>    #define ENVP_ADDR               0x80002000l
>>>>>>>    #define ENVP_NB_ENTRIES         16
>>>>>>>    #define ENVP_ENTRY_SIZE         256
>>>>>>>
>>>>>>> -/* fulong 2e has a 512k flash: Winbond W39L040AP70Z */
>>>>>>> +/* Fuloong 2e has a 512k flash: Winbond W39L040AP70Z */
>>>>>>>    #define BIOS_SIZE               (512 * KiB)
>>>>>>>    #define MAX_IDE_BUS             2
>>>>>>>
>>>>>>> @@ -69,12 +69,12 @@
>>>>>>>     * 2, use "Bonito2edev" to replace "dir_corresponding_to_your_target_hardware"
>>>>>>>     * in the "Compile Guide".
>>>>>>>     */
>>>>>>> -#define FULONG_BIOSNAME "pmon_2e.bin"
>>>>>>> +#define FULOONG_BIOSNAME "pmon_2e.bin"
>>>>>>>
>>>>>>> -/* PCI SLOT in fulong 2e */
>>>>>>> -#define FULONG2E_VIA_SLOT        5
>>>>>>> -#define FULONG2E_ATI_SLOT        6
>>>>>>> -#define FULONG2E_RTL8139_SLOT    7
>>>>>>> +/* PCI SLOT in Fuloong 2e */
>>>>>>> +#define FULOONG2E_VIA_SLOT        5
>>>>>>> +#define FULOONG2E_ATI_SLOT        6
>>>>>>> +#define FULOONG2E_RTL8139_SLOT    7
>>>>>>>
>>>>>>>    static struct _loaderparams {
>>>>>>>        int ram_size;
>>>>>>> @@ -279,7 +279,7 @@ static void network_init(PCIBus *pci_bus)
>>>>>>>            const char *default_devaddr = NULL;
>>>>>>>
>>>>>>>            if (i == 0 && (!nd->model || strcmp(nd->model, "rtl8139") == 0)) {
>>>>>>> -            /* The fulong board has a RTL8139 card using PCI SLOT 7 */
>>>>>>> +            /* The Fuloong board has a RTL8139 card using PCI SLOT 7 */
>>>>>>>                default_devaddr = "07";
>>>>>>>            }
>>>>>>>
>>>>>>> @@ -287,7 +287,7 @@ static void network_init(PCIBus *pci_bus)
>>>>>>>        }
>>>>>>>    }
>>>>>>>
>>>>>>> -static void mips_fulong2e_init(MachineState *machine)
>>>>>>> +static void mips_fuloong2e_init(MachineState *machine)
>>>>>>>    {
>>>>>>>        const char *kernel_filename = machine->kernel_filename;
>>>>>>>        const char *kernel_cmdline = machine->kernel_cmdline;
>>>>>>> @@ -316,11 +316,12 @@ static void mips_fulong2e_init(MachineState *machine)
>>>>>>>            error_report("Invalid RAM size, should be 256MB");
>>>>>>>            exit(EXIT_FAILURE);
>>>>>>>        }
>>>>>>> -    memory_region_add_subregion(address_space_mem, 0, machine->ram);
>>>>>>>
>>>>>>> -    /* Boot ROM */
>>>>>>> -    memory_region_init_rom(bios, NULL, "fulong2e.bios", BIOS_SIZE,
>>>>>>> +    /* allocate RAM */
>>>>>>> +    memory_region_init_rom(bios, NULL, "fuloong2e.bios", BIOS_SIZE,
>>>>>>>                               &error_fatal);
>>>>>>> +
>>>>>>> +    memory_region_add_subregion(address_space_mem, 0, machine->ram);
>>>>>>>        memory_region_add_subregion(address_space_mem, 0x1fc00000LL, bios);
>>>>>>>
>>>>>>>        /*
>>>>>>> @@ -337,7 +338,7 @@ static void mips_fulong2e_init(MachineState *machine)
>>>>>>>            write_bootloader(env, memory_region_get_ram_ptr(bios), kernel_entry);
>>>>>>>        } else {
>>>>>>>            if (bios_name == NULL) {
>>>>>>> -                bios_name = FULONG_BIOSNAME;
>>>>>>> +                bios_name = FULOONG_BIOSNAME;
>>>>>>>            }
>>>>>>>            filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
>>>>>>>            if (filename) {
>>>>>>> @@ -363,7 +364,7 @@ static void mips_fulong2e_init(MachineState *machine)
>>>>>>>        pci_bus = bonito_init((qemu_irq *)&(env->irq[2]));
>>>>>>>
>>>>>>>        /* South bridge -> IP5 */
>>>>>>> -    vt82c686b_southbridge_init(pci_bus, FULONG2E_VIA_SLOT, env->irq[5],
>>>>>>> +    vt82c686b_southbridge_init(pci_bus, FULOONG2E_VIA_SLOT, env->irq[5],
>>>>>>>                                   &smbus, &isa_bus);
>>>>>>>
>>>>>>>        /* GPU */
>>>>>>> @@ -384,14 +385,15 @@ static void mips_fulong2e_init(MachineState *machine)
>>>>>>>        network_init(pci_bus);
>>>>>>>    }
>>>>>>>
>>>>>>> -static void mips_fulong2e_machine_init(MachineClass *mc)
>>>>>>> +static void mips_fuloong2e_machine_init(MachineClass *mc)
>>>>>>>    {
>>>>>>> -    mc->desc = "Fulong 2e mini pc";
>>>>>>> -    mc->init = mips_fulong2e_init;
>>>>>>> +    mc->desc = "Fuloong 2e mini pc";
>>>>>>> +    mc->alias = "fulong2e";             /* Incorrect name used up to QEMU 4.2 */
>>>>>>> +    mc->init = mips_fuloong2e_init;
>>>>>>>        mc->block_default_type = IF_IDE;
>>>>>>>        mc->default_cpu_type = MIPS_CPU_TYPE_NAME("Loongson-2E");
>>>>>>>        mc->default_ram_size = 256 * MiB;
>>>>>>> -    mc->default_ram_id = "fulong2e.ram";
>>>>>>> +    mc->default_ram_id = "fuloong2e.ram";
>>>>>>>    }
>>>>>>>
>>>>>>> -DEFINE_MACHINE("fulong2e", mips_fulong2e_machine_init)
>>>>>>> +DEFINE_MACHINE("fuloong2e", mips_fuloong2e_machine_init)
>>>>>>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>>>>>>> index cc6545c8a8..b9bfe3c417 100644
>>>>>>> --- a/hw/pci-host/bonito.c
>>>>>>> +++ b/hw/pci-host/bonito.c
>>>>>>> @@ -11,7 +11,7 @@
>>>>>>>     */
>>>>>>>
>>>>>>>    /*
>>>>>>> - * fulong 2e mini pc has a bonito north bridge.
>>>>>>> + * fuloong 2e mini pc has a bonito north bridge.
>>>>>>>     */
>>>>>>>
>>>>>>>    /*
>>>>>>> @@ -559,11 +559,11 @@ static int pci_bonito_map_irq(PCIDevice *pci_dev, int irq_num)
>>>>>>>        slot = (pci_dev->devfn >> 3);
>>>>>>>
>>>>>>>        switch (slot) {
>>>>>>> -    case 5:   /* FULONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, MC97 */
>>>>>>> +    case 5:   /* FULOONG2E_VIA_SLOT, SouthBridge, IDE, USB, ACPI, AC97, MC97 */
>>>>>>>            return irq_num % 4 + BONITO_IRQ_BASE;
>>>>>>> -    case 6:   /* FULONG2E_ATI_SLOT, VGA */
>>>>>>> +    case 6:   /* FULOONG2E_ATI_SLOT, VGA */
>>>>>>>            return 4 + BONITO_IRQ_BASE;
>>>>>>> -    case 7:   /* FULONG2E_RTL_SLOT, RTL8139 */
>>>>>>> +    case 7:   /* FULOONG2E_RTL_SLOT, RTL8139 */
>>>>>>>            return 5 + BONITO_IRQ_BASE;
>>>>>>>        case 8 ... 12: /* PCI slot 1 to 4 */
>>>>>>>            return (slot - 8 + irq_num) + 6 + BONITO_IRQ_BASE;
>>>>>>> diff --git a/tests/qtest/endianness-test.c b/tests/qtest/endianness-test.c
>>>>>>> index 2798802c63..cc088ac01a 100644
>>>>>>> --- a/tests/qtest/endianness-test.c
>>>>>>> +++ b/tests/qtest/endianness-test.c
>>>>>>> @@ -33,7 +33,7 @@ static const TestCase test_cases[] = {
>>>>>>>        { "mips64", "pica61", 0x90000000, .bswap = true },
>>>>>>>        { "mips64", "mips", 0x14000000, .bswap = true },
>>>>>>>        { "mips64", "malta", 0x10000000, .bswap = true },
>>>>>>> -    { "mips64el", "fulong2e", 0x1fd00000 },
>>>>>>> +    { "mips64el", "fuloong2e", 0x1fd00000 },
>>>>>>>        { "ppc", "g3beige", 0xfe000000, .bswap = true, .superio = "i82378" },
>>>>>>>        { "ppc", "40p", 0x80000000, .bswap = true },
>>>>>>>        { "ppc", "bamboo", 0xe8000000, .bswap = true, .superio = "i82378" },
>>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>>> index aa5c54c75a..50f6a5f1bb 100644
>>>>>>> --- a/MAINTAINERS
>>>>>>> +++ b/MAINTAINERS
>>>>>>> @@ -1074,13 +1074,13 @@ R: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
>>>>>>>    S: Obsolete
>>>>>>>    F: hw/mips/mips_r4k.c
>>>>>>>
>>>>>>> -Fulong 2E
>>>>>>> +Fuloong 2E
>>>>>>>    M: Huacai Chen <chenhc@lemote.com>
>>>>>>>    M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>>    M: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
>>>>>>>    R: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>>>>    S: Odd Fixes
>>>>>>> -F: hw/mips/mips_fulong2e.c
>>>>>>> +F: hw/mips/fuloong2e.c
>>>>>>>    F: hw/isa/vt82c686.c
>>>>>>>    F: hw/pci-host/bonito.c
>>>>>>>    F: include/hw/isa/vt82c686.h
>>>>>>> diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
>>>>>>> index 2c2adbc42a..cd38546689 100644
>>>>>>> --- a/hw/mips/Kconfig
>>>>>>> +++ b/hw/mips/Kconfig
>>>>>>> @@ -41,7 +41,7 @@ config JAZZ
>>>>>>>        select DS1225Y
>>>>>>>        select JAZZ_LED
>>>>>>>
>>>>>>> -config FULONG
>>>>>>> +config FULOONG
>>>>>>>        bool
>>>>>>>
>>>>>>>    config MIPS_CPS
>>>>>>> diff --git a/hw/mips/Makefile.objs b/hw/mips/Makefile.objs
>>>>>>> index 525809af07..8ab41edc3f 100644
>>>>>>> --- a/hw/mips/Makefile.objs
>>>>>>> +++ b/hw/mips/Makefile.objs
>>>>>>> @@ -3,6 +3,6 @@ obj-$(CONFIG_R4K) += mips_r4k.o
>>>>>>>    obj-$(CONFIG_MALTA) += gt64xxx_pci.o mips_malta.o
>>>>>>>    obj-$(CONFIG_MIPSSIM) += mips_mipssim.o
>>>>>>>    obj-$(CONFIG_JAZZ) += mips_jazz.o
>>>>>>> -obj-$(CONFIG_FULONG) += mips_fulong2e.o
>>>>>>> +obj-$(CONFIG_FULOONG) += fuloong2e.o
>>>>>>>    obj-$(CONFIG_MIPS_CPS) += cps.o
>>>>>>>    obj-$(CONFIG_MIPS_BOSTON) += boston.o
>>>>>>> --
>>>>>>> 2.21.3
>>>>>>>
>>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Huacai Chen
>>>>>
>>>
>>>
>>>
>>> --
>>> Huacai Chen
> 

