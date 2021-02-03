Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD830E7A3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 00:41:06 +0100 (CET)
Received: from localhost ([::1]:49878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Rlh-00014T-GS
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 18:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VTMbYAMKCjAPVQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--dje.bounces.google.com>)
 id 1l7Rgh-0006Hj-Ca
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:35:55 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:42586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VTMbYAMKCjAPVQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--dje.bounces.google.com>)
 id 1l7Rge-00017y-U3
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:35:55 -0500
Received: by mail-pl1-x649.google.com with SMTP id q12so855822plr.9
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 15:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=SHHYVrdyyTBmAPWoQx1i3Bhxjp/C3+JJaAKcUlrNtdA=;
 b=NUBh8oSX+ZkqUxrIKLmFu6hLGDBiNrIrm+N8BU1PcFSnyHQ8uFnskv67ZoYo2lrJgP
 Ip9lZ+NaRZ6Lnw1KKVfBMRRCsWCWypp9hderUjwL5DFCjVTNwmEYwRgSJIF3EBgDQun7
 hlHN3yzNg/p7iOWmz92EqNZPLJX3cl0q95mEcTkXCSorR+8IOHvvKpenZxf5/TUFxGQS
 kNx60sn/0eWRdw3xKjB9BZZsULfR0hnl/XLmrTr2NPjO7LCALk8ROefS/YqUBauIAZg+
 4w/nTgU3NEEPrMmODLYe9g7cn9qheed3XVcC1qx2/wLOymxfNwWwmzopA0yHaXXC6GMI
 AShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SHHYVrdyyTBmAPWoQx1i3Bhxjp/C3+JJaAKcUlrNtdA=;
 b=rPxoe93Xif6PVOtwLYU6UEHg2hzcwwkfUev9Dib69ziqJAiqKNdmyS8UDXZA6GI4lr
 xpy1OCE2/v3oMxiccIIga9DBRe/icujn4oRJ12df/ntO+UeTPiXRoXePAiI4sz6vFHF3
 icoSHVwaJWhANgxOrklgwoIIDCJwx7DHkUDomiL5/JWqtg23D/tAXqR1GsXn+2V5jQjY
 l8rAzxIMfvVOvh6J6rJ2WPsXSqiaIp15fFw3joNgk3uSrUcD/1f602THeCnImjyVfHIg
 PUGN/ATE/Tr2R6047SmtXnLfmMAM9A0zQSZCkKBZSgmQ4JV4csJ13O7CT2lwkOyqCZ4T
 S5GQ==
X-Gm-Message-State: AOAM532xMxxoF8axxUieEKqQE4F+wIBxILodWzyM5BSsdp2jbEG0B35j
 4UjCd4XjG5ENXeGXjpU6DvHj44dBZYHgHIwmIyRwaEY9ejYOMaDCxi5w9FOt32zZuxCZNdIMHn0
 5URoOjm2PJj5zAJUx8Rpq++spkOcjnDZOVxeyrlZRbs+ydTStDAL0
X-Google-Smtp-Source: ABdhPJyF6vBmLlHbSbbCNEXLltu/N+fZx046fQsMK2Hg0xw70ZRUei0R5tJM1j5Q5bHf9BXwESAwM3Q=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:25d4:96ad:ca30:7913])
 (user=dje job=sendgmr) by 2002:a17:90b:198d:: with SMTP id
 mv13mr5497249pjb.68.1612395349989; Wed, 03 Feb 2021 15:35:49 -0800 (PST)
Date: Wed,  3 Feb 2021 15:35:39 -0800
In-Reply-To: <20210203233539.1990032-1-dje@google.com>
Message-Id: <20210203233539.1990032-4-dje@google.com>
Mime-Version: 1.0
References: <20210203233539.1990032-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v3 3/3] net: Add -ipv6-hostfwd option,
 ipv6_hostfwd_add/remove commands
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3VTMbYAMKCjAPVQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--dje.bounces.google.com;
 helo=mail-pl1-x649.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From: dje--- via <qemu-devel@nongnu.org>

These are identical to their ipv4 counterparts, but for ipv6.

Signed-off-by: Doug Evans <dje@google.com>
---
 hmp-commands.hx     |  32 +++++++++++
 include/net/slirp.h |   2 +
 net/slirp.c         | 128 +++++++++++++++++++++++++++++++++++++++++++-
 qapi/net.json       |   4 ++
 4 files changed, 164 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index d4001f9c5d..6a9ec0361d 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1392,6 +1392,38 @@ SRST
   Remove host-to-guest TCP or UDP redirection.
 ERST
 
