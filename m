Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4B360097
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 05:44:37 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWsvl-0003aP-2Q
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 23:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3kbV3YAMKCuQJPKMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--dje.bounces.google.com>)
 id 1lWsrN-0000Ox-Qy
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 23:40:05 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:46779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3kbV3YAMKCuQJPKMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--dje.bounces.google.com>)
 id 1lWsrL-0004mI-8B
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 23:40:05 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 b22-20020aa78ad60000b02902111131d63dso2048473pfd.13
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 20:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=3tX84cwPvnNGoLgPdJWFKopUcMLTGMgYoo7gZbfKdUk=;
 b=V8eJ4HXZyYevzU7H/Wkp+v2JNsPBg7QM/P3We9j5yexjY9QOEe3hiIcSE4dJv+fCBx
 frgcDoiBlDgg3paul5RNvijeNAOQGbl3nlHtZzCF7Ro1TNhGOQ4tHC9nEGj6Fo342n9k
 3SBEyiGNh+r8VPWnuY59+mIrmm7UIl/yYAfLRHknsXfWLfEiX0+UUnM//48x/btYPhSf
 JvPJuZRr0299EVx6Xw9QNZ2ndwn+bdiAwUhTxuaQ+S1vz7x6qIoC+Q/Aqxn8WYxfsi3K
 jtb6wvuM7vCxV/qYHNDauSYOFri5LeoyN9BeibFcgagDxbNT3ey6++6qn5tjmQyCIaii
 sdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3tX84cwPvnNGoLgPdJWFKopUcMLTGMgYoo7gZbfKdUk=;
 b=Gwoa0BX2m9/GHMsNIbmwKOqhZuzZxjaaZ9vzEuSBawWIYq9xxnEo4z/2tdVmet+nwA
 FjBgfawXKWm4nqj7Y7VuqQADOlNkUKwcfxzhb/cbb+s3flhYDl/Eu67w9xhRpyJWxJdR
 IX/n2O+14NPdM6s33834oZ+XfSThHSDHJCzWZqiTmBf8H1xV7x8rQgnqL7B0al+bpNHQ
 MG7q/c0WhqAZ2wbO9k9Kd46ziB6kG165vCyh3JtEdPZx9YrSqkehP2sMnfq0Z+3SMCIU
 m2bHUtmDwHl01T4VrTFfgTe+zf9qIKuky8BrVz3GH5vdnVD3RB8w0W7Ef1YfEEMaEple
 lAtg==
X-Gm-Message-State: AOAM532zXgjml9vHQQE7R5NQJcR50A2qLC61E1aTCUx/KlIV7mgeoIN+
 JM7dfJp9TZ3mXT01d7JkSCvSpRIYUHNzAba160447o2E4qEXKtUdDIfMx/EqKXYoA+tohAAja1L
 u82iSU0tAz3N4ddyoKXW1kAkX76v3KqK3Qdwc3tedCiBfQRo/Nrah
X-Google-Smtp-Source: ABdhPJyv+7/qscGmZAk5yXSb+NRZn1WCJPT5UrVpaTzhhuaBg+ummTL5zl35Ma6ufd4AaYk/BU+jZ3c=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:83d5:e012:e680:1449])
 (user=dje job=sendgmr) by 2002:a65:6282:: with SMTP id
 f2mr1513478pgv.289.1618458001530; 
 Wed, 14 Apr 2021 20:40:01 -0700 (PDT)
Date: Wed, 14 Apr 2021 20:39:24 -0700
In-Reply-To: <20210415033925.1290401-1-dje@google.com>
Message-Id: <20210415033925.1290401-4-dje@google.com>
Mime-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v6 3/4] net/slirp.c: Refactor address parsing
From: Doug Evans <dje@google.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3kbV3YAMKCuQJPKMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--dje.bounces.google.com;
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

... in preparation for adding ipv6 host forwarding support.

Tested:
avocado run tests/acceptance/hostfwd.py

Signed-off-by: Doug Evans <dje@google.com>
---

