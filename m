Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CA2191D77
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 00:24:03 +0100 (CET)
Received: from localhost ([::1]:56606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGstu-0002Aj-EB
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 19:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jGssF-0007yW-N5
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jGssD-00020Q-VT
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:19 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:40491)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jGssD-00020D-Ru
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585092137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pt1JHAyv9+cKS6HYHyEnqpCwWDT3m8J34Ulv9SMHjPk=;
 b=C8bADropB/OMXuUWTYOPGjE/gALBgION7dxz/CQ/EYR6PrVeZy0BpXw8Ny561nITrhIWRq
 MqQrjuBPW7G12e9dWFrYVih3VvRLtYQDNOtYziJ/QEhXGXIRcUArF/H7PmWVTDT4muePF4
 Ll2Hh202lY4FZ4Fn6L/iAMYpaeB/4h4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-rEeBnqpIMzClsEmmmWLlkg-1; Tue, 24 Mar 2020 19:22:14 -0400
X-MC-Unique: rEeBnqpIMzClsEmmmWLlkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E49D18C35D2;
 Tue, 24 Mar 2020 23:21:56 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44CDF5D9C5;
 Tue, 24 Mar 2020 23:21:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 09/14] iotests: limit line length to 79 chars
Date: Tue, 24 Mar 2020 19:20:58 -0400
Message-Id: <20200324232103.4195-10-jsnow@redhat.com>
In-Reply-To: <20200324232103.4195-1-jsnow@redhat.com>
References: <20200324232103.4195-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 philmd@redhat.com, armbru@redhat.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

79 is the PEP8 recommendation. This recommendation works well for
reading patch diffs in TUI email clients.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 64 +++++++++++++++++++++++------------
 tests/qemu-iotests/pylintrc   |  6 +++-
 2 files changed, 47 insertions(+), 23 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 3a049ece5b..e12d6e533e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -80,9 +80,11 @@
 def qemu_img(*args):
     '''Run qemu-img and return the exit code'''
     devnull =3D open('/dev/null', 'r+')
-    exitcode =3D subprocess.call(qemu_img_args + list(args), stdin=3Ddevnu=
ll, stdout=3Ddevnull)
+    exitcode =3D subprocess.call(qemu_img_args + list(args),
+                               stdin=3Ddevnull, stdout=3Ddevnull)
     if exitcode < 0:
-        sys.stderr.write('qemu-img received signal %i: %s\n' % (-exitcode,=
 ' '.join(qemu_img_args + list(args))))
+        sys.stderr.write('qemu-img received signal %i: %s\n'
+                         % (-exitcode, ' '.join(qemu_img_args + list(args)=
)))
     return exitcode
=20
 def ordered_qmp(qmsg, conv_keys=3DTrue):
@@ -121,7 +123,8 @@ def qemu_img_verbose(*args):
     '''Run qemu-img without suppressing its output and return the exit cod=
e'''
     exitcode =3D subprocess.call(qemu_img_args + list(args))
     if exitcode < 0:
-        sys.stderr.write('qemu-img received signal %i: %s\n' % (-exitcode,=
 ' '.join(qemu_img_args + list(args))))
+        sys.stderr.write('qemu-img received signal %i: %s\n'
+                         % (-exitcode, ' '.join(qemu_img_args + list(args)=
)))
     return exitcode
=20
 def qemu_img_pipe(*args):
@@ -132,7 +135,8 @@ def qemu_img_pipe(*args):
                             universal_newlines=3DTrue)
     exitcode =3D subp.wait()
     if exitcode < 0:
-        sys.stderr.write('qemu-img received signal %i: %s\n' % (-exitcode,=
 ' '.join(qemu_img_args + list(args))))
+        sys.stderr.write('qemu-img received signal %i: %s\n'
+                         % (-exitcode, ' '.join(qemu_img_args + list(args)=
)))
     return subp.communicate()[0]
=20
 def qemu_img_log(*args):
@@ -162,7 +166,8 @@ def qemu_io(*args):
                             universal_newlines=3DTrue)
     exitcode =3D subp.wait()
     if exitcode < 0:
-        sys.stderr.write('qemu-io received signal %i: %s\n' % (-exitcode, =
' '.join(args)))
+        sys.stderr.write('qemu-io received signal %i: %s\n'
+                         % (-exitcode, ' '.join(args)))
     return subp.communicate()[0]
=20
 def qemu_io_log(*args):
@@ -284,10 +289,13 @@ def filter_test_dir(msg):
 def filter_win32(msg):
     return win32_re.sub("", msg)
=20
-qemu_io_re =3D re.compile(r"[0-9]* ops; [0-9\/:. sec]* \([0-9\/.inf]* [EPT=
GMKiBbytes]*\/sec and [0-9\/.inf]* ops\/sec\)")
+qemu_io_re =3D re.compile(r"[0-9]* ops; [0-9\/:. sec]* "
+                        r"\([0-9\/.inf]* [EPTGMKiBbytes]*\/sec "
+                        r"and [0-9\/.inf]* ops\/sec\)")
 def filter_qemu_io(msg):
     msg =3D filter_win32(msg)