+#ifdef CONFIG_SLIRP
+    {
+        .name       = "ipv6_hostfwd_add",
+        .args_type  = "arg1:s,arg2:s?",
+        .params     = "[netdev_id] [tcp|udp]:[hostaddr6]:hostport-[guestaddr6]:guestport",
+        .help       = "redirect TCP6 or UDP6 connections from host to guest (requires -net user)",
+        .cmd        = hmp_ipv6_hostfwd_add,
+    },
+#endif
+SRST
+``ipv6_hostfwd_add``
+  Redirect TCP6 or UDP6 connections from host to guest (requires -net user).
+  Note that IPV6 addresses must be wrapped in square brackets [].
+  E.g., write "[::1]" not "::1".
+ERST
+
+#ifdef CONFIG_SLIRP
+    {
+        .name       = "ipv6_hostfwd_remove",
+        .args_type  = "arg1:s,arg2:s?",
+        .params     = "[netdev_id] [tcp|udp]:[hostaddr6]:hostport",
+        .help       = "remove host-to-guest TCP6 or UDP6 redirection",
+        .cmd        = hmp_ipv6_hostfwd_remove,
+    },
+#endif
+SRST
+``ipv6_hostfwd_remove``
+  Remove host-to-guest TCP6 or UDP6 redirection.
+  Note that IPV6 addresses must be wrapped in square brackets [].
+  E.g., write "[::1]" not "::1".
+ERST
+
     {
         .name       = "balloon",
         .args_type  = "value:M",
diff --git a/include/net/slirp.h b/include/net/slirp.h
index bad3e1e241..4796a5cd39 100644
--- a/include/net/slirp.h
+++ b/include/net/slirp.h
@@ -29,6 +29,8 @@
 
 void hmp_hostfwd_add(Monitor *mon, const QDict *qdict);
 void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict);
+void hmp_ipv6_hostfwd_add(Monitor *mon, const QDict *qdict);
+void hmp_ipv6_hostfwd_remove(Monitor *mon, const QDict *qdict);
 
 void hmp_info_usernet(Monitor *mon, const QDict *qdict);
 
diff --git a/net/slirp.c b/net/slirp.c
index a21a313302..2a59c20286 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -70,6 +70,7 @@ static int get_str_sep(char *buf, int buf_size, const char **pp, int sep)
 /* slirp network adapter */
 
 #define SLIRP_CFG_HOSTFWD 1
+#define SLIRP_CFG_IPV6_HOSTFWD 2
 
 struct slirp_config_str {
     struct slirp_config_str *next;
@@ -101,6 +102,8 @@ static QTAILQ_HEAD(, SlirpState) slirp_stacks =
     QTAILQ_HEAD_INITIALIZER(slirp_stacks);
 
 static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp);
+static int slirp_ipv6_hostfwd(SlirpState *s, const char *redir_str,
+                              Error **errp);
 static int slirp_guestfwd(SlirpState *s, const char *config_str, Error **errp);
 
 #ifndef _WIN32
