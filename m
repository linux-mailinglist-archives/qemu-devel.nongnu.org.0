Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F69F31F0F0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:25:03 +0100 (CET)
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCprC-0004HZ-Fz
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-MouYAMKClEw2xz77z4x.v759x5D-wxEx4676z6D.7Az@flex--dje.bounces.google.com>)
 id 1lCpiZ-0005Ug-Mb
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:16:07 -0500
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:44806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-MouYAMKClEw2xz77z4x.v759x5D-wxEx4676z6D.7Az@flex--dje.bounces.google.com>)
 id 1lCpiW-0000M9-Gw
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:16:07 -0500
Received: by mail-pf1-x449.google.com with SMTP id t12so2109576pfe.11
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 12:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=cAcSP5+KaHc3yh0fURwQVuIRV7eBfkGSw7YhlJH46iE=;
 b=tiEPxq9sO05LwUBfXKjlFoKt7mOzPS4CQCRXxWTlJgbOeu7k27DUzc5kZTuCjJMk+E
 A6YMiIXKjNs/SOevdaZ5tbWpuaQt387xuyLOwhhljDrw6XAPTqry+oqfpmqNQ4fKHBIM
 E5IdVGdnjk6zqkUoNDA5uNN8TVcxCV7ZaqsUGNsM78G/EyMkNK66pSkgsGKi49EbEi7X
 2/XGywdyVwxFusA+LtH9LI0c4j97JYLyuBzPzqeQSUaQ9spQQ51dBy86VelNkDaU4jHM
 A0ytqNk/PoVv/AfcSI3LvHkADs/gErpjqqNt3yEkw8oqcd5ayj2Nnt3zOmhSW5Lq3jip
 +yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cAcSP5+KaHc3yh0fURwQVuIRV7eBfkGSw7YhlJH46iE=;
 b=C67wDHtz7PLe86QkTB/UVzL7xkEiWo8pwKdvxVZSYvBzHze/RUD0tadeixZQF+ieQA
 N0ytDZMDDgg42NgnQfpPOXClB1AsUeDSCbE3CBJGtJhPA/I3VufVuCVHwUpRyLhYh3wE
 ez5SPnMKYtAOtd37veyIZ1asPu3X8r93wR4pjtAoc3PnzaV6HqTSZ8kWmgVzL3r2RTCl
 n8CjrUxgDC57C4+a4gm3d8C1tJEI+XGc7qp5njXrXLdDZYtSSUGykuCjNaWXNFdxrq/d
 m23ZJfdlOBsHCqVvaJBW5T8TACatAJFLyqKKIyT251dcOQjmVXVcKNzCbNWufeV1LXCu
 0e3Q==
X-Gm-Message-State: AOAM531debtMseUvKR9LleFPk0Q+DTcNWJOZH+Ny9g4MozGAwY+tn5Zh
 +Baj1eJ/XJMxke4CA+xrkExeUU3Mfp7Ccqlded1rUllA60nmTpR8WkhFbmsib6vxCjw5uUpwpvH
 eIi3YFcsL0TIhDupPUuGW5KZfgSpeo935EpGZiwJgTA9syrqPKdG9
X-Google-Smtp-Source: ABdhPJz27KkiijdMqd1xfEBk1MotqLjrQ6nmtbCgke21ImNCfFAIDGOcO/vxBq2Vn12rodMBatEvD8M=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4cc1:c5e:b49d:b16f])
 (user=dje job=sendgmr) by 2002:a17:90a:1a16:: with SMTP id
 22mr5742051pjk.34.1613679352835; Thu, 18 Feb 2021 12:15:52 -0800 (PST)
Date: Thu, 18 Feb 2021 12:15:37 -0800
In-Reply-To: <20210218201538.701509-1-dje@google.com>
Message-Id: <20210218201538.701509-4-dje@google.com>
Mime-Version: 1.0
References: <20210218201538.701509-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v4 3/4] net/slirp.c: Refactor address parsing
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3-MouYAMKClEw2xz77z4x.v759x5D-wxEx4676z6D.7Az@flex--dje.bounces.google.com;
 helo=mail-pf1-x449.google.com
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
From:  Doug Evans via <qemu-devel@nongnu.org>

... in preparation for adding ipv6 host forwarding support.

New test: avocado run tests/acceptance/hostfwd.py

Signed-off-by: Doug Evans <dje@google.com>
---

Changes from v3:
- this patch renamed from 2/3 to 3/4
- call inet_parse_host_and_port from util/qemu-sockets.c
- added tests/acceptance/hostfwd.py

Changes from v2:
- nothing of consequence

Changes from v1:
- this patch is new in v2
  - address parsing refactor split out, ipv4 changes here
- libslirp part is now upstream in libslirp repo

 net/slirp.c                 | 164 ++++++++++++++++++++++--------------
 tests/acceptance/hostfwd.py |  84 ++++++++++++++++++
 2 files changed, 185 insertions(+), 63 deletions(-)
 create mode 100644 tests/acceptance/hostfwd.py

