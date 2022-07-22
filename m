Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846BA57E72D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:17:51 +0200 (CEST)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEy9m-0003UV-Kl
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxQ-0005wl-Ek
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:04 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:49343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxO-0004d2-HK
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:04 -0400
Received: from thinkpad.redhat.com ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N1OsF-1nUGSh3s4p-012sLf; Fri, 22 Jul 2022 21:04:57 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v7 11/14] qemu-sockets: move and rename SocketAddress_to_str()
Date: Fri, 22 Jul 2022 21:04:39 +0200
Message-Id: <20220722190442.301310-12-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722190442.301310-1-lvivier@redhat.com>
References: <20220722190442.301310-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:x2v5an+/iIrecv2m0hVT0IwGhx0EGejVo1UrHE8nDjhohv3yZnk
 TMyJG1bRdLS7nR0AbQeLm/PBq+EOoFlBdFZMf8w1z6BzVydR4pnjI9Wmy88lufHyxVBBCeR
 mrRMTCwWnwdqkXJltPpyJB1TK3znetDhZD35cNWcs5DR3CS6wpxCmAkdTS2OTbdR2fATHuY
 HTJAPAdxPMsDGHoadkWAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3+5HjOGboFI=:WPb6+PMjxNRFTorkcpJdJP
 sVD2LbUm/LF8+g++WSocq0iinLthUoFMRdABLthbV7vRWpcU8qTkdzCYjqfV60uIDNDDJw/Uk
 AU3dSIjum4054RpT/yHc7cKVTQ8rg21ueb8EqOdz+Kw4wCCUv0m2ntOu44vNn34X6H/ZtPDz5
 G5sAyhQPE+CLJaBFLZ8nOamEgOVQGPKQi951UH8f+kSIbA7jkIyXw39fRL4oN5yGEd+ZHKtpK
 B1KyHHBDrmyBJP8R+lLrG8yBlJrwIk6MxrSAwYuPWX98ICDpIi0YEPXbvGyg5UnDuYo2JKib3
 7g5l5kj/D2wep44VBNYGdU9fQAlWSieka++HG3TEPELvq31UFd+mRc+V/RThgWL2ehdvnB0/n
 Y2D5dv3053/ip+pOXDwGHkNZS2Vg+486wBZiQu5QUijhvrwzDcVl9256TRf4J6FBw4EQK51zy
 oPnQHQWOly6hLXfobiBPvTAoJWQTNEmyOZdCViTzYJrfl9wDe7WIBNnJ8S/KTnqnzRt+rJxXK
 3ND0z9ikRyJeWwH59zrFbJPJ70NVZ3Fock6sopEgTlAjhZcFT+uuW6uEOFlE8aCn4lxpiaxjd
 RcQLTDKnB8gIlIwOFTkC8x36sqcawCJ4BMnFcaYlfpQu8zWUILmBQcrsl5K5KWntysWOihvd/
 zkpd/nU0B4m76G6VESOd042kiDoEi4OoDLeNbaOwx9pSM0RIpXtopwY+nZDJR9BrfI+eo0PPg
 7QYJqsT+3c1ulPHm9QlPRPKANu5uZAQdWJBKcA==
Received-SPF: permerror client-ip=212.227.126.133;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
---
 include/qemu/sockets.h |  2 +-
 monitor/hmp-cmds.c     | 23 +----------------------
 util/qemu-sockets.c    | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 47194b9732f8..e5a06d2e3729 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -40,6 +40,7 @@ NetworkAddressFamily inet_netfamily(int family);
 int unix_listen(const char *path, Error **errp);
 int unix_connect(const char *path, Error **errp);
 
+char *socket_uri(SocketAddress *addr);
 SocketAddress *socket_parse(const char *str, Error **errp);
 int socket_connect(SocketAddress *addr, Error **errp);
 int socket_listen(SocketAddress *addr, int num, Error **errp);
@@ -123,5 +124,4 @@ SocketAddress *socket_address_flatten(SocketAddressLegacy *addr);
  * Return 0 on success.
  */
 int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
-
 #endif /* QEMU_SOCKETS_H */
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index c6cd6f91dde6..cb35059c2d45 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -197,27 +197,6 @@ void hmp_info_mice(Monitor *mon, const QDict *qdict)
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
@@ -380,7 +359,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "socket address: [\n");
 
         for (addr = info->socket_address; addr; addr = addr->next) {
-            char *s = SocketAddress_to_str(addr->value);
+            char *s = socket_uri(addr->value);
             monitor_printf(mon, "\t%s\n", s);
             g_free(s);
         }
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 13b5b197f9ea..870a36eb0e93 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1098,6 +1098,26 @@ int unix_connect(const char *path, Error **errp)
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
2.37.1


