Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86473C6DC5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:51:35 +0200 (CEST)
Received: from localhost ([::1]:33844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3F4g-0007sO-U0
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3F3Q-0006p5-85; Tue, 13 Jul 2021 05:50:16 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3F3N-0005sz-L2; Tue, 13 Jul 2021 05:50:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d12so29015945wre.13;
 Tue, 13 Jul 2021 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j1DK2UF5ZgzZEY1UDq41etrSA1BnEGsxFTcB6KYxODA=;
 b=Sw2Hn7OfFNPCU20J53cD3gxhh2QC3GR3uu35hfNZKpK/q+wepwY9YjX9V1E5G0RQpi
 MyfixKhZ3YUpggRq4G66iP6w7zWny6jAW/t4G8AZbVuN03vsOqVH1YjoiPdozf5StBhS
 Dfu7GVe5ysq/XY6S3kBsN2tnxPi3fVBMjqjZZLZVZAfeXdgxfeKUumzJgSeB8GPc7WkG
 l/p3CehHWAuvS8QQ0/tii9GFYS12dMSzfy76cmAMYgXEcHTVnc0SU7f9EtYzUVrlLH/K
 r5r63h+rvWYUPg7ytosPt++xgpz7qHbjDDwbW/q30FJHyfNpTpQyAoSw1KV56/7Y49pd
 Kuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j1DK2UF5ZgzZEY1UDq41etrSA1BnEGsxFTcB6KYxODA=;
 b=NWbnH9ff8UNFVLpaBvHtP+WfvnQtw3CMghWetUVIruNnfjzMLzn/IX71pNjUv8Jyak
 7woTO+HlW8iNFjaR0EqCfrucppcvYloHdfg1KwqX8r2fUQwI0JYe34MTAmlcpDr7rBpq
 CZho0MlBRFqsoeL6xNeg1bT3EOgY+OjAw7taJQVqh9rp45YOybEvJcIkCP/gLJg6H1a6
 orJG2XuVIdtyLngR3PalWc734LzJGVNmx25W4IcqaY2igepJaQnUoQ8hTOo35f3nmkur
 aT5mMmRwCtlVbRD/l+1R22hAzrf4W7R9pjbDTS77tVzvPo2nPvzVIT1HfV97sYX42YOM
 7OMQ==
X-Gm-Message-State: AOAM530bhmqfHQPrHaNha+ExzGrKyXY+zzUEEPSOJP1Au9Z4AMwu7LAE
 TVYkOvnXXX8gHpAQp9jYw22Tf6UyY9U1og==
X-Google-Smtp-Source: ABdhPJzvf062wX/jgSe1VeQLhoBf/Pq8EGXWTUGWi9UGycTszw8ZhymZQ0IgWYXNE6Ye05GMiwP6kw==
X-Received: by 2002:adf:b605:: with SMTP id f5mr4490766wre.419.1626169810617; 
 Tue, 13 Jul 2021 02:50:10 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id d24sm1820508wmb.42.2021.07.13.02.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 02:50:09 -0700 (PDT)
Subject: Re: [PATCH 2/2] tests/acceptance: Add tests for the Pegasos2 machine
To: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20210515134555.307404-1-f4bug@amsat.org>
 <20210515134555.307404-3-f4bug@amsat.org>
 <cba2fc2f-9a6c-ea5d-5005-82713e4b645b@redhat.com>
 <875yxf1935.fsf@p50.localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2bae817a-68f8-befb-7d2a-4b0eb3853c8c@amsat.org>
Date: Tue, 13 Jul 2021 11:50:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <875yxf1935.fsf@p50.localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.479,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 12:05 AM, Cleber Rosa wrote:
> Wainer dos Santos Moschetta writes:
> 
>> Hi,
>>
>> On 5/15/21 10:45 AM, Philippe Mathieu-Daudé wrote:
>>> Add a pair of tests for the Pegasos2 machine following the steps from:
>>> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01553.html
>>>
>>>    $ PEGASOS2_ROM_PATH=/tmp/pegasos2.rom AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>>>      avocado --show=app,console,tesseract \
>>>        run -t machine:pegasos2 tests/acceptance/
>>>     (1/2) tests/acceptance/machine_ppc_pegasos.py:PPCPegasos2.test_rom_serial_console:
>>>    console: PegasosII Boot Strap (c) 2002-2003 bplan GmbH
>>>    console: Running on CPU PVR:000C0209
>>>    console: Enable L1 ICache...                                                    Done.
>>>    console: Reading W83194 :                                                       FAILED.
>>>    console: Setting Front Side Bus to 133MHz...                                    FAILED.
>>>    console: Configuring DDR...                                                     Done.
>>>    console: Configuring PCI0...                                                    Done.
>>>    console: Configuring PCI1...                                                    Done.
>>>    console: Configuring ETH...                                                     Done.
>>>    console: Releasing IDE reset ...                                                Done.
>>>    console: Configuring Legacy Devices
>>>    console: Initializing KBD...                                                    Done.
>>>    console: Testing 10000000 Bytes, Pass: 00000000 Failed: 00000000
>>>    console: RAM TEST (fill linear)...                                              Done.
>>>    console: FFFFFFFF
>>>    console: SmartFirmware:
>>>    console: cpu0: PowerPC,G4 CPUClock 599 Mhz BUSClock 133 Mhz (Version 0x000C,0x0209)
>>>    console: no/bad nvramrc - performing default startup script
>>>    console: channel 1 unit 0 : atapi | QEMU DVD-ROM                             | 2.5+
>>>    console: ATA device not present or not responding
>>>    console: Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1 (20040405172512)
>>>    PASS (5.23 s)
>>>     (2/2) tests/acceptance/machine_ppc_pegasos.py:PPCPegasos2.test_morphos_cdrom_vga:
>>>    ...
>>>    console: Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1 (20040405172512)
>>>    console: SmartFirmware(tm) Copyright 1996-2001 by CodeGen, Inc.
>>>    console: All Rights Reserved.
>>>    console: Pegasos BIOS Extensions Copyright 2001-2003 by bplan GmbH.
>>>    console: All Rights Reserved.
>>>    console: entering main read/eval loop...
>>>    console: ok boot cd boot.img
>>>    console: ISO-9660 filesystem:  System-ID: "MORPHOS"  Volume-ID: "MorphOSBoot"
>>>    console: " flags=0x2 extent=0x20 size=0x1800
>>>    console: Memory used before SYS_Init: 9MB
>>>    console: PCI ATA/ATAPI Driver@2: PIO Mode 4
>>>    console: PCI ATA/ATAPI Driver@2: UDMA Mode 5
>>>    console: ide.device@2: QEMU     QEMU DVD-ROM     <CDROM>
>>>    console: ide.device@2:  CDRom <CD001>,<MORPHOS > found, bootable
>>>    tesseract: Ambient Screen 4: Saturday, 15 May 2021, 13:36:06 &
>>>    tesseract: keymap
>>>    tesseract: Albanian keyboard with 101/104 keys
>>>    tesseract: ‘American keyboard with Greek input extension, 105 keys
>>>    tesseract: Belarusian keyboard with 105 keys
>>>    tesseract: Belgian keyboard with 105 keys J
>>>    tesseract: British Apple keyboard
>>>    tesseract: British keyboard with 105 keys
>>>    tesseract: Bulgarian keyboard with 104 keys
>>>    tesseract: Canadian keyboard with 105 keys
>>>    tesseract: Colemak layout for keyboards with 101/104 keys
>>>    tesseract: Croatian keyboard with 101/108 keys
>>>    tesseract: Czech keyboard (QWERTY) with 101/104 keys
>>>    tesseract: Czech keyboard (QWERTZ) with 101/104 keys
>>>    tesseract: Danish keyboard with 105 keys
>>>    PASS (28.56 s)
>>>    RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>>>    JOB TIME   : 34.42 s
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   tests/acceptance/machine_ppc_pegasos.py | 98 +++++++++++++++++++++++++
>>>   1 file changed, 98 insertions(+)
>>>   create mode 100644 tests/acceptance/machine_ppc_pegasos.py
>>>
>>> diff --git a/tests/acceptance/machine_ppc_pegasos.py b/tests/acceptance/machine_ppc_pegasos.py
>>> new file mode 100644
>>> index 00000000000..d36e920ebde
>>> --- /dev/null
>>> +++ b/tests/acceptance/machine_ppc_pegasos.py
>>> @@ -0,0 +1,98 @@
>>> +# Functional tests for the Pegasos2 machine.
>>> +#
>>> +# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> +#
>>> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
>>> +# See the COPYING file in the top-level directory.
>>> +#
>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +import os
>>> +import time
>>> +
>>> +from avocado import skipUnless
>>> +from avocado_qemu import Test
>>> +from avocado_qemu import exec_command_and_wait_for_pattern
>>> +from avocado_qemu import wait_for_console_pattern
>>> +from tesseract_utils import tesseract_available, tesseract_ocr
>>> +
>>> +PIL_AVAILABLE = True
>>> +try:
>>> +    from PIL import Image
>>> +except ImportError:
>>> +    PIL_AVAILABLE = False
>>> +
>>> +
>>> +@skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
>>> +@skipUnless(os.getenv('PEGASOS2_ROM_PATH'), 'PEGASOS2_ROM_PATH not available')
>>> +class PPCPegasos2(Test):
>>> +    timeout = 60
>>> +
>>> +    def test_rom_serial_console(self):
>>> +        """
>>> +        :avocado: tags=arch:ppc
>>> +        :avocado: tags=machine:pegasos2
>>> +        :avocado: tags=device:mv64361
>>> +        :avocado: tags=device:vt8231
>>> +        """
>>> +        rom_hash = '3248e02596480f2dba5944bd219ecfad'
>>
>> rom_hash the same on both test methods, so it can be an object attribute.
>>
> 
> Good point, agreed.  One more suggestion, is to convert this to a sha1
> instead, as it's the default fetch_asset() hash algorithm.  The
> equivalent sha1 hash would be "08dc28afb3d10fb223376a28eebfd07c9f8df9fa".

IIRC the agreement / recommendation was to use the hash provided with
blob first, and if not present, add one using the default (which
currently is sha1). I used MD5 because this is what was already
available in [1], I haven't generated it. But ...

>>> +        rom_path = self.fetch_asset('file://' + os.getenv('PEGASOS2_ROM_PATH'),
>>> +                                    asset_hash=rom_hash, algorithm='md5')
>>
>> The tester may have the ROM file hosted elsewhere, so I wouldn't
>> prefix it with 'file://'.
>>
> 
> While I also agree with your suggestion, since Avocado 85.0, the best way
> to go about assets that are not publicly available is to reference it by
> name it and have registered locally with "avocado assets register".
> 
> According to [1], users would need to:
> 
> 1. Download and ELF file that contains the ROM
> 2. Extract the rom with "tail -c +85581 up050404 | head -c 524288 >pegasos2.rom"

... since Wainer suggested that, the up050404 file MD5 is public:
http://www.bplan-gmbh.de/flash_update_for_pegasos_ii_en.html
MD5 checksum:dea2d54d14726bb818e5fa3be9610fcc

So you can use that to verify 'up050404' then os.seek() to extract
the rom, no need to verify the rom anymore.

> Then, I'd suggest we ask users to run:
> 
> 3. avocado assets register --hash 08dc28afb3d10fb223376a28eebfd07c9f8df9fa pegasos2.rom file://`pwd`/pegasos2.rom

And here we'd register 'up050404'.

> With that, we can now simply use:
> 
>    rom_path = self.fetch_asset('pegasos2.rom', asset_hash=self.rom_hash)

Wow, this is awesome!

>>> +
>>> +        self.vm.set_console()
>>> +        self.vm.add_args('-bios', rom_path)
>>> +        self.vm.launch()
>>> +        msg = 'PegasosII Boot Strap (c) 2002-2003 bplan GmbH'
>>> +        wait_for_console_pattern(self, msg)
>>> +        msg = 'Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1'
>>> +        wait_for_console_pattern(self, msg)
>>> +
>>> +    def test_morphos_cdrom_vga(self):
>>> +        """
>>> +        :avocado: tags=arch:ppc
>>> +        :avocado: tags=machine:pegasos2
>>> +        :avocado: tags=device:mv64361
>>> +        :avocado: tags=device:vt8231
>>> +        :avocado: tags=device:ati-vga
>>> +        """
>>> +        rom_hash = '3248e02596480f2dba5944bd219ecfad'
>>> +        rom_path = self.fetch_asset('file://' + os.getenv('PEGASOS2_ROM_PATH'),
>>> +                                    asset_hash=rom_hash, algorithm='md5')
>>
>> Likewise.
>>
>> - Wainer
>>
>>> +        iso_url = 'https://www.morphos-team.net/morphos-3.15.iso'
>>> +        iso_hash = 'a19dbfbbc4728e0ba9ceb6335db69ca4'
>>> +        iso_path = self.fetch_asset(iso_url,
>>> +                                    asset_hash=iso_hash, algorithm='md5')
>>> +
>>> +        self.vm.set_console()
>>> +        self.vm.add_args('-bios', rom_path,
>>> +                         '-device', 'ati-vga,romfile=',
>>> +                         '-cdrom', iso_path)
>>> +        self.vm.launch()
>>> +        msg = 'Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1'
>>> +        wait_for_console_pattern(self, msg)
>>> +        wait_for_console_pattern(self, 'entering main read/eval loop...')
>>> +        msg = 'filesystem:  System-ID: "MORPHOS"  Volume-ID: "MorphOSBoot"'
>>> +        exec_command_and_wait_for_pattern(self, 'boot cd boot.img', msg)
>>> +
>>> +        msg = 'ide.device@2:  CDRom <CD001>,<MORPHOS > found, bootable'
>>> +        wait_for_console_pattern(self, msg)
>>> +        if PIL_AVAILABLE:
>>> +            delay_s = 20 if tesseract_available(4) else 8
>>> +
>>> +            self.log.info('VM launched, waiting for display')
>>> +            # TODO: Use avocado.utils.wait.wait_for to catch the
>>> +            #       'displaysurface_create 1120x832' trace-event.
>>> +            time.sleep(delay_s)
>>> +
>>> +            screenshot_path = os.path.join(self.workdir, "dump.ppm")
>>> +            self.vm.command('human-monitor-command',
>>> +                            command_line='screendump %s' % screenshot_path)
>>> +            width, height = Image.open(screenshot_path).size
>>> +            self.assertEqual(width, 2048)
>>> +            self.assertEqual(height, 1152)
>>> +
>>> +            if tesseract_available(4):
>>> +                lines = tesseract_ocr(screenshot_path, tesseract_version=4)
>>> +                text = '\n'.join(lines)
>>> +                msg = 'American keyboard with Greek input extension, 105 keys'
>>> +                self.assertIn(msg, text)
> 
> Phil,
> 
> If you don't mind, I'll send a respin of this test with Wainer's and my
> suggestions.

Sure, thank you!

> 
> Cheers,
> - Cleber.
> 
> [1] - https://lists.nongnu.org/archive/html/qemu-ppc/2021-01/msg00112.html
> [2] - http://web.archive.org/web/20071021223056/http://www.bplan-gmbh.de/up050404/up050404
> 

