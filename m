Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B222FE4DE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 09:25:32 +0100 (CET)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2VHX-0002Er-PT
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 03:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-zkJYAMKCpo7D8AIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--dje.bounces.google.com>)
 id 1l2VFX-0000ja-EO
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 03:23:27 -0500
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:48192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-zkJYAMKCpo7D8AIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--dje.bounces.google.com>)
 id 1l2VFV-0007Gc-5D
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 03:23:27 -0500
Received: by mail-qk1-x74a.google.com with SMTP id c83so1039683qkg.15
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 00:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=4oTjfXGf7ZzsublRMYhk3TahL2gpNHuKT7suWB5XPjg=;
 b=KxiqdKFeywNpmLLNwpyRlCNgyZqeTEeCTWQh7PLR5zYGDR67jTJqTFlketgqJcQ8O5
 nnBtCNRLpozOkw8qdIQA4cxAZW7AtgmR6wI6IACU7jvQhFwifBfi0/6RuFtphfzGgVa8
 EbOSCiTZcnl/CBhBkHtDfmIqHIATvMGxEF9Pw0CT20zkymNglIGWfl0Z2BFaPqlNMV5Y
 +bbtiYMHExXthW55JaG6TYhzoRsZI1Pag/UQyM9u4+0yWE6KZTamAYZhbDoF8MUcMMYu
 A3T4hpM1DMnYRJiUnjKlZo7mK49XrhVvI/iBuMzjyoWRTQ7aqB5tc++S2beOQUFw10ah
 hkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4oTjfXGf7ZzsublRMYhk3TahL2gpNHuKT7suWB5XPjg=;
 b=X7grjbq4BrbNGEqm5SRCA5wq1JuoETJZlmNFMaZa0nfCYVQgL1mkE+ydu0keyZ/V3c
 qOccnZq3elm38HWpJSt7elQU5LvY2D1WlfBzOlZcUap/37ugOEuQbnwh4FlR+AmZRPyg
 vMZSTyFDfY6zK1GGfaG4CyHU/kbpQKJti4hsXrlaEN/GurfVnIyFBZ3PaZbcdJvId/W/
 PdZAOCPN0fos62IFRnBll9nwGvmwhc8QgCAaN+0p7VeFKC32WYYawoQ40hZlaN4bLx4b
 2/PVwXdYRFkkHVQcoA9FsHFL/CsfGBa+dEmKWOoukw3jcqFTD0ky8ubZ/Idp8bz8B9nB
 Zezg==
X-Gm-Message-State: AOAM530JnTvyaAqvs9dMeXVmePzzY4JYxrIbDOwZClIOXYz43zGx6pqG
 FtiVdu4iqFQCCMPLLY4FJIA7yKAlHKof6MRv9FlRGJs0ZnOJlfXOrjl2H2Wblm+r53iYDYrObKU
 SgsW0VR4ry45IhvO43EzqYuM1mCJZH97Jdsym++3XS5arcpbOckKa
X-Google-Smtp-Source: ABdhPJygzMuDYL+hoQeVz6VBrZyu32TlySLpmS6w4n84K2q/ZpX5PPafVNU47lmhf8tUeAU3cUik0xY=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4a0f:cfff:fe66:e570])
 (user=dje job=sendgmr) by 2002:a0c:f005:: with SMTP id
 z5mr13276644qvk.9.1611217403255; 
 Thu, 21 Jan 2021 00:23:23 -0800 (PST)
Date: Thu, 21 Jan 2021 00:23:13 -0800
In-Reply-To: <20210121082314.458600-1-dje@google.com>
Message-Id: <20210121082314.458600-2-dje@google.com>
Mime-Version: 1.0
References: <20210121082314.458600-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
Subject: [PATCH 1/2] slirp: Add ipv6 hostfwd support
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3-zkJYAMKCpo7D8AIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--dje.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From: dje--- via <qemu-devel@nongnu.org>

Signed-off-by: Doug Evans <dje@google.com>
---
 src/libslirp.h |   6 +++
 src/slirp.c    |  51 +++++++++++++++++++++--
 src/socket.c   | 109 +++++++++++++++++++++++++++++++++++--------------
 src/socket.h   |   9 ++++
 src/udp.c      |  73 ++++++++++++++++++++++++++-------
 src/udp.h      |   2 +
 6 files changed, 202 insertions(+), 48 deletions(-)