diff --git a/net/slirp.c b/net/slirp.c
index be914c0be0..ee39014a71 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -631,15 +631,90 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *id)
     }
 }
 
+/*
+ * Parse a protocol name of the form "name<sep>".
+ * Valid protocols are "tcp" and "udp". An empty string means "tcp".
+ * Returns a pointer to the end of the parsed string on success, and stores
+ * the result in *is_udp.
+ * Otherwise returns NULL and stores the error in *errp.
+ */
+static const char *parse_protocol(const char *str, int sep, bool *is_udp,
+                                  Error **errp)
+{
+    char buf[10];
+    const char *p = str;
+
+    if (get_str_sep(buf, sizeof(buf), &p, sep) < 0) {
+        error_setg(errp, "Missing protocol name separator");
+        return NULL;
+    }
+
+    if (!strcmp(buf, "tcp") || buf[0] == '\0') {
+        *is_udp = false;
+    } else if (!strcmp(buf, "udp")) {
+        *is_udp = true;
+    } else {
+        error_setg(errp, "Bad protocol name");
+        return NULL;
+    }
+
+    return p;
+}
+
+/*
+ * Parse an ip address/port of the form "address:port<terminator>".
+ * An empty address means INADDR_ANY.
+ * Returns a pointer to the end of the parsed string on success, and stores
+ * the results in *addr, *port.
+ * Otherwise returns NULL and stores the error in *errp.
+ */
+static const char *parse_ip_addr_and_port(const char *str, int terminator,
+                                          struct in_addr *addr, int *port,
+                                          Error **errp)
+{
+    g_autofree char *addr_str = NULL;
+    g_autofree char *port_str = NULL;
+    bool is_v6;
+    const char *p = inet_parse_host_and_port(str, terminator, &addr_str,
+                                             &port_str, &is_v6, errp);
+
+    if (p == NULL) {
+        return NULL;
+    }
+
+    /* Ignore is_v6 for the moment, if inet_aton fails let it. */
+    if (addr_str[0] == '\0') {
+        addr->s_addr = INADDR_ANY;
+    } else if (!inet_aton(addr_str, addr)) {
+        error_setg(errp, "Bad address");
+        return NULL;
+    }
+
+    if (qemu_strtoi(port_str, NULL, 10, port) < 0 ||
+        *port < 0 || *port > 65535) {
+        error_setg(errp, "Bad port");
+        return NULL;
+    }
+
+    /*
+     * At this point "p" points to the terminator or trailing NUL if the
+     * terminator is not present.
+     */
+    if (*p) {
+        ++p;
+    }
+    return p;
+}
+
 void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
 {
-    struct in_addr host_addr = { .s_addr = INADDR_ANY };
+    struct in_addr host_addr;
     int host_port;
-    char buf[256];
     const char *src_str, *p;
     SlirpState *s;
-    int is_udp = 0;
+    bool is_udp;
     int err;
+    Error *error = NULL;
     const char *arg1 = qdict_get_str(qdict, "arg1");
     const char *arg2 = qdict_get_try_str(qdict, "arg2");
 
@@ -654,30 +729,18 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
         return;
     }
 
+    g_assert(src_str != NULL);
     p = src_str;
-    if (!p || get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        goto fail_syntax;
-    }
-
-    if (!strcmp(buf, "tcp") || buf[0] == '\0') {
-        is_udp = 0;
-    } else if (!strcmp(buf, "udp")) {
-        is_udp = 1;
-    } else {
-        goto fail_syntax;
-    }
 
-    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        goto fail_syntax;
-    }
-    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
+    p = parse_protocol(p, ':', &is_udp, &error);
+    if (p == NULL) {
         goto fail_syntax;
     }
 
-    if (qemu_strtoi(p, NULL, 10, &host_port)) {
+    if (parse_ip_addr_and_port(p, '\0', &host_addr, &host_port,
+                               &error) == NULL) {
         goto fail_syntax;
     }
-
     err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
 
     monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
@@ -685,65 +748,39 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
     return;
 
  fail_syntax:
-    monitor_printf(mon, "invalid format\n");
+    monitor_printf(mon, "Invalid format: %s\n", error_get_pretty(error));
+    error_free(error);
 }
 
 static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
 {
-    struct in_addr host_addr = { .s_addr = INADDR_ANY };
-    struct in_addr guest_addr = { .s_addr = 0 };
+    struct in_addr host_addr, guest_addr;
     int host_port, guest_port;
     const char *p;
-    char buf[256];
-    int is_udp;
-    char *end;
-    const char *fail_reason = "Unknown reason";
+    bool is_udp;
+    Error *error = NULL;
 
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
+    p = parse_protocol(p, ':', &is_udp, &error);
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
+    p = parse_ip_addr_and_port(p, '-', &host_addr, &host_port, &error);
+    if (p == NULL) {
+        error_prepend(&error, "For host address: ");
         goto fail_syntax;
     }
 
-    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        fail_reason = "Missing guest address";
+    if (parse_ip_addr_and_port(p, '\0', &guest_addr, &guest_port,
+                               &error) == NULL) {
+        error_prepend(&error, "For guest address: ");
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
+        error_setg(&error, "For guest address: Bad port");
         goto fail_syntax;
     }
 
@@ -757,7 +794,8 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
 
  fail_syntax:
     error_setg(errp, "Invalid host forwarding rule '%s' (%s)", redir_str,
-               fail_reason);
+               error_get_pretty(error));
+    error_free(error);
     return -1;
 }
 
