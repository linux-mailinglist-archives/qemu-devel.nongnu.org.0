Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDAE49111D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:45:56 +0100 (CET)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Yt1-0006Tm-NV
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:45:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9YqQ-0004fp-PG
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:43:14 -0500
Received: from [2a00:1450:4864:20::333] (port=55085
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9YqO-0006la-QL
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:43:14 -0500
Received: by mail-wm1-x333.google.com with SMTP id p18so23099877wmg.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 12:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+RJ0dLEV7kSX2msgfWQBYLSI3BZn9Kxt6GI6lo/QEFk=;
 b=ZKDbKhguehk3VyfwYAlRLFO8OLl6KnHXWuUZMmgG/ttANDAmhF6N5DuSEKHnKjNJIy
 ua1X+okicFA8C/E1tLk2jneZO9Epv9h8nGbOjhZofSVTjxcIVVz5z6YizHbXoEzNefSL
 Mt78EYSbmskinJu6l6qwBEsYB7L8hCgVwVz/0gMFJVadSOyVM9Z9wrZ3cAY4a53saS6u
 XgTa/uLDD5RQ63Vruvi7ty9OAZFFh4cfdt505nCd/yV2DSpgcDvgWM71/QFiGE5zy9ai
 MwhJu1sHaIQNSl2Sg56cMN1yulxveDrxNC5seBGppuFH+PoUolXlwrlb15cRAClYsAhc
 WJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+RJ0dLEV7kSX2msgfWQBYLSI3BZn9Kxt6GI6lo/QEFk=;
 b=K5v6Gdc03UeYb3q7/kaZaEWL1F96Ts8C0DTcuQJx2RgOQTpgKMGSIPUtIF6fovA7it
 g4jxJY/Yxjxl64AkwlUKIMwaglLnKJ+IJEI1hrt/o3uycIDEvKqj9IRhgSgmh8qYtkvT
 mLSbQ43YcjE1Fpj5ZF5URJ2lpHauzz7GINSHkoOhLHYWFBCIeSXFLGX0UpGmh2YxjMV/
 aGhMpIykmd+ZLwl/tB+cLSmW4ceOFa5bKHM8MMsBqiSXQ3Mvu6mAaEWZrtHgV3Fbit8l
 J6EPZPH1mYP2CujovfcRxFiwFGgl/SEM+CEL/uhs7F4prPjh3ToTxAM8p8mkw/LSbqTS
 lWZw==
X-Gm-Message-State: AOAM530PPFTbpMDtTWDBG9+UgoBnpX067UBcwXz4vGdvHtc7qX0PTFWI
 dUqOHNHschDTWOpIg0LTdV5d7TJa8YyjpSU39g+faQ==
X-Google-Smtp-Source: ABdhPJw/36WeMaLkS3FY9CjX6d8zkYwp2jgGySKuKZagUn0GxzKQA8HLuVXFd+enbsVllf+UP17u5fKcyBtgDMjs4SU=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr21343985wrn.172.1642452191261; 
 Mon, 17 Jan 2022 12:43:11 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
 <YeU/YCUI59f33PBh@redhat.com>
 <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
In-Reply-To: <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jan 2022 20:43:00 +0000
Message-ID: <CAFEAcA8ru2FzmBgs1O1vmUVEqMGVcNeQwm_GoZN8E2K_jkSObw@mail.gmail.com>
Subject: Re: iotest 040, 041, intermittent failure in netbsd VM
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
>
> On Mon, Jan 17, 2022 at 5:05 AM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 10.01.2022 um 16:55 hat Peter Maydell geschrieben:
> > > Just saw this failure of iotests in a netbsd VM

> This trace says that we timed out while awaiting a connection from
> QEMU during the VM launch phase. i.e. python/qemu/qmp/machine.py line
> 340:
>
>     def _post_launch(self) -> None:
>         if self._qmp_connection:
>             self._qmp.accept(self._qmp_timer)  <-- we timed out here.
>
> (Note to self: make this traceback look more obvious as to what was
> canceled and why. I think I can improve readability here a bit ...)
>
> Sky's the limit on why QEMU never connected to the socket, but:
>
> > > --- /home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/040.out
> > > fcntl(): Invalid argument
>
> That looks fairly suspicious, and I don't know which process was
> responsible for printing it (or when, relative to the other outputs).
> I assume you don't see any such output like this on a good run.

The NetBSD VM prints those fcntl messages all over the place.
I think something in the build system (make? ninja? who knows)
triggers them.

> > > -OK
> > > +FAILED (errors=1)
> > >   TEST   iotest-qcow2: 041 [fail]
> > > QEMU          --
> > > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-system-aarch64"
> > > -nodefaults -display none -accel qtest -machine virt
> > > QEMU_IMG      --
> > > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-img"
> > > QEMU_IO       --
> > > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-io"
> > > --cache writeback --aio threads -f qcow2
> > > QEMU_NBD      --
> > > "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-nbd"
> > > IMGFMT        -- qcow2
> > > IMGPROTO      -- file
> > > PLATFORM      -- NetBSD/amd64 localhost 9.2
> > > TEST_DIR      -- /home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/scratch
> > > SOCK_DIR      -- /tmp/tmpuniuicbi
> > > GDB_OPTIONS   --
> > > VALGRIND_QEMU --
> > > PRINT_QEMU_OUTPUT --
> > >
> > > --- /home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041.out
> > > +++ 041.out.bad
> > > @@ -1,5 +1,32 @@
> > > -...........................................................................................................
> > > +..........................................ERROR:qemu.aqmp.qmp_client.qemu-15252:Failed
> > > to establish connection: concurrent.futures._base.CancelledError
> > > +E................................................................
> > > +======================================================================
> > > +ERROR: test_small_buffer (__main__.TestSingleBlockdev)
> > > +----------------------------------------------------------------------
> > > +Traceback (most recent call last):
> > > +  File "/home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041", line
> > > 233, in setUp
> > > +    TestSingleDrive.setUp(self)
> > > +  File "/home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041", line
> > > 54, in setUp
> > > +    self.vm.launch()
> > > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> > > line 399, in launch
> > > +    self._launch()
> > > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> > > line 434, in _launch
> > > +    self._post_launch()
> > > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/qtest.py",
> > > line 147, in _post_launch
> > > +    super()._post_launch()
> > > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> > > line 340, in _post_launch
> > > +    self._qmp.accept(self._qmp_timer)
> > > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
> > > line 69, in accept
> > > +    timeout
> > > +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
> > > line 42, in _sync
> > > +    asyncio.wait_for(future, timeout=timeout)
> > > +  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
> > > run_until_complete
> > > +    return future.result()
> > > +  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
> > > +    raise futures.TimeoutError()
> > > +concurrent.futures._base.TimeoutError
>
> Same problem here, except I don't see any output from QEMU to blame.
> As far as the Python code knows, it just never got a connection on the
> socket, so it timed out and died.

I think the NetBSD VM does for some reason get a bit slow to do
stuff. I've never worked out why. In the past we've had to bump
up various overoptimistic timeouts to help it out.

> I do expect this to print more information on failure than it
> currently is, though (bug somewhere in machine.py, I think).
> Can you please try applying this temporary patch and running `./check
> -qcow2 040 041` until you see a breakage and show me the output from
> that?
>
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
> index 67ab06ca2b..ca49e6fcd2 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -403,16 +403,19 @@ def launch(self) -> None:
>              # Assume the VM didn't launch or is exiting.
>              # If we don't wait for the process, exitcode() may still be
>              # 'None' by the time control is ceded back to the caller.
> +            LOG.error('Error launching VM')
>              if self._launched:
> +                LOG.error('Process was forked, waiting on it')
>                  self.wait()
>              else:
> +                LOG.error('Process was not forked, just cleaning up')
>                  self._post_shutdown()
>
> -            LOG.debug('Error launching VM')
>              if self._qemu_full_args:
> -                LOG.debug('Command: %r', ' '.join(self._qemu_full_args))
> +                LOG.error('Command: %r', ' '.join(self._qemu_full_args))
>              if self._iolog:
> -                LOG.debug('Output: %r', self._iolog)
> +                LOG.error('Output: %r', self._iolog)
> +            LOG.error('exitcode: %s', str(self.exitcode()))
>              raise
>
>      def _launch(self) -> None:

Yeah, I should be able to test this.

-- PMM

