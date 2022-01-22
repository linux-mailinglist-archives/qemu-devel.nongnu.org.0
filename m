Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E4B496CAC
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 14:58:58 +0100 (CET)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBGuv-0008Tr-5w
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 08:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBGu7-0007oC-U5
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 08:58:07 -0500
Received: from [2a00:1450:4864:20::429] (port=45822
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBGu5-0008TB-St
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 08:58:07 -0500
Received: by mail-wr1-x429.google.com with SMTP id i2so5014802wrb.12
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 05:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iOK5r9yVAqDXUR6pKJ7Lwv9BQ80EQ/sZvriqBjOzFUo=;
 b=gPIiFGon1QrlggHAAgLKZ+6SbrkVz4ffvaJ/DYu+6S+a1rHliauHXxxXJppM6qEMBm
 sKCy55tr2vMx/zdsM62wxDvIeLA74fZuYRlN5CJUsAHoqK+w++JW24MGVezCa8X1Jdd9
 2anW/LtxaHDf4NZPf0JkXJSgZL5o/bnK1cxG8REL66SlqltMDApgdNZXC9CjyBPm+m8E
 m+OWJgnXOz7NUuwrSKyn/lYjjmaQWfm+UPGGHwjeNVGOVw5xxfwVDprF0Sz0iNcI9Vv5
 ZsqPJxUVnGKbcc+yfbsUfJLxl1caKGY/muHiQGLK4xygu40FM38lQ8dgywHAd6qvP8BN
 pQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iOK5r9yVAqDXUR6pKJ7Lwv9BQ80EQ/sZvriqBjOzFUo=;
 b=0m3zcjX/JSWd9AOLHWIxTYVSD9c61qv188lSm3uKORa5l2N3IaK8cfc6KdmZG4zO5I
 r1h948rT0ZZgtCBRK4KjWN9tUbqhgErXXDBSG944RprvOwPy/hpKa5BCT7plHvsL2Tx6
 Rr1fmkYcfPRzygdY1cu/SdGXS2W5X8w1yX4AO4eehgJ8mq8T3/zBQ0XE/snCl09lyt2F
 zlJRr+0HIdtq5t4WF7YCvD5+9byuOm8h9ChhoZnVZDCl9UAznl0c735gOk1wwrvpqi6u
 H6i9ZXlvZGlz2pkKrBt8Qk4TUDO0qY1Epga5nxd3vQMXuVuWJv59OOXFuRwB8aWiMJTd
 ZaFA==
X-Gm-Message-State: AOAM532Tpvsn9iSXSogomUBSDzrueakpcM1TVc7qJxCFFkcNzfR9J7gn
 mQSTcMrEgXQ12pttFMI0lLjzksrssT/viK4EBeXsmw==
X-Google-Smtp-Source: ABdhPJxnh3bhTqUCFZHhTrf9FM35cMbNAWJsvyTMTn9CXU3AmvAI6Fr3Tmd8QGMjOJD40vyc1ys13XhLDuDn6GGDOCU=
X-Received: by 2002:adf:e949:: with SMTP id m9mr7737779wrn.172.1642859883775; 
 Sat, 22 Jan 2022 05:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20220122000931.536322-1-jsnow@redhat.com>
In-Reply-To: <20220122000931.536322-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Jan 2022 13:57:52 +0000
Message-ID: <CAFEAcA8h++yFCYhx7Fecaz3AnSXA3HmmaRbUWeGkg8zWG9VptA@mail.gmail.com>
Subject: Re: [PULL 00/17] Python patches
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 22 Jan 2022 at 00:09, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit 5e9d14f2bea6df89c0675df953f9c839560d2266:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20220121-1' into staging (2022-01-21 10:31:25 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to 05908602429cf9d6fce9b60704b8395f6d295441:
>
>   scripts/render-block-graph: switch to AQMP (2022-01-21 16:01:31 -0500)
>
> ----------------------------------------------------------------
> Python patches
>
> A few fixes to the Python CI tests, a few fixes to the (async) QMP
> library, and a set of patches that begin to shift us towards using the
> new qmp lib.
>
> ----------------------------------------------------------------

Was this set of patches supposed to fix the NetBSD VM intermittents?

I still see that failure, though it looks a little different now:

  TEST   iotest-qcow2: 040 [fail]
QEMU          --
"/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-system-aarch64"
-nodefaults -display none -accel qtest -machine virt
QEMU_IMG      --
"/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-io"
--cache writeback --aio threads -f qcow2
QEMU_NBD      --
"/home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- NetBSD/amd64 localhost 9.2
TEST_DIR      -- /home/qemu/qemu-test.ArLruP/build/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmpb3k9h89o
GDB_OPTIONS   --
VALGRIND_QEMU --
PRINT_QEMU_OUTPUT --

--- /home/qemu/qemu-test.ArLruP/src/tests/qemu-iotests/040.out
+++ 040.out.bad
@@ -1,5 +1,30 @@
-.................................................................
+............ERROR:qemu.aqmp.qmp_client.qemu-11749:Failed to establish
connection: concurrent.futures._base.CancelledError
+E....................................................
+======================================================================
+ERROR: test_top_invalid (__main__.TestActiveZeroLengthImage)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.ArLruP/src/tests/qemu-iotests/040", line
94, in setUp
+    self.vm.launch()
+  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/machine.py",
line 399, in launch
+    self._launch()
+  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/machine.py",
line 434, in _launch
+    self._post_launch()
+  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/qtest.py",
line 147, in _post_launch
+    super()._post_launch()
+  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/machine/machine.py",
line 340, in _post_launch
+    self._qmp.accept(self._qmp_timer)
+  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/aqmp/legacy.py",
line 92, in accept
+    timeout
+  File "/home/qemu/qemu-test.ArLruP/src/python/qemu/aqmp/legacy.py",
line 65, in _sync
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
+FAILED (errors=1)

thanks
-- PMM