diff --git a/tests/acceptance/hostfwd.py b/tests/acceptance/hostfwd.py
new file mode 100644
index 0000000000..1eaa0371ba
--- /dev/null
+++ b/tests/acceptance/hostfwd.py
@@ -0,0 +1,84 @@
+# Hostfwd command tests
+#
+# Copyright 2021 Google LLC
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License as published by the
+# Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+# for more details.
+
+
+from avocado_qemu import Test
+
+
+class Hostfwd(Test):
+    """
+    :avocado: tags=hostfwd
+    """
+    def hmc(self, cmd):
+        return self.vm.command('human-monitor-command', command_line=cmd)
+
+    def test_qmp_hostfwd_ipv4(self):
+        self.vm.add_args('-nodefaults',
+                         '-netdev', 'user,id=vnet',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.launch()
+        self.assertEquals(self.hmc('hostfwd_add vnet tcp::65022-:22'), '')
+        self.assertEquals(self.hmc('hostfwd_remove vnet tcp::65022'),
+                          'host forwarding rule for tcp::65022 removed\r\n')
+        self.assertEquals(self.hmc('hostfwd_add tcp::65022-:22'), '')
+        self.assertEquals(self.hmc('hostfwd_remove tcp::65022'),
+                          'host forwarding rule for tcp::65022 removed\r\n')
+        self.assertEquals(self.hmc('hostfwd_add udp::65042-:42'), '')
+        self.assertEquals(self.hmc('hostfwd_remove udp::65042'),
+                          'host forwarding rule for udp::65042 removed\r\n')
+
+    def test_qmp_hostfwd_ipv4_functional_errors(self):
+        """Verify handling of various kinds of errors given valid addresses."""
+        self.vm.add_args('-nodefaults',
+                         '-netdev', 'user,id=vnet',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.launch()
+        self.assertEquals(self.hmc('hostfwd_remove ::65022'),
+                          'host forwarding rule for ::65022 not found\r\n')
+        self.assertEquals(self.hmc('hostfwd_add udp::65042-:42'), '')
+        self.assertEquals(self.hmc('hostfwd_add udp::65042-:42'),
+                          "Could not set up host forwarding rule 'udp::65042-:42'\r\n")
+        self.assertEquals(self.hmc('hostfwd_remove ::65042'),
+                          'host forwarding rule for ::65042 not found\r\n')
+        self.assertEquals(self.hmc('hostfwd_remove udp::65042'),
+                          'host forwarding rule for udp::65042 removed\r\n')
+        self.assertEquals(self.hmc('hostfwd_remove udp::65042'),
+                          'host forwarding rule for udp::65042 not found\r\n')
+
+    def test_qmp_hostfwd_ipv4_parsing_errors(self):
+        """Verify handling of various kinds of parsing errors."""
+        self.vm.add_args('-nodefaults',
+                         '-netdev', 'user,id=vnet',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.launch()
+        self.assertEquals(self.hmc('hostfwd_remove abc::42'),
+                          'Invalid format: Bad protocol name\r\n')
+        self.assertEquals(self.hmc('hostfwd_add abc::65022-:22'),
+                          "Invalid host forwarding rule 'abc::65022-:22' (Bad protocol name)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :a.b.c.d:66-:66'),
+                          "Invalid host forwarding rule ':a.b.c.d:66-:66' (For host address: Bad address)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-a.b.c.d:66'),
+                          "Invalid host forwarding rule '::66-a.b.c.d:66' (For guest address: Bad address)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66666-:66666'),
+                          "Invalid host forwarding rule '::66666-:66666' (For host address: Bad port)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::-1-foo'),
+                          "Invalid host forwarding rule '::-1-foo' (For host address: error parsing host:port ':')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-foo'),
+                          "Invalid host forwarding rule '::66-foo' (For guest address: error parsing host:port 'foo')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-:66666'),
+                          "Invalid host forwarding rule '::66-:66666' (For guest address: Bad port)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-:-1'),
+                          "Invalid host forwarding rule '::66-:-1' (For guest address: Bad port)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-:0'),
+                          "Invalid host forwarding rule '::66-:0' (For guest address: Bad port)\r\n")
-- 
2.30.0.617.g56c4b15f3c-goog


