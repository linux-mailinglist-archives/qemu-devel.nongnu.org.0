Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF88640432
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:10:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12vZ-0003iE-5Q; Fri, 02 Dec 2022 05:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vQ-0003cY-7I
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vN-0002PD-3s
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669975540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u107fbHxKmp2QlsQnjm2Q+ycWiXrmcXBWsNurKFxtIk=;
 b=SlVgzifhqHkPwUX995bGz4zS4IaM4cY8/kIvRwyZKunMmflx37yJ72oMMZ4Vxxnmhs1orF
 EOBnxPwtE2/2yldTBXepNviTJHojjDATYk35nEqYIjkvhTsJPTbYq9zdTVbidj4MwweeSP
 i0q5wueSfayRFWBmvErnVyNAzlgJHMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-rJneRopgNT2QOVit8uVxBg-1; Fri, 02 Dec 2022 05:05:38 -0500
X-MC-Unique: rJneRopgNT2QOVit8uVxBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97B70894E90;
 Fri,  2 Dec 2022 10:05:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D757414A814;
 Fri,  2 Dec 2022 10:05:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0019821E65C8; Fri,  2 Dec 2022 11:05:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 08/14] ui: Clean up a few things checkpatch.pl would flag
 later on
Date: Fri,  2 Dec 2022 11:05:06 +0100
Message-Id: <20221202100512.4161901-9-armbru@redhat.com>
In-Reply-To: <20221202100512.4161901-1-armbru@redhat.com>
References: <20221202100512.4161901-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix a few style violations so that checkpatch.pl won't complain when I
move this code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 monitor/hmp-cmds.c |  7 ++++---
 monitor/qmp-cmds.c | 21 +++++++++++----------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 8eb9c19b3a..86dde966ff 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -591,9 +591,10 @@ void hmp_info_vnc(Monitor *mon, const QDict *qdict)
         hmp_info_vnc_servers(mon, info->server);
         hmp_info_vnc_clients(mon, info->clients);
         if (!info->server) {
-            /* The server entry displays its auth, we only
-             * need to display in the case of 'reverse' connections
-             * where there's no server.
+            /*
+             * The server entry displays its auth, we only need to
+             * display in the case of 'reverse' connections where
+             * there's no server.
              */
             hmp_info_vnc_authcrypt(mon, "  ", info->auth,
                                info->has_vencrypt ? &info->vencrypt : NULL);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 054d7648b1..a7c95e8e39 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -190,8 +190,10 @@ void qmp_set_password(SetPasswordOptions *opts, Error **errp)
             error_setg(errp, QERR_INVALID_PARAMETER, "connected");
             return;
         }
-        /* Note that setting an empty password will not disable login through
-         * this interface. */
+        /*
+         * Note that setting an empty password will not disable login
+         * through this interface.
+         */
         rc = vnc_display_password(opts->u.vnc.display, opts->password);
     }
 
@@ -276,12 +278,10 @@ void qmp_add_client(const char *protocol, const char *fdname,
             error_setg(errp, "spice failed to add client");
             close(fd);
         }
-        return;
 #ifdef CONFIG_VNC
     } else if (strcmp(protocol, "vnc") == 0) {
         skipauth = has_skipauth ? skipauth : false;
         vnc_display_add_client(NULL, fd, skipauth);
-        return;
 #endif
 #ifdef CONFIG_DBUS_DISPLAY
     } else if (strcmp(protocol, "@dbus-display") == 0) {
@@ -293,19 +293,20 @@ void qmp_add_client(const char *protocol, const char *fdname,
             close(fd);
             return;
         }
-        return;
 #endif
-    } else if ((s = qemu_chr_find(protocol)) != NULL) {
+    } else {
+        s = qemu_chr_find(protocol);
+        if (!s) {
+            error_setg(errp, "protocol '%s' is invalid", protocol);
+            close(fd);
+            return;
+        }
         if (qemu_chr_add_client(s, fd) < 0) {
             error_setg(errp, "failed to add client");
             close(fd);
             return;
         }
-        return;
     }
-
-    error_setg(errp, "protocol '%s' is invalid", protocol);
-    close(fd);
 }
 
 
-- 
2.37.3


