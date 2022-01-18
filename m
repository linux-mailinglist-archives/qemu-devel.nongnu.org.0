Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97DC4925B6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:30:35 +0100 (CET)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9ndC-0003Ua-PH
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:30:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9nMc-0007d7-WC
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:13:30 -0500
Received: from [2a00:1450:4864:20::331] (port=42671
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9nMa-0008AL-7d
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 07:13:25 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so6849246wmb.1
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 04:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EwZD6Seaa97WsKXlepEiyF1tKp012KupQuRJHlC7iPE=;
 b=qTX2A5g19XT2ciTqikamh5XVCqiQqvP4rZX/AlUeClE8frrUREDDFlsWg0YDTprRVk
 ZjgSv0Zv5P9odav6Pewvzvrm+mYZs8lXhxXhUzinFsA//NvZuC2cJNuSVx1erYyerM47
 CG9iL9PrBLMD/2bAAyHwPrjavIEHupt0CYj5eES3TkD08dCGm+1+EcQfjlepm127LYif
 8DKaNtdP054Lu+03XE4hi5e4EpaajceKbz6kaEWEQTTVg1aob1+mfd1j40oBDfOJr27w
 2WNT9vPXj5xcDQAV6I5xEWsjHxeI3ttebRE86QGRdxBXeSnGZLS5mGvVJXCZ6zAzkKRC
 Z5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EwZD6Seaa97WsKXlepEiyF1tKp012KupQuRJHlC7iPE=;
 b=kNayqxwtSgqFp/RRWtz20/Z/BRtmusfZPcEJTBQAgZcQRq3pshr+k21IPAjU56CUCl
 YgyDyt4xufEJz4u4fhatyXYkteheucLeH40CNaSEGyFStMeJTxYC8+LNcrDWykCNWC0r
 RmWVWHeupkjwZt3TeCLGzoTwrNUePg/lR7DqDgyB9GAoh1OXdw7528g41qxP8JtBX0T/
 H/9ejlSrzpYkP0MPk7oYLc2pUDLyIxydz8Ou2xSslw6Qh5vzsGt5w/GV+SN+PB8qGkcf
 D9lSK8L4goqyl1H9NJN9Tvb28UEKefk8kwXSr5bek9z8U+XpOZDgy9fNoRiULISairun
 UP5A==
X-Gm-Message-State: AOAM530jp3DWlDZu8L6W82Ux/UYiijJoVLgcJaEwdsIeyD6KUbxa8oJM
 kwNPR1oaJjnEMbsa95eZVKami0qIkHlTfGposf4HJw==
X-Google-Smtp-Source: ABdhPJzpZgjdN47pj2hXJtHKWjPZNcXHLXXFzWZxsNoLYRyYqRE504++cR7rBnwEHJ1OJgIj5vdFKMHwm9vxE7uYOkI=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr24761249wrv.521.1642507999918; 
 Tue, 18 Jan 2022 04:13:19 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
 <YeU/YCUI59f33PBh@redhat.com>
 <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
In-Reply-To: <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jan 2022 12:13:07 +0000
Message-ID: <CAFEAcA__xayWZJWCmcPQqR40rKsNk0JxbAe7Hx8V65wSuXCfEg@mail.gmail.com>
Subject: Re: iotest 040, 041, intermittent failure in netbsd VM
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Jan 2022 at 20:35, John Snow <jsnow@redhat.com> wrote:
> I do expect this to print more information on failure than it
> currently is, though (bug somewhere in machine.py, I think).
> Can you please try applying this temporary patch and running `./check
> -qcow2 040 041` until you see a breakage and show me the output from
> that?

Having fixed my setup to not use an ancient host QEMU, here's
the relevant bit of the log:

  TEST   iotest-qcow2: 037
  TEST   iotest-qcow2: 038 [not run]
  TEST   iotest-qcow2: 039 [not run]
  TEST   iotest-qcow2: 040 [fail]
QEMU          --
"/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-system-aarch64"
-nodefaults -display none -accel qtest -machine virt
QEMU_IMG      --
"/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-io"
--cache writeback --aio threads -f qcow2
QEMU_NBD      --
"/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- NetBSD/amd64 localhost 9.2
TEST_DIR      -- /home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmp1h12r7ev
GDB_OPTIONS   --
VALGRIND_QEMU --
PRINT_QEMU_OUTPUT --

--- /home/qemu/qemu-test.vdrI02/src/tests/qemu-iotests/040.out
+++ 040.out.bad
@@ -1,5 +1,95 @@
-.................................................................
+.......ERROR:qemu.aqmp.qmp_client.qemu-12407:Failed to establish
connection: concurrent.futures._base.CancelledError
+ERROR:qemu.machine.machine:Error launching VM
+ERROR:qemu.machine.machine:Process was forked, waiting on it
+ERROR:qemu.machine.machine:Command:
'/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-system-aarch64
-display none -vga none -chardev
socket,id=mon,path=/tmp/tmp1h12r7ev/qemu-12407-monitor.sock -mon
chardev=mon,mode=control -qtest
unix:path=/tmp/tmp1h12r7ev/qemu-12407-qtest.sock -accel qtest
-nodefaults -display none -accel qtest -machine virt -drive
if=none,id=drive0,file=/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/scratch/test.img,format=qcow2,cache=writeback,aio=threads,node-name=top,backing.node-name=mid,backing.backing.node-name=base
-device virtio-scsi -device scsi-hd,id=scsi0,drive=drive0'
+ERROR:qemu.machine.machine:Output: "qemu-system-aarch64: -chardev
socket,id=mon,path=/tmp/tmp1h12r7ev/qemu-12407-monitor.sock: Failed to
connect to '/tmp/tmp1h12r7ev/qemu-12407-monitor.sock': No such file or
directory\n"
+ERROR:qemu.machine.machine:exitcode: 1
+E..........................................ERROR:qemu.aqmp.qmp_client.qemu-12407:Failed
to establish connection: concurrent.futures._base.CancelledError
+ERROR:qemu.machine.machine:Error launching VM
+ERROR:qemu.machine.machine:Process was forked, waiting on it
+ERROR:qemu.machine.machine:Command:
'/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-system-aarch64
-display none -vga none -chardev
socket,id=mon,path=/tmp/tmp1h12r7ev/qemu-12407-monitor.sock -mon
chardev=mon,mode=control -qtest
unix:path=/tmp/tmp1h12r7ev/qemu-12407-qtest.sock -accel qtest
-nodefaults -display none -accel qtest -machine virt -drive
if=none,id=drive0,file=/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/scratch/test.img,format=qcow2,cache=writeback,aio=threads,node-name=top,backing.node-name=mid,backing.backing.node-name=base
-device virtio-scsi -device scsi-hd,id=scsi0,drive=drive0'
+ERROR:qemu.machine.machine:Output: "qemu-system-aarch64: -chardev
socket,id=mon,path=/tmp/tmp1h12r7ev/qemu-12407-monitor.sock: Failed to
connect to '/tmp/tmp1h12r7ev/qemu-12407-monitor.sock': No such file or
directory\n"
+ERROR:qemu.machine.machine:exitcode: 1
+E....ERROR:qemu.aqmp.qmp_client.qemu-12407:Failed to establish
connection: concurrent.futures._base.CancelledError
+ERROR:qemu.machine.machine:Error launching VM
+ERROR:qemu.machine.machine:Process was forked, waiting on it
+ERROR:qemu.machine.machine:Command:
'/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/../../qemu-system-aarch64
-display none -vga none -chardev
socket,id=mon,path=/tmp/tmp1h12r7ev/qemu-12407-monitor.sock -mon
chardev=mon,mode=control -qtest
unix:path=/tmp/tmp1h12r7ev/qemu-12407-qtest.sock -accel qtest
-nodefaults -display none -accel qtest -machine virt -drive
if=none,id=drive0,file=/home/qemu/qemu-test.vdrI02/build/tests/qemu-iotests/scratch/test.img,format=qcow2,cache=writeback,aio=threads,node-name=top,backing.node-name=mid,backing.backing.node-name=base
-device virtio-scsi -device scsi-hd,id=scsi0,drive=drive0'
+ERROR:qemu.machine.machine:Output: "qemu-system-aarch64: -chardev
socket,id=mon,path=/tmp/tmp1h12r7ev/qemu-12407-monitor.sock: Failed to
connect to '/tmp/tmp1h12r7ev/qemu-12407-monitor.sock': No such file or
directory\n"
+ERROR:qemu.machine.machine:exitcode: 1
+E.........
+======================================================================
+ERROR: test_device_not_found (__main__.TestActiveZeroLengthImage)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.vdrI02/src/tests/qemu-iotests/040", line
94, in setUp
+    self.vm.launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/machine.py",
line 399, in launch
+    self._launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/machine.py",
line 437, in _launch
+    self._post_launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/qtest.py",
line 147, in _post_launch
+    super()._post_launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/machine.py",
line 340, in _post_launch
+    self._qmp.accept(self._qmp_timer)
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/aqmp/legacy.py",
line 69, in accept
+    timeout
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/aqmp/legacy.py",
line 42, in _sync
+    asyncio.wait_for(future, timeout=timeout)
+  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
run_until_complete
+    return future.result()
+  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
+    raise futures.TimeoutError()
+concurrent.futures._base.TimeoutError
+
+======================================================================
+ERROR: test_commit_node (__main__.TestSingleDrive)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.vdrI02/src/tests/qemu-iotests/040", line
94, in setUp
+    self.vm.launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/machine.py",
line 399, in launch
+    self._launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/machine.py",
line 437, in _launch
+    self._post_launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/qtest.py",
line 147, in _post_launch
+    super()._post_launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/machine.py",
line 340, in _post_launch
+    self._qmp.accept(self._qmp_timer)
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/aqmp/legacy.py",
line 69, in accept
+    timeout
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/aqmp/legacy.py",
line 42, in _sync
+    asyncio.wait_for(future, timeout=timeout)
+  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
run_until_complete
+    return future.result()
+  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
+    raise futures.TimeoutError()
+concurrent.futures._base.TimeoutError
+
+======================================================================
+ERROR: test_implicit_node (__main__.TestSingleDrive)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.vdrI02/src/tests/qemu-iotests/040", line
94, in setUp
+    self.vm.launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/machine.py",
line 399, in launch
+    self._launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/machine.py",
line 437, in _launch
+    self._post_launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/qtest.py",
line 147, in _post_launch
+    super()._post_launch()
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/machine/machine.py",
line 340, in _post_launch
+    self._qmp.accept(self._qmp_timer)
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/aqmp/legacy.py",
line 69, in accept
+    timeout
+  File "/home/qemu/qemu-test.vdrI02/src/python/qemu/aqmp/legacy.py",
line 42, in _sync
+    asyncio.wait_for(future, timeout=timeout)
+  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
run_until_complete
+    return future.result()
+  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
+    raise futures.TimeoutError()
+concurrent.futures._base.TimeoutError
+
 ----------------------------------------------------------------------
 Ran 65 tests

-OK
+FAILED (errors=3)
  TEST   iotest-qcow2: 041
  TEST   iotest-qcow2: 042
  TEST   iotest-qcow2: 043
(etc)


thanks
-- PMM

