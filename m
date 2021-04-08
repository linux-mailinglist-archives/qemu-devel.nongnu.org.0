Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E63357FB3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:46:12 +0200 (CEST)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUREp-0003Ov-2C
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lURB9-0001jY-Gl
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lURB7-0006Xj-Ak
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617874940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=Bti/Cf7MLGKtgaFTY0iVNxyqMjqliGAJ5CFhCNXzr8s=;
 b=QH7qxC2Z0PROO1wZsPrzz64jVL+VdDdOqajTGOnFAd+CgjCwyTGsv4jRoeLDtXWRGQRt0L
 SWmAEOpzhdus9cTf9ArxfKWX8E0RMil4F3uNc5gp6pHmcElzkwbHiX6kHOUNlMV6/1bBui
 Tx+913tLiw6HpK/Y9CRfmoyKV44c+Vc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-Jg8pZ92XOQO-RM3JIpkgMA-1; Thu, 08 Apr 2021 05:42:18 -0400
X-MC-Unique: Jg8pZ92XOQO-RM3JIpkgMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAA03800D53;
 Thu,  8 Apr 2021 09:42:17 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-61.pek2.redhat.com
 [10.72.13.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3601010013C1;
 Thu,  8 Apr 2021 09:42:15 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 1/6] Revert "net: Do not fill legacy info_str for backends"
Date: Thu,  8 Apr 2021 17:42:06 +0800
Message-Id: <1617874931-4437-2-git-send-email-jasowang@redhat.com>
In-Reply-To: <1617874931-4437-1-git-send-email-jasowang@redhat.com>
References: <1617874931-4437-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several issues has been reported for query-netdev info
series. Consider it's late in the rc, this reverts commit
f2e8319d456724c3d8514d943dc4607e2f08e88a.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/l2tpv3.c     |  2 ++
 net/slirp.c      |  3 +++
 net/socket.c     | 28 ++++++++++++++++++++++++++++
 net/tap-win32.c  |  2 ++
 net/tap.c        |  9 +++++++++
 net/vde.c        |  2 ++
 net/vhost-user.c |  1 +
 net/vhost-vdpa.c |  1 +
 8 files changed, 48 insertions(+)

diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index b7e1d84..96611cb 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -729,6 +729,8 @@ int net_init_l2tpv3(const Netdev *netdev,
 
     QAPI_CLONE_MEMBERS(NetdevL2TPv3Options,
                        &nc->stored_config->u.l2tpv3, l2tpv3);
+
+    s->nc.info_str = g_strdup_printf("l2tpv3: connected");
     return 0;
 outerr:
     qemu_del_net_client(nc);
diff --git a/net/slirp.c b/net/slirp.c
index a9fdc7a..67f0f1d 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -674,6 +674,9 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         stored->tftp_server_name = g_strdup(tftp_server_name);
     }
 
+    nc->info_str = g_strdup_printf("net=%s,restrict=%s", inet_ntoa(net),
+                                   restricted ? "on" : "off");
+
     s = DO_UPCAST(SlirpState, nc, nc);
 
     s->slirp = slirp_init(restricted, ipv4, net, mask, host,
diff --git a/net/socket.c b/net/socket.c
index c0de10c..9817234 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -180,6 +180,8 @@ static void net_socket_send(void *opaque)
         s->fd = -1;
         net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
         s->nc.link_down = true;
+        g_free(s->nc.info_str);
+        s->nc.info_str = g_new0(char, 1);
 
         return;
     }
@@ -399,10 +401,16 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
         stored->mcast = g_strdup(mcast);
 
         s->dgram_dst = saddr;
+        nc->info_str = g_strdup_printf("socket: fd=%d (cloned mcast=%s:%d)",
+                                       fd, inet_ntoa(saddr.sin_addr),
+                                       ntohs(saddr.sin_port));
     } else {
         if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
             s->dgram_dst.sin_family = AF_UNIX;
         }
+
+        nc->info_str = g_strdup_printf("socket: fd=%d %s",
+                                       fd, SocketAddressType_str(sa_type));
     }
 
     return s;
@@ -437,6 +445,8 @@ static NetSocketState *net_socket_fd_init_stream(NetClientState *peer,
 
     nc = qemu_new_net_client(&net_socket_info, peer, model, name);
 
+    nc->info_str = g_strdup_printf("socket: fd=%d", fd);
+
     s = DO_UPCAST(NetSocketState, nc, nc);
 
     s->fd = fd;
@@ -518,6 +528,11 @@ static void net_socket_accept(void *opaque)
 
     stored->has_fd = true;
     stored->fd = g_strdup_printf("%d", fd);
+
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: connection from %s:%d",
+                                     inet_ntoa(saddr.sin_addr),
+                                     ntohs(saddr.sin_port));
 }
 
 static int net_socket_listen_init(NetClientState *peer,
@@ -632,6 +647,10 @@ static int net_socket_connect_init(NetClientState *peer,
     stored->has_connect = true;
     stored->connect = g_strdup(host_str);
 
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: connect to %s:%d",
+                                     inet_ntoa(saddr.sin_addr),
+                                     ntohs(saddr.sin_port));
     return 0;
 }
 
