Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3262FE4DF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 09:25:42 +0100 (CET)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2VHh-0002Iu-N4
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 03:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_zkJYAMKCp4BHCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--dje.bounces.google.com>)
 id 1l2VFb-0000p1-4H
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 03:23:32 -0500
Received: from mail-vs1-xe4a.google.com ([2607:f8b0:4864:20::e4a]:46854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_zkJYAMKCp4BHCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--dje.bounces.google.com>)
 id 1l2VFY-0007Hs-QH
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 03:23:30 -0500
Received: by mail-vs1-xe4a.google.com with SMTP id 188so51753vsl.13
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 00:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=UzzL4zlrfrisBP/NqczyQZ7bldV9V10X9QOYqAxsJME=;
 b=WvkgRcnxDT/8KT3zL86VgeEJPhIupxsxj64vCEDxdbZVNIEFLxvEXDMn89lUMXgJvK
 pyg+fGHXC6StCEUQRfYI8M+iPvman+BfeNGImOHeD70XZD2xUHrh/28u97d783uCAUsx
 jvEHa7gN9mrZDeCWqnsfP26zVyx1u4nxG5mNK8vV9gCPRx9cA6vtFwNmdB9elB52AEOi
 o6NZ6u/GdJZoPsW8/+TEWGUIBY5kOZN0WVbdqJLQLHc1DZN7omxv6xo2XUusZ4G6AoyT
 1XD8iM1r6gQMK2O5wz2GII8rHOJm2T0IvG6txrLYFcqqF0AvUOYid0a3Z4kVt8ENp27E
 ph/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=UzzL4zlrfrisBP/NqczyQZ7bldV9V10X9QOYqAxsJME=;
 b=O215h+wY6wyO9uynMNf3VRC/Ja3hUp6KwFQ18F1wH3gZWngeuZBh9AsO4GQlOLg24t
 AbyD99QAn8yNR0MZebb16pNYwBgxrGNKZmwOVJWr+J1fbKgbT3nTVBr/Zcwclz7gkk8B
 7fE/5n0Tx1Ob0AFLIDQnKtCQnDu/lo1kQzMxkDaP77Vcpl3bFLpO7MosARXHehQn3nMS
 msU8qPMPulqOmEQIyHzWWN8ICGdUEOVu0u1H+9qaANR6KRwOeP9caMCvhmRUEfEnaKZe
 GgLLLLp/3fhcaLyXSPubABxXgPnZcDz3fWprbWIkHcqKa0bZ0rbSGtiTYKLDH5SP4mpV
 baJQ==
X-Gm-Message-State: AOAM532rKhEDyhkC3/qoAV1LGp9AlOaWYpGRsxGr/uri02RFcO8sMUgK
 3cxHjgb1dRHMu2lePQG6D9c92qEpoZTx7wY61M1IvLCGGMmXdb7J8BjSSohE5U9t5NbwgBu2YZs
 JZDVxeSwm/Ymy4WtAsMEFamTCgALGJNcfuMuozv7y6hs0dZkzLRCF
X-Google-Smtp-Source: ABdhPJywg3tq0YgcFy+pPAUAzwr199lV/vk5LVom/U7t4IT7UbNG228ZaEorDir7L9fKJjHvXzyBPoA=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4a0f:cfff:fe66:e570])
 (user=dje job=sendgmr) by 2002:a1f:dac7:: with SMTP id
 r190mr9887555vkg.22.1611217407275; 
 Thu, 21 Jan 2021 00:23:27 -0800 (PST)
