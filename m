Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46CD30160D
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:49:20 +0100 (CET)
Received: from localhost ([::1]:49956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KE3-0001NH-VY
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxQ-0003zF-9W
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxO-0005wG-6d
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5X28KI+x6wVXpdgGznJ3rAGlj1garAdaQwTIztkfKwo=;
 b=BZXkZSc/BaRzqvhxP/se2Zi6wgp1WTzQnaee5FriU6HJf4F1F1ku3AIfLMfyQX4knu1ms4
 e7rsSgUK/cbIxgGc4l0ZiSybs/eRQtqtVKjUgi1DA7sJ2G1zgKn85in88ujKU2t8jR/yAZ
 cp5LjjvQf0E0WhjsUX4CsvxaUohwlBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-JNG7l8f2MECLbDduMwaMOQ-1; Sat, 23 Jan 2021 09:32:01 -0500
X-MC-Unique: JNG7l8f2MECLbDduMwaMOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFF6F107ACE3
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:32:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A6DA5D9CC;
 Sat, 23 Jan 2021 14:32:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/31] qmp: remove deprecated "change" command
Date: Sat, 23 Jan 2021 09:31:24 -0500
Message-Id: <20210123143128.1167797-28-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210120144235.345983-3-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst       |  5 ----
 docs/system/removed-features.rst |  5 ++++
 monitor/qmp-cmds.c               | 51 --------------------------------
 qapi/misc.json                   | 49 ------------------------------
 4 files changed, 5 insertions(+), 105 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e20bfcb17a..651182b2df 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -131,11 +131,6 @@ devices.  It is possible to use drives the board doesn't pick up with
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
-``change`` (since 2.5.0)
-''''''''''''''''''''''''
-
-Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
-
 ``blockdev-open-tray``, ``blockdev-close-tray`` argument ``device`` (since 2.8.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 5b0ff6ab1f..88b81a6156 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -53,6 +53,11 @@ are automatically loaded from qcow2 images.
 Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
 documentation of ``query-hotpluggable-cpus`` for additional details.
 
+``change`` (removed in 6.0)
+'''''''''''''''''''''''''''
+
+Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 34f7e75b7b..990936136c 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -251,58 +251,7 @@ void qmp_change_vnc_password(const char *password, Error **errp)
         error_setg(errp, "Could not set password");
     }
 }
-
-static void qmp_change_vnc_listen(const char *target, Error **errp)
-{
-    QemuOptsList *olist = qemu_find_opts("vnc");
-    QemuOpts *opts;
-
-    if (strstr(target, "id=")) {
-        error_setg(errp, "id not supported");
-        return;
-    }
-
-    opts = qemu_opts_find(olist, "default");
-    if (opts) {
-        qemu_opts_del(opts);
-    }
-    opts = vnc_parse(target, errp);
-    if (!opts) {
-        return;
-    }
-
-    vnc_display_open("default", errp);
-}
-
-static void qmp_change_vnc(const char *target, bool has_arg, const char *arg,
-                           Error **errp)
-{
-    if (strcmp(target, "passwd") == 0 || strcmp(target, "password") == 0) {
-        if (!has_arg) {
-            error_setg(errp, QERR_MISSING_PARAMETER, "password");
-        } else {
-            qmp_change_vnc_password(arg, errp);
-        }
-    } else {
-        qmp_change_vnc_listen(target, errp);
-    }
-}
-#endif /* !CONFIG_VNC */
-
-void qmp_change(const char *device, const char *target,
-                bool has_arg, const char *arg, Error **errp)
-{
-    if (strcmp(device, "vnc") == 0) {
-#ifdef CONFIG_VNC
-        qmp_change_vnc(target, has_arg, arg, errp);
-#else
-        error_setg(errp, QERR_FEATURE_DISABLED, "vnc");
 #endif
-    } else {
-        qmp_blockdev_change_medium(true, device, false, NULL, target,
-                                   has_arg, arg, false, 0, errp);
-    }
-}
 
 void qmp_add_client(const char *protocol, const char *fdname,
                     bool has_skipauth, bool skipauth, bool has_tls, bool tls,
diff --git a/qapi/misc.json b/qapi/misc.json
index 27ccd7385f..156f98203e 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -238,55 +238,6 @@
   'returns': 'str',
   'features': [ 'savevm-monitor-nodes' ] }
 
-##
-# @change:
-#
-# This command is multiple commands multiplexed together.
-#
-# @device: This is normally the name of a block device but it may also be 'vnc'.
-#          when it's 'vnc', then sub command depends on @target
-#
-# @target: If @device is a block device, then this is the new filename.
-#          If @device is 'vnc', then if the value 'password' selects the vnc
-#          change password command.   Otherwise, this specifies a new server URI
-#          address to listen to for VNC connections.
-#
-# @arg: If @device is a block device, then this is an optional format to open
-#       the device with.
-#       If @device is 'vnc' and @target is 'password', this is the new VNC
-#       password to set.  See change-vnc-password for additional notes.
-#
-# Features:
-# @deprecated: This command is deprecated.  For changing block
-#              devices, use 'blockdev-change-medium' instead; for changing VNC
-#              parameters, use 'change-vnc-password' instead.
-#
-# Returns: - Nothing on success.
-#          - If @device is not a valid block device, DeviceNotFound
-#
-# Since: 0.14
-#
-# Example:
-#
-# 1. Change a removable medium
-#
-# -> { "execute": "change",
-#      "arguments": { "device": "ide1-cd0",
-#                     "target": "/srv/images/Fedora-12-x86_64-DVD.iso" } }
-# <- { "return": {} }
-#
-# 2. Change VNC password
-#
-# -> { "execute": "change",
-#      "arguments": { "device": "vnc", "target": "password",
-#                     "arg": "foobar1" } }
-# <- { "return": {} }
-#
-##
-{ 'command': 'change',
-  'data': {'device': 'str', 'target': 'str', '*arg': 'str'},
-  'features': [ 'deprecated' ] }
-
 ##
 # @getfd:
 #
-- 
2.26.2