@@ -688,7 +707,12 @@ static int net_socket_mcast_init(NetClientState *peer,
         stored->localaddr = g_strdup(localaddr_str);
     }
 
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: mcast=%s:%d",
+                                     inet_ntoa(saddr.sin_addr),
+                                     ntohs(saddr.sin_port));
     return 0;
+
 }
 
 static int net_socket_udp_init(NetClientState *peer,
@@ -749,6 +773,10 @@ static int net_socket_udp_init(NetClientState *peer,
     stored->has_udp = true;
     stored->udp = g_strdup(rhost);
 
+    g_free(s->nc.info_str);
+    s->nc.info_str = g_strdup_printf("socket: udp=%s:%d",
+                                     inet_ntoa(raddr.sin_addr),
+                                     ntohs(raddr.sin_port));
     return 0;
 }
 
diff --git a/net/tap-win32.c b/net/tap-win32.c
index d7c2a87..959266c 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -797,6 +797,8 @@ static int tap_win32_init(NetClientState *peer, const char *model,
     stored->has_ifname = true;
     stored->ifname = g_strdup(ifname);
 
+    s->nc.info_str = g_strdup_printf("tap: ifname=%s", ifname);
+
     s->handle = handle;
 
     qemu_add_wait_object(s->handle->tap_semaphore, tap_win32_send, s);
diff --git a/net/tap.c b/net/tap.c
index d6d8456..522ce7e 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -635,6 +635,8 @@ int net_init_bridge(const Netdev *netdev, const char *name,
         stored->helper = g_strdup(helper);
     }
 
+    s->nc.info_str = g_strdup_printf("helper=%s,br=%s", helper, br);
+
     return 0;
 }
 
@@ -720,6 +722,8 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->fds = g_strdup_printf("%s:%d", stored->fds, fd);
             g_free(tmp_s);
         }
+
+        s->nc.info_str = g_strdup_printf("fd=%d", fd);
     } else if (tap->has_helper) {
         if (!stored->has_helper) {
             stored->has_helper = true;
@@ -731,6 +735,8 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->br = tap->has_br ? g_strdup(tap->br) :
                                        g_strdup(DEFAULT_BRIDGE_INTERFACE);
         }
+
+        s->nc.info_str = g_strdup_printf("helper=%s", tap->helper);
     } else {
         if (ifname && !stored->has_ifname) {
             stored->has_ifname = true;
@@ -747,6 +753,9 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
             stored->downscript = g_strdup(downscript);
         }
 
+        s->nc.info_str = g_strdup_printf("ifname=%s,script=%s,downscript=%s",
+                                         ifname, script, downscript);
+
         if (strcmp(downscript, "no") != 0) {
             snprintf(s->down_script, sizeof(s->down_script), "%s", downscript);
             snprintf(s->down_script_arg, sizeof(s->down_script_arg),
diff --git a/net/vde.c b/net/vde.c
index 64bdb93..67de6eb 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -100,6 +100,8 @@ static int net_vde_init(NetClientState *peer, const char *model,
 
     nc = qemu_new_net_client(&net_vde_info, peer, model, name);
 
+    nc->info_str = g_strdup_printf("sock=%s,fd=%d", sock, vde_datafd(vde));
+
     s = DO_UPCAST(VDEState, nc, nc);
 
     s->vde = vde;
diff --git a/net/vhost-user.c b/net/vhost-user.c
index e443c4b..49c9a74 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -327,6 +327,7 @@ static int net_vhost_user_init(NetClientState *peer, const char *device,
     user = g_new0(struct VhostUserState, 1);
     for (i = 0; i < queues; i++) {
         nc = qemu_new_net_client(&net_vhost_user_info, peer, device, name);
+        nc->info_str = g_strdup_printf("vhost-user%d to %s", i, chr->label);
         nc->queue_index = i;
         if (!nc0) {
             nc0 = nc;
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 5a28bbc..423d717 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -200,6 +200,7 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     stored->has_queues = true;
     stored->queues = 1; /* TODO: change when support multiqueue */
 
+    nc->info_str = g_strdup_printf(TYPE_VHOST_VDPA);
     nc->queue_index = 0;
     s = DO_UPCAST(VhostVDPAState, nc, nc);
     vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
-- 
2.7.4


