Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4D030E50D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:41:48 +0100 (CET)
Received: from localhost ([::1]:50424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7PuF-0007YX-66
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3oRcbYAMKCkQjpkmuumrk.iuswks0-jk1krtutmt0.uxm@flex--dje.bounces.google.com>)
 id 1l7PqK-0005B4-2u
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:37:44 -0500
Received: from mail-ua1-x949.google.com ([2607:f8b0:4864:20::949]:50444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3oRcbYAMKCkQjpkmuumrk.iuswks0-jk1krtutmt0.uxm@flex--dje.bounces.google.com>)
 id 1l7PqI-0000k6-4L
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:37:43 -0500
Received: by mail-ua1-x949.google.com with SMTP id 9so336673uas.17
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 13:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=BhbO3SvLCkriwBiHJc9Cks1uZmwz8cYND/xQeX1C+kQ=;
 b=ls0587oRfQ2IKl7p5Nc6dtCOgoWUVtkbWRAD1mP+NbP/tPfj2CdID6VkV0ZjuD2pRv
 X9dtcjK4MLfG2pKU0s+104YkaRT1POwzS+e+EEPX0VnHkYM827y7PblSGUvsdjwOgnY7
 74cZXsyr0b2H/iz1V7sOIjAozAfa5e3n2tAVHde8J92XNBY/dp2v/A4V2JGOIklrANGw
 WqDhTDPtysxHIE9r7F2t8Fvn/QjTadcCiCV34yKmWDKeT0noF9x0ZbSuwlGooRnROpKV
 gjN8Eptg/Q4Q1IkLe/ut9B0+chA/b9fQUyz3xflTrKVJYBZeBsze4Ib+2bhlGtqMTzu3
 +r1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BhbO3SvLCkriwBiHJc9Cks1uZmwz8cYND/xQeX1C+kQ=;
 b=KH2qfJtJifWYgGNyyft2ZrqR4roODHFAXwtlwZHc0/F4yR+l/mFzxJD3yu7ID9aMlg
 TKR8Oe8cP1MBKmAfV/Kvew+Vw5IZ39NBoag+mee7D87yxmPZy1O9yRKA9xedALlqvZwA
 wF0rhzCPk3ec5L+oFT4cWEAJmkgd87HBRseIVSct2SVK1iEyHv3YEW6cFze1Px0bOmBt
 BRLT9j4p+33sig0dWMvezDuDh0lSznc59OB23Zx3FIrGclQIyo9cAcQAYRJg6BHHdn11
 viBDgtAgK2coAmkM3Y109KJ1DlPrZ6IPG7L1Rn6mIgV+uksqGtFGBZ3oqH/yaghO0OYO
 VQYQ==
X-Gm-Message-State: AOAM531MafghhIhIagvOAmI+XFv/kdwyr+pabevdk+v78sYstu5rS9sS
 /xm0BaJlNGZyZPNa8nwgN6eLIsjKw0Ib8bPxcljqy3tr05riqczeBy3PIhkmfG8waKUJpKDGCtQ
 d2qhv91WxwJ3tS5DL4VtydS+RGVFQvJ2JaBV08ASUG36E4B/Q4V8N
X-Google-Smtp-Source: ABdhPJyBdleMJprC7owuIC2EP9jPrhs601sBSkweZR48PnwUw+F0g7TaffJEfJFVdIafqDtrACY4vYk=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:25d4:96ad:ca30:7913])
 (user=dje job=sendgmr) by 2002:a1f:1489:: with SMTP id
 131mr3347055vku.25.1612388257422; 
 Wed, 03 Feb 2021 13:37:37 -0800 (PST)
Date: Wed,  3 Feb 2021 13:37:28 -0800
In-Reply-To: <20210203213729.1940893-1-dje@google.com>
Message-Id: <20210203213729.1940893-2-dje@google.com>
Mime-Version: 1.0
References: <20210203213729.1940893-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 1/2] net/slirp.c: Refactor address parsing
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::949;
 envelope-from=3oRcbYAMKCkQjpkmuumrk.iuswks0-jk1krtutmt0.uxm@flex--dje.bounces.google.com;
 helo=mail-ua1-x949.google.com
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

... in preparation for adding ipv6 host forwarding support.
---
 net/slirp.c | 200 +++++++++++++++++++++++++++++++++-------------------
 slirp       |   2 +-
 2 files changed, 130 insertions(+), 72 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index be914c0be0..a21a313302 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -631,15 +631,83 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *id)
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
+static void hmp_hostfwd_remove_worker(Monitor *mon, const QDict *qdict,
+                                      int family)
+{
+    const char *src_str;
     SlirpState *s;
-    int is_udp = 0;
-    int err;
     const char *arg1 = qdict_get_str(qdict, "arg1");
     const char *arg2 = qdict_get_try_str(qdict, "arg2");
 
@@ -654,38 +722,42 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
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
+        g_assert_not_reached();
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
 }
 
 static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
@@ -694,56 +766,29 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
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
-        goto fail_syntax;
-    }
-    if (!strcmp(buf, "tcp") || buf[0] == '\0') {
-        is_udp = 0;
-    } else if (!strcmp(buf, "udp")) {
-        is_udp = 1;
-    } else {
-        fail_reason = "Bad protocol name";
-        goto fail_syntax;
-    }
 
-    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        fail_reason = "Missing : separator";
-        goto fail_syntax;
-    }
-    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
-        fail_reason = "Bad host address";
+    p = parse_protocol(p, ':', &is_udp, &errmsg);
+    if (p == NULL) {
         goto fail_syntax;
     }
 
-    if (get_str_sep(buf, sizeof(buf), &p, '-') < 0) {
-        fail_reason = "Bad host port separator";
-        goto fail_syntax;
-    }
-    host_port = strtol(buf, &end, 0);
-    if (*end != '\0' || host_port < 0 || host_port > 65535) {
-        fail_reason = "Bad host port";
+    p = parse_in4_addr_port(p, "host", ':', '-', &host_addr, &host_port,
+                            &errmsg);
+    if (p == NULL) {
         goto fail_syntax;
     }
 
-    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        fail_reason = "Missing guest address";
+    if (parse_in4_addr_port(p, "guest", ':', '\0', &guest_addr, &guest_port,
+                            &errmsg) == NULL) {
         goto fail_syntax;
     }
-    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr)) {
-        fail_reason = "Bad guest address";
-        goto fail_syntax;
-    }
-
-    guest_port = strtol(p, &end, 0);
-    if (*end != '\0' || guest_port < 1 || guest_port > 65535) {
-        fail_reason = "Bad guest port";
+    if (guest_port == 0) {
+        errmsg = g_strdup("Bad guest port");
         goto fail_syntax;
     }
 
@@ -757,11 +802,12 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
 
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
@@ -775,13 +821,25 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
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
     }
 
+    Error *err = NULL;
+    int rc;
+    if (family == AF_INET) {
+        rc = slirp_hostfwd(s, redir_str, &err);
+    } else {
+        g_assert_not_reached();
+    }
+    if (rc < 0) {
+        error_report_err(err);
+    }
+}
+
+void hmp_hostfwd_add(Monitor *mon, const QDict *qdict)
+{
+    hmp_hostfwd_add_worker(mon, qdict, AF_INET);
 }
 
 #ifndef _WIN32
diff --git a/slirp b/slirp
index 8f43a99191..358c0827d4 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit 358c0827d49778f016312bfb4167fe639900681f
-- 
2.30.0.365.g02bc693789-goog


