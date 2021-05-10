Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E336379762
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:07:25 +0200 (CEST)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBFU-0005DY-G0
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lgBD9-0003C4-D6
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lgBD7-0002hY-9e
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620673496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N+pIP/fT2VezBrtqSGcpzz4BWRTNW5CuU1UpooxXiAg=;
 b=cfkrSWa9JZt93kgMTNXyXoX5SqPwvPSBsavGlWH+db0h9QkIwihWfn7ga4p8Jxyf9V5QMT
 ntASZFyf75Xyz1iBad1E594kbtM3PRSIE3yc+qsQGko0kmwil5pTWUXm3TXTAj5NdBljUl
 O/vQMXCYaRk9NTb4A61gtWmx6tmeVFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-t1dmRU7tPMSMgvGk8BWLNQ-1; Mon, 10 May 2021 15:04:54 -0400
X-MC-Unique: t1dmRU7tPMSMgvGk8BWLNQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0986501E0;
 Mon, 10 May 2021 19:04:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F30A260CC5;
 Mon, 10 May 2021 19:04:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2] qemu-iotests: fix pylint 2.8 consider-using-with error
Date: Mon, 10 May 2021 21:04:49 +0200
Message-Id: <20210510190449.65948-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pylint 2.8 introduces consider-using-with error, suggesting
to use the 'with' block statement when possible.

Modify all subprocess.Popen call to use the 'with' statement,
except the one in __init__ of QemuIoInteractive class, since
it is assigned to a class field and used in other methods.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v1 -> v2:
* fix indentation [Max]
* explain why we disabled the check in QemuIoInteractive's __init__ [Max]

 tests/qemu-iotests/iotests.py    | 65 ++++++++++++++++----------------
 tests/qemu-iotests/testrunner.py | 22 +++++------
 2 files changed, 44 insertions(+), 43 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 5af0182895..ec3c69daf1 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -113,15 +113,14 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
     Run a tool and return both its output and its exit code
     """
     stderr = subprocess.STDOUT if connect_stderr else None
-    subp = subprocess.Popen(args,
-                            stdout=subprocess.PIPE,
-                            stderr=stderr,
-                            universal_newlines=True)
-    output = subp.communicate()[0]
-    if subp.returncode < 0:
-        cmd = ' '.join(args)
-        sys.stderr.write(f'{tool} received signal {-subp.returncode}: {cmd}\n')
-    return (output, subp.returncode)
+    with subprocess.Popen(args, stdout=subprocess.PIPE,
+                          stderr=stderr, universal_newlines=True) as subp:
+        output = subp.communicate()[0]
+        if subp.returncode < 0:
+            cmd = ' '.join(args)
+            sys.stderr.write(f'{tool} received signal \
+                               {-subp.returncode}: {cmd}\n')
+        return (output, subp.returncode)
 
 def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
@@ -237,6 +236,9 @@ def qemu_io_silent_check(*args):
 class QemuIoInteractive:
     def __init__(self, *args):
         self.args = qemu_io_args_no_fmt + list(args)
+        # We need to keep the Popen objext around, and not
+        # close it immediately. Therefore, disable the pylint check:
+        # pylint: disable=consider-using-with
         self._p = subprocess.Popen(self.args, stdin=subprocess.PIPE,
                                    stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT,
@@ -310,22 +312,22 @@ def qemu_nbd_popen(*args):
     cmd.extend(args)
 
     log('Start NBD server')
-    p = subprocess.Popen(cmd)
-    try:
-        while not os.path.exists(pid_file):
-            if p.poll() is not None:
-                raise RuntimeError(
-                    "qemu-nbd terminated with exit code {}: {}"
-                    .format(p.returncode, ' '.join(cmd)))
-
-            time.sleep(0.01)
-        yield
-    finally:
-        if os.path.exists(pid_file):
-            os.remove(pid_file)
-        log('Kill NBD server')
-        p.kill()
-        p.wait()
+    with subprocess.Popen(cmd) as p:
+        try:
+            while not os.path.exists(pid_file):
+                if p.poll() is not None:
+                    raise RuntimeError(
+                        "qemu-nbd terminated with exit code {}: {}"
+                        .format(p.returncode, ' '.join(cmd)))
+
+                time.sleep(0.01)
+            yield
+        finally:
+            if os.path.exists(pid_file):
+                os.remove(pid_file)
+            log('Kill NBD server')
+            p.kill()
+            p.wait()
 
 def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
     '''Return True if two image files are identical'''
@@ -334,13 +336,12 @@ def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
 
 def create_image(name, size):
     '''Create a fully-allocated raw image with sector markers'''
-    file = open(name, 'wb')
-    i = 0
-    while i < size:
-        sector = struct.pack('>l504xl', i // 512, i // 512)
-        file.write(sector)
-        i = i + 512
-    file.close()
+    with open(name, 'wb') as file:
+        i = 0
+        while i < size:
+            sector = struct.pack('>l504xl', i // 512, i // 512)
+            file.write(sector)
+            i = i + 512
 
 def image_size(img):
     '''Return image's virtual size'''
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 1fc61fcaa3..eddceeb4ae 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -258,17 +258,17 @@ def do_run_test(self, test: str) -> TestResult:
 
         t0 = time.time()
         with f_bad.open('w', encoding="utf-8") as f:
-            proc = subprocess.Popen(args, cwd=str(f_test.parent), env=env,
-                                    stdout=f, stderr=subprocess.STDOUT)
-            try:
-                proc.wait()
-            except KeyboardInterrupt:
-                proc.terminate()
-                proc.wait()
-                return TestResult(status='not run',
-                                  description='Interrupted by user',
-                                  interrupted=True)
-            ret = proc.returncode
+            with subprocess.Popen(args, cwd=str(f_test.parent), env=env,
+                                  stdout=f, stderr=subprocess.STDOUT) as proc:
+                try:
+                    proc.wait()
+                except KeyboardInterrupt:
+                    proc.terminate()
+                    proc.wait()
+                    return TestResult(status='not run',
+                                      description='Interrupted by user',
+                                      interrupted=True)
+                ret = proc.returncode
 
         elapsed = round(time.time() - t0, 1)
 
-- 
2.30.2


