Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3829528A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 20:57:06 +0200 (CEST)
Received: from localhost ([::1]:42108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVJIH-0002lg-9I
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 14:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kVJDv-0005yj-7i
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 14:52:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kVJDq-0008B3-2q
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 14:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603306338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDwlV6jl4lTRqbwWn3GfiZY5n43RP2QRc/WLUFkH5Nw=;
 b=Pb9FbNPgbBzQPVPEdFMOS7GfkYz/0+nVD0ggGVLGUEY99D8GyhFBGvFcLCMeFPHrwoTWS5
 h1Ga34mrFx5uDmTbj//rhRT3OD7BUnvabCIlXf2qtSr2dXVNxoSpDMMhNvt6Kn4aMVxClK
 ClFG3HpuBcq3Ctfdp7FrsW6583CJHnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-qA354TSoN0aClw8L71lumw-1; Wed, 21 Oct 2020 14:52:16 -0400
X-MC-Unique: qA354TSoN0aClw8L71lumw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76A9518A0763
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 18:52:15 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82B4A10027A5;
 Wed, 21 Oct 2020 18:52:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/15] scripts/qom-fuse: Apply pylint rules
Date: Wed, 21 Oct 2020 14:52:00 -0400
Message-Id: <20201021185208.1611145-8-jsnow@redhat.com>
In-Reply-To: <20201021185208.1611145-1-jsnow@redhat.com>
References: <20201021185208.1611145-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Catch specific exceptions from QMP
- Reraise errors with explicit context
- method parameters should match parent's names

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qom-fuse | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index ca30e92867..805e99c8ec 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -23,7 +23,7 @@ from fuse import FUSE, FuseOSError, Operations
 
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import QEMUMonitorProtocol
+from qemu.qmp import QEMUMonitorProtocol, QMPResponseError
 
 
 fuse.fuse_python_api = (0, 2)
@@ -47,7 +47,7 @@ class QOMFS(Operations):
         try:
             self.qmp.command('qom-list', path=path)
             return True
-        except:
+        except QMPResponseError:
             return False
 
     def is_property(self, path):
@@ -59,7 +59,7 @@ class QOMFS(Operations):
                 if item['name'] == prop:
                     return True
             return False
-        except:
+        except QMPResponseError:
             return False
 
     def is_link(self, path):
@@ -73,10 +73,10 @@ class QOMFS(Operations):
                         return True
                     return False
             return False
-        except:
+        except QMPResponseError:
             return False
 
-    def read(self, path, length, offset, fh):
+    def read(self, path, size, offset, fh):
         if not self.is_property(path):
             return -ENOENT
 
@@ -86,13 +86,13 @@ class QOMFS(Operations):
         try:
             data = self.qmp.command('qom-get', path=path, property=prop)
             data += '\n'  # make values shell friendly
-        except:
-            raise FuseOSError(EPERM)
+        except QMPResponseError as err:
+            raise FuseOSError(EPERM) from err
 
         if offset > len(data):
             return ''
 
-        return bytes(data[offset:][:length], encoding='utf-8')
+        return bytes(data[offset:][:size], encoding='utf-8')
 
     def readlink(self, path):
         if not self.is_link(path):
-- 
2.26.2


