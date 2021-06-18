Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC633AD5B7
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:16:54 +0200 (CEST)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNjJ-0007cx-IE
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY5-0006qI-UU
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY2-000686-7G
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gC6av141nIKnY4aIKWT/3S5ILShu9Z7M0yk2vx9xKwM=;
 b=KACzHmbcfEymi69NKMnrvCisgjciO6TdDHpt+7JznF9VMqud12KO3re2oZCk8SD741PC7C
 bAm76IFWsX3jmc+e9gaWDKm2BpuVqvfoO/0di0YTq02w75lVkFmXZI/XsfmRcklhDGdm+m
 lhFXS4ThO5XTIkLg1rLYxK8sh0/MEIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-LrHAyx0_MqmmDpPxMzIGKg-1; Fri, 18 Jun 2021 19:05:08 -0400
X-MC-Unique: LrHAyx0_MqmmDpPxMzIGKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1306D18D6A2E;
 Fri, 18 Jun 2021 23:05:08 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D5481017CE5;
 Fri, 18 Jun 2021 23:05:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/72] scripts/qom-fuse: apply flake8 rules
Date: Fri, 18 Jun 2021 19:03:51 -0400
Message-Id: <20210618230455.2891199-9-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

flake8 still has one warning because of the sys.path hack, but that will
be going away by the end of this patch series.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210603003719.1321369-9-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qom-fuse | 81 +++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 38 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index 62deb9adb1..ca30e92867 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -9,13 +9,12 @@
 #  Anthony Liguori   <aliguori@us.ibm.com>
 #  Markus Armbruster <armbru@redhat.com>
 #
-# This work is licensed under the terms of the GNU GPL, version 2 or later.  See
-# the COPYING file in the top-level directory.
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
 ##
 
-from errno import *
+from errno import ENOENT, EPERM
 import os
-import posix
 import stat
 import sys
 
@@ -29,6 +28,7 @@ from qemu.qmp import QEMUMonitorProtocol
 
 fuse.fuse_python_api = (0, 2)
 
+
 class QOMFS(Operations):
     def __init__(self, qmp):
         self.qmp = qmp
@@ -45,7 +45,7 @@ class QOMFS(Operations):
 
     def is_object(self, path):
         try:
-            items = self.qmp.command('qom-list', path=path)
+            self.qmp.command('qom-list', path=path)
             return True
         except:
             return False
@@ -85,7 +85,7 @@ class QOMFS(Operations):
             path = '/'
         try:
             data = self.qmp.command('qom-get', path=path, property=prop)
-            data += '\n' # make values shell friendly
+            data += '\n'  # make values shell friendly
         except:
             raise FuseOSError(EPERM)
 
@@ -104,38 +104,44 @@ class QOMFS(Operations):
 
     def getattr(self, path, fh=None):
         if self.is_link(path):
-            value = { 'st_mode': 0o755 | stat.S_IFLNK,
-                      'st_ino': self.get_ino(path),
-                      'st_dev': 0,
-                      'st_nlink': 2,
-                      'st_uid': 1000,
-                      'st_gid': 1000,
-                      'st_size': 4096,
-                      'st_atime': 0,
-                      'st_mtime': 0,
-                      'st_ctime': 0 }
+            value = {
+                'st_mode': 0o755 | stat.S_IFLNK,
+                'st_ino': self.get_ino(path),
+                'st_dev': 0,
+                'st_nlink': 2,
+                'st_uid': 1000,
+                'st_gid': 1000,
+                'st_size': 4096,
+                'st_atime': 0,
+                'st_mtime': 0,
+                'st_ctime': 0
+            }
         elif self.is_object(path):
-            value = { 'st_mode': 0o755 | stat.S_IFDIR,
-                      'st_ino': self.get_ino(path),
-                      'st_dev': 0,
-                      'st_nlink': 2,
-                      'st_uid': 1000,
-                      'st_gid': 1000,
-                      'st_size': 4096,
-                      'st_atime': 0,
-                      'st_mtime': 0,
-                      'st_ctime': 0 }
+            value = {
+                'st_mode': 0o755 | stat.S_IFDIR,
+                'st_ino': self.get_ino(path),
+                'st_dev': 0,
+                'st_nlink': 2,
+                'st_uid': 1000,
+                'st_gid': 1000,
+                'st_size': 4096,
+                'st_atime': 0,
+                'st_mtime': 0,
+                'st_ctime': 0
+            }
         elif self.is_property(path):
-            value = { 'st_mode': 0o644 | stat.S_IFREG,
-                      'st_ino': self.get_ino(path),
-                      'st_dev': 0,
-                      'st_nlink': 1,
-                      'st_uid': 1000,
-                      'st_gid': 1000,
-                      'st_size': 4096,
-                      'st_atime': 0,
-                      'st_mtime': 0,
-                      'st_ctime': 0 }
+            value = {
+                'st_mode': 0o644 | stat.S_IFREG,
+                'st_ino': self.get_ino(path),
+                'st_dev': 0,
+                'st_nlink': 1,
+                'st_uid': 1000,
+                'st_gid': 1000,
+                'st_size': 4096,
+                'st_atime': 0,
+                'st_mtime': 0,
+                'st_ctime': 0
+            }
         else:
             raise FuseOSError(ENOENT)
         return value
@@ -146,8 +152,7 @@ class QOMFS(Operations):
         for item in self.qmp.command('qom-list', path=path):
             yield str(item['name'])
 
+
 if __name__ == '__main__':
-    import os
-
     fuse = FUSE(QOMFS(QEMUMonitorProtocol(os.environ['QMP_SOCKET'])),
                 sys.argv[1], foreground=True)
-- 
2.31.1


