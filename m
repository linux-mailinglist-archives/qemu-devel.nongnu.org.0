Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F6E2910DE
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 11:07:14 +0200 (CEST)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTiBF-0000FP-SL
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 05:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTi9J-00087x-UV
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 05:05:16 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTi9H-0004Fl-Nd
 for qemu-devel@nongnu.org; Sat, 17 Oct 2020 05:05:13 -0400
Received: by mail-wr1-x444.google.com with SMTP id n18so6069906wrs.5
 for <qemu-devel@nongnu.org>; Sat, 17 Oct 2020 02:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZUtXUj/2EK+eOG9m2QETZU7XaQjxhd2gm3i/Yb9Zw+I=;
 b=fURx43OzQaAOe67i8J3ZXD97XHFlps+rCbWTlk0Ij2KumAWp8RJ1+cIeIBLidLqPGV
 wz+BwmPfUnsy2JMoZ2jlL5Q2JxvKlav6u0Aga8HoMfYI1ojVGCec6LE+MKwsjII67USt
 PTQAAwLtFvFhUQJAe/Ao+05TUEU4i/MGiRZUCDXZvTAInjKWvnCYjmcc7IEMaRCLv6Kv
 nzcJ77qYwJHicor4QQPGemAmX/1O4iNkpGaieqtwW+Jv8DZT1jtIxg+Jy9vboCE7bFRd
 y6egN+vd73aIvR4lt10rEhi9JbMUnZIT7aNgT6veMUxo0es67JSYhX5Q4Tx7IqrwRjMf
 52gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZUtXUj/2EK+eOG9m2QETZU7XaQjxhd2gm3i/Yb9Zw+I=;
 b=Vp6vlf07pd0ni+6Z3WawD9rlHdjQa1k4XHCmAWtBY02UgDK/eompc6BP1UEYOB+dz6
 7V9BhJKQEGfPuYftTNN2oMImCUSkzU8f5J6UOP/0b0UbxggcK9rLVbAqPMtOb5g6EuQJ
 nH1eacWAcxWiOJ1eqknvASOf971j4TP4dFe+XTfJ5Q//yw6bs1G4CZs+EK7aBdEtd0VC
 kyHyzqgGN+9BHzroi9Q6g/+704nxgX2m1+0LOpPvnHctBe3HDWtTRoZwX8uslcJXxGTf
 Weo8sIlY/BBZGD/xJ9GCD1GN8cYuyY7aUY9W+iA6c9kQfLGO1k2aJid9ZcYQw6jNf4FL
 m5EA==
X-Gm-Message-State: AOAM533DJFVrCuKLkZ2C/ItwWWSNgpqvCpNppHsNhoDqDyg6r4mJqcJ8
 O9hvmy0dznM6v3RRZOEu7BU=
X-Google-Smtp-Source: ABdhPJwRXZG5Ib83fXclO+5oolMCnyapgYZyKApFIlmRU3fO3PoTIHYyh6BGKohAi0CSP+QrQDVO+A==
X-Received: by 2002:adf:bacc:: with SMTP id w12mr9725481wrg.66.1602925510251; 
 Sat, 17 Oct 2020 02:05:10 -0700 (PDT)
Received: from [192.168.1.36] (117.red-83-52-172.dynamicip.rima-tde.net.
 [83.52.172.117])
 by smtp.gmail.com with ESMTPSA id u2sm6447753wme.1.2020.10.17.02.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Oct 2020 02:05:09 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: add MIPS record/replay tests
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <160276110297.2705.10918105269658307206.stgit@pasha-ThinkPad-X280>
 <5247571b-d5dd-2506-1101-00f9eaddd29c@amsat.org>
 <13408eb3-a789-a715-cc27-695e0f513bff@amsat.org>
Message-ID: <e4cc2acd-6b6c-ace8-a127-3d2adb954d81@amsat.org>
Date: Sat, 17 Oct 2020 11:05:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <13408eb3-a789-a715-cc27-695e0f513bff@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_00=-1.9, BITCOIN_SPAM_02=1.212,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.253, PDS_BTC_ID=0.499,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, ehabkost@redhat.com,
 wrampazz@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/16/20 6:50 PM, Philippe Mathieu-Daudé wrote:
