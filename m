Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DFB341A29
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:36:32 +0100 (CET)
Received: from localhost ([::1]:39190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCUZ-00062W-Uy
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lNCT5-0005VM-Lc
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:35:01 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lNCT2-0004nC-Dp
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:34:59 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j7so8588625wrd.1
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=bl8kiw0XIygzRGp6sTJLEahQBShXogL9JHn/nwpqIQc=;
 b=QPacVTS09OfljxnVrzb+JNlTb63So0W+Z7EixQgqIH9i/UtMtzkV3A1fpfUA0vBqaY
 iZYsBMCIgo0MlGdWtcO2hG2LUuKSjbqL+oJ+7tgMVpPv2S9RLYgvxUDfrnPenZQt1Ooz
 1qeMQvGk/XEUAFQ+rkI9ALURk+jR3mfgNAoyNVWl0hooSlOxMmdBNrZslE8TRfYOuL2V
 NKlVH17gUbgVqBS4eWWJYrnLFvD5PkWpNMjGFK5P+pdF4tiy3AvKXrY9QuM3+PKoAPDt
 Px2NzA/carBShV8TU4+DB33hg/x/CKe6b2Y7zKGOiayGdaqXPZAOh6bjc0y216tQkGoo
 rdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=bl8kiw0XIygzRGp6sTJLEahQBShXogL9JHn/nwpqIQc=;
 b=n1jvv96p8o+gMARBlHcQttXfcSuVimh0xD7fjptzj4+Xm/YJ7aj74LOHhxUMqSGmRZ
 WxVWqjFaWugoaTv3l2Bypt7UIGAQVndXKEDU3VuSCE5D5LBRV/878cN9HLzhcwlKAb9U
 dB+lfOisYvqwPggY6lfwLtCecTHecamvSlApmMmZakMV6FzdL9Qx1PrDiEkGmdYllUyo
 GPhNobKJGKn7PW6ZAvBQ2rcxeEApA7d7UQ/Q8tKI77X2X60PTjk5mMPJuboUmT4ncgUq
 bUIuXNHkrHSb7QcvM70tWhUayN1nR5pPAuNjDgSjc7kKQ/+nGn7/RNcwM2xdCp6ePRtI
 JxaQ==
X-Gm-Message-State: AOAM531h5nqF6OiYFiFrtAi7WRoyTyIgk8JAqMsckEhlYj3NShUuC9or
 ydi6NtR6bFlLFn4pQwPtApMYtdFt9irhqA==
X-Google-Smtp-Source: ABdhPJyVw8uUd+6ui1A0XbykFNX1Bb45qJ/qINAr2ypw5ERjtpqUCbwcGGnDC2dTQ7ZnqSv6XSpmYw==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr3904572wrr.336.1616150092577; 
 Fri, 19 Mar 2021 03:34:52 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i8sm5548010wmi.6.2021.03.19.03.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 03:34:52 -0700 (PDT)
To: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: ReplayKernelNormal.test_mips_malta functional test timeouting
Message-ID: <be1a7ab0-8b02-51ec-9ac4-e8b7ec622987@amsat.org>
Date: Fri, 19 Mar 2021 11:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=no autolearn_force=no
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

Hi Pavel,

The "normal" test_mips_malta timeouted on acceptance-system-fedora job:

 (23/36)
tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_mips_malta:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
reached\nOriginal status: ERROR\n{'name':
'23-tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_mips_malta',
'logdir':
'/builds/philmd/qemu2/build/tests/results/job-2021-03-19T09.38-e5751b5/...
(120.52 s)

artifact's debug.log:

09:43:04 DEBUG| PARAMS (key=arch, path=*, default=mips) => 'mips'
09:43:04 DEBUG| PARAMS (key=machine, path=*, default=malta) => 'malta'
09:43:04 DEBUG| PARAMS (key=qemu_bin, path=*,
default=./qemu-system-mips) => './qemu-system-mips'
09:43:04 INFO | Running 'ar t
/builds/philmd/qemu2/avocado-cache/by_location/44bac84408e676508a64ecba77e99389ac8fe10d/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb'
09:43:04 DEBUG| [stdout] debian-binary
09:43:04 INFO | Command 'ar t
/builds/philmd/qemu2/avocado-cache/by_location/44bac84408e676508a64ecba77e99389ac8fe10d/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb'
finished with 0 after 0.0019164085388183594s
09:43:04 DEBUG| [stdout] control.tar.gz
09:43:04 DEBUG| [stdout] data.tar.gz
09:43:04 INFO | Running 'ar x
/builds/philmd/qemu2/avocado-cache/by_location/44bac84408e676508a64ecba77e99389ac8fe10d/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb
data.tar.gz'
09:43:04 INFO | Command 'ar x
/builds/philmd/qemu2/avocado-cache/by_location/44bac84408e676508a64ecba77e99389ac8fe10d/linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb
data.tar.gz' finished with 0 after 0.047913551330566406s
09:43:05 INFO | recording the execution...
09:43:05 DEBUG| VM launch command: './qemu-system-mips -display none
-vga none -chardev
socket,id=mon,path=/var/tmp/avo_qemu_sock_z2x1qvna/qemu-601-monitor.sock
-mon chardev=mon,mode=control -machine malta -chardev
socket,id=console,path=/var/tmp/avo_qemu_sock_z2x1qvna/qemu-601-console.sock,server=on,wait=off
-serial chardev:console -icount
shift=5,rr=record,rrfile=/var/tmp/avocado__uxji4xt/avocado_job_j3sdjxv9/23-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_mips_malta/replay.bin
-kernel
/var/tmp/avocado__uxji4xt/avocado_job_j3sdjxv9/23-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_mips_malta/boot/vmlinux-2.6.32-5-4kc-malta
-append printk.time=1 panic=-1 console=ttyS0 -net none -no-reboot'
09:43:05 DEBUG| >>> {'execute': 'qmp_capabilities'}
09:43:05 DEBUG| <<< {'return': {}}
09:43:05 DEBUG| [    0.000000] Initrd not found or empty - disabling initrd
09:43:05 DEBUG| [    0.000000] Zone PFN ranges:
09:43:05 DEBUG| [    0.000000]   DMA      0x00000000 -> 0x00001000
09:43:05 DEBUG| [    0.000000]   Normal   0x00001000 -> 0x00007fff
09:43:05 DEBUG| [    0.000000] Movable zone start PFN for each node
09:43:05 DEBUG| [    0.000000] early_node_map[1] active PFN ranges
09:43:05 DEBUG| [    0.000000]     0: 0x00000000 -> 0x00007fff
09:43:05 DEBUG| [    0.000000] Built 1 zonelists in Zone order, mobility
grouping on.  Total pages: 32511
09:43:05 DEBUG| [    0.000000] Kernel command line: printk.time=1
panic=-1 console=ttyS0
09:43:05 DEBUG| >>> {'execute': 'quit'}
09:43:05 DEBUG| <<< {'return': {}}
09:43:05 INFO | finished the recording with log size 21979 bytes
09:43:05 INFO | elapsed time 0.13 sec
09:43:05 INFO | replaying the execution...
09:43:05 DEBUG| VM launch command: './qemu-system-mips -display none
-vga none -chardev
socket,id=mon,path=/var/tmp/avo_qemu_sock_opalepcn/qemu-601-monitor.sock
-mon chardev=mon,mode=control -machine malta -chardev
socket,id=console,path=/var/tmp/avo_qemu_sock_opalepcn/qemu-601-console.sock,server=on,wait=off
-serial chardev:console -icount
shift=5,rr=replay,rrfile=/var/tmp/avocado__uxji4xt/avocado_job_j3sdjxv9/23-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_mips_malta/replay.bin
-kernel
/var/tmp/avocado__uxji4xt/avocado_job_j3sdjxv9/23-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_mips_malta/boot/vmlinux-2.6.32-5-4kc-malta
-append printk.time=1 panic=-1 console=ttyS0 -net none -no-reboot'
09:43:05 DEBUG| >>> {'execute': 'qmp_capabilities'}
09:43:05 DEBUG| <<< {'return': {}}
09:43:06 DEBUG| [    0.000000] Initrd not found or empty - disabling initrd
09:43:06 DEBUG| [    0.000000] Zone PFN ranges:
09:43:06 DEBUG| [    0.000000]   DMA      0x00000000 -> 0x00001000
09:43:06 DEBUG| [    0.000000]   Normal   0x00001000 -> 0x00007fff
09:43:06 DEBUG| [    0.000000] Movable zone start PFN for each node
09:43:06 DEBUG| [    0.000000] early_node_map[1] active PFN ranges
09:43:06 DEBUG| [    0.000000]
09:45:05 ERROR|
09:45:05 ERROR| Reproduced traceback from:
/builds/philmd/qemu2/build/tests/venv/lib64/python3.9/site-packages/avocado/core/test.py:767
09:45:05 ERROR| Traceback (most recent call last):
09:45:05 ERROR|   File
"/builds/philmd/qemu2/build/tests/acceptance/replay_kernel.py", line
114, in test_mips_malta
09:45:05 ERROR|     self.run_rr(kernel_path, kernel_command_line,
console_pattern, shift=5)
09:45:05 ERROR|   File
"/builds/philmd/qemu2/build/tests/acceptance/replay_kernel.py", line 75,
in run_rr
09:45:05 ERROR|     t2 = self.run_vm(kernel_path, kernel_command_line,
console_pattern,
09:45:05 ERROR|   File
"/builds/philmd/qemu2/build/tests/acceptance/replay_kernel.py", line 58,
in run_vm
09:45:05 ERROR|     self.wait_for_console_pattern(console_pattern, vm)
09:45:05 ERROR|   File
"/builds/philmd/qemu2/build/tests/acceptance/boot_linux_console.py",
line 52, in wait_for_console_pattern
09:45:05 ERROR|     wait_for_console_pattern(self, success_message,
09:45:05 ERROR|   File
"/builds/philmd/qemu2/build/tests/acceptance/avocado_qemu/__init__.py",
line 140, in wait_for_console_pattern
09:45:05 ERROR|     _console_interaction(test, success_message,
failure_message, None, vm=vm)
09:45:05 ERROR|   File
"/builds/philmd/qemu2/build/tests/acceptance/avocado_qemu/__init__.py",
line 92, in _console_interaction
09:45:05 ERROR|     msg = console.readline().strip()
09:45:05 ERROR|   File "/usr/lib64/python3.9/socket.py", line 704, in
readinto
09:45:05 ERROR|     return self._sock.recv_into(b)
09:45:05 ERROR|   File
"/builds/philmd/qemu2/build/tests/venv/lib64/python3.9/site-packages/avocado/plugins/runner.py",
line 77, in sigterm_handler
09:45:05 ERROR|     raise RuntimeError("Test interrupted by SIGTERM")
09:45:05 ERROR| RuntimeError: Test interrupted by SIGTERM

What to do, simply implement the timeout again?
Allow failure?

Thanks,

Phil.

