Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E793B301614
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:52:44 +0100 (CET)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KHL-0005jw-Uq
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxN-0003tJ-Mj
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxL-0005vT-OP
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S2HoyAvJTKEVZOwy3tRXytglUSucnbFeGNW4rcTNjcY=;
 b=JA901uDE7cQw6Gns/ULvBto31si0KyWIH17UF7yWcENatXGeZ+04L1OGu/rE+9l2uPllj0
 5ZF6sH15i4Eqd17s5SwOAMuq/qX6ZluPNWz2VZZEiyBl9NASxHTFdpma/8GNpy5c3HUIYm
 zyfJ7pyjPIN7FDbhY/QgzQ6qEBsjric=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-EjiYWOcsMZiuyIClaumPfQ-1; Sat, 23 Jan 2021 09:32:01 -0500
X-MC-Unique: EjiYWOcsMZiuyIClaumPfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EE2710054FF
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:32:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2286F5D9CC;
 Sat, 23 Jan 2021 14:31:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/31] hmp: remove "change vnc TARGET" command
Date: Sat, 23 Jan 2021 09:31:23 -0500
Message-Id: <20210123143128.1167797-27-pbonzini@redhat.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The HMP command \"change vnc TARGET\" is messy:

- it takes an ugly shortcut to determine if the option has an "id",
with incorrect results if "id=" is not preceded by an unescaped
comma.

- it deletes the existing QemuOpts and does not try to rollback
if the parsing fails (which is not causing problems, but only due to
how VNC options are parsed)

- because it uses the same parsing function as "-vnc", it forces
the latter to not support "-vnc help".

On top of this, it uses a deprecated QMP command, thus getting in
the way of removing the QMP command.  Since the usecase for the
command is not clear, just remove it and send "change vnc password"
directly to the QMP "change-vnc-password" command.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210120144235.345983-2-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/removed-features.rst | 6 ++++++
 hmp-commands.hx                  | 6 ------
 monitor/hmp-cmds.c               | 7 +++++--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 430fc33ca1..5b0ff6ab1f 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -68,6 +68,12 @@ The ``[hub_id name]`` parameter tuple of the 'hostfwd_add' and
 Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
 documentation of ``query-hotpluggable-cpus`` for additional details.
 
+``change vnc TARGET`` (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''
+
+No replacement.  The ``change vnc password`` and ``change DEVICE MEDIUM``
+commands are not affected.
+
 Guest Emulator ISAs
 -------------------
 
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 73e0832ea1..d4001f9c5d 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -231,12 +231,6 @@ SRST
     read-write
       Makes the device writable.
 
-  ``change vnc`` *display*,\ *options*
-    Change the configuration of the VNC server. The valid syntax for *display*
-    and *options* are described at :ref:`sec_005finvocation`. eg::
-
-      (qemu) change vnc localhost:1
-
   ``change vnc password`` [*password*]
 
     Change the password associated with the VNC server. If the new password
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index fd4d77e246..499647a578 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1521,13 +1521,16 @@ void hmp_change(Monitor *mon, const QDict *qdict)
         }
         if (strcmp(target, "passwd") == 0 ||
             strcmp(target, "password") == 0) {
-            if (!arg) {
+            if (arg) {
                 MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
                 monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
                 return;
+            } else {
+                qmp_change_vnc_password(arg, &err);
             }
+        } else {
+            monitor_printf(mon, "Expected 'password' after 'vnc'\n");
         }
-        qmp_change("vnc", target, !!arg, arg, &err);
     } else
 #endif
     {
-- 
2.26.2



