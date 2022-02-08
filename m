Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5964ADEDB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:04:04 +0100 (CET)
Received: from localhost ([::1]:43574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTuM-0001xS-Jl
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:04:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHRfT-0007EL-Pq
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:40:31 -0500
Received: from [2a00:1450:4864:20::429] (port=42793
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHRfI-0000qZ-Pn
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:40:30 -0500
Received: by mail-wr1-x429.google.com with SMTP id h6so12435813wrb.9
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 06:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GPVL/kvBvTALoPctTdPj2T19Mg/pV4Qfjj+DZwl2Ez4=;
 b=equSVxld2uQEW6f8AwK252oa38ScVZF+0dYC32T9krSzNNk01M2yVYXvTrUNs145bQ
 /MMi1zbT2AUmP+8riP5ouRzS2xtZhF39eLQED2mXnXtYimdhEyAgq8EHEdhQ7G0aTYpC
 7d3h++GP1X8fsoR4MEPxTLY06OS+Z4XnN5IYllGwqpyGAhz7NePqxDwvA+j3WST+PXxr
 5kj01r2FqzNID6/hP0F0pmRFZ6Km4/0G6rpucu21X1bTZqT0Q6zsPTWrj7w4EA6U6BiA
 Cwn9iunZ5nxmoo8cY2vCJxZYoUnTvL8Uhuk2C9UDldTVogK43UT1pvPzecBbLAeiTPRU
 PjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GPVL/kvBvTALoPctTdPj2T19Mg/pV4Qfjj+DZwl2Ez4=;
 b=e0L49fuHQcMx5skKx+rmwlhNNhVOJquhzOZbYN2s8duXby1EydTFWoj/qQY/nheuvp
 AJxtR+lK0heuQuhsnFryVEnIxnzm8beE1v/AvQQ65GdEU/nCvUpoQZ+e51fSMrQH2xKp
 iN1kSQMMYSmIZ1MDM9QSyOGz0sWyrqKxVonIakrc7OIJp0xT6ss9+qLugbhrqCMW5wLi
 jvxfTVKQDqYa0lI4cdjpFHbYnZiwXTrV6c0PJARwTdTEP6O8Wa/NSOkluMPF8RHQEimw
 31QjGZ/iKhQNlj/Y6/EBmPbJElJ06fOia17cxQmCZKV3RYczDba87Vc4fIjE586EAMlA
 SwXg==
X-Gm-Message-State: AOAM533pVBV7PBnq3enk9WHWcD18OnVr4ckbe2OAMGF5cPhHvWvbomcm
 4ONIfc41fufjci9Ws2B+OH4O7XSv920d0wzOdbNOjQ==
X-Google-Smtp-Source: ABdhPJykJEUjxF4s5nHYsRDUCDffsqmJyr1ms4/A8z83vzuWWcE8cdqFaSI425u8xWqVIsnMRIP/7AUGwo96rWGYVcI=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr3993110wrz.2.1644331212087; 
 Tue, 08 Feb 2022 06:40:12 -0800 (PST)
MIME-Version: 1.0
References: <20220203015946.1330386-1-jsnow@redhat.com>
 <CAFEAcA_OXJ6C1UTFXiy6x1gp4VRmaWQY7ntU8N-3-O+TGcsKQQ@mail.gmail.com>
 <CAFn=p-ZeG2XM_cP3hpKN-Cagk4T1Sr05YEDhtwmR4+_VOjVt7w@mail.gmail.com>
 <CAFEAcA9fJMQizPmd1rUh7wPgPoz4dAXQPP07DzDFQK1ieN72VA@mail.gmail.com>
 <CAFn=p-Zpvf4W1zZtnv5a9sn=38=dgsa7HUMnYM7dk7xW7gRB3g@mail.gmail.com>
In-Reply-To: <CAFn=p-Zpvf4W1zZtnv5a9sn=38=dgsa7HUMnYM7dk7xW7gRB3g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 14:40:01 +0000
Message-ID: <CAFEAcA-XvLDYRsM0Yf0TCg=7MMDCe7cKz0qcMFcOx5KZfZTyQA@mail.gmail.com>
Subject: Re: [PULL 0/4] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 at 23:22, John Snow <jsnow@redhat.com> wrote:
>
> On Thu, Feb 3, 2022 at 11:52 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 3 Feb 2022 at 16:38, John Snow <jsnow@redhat.com> wrote:
> >
> > > On Thu, Feb 3, 2022, 11:20 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >> Summary of Failures:
> > >>
> > >> 1/1 qemu:block / qemu-iotests qcow2 ERROR          243.14s   exit status 1
>
> I'm not too familiar with this new test runner, yet. (Is this error
> even anything to do with the python lib? I guess I can't rule it
> out...)
> I just got a clean run of 'make vm-build-netbsd', so I'm using that
> output as reference and making some guesses.

Rerunning on the netbsd VM with Paolo's "revert the iotests
conversion" patch, here's the output from a failing run, where
iotest 041 failed:

TEST   iotest-qcow2: 041 [fail]
QEMU          --
"/home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/../../qemu-system-aarch64"
-nodefaults -display none -accel qtest -machine virt
QEMU_IMG      --
"/home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/../../qemu-io"
--cache writeback --aio threads -f qcow2
QEMU_NBD      --
"/home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- NetBSD/amd64 localhost 9.2
TEST_DIR      -- /home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmp6fiu68sr
GDB_OPTIONS   --
VALGRIND_QEMU --
PRINT_QEMU_OUTPUT --

--- /home/qemu/qemu-test.Kywnb7/src/tests/qemu-iotests/041.out
+++ 041.out.bad
@@ -1,5 +1,44 @@
-...........................................................................................................
+........................................ERROR:qemu.aqmp.qmp_client.qemu-14411:Failed
to establish connection: concurrent.futures._base.CancelledError
+E..................................................................
+======================================================================
+ERROR: test_mirror_to_self (__main__.TestSingleBlockdev)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/machine/machine.py",
line 428, in launch
+    self._launch()
+  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/machine/machine.py",
line 467, in _launch
+    self._post_launch()
+  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/machine/qtest.py",
line 147, in _post_launch
+    super()._post_launch()
+  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/machine/machine.py",
line 369, in _post_launch
+    self._qmp.accept(self._qmp_timer)
+  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/aqmp/legacy.py",
line 95, in accept
+    timeout
+  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/aqmp/legacy.py",
line 68, in _sync
+    asyncio.wait_for(future, timeout=timeout)
+  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
run_until_complete
+    return future.result()
+  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
+    raise futures.TimeoutError()
+concurrent.futures._base.TimeoutError
+
+The above exception was the direct cause of the following exception:
+
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.Kywnb7/src/tests/qemu-iotests/041", line
233, in setUp
+    TestSingleDrive.setUp(self)
+  File "/home/qemu/qemu-test.Kywnb7/src/tests/qemu-iotests/041", line
54, in setUp
+    self.vm.launch()
+  File "/home/qemu/qemu-test.Kywnb7/src/python/qemu/machine/machine.py",
line 445, in launch
+    ) from exc
+qemu.machine.machine.VMLaunchFailure: TimeoutError
+       Exit code: 1
+       Command:
/home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/../../qemu-system-aarch64
-display none -vga none -chardev
socket,id=mon,path=/tmp/tmp6fiu68sr/qemu-14411-monitor.sock -mon
chardev=mon,mode=control -qtest
unix:path=/tmp/tmp6fiu68sr/qemu-14411-qtest.sock -accel qtest
-nodefaults -display none -accel qtest -machine virt -drive
if=virtio,id=drive0,file=/home/qemu/qemu-test.Kywnb7/build/tests/qemu-iotests/scratch/test.img,format=qcow2,cache=writeback,aio=threads,node-name=top,backing.node-name=base
+       Output: qemu-system-aarch64: -chardev
socket,id=mon,path=/tmp/tmp6fiu68sr/qemu-14411-monitor.sock: Failed to
connect to '/tmp/tmp6fiu68sr/qemu-14411-monitor.sock': Connection
refused
+
+
+
 ----------------------------------------------------------------------
 Ran 107 tests

-OK
+FAILED (errors=1)


thanks
-- PMM

