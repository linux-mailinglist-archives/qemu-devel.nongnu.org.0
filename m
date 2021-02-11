Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59593188AC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:57:01 +0100 (CET)
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9ee-0003es-Ue
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA9cv-0002cP-AS
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:55:13 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA9cs-0006TJ-Uj
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:55:12 -0500
Received: by mail-wm1-x329.google.com with SMTP id o10so5775555wmc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=6ExDQqsI/x+3T9Nrg3bkrMcqGqw3kevEv4u8PLAVrxc=;
 b=EBcq6+XslGRlnxH/qIVGiKkOGrk4grQ3MtNwLuevz/f1GdpIDgN10RHM+JJbwzqVY0
 JJi1APx+bXAuendZa7JkUTpNMPVOpWRTWx9azUtlHEK7OwzZ+MMQIeW0G4VPoGsAkkyh
 h7Sv1xNasQTHnntHn5RTYK7QWKmYeuR0+45PHfhIOCr3DurwXffLhHC5BDfA7USp+3Lw
 lfehu4jJ6UhipJxIApzUC8uHVbikujqOpiATtFUs8zXLBHLX6Z84s9J23uj8v5vAGOXT
 ksNC4JlWhK1LivCBEChbcNQT3m8X1ZnPgXRblks5lZeEQ0E7WtX60C77ZET9gWKcxMR/
 3vFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
 :user-agent:mime-version:content-language;
 bh=6ExDQqsI/x+3T9Nrg3bkrMcqGqw3kevEv4u8PLAVrxc=;
 b=WC630PonTLIdCrILMmr7vFlwaYEZpkALO0fcuWtlBrGd+Ipx68iI2N03DJXIQ4jKqE
 /aWkQIiz73rNF03NB4BBg6eUN480XuPFQdUTEQnlYkPmv+dj6WsVFt8PNnTRPvCFLPbV
 bANBwqEarEz4gq/XTFiuJ/sLKLfDgv/CL9/AJcqp6s72mKLP/ngbzGHwCTrHnRa+/J6H
 pNzIq9KZJSDsCIyV+qxKzTRkAs3pWHSLf4u2E54lqoTHpnuZmP4gMYbsV/uSSXY2V3z9
 79nJiivEIxieOwsKdqcFSZWVUwaywWa7tFPd/C8vTnSXy7uYFEZgXiMZwBsGu8ex5Rk1
 WddA==
X-Gm-Message-State: AOAM5308eeYJKG8xeisdt1FaOmfFCWPPxtBbAKy5jO5orcfjDkp6eY8d
 HQ/seKBlZEbIpBdKXEHNX2M=
X-Google-Smtp-Source: ABdhPJxyLCPkmPTDenl9F2562F2vEbFbqOdwld4z+tjjoUjOQRuOJaz6fAFPPgYMO6H+j1jDj4c0/g==
X-Received: by 2002:a1c:ab88:: with SMTP id u130mr4746322wme.185.1613040908843; 
 Thu, 11 Feb 2021 02:55:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h14sm9244107wmq.45.2021.02.11.02.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:55:08 -0800 (PST)
To: Jia Liu <proljc@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: acceptance-system-centos job failure running or1k_sim
Message-ID: <ea331a46-cc36-ae63-fc7d-223dae10b2e2@amsat.org>
Date: Thu, 11 Feb 2021 11:55:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------99B345A1BC2CF39D3E8D9C36"
Content-Language: en-US
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, Stafford Horne <shorne@gmail.com>,
 avocado-devel <avocado-devel@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------99B345A1BC2CF39D3E8D9C36
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

I got the following error with the or1k_sim image
(acceptance-system-centos job):
https://gitlab.com/philmd/qemu/-/jobs/1022309593

(09/55) tests/acceptance:BootLinuxConsole.test_or1k_sim:  INTERRUPTED
22:50:22 DEBUG| CPU: OpenRISC-13 (revision 8) @20 MHz
...
22:50:23 DEBUG| console [ttyS0] enabled
22:50:23 DEBUG| console [ttyS0] enabled
22:50:23 DEBUG| bootconsole [uart0] disabled
22:50:23 DEBUG| bootconsole [uart0] disabled
22:50:23 DEBUG| Freeing unused kernel memory: 1176K
22:50:23 DEBUG| This architecture does not have kernel memory protection.
22:51:53 ERROR| RuntimeError: Test interrupted by SIGTERM

Not reproducible, so probably bad luck.

Still, since the artifact logs are removed after 2 days, I attached
the debug.log to this mail.

Note, earlier failures were displayed on the console which is
archived by Gitlab so we can still access them, example:
https://gitlab.com/qemu-project/qemu/-/jobs/793741261#L322