Date: Thu, 21 Jan 2021 00:23:14 -0800
In-Reply-To: <20210121082314.458600-1-dje@google.com>
Message-Id: <20210121082314.458600-3-dje@google.com>
Mime-Version: 1.0
References: <20210121082314.458600-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
Subject: [PATCH 2/2] net: Add ipv6_hostfwd option
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e4a;
 envelope-from=3_zkJYAMKCp4BHCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--dje.bounces.google.com;
 helo=mail-vs1-xe4a.google.com
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
 hmp-commands.hx     |  29 ++++-
 include/net/slirp.h |   2 +
 net/slirp.c         | 311 +++++++++++++++++++++++++++++++++++---------
 qapi/net.json       |   1 +
 slirp               |   2 +-
 5 files changed, 279 insertions(+), 66 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 73e0832ea1..fa404123b7 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1398,6 +1398,34 @@ SRST
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
+ERST
+
     {
         .name       = "balloon",
         .args_type  = "value:M",
@@ -1866,4 +1894,3 @@ ERST
         .sub_table  = hmp_info_cmds,
         .flags      = "p",
     },
-
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
index 8350c6d45f..5870a3284a 100644
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
@@ -631,15 +638,136 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *id)
     }
 }
 
-void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
+/*
+ * Parse a protocol name of the form "name<sep>".
+ * Valid protocols are "tcp" and "udp". An empty string means "tcp".
+ * Returns a pointer to the end of the parsed string on success, and stores
+ * the result in *is_udp.
+ * Otherwise returns NULL and stores the error message in *errmsg, which must
+ * be freed by the caller.
+ */
+static const char *parse_protocol(const char *str, int sep, int *is_udp,
+                                  char **errmsg)
+{
+    char buf[10];
+    const char *p = str;
+
+    if (get_str_sep(buf, sizeof(buf), &p, sep) < 0) {
+        *errmsg = g_strdup("Missing protcol name separator");
+        return NULL;
+    }
+
+    if (!strcmp(buf, "tcp") || buf[0] == '\0') {
+        *is_udp = 0;
+    } else if (!strcmp(buf, "udp")) {
+        *is_udp = 1;
+    } else {
+        *errmsg = g_strdup("Bad protcol name");
+        return NULL;
+    }
+
+    return p;
+}
+
+/*
+ * Parse an ipv4 address/port of the form "addr<addr_sep>port<port_sep>".
+ * "kind" is either "host" or "guest" and is included in error messages.
+ * An empty address means INADDR_ANY.
+ * Returns a pointer to the end of the parsed string on success, and stores
+ * the results in *addr, *port.
+ * Otherwise returns NULL and stores the error message in *errmsg, which must
+ * be freed by the caller.
+ */
+static const char *parse_in4_addr_port(const char *str, const char *kind,
+                                       int addr_sep, int port_sep,
+                                       struct in_addr *addr, int *port,
+                                       char **errmsg)
 {
-    struct in_addr host_addr = { .s_addr = INADDR_ANY };
-    int host_port;
     char buf[256];
-    const char *src_str, *p;
+    const char *p = str;
+
+    if (get_str_sep(buf, sizeof(buf), &p, addr_sep) < 0) {
+        *errmsg = g_strdup_printf("Missing %s address separator", kind);
+        return NULL;
+    }
+    if (buf[0] == '\0') {
+        addr->s_addr = INADDR_ANY;
+    } else if (!inet_aton(buf, addr)) {
+        *errmsg = g_strdup_printf("Bad %s address", kind);
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
+    /* Ignore the part between the ']' and addr_sep. */
+    if (get_str_sep(buf, sizeof(buf), &p, addr_sep) < 0) {
+        *errmsg = g_strdup_printf("Missing %s address separator", kind);
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
+static void hmp_hostfwd_remove_worker(Monitor *mon, const QDict *qdict,
+                                      int family)
+{
+    const char *src_str;
     SlirpState *s;
-    int is_udp = 0;
-    int err;
     const char *arg1 = qdict_get_str(qdict, "arg1");
     const char *arg2 = qdict_get_try_str(qdict, "arg2");
 
@@ -654,38 +782,52 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    p = src_str;
-    if (!p || get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        goto fail_syntax;
-    }
+    int host_port;
+    int is_udp;
+    char *errmsg = NULL;
+    int err;
 
-    if (!strcmp(buf, "tcp") || buf[0] == '\0') {
-        is_udp = 0;
-    } else if (!strcmp(buf, "udp")) {
-        is_udp = 1;
-    } else {
-        goto fail_syntax;
-    }
+    g_assert(src_str != NULL);
+    const char *p = src_str;
 
-    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        goto fail_syntax;
-    }
-    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
+    p = parse_protocol(p, ':', &is_udp, &errmsg);
+    if (p == NULL) {
         goto fail_syntax;
     }
 
-    if (qemu_strtoi(p, NULL, 10, &host_port)) {
-        goto fail_syntax;
+    if (family == AF_INET) {
+        struct in_addr host_addr;
+        if (parse_in4_addr_port(p, "host", ':', '\0', &host_addr, &host_port,
+                                &errmsg) == NULL) {
+            goto fail_syntax;
+        }
+        err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
+    } else {
+        struct in6_addr host_addr;
+        if (parse_in6_addr_port(p, "host", ':', '\0', &host_addr, &host_port,
+                                &errmsg) == NULL) {
+            goto fail_syntax;
+        }
+        err = slirp_remove_ipv6_hostfwd(s->slirp, is_udp, host_addr, host_port);
     }
 
-    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
-
     monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
                    err ? "not found" : "removed");
     return;
 
  fail_syntax:
-    monitor_printf(mon, "invalid format\n");
+    monitor_printf(mon, "Invalid format: %s\n", errmsg);
+    g_free(errmsg);
+}
+
+void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
+{
+    hmp_hostfwd_remove_worker(mon, qdict, AF_INET);
+}
+
+void hmp_ipv6_hostfwd_remove(Monitor *mon, const QDict *qdict)
+{
+    hmp_hostfwd_remove_worker(mon, qdict, AF_INET6);
 }
 
 static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
@@ -694,61 +836,83 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
     struct in_addr guest_addr = { .s_addr = 0 };
     int host_port, guest_port;
     const char *p;
-    char buf[256];
     int is_udp;
-    char *end;
-    const char *fail_reason = "Unknown reason";
+    char *errmsg = NULL;
 
+    g_assert(redir_str != NULL);
     p = redir_str;
-    if (!p || get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        fail_reason = "No : separators";
+
+    p = parse_protocol(p, ':', &is_udp, &errmsg);
+    if (p == NULL) {
         goto fail_syntax;
     }
-    if (!strcmp(buf, "tcp") || buf[0] == '\0') {
-        is_udp = 0;
-    } else if (!strcmp(buf, "udp")) {
-        is_udp = 1;
-    } else {
-        fail_reason = "Bad protocol name";
+
+    p = parse_in4_addr_port(p, "host", ':', '-', &host_addr, &host_port,
+                            &errmsg);
+    if (p == NULL) {
         goto fail_syntax;
     }
 
-    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        fail_reason = "Missing : separator";
+    if (parse_in4_addr_port(p, "guest", ':', '\0', &guest_addr, &guest_port,
+                            &errmsg) == NULL) {
         goto fail_syntax;
     }
-    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
-        fail_reason = "Bad host address";
+    if (guest_port == 0) {
+        errmsg = g_strdup("Bad guest port");
         goto fail_syntax;
     }
 
-    if (get_str_sep(buf, sizeof(buf), &p, '-') < 0) {
-        fail_reason = "Bad host port separator";
-        goto fail_syntax;
+    if (slirp_add_hostfwd(s->slirp, is_udp, host_addr, host_port, guest_addr,
+                          guest_port) < 0) {
+        error_setg(errp, "Could not set up host forwarding rule '%s'",
+                   redir_str);
+        return -1;
     }
-    host_port = strtol(buf, &end, 0);
-    if (*end != '\0' || host_port < 0 || host_port > 65535) {
-        fail_reason = "Bad host port";
+    return 0;
+
+ fail_syntax:
+    error_setg(errp, "Invalid host forwarding rule '%s' (%s)", redir_str,
+               errmsg);
+    g_free(errmsg);
+    return -1;
+}
+
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
         goto fail_syntax;
     }
 
-    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        fail_reason = "Missing guest address";
+    p = parse_in6_addr_port(p, "host", ':', '-', &host_addr, &host_port,
+                            &errmsg);
+    if (p == NULL) {
         goto fail_syntax;
     }
-    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr)) {
-        fail_reason = "Bad guest address";
+
+    if (parse_in6_addr_port(p, "guest", ':', '\0', &guest_addr, &guest_port,
+                            &errmsg) == NULL) {
         goto fail_syntax;
     }
-
-    guest_port = strtol(p, &end, 0);
-    if (*end != '\0' || guest_port < 1 || guest_port > 65535) {
-        fail_reason = "Bad guest port";
+    if (guest_port == 0) {
+        errmsg = g_strdup("Bad guest port");
         goto fail_syntax;
     }
 
-    if (slirp_add_hostfwd(s->slirp, is_udp, host_addr, host_port, guest_addr,
-                          guest_port) < 0) {
+    if (slirp_add_ipv6_hostfwd(s->slirp, is_udp, host_addr, host_port,
+                               guest_addr, guest_port) < 0) {
         error_setg(errp, "Could not set up host forwarding rule '%s'",
                    redir_str);
         return -1;
@@ -757,11 +921,12 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
 
  fail_syntax:
     error_setg(errp, "Invalid host forwarding rule '%s' (%s)", redir_str,
-               fail_reason);
+               errmsg);
+    g_free(errmsg);
     return -1;
 }
 
-void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
+static void hmp_hostfwd_add_worker(Monitor *mon, const QDict *qdict, int family)
 {
     const char *redir_str;
     SlirpState *s;
@@ -775,13 +940,30 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
         s = slirp_lookup(mon, NULL);
         redir_str = arg1;
     }
-    if (s) {
-        Error *err = NULL;
-        if (slirp_hostfwd(s, redir_str, &err) < 0) {
-            error_report_err(err);
-        }
+    if (!s) {
+        return;
+    }
+
+    Error *err = NULL;
+    int rc;
+    if (family == AF_INET) {
+        rc = slirp_hostfwd(s, redir_str, &err);
+    } else {
+        rc = slirp_ipv6_hostfwd(s, redir_str, &err);
+    }
+    if (rc < 0) {
+        error_report_err(err);
     }
+}
+
+void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
+{
+    hmp_hostfwd_add_worker(mon, qdict, AF_INET);
+}
 
+void hmp_ipv6_hostfwd_add(Monitor *mon, const QDict *qdict)
+{
+    hmp_hostfwd_add_worker(mon, qdict, AF_INET6);
 }
 
 #ifndef _WIN32
@@ -1090,6 +1272,7 @@ int net_init_slirp(const Netdev *netdev, const char *name,
     /* all optional fields are initialized to "all bits zero" */
 
     net_init_slirp_configs(user->hostfwd, SLIRP_CFG_HOSTFWD);
+    net_init_slirp_configs(user->ipv6_hostfwd, SLIRP_CFG_IPV6_HOSTFWD);
     net_init_slirp_configs(user->guestfwd, 0);
 
     ret = net_slirp_init(peer, "user", name, user->q_restrict,
diff --git a/qapi/net.json b/qapi/net.json
index c31748c87f..34ea92277c 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -189,6 +189,7 @@
     '*smb':       'str',
     '*smbserver': 'str',
     '*hostfwd':   ['String'],
+    '*ipv6-hostfwd': ['String'],
     '*guestfwd':  ['String'],
     '*tftp-server-name': 'str' } }
 
diff --git a/slirp b/slirp
index 8f43a99191..6c0db866ef 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit 6c0db866ef5e11a3b87640e57769fbf9b0a1e3b8
-- 
2.30.0.296.g2bfb1c46d8-goog


