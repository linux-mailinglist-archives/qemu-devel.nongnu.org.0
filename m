Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20AE3C65FD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:07:59 +0200 (CEST)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m345m-0001zG-S2
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3442-0000R4-Az
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:06:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m343y-0005tX-3v
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626127564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qvv9El5pJA6C06UKVLNkgJyrOn9hKkQYb+9U4htGK0=;
 b=EXebPRFalHnBMArk4ty8DvmcL0/n3L/Er9ub/4W4c/7N83UGPwssJBm78Tkckq3Y22bavR
 dN//C6RkA2CEIwYPRahVodhNbucbQ2L6ey/VocwR3rl4NAOuSwZdDIUiCcJ51y5APNfNLB
 /RXzlBMzkQH3iThjRAZNkOA+tPBGnpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-v8nAiHLSNF-5YHcq6lM8fQ-1; Mon, 12 Jul 2021 18:05:56 -0400
X-MC-Unique: v8nAiHLSNF-5YHcq6lM8fQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88CB6100C611;
 Mon, 12 Jul 2021 22:05:55 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C21D5C1D1;
 Mon, 12 Jul 2021 22:05:50 +0000 (UTC)
References: <20210515134555.307404-1-f4bug@amsat.org>
 <20210515134555.307404-3-f4bug@amsat.org>
 <cba2fc2f-9a6c-ea5d-5005-82713e4b645b@redhat.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 2/2] tests/acceptance: Add tests for the Pegasos2 machine
In-reply-to: <cba2fc2f-9a6c-ea5d-5005-82713e4b645b@redhat.com>
Date: Mon, 12 Jul 2021 18:05:50 -0400
Message-ID: <875yxf1935.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Philippe =?utf-8?Q?Mathieu-Dau?= =?utf-8?Q?d=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Wainer dos Santos Moschetta writes:

> Hi,
>
> On 5/15/21 10:45 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> Add a pair of tests for the Pegasos2 machine following the steps from:
>> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01553.html
>>
>>    $ PEGASOS2_ROM_PATH=3D/tmp/pegasos2.rom AVOCADO_ALLOW_UNTRUSTED_CODE=
=3D1 \
>>      avocado --show=3Dapp,console,tesseract \
>>        run -t machine:pegasos2 tests/acceptance/
>>     (1/2) tests/acceptance/machine_ppc_pegasos.py:PPCPegasos2.test_rom_s=
erial_console:
>>    console: PegasosII Boot Strap (c) 2002-2003 bplan GmbH
>>    console: Running on CPU PVR:000C0209
>>    console: Enable L1 ICache...                                         =
           Done.
>>    console: Reading W83194 :                                            =
           FAILED.
>>    console: Setting Front Side Bus to 133MHz...                         =
           FAILED.
>>    console: Configuring DDR...                                          =
           Done.
>>    console: Configuring PCI0...                                         =
           Done.
>>    console: Configuring PCI1...                                         =
           Done.
>>    console: Configuring ETH...                                          =
           Done.
>>    console: Releasing IDE reset ...                                     =
           Done.
>>    console: Configuring Legacy Devices
>>    console: Initializing KBD...                                         =
           Done.
>>    console: Testing 10000000 Bytes, Pass: 00000000 Failed: 00000000
>>    console: RAM TEST (fill linear)...                                   =
           Done.
>>    console: FFFFFFFF
>>    console: SmartFirmware:
>>    console: cpu0: PowerPC,G4 CPUClock 599 Mhz BUSClock 133 Mhz (Version =
0x000C,0x0209)
>>    console: no/bad nvramrc - performing default startup script
>>    console: channel 1 unit 0 : atapi | QEMU DVD-ROM                     =
        | 2.5+