-    return qemu_io_re.sub("X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)=
", msg)
+    return qemu_io_re.sub("X ops; XX:XX:XX.X "
+                          "(XXX YYY/sec and XXX ops/sec)", msg)
=20
 chown_re =3D re.compile(r"chown [0-9]+:[0-9]+")
 def filter_chown(msg):
@@ -339,7 +347,9 @@ def filter_img_info(output, filename):
         line =3D line.replace(filename, 'TEST_IMG') \
                    .replace(imgfmt, 'IMGFMT')
         line =3D re.sub('iters: [0-9]+', 'iters: XXX', line)
-        line =3D re.sub('uuid: [-a-f0-9]+', 'uuid: XXXXXXXX-XXXX-XXXX-XXXX=
-XXXXXXXXXXXX', line)
+        line =3D re.sub('uuid: [-a-f0-9]+',
+                      'uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',
+                      line)
         line =3D re.sub('cid: [0-9]+', 'cid: XXXXXXXXXX', line)
         lines.append(line)
     return '\n'.join(lines)
@@ -537,11 +547,13 @@ def pause_drive(self, drive, event=3DNone):
             self.pause_drive(drive, "write_aio")
             return
         self.qmp('human-monitor-command',
-                 command_line=3D'qemu-io %s "break %s bp_%s"' % (drive, ev=
ent, drive))
+                 command_line=3D'qemu-io %s "break %s bp_%s"'
+                 % (drive, event, drive))
=20
     def resume_drive(self, drive):
         self.qmp('human-monitor-command',
-                 command_line=3D'qemu-io %s "remove_break bp_%s"' % (drive=
, drive))
+                 command_line=3D'qemu-io %s "remove_break bp_%s"'
+                 % (drive, drive))
=20
     def hmp_qemu_io(self, drive, cmd):
         '''Write to a given drive using an HMP command'''
@@ -801,16 +813,18 @@ def dictpath(self, d, path):
                 idx =3D int(idx)
=20
             if not isinstance(d, dict) or component not in d:
-                self.fail('failed path traversal for "%s" in "%s"' % (path=
, str(d)))
+                self.fail(f'failed path traversal for "{path}" in "{d}"')
             d =3D d[component]
=20
             if m:
                 if not isinstance(d, list):
-                    self.fail('path component "%s" in "%s" is not a list i=
n "%s"' % (component, path, str(d)))
+                    self.fail(f'path component "{component}" in "{path}" '
+                              f'is not a list in "{d}"')
                 try:
                     d =3D d[idx]
                 except IndexError:
-                    self.fail('invalid index "%s" in path "%s" in "%s"' % =
(idx, path, str(d)))
+                    self.fail(f'invalid index "{idx}" in path "{path}" '
+                              f'in "{d}"')
         return d
=20
     def assert_qmp_absent(self, d, path):
@@ -861,10 +875,13 @@ def assert_json_filename_equal(self, json_filename, r=
eference):
         '''Asserts that the given filename is a json: filename and that it=
s
            content is equal to the given reference object'''
         self.assertEqual(json_filename[:5], 'json:')
-        self.assertEqual(self.vm.flatten_qmp_object(json.loads(json_filena=
me[5:])),
-                         self.vm.flatten_qmp_object(reference))
+        self.assertEqual(
+            self.vm.flatten_qmp_object(json.loads(json_filename[5:])),
+            self.vm.flatten_qmp_object(reference)
+        )
=20
-    def cancel_and_wait(self, drive=3D'drive0', force=3DFalse, resume=3DFa=
lse, wait=3D60.0):
+    def cancel_and_wait(self, drive=3D'drive0', force=3DFalse,
+                        resume=3DFalse, wait=3D60.0):
         '''Cancel a block job and wait for it to finish, returning the eve=
nt'''
         result =3D self.vm.qmp('block-job-cancel', device=3Ddrive, force=
=3Dforce)
         self.assert_qmp(result, 'return', {})
@@ -888,8 +905,8 @@ def cancel_and_wait(self, drive=3D'drive0', force=3DFal=
se, resume=3DFalse, wait=3D60.0):
         self.assert_no_active_block_jobs()
         return result
=20
-    def wait_until_completed(self, drive=3D'drive0', check_offset=3DTrue, =
wait=3D60.0,
-                             error=3DNone):
+    def wait_until_completed(self, drive=3D'drive0', check_offset=3DTrue,
+                             wait=3D60.0, error=3DNone):
         '''Wait for a block job to finish, returning the event'''
         while True:
             for event in self.vm.get_qmp_events(wait=3Dwait):
@@ -1028,8 +1045,11 @@ def verify_quorum():
         notrun('quorum support missing')
=20
 def qemu_pipe(*args):
-    '''Run qemu with an option to print something and exit (e.g. a help op=
tion),
-    and return its output'''
+    """
+    Run qemu with an option to print something and exit (e.g. a help optio=
n).
+
+    :return: QEMU's stdout output.
+    """
     args =3D [qemu_prog] + qemu_opts + list(args)
     subp =3D subprocess.Popen(args, stdout=3Dsubprocess.PIPE,
                             stderr=3Dsubprocess.STDOUT,
@@ -1067,8 +1087,8 @@ def func_wrapper(test_case: QMPTestCase, *args, **kwa=
rgs):
=20
             usf_list =3D list(set(fmts) - set(supported_formats(read_only)=
))
             if usf_list:
-                test_case.case_skip('{}: formats {} are not whitelisted'.f=
ormat(
-                    test_case, usf_list))
+                msg =3D f'{test_case}: formats {usf_list} are not whitelis=
ted'
+                test_case.case_skip(msg)
                 return None
             else:
                 return func(test_case, *args, **kwargs)
diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
index 8720b6a0de..8d02f00607 100644
--- a/tests/qemu-iotests/pylintrc
+++ b/tests/qemu-iotests/pylintrc
@@ -19,4 +19,8 @@ disable=3Dinvalid-name,
         too-many-public-methods,
         # These are temporary, and should be removed:
         missing-docstring,
-        line-too-long,
+
+[FORMAT]
+
+# Maximum number of characters on a single line.
+max-line-length=3D79
--=20
2.21.1