Regards,

Phil.

--------------99B345A1BC2CF39D3E8D9C36
Content-Type: text/x-log; charset=UTF-8;
 name="debug.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="debug.log"

22:50:22 DEBUG| PARAMS (key=3Darch, path=3D*, default=3Dor1k) =3D> 'or1k'=

22:50:22 DEBUG| PARAMS (key=3Dmachine, path=3D*, default=3Dor1k-sim) =3D>=
 'or1k-sim'
22:50:22 DEBUG| PARAMS (key=3Dqemu_bin, path=3D*, default=3D./qemu-system=
-or1k) =3D> './qemu-system-or1k'
22:50:22 DEBUG| VM launch command: './qemu-system-or1k -display none -vga=
 none -chardev socket,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_sk_2kyqq/qem=
u-989-monitor.sock -mon chardev=3Dmon,mode=3Dcontrol -machine or1k-sim -c=
hardev socket,id=3Dconsole,path=3D/var/tmp/avo_qemu_sock_sk_2kyqq/qemu-98=
9-console.sock,server=3Don,wait=3Doff -serial chardev:console -kernel /va=
r/tmp/avocado_dlewrnd4/avocado_job_k8m44k90/09-tests_acceptance_boot_linu=
x_console.py_BootLinuxConsole.test_or1k_sim/day20/vmlinux'
22:50:22 DEBUG| >>> {'execute': 'qmp_capabilities'}
22:50:22 DEBUG| <<< {'return': {}}
22:50:22 DEBUG| Compiled-in FDT at c0312000
22:50:22 DEBUG| Linux version 4.13.3 (thuth@thuth.remote.csb) (gcc versio=
n 5.4.0 (Buildroot 2018.05.2)) #7 Sat Dec 15 20:13:34 CET 2018
22:50:22 DEBUG| CPU: OpenRISC-13 (revision 8) @20 MHz
22:50:22 DEBUG| -- dcache disabled
22:50:22 DEBUG| -- icache disabled
22:50:22 DEBUG| -- dmmu:  128 entries, 1 way(s)
22:50:22 DEBUG| -- immu:  128 entries, 1 way(s)
22:50:22 DEBUG| -- additional features:
22:50:22 DEBUG| -- power management
22:50:22 DEBUG| -- PIC
22:50:22 DEBUG| -- timer
22:50:22 DEBUG| setup_memory: Memory: 0x0-0x2000000
22:50:22 DEBUG| Setting up paging and PTEs.
22:50:22 DEBUG| map_ram: Memory: 0x0-0x2000000
22:50:22 DEBUG| itlb_miss_handler c0002160
22:50:22 DEBUG| dtlb_miss_handler c0002000
22:50:22 DEBUG| OpenRISC Linux -- http://openrisc.io
22:50:22 DEBUG| Built 1 zonelists in Zone order, mobility grouping off.  =
Total pages: 4080
22:50:22 DEBUG| Kernel command line: console=3Duart,mmio,0x90000000,11520=
0
22:50:22 DEBUG| earlycon: uart0 at MMIO 0x90000000 (options '115200')
22:50:22 DEBUG| bootconsole [uart0] enabled
22:50:22 DEBUG| PID hash table entries: 128 (order: -4, 512 bytes)
22:50:22 DEBUG| Dentry cache hash table entries: 4096 (order: 1, 16384 by=
tes)
22:50:22 DEBUG| Inode-cache hash table entries: 2048 (order: 0, 8192 byte=
s)
22:50:22 DEBUG| Sorting __ex_table...
22:50:22 DEBUG| Memory: 28144K/32768K available (2322K kernel code, 109K =
rwdata, 592K rodata, 1176K init, 188K bss, 4624K reserved, 0K cma-reserve=
d)
22:50:22 DEBUG| mem_init_done ...........................................=

22:50:22 DEBUG| SLUB: HWalign=3D16, Order=3D0-3, MinObjects=3D0, CPUs=3D1=
, Nodes=3D1
22:50:22 DEBUG| NR_IRQS: 32, nr_irqs: 32, preallocated irqs: 0
22:50:23 DEBUG| clocksource: openrisc_timer: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 95563022313 ns
22:50:23 DEBUG| Console: colour dummy device 80x25
22:50:23 DEBUG| 40.00 BogoMIPS (lpj=3D80000)
22:50:23 DEBUG| pid_max: default: 32768 minimum: 301
22:50:23 DEBUG| Mount-cache hash table entries: 2048 (order: 0, 8192 byte=
s)
22:50:23 DEBUG| Mountpoint-cache hash table entries: 2048 (order: 0, 8192=
 bytes)