>>    console: ATA device not present or not responding
>>    console: Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1 =
(20040405172512)
>>    PASS (5.23 s)
>>     (2/2) tests/acceptance/machine_ppc_pegasos.py:PPCPegasos2.test_morph=
os_cdrom_vga:
>>    ...
>>    console: Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1 =
(20040405172512)
>>    console: SmartFirmware(tm) Copyright 1996-2001 by CodeGen, Inc.
>>    console: All Rights Reserved.
>>    console: Pegasos BIOS Extensions Copyright 2001-2003 by bplan GmbH.
>>    console: All Rights Reserved.
>>    console: entering main read/eval loop...
>>    console: ok boot cd boot.img
>>    console: ISO-9660 filesystem:  System-ID: "MORPHOS"  Volume-ID: "Morp=
hOSBoot"
>>    console: " flags=3D0x2 extent=3D0x20 size=3D0x1800
>>    console: Memory used before SYS_Init: 9MB
>>    console: PCI ATA/ATAPI Driver@2: PIO Mode 4
>>    console: PCI ATA/ATAPI Driver@2: UDMA Mode 5
>>    console: ide.device@2: QEMU     QEMU DVD-ROM     <CDROM>
>>    console: ide.device@2:  CDRom <CD001>,<MORPHOS > found, bootable
>>    tesseract: Ambient Screen 4: Saturday, 15 May 2021, 13:36:06 &
>>    tesseract: keymap
>>    tesseract: Albanian keyboard with 101/104 keys
>>    tesseract: =E2=80=98American keyboard with Greek input extension, 105=
 keys
