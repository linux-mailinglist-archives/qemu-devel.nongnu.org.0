Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80DA4544B2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 11:09:05 +0100 (CET)
Received: from localhost ([::1]:46366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnHsH-0001Yt-2P
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 05:09:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnHrE-0000Ej-CV
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:08:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnHr9-0007Uw-QC
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 05:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637143674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zGpRh2C3WlufuwO+MbJg6P8dUlpGiDgchhoOrLdrcWQ=;
 b=feQ6DLB6N3d9o3kAslp6E2Jl0uxVlDGB2uOEefhnB2GVi00vFljFvXQbBP83QF6X6YLo24
 tFOlpK8JVt72+/0yMSIRiBS2WdUvQ/0R3YTKIlk0TtcU66ivWYxmA4cVe9BE1srD4PTHpo
 1svyO30YFc4I8cnbRzy7a82n0ittdPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-3NADHLVSNmePo3DtrLpsZQ-1; Wed, 17 Nov 2021 05:07:53 -0500
X-MC-Unique: 3NADHLVSNmePo3DtrLpsZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABBF3102C7E0;
 Wed, 17 Nov 2021 10:07:52 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EB4860C81;
 Wed, 17 Nov 2021 10:07:40 +0000 (UTC)
Message-ID: <a3273a3c-c294-6340-7ea7-73e5696c7b2e@redhat.com>
Date: Wed, 17 Nov 2021 11:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Failing QEMU iotests
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi!

I think it has been working fine for me a couple of weeks ago,
but when I now run:

  make check SPEED=slow

I'm getting a couple of failing iotests... not sure whether
these are known issues already, so I thought I'd summarize them
here:

*** First one is 045 in raw mode: ***

  TEST   iotest-raw: 045 [fail]
QEMU          -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-system-x86_64" -nodefaults -display none -accel qtest
QEMU_IMG      -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-io" --cache writeback --aio threads -f raw
QEMU_NBD      -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- raw
IMGPROTO      -- file
PLATFORM      -- Linux/x86_64 thuth 4.18.0-305.19.1.el8_4.x86_64
TEST_DIR      -- /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmphlexdrlt
GDB_OPTIONS   --
VALGRIND_QEMU --
PRINT_QEMU_OUTPUT --

--- /home/thuth/devel/qemu/tests/qemu-iotests/045.out
+++ 045.out.bad
@@ -1,5 +1,77 @@
-...........
+......EE.EE
+======================================================================
+ERROR: test_add_fd (__main__.TestSCMFd)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 148, in test_add_fd
+    self._send_fd_by_SCM()
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 144, in _send_fd_by_SCM
+    ret = self.vm.send_fd_scm(file_path=image0)
+  File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 229, in send_fd_scm
+    self._qmp.send_fd_scm(fd)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py", line 138, in send_fd_scm
+    self._aqmp.send_fd_scm(fd)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py", line 149, in _wrapper
+    return func(proto, *args, **kwargs)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line 644, in send_fd_scm
+    sock = sock._sock  # pylint: disable=protected-access
+AttributeError: 'socket' object has no attribute '_sock'
+
+======================================================================
+ERROR: test_closefd (__main__.TestSCMFd)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 165, in test_closefd
+    self._send_fd_by_SCM()
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 144, in _send_fd_by_SCM
+    ret = self.vm.send_fd_scm(file_path=image0)
+  File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 229, in send_fd_scm
+    self._qmp.send_fd_scm(fd)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py", line 138, in send_fd_scm
+    self._aqmp.send_fd_scm(fd)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py", line 149, in _wrapper
+    return func(proto, *args, **kwargs)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line 644, in send_fd_scm
+    sock = sock._sock  # pylint: disable=protected-access
+AttributeError: 'socket' object has no attribute '_sock'
+
+======================================================================
+ERROR: test_getfd (__main__.TestSCMFd)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 153, in test_getfd
+    self._send_fd_by_SCM()
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 144, in _send_fd_by_SCM
+    ret = self.vm.send_fd_scm(file_path=image0)
+  File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 229, in send_fd_scm
+    self._qmp.send_fd_scm(fd)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py", line 138, in send_fd_scm
+    self._aqmp.send_fd_scm(fd)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py", line 149, in _wrapper
+    return func(proto, *args, **kwargs)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line 644, in send_fd_scm
+    sock = sock._sock  # pylint: disable=protected-access
+AttributeError: 'socket' object has no attribute '_sock'
+
+======================================================================
+ERROR: test_getfd_invalid_fdname (__main__.TestSCMFd)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 158, in test_getfd_invalid_fdname
+    self._send_fd_by_SCM()
+  File "/home/thuth/devel/qemu/tests/qemu-iotests/045", line 144, in _send_fd_by_SCM
+    ret = self.vm.send_fd_scm(file_path=image0)
+  File "/home/thuth/devel/qemu/python/qemu/machine/machine.py", line 229, in send_fd_scm
+    self._qmp.send_fd_scm(fd)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/legacy.py", line 138, in send_fd_scm
+    self._aqmp.send_fd_scm(fd)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/protocol.py", line 149, in _wrapper
+    return func(proto, *args, **kwargs)
+  File "/home/thuth/devel/qemu/python/qemu/aqmp/qmp_client.py", line 644, in send_fd_scm
+    sock = sock._sock  # pylint: disable=protected-access
+AttributeError: 'socket' object has no attribute '_sock'
+
  ----------------------------------------------------------------------
  Ran 11 tests

-OK
+FAILED (errors=4)


*** Second failure is in 206 in qcow2 mode: ***

   TEST   iotest-qcow2: 206 [fail]
QEMU          -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-system-x86_64" -nodefaults -display none -accel qtest
QEMU_IMG      -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-io" --cache writeback --aio threads -f qcow2
QEMU_NBD      -- "/home/thuth/tmp/qemu-build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- Linux/x86_64 thuth 4.18.0-305.19.1.el8_4.x86_64
TEST_DIR      -- /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmpqg73ug_s
GDB_OPTIONS   --
VALGRIND_QEMU --
PRINT_QEMU_OUTPUT --

--- /home/thuth/devel/qemu/tests/qemu-iotests/206.out
+++ 206.out.bad
@@ -99,55 +99,19 @@

  {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "qcow2", "encrypt": {"cipher-alg": "twofish-128", "cipher-mode": "ctr", "format": "luks", "hash-alg": "sha1", "iter-time": 10, "ivgen-alg": "plain64", "ivgen-hash-alg": "md5", "key-secret": "keysec0"}, "file": {"driver": "file", "filename": "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
  {"return": {}}
+Job failed: Unsupported cipher algorithm twofish-128 with ctr mode
  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
  {"return": {}}

  image: TEST_IMG
  file format: IMGFMT
  virtual size: 32 MiB (33554432 bytes)
-encrypted: yes
  cluster_size: 65536
  Format specific information:
      compat: 1.1
      compression type: zlib
      lazy refcounts: false
      refcount bits: 16
-    encrypt:
-        ivgen alg: plain64
-        hash alg: sha1
-        cipher alg: twofish-128
-        uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
-        format: luks
-        cipher mode: ctr
-        slots:
-            [0]:
-                active: true
-                iters: XXX
-                key offset: 4096
-                stripes: 4000
-            [1]:
-                active: false
-                key offset: 69632
-            [2]:
-                active: false
-                key offset: 135168
-            [3]:
-                active: false
-                key offset: 200704
-            [4]:
-                active: false
-                key offset: 266240
-            [5]:
-                active: false
-                key offset: 331776
-            [6]:
-                active: false
-                key offset: 397312
-            [7]:
-                active: false
-                key offset: 462848
-        payload offset: 528384
-        master key iters: XXX
      corrupt: false
      extended l2: false


*** Third one is in 297, both raw and qcow2 mode: ***

--- /home/thuth/devel/qemu/tests/qemu-iotests/297.out
+++ 297.out.bad
@@ -1,2 +1,21 @@
  === pylint ===
+************* Module image-fleecing
+tests/image-fleecing:34:24: C0326: Exactly one space required after comma
+patterns = [('0x5d', '0',         '64k'),
+                        ^ (bad-whitespace)
+tests/image-fleecing:35:25: C0326: Exactly one space required after comma
+            ('0xd5', '1M',        '64k'),
+                         ^ (bad-whitespace)
+tests/image-fleecing:36:26: C0326: Exactly one space required after comma
+            ('0xdc', '32M',       '64k'),
+                          ^ (bad-whitespace)
+tests/image-fleecing:39:25: C0326: Exactly one space required after comma
+overwrite = [('0xab', '0',         '64k'), # Full overwrite
+                         ^ (bad-whitespace)
+tests/image-fleecing:48:32: C0326: Exactly one space required after comma
+remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
+                                ^ (bad-whitespace)
+tests/image-fleecing:49:27: C0326: Exactly one space required after comma
+             ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
+                           ^ (bad-whitespace)

  Thomas


