Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A89491101
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:38:36 +0100 (CET)
Received: from localhost ([::1]:54176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Ylu-0007BJ-DP
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:38:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9YjS-0004W5-Lh
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:36:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9YjP-0005ru-AI
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642451758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rY3nURA4y67qyYnGCwKL37gR1qC5JA1QTLI+gSoj7nE=;
 b=WnfvnUPuyNZgO7//DhB3IelkkgO9PiksLIGDvRCpBOuT4gt+g4aTR9VBECM+1EaW/yHGLu
 lBOxcHVNV0ZWwjOfMwP4bSOKgSfl8XbH5nlElvNsQWGR5pBWOzMTrNvdtW5jf8CfPndvR7
 gMbm+AJe19Lo8POkWIKgw0FWVITu0kY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-6ks8F-TYOmikN1j_RhZv1w-1; Mon, 17 Jan 2022 15:35:56 -0500
X-MC-Unique: 6ks8F-TYOmikN1j_RhZv1w-1
Received: by mail-vk1-f198.google.com with SMTP id
 f189-20020a1f38c6000000b003192acc4f88so2778573vka.14
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 12:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rY3nURA4y67qyYnGCwKL37gR1qC5JA1QTLI+gSoj7nE=;
 b=LTC6ByD+JcXkhwoPmamAy4/IenUCpeMC6iBzEU3x6Ej8v7Ts69vfQ8ONp407aYsUuU
 MN70ukEPlFuRzDfBIbK7Wk1aHAKTwHo61tGCQ65DiqWsO+CQO3a3XMoMMLgoZ9nsTfAW
 BnWYLxyF1OUk93h8MWlEFniF/jyGbeep1nodK/HFC/sur8Gb9I5DAEG6U4WGFzTVL6fN
 1HbtFC9AfaT36kYMfaYkajr+HEbzw/6h7ktzOX+o+x+7E71snEQdMyDf8AGgGqspoLRK
 U2U5I0L7bWTOb2ZWVGLaNuRKqpSyLoJ8WvFsdcIDcfq37aaJmayvtJpa/vXdA9jhihG3
 Wl9A==
X-Gm-Message-State: AOAM532zyETEcZNjfJDuKgeMek2/EPbaVUWo+FcpBQoQHxIERxJYgjXF
 LTLA9HTBUP0fd0M2juPOIyC+xQ/og4lMGlFVIlZf/IygZaAeTqc73bW4WoQNueZ3xXGHB6CIOyP
 EUbFtowJjRKYPvIOVZwq23bNzj4XbtMw=
X-Received: by 2002:ab0:15c5:: with SMTP id j5mr8463327uae.128.1642451755158; 
 Mon, 17 Jan 2022 12:35:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhNOhGD7TAGyJjzoQOiIdpIrzNLrl4zeXdPUOob2O69g8Pd5cH0y9ygkSkr7h+AntsJ6RKzJ8y47WiR0V7ieg=
X-Received: by 2002:ab0:15c5:: with SMTP id j5mr8463313uae.128.1642451754469; 
 Mon, 17 Jan 2022 12:35:54 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
 <YeU/YCUI59f33PBh@redhat.com>
In-Reply-To: <YeU/YCUI59f33PBh@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 17 Jan 2022 15:35:43 -0500
Message-ID: <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
Subject: Re: iotest 040, 041, intermittent failure in netbsd VM
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 5:05 AM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 10.01.2022 um 16:55 hat Peter Maydell geschrieben:
> > Just saw this failure of iotests in a netbsd VM (the in-tree
> > tests/vm stuff). Pretty sure it's an intermittent as the
> > pulreq being tested has nothing io or block related.
> >
> >
> >   TEST   iotest-qcow2: 036
> >   TEST   iotest-qcow2: 037
> >   TEST   iotest-qcow2: 038 [not run]
> >   TEST   iotest-qcow2: 039 [not run]
> >   TEST   iotest-qcow2: 040 [fail]
> > QEMU          --
> > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-system-aarch64"
> > -nodefaults -display none -accel qtest -machine
> > virt
> > QEMU_IMG      --
> > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-img"
> > QEMU_IO       --
> > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-io"
> > --cache writeback --aio threads -f qcow2
> > QEMU_NBD      --
> > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-nbd"
> > IMGFMT        -- qcow2
> > IMGPROTO      -- file
> > PLATFORM      -- NetBSD/amd64 localhost 9.2
> > TEST_DIR      -- /home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/scratch
> > SOCK_DIR      -- /tmp/tmpuniuicbi
> > GDB_OPTIONS   --
> > VALGRIND_QEMU --
> > PRINT_QEMU_OUTPUT --
> >
> > --- /home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/040.out
> > fcntl(): Invalid argument
> > +++ 040.out.bad
> > @@ -1,5 +1,30 @@
> > -.................................................................
> > +............................................................ERROR:qemu.aqmp.qmp_client.qemu-7648:Failed
> > to establish connection: concurrent.futures._base.CancelledError
> > +E....
> > +======================================================================
> > +ERROR: test_top_is_default_active (__main__.TestSingleDrive)
> > +----------------------------------------------------------------------
> > +Traceback (most recent call last):
> > +  File "/home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/040", line
> > 94, in setUp
> > +    self.vm.launch()
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> > line 399, in launch
> > +    self._launch()
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> > line 434, in _launch
> > +    self._post_launch()
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/qtest.py",
> > line 147, in _post_launch
> > +    super()._post_launch()
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> > line 340, in _post_launch
> > +    self._qmp.accept(self._qmp_timer)
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
> > line 69, in accept
> > +    timeout
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
> > line 42, in _sync
> > +    asyncio.wait_for(future, timeout=timeout)
> > +  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
> > run_until_complete
> > +    return future.result()
> > +  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
> > +    raise futures.TimeoutError()
> > +concurrent.futures._base.TimeoutError
> > +
> >  ----------------------------------------------------------------------
> >  Ran 65 tests
> >

This trace says that we timed out while awaiting a connection from
QEMU during the VM launch phase. i.e. python/qemu/qmp/machine.py line
340:

    def _post_launch(self) -> None:
        if self._qmp_connection:
            self._qmp.accept(self._qmp_timer)  <-- we timed out here.

(Note to self: make this traceback look more obvious as to what was
canceled and why. I think I can improve readability here a bit ...)

Sky's the limit on why QEMU never connected to the socket, but:

> > --- /home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/040.out
> > fcntl(): Invalid argument

That looks fairly suspicious, and I don't know which process was
responsible for printing it (or when, relative to the other outputs).
I assume you don't see any such output like this on a good run.

> > -OK
> > +FAILED (errors=1)
> >   TEST   iotest-qcow2: 041 [fail]
> > QEMU          --
> > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-system-aarch64"
> > -nodefaults -display none -accel qtest -machine virt
> > QEMU_IMG      --
> > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-img"
> > QEMU_IO       --
> > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-io"
> > --cache writeback --aio threads -f qcow2
> > QEMU_NBD      --
> > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-nbd"
> > IMGFMT        -- qcow2
> > IMGPROTO      -- file
> > PLATFORM      -- NetBSD/amd64 localhost 9.2
> > TEST_DIR      -- /home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/scratch
> > SOCK_DIR      -- /tmp/tmpuniuicbi
> > GDB_OPTIONS   --
> > VALGRIND_QEMU --
> > PRINT_QEMU_OUTPUT --
> >
> > --- /home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041.out
> > +++ 041.out.bad
> > @@ -1,5 +1,32 @@
> > -...........................................................................................................
> > +..........................................ERROR:qemu.aqmp.qmp_client.qemu-15252:Failed
> > to establish connection: concurrent.futures._base.CancelledError
> > +E................................................................
> > +======================================================================
> > +ERROR: test_small_buffer (__main__.TestSingleBlockdev)
> > +----------------------------------------------------------------------
> > +Traceback (most recent call last):
> > +  File "/home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041", line
> > 233, in setUp
> > +    TestSingleDrive.setUp(self)
> > +  File "/home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041", line
> > 54, in setUp
> > +    self.vm.launch()
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> > line 399, in launch
> > +    self._launch()
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> > line 434, in _launch
> > +    self._post_launch()
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/qtest.py",
> > line 147, in _post_launch
> > +    super()._post_launch()
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> > line 340, in _post_launch
> > +    self._qmp.accept(self._qmp_timer)
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
> > line 69, in accept
> > +    timeout
> > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
> > line 42, in _sync
> > +    asyncio.wait_for(future, timeout=timeout)
> > +  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
> > run_until_complete
> > +    return future.result()
> > +  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
> > +    raise futures.TimeoutError()
> > +concurrent.futures._base.TimeoutError

Same problem here, except I don't see any output from QEMU to blame.
As far as the Python code knows, it just never got a connection on the
socket, so it timed out and died.

I do expect this to print more information on failure than it
currently is, though (bug somewhere in machine.py, I think).
Can you please try applying this temporary patch and running `./check
-qcow2 040 041` until you see a breakage and show me the output from
that?

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 67ab06ca2b..ca49e6fcd2 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -403,16 +403,19 @@ def launch(self) -> None:
             # Assume the VM didn't launch or is exiting.
             # If we don't wait for the process, exitcode() may still be
             # 'None' by the time control is ceded back to the caller.
+            LOG.error('Error launching VM')
             if self._launched:
+                LOG.error('Process was forked, waiting on it')
                 self.wait()
             else:
+                LOG.error('Process was not forked, just cleaning up')
                 self._post_shutdown()

-            LOG.debug('Error launching VM')
             if self._qemu_full_args:
-                LOG.debug('Command: %r', ' '.join(self._qemu_full_args))
+                LOG.error('Command: %r', ' '.join(self._qemu_full_args))
             if self._iolog:
-                LOG.debug('Output: %r', self._iolog)
+                LOG.error('Output: %r', self._iolog)
+            LOG.error('exitcode: %s', str(self.exitcode()))
             raise

     def _launch(self) -> None:



> > +
> >  ----------------------------------------------------------------------
> >  Ran 107 tests
> >
> > -OK
> > +FAILED (errors=1)
> >   TEST   iotest-qcow2: 042
> >   TEST   iotest-qcow2: 043
> > [...]
> > Not run: 005 013 018 019 024 034 038 039 048 060 061 074 079 080 086
> > 097 099 108 114 137 138 140 141 150 154 161 172 176 179 181 184 186
> > 192 203 220 226 229 244 249 251 252 265 267 271 287 290 292 313
> > nbd-qemu-allocation
> > Failures: 040 041
> > Failed 2 of 74 iotests
> >
> >
> > Does it look familiar ?
>
> Not to me, but since there is a lot of AQMP in the trace, which is
> relatively new, and 040 and 041 haven't changed in quite a while, let me
> CC John to have a look.
>
> Previously, with the old synchronous QMP library, I think timeout while
> connecting often meant that there was an error in the command line, so
> QEMU failed to start up and only printed an error message. But that
> doesn't make sense for an intermittent failure, and even less for a test
> that hasn't changed.
>
> Kevin
>