22:50:23 DEBUG| devtmpfs: initialized
22:50:23 DEBUG| clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffff=
ffff, max_idle_ns: 7645041785100000 ns
22:50:23 DEBUG| futex hash table entries: 256 (order: -2, 3072 bytes)
22:50:23 DEBUG| clocksource: Switched to clocksource openrisc_timer
22:50:23 DEBUG| workingset: timestamp_bits=3D30 max_order=3D12 bucket_ord=
er=3D0
22:50:23 DEBUG| random: fast init done
22:50:23 DEBUG| Block layer SCSI generic (bsg) driver version 0.4 loaded =
(major 253)
22:50:23 DEBUG| io scheduler noop registered
22:50:23 DEBUG| io scheduler deadline registered
22:50:23 DEBUG| io scheduler cfq registered (default)
22:50:23 DEBUG| io scheduler mq-deadline registered
22:50:23 DEBUG| io scheduler kyber registered
22:50:23 DEBUG| Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
22:50:23 DEBUG| 90000000.serial: ttyS0 at MMIO 0x90000000 (irq =3D 2, bas=
e_baud =3D 1250000) is a 16550A
22:50:23 DEBUG| console [ttyS0] enabled
22:50:23 DEBUG| console [ttyS0] enabled
22:50:23 DEBUG| bootconsole [uart0] disabled
22:50:23 DEBUG| bootconsole [uart0] disabled
22:50:23 DEBUG| Freeing unused kernel memory: 1176K
22:50:23 DEBUG| This architecture does not have kernel memory protection.=

22:51:53 ERROR|=20
22:51:53 ERROR| Reproduced traceback from: build/tests/venv/lib64/python3=
=2E6/site-packages/avocado/core/test.py:767
22:51:53 ERROR| Traceback (most recent call last):
22:51:53 ERROR|   File "build/tests/acceptance/boot_linux_console.py", li=
ne 1065, in test_or1k_sim
22:51:53 ERROR|     self.do_test_advcal_2018('20', tar_hash, 'vmlinux')
22:51:53 ERROR|   File "build/tests/acceptance/boot_linux_console.py", li=
ne 1040, in do_test_advcal_2018
22:51:53 ERROR|     self.wait_for_console_pattern('QEMU advent calendar')=

22:51:53 ERROR|   File "build/tests/acceptance/boot_linux_console.py", li=
ne 54, in wait_for_console_pattern
22:51:53 ERROR|     vm=3Dvm)
22:51:53 ERROR|   File "build/tests/acceptance/avocado_qemu/__init__.py",=
 line 130, in wait_for_console_pattern
22:51:53 ERROR|     _console_interaction(test, success_message, failure_m=
essage, None, vm=3Dvm)
22:51:53 ERROR|   File "build/tests/acceptance/avocado_qemu/__init__.py",=
 line 82, in _console_interaction
22:51:53 ERROR|     msg =3D console.readline().strip()
22:51:53 ERROR|   File "/usr/lib64/python3.6/socket.py", line 586, in rea=
dinto
22:51:53 ERROR|     return self._sock.recv_into(b)
22:51:53 ERROR|   File "build/tests/venv/lib64/python3.6/site-packages/av=
ocado/plugins/runner.py", line 77, in sigterm_handler
22:51:53 ERROR|     raise RuntimeError("Test interrupted by SIGTERM")
22:51:53 ERROR| RuntimeError: Test interrupted by SIGTERM
22:51:53 ERROR|=20
22:51:53 DEBUG| Local variables:
22:51:53 DEBUG|  -> tar_hash <class 'str'>: 20334cdaf386108c530ff0badaecc=
955693027dd
22:51:53 DEBUG|  -> self <class 'boot_linux_console.BootLinuxConsole'>: 0=
9-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_or1k_sim
22:51:53 DEBUG| >>> {'execute': 'quit'}
22:51:53 DEBUG| <<< {'return': {}}
22:51:53 DEBUG| DATA (filename=3Doutput.expected) =3D> NOT FOUND (data so=
urces: variant, test, file)
22:51:53 DEBUG| DATA (filename=3Dstdout.expected) =3D> NOT FOUND (data so=
urces: variant, test, file)
22:51:53 DEBUG| DATA (filename=3Dstderr.expected) =3D> NOT FOUND (data so=
urces: variant, test, file)
22:51:53 ERROR| Traceback (most recent call last):

22:51:53 ERROR|   File "build/tests/venv/lib64/python3.6/site-packages/av=
ocado/core/test.py", line 856, in _run_avocado
    raise test_exception

22:51:53 ERROR|   File "build/tests/venv/lib64/python3.6/site-packages/av=
ocado/core/test.py", line 762, in _run_avocado
    testMethod()