> On 10/16/20 5:40 PM, Philippe Mathieu-Daudé wrote:
>> On 10/15/20 1:25 PM, Pavel Dovgalyuk wrote:
>>> This patch adds MIPS-targeted acceptance tests for
>>> record/replay functions.
>>>
>>> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>>> ---
>>>   0 files changed
>>>
>>> diff --git a/tests/acceptance/replay_kernel.py 
>>> b/tests/acceptance/replay_kernel.py
>>> index 952f429cac..6c3d1ec3fb 100644
>>> --- a/tests/acceptance/replay_kernel.py
>>> +++ b/tests/acceptance/replay_kernel.py
>>> @@ -9,6 +9,8 @@
>>>   # later.  See the COPYING file in the top-level directory.
>>>   import os
>>> +import lzma
>>> +import shutil
>>>   import logging
>>>   import time
>>> @@ -19,7 +21,7 @@ from avocado.utils import archive
>>>   from avocado.utils import process
>>>   from boot_linux_console import LinuxKernelTest
>>> -class ReplayKernel(LinuxKernelTest):
>>> +class ReplayKernelBase(LinuxKernelTest):
>>>       """
>>>       Boots a Linux kernel in record mode and checks that the console
>>>       is operational and the kernel command line is properly passed
>>> @@ -74,6 +76,7 @@ class ReplayKernel(LinuxKernelTest):
>>>           logger = logging.getLogger('replay')
>>>           logger.info('replay overhead {:.2%}'.format(t2 / t1 - 1))
>>> +class ReplayKernelNormal(ReplayKernelBase):
>>>       @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>>>       def test_x86_64_pc(self):
>>>           """
>>> @@ -91,6 +94,103 @@ class ReplayKernel(LinuxKernelTest):
>>>           self.run_rr(kernel_path, kernel_command_line, 
>>> console_pattern, shift=5)
>>> +    def test_mips_malta(self):
>>> +        """
>>> +        :avocado: tags=arch:mips
>>> +        :avocado: tags=machine:malta
>>> +        :avocado: tags=endian:big
>>> +        """
>>> +        deb_url = ('http://snapshot.debian.org/archive/debian/'
>>> +                   '20130217T032700Z/pool/main/l/linux-2.6/'
>>> +                   'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
>>> +        deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
>>> +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>>> +        kernel_path = self.extract_from_deb(deb_path,
>>> + '/boot/vmlinux-2.6.32-5-4kc-malta')
>>> +        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 
>>> 'console=ttyS0'
>>> +        console_pattern = 'Kernel command line: %s' % 
>>> kernel_command_line
>>> +
>>> +        self.run_rr(kernel_path, kernel_command_line, 
>>> console_pattern, shift=5)
>>> +
>>> +    def test_mips64el_malta(self):
>>> +        """
>>> +        This test requires the ar tool to extract "data.tar.gz" from
>>> +        the Debian package.
>>> +
>>> +        The kernel can be rebuilt using this Debian kernel source 
>>> [1] and
>>> +        following the instructions on [2].
>>> +
>>> +        [1] http://snapshot.debian.org/package/linux-2.6/2.6.32-48/
>>> +            #linux-source-2.6.32_2.6.32-48
>>> +        [2] https://kernel-team.pages.debian.net/kernel-handbook/
>>> +            ch-common-tasks.html#s-common-official
>>> +
>>> +        :avocado: tags=arch:mips64el
>>> +        :avocado: tags=machine:malta
>>> +        """
>>> +        deb_url = ('http://snapshot.debian.org/archive/debian/'
>>> +                   '20130217T032700Z/pool/main/l/linux-2.6/'
>>> + 'linux-image-2.6.32-5-5kc-malta_2.6.32-48_mipsel.deb')
>>> +        deb_hash = '1aaec92083bf22fda31e0d27fa8d9a388e5fc3d5'
>>> +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>>> +        kernel_path = self.extract_from_deb(deb_path,
>>> + '/boot/vmlinux-2.6.32-5-5kc-malta')
>>> +        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 
>>> 'console=ttyS0'
>>> +        console_pattern = 'Kernel command line: %s' % 
>>> kernel_command_line
>>> +        self.run_rr(kernel_path, kernel_command_line, 
>>> console_pattern, shift=5)
>>> +
>>> +    def do_test_mips_malta32el_nanomips(self, kernel_path_xz):
>>> +        kernel_path = self.workdir + "kernel"
>>> +        with lzma.open(kernel_path_xz, 'rb') as f_in:
>>> +            with open(kernel_path, 'wb') as f_out:
>>> +                shutil.copyfileobj(f_in, f_out)
>>> +
>>> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
>>> +                               + 'mem=256m@@0x0 '
>>> +                               + 'console=ttyS0')
>>> +        console_pattern = 'Kernel command line: %s' % 
>>> kernel_command_line
>>> +        self.run_rr(kernel_path, kernel_command_line, 
>>> console_pattern, shift=5,
>>> +                    args=('-cpu', 'I7200'))
>>> +
>>> +    def test_mips_malta32el_nanomips_4k(self):
>>> +        """
>>> +        :avocado: tags=arch:mipsel
>>> +        :avocado: tags=machine:malta
>>> +        :avocado: tags=endian:little
>>> +        """
>>> +        kernel_url = 
>>> ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
>>> + 'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
>>> +                      'generic_nano32r6el_page4k.xz')
>>> +        kernel_hash = '477456aafd2a0f1ddc9482727f20fe9575565dd6'
>>> +        kernel_path_xz = self.fetch_asset(kernel_url, 
>>> asset_hash=kernel_hash)
>>> +        self.do_test_mips_malta32el_nanomips(kernel_path_xz)
>>> +
>>> +    def test_mips_malta32el_nanomips_16k_up(self):
>>> +        """
>>> +        :avocado: tags=arch:mipsel
>>> +        :avocado: tags=machine:malta
>>> +        :avocado: tags=endian:little
>>> +        """
>>> +        kernel_url = 
>>> ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
>>> + 'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
>>> +                      'generic_nano32r6el_page16k_up.xz')
>>> +        kernel_hash = 'e882868f944c71c816e832e2303b7874d044a7bc'
>>> +        kernel_path_xz = self.fetch_asset(kernel_url, 
>>> asset_hash=kernel_hash)
>>> +        self.do_test_mips_malta32el_nanomips(kernel_path_xz)
>>> +
>>> +    def test_mips_malta32el_nanomips_64k_dbg(self):
>>> +        """
>>> +        :avocado: tags=arch:mipsel
>>> +        :avocado: tags=machine:malta
>>> +        :avocado: tags=endian:little
>>> +        """
>>> +        kernel_url = 
>>> ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
>>> + 'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
>>> +                      'generic_nano32r6el_page64k_dbg.xz')
>>> +        kernel_hash = '18d1c68f2e23429e266ca39ba5349ccd0aeb7180'
>>> +        kernel_path_xz = self.fetch_asset(kernel_url, 
>>> asset_hash=kernel_hash)
>>> +        self.do_test_mips_malta32el_nanomips(kernel_path_xz)
>>> +
>>
>> All the nanomips tests timeout (--enable-debug --extra-cflags=-ggdb
>> --enable-debug-tcg), can you move them to ReplayKernelSlow?
> 
> Patch applied to mips-next without the nanomips tests.