Changes from v5:

Use InetSocketAddress and getaddrinfo().
Use new libslirp calls: slirp_remove_hostxfwd, slirp_add_hostxfwd.

 include/qemu/sockets.h      |   2 +
 net/slirp.c                 | 200 ++++++++++++++++++++++++------------
 tests/acceptance/hostfwd.py |  91 ++++++++++++++++
 util/qemu-sockets.c         |  17 +--
 4 files changed, 241 insertions(+), 69 deletions(-)
 create mode 100644 tests/acceptance/hostfwd.py

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 94f4e8de83..6fd71775ce 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -29,6 +29,8 @@ int socket_set_fast_reuse(int fd);
 #define SHUT_RDWR 2
 #endif
 
+int sockaddr_getport(const struct sockaddr *addr);
+
 int inet_ai_family_from_address(InetSocketAddress *addr,
                                 Error **errp);
 const char *inet_parse_host_port(InetSocketAddress *addr,
diff --git a/net/slirp.c b/net/slirp.c
index a01a0fccd3..4be065c30b 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -641,15 +641,108 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *id)
     }
 }
 
+static const char *parse_protocol(const char *str, bool *is_udp,
+                                  Error **errp)
+{
+    char buf[10];
+    const char *p = str;
+
+    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
+        error_setg(errp, "missing protocol name separator");
+        return NULL;
+    }
+
+    if (!strcmp(buf, "tcp") || buf[0] == '\0') {
+        *is_udp = false;
+    } else if (!strcmp(buf, "udp")) {
+        *is_udp = true;
+    } else {
+        error_setg(errp, "bad protocol name '%s'", buf);
+        return NULL;
+    }
+
+    return p;
+}
+
+static int parse_hostfwd_sockaddr(const char *str, int socktype,
+                                  struct sockaddr_storage *saddr,
+                                  Error **errp)
+{
+    struct addrinfo hints, *res = NULL, *e;
+    InetSocketAddress *addr = g_new(InetSocketAddress, 1);
+    int gai_rc;
+    int rc = -1;
+
+    const char *optstr = inet_parse_host_port(addr, str, errp);
+    if (optstr == NULL) {
+        goto fail_return;
+    }
+
+    memset(&hints, 0, sizeof(hints));
+    hints.ai_flags = AI_PASSIVE; /* ignored if host is not ""(->NULL) */
+    hints.ai_flags |= AI_NUMERICHOST | AI_NUMERICSERV;
+    hints.ai_socktype = socktype;
+    hints.ai_family = PF_INET;
+
+    /*
+     * Calling getaddrinfo for guest addresses is dubious, but addresses are
+     * restricted to numeric only. Convert "" to NULL for getaddrinfo's
+     * benefit.
+     */
+    gai_rc = getaddrinfo(*addr->host ? addr->host : NULL,
+                         *addr->port ? addr->port : NULL, &hints, &res);
+    if (gai_rc != 0) {
+        error_setg(errp, "address resolution failed for '%s': %s",
+                   str, gai_strerror(gai_rc));
+        goto fail_return;
+    }
+    if (res->ai_next != NULL) {
+        /*
+         * The caller only wants one address, and except for "any" for both
+         * ipv4 and ipv6 (which we've already precluded above), we shouldn't
+         * get more than one. To assist debugging print all we find.
+         */
+        GString *s = g_string_new(NULL);
+        for (e = res; e != NULL; e = e->ai_next) {
+            char host[NI_MAXHOST];
+            char serv[NI_MAXSERV];
+            int ret = getnameinfo((struct sockaddr *)e->ai_addr, e->ai_addrlen,
+                                  host, sizeof(host),
+                                  serv, sizeof(serv),
+                                  NI_NUMERICHOST | NI_NUMERICSERV);
+            if (ret == 0) {
+                g_string_append_printf(s, "\n  %s:%s", host, serv);
+            } else {
+                g_string_append_printf(s, "\n  unknown, got: %s",
+                                       gai_strerror(ret));
+            }
+        }
+        error_setg(errp, "multiple addresses resolved for '%s':%s",
+                   str, s->str);
+        g_string_free(s, TRUE);
+        goto fail_return;
+    }
+
+    memcpy(saddr, res->ai_addr, res->ai_addrlen);
+    rc = 0;
+
+ fail_return:
+    qapi_free_InetSocketAddress(addr);
+    if (res) {
+        freeaddrinfo(res);
+    }
+    return rc;
+}
+
 void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
 {
-    struct in_addr host_addr = { .s_addr = INADDR_ANY };
-    int host_port;
-    char buf[256];
+    struct sockaddr_storage host_addr;
     const char *src_str, *p;
     SlirpState *s;
-    int is_udp = 0;
+    bool is_udp;
+    Error *error = NULL;
     int err;
+    int flags = 0;
     const char *arg1 = qdict_get_str(qdict, "arg1");
     const char *arg2 = qdict_get_try_str(qdict, "arg2");
 
@@ -664,110 +757,91 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
         return;
     }
 
