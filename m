Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13336308A27
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 17:17:32 +0100 (CET)
Received: from localhost ([::1]:50356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5WSh-0007Df-2t
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 11:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5WPB-0005sc-18
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:13:53 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5WP2-0007Id-C2
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:13:52 -0500
Received: by mail-ej1-x630.google.com with SMTP id bl23so13821222ejb.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 08:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pf9BCLB4V2hmuyR2QDruJiY2SznVsXQpNvvF8uNL8J4=;
 b=urFF/zDINWuq58E8ku+9O8IydEbcdWcRN8f/t2sy296kV3b/eqMtxBdyHxRnb/AHnd
 LXJL2drsieVIPUJ86PyDh3YvXjorPzKfWnQW6s0bdoll+enLKCMHw3p97GOlzFZtH85c
 JVswApm0dSJGFpngua6FEDchaIRYIIlGhBsYEklj18whs4wchr5WqYZbV7QZPHWSErlr
 JesxBNykaY3eOLIYr7EVTfLG2CitwIGkOo6ud7LDeUCSu1KllItsFzTktYg4dGmno2lC
 WyOkFJYdTf6PxoPkLDDomVc9OJuBzDCt0GVVqRZUqG3j1fGVSDORVv+A1rMLS8JmPMpT
 YgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pf9BCLB4V2hmuyR2QDruJiY2SznVsXQpNvvF8uNL8J4=;
 b=B4z4Aidwm8iJ3+DNAE0mLb++FClU9cR9eHjhOb6n+FZDHYZNcNMccLCIOAP7NWw5D2
 tH9LlDkWQmPe0HygaDuPkWvMNm6rrt7lvqMSFL3kOwrafKtQACSmvYSNQoiFRDXD0azi
 pJZN725HO9ZjNvDZWMl338RBp7jGt4C+9MMQ/sMwcvrMU1JW2f+8aa7DotPwd5Vt6e78
 pRP1m7g6ab78kFSGMDiIY/t1uuxrKcvyRkOjCXvwmqwrXGB1DwdXwIpbH+wYtxgQqc73
 OT2NtuHnqjsdSec/2pU2PpD4BxpmZ6j8jDkDKyvUkqaxtT4zFhSFpWk9bLn0VqVsfHz9
 Q8DA==
X-Gm-Message-State: AOAM532v1z8TOBPaBGStNFaHns5w/cVGrkx6xF4mluLyRrUdsHXPzrCA
 BCzcwoeb3XTx7pHiMu4JqZ354qIYdzDgRsqjehooqw==
X-Google-Smtp-Source: ABdhPJyFUE8ySVRG4nzHWtf/Xl/y1jzkNh2WwrJ8ptb3AOkpDBboGYPoLmeh+QEsGjtd7iWm3KFdjiSMSPhHp1ie5Bc=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr5189058ejb.382.1611936820706; 
 Fri, 29 Jan 2021 08:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20210129145240.34104-1-kwolf@redhat.com>
In-Reply-To: <20210129145240.34104-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 16:13:29 +0000
Message-ID: <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
Subject: Re: [PULL 0/2] block: Fix iotests to respect configured Python binary
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 14:52, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 5101d00d2f1138a73344dc4833587f76d7a5fa5c:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-01-29 10:10:43 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 4cea90be62f4f15a63e1a8f7d5d0958f79fdf290:
>
>   tests/Makefile.include: export PYTHON for check-block.sh (2021-01-29 12:32:36 +0100)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - Fix iotests to respect configured Python binary
>
> ----------------------------------------------------------------

This is definitely better so I'm going to apply it, but it seems
to reveal a pile of iotest failures on FreeBSD:

030   ...        [16:00:54]              ...                  ^M  TEST
  iotest-qcow2: 030 [fail]
QEMU          --
"/usr/home/qemu/qemu-test.C3dXvB/build/tests/qemu-iotests/../../qemu-system-sparc64"
-nodefaults -display
none -accel qtest
QEMU_IMG      --
"/usr/home/qemu/qemu-test.C3dXvB/build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/usr/home/qemu/qemu-test.C3dXvB/build/tests/qemu-iotests/../../qemu-io"
--cache writeback --aio threads -
f qcow2
QEMU_NBD      --
"/usr/home/qemu/qemu-test.C3dXvB/build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- FreeBSD/amd64 freebsd 12.1-RELEASE
TEST_DIR      --
/usr/home/qemu/qemu-test.C3dXvB/build/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmpo2iw5ic_
SOCKET_SCM_HELPER --
--- /home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030.out
+++ 030.out.bad
@@ -1,5 +1,631 @@
-...........................
+EEEEEEEEEEEEE.EEEEEEEEEEEEE
+======================================================================
+ERROR: test_enospc (__main__.TestEIO)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 659, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabil
ities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_ignore (__main__.TestEIO)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 659, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
++======================================================================
+ERROR: test_report (__main__.TestEIO)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 659, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_stop (__main__.TestEIO)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 659, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_enospc (__main__.TestENOSPC)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 809, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_overlapping_1 (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 224, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_overlapping_2 (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 224, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_overlapping_3 (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 224, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
++======================================================================
+ERROR: test_overlapping_4 (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 224, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_overlapping_5 (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 224, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_stream_base_node_name (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 224, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
++======================================================================
+ERROR: test_stream_commit_1 (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 224, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_stream_commit_2 (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 224, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
++======================================================================
+ERROR: test_stream_quorum (__main__.TestQuorum)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/iotests.py",
line 1229, in func_wrapper
+    func(test_case, *args, **kwargs)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 567, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_set_speed (__main__.TestSetSpeed)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 904, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_set_speed_invalid (__main__.TestSetSpeed)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 904, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
++======================================================================
+ERROR: test_device_not_found (__main__.TestSingleDrive)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 48, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+======================================================================
+ERROR: test_job_id_missing (__main__.TestSingleDrive)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/030",
line 48, in setUp
+    self.vm.launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 380, in launch
+    self._launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 411, in _launch
+    self._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qtest.py",
line 143, in _post_launch
+    super()._post_launch()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 326, in _post_launch
+    self._qmp.accept()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 246, in accept
+    return self.__negotiate_capabilities()
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 132, in __negotiate_capabilities
+    resp = self.cmd('qmp_capabilities')
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/usr/home/qemu/qemu-test.C3dXvB/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server

(and a lot more similar looking tracebacks)

Failures: 030 040 041 127 256

though the entire build goes on to succeed (which is probably
a test framework bug somewhere...)

thanks
-- PMM

