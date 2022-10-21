Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9174C607411
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:30:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloMI-0006qV-M0
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:30:30 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo2r-00053x-Nr
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2b-0003tU-5N
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:10:09 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olo2V-000254-0x
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:10:07 -0400
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N2VKr-1pFHDk0Xh1-013zUl; Fri, 21 Oct 2022 11:09:51 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v14 17/17] net: stream: add QAPI events to report connection
 state
Date: Fri, 21 Oct 2022 11:09:22 +0200
Message-Id: <20221021090922.170074-18-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221021090922.170074-1-lvivier@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3qigyZi+KVz96ySGS6bqVJaYaPxXAMgTyYwclTCtKTSb7A3gsIt
 SdMTbioFbJo7FqHB+14qedMmyEF7GpvmUNv8gPVARyqLvd32BdEC90dhWYdE+8RSLucnhOf
 TkRD8Tz10832VhOljwKfSqVSJYrOC2g8Lvaw7lA1g6tcnygpoYyRsuG4TonEL6gEu1y98Yk
 Ui4PfpZmyHLzuXBbrc3Wg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u2SBYcxc29k=:Z/SFRNQr3jfmeh0w45tVSV
 vtMdPTAgRWe4h7V3llXabx44mm5VsuCmFpmdi73loD6zH9Q+mqGGkgmOhFI9v1CNxWODjYUn3
 UfjXRSwNrbsCXActkVXz6RNxTGtjaJMqexh4Dn+qjpdUIUKVgBslww8jC6iYHXw4zQZYRfrlQ
 7ombF82cX2ef/cKES/02n5QVwbr5KaK7rLNjR0EJel0UEvRskLQLiQ5nznxrX35EiCN+I7BHa
 CYXDkuGzi2eU0viRa/mwuT44neFg1fUfCCJcDJ72b00U/24x8285y4ya6CXyyPe9p32Ub85XT
 K0LST8UIFl+Ep78xuZ0tibVLYCCFVLTBRxpbCwn+zUYZrR3CL0BcH9j7sPaOqwDHA/GpqmcNT
 8PmbtUe72tNOYQPoM6yGfbn2lq7GMx89lebNLgPlki35gOICljAqYBPZXqIKv2vOc98pGbB8t
 IN29Pari/OtGwyQ2uEgWA3Bac01JpTF4mkun7knlh91EuqCkPpoCvUxpAYvIwrlE0pvdAsfjB
 hkKCghIg1POfKRIr10I7yW5eVJsQVYgiYniiFC8s5qvyiKwC/IYTRivWmGIQvUeo7QyR67rP0
 qbteljVsGy2lSXwn6Uyevhdy4qq1YhSSRmWXaDvBjrs5LKJK5BumKqbDV2m+W7YPMf08O8JJv
 NXnWaeNeZsPQue6u3ZVBmd8CXEbkzShFXps/YBFfWCedxvteoZHgl7traR7zVEp9cHcAu5Bjx
 HR6terX2Ega5aoWEvbvVT7Gdrq4dUfICGgx/GrkhfptRslCOIgPx73MetcMgm1TZRHb8j1zXp
 +tEC/mn
Received-SPF: permerror client-ip=217.72.192.74;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The netdev reports NETDEV_STREAM_CONNECTED event when the backend
is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.

The NETDEV_STREAM_CONNECTED event includes the destination address.

This allows a system manager like libvirt to detect when the server
fails.

For instance with passt:

{ 'execute': 'qmp_capabilities' }
{ "return": { } }
{ "timestamp": { "seconds": 1666341395, "microseconds": 505347 },
    "event": "NETDEV_STREAM_CONNECTED",
    "data": { "netdev-id": "netdev0",
        "addr": { "path": "/tmp/passt_1.socket", "type": "unix" } } }

[killing passt here]

{ "timestamp": { "seconds": 1666341430, "microseconds": 968694 },
    "event": "NETDEV_STREAM_DISCONNECTED",
    "data": { "netdev-id": "netdev0" } }

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/stream.c  |  5 +++++
 qapi/net.json | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/net/stream.c b/net/stream.c
index 54c67e14d240..53b7040cc417 100644
--- a/net/stream.c
+++ b/net/stream.c
@@ -38,6 +38,7 @@
 #include "io/channel.h"
 #include "io/channel-socket.h"
 #include "io/net-listener.h"
+#include "qapi/qapi-events-net.h"
 
 typedef struct NetStreamState {
     NetClientState nc;
@@ -168,6 +169,8 @@ static gboolean net_stream_send(QIOChannel *ioc,
         s->nc.link_down = true;
         qemu_set_info_str(&s->nc, "");
 
+        qapi_event_send_netdev_stream_disconnected(s->nc.name);
+
         return G_SOURCE_REMOVE;
     }
     buf = buf1;
@@ -244,6 +247,7 @@ static void net_stream_listen(QIONetListener *listener,
     uri = socket_uri(addr);
     qemu_set_info_str(&s->nc, uri);
     g_free(uri);
+    qapi_event_send_netdev_stream_connected(s->nc.name, addr);
     qapi_free_SocketAddress(addr);
 }
 
@@ -335,6 +339,7 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
     s->ioc_read_tag = qio_channel_add_watch(s->ioc, G_IO_IN, net_stream_send,
                                             s, NULL);
     s->nc.link_down = false;
+    qapi_event_send_netdev_stream_connected(s->nc.name, addr);
     qapi_free_SocketAddress(addr);
 
     return;
diff --git a/qapi/net.json b/qapi/net.json
index 39388b1b6c41..c37b24717382 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -895,3 +895,52 @@
 ##
 { 'event': 'FAILOVER_NEGOTIATED',
   'data': {'device-id': 'str'} }
+
+##
+# @NETDEV_STREAM_CONNECTED:
+#
+# Emitted when the netdev stream backend is connected
+#
+# @netdev-id: QEMU netdev id that is connected
+# @addr: The destination address
+#
+# Since: 7.2
+#
+# Example:
+#
+# <- { "event": "NETDEV_STREAM_CONNECTED",
+#      "data": { "netdev-id": "netdev0",
+#                "addr": { "port": "47666", "ipv6": true,
+#                          "host": "::1", "type": "inet" } },
+#      "timestamp": { "seconds": 1666269863, "microseconds": 311222 } }
+#
+# or
+#
+# <- { "event": "NETDEV_STREAM_CONNECTED",
+#      "data": { "netdev-id": "netdev0",
+#                "addr": { "path": "/tmp/qemu0", "type": "unix" } },
+#      "timestamp": { "seconds": 1666269706, "microseconds": 413651 } }
+#
+##
+{ 'event': 'NETDEV_STREAM_CONNECTED',
+  'data': { 'netdev-id': 'str',
+            'addr': 'SocketAddress' } }
+
+##
+# @NETDEV_STREAM_DISCONNECTED:
+#
+# Emitted when the netdev stream backend is disconnected
+#
+# @netdev-id: QEMU netdev id that is disconnected
+#
+# Since: 7.2
+#
+# Example:
+#
+# <- { 'event': 'NETDEV_STREAM_DISCONNECTED',
+#      'data': {'netdev-id': 'netdev0'},
+#      'timestamp': {'seconds': 1663330937, 'microseconds': 526695} }
+#
+##
+{ 'event': 'NETDEV_STREAM_DISCONNECTED',
+  'data': { 'netdev-id': 'str' } }
-- 
2.37.3