+    g_assert(src_str != NULL);
     p = src_str;
-    if (!p || get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        goto fail_syntax;
-    }
 
-    if (!strcmp(buf, "tcp") || buf[0] == '\0') {
-        is_udp = 0;
-    } else if (!strcmp(buf, "udp")) {
-        is_udp = 1;
-    } else {
+    p = parse_protocol(p, &is_udp, &error);
+    if (p == NULL) {
         goto fail_syntax;
     }
-
-    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        goto fail_syntax;
-    }
-    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
-        goto fail_syntax;
+    if (is_udp) {
+        flags |= SLIRP_HOSTFWD_UDP;
     }
 
-    if (qemu_strtoi(p, NULL, 10, &host_port)) {
+    if (parse_hostfwd_sockaddr(p, is_udp ? SOCK_DGRAM : SOCK_STREAM,
+                               &host_addr, &error) < 0) {
         goto fail_syntax;
     }
 
-    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
+    err = slirp_remove_hostxfwd(s->slirp, (struct sockaddr *) &host_addr,
+                                sizeof(host_addr), flags);
 
     monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
                    err ? "not found" : "removed");
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
-    int host_port, guest_port;
+    struct sockaddr_storage host_addr, guest_addr;
     const char *p;
     char buf[256];
-    int is_udp;
-    char *end;
-    const char *fail_reason = "Unknown reason";
+    bool is_udp;
+    Error *error = NULL;
+    int flags = 0;
+    int port;
 
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
+    p = parse_protocol(p, &is_udp, &error);
+    if (p == NULL) {
         goto fail_syntax;
     }
-    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
-        fail_reason = "Bad host address";
-        goto fail_syntax;
+    if (is_udp) {
+        flags |= SLIRP_HOSTFWD_UDP;
     }
 
     if (get_str_sep(buf, sizeof(buf), &p, '-') < 0) {
-        fail_reason = "Bad host port separator";
-        goto fail_syntax;
-    }
-    host_port = strtol(buf, &end, 0);
-    if (*end != '\0' || host_port < 0 || host_port > 65535) {
-        fail_reason = "Bad host port";
+        error_setg(&error, "missing host-guest separator");
         goto fail_syntax;
     }
 
-    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        fail_reason = "Missing guest address";
+    if (parse_hostfwd_sockaddr(buf, is_udp ? SOCK_DGRAM : SOCK_STREAM,
+                               &host_addr, &error) < 0) {
+        error_prepend(&error, "For host address: ");
         goto fail_syntax;
     }
