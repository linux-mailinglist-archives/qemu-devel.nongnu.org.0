Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E6732022A
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:21:04 +0100 (CET)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG19-000126-0O
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3L1QwYAMKCqADJEGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--dje.bounces.google.com>)
 id 1lDFu0-0000aL-JY
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:40 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:59721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3L1QwYAMKCqADJEGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--dje.bounces.google.com>)
 id 1lDFtx-0005Sk-8e
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:40 -0500
Received: by mail-pj1-x1049.google.com with SMTP id lk3so4151038pjb.9
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 16:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=xrRSLLdswdaKTo/rEGM81W74DTcTo6DMcyuJBJoBECg=;
 b=pgKa+80dBf6va5xgHqRLOSi9VofbCh2mGRGxlRzF116h+bUCZTY5X66388fBcSYu/J
 l6G4TAKwNLb/CBZbqq3yQ2EiWDjdhUuxQRPHetifOo53+ZCUgbjefbBTVIoBrjP3ZbKX
 cEcpcWsPC14vMEz9iNfdERRj6kxvY6HBEpJunRXubAAKJyfB3vcUlf7ve4Dseq7AJSwh
 cc6Q0XjLmNxeKz4RMaLR7/eFZ1O3vwZqUt3xb0pHH4H/iQl5/yNx0eJ6LUFoDDagsXwd
 lefWmmisLF3BG+R+mptwOq8eUBQ64FWUh8qFj6nQHwvGT80BeNKCvjINdKHw5LMS6TSV
 n2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xrRSLLdswdaKTo/rEGM81W74DTcTo6DMcyuJBJoBECg=;
 b=q7bUzVtdK3ZrUlNETz55tPqwGI/YA7WD/kMJPWDk4uYfQLTd873+GpBq9sTQmk2NXO
 EISBbKJ3kYop0A1UIXQJwslnIURiHqZ9s0PiTHPbvUFpOAxEaSOJpOYlNDx6up7N9JFi
 VUnqARRwgB/yEKvf4siXSkG5dwP3yHQOhXenOJRmHzjahVSLlT1uNEw0Pr0I1G2T6G4w
 tbkYNXT5B5crZ/bUTppomzwFwmqQFbO0bj0+gj1ditmYR1CrUvgQLyWftMHTupl0GJP9
 leGPkanyWiA0HVmaMt47LtIr1Ltf9BvsJQ5AsVwfGbwTiQhzFwCdTNC4MJo1N06AcD6w
 yiuA==
X-Gm-Message-State: AOAM532fJr43DKQTNbeGcqtC2fh3qpD5VC5IgUhg3D5gYgTpH8Kz7AR9
 b3AovPmwesAzB+ocAxb5kK/bKnVaD+1OYXc8UJn4a2Cg8pLkM5l6i4VvpCWQYT1STjDJ+ex9OgX
 kS5wgK2QvG76lxN7HlZV3uNbGPfnIf+vYPpjXL7AlJ5TRpAHbMEf+
X-Google-Smtp-Source: ABdhPJyboi86awktnItL5dfH/BP12Ue5Mw0F2K5dYoab2O6tKkuJUQ8ULHCYTkm9sPqkhTMiIvJRc1g=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:7d06:9b98:ec95:3f70])
 (user=dje job=sendgmr) by 2002:a17:90a:64cc:: with SMTP id
 i12mr5995067pjm.41.1613780015399; Fri, 19 Feb 2021 16:13:35 -0800 (PST)
Date: Fri, 19 Feb 2021 16:13:21 -0800
In-Reply-To: <20210220001322.1311139-1-dje@google.com>
Message-Id: <20210220001322.1311139-5-dje@google.com>
Mime-Version: 1.0
References: <20210220001322.1311139-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v5 4/5] net/slirp.c: Refactor address parsing
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3L1QwYAMKCqADJEGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--dje.bounces.google.com;
 helo=mail-pj1-x1049.google.com
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

Changes from v4:
- was 3/4 in v4
- fix some formatting issues

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

 net/slirp.c                 | 165 ++++++++++++++++++++++--------------
 tests/acceptance/hostfwd.py |  94 ++++++++++++++++++++
 2 files changed, 196 insertions(+), 63 deletions(-)
 create mode 100644 tests/acceptance/hostfwd.py

diff --git a/net/slirp.c b/net/slirp.c
index be914c0be0..e0284492b9 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -631,15 +631,91 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *id)
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
+ * Returns a pointer to after the terminator, unless it was '\0' in which case
+ * the result points to the '\0'.
+ * The parsed results are stored in *addr, *port.
+ * On error NULL is returned and stores the error in *errp.
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
 
@@ -654,30 +730,18 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
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
@@ -685,65 +749,39 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
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
 
@@ -757,7 +795,8 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
 
  fail_syntax:
     error_setg(errp, "Invalid host forwarding rule '%s' (%s)", redir_str,
-               fail_reason);
+               error_get_pretty(error));
+    error_free(error);
     return -1;
 }
 
diff --git a/tests/acceptance/hostfwd.py b/tests/acceptance/hostfwd.py
new file mode 100644
index 0000000000..e5602a7708
--- /dev/null
+++ b/tests/acceptance/hostfwd.py
@@ -0,0 +1,94 @@
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
+                          "Could not set up host forwarding rule "
+                          "'udp::65042-:42'\r\n")
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
+                          "Invalid host forwarding rule 'abc::65022-:22' "
+                          "(Bad protocol name)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :a.b.c.d:66-:66'),
+                          "Invalid host forwarding rule ':a.b.c.d:66-:66' "
+                          "(For host address: Bad address)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-a.b.c.d:66'),
+                          "Invalid host forwarding rule '::66-a.b.c.d:66' "
+                          "(For guest address: Bad address)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66666-:66666'),
+                          "Invalid host forwarding rule '::66666-:66666' "
+                          "(For host address: Bad port)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::-1-foo'),
+                          "Invalid host forwarding rule '::-1-foo' (For "
+                          "host address: error parsing port in address ':')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-foo'),
+                          "Invalid host forwarding rule '::66-foo' (For "
+                          "guest address: error parsing address 'foo')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-:66666'),
+                          "Invalid host forwarding rule '::66-:66666' "
+                          "(For guest address: Bad port)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-:-1'),
+                          "Invalid host forwarding rule '::66-:-1' "
+                          "(For guest address: Bad port)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-:0'),
+                          "Invalid host forwarding rule '::66-:0' "
+                          "(For guest address: Bad port)\r\n")
-- 
2.30.0.617.g56c4b15f3c-goog