>>    tesseract: Belarusian keyboard with 105 keys
>>    tesseract: Belgian keyboard with 105 keys J
>>    tesseract: British Apple keyboard
>>    tesseract: British keyboard with 105 keys
>>    tesseract: Bulgarian keyboard with 104 keys
>>    tesseract: Canadian keyboard with 105 keys
>>    tesseract: Colemak layout for keyboards with 101/104 keys
>>    tesseract: Croatian keyboard with 101/108 keys
>>    tesseract: Czech keyboard (QWERTY) with 101/104 keys
>>    tesseract: Czech keyboard (QWERTZ) with 101/104 keys
>>    tesseract: Danish keyboard with 105 keys
>>    PASS (28.56 s)
>>    RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT =
0 | CANCEL 0
>>    JOB TIME   : 34.42 s
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>   tests/acceptance/machine_ppc_pegasos.py | 98 +++++++++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>   create mode 100644 tests/acceptance/machine_ppc_pegasos.py
>>
>> diff --git a/tests/acceptance/machine_ppc_pegasos.py b/tests/acceptance/=
machine_ppc_pegasos.py
>> new file mode 100644
>> index 00000000000..d36e920ebde
>> --- /dev/null
>> +++ b/tests/acceptance/machine_ppc_pegasos.py
>> @@ -0,0 +1,98 @@
>> +# Functional tests for the Pegasos2 machine.
>> +#
>> +# Copyright (c) 2021 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
>> +# See the COPYING file in the top-level directory.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +import os
>> +import time
>> +
>> +from avocado import skipUnless
>> +from avocado_qemu import Test
>> +from avocado_qemu import exec_command_and_wait_for_pattern
>> +from avocado_qemu import wait_for_console_pattern
>> +from tesseract_utils import tesseract_available, tesseract_ocr
>> +
>> +PIL_AVAILABLE =3D True
>> +try:
>> +    from PIL import Image
>> +except ImportError:
>> +    PIL_AVAILABLE =3D False
>> +
>> +
>> +@skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code'=
)
>> +@skipUnless(os.getenv('PEGASOS2_ROM_PATH'), 'PEGASOS2_ROM_PATH not avai=
lable')
>> +class PPCPegasos2(Test):
>> +    timeout =3D 60
>> +
>> +    def test_rom_serial_console(self):
>> +        """
>> +        :avocado: tags=3Darch:ppc
>> +        :avocado: tags=3Dmachine:pegasos2
>> +        :avocado: tags=3Ddevice:mv64361
>> +        :avocado: tags=3Ddevice:vt8231
>> +        """
>> +        rom_hash =3D '3248e02596480f2dba5944bd219ecfad'
>
> rom_hash the same on both test methods, so it can be an object attribute.
>

Good point, agreed.  One more suggestion, is to convert this to a sha1
instead, as it's the default fetch_asset() hash algorithm.  The
equivalent sha1 hash would be "08dc28afb3d10fb223376a28eebfd07c9f8df9fa".

>> +        rom_path =3D self.fetch_asset('file://' + os.getenv('PEGASOS2_R=
OM_PATH'),
>> +                                    asset_hash=3Drom_hash, algorithm=3D=
'md5')
>
> The tester may have the ROM file hosted elsewhere, so I wouldn't
> prefix it with 'file://'.
>

While I also agree with your suggestion, since Avocado 85.0, the best way
to go about assets that are not publicly available is to reference it by
name it and have registered locally with "avocado assets register".

According to [1], users would need to:

1. Download and ELF file that contains the ROM
2. Extract the rom with "tail -c +85581 up050404 | head -c 524288 >pegasos2=
.rom"

Then, I'd suggest we ask users to run:

3. avocado assets register --hash 08dc28afb3d10fb223376a28eebfd07c9f8df9fa =
pegasos2.rom file://`pwd`/pegasos2.rom

With that, we can now simply use:

   rom_path =3D self.fetch_asset('pegasos2.rom', asset_hash=3Dself.rom_hash=
)

>> +
>> +        self.vm.set_console()
>> +        self.vm.add_args('-bios', rom_path)
>> +        self.vm.launch()
>> +        msg =3D 'PegasosII Boot Strap (c) 2002-2003 bplan GmbH'
>> +        wait_for_console_pattern(self, msg)
>> +        msg =3D 'Welcome to SmartFirmware(tm) for bplan Pegasos2 versio=
n 1.1'
>> +        wait_for_console_pattern(self, msg)
>> +
>> +    def test_morphos_cdrom_vga(self):
>> +        """
>> +        :avocado: tags=3Darch:ppc
>> +        :avocado: tags=3Dmachine:pegasos2
>> +        :avocado: tags=3Ddevice:mv64361
>> +        :avocado: tags=3Ddevice:vt8231
>> +        :avocado: tags=3Ddevice:ati-vga
>> +        """
>> +        rom_hash =3D '3248e02596480f2dba5944bd219ecfad'
>> +        rom_path =3D self.fetch_asset('file://' + os.getenv('PEGASOS2_R=
OM_PATH'),
>> +                                    asset_hash=3Drom_hash, algorithm=3D=
'md5')
>
> Likewise.
>
> - Wainer
>
>> +        iso_url =3D 'https://www.morphos-team.net/morphos-3.15.iso'
>> +        iso_hash =3D 'a19dbfbbc4728e0ba9ceb6335db69ca4'
>> +        iso_path =3D self.fetch_asset(iso_url,
>> +                                    asset_hash=3Diso_hash, algorithm=3D=
'md5')
>> +
>> +        self.vm.set_console()
>> +        self.vm.add_args('-bios', rom_path,
>> +                         '-device', 'ati-vga,romfile=3D',
>> +                         '-cdrom', iso_path)
>> +        self.vm.launch()
>> +        msg =3D 'Welcome to SmartFirmware(tm) for bplan Pegasos2 versio=
n 1.1'
>> +        wait_for_console_pattern(self, msg)
>> +        wait_for_console_pattern(self, 'entering main read/eval loop...=
')
>> +        msg =3D 'filesystem:  System-ID: "MORPHOS"  Volume-ID: "MorphOS=
Boot"'
>> +        exec_command_and_wait_for_pattern(self, 'boot cd boot.img', msg=
)
>> +
>> +        msg =3D 'ide.device@2:  CDRom <CD001>,<MORPHOS > found, bootabl=
e'
>> +        wait_for_console_pattern(self, msg)
>> +        if PIL_AVAILABLE:
>> +            delay_s =3D 20 if tesseract_available(4) else 8
>> +
>> +            self.log.info('VM launched, waiting for display')
>> +            # TODO: Use avocado.utils.wait.wait_for to catch the
>> +            #       'displaysurface_create 1120x832' trace-event.
>> +            time.sleep(delay_s)
>> +
>> +            screenshot_path =3D os.path.join(self.workdir, "dump.ppm")
>> +            self.vm.command('human-monitor-command',
>> +                            command_line=3D'screendump %s' % screenshot=
_path)
>> +            width, height =3D Image.open(screenshot_path).size
>> +            self.assertEqual(width, 2048)
>> +            self.assertEqual(height, 1152)
>> +
>> +            if tesseract_available(4):
>> +                lines =3D tesseract_ocr(screenshot_path, tesseract_vers=
ion=3D4)
>> +                text =3D '\n'.join(lines)
>> +                msg =3D 'American keyboard with Greek input extension, =
105 keys'
>> +                self.assertIn(msg, text)

Phil,

If you don't mind, I'll send a respin of this test with Wainer's and my
suggestions.

Cheers,
- Cleber.

[1] - https://lists.nongnu.org/archive/html/qemu-ppc/2021-01/msg00112.html
[2] - http://web.archive.org/web/20071021223056/http://www.bplan-gmbh.de/up=
050404/up050404