ReplayKernelSlow.test_mips_malta_cpio timeouting :/
https://gitlab.com/philmd/qemu/-/jobs/795992189#L556

> 
> Please submit them as a new patch.
> 
>>
>>>       def test_aarch64_virt(self):
>>>           """
>>>           :avocado: tags=arch:aarch64
>>> @@ -302,3 +402,70 @@ class ReplayKernel(LinuxKernelTest):
>>>           file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
>>>           self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf',
>>>                                    args=('-cpu', 'dc233c'))
>>> +
>>> +class ReplayKernelSlow(ReplayKernelBase):
>>> +    timeout = 180
>>> +
>>> +    def test_mips_malta_cpio(self):
>>> +        """
>>> +        :avocado: tags=arch:mips
>>> +        :avocado: tags=machine:malta
>>> +        :avocado: tags=endian:big
>>> +        :avocado: tags=slowness:high
>>> +        """
>>> +        # Override the timeout, because this kernel includes
>>> +        # an inner loop which is executed with TB recompilings during
>>> +        # replay, making it very slow.
>>
>> I think this comment makes sense once for the class
>> (before "timeout = 180"), not for each test.
>>
>>> +        deb_url = ('http://snapshot.debian.org/archive/debian/'
>>> +                   '20160601T041800Z/pool/main/l/linux/'
>>> +                   'linux-image-4.5.0-2-4kc-malta_4.5.5-1_mips.deb')
>>> +        deb_hash = 'a3c84f3e88b54e06107d65a410d1d1e8e0f340f8'
>>> +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>>> +        kernel_path = self.extract_from_deb(deb_path,
>>> + '/boot/vmlinux-4.5.0-2-4kc-malta')
>>> +        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
>>> +                      
>>> '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
>>> +                      'mips/rootfs.cpio.gz')
>>> +        initrd_hash = 'bf806e17009360a866bf537f6de66590de349a99'
>>> +        initrd_path_gz = self.fetch_asset(initrd_url, 
>>> asset_hash=initrd_hash)
>>> +        initrd_path = self.workdir + "rootfs.cpio"
>>> +        archive.gzip_uncompress(initrd_path_gz, initrd_path)
>>> +
>>> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
>>> +                               + 'console=ttyS0 console=tty '
>>> +                               + 'rdinit=/sbin/init noreboot')
>>> +        console_pattern = 'Boot successful.'
>>> +        self.run_rr(kernel_path, kernel_command_line, 
>>> console_pattern, shift=5,
>>> +                    args=('-initrd', initrd_path))
>>> +
>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 
>>> 'untrusted code')
>>> +    def test_mips64el_malta_5KEc_cpio(self):
>>> +        """
>>> +        :avocado: tags=arch:mips64el
>>> +        :avocado: tags=machine:malta
>>> +        :avocado: tags=endian:little
>>> +        :avocado: tags=slowness:high
>>> +        """
>>> +        # Override the timeout, because this kernel includes
>>> +        # an inner loop which is executed with TB recompilings during
>>> +        # replay, making it very slow.
>>> +        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
>>> +                      'raw/9ad2df38/mips/malta/mips64el/'
>>> +                      'vmlinux-3.19.3.mtoman.20150408')
>>> +        kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
>>> +        kernel_path = self.fetch_asset(kernel_url, 
>>> asset_hash=kernel_hash)
>>> +        initrd_url = ('https://github.com/groeck/linux-build-test/'
>>> +                      'raw/8584a59e/rootfs/'
>>> +                      'mipsel64/rootfs.mipsel64r1.cpio.gz')
>>> +        initrd_hash = '1dbb8a396e916847325284dbe2151167'
>>> +        initrd_path_gz = self.fetch_asset(initrd_url, algorithm='md5',
>>> +                                          asset_hash=initrd_hash)
>>> +        initrd_path = self.workdir + "rootfs.cpio"
>>> +        archive.gzip_uncompress(initrd_path_gz, initrd_path)
>>> +
>>> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
>>> +                               + 'console=ttyS0 console=tty '
>>> +                               + 'rdinit=/sbin/init noreboot')
>>> +        console_pattern = 'Boot successful.'
>>> +        self.run_rr(kernel_path, kernel_command_line, 
>>> console_pattern, shift=5,
>>> +                    args=('-initrd', initrd_path, '-cpu', '5KEc'))
>>>
>>
>> With nanomips tests moved to ReplayKernelSlow:
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
> 

