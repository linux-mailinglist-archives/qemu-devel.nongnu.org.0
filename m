Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B6E3B6DC3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 06:52:17 +0200 (CEST)
Received: from localhost ([::1]:45074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly5jM-0007P1-2z
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 00:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly5iS-0006kV-Rw
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:51:20 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly5iN-0007Dq-4v
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:51:18 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 p10-20020a05600c430ab02901df57d735f7so869751wme.3
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 21:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DF+oV+D0EmGR2+lWEgsgXXjhFqQSp0Ne4CXExQwN36Q=;
 b=iqyiQ+tYBiNICwvdL4wfCASQiM0nY/IcXS0siA8s9w8YnWtK4dMz37fI4zWJpZcAVd
 veoKivkqa3ayc7Jnp9Y5yOfFwjNRtnbuzLGnSnm2/cfOz6tV6mlRMMxkv5jVshZpE7UZ
 4o/1dsIdG6LtQZmWhRYGdvtJMaRM7H0dv1k686Zn4cj466B8ACZYBvPKZ/ePhaOyZxft
 fp9ozIM0M/v4GstToA6j5ZkLsnPipnetupbHkMj2zCJVBlXGJ2XllcehE2bcT9VCMbV9
 qnIZm5Mk5aDARzB/WpCWpGOZLWssUKQqi382RQyAMBjQpJEVJqXMuF9ges7+OJPtPVEU
 xIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DF+oV+D0EmGR2+lWEgsgXXjhFqQSp0Ne4CXExQwN36Q=;
 b=AK8sD4xRLEERlShjm+sGE14a4Ct8toCcG+CmDVWuqXMVo94sT4HmDMnFH36L+NUKSk
 Ym+K+TAoSAgD9iatZxMkLxsFUQAFRZxxTL16Pbz05ojoUKbHwGLQknz41U+x2PWb/wiU
 JJm1J5QCLpi/h3IzsNfWqiZvwwkjN3cLuuxbCEdrBLOcuv4jFPesaMSMKlL7Qt7bUAd1
 qmez3XQ8A/ojPZYkPwpgSdQAq46F3AA8RXHjw1BUumh/1kmZmYoFwChXC4HEDo+XATJF
 6A7yFu3t8lSWIhya61F1REQFnosb9TRazjlTdqUkA2y+HROYVPE8hKR4/ia7bpJJneBo
 33JQ==
X-Gm-Message-State: AOAM532ZbzxLd94RP/WoHKxbW3h4cLK8ND038tbnGH4UfWyY91ITG1Mc
 0L/s8ZPU24WAbI6YZdsHLg8=
X-Google-Smtp-Source: ABdhPJzdIWJudsnZGVH5crceTn3Gre7VIDEeXT6jdFfJqjwmaEyTCpKWqHbgkqgIrdkJriy1BL2fDQ==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr2423318wmi.125.1624942271771; 
 Mon, 28 Jun 2021 21:51:11 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c7sm16740338wrs.23.2021.06.28.21.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 21:51:11 -0700 (PDT)
Subject: Re: [PATCH 5/5] tests/acceptance: Test PMON on the Fuloong 2E machine
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210624202747.1433023-1-f4bug@amsat.org>
 <20210624202747.1433023-6-f4bug@amsat.org>
 <f1c3c761-1ded-abc9-a66c-e73c4956c7d4@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <be4c8cfa-78d6-0ec8-60fb-463b3140f8fa@amsat.org>
Date: Tue, 29 Jun 2021 06:51:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f1c3c761-1ded-abc9-a66c-e73c4956c7d4@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 10:43 PM, BALATON Zoltan wrote:
> On Thu, 24 Jun 2021, Philippe Mathieu-Daudé wrote:
>> Test the PMON firmware. As the firmware is not redistributable,
>> it has to be downloaded manually first. Then it can be used by
>> providing its path via the PMON_BIN_PATH environment variable:
>>
>>  $ PMON2E_BIN_PATH=~/images/fuloong2e/pmon_2e.bin \
>>    AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>>    avocado --show=app,console run
>> tests/acceptance/machine_mips_fuloong2e.py
>>  Fetching asset from
>> tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial
>>
>>   (1/3)
>> tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_pmon_serial_console:
>>
>>  console: PMON2000 MIPS Initializing. Standby...
>>  console: ERRORPC=00000000 CONFIG=00030932
>>  console: PRID=00006302
>>  console: Init SDRAM Done!
>>  console: Sizing caches...
>>  console: Init caches...
>>  console: godson2 caches found
>>  console: Init caches done, cfg = 00030932
>>  console: Copy PMON to execute location...
>>  console: copy text section done.
>>  console: Copy PMON to execute location done.
>>  Uncompressing Bios........................OK,Booting Bios
>>  PASS (0.25 s)
>>   (2/3)
>> tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_pmon_framebuffer_console:
>>
>>  [...]
>>  Uncompressing Bios........................OK,Booting Bios
>>  console: FREQ
>>  console: FREI
>>  console: DONE
>>  console: TTYI
>>  console: TTYD
>>  console: ENVI
>>  console: MAPV
>>  console: Mfg  0, Id 60
>>  console: STDV
>>  console: SBDD
>>  console: PPCIH
>>  console: PCIS
>>  console: PCIR
>>  console: PCIW
>>  console: NETI
>>  console: RTCL
>>  console: PCID
>>  console: VGAI
>>  console: Default MODE_ID 2
>>  console: starting radeon init...
>>  console: radeon init done
>>  console: FRBI
>>  console: cfb_console init,fb=b4000000
>>  console: Video: Drawing the logo ...
>>  console: CONSOLE_SIZE 450560HSTI
>>  PASS (4.10 s)
>>   (3/3)
>> tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial:
>>
>>  console: Linux version 2.6.27.7lemote (root@debian) (gcc version
>> 4.1.3 20080623 (prerelease) (Debian 4.1.2-23)) #6 Fri Dec 12 00:11:25
>> CST 2008
>>  console: busclock=33000000,
>> cpuclock=-2145008360,memsize=256,highmemsize=0
>>  console: console [early0] enabled
>>  console: CPU revision is: 00006302 (ICT Loongson-2)
>>  PASS (0.19 s)
>>  RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT
>> 0 | CANCEL 0
>>  JOB TIME   : 5.10 s
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> tests/acceptance/machine_mips_fuloong2e.py | 62 ++++++++++++++++++++++
>> 1 file changed, 62 insertions(+)
>>
>> diff --git a/tests/acceptance/machine_mips_fuloong2e.py
>> b/tests/acceptance/machine_mips_fuloong2e.py
>> index 0ac285e2af1..4854ba98560 100644
>> --- a/tests/acceptance/machine_mips_fuloong2e.py
>> +++ b/tests/acceptance/machine_mips_fuloong2e.py
>> @@ -8,15 +8,77 @@
>> # SPDX-License-Identifier: GPL-2.0-or-later
>>
>> import os
>> +import time
>>
>> from avocado import skipUnless
>> from avocado_qemu import Test
>> from avocado_qemu import wait_for_console_pattern
>>
>> +from tesseract_utils import tesseract_available, tesseract_ocr
>> +
>> class MipsFuloong2e(Test):
>>
>>     timeout = 60
>>
>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted
>> code')
>> +    @skipUnless(os.getenv('PMON2E_BIN_PATH'), 'PMON2E_BIN_PATH not
>> available')
>> +    def test_pmon_serial_console(self):
>> +        """
>> +        :avocado: tags=arch:mips64el
>> +        :avocado: tags=machine:fuloong2e
>> +        :avocado: tags=endian:little
>> +        :avocado: tags=device:bonito64
>> +        :avocado: tags=device:via686b
>> +        """
>> +        pmon_hash = 'c812e1695d7b2320036f3ef494976969' # v1.1.2
>> +        pmon_path = self.fetch_asset('file://' +
>> os.getenv('PMON2E_BIN_PATH'),
>> +                                     asset_hash=pmon_hash,
>> algorithm='md5')
>> +
>> +        self.vm.set_console()
>> +        self.vm.add_args('-bios', pmon_path)
>> +        self.vm.launch()
>> +        wait_for_console_pattern(self, 'PMON2000 MIPS Initializing.
>> Standby...')
>> +        wait_for_console_pattern(self, 'Booting Bios')
>> +
>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted
>> code')
>> +    # Tesseract 4 adds a new OCR engine based on LSTM neural
>> networks. The
>> +    # new version is faster and more accurate than version 3. The
>> drawback is
>> +    # that it is still alpha-level software.
>> +    @skipUnless(tesseract_available(4), 'tesseract v4 OCR tool not
>> available')
>> +    @skipUnless(os.getenv('PMON2E_BIN_PATH'), 'PMON2E_BIN_PATH not
>> available')
>> +    def test_pmon_framebuffer_console(self):
>> +        """
>> +        :avocado: tags=arch:mips64el
>> +        :avocado: tags=machine:fuloong2e
>> +        :avocado: tags=endian:little
>> +        :avocado: tags=device:bonito64
>> +        :avocado: tags=device:ati-vga
>> +        """
>> +        screenshot_path = os.path.join(self.workdir, 'dump.ppm')
>> +
>> +        pmon_hash = 'c812e1695d7b2320036f3ef494976969' # v1.1.2
>> +        pmon_path = self.fetch_asset('file://' +
>> os.getenv('PMON2E_BIN_PATH'),
>> +                                     asset_hash=pmon_hash,
>> algorithm='md5')
>> +
>> +        self.vm.set_console()
>> +        self.vm.add_args('-bios', pmon_path,
>> +                         '-vga', 'std',
>> +                         '-device', 'ati-vga,model=rv100')
> 
> I think this is the default if you just drop -vga std so I don't know
> why you have that in the first place but then you should not need to add
> ati-vga explicitely.

I thought this is what you asked me here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg753832.html

Currently:

console: VGAI
console: Default MODE_ID 2
console: starting radeon init...
console: iobase=bfd0a200,mmbase=b6064000
console: mc_status=5
console: mc_status=5
console: mc_status=5
console: mc_status=5
console: ppll_div_3 = 301f4
console: Wrote: 0x00000043 0x000301f4 0x00000000 (0x00000000)
console: Wrote: rd=67, fd=500, pd=3
console: VCLK_ECP_CNTL = 000000C3
console: radeon init done
console: FRBI
console: cfb_console init,fb=b5000000
console: Video: Drawing the logo ...
console: CONSOLE_SIZE 450560HSTI
PASS (4.53 s)

Without '-vga std -device ati-vga,model=rv100':

console: VGAI
console: Default MODE_ID 2
console: starting radeon init...
INTERRUPTED: Test interrupted by SIGTERM
Runner error occurred: Timeout reached... (60.29 s)

With '-vga std':

console: VGAI
console: Default MODE_ID 2
console: starting radeon init...
console: iobase=bfd0a200,mmbase=b6064000
console: mc_status=5
console: mc_status=5
console: mc_status=5
console: mc_status=5
console: ppll_div_3 = 301f4
console: Wrote: 0x00000043 0x000301f4 0x00000000 (0x00000000)
console: Wrote: rd=67, fd=500, pd=3
console: VCLK_ECP_CNTL = 000000C3
console: radeon init done
console: FRBI
console: cfb_console init,fb=b5000000
console: Video: Drawing the logo ...
console: CONSOLE_SIZE 450560HSTI
PASS (4.34 s)

So I'll simply keep "-vga std".

Thanks,

Phil.