-    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr)) {
-        fail_reason = "Bad guest address";
+
+    if (parse_hostfwd_sockaddr(p, is_udp ? SOCK_DGRAM : SOCK_STREAM,
+                               &guest_addr, &error) < 0) {
+        error_prepend(&error, "For guest address: ");
         goto fail_syntax;
     }
-
-    guest_port = strtol(p, &end, 0);
-    if (*end != '\0' || guest_port < 1 || guest_port > 65535) {
-        fail_reason = "Bad guest port";
+    port = sockaddr_getport((struct sockaddr *) &guest_addr);
+    if (port == 0) {
+        error_setg(&error, "For guest address: invalid port '0'");
         goto fail_syntax;
     }
 
-    if (slirp_add_hostfwd(s->slirp, is_udp, host_addr, host_port, guest_addr,
-                          guest_port) < 0) {
-        error_setg(errp, "Could not set up host forwarding rule '%s'",
-                   redir_str);
+    if (slirp_add_hostxfwd(s->slirp,
+                           (struct sockaddr *) &host_addr, sizeof(host_addr),
+                           (struct sockaddr *) &guest_addr, sizeof(guest_addr),
+                           flags) < 0) {
+        error_setg(errp, "Could not set up host forwarding rule '%s': %s",
+                   redir_str, strerror(errno));
         return -1;
     }
     return 0;
 
  fail_syntax:
     error_setg(errp, "Invalid host forwarding rule '%s' (%s)", redir_str,
-               fail_reason);
+               error_get_pretty(error));
+    error_free(error);
     return -1;
 }
 
diff --git a/tests/acceptance/hostfwd.py b/tests/acceptance/hostfwd.py
new file mode 100644
index 0000000000..9b9db142c3
--- /dev/null
+++ b/tests/acceptance/hostfwd.py
@@ -0,0 +1,91 @@
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
+                          "Could not set up host forwarding rule" + \
+                          " 'udp::65042-:42': Address already in use\r\n")
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
+                          "Invalid format: bad protocol name 'abc'\r\n")
+        self.assertEquals(self.hmc('hostfwd_add abc::65022-:22'),
+                          "Invalid host forwarding rule 'abc::65022-:22'" + \
+                          " (bad protocol name 'abc')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :foo'),
+                          "Invalid host forwarding rule ':foo'" + \
+                          " (missing host-guest separator)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :a.b.c.d:66-:66'),
+                          "Invalid host forwarding rule ':a.b.c.d:66-:66'" + \
+                          " (For host address: address resolution failed for" \
+                          " 'a.b.c.d:66': Name or service not known)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-a.b.c.d:66'),
+                          "Invalid host forwarding rule '::66-a.b.c.d:66'" + \
+                          " (For guest address: address resolution failed" + \
+                          " for 'a.b.c.d:66': Name or service not known)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::-1-foo'),
+                          "Invalid host forwarding rule '::-1-foo'" + \
+                          " (For host address: error parsing port in" + \
+                          " address ':')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-foo'),
+                          "Invalid host forwarding rule '::66-foo' (For" + \
+                          " guest address: error parsing address 'foo')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add ::66-:0'),
+                          "Invalid host forwarding rule '::66-:0'" + \
+                          " (For guest address: invalid port '0')\r\n")
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index c0069f2565..983efeee2f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -46,23 +46,28 @@
 #endif
 
 
-static int inet_getport(struct addrinfo *e)
+int sockaddr_getport(const struct sockaddr *addr)
 {
-    struct sockaddr_in *i4;
-    struct sockaddr_in6 *i6;
+    const struct sockaddr_in *i4;
+    const struct sockaddr_in6 *i6;
 
-    switch (e->ai_family) {
+    switch (addr->sa_family) {
     case PF_INET6:
-        i6 = (void*)e->ai_addr;
+        i6 = (void *)addr;
         return ntohs(i6->sin6_port);
     case PF_INET:
-        i4 = (void*)e->ai_addr;
+        i4 = (void *)addr;
         return ntohs(i4->sin_port);
     default:
         return 0;
     }
 }
 
+static int inet_getport(struct addrinfo *e)
+{
+    return sockaddr_getport(e->ai_addr);
+}
+
 static void inet_setport(struct addrinfo *e, int port)
 {
     struct sockaddr_in *i4;
-- 
2.31.1.295.g9ea45b61b8-goog