22:51:53 ERROR|   File "build/tests/acceptance/boot_linux_console.py", li=
ne 1065, in test_or1k_sim
    self.do_test_advcal_2018('20', tar_hash, 'vmlinux')

22:51:53 ERROR|   File "build/tests/acceptance/boot_linux_console.py", li=
ne 1040, in do_test_advcal_2018
    self.wait_for_console_pattern('QEMU advent calendar')

22:51:53 ERROR|   File "build/tests/acceptance/boot_linux_console.py", li=
ne 54, in wait_for_console_pattern
    vm=3Dvm)

22:51:53 ERROR|   File "build/tests/acceptance/avocado_qemu/__init__.py",=
 line 130, in wait_for_console_pattern
    _console_interaction(test, success_message, failure_message, None, vm=
=3Dvm)

22:51:53 ERROR|   File "build/tests/acceptance/avocado_qemu/__init__.py",=
 line 82, in _console_interaction
    msg =3D console.readline().strip()

22:51:53 ERROR|   File "/usr/lib64/python3.6/socket.py", line 586, in rea=
dinto
    return self._sock.recv_into(b)

22:51:53 ERROR|   File "build/tests/venv/lib64/python3.6/site-packages/av=
ocado/plugins/runner.py", line 77, in sigterm_handler
    raise RuntimeError("Test interrupted by SIGTERM")

22:51:53 ERROR| RuntimeError: Test interrupted by SIGTERM

22:51:53 ERROR| ERROR 09-tests/acceptance/boot_linux_console.py:BootLinux=
Console.test_or1k_sim -> RuntimeError: Test interrupted by SIGTERM
22:51:53 INFO |=20

Runner error occurred: Timeout reached
Original status: ERROR
{'name': '09-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test=
_or1k_sim', 'logdir': 'build/tests/results/job-2021-02-10T22.50-0d5d33e/t=
est-results/09-tests_acceptance_boot_linux_console.py_BootLinuxConsole.te=
st_or1k_sim', 'logfile': 'build/tests/results/job-2021-02-10T22.50-0d5d33=
e/test-results/09-tests_acceptance_boot_linux_console.py_BootLinuxConsole=
=2Etest_or1k_sim/debug.log', 'status': 'ERROR', 'running': False, 'paused=
': False, 'time_start': 1612997422.4942405, 'time_elapsed': 90.7433395385=
7422, 'time_end': 1612997513.23758, 'fail_reason': 'Test interrupted by S=
IGTERM', 'fail_class': 'RuntimeError', 'traceback': 'Traceback (most rece=
nt call last):\n  File "build/tests/venv/lib64/python3.6/site-packages/av=
ocado/core/test.py", line 856, in _run_avocado\n    raise test_exception\=
n  File "build/tests/venv/lib64/python3.6/site-packages/avocado/core/test=
=2Epy", line 762, in _run_avocado\n    testMethod()\n  File "build/tests/=
acceptance/boot_linux_console.py", line 1065, in test_or1k_sim\n    self.=
do_test_advcal_2018(\'20\', tar_hash, \'vmlinux\')\n  File "build/tests/a=
cceptance/boot_linux_console.py", line 1040, in do_test_advcal_2018\n    =
self.wait_for_console_pattern(\'QEMU advent calendar\')\n  File "build/te=
sts/acceptance/boot_linux_console.py", line 54, in wait_for_console_patte=
rn\n    vm=3Dvm)\n  File "build/tests/acceptance/avocado_qemu/__init__.py=
", line 130, in wait_for_console_pattern\n    _console_interaction(test, =
success_message, failure_message, None, vm=3Dvm)\n  File "build/tests/acc=
eptance/avocado_qemu/__init__.py", line 82, in _console_interaction\n    =
msg =3D console.readline().strip()\n  File "/usr/lib64/python3.6/socket.p=
y", line 586, in readinto\n    return self._sock.recv_into(b)\n  File "bu=
ild/tests/venv/lib64/python3.6/site-packages/avocado/plugins/runner.py", =
line 77, in sigterm_handler\n    raise RuntimeError("Test interrupted by =
SIGTERM")\nRuntimeError: Test interrupted by SIGTERM\n', 'timeout': 90, '=
whiteboard': '', 'phase': 'FINISHED', 'class_name': 'BootLinuxConsole', '=
job_logdir': 'build/tests/results/job-2021-02-10T22.50-0d5d33e', 'job_uni=
que_id': '0d5d33e13c6ac6c949aa9382f0ca12f47bc19e2a', 'params': []}

--------------99B345A1BC2CF39D3E8D9C36--