@@ -586,6 +589,10 @@ static int net_slirp_init(NetClientState *peer, const char *model,
             if (slirp_hostfwd(s, config->str, errp) < 0) {
                 goto error;
             }
+        } else if (config->flags & SLIRP_CFG_IPV6_HOSTFWD) {
+            if (slirp_ipv6_hostfwd(s, config->str, errp) < 0) {
+                goto error;
+            }
         } else {
             if (slirp_guestfwd(s, config->str, errp) < 0) {
                 goto error;
@@ -703,6 +710,58 @@ static const char *parse_in4_addr_port(const char *str, const char *kind,
     return p;
 }
 
+/*
+ * Parse an ipv6 address/port of the form "addr<addr_sep>port<port_sep>".
+ * "kind" is either "host" or "guest" and is included in error messages.
+ * An empty address means in6addr_any.
+ * Returns a pointer to the end of the parsed string on success, and stores
+ * the results in *addr, *port.
+ * Otherwise returns NULL and stores the error message in *errmsg, which must
+ * be freed by the caller.
+ */
+static const char *parse_in6_addr_port(const char *str, const char *kind,
+                                       int addr_sep, int port_sep,
+                                       struct in6_addr *addr, int *port,
+                                       char **errmsg)
+{
+    char buf[256];
+    const char *p = str;
+
+    if (*(p++) != '[') {
+        *errmsg = g_strdup_printf("IPv6 %s address must be enclosed"
+                                  " in square brackets", kind);
+        return NULL;
+    }
+    if (get_str_sep(buf, sizeof(buf), &p, ']') < 0) {
+        *errmsg = g_strdup_printf("IPv6 %s address must be enclosed"
+                                  " in square brackets", kind);
+        return NULL;
+    }
+    if (buf[0] == '\0') {
+        *addr = in6addr_any;
+    } else if (!inet_pton(AF_INET6, buf, addr)) {
+        *errmsg = g_strdup_printf("Bad %s address", kind);
+        return NULL;
+    }
+
+    if (*p++ != addr_sep) {
+        *errmsg = g_strdup_printf("Missing %s address separator after IPv6 address", kind);
+        return NULL;
+    }
+
+    if (get_str_sep(buf, sizeof(buf), &p, port_sep) < 0) {
+        *errmsg = g_strdup_printf("Missing %s port separator", kind);
+        return NULL;
+    }
+    if (qemu_strtoi(buf, NULL, 10, port) < 0 ||
+        *port < 0 || *port > 65535) {
+        *errmsg = g_strdup_printf("Bad %s port", kind);
+        return NULL;
+    }
+
+    return p;
+}
+
 static void hmp_hostfwd_remove_worker(Monitor *mon, const QDict *qdict,
                                       int family)
 {
@@ -743,7 +802,12 @@ static void hmp_hostfwd_remove_worker(Monitor *mon, const QDict *qdict,
         }
         err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
     } else {
-        g_assert_not_reached();
+        struct in6_addr host_addr;
+        if (parse_in6_addr_port(p, "host", ':', '\0', &host_addr, &host_port,
+                                &errmsg) == NULL) {
+            goto fail_syntax;
+        }
+        err = slirp_remove_ipv6_hostfwd(s->slirp, is_udp, host_addr, host_port);
     }
 
     monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
@@ -760,6 +824,11 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
     hmp_hostfwd_remove_worker(mon, qdict, AF_INET);
 }
 
+void hmp_ipv6_hostfwd_remove(Monitor *mon, const QDict *qdict)
+{
+    hmp_hostfwd_remove_worker(mon, qdict, AF_INET6);
+}
+
 static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
 {
     struct in_addr host_addr = { .s_addr = INADDR_ANY };
@@ -807,6 +876,55 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
     return -1;
 }
 
+static int slirp_ipv6_hostfwd(SlirpState *s, const char *redir_str,
+                              Error **errp)
+{
+    struct in6_addr host_addr = in6addr_any;
+    struct in6_addr guest_addr;
+    int host_port, guest_port;
+    const char *p;
+    int is_udp;
+    char *errmsg = NULL;
+
+    memset(&guest_addr, 0, sizeof(guest_addr));
+    g_assert(redir_str != NULL);
+    p = redir_str;
+
+    p = parse_protocol(p, ':', &is_udp, &errmsg);
+    if (p == NULL) {
+        goto fail_syntax;
+    }
+
+    p = parse_in6_addr_port(p, "host", ':', '-', &host_addr, &host_port,
+                            &errmsg);
+    if (p == NULL) {
+        goto fail_syntax;
+    }
+
+    if (parse_in6_addr_port(p, "guest", ':', '\0', &guest_addr, &guest_port,
+                            &errmsg) == NULL) {
+        goto fail_syntax;
+    }
+    if (guest_port == 0) {
+        errmsg = g_strdup("Bad guest port");
+        goto fail_syntax;
+    }
+
+    if (slirp_add_ipv6_hostfwd(s->slirp, is_udp, host_addr, host_port,
+                               guest_addr, guest_port) < 0) {
+        error_setg(errp, "Could not set up host forwarding rule '%s'",
+                   redir_str);
+        return -1;
+    }
+    return 0;
+
+ fail_syntax:
+    error_setg(errp, "Invalid host forwarding rule '%s' (%s)", redir_str,
+               errmsg);
+    g_free(errmsg);
+    return -1;
+}
+
 static void hmp_hostfwd_add_worker(Monitor *mon, const QDict *qdict, int family)
 {
     const char *redir_str;
@@ -830,7 +948,7 @@ static void hmp_hostfwd_add_worker(Monitor *mon, const QDict *qdict, int family)
     if (family == AF_INET) {
         rc = slirp_hostfwd(s, redir_str, &err);
     } else {
-        g_assert_not_reached();
+        rc = slirp_ipv6_hostfwd(s, redir_str, &err);
     }
     if (rc < 0) {
         error_report_err(err);
@@ -842,6 +960,11 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
     hmp_hostfwd_add_worker(mon, qdict, AF_INET);
 }
 
+void hmp_ipv6_hostfwd_add(Monitor *mon, const QDict *qdict)
+{
+    hmp_hostfwd_add_worker(mon, qdict, AF_INET6);
+}
+
 #ifndef _WIN32
 
 /* automatic user mode samba server configuration */
@@ -1148,6 +1271,7 @@ int net_init_slirp(const Netdev *netdev, const char *name,
     /* all optional fields are initialized to "all bits zero" */
 
     net_init_slirp_configs(user->hostfwd, SLIRP_CFG_HOSTFWD);
+    net_init_slirp_configs(user->ipv6_hostfwd, SLIRP_CFG_IPV6_HOSTFWD);
     net_init_slirp_configs(user->guestfwd, 0);
 
     ret = net_slirp_init(peer, "user", name, user->q_restrict,
diff --git a/qapi/net.json b/qapi/net.json
index c31748c87f..443473107a 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -161,6 +161,9 @@
 # @hostfwd: redirect incoming TCP or UDP host connections to guest
 #           endpoints
 #
+# @ipv6-hostfwd: redirect incoming IPV6 TCP or UDP host connections to
+#                guest endpoints (since 6.0)
+#
 # @guestfwd: forward guest TCP connections
 #
 # @tftp-server-name: RFC2132 "TFTP server name" string (Since 3.1)
@@ -189,6 +192,7 @@
     '*smb':       'str',
     '*smbserver': 'str',
     '*hostfwd':   ['String'],
+    '*ipv6-hostfwd': ['String'],
     '*guestfwd':  ['String'],
     '*tftp-server-name': 'str' } }
 
-- 
2.30.0.365.g02bc693789-goog