diff --git a/src/libslirp.h b/src/libslirp.h
index 27e1f61..280d3d0 100644
--- a/src/libslirp.h
+++ b/src/libslirp.h
@@ -142,6 +142,12 @@ int slirp_add_hostfwd(Slirp *slirp, int is_udp, struct in_addr host_addr,
                       int host_port, struct in_addr guest_addr, int guest_port);
 int slirp_remove_hostfwd(Slirp *slirp, int is_udp, struct in_addr host_addr,
                          int host_port);
+int slirp_add_ipv6_hostfwd(Slirp *slirp, int is_udp,
+                           struct in6_addr host_addr, int host_port,
+                           struct in6_addr guest_addr, int guest_port);
+int slirp_remove_ipv6_hostfwd(Slirp *slirp, int is_udp,
+                              struct in6_addr host_addr, int host_port);
+
 int slirp_add_exec(Slirp *slirp, const char *cmdline,
                    struct in_addr *guest_addr, int guest_port);
 int slirp_add_unix(Slirp *slirp, const char *unixsock,
diff --git a/src/slirp.c b/src/slirp.c
index abb6f9a..a07ef83 100644
--- a/src/slirp.c
+++ b/src/slirp.c
@@ -1091,7 +1091,6 @@ int if_encap(Slirp *slirp, struct mbuf *ifm)
 }
 
 /* Drop host forwarding rule, return 0 if found. */
