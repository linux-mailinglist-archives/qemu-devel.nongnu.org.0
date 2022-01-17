Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD14905B1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 11:08:39 +0100 (CET)
Received: from localhost ([::1]:44454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9OwI-0007Xj-Ky
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 05:08:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n9OtH-0006eD-2u
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:05:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n9OtE-0002TO-Om
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642413928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ubf3BcxGhmv64zINxJZIbW/aqi+L+GmGMBZdRCItERc=;
 b=GZzgUN0g7J6r0MhkNeU79maxRnFPULcXJBzEu6ILBmcjhS0f8+XDA90vTKXuM1+obmYL34
 WelAQa7Ck2Yfb/KdvtYmaURg6RuAwyRPvE+uxPKHR0zvKCgPWxpbRzs9tqRApa9lTz5XIP
 61Wnar23K+igICazbPA19HQF21ISh30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-Ii8LJdjUM9ucRnoDWINH2w-1; Mon, 17 Jan 2022 05:05:24 -0500
X-MC-Unique: Ii8LJdjUM9ucRnoDWINH2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCEDF100C662;
 Mon, 17 Jan 2022 10:05:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5711B7A226;
 Mon, 17 Jan 2022 10:05:22 +0000 (UTC)
Date: Mon, 17 Jan 2022 11:05:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: iotest 040, 041, intermittent failure in netbsd VM
Message-ID: <YeU/YCUI59f33PBh@redhat.com>
References: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jsnow@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.01.2022 um 16:55 hat Peter Maydell geschrieben:
> Just saw this failure of iotests in a netbsd VM (the in-tree
> tests/vm stuff). Pretty sure it's an intermittent as the
> pulreq being tested has nothing io or block related.
> 
> 
>   TEST   iotest-qcow2: 036
>   TEST   iotest-qcow2: 037
>   TEST   iotest-qcow2: 038 [not run]
>   TEST   iotest-qcow2: 039 [not run]
>   TEST   iotest-qcow2: 040 [fail]
> QEMU          --
> "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-system-aarch64"
> -nodefaults -display none -accel qtest -machine
> virt
> QEMU_IMG      --
> "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       --
> "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-io"
> --cache writeback --aio threads -f qcow2
> QEMU_NBD      --
> "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2
> IMGPROTO      -- file
> PLATFORM      -- NetBSD/amd64 localhost 9.2
> TEST_DIR      -- /home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmpuniuicbi
> GDB_OPTIONS   --
> VALGRIND_QEMU --
> PRINT_QEMU_OUTPUT --
> 
> --- /home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/040.out
> fcntl(): Invalid argument
> +++ 040.out.bad
> @@ -1,5 +1,30 @@
> -.................................................................
> +............................................................ERROR:qemu.aqmp.qmp_client.qemu-7648:Failed
> to establish connection: concurrent.futures._base.CancelledError
> +E....
> +======================================================================
> +ERROR: test_top_is_default_active (__main__.TestSingleDrive)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/040", line
> 94, in setUp
> +    self.vm.launch()
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> line 399, in launch
> +    self._launch()
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> line 434, in _launch
> +    self._post_launch()
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/qtest.py",
> line 147, in _post_launch
> +    super()._post_launch()
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> line 340, in _post_launch
> +    self._qmp.accept(self._qmp_timer)
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
> line 69, in accept
> +    timeout
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
> line 42, in _sync
> +    asyncio.wait_for(future, timeout=timeout)
> +  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
> run_until_complete
> +    return future.result()
> +  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
> +    raise futures.TimeoutError()
> +concurrent.futures._base.TimeoutError
> +
>  ----------------------------------------------------------------------
>  Ran 65 tests
> 
> -OK
> +FAILED (errors=1)
>   TEST   iotest-qcow2: 041 [fail]
> QEMU          --
> "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-system-aarch64"
> -nodefaults -display none -accel qtest -machine virt
> QEMU_IMG      --
> "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       --
> "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-io"
> --cache writeback --aio threads -f qcow2
> QEMU_NBD      --
> "/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2
> IMGPROTO      -- file
> PLATFORM      -- NetBSD/amd64 localhost 9.2
> TEST_DIR      -- /home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmpuniuicbi
> GDB_OPTIONS   --
> VALGRIND_QEMU --
> PRINT_QEMU_OUTPUT --
> 
> --- /home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041.out
> +++ 041.out.bad
> @@ -1,5 +1,32 @@
> -...........................................................................................................
> +..........................................ERROR:qemu.aqmp.qmp_client.qemu-15252:Failed
> to establish connection: concurrent.futures._base.CancelledError
> +E................................................................
> +======================================================================
> +ERROR: test_small_buffer (__main__.TestSingleBlockdev)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041", line
> 233, in setUp
> +    TestSingleDrive.setUp(self)
> +  File "/home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041", line
> 54, in setUp
> +    self.vm.launch()
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> line 399, in launch
> +    self._launch()
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> line 434, in _launch
> +    self._post_launch()
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/qtest.py",
> line 147, in _post_launch
> +    super()._post_launch()
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
> line 340, in _post_launch
> +    self._qmp.accept(self._qmp_timer)
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
> line 69, in accept
> +    timeout
> +  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
> line 42, in _sync
> +    asyncio.wait_for(future, timeout=timeout)
> +  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
> run_until_complete
> +    return future.result()
> +  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
> +    raise futures.TimeoutError()
> +concurrent.futures._base.TimeoutError
> +
>  ----------------------------------------------------------------------
>  Ran 107 tests
> 
> -OK
> +FAILED (errors=1)
>   TEST   iotest-qcow2: 042
>   TEST   iotest-qcow2: 043
> [...]
> Not run: 005 013 018 019 024 034 038 039 048 060 061 074 079 080 086
> 097 099 108 114 137 138 140 141 150 154 161 172 176 179 181 184 186
> 192 203 220 226 229 244 249 251 252 265 267 271 287 290 292 313
> nbd-qemu-allocation
> Failures: 040 041
> Failed 2 of 74 iotests
> 
> 
> Does it look familiar ?

Not to me, but since there is a lot of AQMP in the trace, which is
relatively new, and 040 and 041 haven't changed in quite a while, let me
CC John to have a look.

Previously, with the old synchronous QMP library, I think timeout while
connecting often meant that there was an error in the command line, so
QEMU failed to start up and only printed an error message. But that
doesn't make sense for an intermittent failure, and even less for a test
that hasn't changed.

Kevin


