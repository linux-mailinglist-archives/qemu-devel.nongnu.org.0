Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA55343A39
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 08:08:12 +0100 (CET)
Received: from localhost ([::1]:45702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOEfb-0004il-DH
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 03:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lOEeB-0004EL-3B
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 03:06:43 -0400
Received: from mail.ispras.ru ([83.149.199.84]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lOEe8-0008RQ-GH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 03:06:42 -0400
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 69B7040755D6;
 Mon, 22 Mar 2021 07:06:28 +0000 (UTC)
Subject: Re: ReplayKernelNormal.test_mips_malta functional test timeouting
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <be1a7ab0-8b02-51ec-9ac4-e8b7ec622987@amsat.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <e5e8ebba-914a-5c1a-7578-9d33e647ffe8@ispras.ru>
Date: Mon, 22 Mar 2021 10:06:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <be1a7ab0-8b02-51ec-9ac4-e8b7ec622987@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.03.2021 13:34, Philippe Mathieu-Daudé wrote:
> Hi Pavel,
> 
> The "normal" test_mips_malta timeouted on acceptance-system-fedora job:
> 
>   (23/36)
> tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_mips_malta:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
> reached\nOriginal status: ERROR\n{'name':
> '23-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_mips_malta',
> 'logdir':
> '/builds/philmd/qemu2/build/tests/results/job-2021-03-19T09.38-e5751b5/...
> (120.52 s)
> 
> artifact's debug.log:
> 
> 09:43:04 DEBUG| PARAMS (key=arch, path=*, default=mips) => 'mips'
> 09:43:04 DEBUG| PARAMS (key=machine, path=*, default=malta) => 'malta'
> 09:43:04 DEBUG| PARAMS (key=qemu_bin, path=*,
> default=./qemu-system-mips) => './qemu-system-mips'
> 09:43:04 INFO | Running 'ar t
> /builds/philmd/qemu2/avocado-cache/by_location/44bac84408e676508a64ecba77e99389ac8fe10d/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb'
> 09:43:04 DEBUG| [stdout] debian-binary
> 09:43:04 INFO | Command 'ar t
> /builds/philmd/qemu2/avocado-cache/by_location/44bac84408e676508a64ecba77e99389ac8fe10d/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb'
> finished with 0 after 0.0019164085388183594s
> 09:43:04 DEBUG| [stdout] control.tar.gz
> 09:43:04 DEBUG| [stdout] data.tar.gz
> 09:43:04 INFO | Running 'ar x
> /builds/philmd/qemu2/avocado-cache/by_location/44bac84408e676508a64ecba77e99389ac8fe10d/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb
> data.tar.gz'
> 09:43:04 INFO | Command 'ar x
> /builds/philmd/qemu2/avocado-cache/by_location/44bac84408e676508a64ecba77e99389ac8fe10d/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb
> data.tar.gz' finished with 0 after 0.047913551330566406s
> 09:43:05 INFO | recording the execution...
> 09:43:05 DEBUG| VM launch command: './qemu-system-mips -display none
> -vga none -chardev
> socket,id=mon,path=/var/tmp/avo_qemu_sock_z2x1qvna/qemu-601-monitor.sock
> -mon chardev=mon,mode=control -machine malta -chardev
> socket,id=console,path=/var/tmp/avo_qemu_sock_z2x1qvna/qemu-601-console.sock,server=on,wait=off
> -serial chardev:console -icount
> shift=5,rr=record,rrfile=/var/tmp/avocado__uxji4xt/avocado_job_j3sdjxv9/23-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_mips_malta/replay.bin
> -kernel
> /var/tmp/avocado__uxji4xt/avocado_job_j3sdjxv9/23-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_mips_malta/boot/vmlinux-2.6.32-5-4kc-malta
> -append printk.time=1 panic=-1 console=ttyS0 -net none -no-reboot'
> 09:43:05 DEBUG| >>> {'execute': 'qmp_capabilities'}
> 09:43:05 DEBUG| <<< {'return': {}}
> 09:43:05 DEBUG| [    0.000000] Initrd not found or empty - disabling initrd
> 09:43:05 DEBUG| [    0.000000] Zone PFN ranges:
> 09:43:05 DEBUG| [    0.000000]   DMA      0x00000000 -> 0x00001000
> 09:43:05 DEBUG| [    0.000000]   Normal   0x00001000 -> 0x00007fff
> 09:43:05 DEBUG| [    0.000000] Movable zone start PFN for each node
> 09:43:05 DEBUG| [    0.000000] early_node_map[1] active PFN ranges
> 09:43:05 DEBUG| [    0.000000]     0: 0x00000000 -> 0x00007fff
> 09:43:05 DEBUG| [    0.000000] Built 1 zonelists in Zone order, mobility
> grouping on.  Total pages: 32511
> 09:43:05 DEBUG| [    0.000000] Kernel command line: printk.time=1
> panic=-1 console=ttyS0
> 09:43:05 DEBUG| >>> {'execute': 'quit'}
> 09:43:05 DEBUG| <<< {'return': {}}
> 09:43:05 INFO | finished the recording with log size 21979 bytes
> 09:43:05 INFO | elapsed time 0.13 sec
> 09:43:05 INFO | replaying the execution...
> 09:43:05 DEBUG| VM launch command: './qemu-system-mips -display none
> -vga none -chardev
> socket,id=mon,path=/var/tmp/avo_qemu_sock_opalepcn/qemu-601-monitor.sock
> -mon chardev=mon,mode=control -machine malta -chardev
> socket,id=console,path=/var/tmp/avo_qemu_sock_opalepcn/qemu-601-console.sock,server=on,wait=off
> -serial chardev:console -icount
> shift=5,rr=replay,rrfile=/var/tmp/avocado__uxji4xt/avocado_job_j3sdjxv9/23-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_mips_malta/replay.bin
> -kernel
> /var/tmp/avocado__uxji4xt/avocado_job_j3sdjxv9/23-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_mips_malta/boot/vmlinux-2.6.32-5-4kc-malta
> -append printk.time=1 panic=-1 console=ttyS0 -net none -no-reboot'
> 09:43:05 DEBUG| >>> {'execute': 'qmp_capabilities'}
> 09:43:05 DEBUG| <<< {'return': {}}
> 09:43:06 DEBUG| [    0.000000] Initrd not found or empty - disabling initrd
> 09:43:06 DEBUG| [    0.000000] Zone PFN ranges:
> 09:43:06 DEBUG| [    0.000000]   DMA      0x00000000 -> 0x00001000
> 09:43:06 DEBUG| [    0.000000]   Normal   0x00001000 -> 0x00007fff
> 09:43:06 DEBUG| [    0.000000] Movable zone start PFN for each node
> 09:43:06 DEBUG| [    0.000000] early_node_map[1] active PFN ranges
> 09:43:06 DEBUG| [    0.000000]
> 09:45:05 ERROR|
> 09:45:05 ERROR| Reproduced traceback from:
> /builds/philmd/qemu2/build/tests/venv/lib64/python3.9/site-packages/avocado/core/test.py:767
> 09:45:05 ERROR| Traceback (most recent call last):
> 09:45:05 ERROR|   File
> "/builds/philmd/qemu2/build/tests/acceptance/replay_kernel.py", line
> 114, in test_mips_malta
> 09:45:05 ERROR|     self.run_rr(kernel_path, kernel_command_line,
> console_pattern, shift=5)
> 09:45:05 ERROR|   File
> "/builds/philmd/qemu2/build/tests/acceptance/replay_kernel.py", line 75,
> in run_rr
> 09:45:05 ERROR|     t2 = self.run_vm(kernel_path, kernel_command_line,
> console_pattern,
> 09:45:05 ERROR|   File
> "/builds/philmd/qemu2/build/tests/acceptance/replay_kernel.py", line 58,
> in run_vm
> 09:45:05 ERROR|     self.wait_for_console_pattern(console_pattern, vm)
> 09:45:05 ERROR|   File
> "/builds/philmd/qemu2/build/tests/acceptance/boot_linux_console.py",
> line 52, in wait_for_console_pattern
> 09:45:05 ERROR|     wait_for_console_pattern(self, success_message,
> 09:45:05 ERROR|   File
> "/builds/philmd/qemu2/build/tests/acceptance/avocado_qemu/__init__.py",
> line 140, in wait_for_console_pattern
> 09:45:05 ERROR|     _console_interaction(test, success_message,
> failure_message, None, vm=vm)
> 09:45:05 ERROR|   File
> "/builds/philmd/qemu2/build/tests/acceptance/avocado_qemu/__init__.py",
> line 92, in _console_interaction
> 09:45:05 ERROR|     msg = console.readline().strip()
> 09:45:05 ERROR|   File "/usr/lib64/python3.9/socket.py", line 704, in
> readinto
> 09:45:05 ERROR|     return self._sock.recv_into(b)
> 09:45:05 ERROR|   File
> "/builds/philmd/qemu2/build/tests/venv/lib64/python3.9/site-packages/avocado/plugins/runner.py",
> line 77, in sigterm_handler
> 09:45:05 ERROR|     raise RuntimeError("Test interrupted by SIGTERM")
> 09:45:05 ERROR| RuntimeError: Test interrupted by SIGTERM
> 
> What to do, simply implement the timeout again?

I thought that it could be a RR bug and tried it on my machine without 
non-upstreamed patches.
The test didn't fail in ~10 runs.

> Allow failure?

CC'ed Cleber.
I think it could be the already seen avocado/qemu socket problem.

Pavel Dovgalyuk

