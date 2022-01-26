Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0304E49C818
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 11:53:58 +0100 (CET)
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCfw5-00007Z-3K
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 05:53:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCftk-0006PS-Ks
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:51:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCfth-0004gn-Th
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643194284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UaYmoxDMYTwZPqPgV/AT+ugIEJTI0d/edGVDF3zafQ=;
 b=TLkY3JGkb4T5GtAr9ZWvGyJLsuStMLko9oCGgW4kh6QRFOey3Ha8FWuobF6OBIdiKTxcqx
 qs+MvQOF6h3S3wYo05a5kWzB8BGbF6KG1/S4Q5chVp6MKkI8Rtyz9obK00ee3slhsyXrRz
 uvDFABxHnMR7tk9xr3/eMFiuof7TWHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-SAd0q05wPJCACyySjiOvZA-1; Wed, 26 Jan 2022 05:51:22 -0500
X-MC-Unique: SAd0q05wPJCACyySjiOvZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCBF1835B47;
 Wed, 26 Jan 2022 10:51:21 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D31C81F309;
 Wed, 26 Jan 2022 10:51:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	shawtao1125@gmail.com,
	vgoyal@redhat.com
Subject: [PULL 1/1] virtiofsd: Drop membership of all supplementary groups
 (CVE-2022-0358)
Date: Wed, 26 Jan 2022 10:51:12 +0000
Message-Id: <20220126105112.28711-2-dgilbert@redhat.com>
In-Reply-To: <20220126105112.28711-1-dgilbert@redhat.com>
References: <20220126105112.28711-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mszeredi@redhat.com, mcascell@redhat.com, slp@redhat.com,
 virtio-fs@redhat.com, stefanha@redhat.com, pj.pandit@yahoo.co.in
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

At the start, drop membership of all supplementary groups. This is
not required.

If we have membership of "root" supplementary group and when we switch
uid/gid using setresuid/setsgid, we still retain membership of existing
supplemntary groups. And that can allow some operations which are not
normally allowed.

For example, if root in guest creates a dir as follows.

$ mkdir -m 03777 test_dir

This sets SGID on dir as well as allows unprivileged users to write into
this dir.

And now as unprivileged user open file as follows.

$ su test
$ fd = open("test_dir/priviledge_id", O_RDWR|O_CREAT|O_EXCL, 02755);

This will create SGID set executable in test_dir/.

And that's a problem because now an unpriviliged user can execute it,
get egid=0 and get access to resources owned by "root" group. This is
privilege escalation.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2044863
Fixes: CVE-2022-0358
Reported-by: JIETAO XIAO <shawtao1125@gmail.com>
Suggested-by: Miklos Szeredi <mszeredi@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <YfBGoriS38eBQrAb@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  dgilbert: Fixed missing {}'s style nit
---
 tools/virtiofsd/passthrough_ll.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 64b5b4fbb1..b3d0674f6d 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -54,6 +54,7 @@
 #include <sys/wait.h>
 #include <sys/xattr.h>
 #include <syslog.h>
+#include <grp.h>
 
 #include "qemu/cutils.h"
 #include "passthrough_helpers.h"
@@ -1161,6 +1162,30 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
 #define OURSYS_setresuid SYS_setresuid
 #endif
 
+static void drop_supplementary_groups(void)
+{
+    int ret;
+
+    ret = getgroups(0, NULL);
+    if (ret == -1) {
+        fuse_log(FUSE_LOG_ERR, "getgroups() failed with error=%d:%s\n",
+                 errno, strerror(errno));
+        exit(1);
+    }
+
+    if (!ret) {
+        return;
+    }
+
+    /* Drop all supplementary groups. We should not need it */
+    ret = setgroups(0, NULL);
+    if (ret == -1) {
+        fuse_log(FUSE_LOG_ERR, "setgroups() failed with error=%d:%s\n",
+                 errno, strerror(errno));
+        exit(1);
+    }
+}
+
 /*
  * Change to uid/gid of caller so that file is created with
  * ownership of caller.
@@ -3926,6 +3951,8 @@ int main(int argc, char *argv[])
 
     qemu_init_exec_dir(argv[0]);
 
+    drop_supplementary_groups();
+
     pthread_mutex_init(&lo.mutex, NULL);
     lo.inodes = g_hash_table_new(lo_key_hash, lo_key_equal);
     lo.root.fd = -1;
-- 
2.34.1


