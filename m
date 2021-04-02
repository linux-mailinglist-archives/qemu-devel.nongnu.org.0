Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673E9352752
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 10:17:36 +0200 (CEST)
Received: from localhost ([::1]:47064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSEzn-0004v5-CA
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 04:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSEy5-00038E-45
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:15:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSExx-0003zF-9C
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617351340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VwwdRstHVt12dpgahqjrNipwISrcjtJJqpwKq7pNvaA=;
 b=ERahE2ARvAmUTOiHnkTmJ7Lm7lXMDaf5S/ZTD6hhOYIaYzuhsKLes61JmHxC8k7M22Y3Eh
 M2LLk9kQtv8KZUJHyIA2GPfZY/ZF96NAu6j7cTJ8glh3hzas18drfG3UaoHdsMLZ5KmPN6
 wP3ohuiY3oaKUZ3hvwp4Y85WR3i5eSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-d6KSCHEjN1SdyqsBaAH9LQ-1; Fri, 02 Apr 2021 04:15:38 -0400
X-MC-Unique: d6KSCHEjN1SdyqsBaAH9LQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DAF26B9C1;
 Fri,  2 Apr 2021 08:15:37 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-26.pek2.redhat.com [10.72.12.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D19762461;
 Fri,  2 Apr 2021 08:15:35 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	lekiravi@yandex-team.ru
Subject: [PATCH 5/5] Revert "qapi: net: Add query-netdev command"
Date: Fri,  2 Apr 2021 16:15:19 +0800
Message-Id: <20210402081519.78878-6-jasowang@redhat.com>
In-Reply-To: <20210402081519.78878-1-jasowang@redhat.com>
References: <20210402081519.78878-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

Several issues has been reported for query-netdev series. Consider
it's late in the rc, this reverts commitThis reverts commit
d32ad10a14d46dfe9304e3ed5858a11dcd5c71a0.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/net.h |   3 --
 net/l2tpv3.c      |   7 ---
 net/net.c         |  30 +-----------
 net/netmap.c      |   7 ---
 net/slirp.c       | 122 ----------------------------------------------
 net/socket.c      |  71 ---------------------------
 net/tap-win32.c   |   9 ----
 net/tap.c         | 103 ++------------------------------------
 net/vde.c         |  22 ---------
 net/vhost-user.c  |  18 ++-----
 net/vhost-vdpa.c  |  14 ------
 qapi/net.json     |  80 ------------------------------
 12 files changed, 9 insertions(+), 477 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index e5ba61cf8d..eff24519d2 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -5,8 +5,6 @@
 #include "qapi/qapi-types-net.h"
 #include "net/queue.h"
 #include "hw/qdev-properties-system.h"
-#include "qapi/clone-visitor.h"
-#include "qapi/qapi-visit-net.h"
 
 #define MAC_FMT "%02X:%02X:%02X:%02X:%02X:%02X"
 #define MAC_ARG(x) ((uint8_t *)(x))[0], ((uint8_t *)(x))[1], \
@@ -95,7 +93,6 @@ struct NetClientState {
     char *model;
     char *name;
     char info_str[256];
-    NetdevInfo *stored_config;
     unsigned receive_disabled : 1;
     NetClientDestructor *destructor;
     unsigned int queue_index;
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 8aa0a3e1a0..e4d4218db6 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -723,13 +723,6 @@ int net_init_l2tpv3(const Netdev *netdev,
 
     l2tpv3_read_poll(s, true);
 
-    /* Store startup parameters */
-    nc->stored_config = g_new0(NetdevInfo, 1);
-    nc->stored_config->type = NET_BACKEND_L2TPV3;
-
-    QAPI_CLONE_MEMBERS(NetdevL2TPv3Options,
-                       &nc->stored_config->u.l2tpv3, l2tpv3);
-
     snprintf(s->nc.info_str, sizeof(s->nc.info_str),
              "l2tpv3: connected");
     return 0;
diff --git a/net/net.c b/net/net.c
index 9a2a6ab155..edf9b95418 100644
--- a/net/net.c
+++ b/net/net.c
@@ -36,6 +36,7 @@
 #include "monitor/monitor.h"
 #include "qemu/help_option.h"
 #include "qapi/qapi-commands-net.h"
+#include "qapi/qapi-visit-net.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
@@ -352,7 +353,6 @@ static void qemu_free_net_client(NetClientState *nc)
     }
     g_free(nc->name);
     g_free(nc->model);
-    qapi_free_NetdevInfo(nc->stored_config);
     if (nc->destructor) {
         nc->destructor(nc);
     }
@@ -1289,34 +1289,6 @@ RxFilterInfoList *qmp_query_rx_filter(bool has_name, const char *name,
     return filter_list;
 }
 
-NetdevInfoList *qmp_query_netdev(Error **errp)
-{
-    NetdevInfoList *list = NULL;
-    NetClientState *nc;
-
-    QTAILQ_FOREACH(nc, &net_clients, next) {
-        /*
-         * Only look at netdevs (backend network devices), not for each queue
-         * or NIC / hubport
-         */
-        if (nc->stored_config) {
-            NetdevInfo *element = QAPI_CLONE(NetdevInfo, nc->stored_config);
-
-            g_free(element->id); /* Need to dealloc empty id after clone */
-            element->id = g_strdup(nc->name);
-
-            element->has_peer_id = nc->peer != NULL;
-            if (element->has_peer_id) {
-                element->peer_id = g_strdup(nc->peer->name);
-            }
-
-            QAPI_LIST_PREPEND(list, element);
-        }
-    }
-
-    return list;
-}
-
 void hmp_info_network(Monitor *mon, const QDict *qdict)
 {
     NetClientState *nc, *peer;
diff --git a/net/netmap.c b/net/netmap.c
index ad59d4ade4..350f097f91 100644
--- a/net/netmap.c
+++ b/net/netmap.c
@@ -427,13 +427,6 @@ int net_init_netmap(const Netdev *netdev,
     pstrcpy(s->ifname, sizeof(s->ifname), netmap_opts->ifname);
     netmap_read_poll(s, true); /* Initially only poll for reads. */
 
-    /* Store startup parameters */
-    nc->stored_config = g_new0(NetdevInfo, 1);
-    nc->stored_config->type = NET_BACKEND_NETMAP;
-
-    QAPI_CLONE_MEMBERS(NetdevNetmapOptions,
-                       &nc->stored_config->u.netmap, netmap_opts);
-
     return 0;
 }
 
diff --git a/net/slirp.c b/net/slirp.c
index b3b979845e..a01a0fccd3 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -387,9 +387,6 @@ static int net_slirp_init(NetClientState *peer, const char *model,
     int shift;
     char *end;
     struct slirp_config_str *config;
-    NetdevUserOptions *stored;
-    StringList **stored_hostfwd;
-    StringList **stored_guestfwd;
 
     if (!ipv4 && (vnetwork || vhost || vnameserver)) {
         error_setg(errp, "IPv4 disabled but netmask/host/dns provided");
@@ -565,115 +562,6 @@ static int net_slirp_init(NetClientState *peer, const char *model,
 
     nc = qemu_new_net_client(&net_slirp_info, peer, model, name);
 
-    /* Store startup parameters */
-    nc->stored_config = g_new0(NetdevInfo, 1);
-    nc->stored_config->type = NET_BACKEND_USER;
-    stored = &nc->stored_config->u.user;
-
-    if (vhostname) {
-        stored->has_hostname = true;
-        stored->hostname = g_strdup(vhostname);
-    }
-
-    stored->has_q_restrict = true;
-    stored->q_restrict = restricted;
-
-    stored->has_ipv4 = true;
-    stored->ipv4 = ipv4;
-
-    stored->has_ipv6 = true;
-    stored->ipv6 = ipv6;
-
-    if (ipv4) {
-        uint8_t *net_bytes = (uint8_t *)&net;
-        uint8_t *mask_bytes = (uint8_t *)&mask;
-
-        stored->has_net = true;
-        stored->net = g_strdup_printf("%d.%d.%d.%d/%d.%d.%d.%d",
-                                      net_bytes[0], net_bytes[1],
-                                      net_bytes[2], net_bytes[3],
-                                      mask_bytes[0], mask_bytes[1],
-                                      mask_bytes[2], mask_bytes[3]);
-
-        stored->has_host = true;
-        stored->host = g_strdup(inet_ntoa(host));
-    }
-
-    if (tftp_export) {
-        stored->has_tftp = true;
-        stored->tftp = g_strdup(tftp_export);
-    }
-
-    if (bootfile) {
-        stored->has_bootfile = true;
-        stored->bootfile = g_strdup(bootfile);
-    }
-
-    if (vdhcp_start) {
-        stored->has_dhcpstart = true;
-        stored->dhcpstart = g_strdup(vdhcp_start);
-    }
-
-    if (ipv4) {
-        stored->has_dns = true;
-        stored->dns = g_strdup(inet_ntoa(dns));
-    }
-
-    if (dnssearch) {
-        stored->has_dnssearch = true;
-        StringList **stored_list = &stored->dnssearch;
-
-        for (int i = 0; dnssearch[i]; i++) {
-            String *element = g_new0(String, 1);
-
-            element->str = g_strdup(dnssearch[i]);
-            QAPI_LIST_APPEND(stored_list, element);
-        }
-    }
-
-    if (vdomainname) {
-        stored->has_domainname = true;
-        stored->domainname = g_strdup(vdomainname);
-    }
-
-    if (ipv6) {
-        char addrstr[INET6_ADDRSTRLEN];
-        const char *res;
-
-        stored->has_ipv6_prefix = true;
-        stored->ipv6_prefix = g_strdup(vprefix6);
-
-        stored->has_ipv6_prefixlen = true;
-        stored->ipv6_prefixlen = vprefix6_len;
-
-        res = inet_ntop(AF_INET6, &ip6_host,
-                        addrstr, sizeof(addrstr));
-
-        stored->has_ipv6_host = true;
-        stored->ipv6_host = g_strdup(res);
-
-        res = inet_ntop(AF_INET6, &ip6_dns,
-                        addrstr, sizeof(addrstr));
-
-        stored->has_ipv6_dns = true;
-        stored->ipv6_dns = g_strdup(res);
-    }
-
-    if (smb_export) {
-        stored->has_smb = true;
-        stored->smb = g_strdup(smb_export);
-    }
-
-    if (vsmbserver) {
-        stored->has_smbserver = true;
-        stored->smbserver = g_strdup(vsmbserver);
-    }
-
-    if (tftp_server_name) {
-        stored->has_tftp_server_name = true;
-        stored->tftp_server_name = g_strdup(tftp_server_name);
-    }
-
     snprintf(nc->info_str, sizeof(nc->info_str),
              "net=%s,restrict=%s", inet_ntoa(net),
              restricted ? "on" : "off");
@@ -703,25 +591,15 @@ static int net_slirp_init(NetClientState *peer, const char *model,
     s->poll_notifier.notify = net_slirp_poll_notify;
     main_loop_poll_add_notifier(&s->poll_notifier);
 
-    stored_hostfwd = &stored->hostfwd;
-    stored_guestfwd = &stored->guestfwd;
-
     for (config = slirp_configs; config; config = config->next) {
-        String *element = g_new0(String, 1);
-
-        element->str = g_strdup(config->str);
         if (config->flags & SLIRP_CFG_HOSTFWD) {
             if (slirp_hostfwd(s, config->str, errp) < 0) {
                 goto error;
             }
-            stored->has_hostfwd = true;
-            QAPI_LIST_APPEND(stored_hostfwd, element);
         } else {
             if (slirp_guestfwd(s, config->str, errp) < 0) {
                 goto error;
             }
-            stored->has_guestfwd = true;
-            QAPI_LIST_APPEND(stored_guestfwd, element);
         }
     }
 #ifndef _WIN32
diff --git a/net/socket.c b/net/socket.c
index 1614523b82..15b410e8d8 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -342,7 +342,6 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
     NetSocketState *s;
     SocketAddress *sa;
     SocketAddressType sa_type;
-    NetdevSocketOptions *stored;
 
     sa = socket_local_address(fd, errp);
     if (!sa) {
@@ -386,19 +385,8 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
     net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
     net_socket_read_poll(s, true);
 
-    /* Store startup parameters */
-    nc->stored_config = g_new0(NetdevInfo, 1);
-    nc->stored_config->type = NET_BACKEND_SOCKET;
-    stored = &nc->stored_config->u.socket;
-
-    stored->has_fd = true;
-    stored->fd = g_strdup_printf("%d", fd);
-
     /* mcast: save bound address as dst */
     if (is_connected && mcast != NULL) {
-        stored->has_mcast = true;
-        stored->mcast = g_strdup(mcast);
-
         s->dgram_dst = saddr;
         snprintf(nc->info_str, sizeof(nc->info_str),
                  "socket: fd=%d (cloned mcast=%s:%d)",
@@ -440,7 +428,6 @@ static NetSocketState *net_socket_fd_init_stream(NetClientState *peer,
 {
     NetClientState *nc;
     NetSocketState *s;
-    NetdevSocketOptions *stored;
 
     nc = qemu_new_net_client(&net_socket_info, peer, model, name);
 
@@ -460,15 +447,6 @@ static NetSocketState *net_socket_fd_init_stream(NetClientState *peer,
     } else {
         qemu_set_fd_handler(s->fd, NULL, net_socket_connect, s);
     }
-
-    /* Store startup parameters */
-    nc->stored_config = g_new0(NetdevInfo, 1);
-    nc->stored_config->type = NET_BACKEND_SOCKET;
-    stored = &nc->stored_config->u.socket;
-
-    stored->has_fd = true;
-    stored->fd = g_strdup_printf("%d", fd);
-
     return s;
 }
 
@@ -505,7 +483,6 @@ static void net_socket_accept(void *opaque)
     struct sockaddr_in saddr;
     socklen_t len;
     int fd;
-    NetdevSocketOptions *stored;
 
     for(;;) {
         len = sizeof(saddr);
@@ -521,13 +498,6 @@ static void net_socket_accept(void *opaque)
     s->fd = fd;
     s->nc.link_down = false;
     net_socket_connect(s);
-
-    /* Store additional startup parameters (extend net_socket_listen_init) */
-    stored = &s->nc.stored_config->u.socket;
-
-    stored->has_fd = true;
-    stored->fd = g_strdup_printf("%d", fd);
-
     snprintf(s->nc.info_str, sizeof(s->nc.info_str),
              "socket: connection from %s:%d",
              inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
@@ -543,7 +513,6 @@ static int net_socket_listen_init(NetClientState *peer,
     NetSocketState *s;
     struct sockaddr_in saddr;
     int fd, ret;
-    NetdevSocketOptions *stored;
 
     if (parse_host_port(&saddr, host_str, errp) < 0) {
         return -1;
@@ -580,15 +549,6 @@ static int net_socket_listen_init(NetClientState *peer,
     net_socket_rs_init(&s->rs, net_socket_rs_finalize, false);
 
     qemu_set_fd_handler(s->listen_fd, net_socket_accept, NULL, s);
-
-    /* Store startup parameters */
-    nc->stored_config = g_new0(NetdevInfo, 1);
-    nc->stored_config->type = NET_BACKEND_SOCKET;
-    stored = &nc->stored_config->u.socket;
-
-    stored->has_listen = true;
-    stored->listen = g_strdup(host_str);
-
     return 0;
 }
 
@@ -601,7 +561,6 @@ static int net_socket_connect_init(NetClientState *peer,
     NetSocketState *s;
     int fd, connected, ret;
     struct sockaddr_in saddr;
-    NetdevSocketOptions *stored;
 
     if (parse_host_port(&saddr, host_str, errp) < 0) {
         return -1;
@@ -639,12 +598,6 @@ static int net_socket_connect_init(NetClientState *peer,
         return -1;
     }
 
-    /* Store additional startup parameters (extend net_socket_fd_init) */
-    stored = &s->nc.stored_config->u.socket;
-
-    stored->has_connect = true;
-    stored->connect = g_strdup(host_str);
-
     snprintf(s->nc.info_str, sizeof(s->nc.info_str),
              "socket: connect to %s:%d",
              inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
@@ -662,7 +615,6 @@ static int net_socket_mcast_init(NetClientState *peer,
     int fd;
     struct sockaddr_in saddr;
     struct in_addr localaddr, *param_localaddr;
-    NetdevSocketOptions *stored;
 
     if (parse_host_port(&saddr, host_str, errp) < 0) {
         return -1;
@@ -691,19 +643,6 @@ static int net_socket_mcast_init(NetClientState *peer,
 
     s->dgram_dst = saddr;
 
-    /* Store additional startup parameters (extend net_socket_fd_init) */
-    stored = &s->nc.stored_config->u.socket;
-
-    if (!stored->has_mcast) {
-        stored->has_mcast = true;
-        stored->mcast = g_strdup(host_str);
-    }
-
-    if (localaddr_str) {
-        stored->has_localaddr = true;
-        stored->localaddr = g_strdup(localaddr_str);
-    }
-
     snprintf(s->nc.info_str, sizeof(s->nc.info_str),
              "socket: mcast=%s:%d",
              inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
@@ -721,7 +660,6 @@ static int net_socket_udp_init(NetClientState *peer,
     NetSocketState *s;
     int fd, ret;
     struct sockaddr_in laddr, raddr;
-    NetdevSocketOptions *stored;
 
     if (parse_host_port(&laddr, lhost, errp) < 0) {
         return -1;
@@ -760,15 +698,6 @@ static int net_socket_udp_init(NetClientState *peer,
 
     s->dgram_dst = raddr;
 
-    /* Store additional startup parameters (extend net_socket_fd_init) */
-    stored = &s->nc.stored_config->u.socket;
-
-    stored->has_localaddr = true;
-    stored->localaddr = g_strdup(lhost);
-
-    stored->has_udp = true;
-    stored->udp = g_strdup(rhost);
-
     snprintf(s->nc.info_str, sizeof(s->nc.info_str),
              "socket: udp=%s:%d",
              inet_ntoa(raddr.sin_addr), ntohs(raddr.sin_port));
diff --git a/net/tap-win32.c b/net/tap-win32.c
index 2a2ba4f527..fb92b55768 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -778,7 +778,6 @@ static int tap_win32_init(NetClientState *peer, const char *model,
     NetClientState *nc;
     TAPState *s;
     tap_win32_overlapped_t *handle;
-    NetdevTapOptions *stored;
 
     if (tap_win32_open(&handle, ifname) < 0) {
         printf("tap: Could not open '%s'\n", ifname);
@@ -789,14 +788,6 @@ static int tap_win32_init(NetClientState *peer, const char *model,
 
     s = DO_UPCAST(TAPState, nc, nc);
 
-    /* Store startup parameters */
-    nc->stored_config = g_new0(NetdevInfo, 1);
-    nc->stored_config->type = NET_BACKEND_TAP;
-    stored = &nc->stored_config->u.tap;
-
-    stored->has_ifname = true;
-    stored->ifname = g_strdup(ifname);
-
     snprintf(s->nc.info_str, sizeof(s->nc.info_str),
              "tap: ifname=%s", ifname);
 
diff --git a/net/tap.c b/net/tap.c
index 35895192c5..dd42ac6134 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -600,7 +600,6 @@ int net_init_bridge(const Netdev *netdev, const char *name,
     const char *helper, *br;
     TAPState *s;
     int fd, vnet_hdr;
-    NetdevBridgeOptions *stored;
 
     assert(netdev->type == NET_CLIENT_DRIVER_BRIDGE);
     bridge = &netdev->u.bridge;
@@ -620,21 +619,6 @@ int net_init_bridge(const Netdev *netdev, const char *name,
     }
     s = net_tap_fd_init(peer, "bridge", name, fd, vnet_hdr);
 
-    /* Store startup parameters */
-    s->nc.stored_config = g_new0(NetdevInfo, 1);
-    s->nc.stored_config->type = NET_BACKEND_BRIDGE;
-    stored = &s->nc.stored_config->u.bridge;
-
-    if (br) {
-        stored->has_br = true;
-        stored->br = g_strdup(br);
-    }
-
-    if (helper) {
-        stored->has_helper = true;
-        stored->helper = g_strdup(helper);
-    }
-
     snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s,br=%s", helper,
              br);
 
@@ -682,13 +666,11 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
                              const char *model, const char *name,
                              const char *ifname, const char *script,
                              const char *downscript, const char *vhostfdname,
-                             int vnet_hdr, int fd, NetdevInfo **common_stored,
-                             Error **errp)
+                             int vnet_hdr, int fd, Error **errp)
 {
     Error *err = NULL;
     TAPState *s = net_tap_fd_init(peer, model, name, fd, vnet_hdr);
     int vhostfd;
-    NetdevTapOptions *stored;
 
     tap_set_sndbuf(s->fd, tap, &err);
     if (err) {
@@ -696,65 +678,12 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
         return;
     }
 
-    /* Store startup parameters */
-    if (!*common_stored) {
-        *common_stored = g_new0(NetdevInfo, 1);
-        (*common_stored)->type = NET_BACKEND_TAP;
-        s->nc.stored_config = *common_stored;
-    }
-    stored = &(*common_stored)->u.tap;
-
-    if (tap->has_sndbuf && !stored->has_sndbuf) {
-        stored->has_sndbuf = true;
-        stored->sndbuf = tap->sndbuf;
-    }
-
-    if (vnet_hdr && !stored->has_vnet_hdr) {
-        stored->has_vnet_hdr = true;
-        stored->vnet_hdr = true;
-    }
-
     if (tap->has_fd || tap->has_fds) {
-        if (!stored->has_fds) {
-            stored->has_fds = true;
-            stored->fds = g_strdup_printf("%d", fd);
-        } else {
-            char *tmp_s = stored->fds;
-            stored->fds = g_strdup_printf("%s:%d", stored->fds, fd);
-            g_free(tmp_s);
-        }
-
         snprintf(s->nc.info_str, sizeof(s->nc.info_str), "fd=%d", fd);
     } else if (tap->has_helper) {
-        if (!stored->has_helper) {
-            stored->has_helper = true;
-            stored->helper = g_strdup(tap->helper);
-        }
-
-        if (!stored->has_br) {
-            stored->has_br = true;
-            stored->br = tap->has_br ? g_strdup(tap->br) :
-                                       g_strdup(DEFAULT_BRIDGE_INTERFACE);
-        }
-
         snprintf(s->nc.info_str, sizeof(s->nc.info_str), "helper=%s",
                  tap->helper);
     } else {
-        if (ifname && !stored->has_ifname) {
-            stored->has_ifname = true;
-            stored->ifname = g_strdup(ifname);
-        }
-
-        if (script && !stored->has_script) {
-            stored->has_script = true;
-            stored->script = g_strdup(script);
-        }
-
-        if (downscript && !stored->has_downscript) {
-            stored->has_downscript = true;
-            stored->downscript = g_strdup(downscript);
-        }
-
         snprintf(s->nc.info_str, sizeof(s->nc.info_str),
                  "ifname=%s,script=%s,downscript=%s", ifname, script,
                  downscript);
@@ -770,20 +699,9 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
         vhostfdname || (tap->has_vhostforce && tap->vhostforce)) {
         VhostNetOptions options;
 
-        stored->has_vhost = true;
-        stored->vhost = true;
-
-        if (tap->has_vhostforce && tap->vhostforce) {
-            stored->has_vhostforce = true;
-            stored->vhostforce = true;
-        }
-
         options.backend_type = VHOST_BACKEND_TYPE_KERNEL;
         options.net_backend = &s->nc;
         if (tap->has_poll_us) {
-            stored->has_poll_us = true;
-            stored->poll_us = tap->poll_us;
-
             options.busyloop_timeout = tap->poll_us;
         } else {
             options.busyloop_timeout = 0;
@@ -823,15 +741,6 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
         }
         options.opaque = (void *)(uintptr_t)vhostfd;
 
-        if (!stored->has_vhostfds) {
-            stored->has_vhostfds = true;
-            stored->vhostfds = g_strdup_printf("%d", vhostfd);
-        } else {
-            char *tmp_s = stored->vhostfds;
-            stored->vhostfds = g_strdup_printf("%s:%d", stored->fds, vhostfd);
-            g_free(tmp_s);
-        }
-
         s->vhost_net = vhost_net_init(&options);
         if (!s->vhost_net) {
             if (tap->has_vhostforce && tap->vhostforce) {
@@ -884,7 +793,6 @@ int net_init_tap(const Netdev *netdev, const char *name,
     const char *vhostfdname;
     char ifname[128];
     int ret = 0;
-    NetdevInfo *common_stored = NULL; /* will store configuration */
 
     assert(netdev->type == NET_CLIENT_DRIVER_TAP);
     tap = &netdev->u.tap;
@@ -931,7 +839,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
 
         net_init_tap_one(tap, peer, "tap", name, NULL,
                          script, downscript,
-                         vhostfdname, vnet_hdr, fd, &common_stored, &err);
+                         vhostfdname, vnet_hdr, fd, &err);
         if (err) {
             error_propagate(errp, err);
             close(fd);
@@ -994,7 +902,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
             net_init_tap_one(tap, peer, "tap", name, ifname,
                              script, downscript,
                              tap->has_vhostfds ? vhost_fds[i] : NULL,
-                             vnet_hdr, fd, &common_stored, &err);
+                             vnet_hdr, fd, &err);
             if (err) {
                 error_propagate(errp, err);
                 ret = -1;
@@ -1037,7 +945,7 @@ free_fail:
 
         net_init_tap_one(tap, peer, "bridge", name, ifname,
                          script, downscript, vhostfdname,
-                         vnet_hdr, fd, &common_stored, &err);
+                         vnet_hdr, fd, &err);
         if (err) {
             error_propagate(errp, err);
             close(fd);
@@ -1083,8 +991,7 @@ free_fail:
             net_init_tap_one(tap, peer, "tap", name, ifname,
                              i >= 1 ? "no" : script,
                              i >= 1 ? "no" : downscript,
-                             vhostfdname, vnet_hdr, fd,
-                             &common_stored, &err);
+                             vhostfdname, vnet_hdr, fd, &err);
             if (err) {
                 error_propagate(errp, err);
                 close(fd);
diff --git a/net/vde.c b/net/vde.c
index b0b8800571..99189cccb6 100644
--- a/net/vde.c
+++ b/net/vde.c
@@ -84,7 +84,6 @@ static int net_vde_init(NetClientState *peer, const char *model,
     VDECONN *vde;
     char *init_group = (char *)group;
     char *init_sock = (char *)sock;
-    NetdevVdeOptions *stored;
 
     struct vde_open_args args = {
         .port = port,
@@ -109,27 +108,6 @@ static int net_vde_init(NetClientState *peer, const char *model,
 
     qemu_set_fd_handler(vde_datafd(s->vde), vde_to_qemu, NULL, s);
 
-    /* Store startup parameters */
-    nc->stored_config = g_new0(NetdevInfo, 1);
-    nc->stored_config->type = NET_BACKEND_VDE;
-    stored = &nc->stored_config->u.vde;
-
-    if (sock) {
-        stored->has_sock = true;
-        stored->sock = g_strdup(sock);
-    }
-
-    stored->has_port = true;
-    stored->port = port;
-
-    if (group) {
-        stored->has_group = true;
-        stored->group = g_strdup(group);
-    }
-
-    stored->has_mode = true;
-    stored->mode = mode;
-
     return 0;
 }
 
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 5b7056be25..ffbd94d944 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -311,15 +311,14 @@ static void net_vhost_user_event(void *opaque, QEMUChrEvent event)
 }
 
 static int net_vhost_user_init(NetClientState *peer, const char *device,
-                               const char *name, const char *chardev,
-                               Chardev *chr, int queues)
+                               const char *name, Chardev *chr,
+                               int queues)
 {
     Error *err = NULL;
     NetClientState *nc, *nc0 = NULL;
     NetVhostUserState *s = NULL;
     VhostUserState *user;
     int i;
-    NetdevVhostUserOptions *stored;
 
     assert(name);
     assert(queues > 0);
@@ -356,16 +355,6 @@ static int net_vhost_user_init(NetClientState *peer, const char *device,
 
     assert(s->vhost_net);
 
-    /* Store startup parameters */
-    nc0->stored_config = g_new0(NetdevInfo, 1);
-    nc0->stored_config->type = NET_BACKEND_VHOST_USER;
-    stored = &nc0->stored_config->u.vhost_user;
-
-    stored->chardev = g_strdup(chardev);
-
-    stored->has_queues = true;
-    stored->queues = queues;
-
     return 0;
 
 err:
@@ -457,6 +446,5 @@ int net_init_vhost_user(const Netdev *netdev, const char *name,
         return -1;
     }
 
-    return net_vhost_user_init(peer, "vhost_user", name,
-                               vhost_user_opts->chardev, chr, queues);
+    return net_vhost_user_init(peer, "vhost_user", name, chr, queues);
 }
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 8c27ea0142..fe659ec9e2 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -184,22 +184,8 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     VhostVDPAState *s;
     int vdpa_device_fd = -1;
     int ret = 0;
-    NetdevVhostVDPAOptions *stored;
-
     assert(name);
     nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
-
-    /* Store startup parameters */
-    nc->stored_config = g_new0(NetdevInfo, 1);
-    nc->stored_config->type = NET_BACKEND_VHOST_VDPA;
-    stored = &nc->stored_config->u.vhost_vdpa;
-
-    stored->has_vhostdev = true;
-    stored->vhostdev = g_strdup(vhostdev);
-
-    stored->has_queues = true;
-    stored->queues = 1; /* TODO: change when support multiqueue */
-
     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
     nc->queue_index = 0;
     s = DO_UPCAST(VhostVDPAState, nc, nc);
diff --git a/qapi/net.json b/qapi/net.json
index b86d053ad6..af3f5b0fda 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -694,83 +694,3 @@
 ##
 { 'event': 'FAILOVER_NEGOTIATED',
   'data': {'device-id': 'str'} }
-
-##
-# @NetBackend:
-#
-# Available netdev backend drivers.
-#
-# Since: 6.0
-##
-{ 'enum': 'NetBackend',
-  'data': [ 'bridge', 'l2tpv3', 'netmap', 'socket', 'tap', 'user', 'vde',
-            'vhost-user', 'vhost-vdpa' ] }
-
-##
-# @NetdevInfo:
-#
-# Configuration of a network backend device (netdev).
-#
-# @id: Device identifier.
-#
-# @type: Specify the driver used for interpreting remaining arguments.
-#
-# @peer-id: The connected frontend network device name (absent if no frontend
-#           is connected).
-#
-# Since: 6.0
-##
-{ 'union': 'NetdevInfo',
-  'base': { 'id': 'str',
-            'type': 'NetBackend',
-            '*peer-id': 'str' },
-  'discriminator': 'type',
-  'data': {
-      'bridge':     'NetdevBridgeOptions',
-      'l2tpv3':     'NetdevL2TPv3Options',
-      'netmap':     'NetdevNetmapOptions',
-      'socket':     'NetdevSocketOptions',
-      'tap':        'NetdevTapOptions',
-      'user':       'NetdevUserOptions',
-      'vde':        'NetdevVdeOptions',
-      'vhost-user': 'NetdevVhostUserOptions',
-      'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
-
-##
-# @query-netdev:
-#
-# Get a list of @NetdevInfo for all virtual network backend devices (netdevs).
-#
-# Returns: a list of @NetdevInfo describing each netdev.
-#
-# Since: 6.0
-#
-# Example:
-#
-# -> { "execute": "query-netdev" }
-# <- { "return": [
-#          {
-#              "ipv6": true,
-#              "ipv4": true,
-#              "host": "10.0.2.2",
-#              "ipv6-dns": "fec0::3",
-#              "ipv6-prefix": "fec0::",
-#              "net": "10.0.2.0/255.255.255.0",
-#              "ipv6-host": "fec0::2",
-#              "type": "user",
-#              "peer-id": "net0",
-#              "dns": "10.0.2.3",
-#              "hostfwd": [
-#                  {
-#                      "str": "tcp::20004-:22"
-#                  }
-#              ],
-#              "ipv6-prefixlen": 64,
-#              "id": "netdev0",
-#              "restrict": false
-#          }
-#      ]
-#    }
-#
-##
-{ 'command': 'query-netdev', 'returns': ['NetdevInfo'] }
-- 
2.24.3 (Apple Git-128)


