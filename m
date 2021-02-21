Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E706320C10
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 18:28:13 +0100 (CET)
Received: from localhost ([::1]:40786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDsWi-0006RS-6m
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 12:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDsVb-0005sq-UK; Sun, 21 Feb 2021 12:27:03 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDsVZ-00055u-T0; Sun, 21 Feb 2021 12:27:03 -0500
Received: by mail-wr1-x436.google.com with SMTP id a4so14431698wro.8;
 Sun, 21 Feb 2021 09:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=tF4eNh85eh0bn6NbpeiEEndXzktbUY2q4Orgo5qnfm8=;
 b=QOGn9VJIDMryA2bc/RmcT9iNKDRsLEqNdBj68gzut0ZGL9Bwy5XCk0tV5mg1u31G2w
 qEMPzMu7qwBmjiSya5V5WFuF/r4HHyE7d3m8tcex08UdiGTC3ThKA5zJFe53a7mB/e5X
 AxIKcZn3NFcnsdNbCXQP5ggkCEzhbJEx5ZOtXvwkCw0x97qi/Swq9hSQWTeBw8gN+4B2
 UHoqAcB0QVMWRwaCX44tUmzyLhCMPssXpNy5GYwYYKslUpKgkp8P3tgnnLYGRq/xjz65
 u7unbMqGYigLd2xJP+dzBHKeFhWKHb2acWEyVcQQY+nj30h6KCazxSZjr18NepgTrWzF
 msGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=tF4eNh85eh0bn6NbpeiEEndXzktbUY2q4Orgo5qnfm8=;
 b=hV22ifqjEpjSouCN9x5s9aL3mngR3cEMTcsmThiPla61MaRG6RIoerlffnSt3fYtPX
 wRYl5IKDA03QR3v500Kh3TEJ0fES4G/881jZKiSXqm+vw8jMp3/u7g6fjQFbQFliziAx
 dVVJP0h3CCXZg0Rp6S/FUGLNnHikvVj+Kguwrns4zdetjhAXUbiIEB9O789GljJL8I+T
 M5XOCgFFI9P9NwUe26yTP2+mTN07tlJAYTAsIdoq5F2pPoP093A+ygA+C3bRI/iQ17sa
 CfDrlUEVuH7T0rpbQwEXCozazsBex2LBNvwDZ+mulhJbjRdtzr/Uu7i5d4vbbv9pHss4
 gr7A==
X-Gm-Message-State: AOAM530a+9HwGI5ZQ3XdieDMS1/uwf4DWocKT8p6EHinFzGGGXEBeohH
 7hgP+WdQdQSVeFg9tnIwpF9Meka8gXQ=
X-Google-Smtp-Source: ABdhPJwu+8qNIW1H9SgG3H+tC/ZpZK3QNyPePXuTxTiUi2QNCXFAsPwrgLS6Ss8icIekMJEohvZyVw==
X-Received: by 2002:adf:ee12:: with SMTP id y18mr996597wrn.102.1613928419665; 
 Sun, 21 Feb 2021 09:26:59 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e12sm24640984wrv.59.2021.02.21.09.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 09:26:59 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: tests: n810 arm failing
Message-ID: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
Date: Sun, 21 Feb 2021 18:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The n810 arm test failed on latest master:

https://gitlab.com/qemu-project/qemu/-/jobs/1045015424/artifacts/browse/build/tests/results/latest/test-results/26-tests_acceptance_machine_arm_n8x0.py_N8x0Machine.test_n810/

16:02:18 DEBUG| PARAMS (key=arch, path=*, default=arm) => 'arm'
16:02:18 DEBUG| PARAMS (key=machine, path=*, default=n810) => 'n810'
16:02:18 DEBUG| PARAMS (key=qemu_bin, path=*, default=./qemu-system-arm)
=> './qemu-system-arm'
16:02:18 DEBUG| VM launch command: './qemu-system-arm -display none -vga
none -chardev
socket,id=mon,path=/var/tmp/avo_qemu_sock_nv8s4w64/qemu-850-monitor.sock
-mon chardev=mon,mode=control -machine n810 -serial null -chardev
socket,id=console,path=/var/tmp/avo_qemu_sock_nv8s4w64/qemu-850-console.sock,server=on,wait=off
-serial chardev:console -kernel
/builds/qemu-project/qemu/avocado-cache/by_location/07af9de13713c2905e8c6a88d6600eb1bc885c5c/meego-arm-n8x0-1.0.80.20100712.1431-vmlinuz-2.6.35~rc4-129.1-n8x0
-append printk.time=0 console=ttyS1'
16:02:21 DEBUG| >>> {'execute': 'qmp_capabilities'}
16:02:21 DEBUG| <<< {'return': {}}
16:03:49 ERROR|
16:03:49 ERROR| Reproduced traceback from:
tests/venv/lib/python3.7/site-packages/avocado/core/test.py:767
16:03:49 ERROR| Traceback (most recent call last):
16:03:49 ERROR|   File "tests/acceptance/machine_arm_n8x0.py", line 49,
in test_n810
16:03:49 ERROR|     self.__do_test_n8x0()
16:03:49 ERROR|   File "tests/acceptance/machine_arm_n8x0.py", line 33,
in __do_test_n8x0
16:03:49 ERROR|     wait_for_console_pattern(self, 'TSC2005 driver
initializing')
16:03:49 ERROR|   File "tests/acceptance/avocado_qemu/__init__.py", line
140, in wait_for_console_pattern
16:03:49 ERROR|     _console_interaction(test, success_message,
failure_message, None, vm=vm)
16:03:49 ERROR|   File "tests/acceptance/avocado_qemu/__init__.py", line
92, in _console_interaction
16:03:49 ERROR|     msg = console.readline().strip()
16:03:49 ERROR|   File "/usr/lib/python3.7/socket.py", line 589, in readinto
16:03:49 ERROR|     return self._sock.recv_into(b)
16:03:49 ERROR|   File
"tests/venv/lib/python3.7/site-packages/avocado/plugins/runner.py", line
77, in sigterm_handler
16:03:49 ERROR|     raise RuntimeError("Test interrupted by SIGTERM")
16:03:49 ERROR| RuntimeError: Test interrupted by SIGTERM
16:03:49 ERROR|
16:03:49 DEBUG| Local variables:
16:03:49 DEBUG|  -> self <class 'machine_arm_n8x0.N8x0Machine'>:
26-tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810
16:03:49 DEBUG| >>> {'execute': 'quit'}
16:03:49 DEBUG| <<< {'return': {}}
16:03:49 DEBUG| DATA (filename=output.expected) => NOT FOUND (data
sources: variant, test, file)
16:03:49 DEBUG| DATA (filename=stdout.expected) => NOT FOUND (data
sources: variant, test, file)
16:03:49 DEBUG| DATA (filename=stderr.expected) => NOT FOUND (data
sources: variant, test, file)
16:03:49 ERROR| Traceback (most recent call last):
16:03:49 ERROR|   File
"tests/venv/lib/python3.7/site-packages/avocado/core/test.py", line 856,
in _run_avocado
    raise test_exception
16:03:49 ERROR|   File
"tests/venv/lib/python3.7/site-packages/avocado/core/test.py", line 762,
in _run_avocado
    testMethod()
16:03:49 ERROR|   File "tests/acceptance/machine_arm_n8x0.py", line 49,
in test_n810
    self.__do_test_n8x0()
16:03:49 ERROR|   File "tests/acceptance/machine_arm_n8x0.py", line 33,
in __do_test_n8x0
    wait_for_console_pattern(self, 'TSC2005 driver initializing')
16:03:49 ERROR|   File "tests/acceptance/avocado_qemu/__init__.py", line
140, in wait_for_console_pattern
    _console_interaction(test, success_message, failure_message, None,
vm=vm)
16:03:49 ERROR|   File "tests/acceptance/avocado_qemu/__init__.py", line
92, in _console_interaction
    msg = console.readline().strip()
16:03:49 ERROR|   File "/usr/lib/python3.7/socket.py", line 589, in readinto
    return self._sock.recv_into(b)
16:03:49 ERROR|   File
"tests/venv/lib/python3.7/site-packages/avocado/plugins/runner.py", line
77, in sigterm_handler
    raise RuntimeError("Test interrupted by SIGTERM")
16:03:49 ERROR| RuntimeError: Test interrupted by SIGTERM
16:03:49 ERROR| ERROR
26-tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810 ->
RuntimeError: Test interrupted by SIGTERM
16:03:49 INFO |
Runner error occurred: Timeout reached
Original status: ERROR
{'name':
'26-tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810',
'logdir':
'26-tests_acceptance_machine_arm_n8x0.py_N8x0Machine.test_n810',
'logfile':
'26-tests_acceptance_machine_arm_n8x0.py_N8x0Machine.test_n810/debug.log',
'status': 'ERROR', 'running': False, 'paused': False, 'time_start':
1613923338.892834, 'time_elapsed': 90.31178283691406, 'time_end':
1613923429.2046168, 'fail_reason': 'Test interrupted by SIGTERM',
'fail_class': 'RuntimeError', 'traceback': 'Traceback (most recent call
last):\n  File
"tests/venv/lib/python3.7/site-packages/avocado/core/test.py", line 856,
in _run_avocado\n    raise test_exception\n  File
"tests/venv/lib/python3.7/site-packages/avocado/core/test.py", line 762,
in _run_avocado\n    testMethod()\n  File
"tests/acceptance/machine_arm_n8x0.py", line 49, in test_n810\n
self.__do_test_n8x0()\n  File "tests/acceptance/machine_arm_n8x0.py",
line 33, in __do_test_n8x0\n    wait_for_console_pattern(self, \'TSC2005
driver initializing\')\n  File
"tests/acceptance/avocado_qemu/__init__.py", line 140, in
wait_for_console_pattern\n    _console_interaction(test,
success_message, failure_message, None, vm=vm)\n  File
"tests/acceptance/avocado_qemu/__init__.py", line 92, in
_console_interaction\n    msg = console.readline().strip()\n  File
"/usr/lib/python3.7/socket.py", line 589, in readinto\n    return
self._sock.recv_into(b)\n  File
"tests/venv/lib/python3.7/site-packages/avocado/plugins/runner.py", line
77, in sigterm_handler\n    raise RuntimeError("Test interrupted by
SIGTERM")\nRuntimeError: Test interrupted by SIGTERM\n', 'timeout': 90,
'whiteboard': '', 'phase': 'FINISHED', 'class_name': 'N8x0Machine',
'job_logdir': 'tests/results/job-2021-02-21T16.00-e662b93',
'job_unique_id': 'e662b936b3c04ad082359ee970534ac7ae7ec3bc', 'params': []}