-/* TODO: IPv6 */
 int slirp_remove_hostfwd(Slirp *slirp, int is_udp, struct in_addr host_addr,
                          int host_port)
 {
@@ -1105,7 +1104,10 @@ int slirp_remove_hostfwd(Slirp *slirp, int is_udp, struct in_addr host_addr,
         addr_len = sizeof(addr);
         if ((so->so_state & SS_HOSTFWD) &&
             getsockname(so->s, (struct sockaddr *)&addr, &addr_len) == 0 &&
-            addr.sin_addr.s_addr == host_addr.s_addr && addr.sin_port == port) {
+            addr_len == sizeof(addr) &&
+            addr.sin_family == AF_INET &&
+            addr.sin_addr.s_addr == host_addr.s_addr &&
+            addr.sin_port == port) {
             so->slirp->cb->unregister_poll_fd(so->s, so->slirp->opaque);
             closesocket(so->s);
             sofree(so);
@@ -1116,7 +1118,6 @@ int slirp_remove_hostfwd(Slirp *slirp, int is_udp, struct in_addr host_addr,
     return -1;
 }
 
-/* TODO: IPv6 */
 int slirp_add_hostfwd(Slirp *slirp, int is_udp, struct in_addr host_addr,
                       int host_port, struct in_addr guest_addr, int guest_port)
 {
@@ -1135,6 +1136,50 @@ int slirp_add_hostfwd(Slirp *slirp, int is_udp, struct in_addr host_addr,
     return 0;
 }
 
+int slirp_remove_ipv6_hostfwd(Slirp *slirp, int is_udp,
+                              struct in6_addr host_addr, int host_port)
+{
+    struct socket *so;
+    struct socket *head = (is_udp ? &slirp->udb : &slirp->tcb);
+    struct sockaddr_in6 addr;
+    int port = htons(host_port);
+    socklen_t addr_len;
+
+    for (so = head->so_next; so != head; so = so->so_next) {
+        addr_len = sizeof(addr);
+        if ((so->so_state & SS_HOSTFWD) &&
+            getsockname(so->s, (struct sockaddr *)&addr, &addr_len) == 0 &&
+            addr_len == sizeof(addr) &&
+            addr.sin6_family == AF_INET6 &&
+            !memcmp(&addr.sin6_addr, &host_addr, sizeof(host_addr)) &&
+            addr.sin6_port == port) {
+            so->slirp->cb->unregister_poll_fd(so->s, so->slirp->opaque);
+            closesocket(so->s);
+            sofree(so);
+            return 0;
+        }
+    }
+
+    return -1;
+}
+
+int slirp_add_ipv6_hostfwd(Slirp *slirp, int is_udp,
+                          struct in6_addr host_addr, int host_port,
+                          struct in6_addr guest_addr, int guest_port)
+{
+    if (is_udp) {
+        if (!udp6_listen(slirp, host_addr, htons(host_port),
+                         guest_addr, htons(guest_port), SS_HOSTFWD))
+            return -1;
+    } else {
+        if (!tcp6_listen(slirp, host_addr, htons(host_port),
+                         guest_addr, htons(guest_port), SS_HOSTFWD))
+            return -1;
+    }
+
+    return 0;
+}
+
 /* TODO: IPv6 */
 static bool check_guestfwd(Slirp *slirp, struct in_addr *guest_addr,
                            int guest_port)
diff --git a/src/socket.c b/src/socket.c
index c0b02ad..46be587 100644
--- a/src/socket.c
+++ b/src/socket.c
@@ -736,22 +736,18 @@ int sosendto(struct socket *so, struct mbuf *m)
 /*
  * Listen for incoming TCP connections
  */
-struct socket *tcp_listen(Slirp *slirp, uint32_t haddr, unsigned hport,
-                          uint32_t laddr, unsigned lport, int flags)
+static struct socket *tcpx_listen(Slirp *slirp, int family,
+                                  in4or6_addr haddr, unsigned hport,
+                                  in4or6_addr laddr, unsigned lport,
+                                  int flags)
 {
-    /* TODO: IPv6 */
-    struct sockaddr_in addr;
+    union {
+        struct sockaddr_in addr4;
+        struct sockaddr_in6 addr6;
+    } addr;
     struct socket *so;
     int s, opt = 1;
     socklen_t addrlen = sizeof(addr);
-    memset(&addr, 0, addrlen);
-
-    DEBUG_CALL("tcp_listen");
-    DEBUG_ARG("haddr = %s", inet_ntoa((struct in_addr){ .s_addr = haddr }));
-    DEBUG_ARG("hport = %d", ntohs(hport));
-    DEBUG_ARG("laddr = %s", inet_ntoa((struct in_addr){ .s_addr = laddr }));
-    DEBUG_ARG("lport = %d", ntohs(lport));
-    DEBUG_ARG("flags = %x", flags);
 
     so = socreate(slirp);
 
@@ -770,20 +766,35 @@ struct socket *tcp_listen(Slirp *slirp, uint32_t haddr, unsigned hport,
 
     so->so_state &= SS_PERSISTENT_MASK;
     so->so_state |= (SS_FACCEPTCONN | flags);
-    so->so_lfamily = AF_INET;
-    so->so_lport = lport; /* Kept in network format */
-    so->so_laddr.s_addr = laddr; /* Ditto */
+    so->so_lfamily = family;
+    /* Address,port are kept in network format */
+    if (family == AF_INET) {
+        so->so_laddr.s_addr = laddr.addr4;
+        so->so_lport = lport;
+    } else {
+        so->so_laddr6 = laddr.addr6;
+        so->so_lport6 = lport;
+    }
 
-    addr.sin_family = AF_INET;
-    addr.sin_addr.s_addr = haddr;
-    addr.sin_port = hport;
+    memset(&addr, 0, addrlen);
+    if (family == AF_INET) {
+        addr.addr4.sin_family = family;
+        addr.addr4.sin_addr.s_addr = haddr.addr4;
+        addr.addr4.sin_port = hport;
+        addrlen = sizeof(addr.addr4);
+    } else {
+        addr.addr6.sin6_family = family;
+        addr.addr6.sin6_addr = haddr.addr6;
+        addr.addr6.sin6_port = hport;
+        addrlen = sizeof(addr.addr6);
+    }
 
-    if (((s = slirp_socket(AF_INET, SOCK_STREAM, 0)) < 0) ||
+    s = slirp_socket(family, SOCK_STREAM, 0);
+    if ((s < 0) ||
         (slirp_socket_set_fast_reuse(s) < 0) ||
-        (bind(s, (struct sockaddr *)&addr, sizeof(addr)) < 0) ||
+        (bind(s, (struct sockaddr *)&addr, addrlen) < 0) ||
         (listen(s, 1) < 0)) {
         int tmperrno = errno; /* Don't clobber the real reason we failed */
-
         if (s >= 0) {
             closesocket(s);
         }
@@ -797,22 +808,60 @@ struct socket *tcp_listen(Slirp *slirp, uint32_t haddr, unsigned hport,
         return NULL;
     }
     setsockopt(s, SOL_SOCKET, SO_OOBINLINE, &opt, sizeof(int));
-    opt = 1;
-    setsockopt(s, IPPROTO_TCP, TCP_NODELAY, &opt, sizeof(int));
+    slirp_socket_set_nodelay(s);
 
     getsockname(s, (struct sockaddr *)&addr, &addrlen);
-    so->so_ffamily = AF_INET;
-    so->so_fport = addr.sin_port;
-    if (addr.sin_addr.s_addr == 0 ||
-        addr.sin_addr.s_addr == loopback_addr.s_addr)
-        so->so_faddr = slirp->vhost_addr;
-    else
-        so->so_faddr = addr.sin_addr;
+    if (family == AF_INET) {
+        so->fhost.sin = addr.addr4;
+    } else {
+        so->fhost.sin6 = addr.addr6;
+    }
+    sotranslate_accept(so);
 
     so->s = s;
     return so;
 }
 
+struct socket *tcp_listen(Slirp *slirp, uint32_t haddr, unsigned hport,
+                          uint32_t laddr, unsigned lport, int flags)
+{
+    DEBUG_CALL("tcp_listen");
+    DEBUG_ARG("haddr = %s", inet_ntoa((struct in_addr){ .s_addr = haddr }));
+    DEBUG_ARG("hport = %d", ntohs(hport));
+    DEBUG_ARG("laddr = %s", inet_ntoa((struct in_addr){ .s_addr = laddr }));
+    DEBUG_ARG("lport = %d", ntohs(lport));
+    DEBUG_ARG("flags = %x", flags);
+
+    in4or6_addr haddr4, laddr4;
+
+    haddr4.addr4 = haddr;
+    laddr4.addr4 = laddr;
+    return tcpx_listen(slirp, AF_INET, haddr4, hport, laddr4, lport, flags);
+}
+
+struct socket *
+tcp6_listen(Slirp *slirp, struct in6_addr haddr, u_int hport,
+            struct in6_addr laddr, u_int lport, int flags)
+{
+    DEBUG_CALL("tcp6_listen");
+    char addrstr[INET6_ADDRSTRLEN];
+    const char *str = inet_ntop(AF_INET6, &haddr, addrstr, INET6_ADDRSTRLEN);
+    g_assert(str != NULL);
+    DEBUG_ARG("haddr = %s", str);
+    DEBUG_ARG("hport = %d", ntohs(hport));
+    str = inet_ntop(AF_INET6, &laddr, addrstr, INET6_ADDRSTRLEN);
+    g_assert(str != NULL);
+    DEBUG_ARG("laddr = %s", str);
+    DEBUG_ARG("lport = %d", ntohs(lport));
+    DEBUG_ARG("flags = %x", flags);
+
+    in4or6_addr haddr6, laddr6;
+
+    haddr6.addr6 = haddr;
+    laddr6.addr6 = laddr;
+    return tcpx_listen(slirp, AF_INET6, haddr6, hport, laddr6, lport, flags);
+}
+
 /*
  * Various session state calls
  * XXX Should be #define's
diff --git a/src/socket.h b/src/socket.h
index a6a1e5e..425c607 100644
--- a/src/socket.h
+++ b/src/socket.h
@@ -11,6 +11,13 @@
 #define SO_EXPIRE 240000
 #define SO_EXPIREFAST 10000
 
+/* Helps unify some in/in6 routines. */
+union in4or6_addr {
+    uint32_t addr4;
+    struct in6_addr addr6;
+};
+typedef union in4or6_addr in4or6_addr;
+
 /*
  * Our socket structure
  */
@@ -148,6 +155,8 @@ int sowrite(struct socket *);
 void sorecvfrom(struct socket *);
 int sosendto(struct socket *, struct mbuf *);
 struct socket *tcp_listen(Slirp *, uint32_t, unsigned, uint32_t, unsigned, int);
+struct socket *tcp6_listen(Slirp *, struct in6_addr, u_int,
+                           struct in6_addr, u_int, int);
 void soisfconnecting(register struct socket *);
 void soisfconnected(register struct socket *);
 void sofwdrain(struct socket *);
diff --git a/src/udp.c b/src/udp.c
index 050cee4..52502b9 100644
--- a/src/udp.c
+++ b/src/udp.c
@@ -353,17 +353,20 @@ static uint8_t udp_tos(struct socket *so)
     return 0;
 }
 
-struct socket *udp_listen(Slirp *slirp, uint32_t haddr, unsigned hport,
-                          uint32_t laddr, unsigned lport, int flags)
+static struct socket *udpx_listen(Slirp *slirp, int family,
+                                  in4or6_addr haddr, unsigned hport,
+                                  in4or6_addr laddr, unsigned lport,
+                                  int flags)
 {
-    /* TODO: IPv6 */
-    struct sockaddr_in addr;
+    union {
+        struct sockaddr_in addr4;
+        struct sockaddr_in6 addr6;
+    } addr;
     struct socket *so;
-    socklen_t addrlen = sizeof(struct sockaddr_in);
+    socklen_t addrlen;
 
-    memset(&addr, 0, sizeof(addr));
     so = socreate(slirp);
-    so->s = slirp_socket(AF_INET, SOCK_DGRAM, 0);
+    so->s = slirp_socket(family, SOCK_DGRAM, 0);
     if (so->s < 0) {
         sofree(so);
         return NULL;
@@ -371,9 +374,18 @@ struct socket *udp_listen(Slirp *slirp, uint32_t haddr, unsigned hport,
     so->so_expire = curtime + SO_EXPIRE;
     insque(so, &slirp->udb);
 
-    addr.sin_family = AF_INET;
-    addr.sin_addr.s_addr = haddr;
-    addr.sin_port = hport;
+    memset(&addr, 0, sizeof(addr));
+    if (family == AF_INET) {
+        addr.addr4.sin_family = family;
+        addr.addr4.sin_addr.s_addr = haddr.addr4;
+        addr.addr4.sin_port = hport;
+        addrlen = sizeof(addr.addr4);
+    } else {
+        addr.addr6.sin6_family = family;
+        addr.addr6.sin6_addr = haddr.addr6;
+        addr.addr6.sin6_port = hport;
+        addrlen = sizeof(addr.addr6);
+    }
 
     if (bind(so->s, (struct sockaddr *)&addr, addrlen) < 0) {
         udp_detach(so);
@@ -382,16 +394,47 @@ struct socket *udp_listen(Slirp *slirp, uint32_t haddr, unsigned hport,
     slirp_socket_set_fast_reuse(so->s);
 
     getsockname(so->s, (struct sockaddr *)&addr, &addrlen);
-    so->fhost.sin = addr;
+    if (family == AF_INET) {
+        so->fhost.sin = addr.addr4;
+    } else {
+        so->fhost.sin6 = addr.addr6;
+    }
     sotranslate_accept(so);
-    so->so_lfamily = AF_INET;
-    so->so_lport = lport;
-    so->so_laddr.s_addr = laddr;
+
+    so->so_lfamily = family;
+    if (family == AF_INET) {
+        so->so_laddr.s_addr = laddr.addr4;
+        so->so_lport = lport;
+    } else {
+        so->so_laddr6 = laddr.addr6;
+        so->so_lport6 = lport;
+    }
+
     if (flags != SS_FACCEPTONCE)
         so->so_expire = 0;
-
     so->so_state &= SS_PERSISTENT_MASK;
     so->so_state |= SS_ISFCONNECTED | flags;
 
     return so;
 }
+
+struct socket *udp_listen(Slirp *slirp, uint32_t haddr, unsigned hport,
+                          uint32_t laddr, unsigned lport, int flags)
+{
+    in4or6_addr haddr4, laddr4;
+
+    haddr4.addr4 = haddr;
+    laddr4.addr4 = laddr;
+    return udpx_listen(slirp, AF_INET, haddr4, hport, laddr4, lport, flags);
+}
+
+struct socket *
+udp6_listen(Slirp *slirp, struct in6_addr haddr, u_int hport,
+            struct in6_addr laddr, u_int lport, int flags)
+{
+    in4or6_addr haddr6, laddr6;
+
+    haddr6.addr6 = haddr;
+    laddr6.addr6 = laddr;
+    return udpx_listen(slirp, AF_INET6, haddr6, hport, laddr6, lport, flags);
+}
diff --git a/src/udp.h b/src/udp.h
index c3b83fd..b3fbeac 100644
--- a/src/udp.h
+++ b/src/udp.h
@@ -80,6 +80,8 @@ void udp_input(register struct mbuf *, int);
 int udp_attach(struct socket *, unsigned short af);
 void udp_detach(struct socket *);
 struct socket *udp_listen(Slirp *, uint32_t, unsigned, uint32_t, unsigned, int);
+struct socket *udp6_listen(Slirp *slirp, struct in6_addr, u_int,
+                            struct in6_addr, u_int, int);
 int udp_output(struct socket *so, struct mbuf *m, struct sockaddr_in *saddr,
                struct sockaddr_in *daddr, int iptos);
 
-- 
2.30.0.296.g2bfb1c46d8-goog


