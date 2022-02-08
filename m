Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502974ADAF9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:16:42 +0100 (CET)
Received: from localhost ([::1]:40554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRIN-0006Xs-NM
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHPt0-00013v-HZ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:46:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nHPrU-0004xT-D0
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644324277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jY1G46jaslXetJ4Arwk3mIXfn43fuCWQjQ0QEpqvj0w=;
 b=hSefxUFxkH/+EI6951GYb5GAuqaSQgpWXFQnApBEf9mzOBqDcOUKyzyskoBdYt2xzHFHiY
 3xssI33vvnr6+db83pBOfitGh8jgZx2u5xZaSyMVVRakJCLf993P5qJtWKs1IZYghYcl6/
 YnL7TpfjZKJqTJoDKQjDWYz3ifEPM0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-6oPhbwx_NTKo4MbBmWFAig-1; Tue, 08 Feb 2022 07:44:35 -0500
X-MC-Unique: 6oPhbwx_NTKo4MbBmWFAig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1BAD8143E5;
 Tue,  8 Feb 2022 12:44:34 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 745B72B47B;
 Tue,  8 Feb 2022 12:44:32 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Revert "check-block: replace -makecheck with TAP output"
Date: Tue,  8 Feb 2022 07:44:32 -0500
Message-Id: <20220208124432.84924-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit d316859f4e28c74ab8b618895d2a5e0a865d3cf1.  The
TAP output is inferior in that it does not include the diff for
failed tests.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/check-block.sh             |  6 ++--
 tests/qemu-iotests/check         |  6 ++--
 tests/qemu-iotests/meson.build   |  1 -
 tests/qemu-iotests/testenv.py    | 30 +++++++++----------
 tests/qemu-iotests/testrunner.py | 49 +++++++++++++++-----------------
 5 files changed, 44 insertions(+), 48 deletions(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index 720a46bc36..88e02453d2 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -14,8 +14,8 @@ else
 fi
 
 skip() {
-    echo "1..0 #SKIP $*"
-    exit 0
+    echo "$*"
+    exit 77
 }
 
 if grep -q "CONFIG_GPROF=y" config-host.mak 2>/dev/null ; then
@@ -79,7 +79,7 @@ JOBS=$(echo "$MAKEFLAGS" | sed -n 's/\(^\|.* \)-j\([0-9]\+\)\( .*\|$\)/-j \2/p')
 
 ret=0
 for fmt in $format_list ; do
-    ${PYTHON} ./check $JOBS -tap -$fmt $group || ret=1
+    ${PYTHON} ./check $JOBS -makecheck -$fmt $group || ret=1
 done
 
 exit $ret
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 75de1b4691..0c27721a41 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -32,6 +32,8 @@ def make_argparser() -> argparse.ArgumentParser:
 
     p.add_argument('-n', '--dry-run', action='store_true',
                    help='show me, do not run tests')
+    p.add_argument('-makecheck', action='store_true',
+                   help='pretty print output for make check')
     p.add_argument('-j', dest='jobs', type=int, default=1,
                    help='run tests in multiple parallel jobs')
 
@@ -51,8 +53,6 @@ def make_argparser() -> argparse.ArgumentParser:
     p.add_argument('--color', choices=['on', 'off', 'auto'],
                    default='auto', help="use terminal colors. The default "
                    "'auto' value means use colors if terminal stdout detected")
-    p.add_argument('-tap', action='store_true',
-                   help='produce TAP output')
 
     g_env = p.add_argument_group('test environment options')
     mg = g_env.add_mutually_exclusive_group()
@@ -164,7 +164,7 @@ if __name__ == '__main__':
     if args.dry_run:
         print('\n'.join(tests))
     else:
-        with TestRunner(env, tap=args.tap,
+        with TestRunner(env, makecheck=args.makecheck,
                         color=args.color) as tr:
             paths = [os.path.join(env.source_iotests, t) for t in tests]
             ok = tr.run_tests(paths, args.jobs)
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 5be3c74127..3a9425d15c 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -22,7 +22,6 @@ if have_tools and targetos != 'windows'
     endif
     test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
          depends: qemu_iotests_binaries, env: qemu_iotests_env,
-         protocol: 'tap',
          suite: suites,
          timeout: 0,
          is_parallel: false)
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 0f32897fe8..c33454fa68 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -287,21 +287,21 @@ def __enter__(self) -> 'TestEnv':
     def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
         self.close()
 
-    def print_env(self, prefix: str = '') -> None:
+    def print_env(self) -> None:
         template = """\
-{prefix}QEMU          -- "{QEMU_PROG}" {QEMU_OPTIONS}
-{prefix}QEMU_IMG      -- "{QEMU_IMG_PROG}" {QEMU_IMG_OPTIONS}
-{prefix}QEMU_IO       -- "{QEMU_IO_PROG}" {QEMU_IO_OPTIONS}
-{prefix}QEMU_NBD      -- "{QEMU_NBD_PROG}" {QEMU_NBD_OPTIONS}
-{prefix}IMGFMT        -- {IMGFMT}{imgopts}
-{prefix}IMGPROTO      -- {IMGPROTO}
-{prefix}PLATFORM      -- {platform}
-{prefix}TEST_DIR      -- {TEST_DIR}
-{prefix}SOCK_DIR      -- {SOCK_DIR}
-{prefix}GDB_OPTIONS   -- {GDB_OPTIONS}
-{prefix}VALGRIND_QEMU -- {VALGRIND_QEMU}
-{prefix}PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
-{prefix}"""
+QEMU          -- "{QEMU_PROG}" {QEMU_OPTIONS}
+QEMU_IMG      -- "{QEMU_IMG_PROG}" {QEMU_IMG_OPTIONS}
+QEMU_IO       -- "{QEMU_IO_PROG}" {QEMU_IO_OPTIONS}
+QEMU_NBD      -- "{QEMU_NBD_PROG}" {QEMU_NBD_OPTIONS}
+IMGFMT        -- {IMGFMT}{imgopts}
+IMGPROTO      -- {IMGPROTO}
+PLATFORM      -- {platform}
+TEST_DIR      -- {TEST_DIR}
+SOCK_DIR      -- {SOCK_DIR}
+GDB_OPTIONS   -- {GDB_OPTIONS}
+VALGRIND_QEMU -- {VALGRIND_QEMU}
+PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
+"""
 
         args = collections.defaultdict(str, self.get_env())
 
@@ -310,5 +310,5 @@ def print_env(self, prefix: str = '') -> None:
 
         u = os.uname()
         args['platform'] = f'{u.sysname}/{u.machine} {u.nodename} {u.release}'
-        args['prefix'] = prefix
+
         print(template.format_map(args))
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 0eace147b8..15788f919e 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -152,10 +152,10 @@ def run_tests_pool(self, tests: List[str],
 
         return results
 
-    def __init__(self, env: TestEnv, tap: bool = False,
+    def __init__(self, env: TestEnv, makecheck: bool = False,
                  color: str = 'auto') -> None:
         self.env = env
-        self.tap = tap
+        self.makecheck = makecheck
         self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
 
         assert color in ('auto', 'on', 'off')
@@ -185,16 +185,13 @@ def test_print_one_line(self, test: str,
         """ Print short test info before/after test run """
         test = os.path.basename(test)
 
-        if test_field_width is None:
-            test_field_width = 8
+        if self.makecheck and status != '...':
+            if status and status != 'pass':
+                status = f' [{status}]'
+            else:
+                status = ''
 
-        if self.tap:
-            if status == 'pass':
-                print(f'ok {self.env.imgfmt} {test}')
-            elif status == 'fail':
-                print(f'not ok {self.env.imgfmt} {test}')
-            elif status == 'not run':
-                print(f'ok {self.env.imgfmt} {test} # SKIP')
+            print(f'  TEST   iotest-{self.env.imgfmt}: {test}{status}')
             return
 
         if lasttime:
@@ -346,7 +343,7 @@ def run_test(self, test: str,
         last_el = self.last_elapsed.get(test)
         start = datetime.datetime.now().strftime('%H:%M:%S')
 
-        if not self.tap:
+        if not self.makecheck:
             self.test_print_one_line(test=test,
                                      test_field_width=test_field_width,
                                      status = 'started' if mp else '...',
@@ -375,9 +372,7 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
         notrun = []
         casenotrun = []
 
-        if self.tap:
-            self.env.print_env('# ')
-        else:
+        if not self.makecheck:
             self.env.print_env()
 
         test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
@@ -403,6 +398,8 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
 
             if res.status == 'fail':
                 failed.append(name)
+                if self.makecheck:
+                    self.env.print_env()
                 if res.diff:
                     print('\n'.join(res.diff))
             elif res.status == 'not run':
@@ -415,16 +412,16 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
             if res.interrupted:
                 break
 
-        if not self.tap:
-            if notrun:
-                print('Not run:', ' '.join(notrun))
+        if notrun:
+            print('Not run:', ' '.join(notrun))
 
-            if casenotrun:
-                print('Some cases not run in:', ' '.join(casenotrun))
+        if casenotrun:
+            print('Some cases not run in:', ' '.join(casenotrun))
 
-            if failed:
-                print('Failures:', ' '.join(failed))
-                print(f'Failed {len(failed)} of {n_run} iotests')
-            else:
-                print(f'Passed all {n_run} iotests')
-        return not failed
+        if failed:
+            print('Failures:', ' '.join(failed))
+            print(f'Failed {len(failed)} of {n_run} iotests')
+            return False
+        else:
+            print(f'Passed all {n_run} iotests')
+            return True
-- 
2.31.1


