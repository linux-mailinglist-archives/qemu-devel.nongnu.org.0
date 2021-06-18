Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00A93AD5B6
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:16:53 +0200 (CEST)
Received: from localhost ([::1]:35304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNjI-0007WG-Pb
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY7-0006rD-MM
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY3-00068z-RA
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BoUUzO4xspwg/kfAruJUVmAO/uk8Osc/g8OYqF9jK8=;
 b=dCJehif57eJMdkvDt9wUD9EaVtt6OoSnQcJ8q52LtqtxYUgpotfw6hP4jjW6HRGe+gjzMi
 /qK3Q4Fun9UTDSIdKrkfC2SJdt5OkrIk7g2UNKT4slu7Ue9U54Fuf4RENDBwsiZ+a4+NMA
 ezBvElWWMSqgnEt37SJTIEQS3KoC9/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-uLRZLHALN0eFrHBFk0u7PQ-1; Fri, 18 Jun 2021 19:05:11 -0400
X-MC-Unique: uLRZLHALN0eFrHBFk0u7PQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C102801B1C;
 Fri, 18 Jun 2021 23:05:10 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 929971017CE5;
 Fri, 18 Jun 2021 23:05:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/72] scripts/qom-fuse: Apply pylint rules
Date: Fri, 18 Jun 2021 19:03:53 -0400
Message-Id: <20210618230455.2891199-11-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

- Catch specific exceptions from QMP
- Reraise errors with explicit context
- method parameters should match parent's names

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210603003719.1321369-11-jsnow@redhat.com
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
2.31.1


