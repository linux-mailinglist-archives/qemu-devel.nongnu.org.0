Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD813381964
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 16:35:04 +0200 (CEST)
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhvNf-00079D-Ej
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 10:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lhvMN-0006AF-B2; Sat, 15 May 2021 10:33:43 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:64642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lhvME-0007ng-4z; Sat, 15 May 2021 10:33:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A21717457E7;
 Sat, 15 May 2021 16:33:28 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 54C1C74570E; Sat, 15 May 2021 16:33:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 529907456E3;
 Sat, 15 May 2021 16:33:28 +0200 (CEST)
Date: Sat, 15 May 2021 16:33:28 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/2] tests/acceptance: Add tests for the Pegasos2 machine
In-Reply-To: <20210515134555.307404-3-f4bug@amsat.org>
Message-ID: <65444b7f-f62a-cf71-9878-ef923b14d84d@eik.bme.hu>
References: <20210515134555.307404-1-f4bug@amsat.org>
 <20210515134555.307404-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1556033258-1621089208=:75694"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1556033258-1621089208=:75694
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
> Add a pair of tests for the Pegasos2 machine following the steps from:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01553.html
>
>  $ PEGASOS2_ROM_PATH=/tmp/pegasos2.rom AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>    avocado --show=app,console,tesseract \
>      run -t machine:pegasos2 tests/acceptance/
>   (1/2) tests/acceptance/machine_ppc_pegasos.py:PPCPegasos2.test_rom_serial_console:
>  console: PegasosII Boot Strap (c) 2002-2003 bplan GmbH
>  console: Running on CPU PVR:000C0209
>  console: Enable L1 ICache...                                                    Done.
>  console: Reading W83194 :                                                       FAILED.
>  console: Setting Front Side Bus to 133MHz...                                    FAILED.
>  console: Configuring DDR...                                                     Done.
>  console: Configuring PCI0...                                                    Done.
>  console: Configuring PCI1...                                                    Done.
>  console: Configuring ETH...                                                     Done.
>  console: Releasing IDE reset ...                                                Done.
>  console: Configuring Legacy Devices
>  console: Initializing KBD...                                                    Done.
>  console: Testing 10000000 Bytes, Pass: 00000000 Failed: 00000000
>  console: RAM TEST (fill linear)...                                              Done.
>  console: FFFFFFFF
>  console: SmartFirmware:
>  console: cpu0: PowerPC,G4 CPUClock 599 Mhz BUSClock 133 Mhz (Version 0x000C,0x0209)
>  console: no/bad nvramrc - performing default startup script
>  console: channel 1 unit 0 : atapi | QEMU DVD-ROM                             | 2.5+
>  console: ATA device not present or not responding
>  console: Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1 (20040405172512)
>  PASS (5.23 s)
>   (2/2) tests/acceptance/machine_ppc_pegasos.py:PPCPegasos2.test_morphos_cdrom_vga:
>  ...
>  console: Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1 (20040405172512)
>  console: SmartFirmware(tm) Copyright 1996-2001 by CodeGen, Inc.
>  console: All Rights Reserved.
>  console: Pegasos BIOS Extensions Copyright 2001-2003 by bplan GmbH.
>  console: All Rights Reserved.
>  console: entering main read/eval loop...
>  console: ok boot cd boot.img
>  console: ISO-9660 filesystem:  System-ID: "MORPHOS"  Volume-ID: "MorphOSBoot"
>  console: " flags=0x2 extent=0x20 size=0x1800
>  console: Memory used before SYS_Init: 9MB
>  console: PCI ATA/ATAPI Driver@2: PIO Mode 4
>  console: PCI ATA/ATAPI Driver@2: UDMA Mode 5
>  console: ide.device@2: QEMU     QEMU DVD-ROM     <CDROM>
>  console: ide.device@2:  CDRom <CD001>,<MORPHOS > found, bootable
>  tesseract: Ambient Screen 4: Saturday, 15 May 2021, 13:36:06 &
>  tesseract: keymap
>  tesseract: Albanian keyboard with 101/104 keys
>  tesseract: ‘American keyboard with Greek input extension, 105 keys
>  tesseract: Belarusian keyboard with 105 keys
>  tesseract: Belgian keyboard with 105 keys J
>  tesseract: British Apple keyboard
>  tesseract: British keyboard with 105 keys
>  tesseract: Bulgarian keyboard with 104 keys
>  tesseract: Canadian keyboard with 105 keys
>  tesseract: Colemak layout for keyboards with 101/104 keys
>  tesseract: Croatian keyboard with 101/108 keys
>  tesseract: Czech keyboard (QWERTY) with 101/104 keys
>  tesseract: Czech keyboard (QWERTZ) with 101/104 keys
>  tesseract: Danish keyboard with 105 keys
>  PASS (28.56 s)
>  RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>  JOB TIME   : 34.42 s
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks a lot for creating this test.

Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> tests/acceptance/machine_ppc_pegasos.py | 98 +++++++++++++++++++++++++
> 1 file changed, 98 insertions(+)
> create mode 100644 tests/acceptance/machine_ppc_pegasos.py
>
> diff --git a/tests/acceptance/machine_ppc_pegasos.py b/tests/acceptance/machine_ppc_pegasos.py
> new file mode 100644
> index 00000000000..d36e920ebde
> --- /dev/null
> +++ b/tests/acceptance/machine_ppc_pegasos.py
> @@ -0,0 +1,98 @@
> +# Functional tests for the Pegasos2 machine.
> +#
> +# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or later.
> +# See the COPYING file in the top-level directory.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import time
> +
> +from avocado import skipUnless
> +from avocado_qemu import Test
> +from avocado_qemu import exec_command_and_wait_for_pattern
> +from avocado_qemu import wait_for_console_pattern
> +from tesseract_utils import tesseract_available, tesseract_ocr
> +
> +PIL_AVAILABLE = True
> +try:
> +    from PIL import Image
> +except ImportError:
> +    PIL_AVAILABLE = False
> +
> +
> +@skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +@skipUnless(os.getenv('PEGASOS2_ROM_PATH'), 'PEGASOS2_ROM_PATH not available')
> +class PPCPegasos2(Test):
> +    timeout = 60
> +
> +    def test_rom_serial_console(self):
> +        """
> +        :avocado: tags=arch:ppc
> +        :avocado: tags=machine:pegasos2
> +        :avocado: tags=device:mv64361
> +        :avocado: tags=device:vt8231
> +        """
> +        rom_hash = '3248e02596480f2dba5944bd219ecfad'
> +        rom_path = self.fetch_asset('file://' + os.getenv('PEGASOS2_ROM_PATH'),
> +                                    asset_hash=rom_hash, algorithm='md5')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', rom_path)
> +        self.vm.launch()
> +        msg = 'PegasosII Boot Strap (c) 2002-2003 bplan GmbH'
> +        wait_for_console_pattern(self, msg)
> +        msg = 'Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1'
> +        wait_for_console_pattern(self, msg)
> +
> +    def test_morphos_cdrom_vga(self):
> +        """
> +        :avocado: tags=arch:ppc
> +        :avocado: tags=machine:pegasos2
> +        :avocado: tags=device:mv64361
> +        :avocado: tags=device:vt8231
> +        :avocado: tags=device:ati-vga
> +        """
> +        rom_hash = '3248e02596480f2dba5944bd219ecfad'
> +        rom_path = self.fetch_asset('file://' + os.getenv('PEGASOS2_ROM_PATH'),
> +                                    asset_hash=rom_hash, algorithm='md5')
> +        iso_url = 'https://www.morphos-team.net/morphos-3.15.iso'
> +        iso_hash = 'a19dbfbbc4728e0ba9ceb6335db69ca4'
> +        iso_path = self.fetch_asset(iso_url,
> +                                    asset_hash=iso_hash, algorithm='md5')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', rom_path,
> +                         '-device', 'ati-vga,romfile=',
> +                         '-cdrom', iso_path)
> +        self.vm.launch()
> +        msg = 'Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1'
> +        wait_for_console_pattern(self, msg)
> +        wait_for_console_pattern(self, 'entering main read/eval loop...')
> +        msg = 'filesystem:  System-ID: "MORPHOS"  Volume-ID: "MorphOSBoot"'
> +        exec_command_and_wait_for_pattern(self, 'boot cd boot.img', msg)
> +
> +        msg = 'ide.device@2:  CDRom <CD001>,<MORPHOS > found, bootable'
> +        wait_for_console_pattern(self, msg)
> +        if PIL_AVAILABLE:
> +            delay_s = 20 if tesseract_available(4) else 8
> +
> +            self.log.info('VM launched, waiting for display')
> +            # TODO: Use avocado.utils.wait.wait_for to catch the
> +            #       'displaysurface_create 1120x832' trace-event.
> +            time.sleep(delay_s)
> +
> +            screenshot_path = os.path.join(self.workdir, "dump.ppm")
> +            self.vm.command('human-monitor-command',
> +                            command_line='screendump %s' % screenshot_path)
> +            width, height = Image.open(screenshot_path).size
> +            self.assertEqual(width, 2048)
> +            self.assertEqual(height, 1152)
> +
> +            if tesseract_available(4):
> +                lines = tesseract_ocr(screenshot_path, tesseract_version=4)
> +                text = '\n'.join(lines)
> +                msg = 'American keyboard with Greek input extension, 105 keys'
> +                self.assertIn(msg, text)
>
--3866299591-1556033258-1621089208=:75694--

