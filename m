Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068C13B3826
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:47:37 +0200 (CEST)
Received: from localhost ([::1]:54174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwWG8-0000O8-1Y
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lwWCo-00066f-Ot
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:44:11 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:62418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lwWCh-0004J2-6r
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:44:09 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8FA9B7457F0;
 Thu, 24 Jun 2021 22:43:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 54BD874570E; Thu, 24 Jun 2021 22:43:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 52C4574570B;
 Thu, 24 Jun 2021 22:43:58 +0200 (CEST)
Date: Thu, 24 Jun 2021 22:43:58 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 5/5] tests/acceptance: Test PMON on the Fuloong 2E machine
In-Reply-To: <20210624202747.1433023-6-f4bug@amsat.org>
Message-ID: <f1c3c761-1ded-abc9-a66c-e73c4956c7d4@eik.bme.hu>
References: <20210624202747.1433023-1-f4bug@amsat.org>
 <20210624202747.1433023-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1375163378-1624567438=:94935"
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1375163378-1624567438=:94935
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 24 Jun 2021, Philippe Mathieu-Daudé wrote:
> Test the PMON firmware. As the firmware is not redistributable,
> it has to be downloaded manually first. Then it can be used by
> providing its path via the PMON_BIN_PATH environment variable:
>
>  $ PMON2E_BIN_PATH=~/images/fuloong2e/pmon_2e.bin \
>    AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>    avocado --show=app,console run tests/acceptance/machine_mips_fuloong2e.py
>  Fetching asset from tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial
>   (1/3) tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_pmon_serial_console:
>  console: PMON2000 MIPS Initializing. Standby...
>  console: ERRORPC=00000000 CONFIG=00030932
>  console: PRID=00006302
>  console: Init SDRAM Done!
>  console: Sizing caches...
>  console: Init caches...
>  console: godson2 caches found
>  console: Init caches done, cfg = 00030932
>  console: Copy PMON to execute location...
>  console: copy text section done.
>  console: Copy PMON to execute location done.
>  Uncompressing Bios........................OK,Booting Bios
>  PASS (0.25 s)
>   (2/3) tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_pmon_framebuffer_console:
>  [...]
>  Uncompressing Bios........................OK,Booting Bios
>  console: FREQ
>  console: FREI
>  console: DONE
>  console: TTYI
>  console: TTYD
>  console: ENVI
>  console: MAPV
>  console: Mfg  0, Id 60
>  console: STDV
>  console: SBDD
>  console: PPCIH
>  console: PCIS
>  console: PCIR
>  console: PCIW
>  console: NETI
>  console: RTCL
>  console: PCID
>  console: VGAI
>  console: Default MODE_ID 2
>  console: starting radeon init...
>  console: radeon init done
>  console: FRBI
>  console: cfb_console init,fb=b4000000
>  console: Video: Drawing the logo ...
>  console: CONSOLE_SIZE 450560HSTI
>  PASS (4.10 s)
>   (3/3) tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial:
>  console: Linux version 2.6.27.7lemote (root@debian) (gcc version 4.1.3 20080623 (prerelease) (Debian 4.1.2-23)) #6 Fri Dec 12 00:11:25 CST 2008
>  console: busclock=33000000, cpuclock=-2145008360,memsize=256,highmemsize=0
>  console: console [early0] enabled
>  console: CPU revision is: 00006302 (ICT Loongson-2)
>  PASS (0.19 s)
>  RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>  JOB TIME   : 5.10 s
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> tests/acceptance/machine_mips_fuloong2e.py | 62 ++++++++++++++++++++++
> 1 file changed, 62 insertions(+)
>
> diff --git a/tests/acceptance/machine_mips_fuloong2e.py b/tests/acceptance/machine_mips_fuloong2e.py
> index 0ac285e2af1..4854ba98560 100644
> --- a/tests/acceptance/machine_mips_fuloong2e.py
> +++ b/tests/acceptance/machine_mips_fuloong2e.py
> @@ -8,15 +8,77 @@
> # SPDX-License-Identifier: GPL-2.0-or-later
>
> import os
> +import time
>
> from avocado import skipUnless
> from avocado_qemu import Test
> from avocado_qemu import wait_for_console_pattern
>
> +from tesseract_utils import tesseract_available, tesseract_ocr
> +
> class MipsFuloong2e(Test):
>
>     timeout = 60
>
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    @skipUnless(os.getenv('PMON2E_BIN_PATH'), 'PMON2E_BIN_PATH not available')
> +    def test_pmon_serial_console(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=machine:fuloong2e
> +        :avocado: tags=endian:little
> +        :avocado: tags=device:bonito64
> +        :avocado: tags=device:via686b
> +        """
> +        pmon_hash = 'c812e1695d7b2320036f3ef494976969' # v1.1.2
> +        pmon_path = self.fetch_asset('file://' + os.getenv('PMON2E_BIN_PATH'),
> +                                     asset_hash=pmon_hash, algorithm='md5')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', pmon_path)
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing. Standby...')
> +        wait_for_console_pattern(self, 'Booting Bios')
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    # Tesseract 4 adds a new OCR engine based on LSTM neural networks. The
> +    # new version is faster and more accurate than version 3. The drawback is
> +    # that it is still alpha-level software.
> +    @skipUnless(tesseract_available(4), 'tesseract v4 OCR tool not available')
> +    @skipUnless(os.getenv('PMON2E_BIN_PATH'), 'PMON2E_BIN_PATH not available')
> +    def test_pmon_framebuffer_console(self):
> +        """
> +        :avocado: tags=arch:mips64el
> +        :avocado: tags=machine:fuloong2e
> +        :avocado: tags=endian:little
> +        :avocado: tags=device:bonito64
> +        :avocado: tags=device:ati-vga
> +        """
> +        screenshot_path = os.path.join(self.workdir, 'dump.ppm')
> +
> +        pmon_hash = 'c812e1695d7b2320036f3ef494976969' # v1.1.2
> +        pmon_path = self.fetch_asset('file://' + os.getenv('PMON2E_BIN_PATH'),
> +                                     asset_hash=pmon_hash, algorithm='md5')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-bios', pmon_path,
> +                         '-vga', 'std',
> +                         '-device', 'ati-vga,model=rv100')

I think this is the default if you just drop -vga std so I don't know why 
you have that in the first place but then you should not need to add 
ati-vga explicitely.

Regards,
BALATON Zoltan

> +        self.vm.launch()
> +
> +        wait_for_console_pattern(self, 'Video: Drawing the logo ...')
> +        self.log.info('VM launched, waiting for logo on display')
> +        time.sleep(2)
> +        wait_for_console_pattern(self, 'CONSOLE_SIZE')
> +        self.vm.command('human-monitor-command', command_line='stop')
> +        self.vm.command('human-monitor-command',
> +                        command_line='screendump %s' % screenshot_path)
> +
> +        lines = tesseract_ocr(screenshot_path, tesseract_version=4,
> +                              tesseract_args='--dpi 128')
> +        pmon_version = 'PNON2000 for Loongson, Version 1.1.2' # PNON is enough
> +        self.assertIn(pmon_version, lines)
> +
>     @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
>     @skipUnless(os.getenv('RESCUE_YL_PATH'), 'RESCUE_YL_PATH not available')
>     def test_linux_kernel_isa_serial(self):
>
--3866299591-1375163378-1624567438=:94935--

