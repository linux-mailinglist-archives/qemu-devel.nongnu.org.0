Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59536066C1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:09:02 +0200 (CEST)
Received: from localhost ([::1]:44114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZ22-0001Yz-Cf
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:08:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYly-0007yI-RQ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNY-0004vh-Ad
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:49 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:48085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olYNT-00072X-3W
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:26:41 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M3Eqr-1ooaF12Dan-003Zwk; Thu, 20 Oct 2022 18:26:22 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH v13 13/17] qemu-sockets: move and rename SocketAddress_to_str()
Date: Thu, 20 Oct 2022 18:25:54 +0200
Message-Id: <20221020162558.123284-14-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EBSsKpoMvb4kVnubRNH391sqdp02e+B/lxh8QXD4zZEBp80ZvNE
 Hr1xjfburCkMioWRli3+cVEGNlCDq++nAxvUrndX6NemdHBajAEVq/Cko5HX9ZH9h2VDC5e
 kSjs1DX0XoFvXdXD4RPJUqemkJA7MUd8vgTeMxnTtlruHTOCWFOyq0ZAQDMWRqyrhOUlYri
 Dl4lrUD8P/gztwMVNXdFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SbguPMbjdLU=:xliBKv6hR3osxvlTAcTFWT
 l99333Gft0k/TAeXhIIK2uLvyfQghZLXtqAkVpTWcYCpQ7Enw+gQA018Yivgwj9xEl7W2142V
 CxKSFI6c+RY5lINZGQ5MQpLANcNhsX+kFurmJ7dVvcboyZJ+vN1oOEPWZXHHkAx6dHt8oMMOS
 kRO+NxBFgFNrNigJ/R8hUakV1hmGdowhP0Jf9mdL1toQRF14w4jmpXgyptYl++3OtsTh8/dj6
 sLkn+g4xnX6YzJMWN2OZZCTSDfNrRAQiWuEXFushhJTgFaWj9gEULS+Cvqq2e0dDPY7De9nJp
 lIqYRmKklTlKAZZd8hs96/MqgfgN6CiY6FOtqda6UUBC2nSOGbHUHXRXgCXulNCBFxlZFUHF/
 66sfnT9ZTOPp8QDxI13QL1BRxZa7kXmr+p8BkUVRYoQoKXTikkro1BZaUTSuhVVwRhmxJRNWb
 co5tEjiqX4Au/yaZlo1TYEO3KH5rXSlc+DmHnW+dqXu21BxMk1ncm/Saed1i44m5UZ9uaEa5z
 OoPqAJXQ5XgZPPJpkqYFJj7EW3imYb2l4RE+EDZ2tdF4L7n1WgYW8ZnWMxMfvy7tQJBk8Vn+G
 ZyadKCxWz6qe+yEUPzMaY1myc9ThJHvrvWc41P4GxUjTZ46HzIDuPUPZHL/LNTePC53EqyRO2
 1ed99tzhQmzssg5rong9U61AQzDaPOninCGUsg4KGzAyfBlnE4qWotkBhk7zKrE1ThRYf/RpP
 Qh1oqW/Teo5okp7w1QX0OfFQ/Q1nN4I37P25Tqe92DqpXCi3DFRDL2r90KUnuzBHK+zpO9wr5
 mcn2hqt
Received-SPF: permerror client-ip=212.227.126.130;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename SocketAddress_to_str() to socket_uri() and move it to
util/qemu-sockets.c close to socket_parse().

socket_uri() generates a string from a SocketAddress while
socket_parse() generates a SocketAddress from a string.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/qemu/sockets.h |  2 +-
 monitor/hmp-cmds.c     | 23 +----------------------
 util/qemu-sockets.c    | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index db4bedb6fa20..214058d8e307 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -58,6 +58,7 @@ NetworkAddressFamily inet_netfamily(int family);
 int unix_listen(const char *path, Error **errp);
 int unix_connect(const char *path, Error **errp);
 
+char *socket_uri(SocketAddress *addr);
 SocketAddress *socket_parse(const char *str, Error **errp);
 int socket_connect(SocketAddress *addr, Error **errp);
 int socket_listen(SocketAddress *addr, int num, Error **errp);
@@ -141,5 +142,4 @@ SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);
  * Return 0 on success.
  */
 int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
-
 #endif /* QEMU_SOCKETS_H */
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bab86c5537e1..01b789a79e62 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -199,27 +199,6 @@ void hmp_info_mice(Monitor *mon, const QDict *qdict)
     qapi_free_MouseInfoList(mice_list);
 }
 
-static char *SocketAddress_to_str(SocketAddress *addr)
-{
-    switch (addr->type) {
-    case SOCKET_ADDRESS_TYPE_INET:
-        return g_strdup_printf("tcp:%s:%s",
-                               addr->u.inet.host,
-                               addr->u.inet.port);
-    case SOCKET_ADDRESS_TYPE_UNIX:
-        return g_strdup_printf("unix:%s",
-                               addr->u.q_unix.path);
-    case SOCKET_ADDRESS_TYPE_FD:
-        return g_strdup_printf("fd:%s", addr->u.fd.str);
-    case SOCKET_ADDRESS_TYPE_VSOCK:
-        return g_strdup_printf("tcp:%s:%s",
-                               addr->u.vsock.cid,
-                               addr->u.vsock.port);
-    default:
-        return g_strdup("unknown address type");
-    }
-}
-
 void hmp_info_migrate(Monitor *mon, const QDict *qdict)
 {
     MigrationInfo *info;
@@ -382,7 +361,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "socket address: [\n");
 
         for (addr = info->socket_address; addr; addr = addr->next) {
-            char *s = SocketAddress_to_str(addr->value);
+            char *s = socket_uri(addr->value);
             monitor_printf(mon, "\t%s\n", s);
             g_free(s);
         }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 83f4bd6fd211..9f6f655fd526 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1077,6 +1077,26 @@ int unix_connect(const char *path, Error **errp)
     return sock;
 }
 
+char *socket_uri(SocketAddress *addr)
+{
+    switch (addr->type) {
+    case SOCKET_ADDRESS_TYPE_INET:
+        return g_strdup_printf("tcp:%s:%s",
+                               addr->u.inet.host,
+                               addr->u.inet.port);
+    case SOCKET_ADDRESS_TYPE_UNIX:
+        return g_strdup_printf("unix:%s",
+                               addr->u.q_unix.path);
+    case SOCKET_ADDRESS_TYPE_FD:
+        return g_strdup_printf("fd:%s", addr->u.fd.str);
+    case SOCKET_ADDRESS_TYPE_VSOCK:
+        return g_strdup_printf("tcp:%s:%s",
+                               addr->u.vsock.cid,
+                               addr->u.vsock.port);
+    default:
+        return g_strdup("unknown address type");
+    }
+}
 
 SocketAddress *socket_parse(const char *str, Error **errp)
 {
-- 
2.37.3


