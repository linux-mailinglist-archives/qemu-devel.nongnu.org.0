Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C45301609
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:46:43 +0100 (CET)
Received: from localhost ([::1]:41708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KBV-0006BW-Sk
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxR-00042D-F9
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxM-0005w8-R0
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E7MP3gA/CFJCrnEelcxDuXl120gJ9ctP1eT9bavCStI=;
 b=G8armrSZe9lJBK6jClEPemMj9Em3uYMi05y/DowXtvbg6zfAra4Tkd25+O1vpayH2qeAF3
 LhMOYKGMdWrB+5AfWjjlspIZ+MC6h5xgnCLcFa/7ClqScnLFsnom2JwDP7WMKfJ0VY8lBn
 fFhbuXSFPNkECHowKZ6oii4ICqbDzW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-JUgt5Yh4PkCCZUk8ujIO3Q-1; Sat, 23 Jan 2021 09:32:02 -0500
X-MC-Unique: JUgt5Yh4PkCCZUk8ujIO3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C4F5E745
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:32:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBC725D9CC;
 Sat, 23 Jan 2021 14:32:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/31] vnc: support "-vnc help"
Date: Sat, 23 Jan 2021 09:31:25 -0500
Message-Id: <20210123143128.1167797-29-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qemu_opts_parse_noisily now that HMP does not call
vnc_parse anymore.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210120144235.345983-4-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/ui/console.h | 2 +-
 softmmu/vl.c         | 6 +++---
 ui/vnc-stubs.c       | 7 +++----
 ui/vnc.c             | 8 ++++----
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 5dd21976a3..7a3fc11abf 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -439,7 +439,7 @@ void vnc_display_open(const char *id, Error **errp);
 void vnc_display_add_client(const char *id, int csock, bool skipauth);
 int vnc_display_password(const char *id, const char *password);
 int vnc_display_pw_expire(const char *id, time_t expires);
-QemuOpts *vnc_parse(const char *str, Error **errp);
+void vnc_parse(const char *str);
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
 
 /* input.c */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 59304261cf..a8876b8965 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1113,7 +1113,7 @@ static void parse_display(const char *p)
          * display access.
          */
         if (*opts == '=') {
-            vnc_parse(opts + 1, &error_fatal);
+            vnc_parse(opts + 1);
         } else {
             error_report("VNC requires a display argument vnc=<display>");
             exit(1);
@@ -1402,7 +1402,7 @@ static void qemu_create_default_devices(void)
         if (!qemu_display_find_default(&dpy)) {
             dpy.type = DISPLAY_TYPE_NONE;
 #if defined(CONFIG_VNC)
-            vnc_parse("localhost:0,to=99,id=default", &error_abort);
+            vnc_parse("localhost:0,to=99,id=default");
 #endif
         }
     }
@@ -3186,7 +3186,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_vnc:
-                vnc_parse(optarg, &error_fatal);
+                vnc_parse(optarg);
                 break;
             case QEMU_OPTION_no_acpi:
                 olist = qemu_find_opts("machine");
diff --git a/ui/vnc-stubs.c b/ui/vnc-stubs.c
index c6b737dcec..b4eb3ce718 100644
--- a/ui/vnc-stubs.c
+++ b/ui/vnc-stubs.c
@@ -10,13 +10,12 @@ int vnc_display_pw_expire(const char *id, time_t expires)
 {
     return -ENODEV;
 };
-QemuOpts *vnc_parse(const char *str, Error **errp)
+void vnc_parse(const char *str)
 {
     if (strcmp(str, "none") == 0) {
-        return NULL;
+        return;
     }
-    error_setg(errp, "VNC support is disabled");
-    return NULL;
+    error_setg(&error_fatal, "VNC support is disabled");
 }
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp)
 {
diff --git a/ui/vnc.c b/ui/vnc.c
index d429bfee5a..66f7c1b936 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -50,6 +50,7 @@
 #include "crypto/random.h"
 #include "qom/object_interfaces.h"
 #include "qemu/cutils.h"
+#include "qemu/help_option.h"
 #include "io/dns-resolver.h"
 
 #define VNC_REFRESH_INTERVAL_BASE GUI_REFRESH_INTERVAL_DEFAULT
@@ -4211,14 +4212,14 @@ static void vnc_auto_assign_id(QemuOptsList *olist, QemuOpts *opts)
     qemu_opts_set_id(opts, id);
 }
 
-QemuOpts *vnc_parse(const char *str, Error **errp)
+void vnc_parse(const char *str)
 {
     QemuOptsList *olist = qemu_find_opts("vnc");
-    QemuOpts *opts = qemu_opts_parse(olist, str, true, errp);
+    QemuOpts *opts = qemu_opts_parse_noisily(olist, str, !is_help_option(str));
     const char *id;
 
     if (!opts) {
-        return NULL;
+        exit(1);
     }
 
     id = qemu_opts_id(opts);
@@ -4226,7 +4227,6 @@ QemuOpts *vnc_parse(const char *str, Error **errp)
         /* auto-assign id if not present */
         vnc_auto_assign_id(olist, opts);
     }
-    return opts;
 }
 
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp)
-- 
2.26.2



