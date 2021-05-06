Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E46237511A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:51:03 +0200 (CEST)
Received: from localhost ([::1]:55040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZio-0008Mc-5I
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1leZgG-00062C-8l
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1leZgC-0007jD-Ik
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620290899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VM4Vm5O+CexiM4pb26UJ+rpAbZfWpNK7pYupqaxWga0=;
 b=YJ7c7VtXT4s1sQf9swlDV5gh6H2yRVKiITI5KC+lO7Umj6WeFzlP+W+zOiawBI6T+34mve
 C+bEVBOucc7NIo2bpzzzc6sMhCggbsgSszFAqyHiE2KrpydM9hfkzmhqXeZ5G46MwQrtK9
 xLGwwCVCu6lOAWOvQfO6JknLokR+S2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-bPJiCwizP9uJ_WSG8wXIVw-1; Thu, 06 May 2021 04:48:16 -0400
X-MC-Unique: bPJiCwizP9uJ_WSG8wXIVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07794107ACCA;
 Thu,  6 May 2021 08:48:16 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-166.ams2.redhat.com
 [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 733E15D720;
 Thu,  6 May 2021 08:48:14 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] qemu-iotests: fix pylint 2.8 consider-using-with error
Date: Thu,  6 May 2021 10:48:13 +0200
Message-Id: <20210506084813.12007-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
http://pylint.pycqa.org/en/latest/whatsnew/2.8.html

Modify all subprocess.Popen calls to use the 'with' statement,
except one in __init__ of QemuIoInteractive class, since
the return value is assigned to a class field and used in other methods.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/qemu-iotests/iotests.py    | 63 ++++++++++++++++----------------
 tests/qemu-iotests/testrunner.py | 22 +++++------
 2 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 5af0182895..e1117e8ae8 100644
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
+                        stderr=stderr, universal_newlines=True) as subp:
+        output = subp.communicate()[0]
+        if subp.returncode < 0:
+            cmd = ' '.join(args)
+            sys.stderr.write(f'{tool} received signal \
+                               {-subp.returncode}: {cmd}\n')
+        return (output, subp.returncode)
 
 def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
@@ -237,6 +236,7 @@ def qemu_io_silent_check(*args):
 class QemuIoInteractive:
     def __init__(self, *args):
         self.args = qemu_io_args_no_fmt + list(args)
+        # pylint: disable=consider-using-with
         self._p = subprocess.Popen(self.args, stdin=subprocess.PIPE,
                                    stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT,
@@ -310,22 +310,22 @@ def qemu_nbd_popen(*args):
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
@@ -334,13 +334,12 @@ def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
 
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
index 1fc61fcaa3..729fe9ee3b 100644
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
+                                stdout=f, stderr=subprocess.STDOUT) as proc:
+                try:
+                    proc.wait()
+                except KeyboardInterrupt:
+                    proc.terminate()
+                    proc.wait()
+                    return TestResult(status='not run',
+                                    description='Interrupted by user',
+                                    interrupted=True)
+                ret = proc.returncode
 
         elapsed = round(time.time() - t0, 1)
 
-- 
2.30.2


