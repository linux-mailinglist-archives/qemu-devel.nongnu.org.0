Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AE8394964
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 01:56:04 +0200 (CEST)
Received: from localhost ([::1]:48072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmmKh-0001LQ-LQ
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 19:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3i4KxYAMKCmIDJEGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--dje.bounces.google.com>)
 id 1lmmIb-0006w4-3T
 for qemu-devel@nongnu.org; Fri, 28 May 2021 19:53:53 -0400
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:39591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3i4KxYAMKCmIDJEGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--dje.bounces.google.com>)
 id 1lmmIY-0007ec-7i
 for qemu-devel@nongnu.org; Fri, 28 May 2021 19:53:52 -0400
Received: by mail-qt1-x84a.google.com with SMTP id
 h12-20020ac8776c0000b02901f1228fdb1bso3058849qtu.6
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 16:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=tochQxcwDbgxuE9aCwQ3mvlcaE6UdATSx8Y3Dl6oo7E=;
 b=DTHm45TnQKt5hzCRMa8lTLkDUqtViWwH0Tpu3yRloOjZX4ZcoNbzF5XbBXrXTeVRFu
 gzvyCYsWQiYjj4n62aFPna77MM0Sr8jRY1x2Kp9HHmZmmPDfAQK0FbxyRJ/so90gVR/d
 W5sIt5pINo3dSdA6UEXpniEWrP5V0WhzguzzxBBGHjUrBwqn3GErr53M/3+S4Gc2S6CZ
 R2+vWY4twV/VUwdyNNa4uFRsXLkmWSRsG8UtR7fo48p07pRfNj5VeC38umcFmiM8ySXK
 Vu8YVnzf2ABE9jEtPe0oUOsm8UF0izPKYFPzrzgh7c/beTzjoWISXq/mkPZKZGGg5YDw
 H+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=tochQxcwDbgxuE9aCwQ3mvlcaE6UdATSx8Y3Dl6oo7E=;
 b=rHOVAW6aUq/AXSNXY6pZwxpBGaEQ3vHHZ+y9gXqwKTnexQ45ZADTKgJtTGAyLA2U8G
 AJnffhcxTBdcB4NftZQItW3iJw0jdZTmcJqLc10ITP6+bpMEI+DR9/pfvw76PN2cpKH7
 OkjHEYAVWkhAy4yPNUoxlOSqOx/8+ZRMgjjr1rpViPALb+kQuwVQwmS3pC/A85Eo7Gq0
 TyhFCTdIbiHMeaMK6REq5ID73b7JVcY/nqMI7E8+DTuVCEe3CnWvkBXdTFi8u8JZH40E
 oy1QB1CVsUDxGHv1QrWw7wvB2g9tpEgVTXzi9yUw/CnjoI4ZhlNLkr//z3/cL6khKuyS
 IGyg==
X-Gm-Message-State: AOAM532lnJZBdCy1mcgr6QSiRNenAewnbakm2WlwBf73/cyo/PPgfjE9
 jbhrrBetcUhhgq/F44ucmfDY0JUxQ1tsWqkm+a0qeT79m+2lb3K2yzXtu80WLUttUNqN4W7+x5Z
 MDByip4bYIWlQDydgReq2xVAHxtWXwAAKwHyR7Q2hfQMkD1wcq0nP
X-Google-Smtp-Source: ABdhPJy3y6lVu608JZwMWCqEU4cTAop4UEqviqj2ETfbLC2pIxI44R8Ve0ldkhCdysU/qOw9TE9bSRg=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:da9a:e3bd:2fe6:1f1b])
 (user=dje job=sendgmr) by 2002:ad4:5907:: with SMTP id
 ez7mr6535575qvb.35.1622246027932; 
 Fri, 28 May 2021 16:53:47 -0700 (PDT)
Date: Fri, 28 May 2021 16:53:30 -0700
In-Reply-To: <20210528235331.3727583-1-dje@google.com>
Message-Id: <20210528235331.3727583-4-dje@google.com>
Mime-Version: 1.0
References: <20210528235331.3727583-1-dje@google.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
Subject: [PATCH v7 3/4] net/slirp.c: Refactor address parsing
From: Doug Evans <dje@google.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>, 
 "=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=" <marcandre.lureau@redhat.com>,
 Maxim Samoylov <max7255@yandex-team.ru>, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3i4KxYAMKCmIDJEGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--dje.bounces.google.com;
 helo=mail-qt1-x84a.google.com
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

Changes from v6:

Add support for --enable-slirp=system
Tested with system libslirp 4.4.0.

Changes from v5:

Use InetSocketAddress and getaddrinfo().
Use new libslirp calls: slirp_remove_hostxfwd, slirp_add_hostxfwd.

 include/qemu/sockets.h      |   2 +
 net/slirp.c                 | 236 ++++++++++++++++++++++++++----------
 tests/acceptance/hostfwd.py |  91 ++++++++++++++
 util/qemu-sockets.c         |  17 ++-
 4 files changed, 278 insertions(+), 68 deletions(-)
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
index ad3a838e0b..2349eb2c23 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -641,14 +641,106 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *id)
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
     const char *arg1 = qdict_get_str(qdict, "arg1");
     const char *arg2 = qdict_get_try_str(qdict, "arg2");
@@ -664,110 +756,130 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
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
 
-    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        goto fail_syntax;
-    }
-    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
+    if (parse_hostfwd_sockaddr(p, is_udp ? SOCK_DGRAM : SOCK_STREAM,
+                               &host_addr, &error) < 0) {
         goto fail_syntax;
     }
 
-    if (qemu_strtoi(p, NULL, 10, &host_port)) {
-        goto fail_syntax;
+#if SLIRP_CHECK_VERSION(4, 5, 0)
+    {
+        int flags = is_udp ? SLIRP_HOSTFWD_UDP : 0;
+        err = slirp_remove_hostxfwd(s->slirp, (struct sockaddr *) &host_addr,
+                                    sizeof(host_addr), flags);
     }
-
-    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
+#else
+    if (host_addr.ss_family != AF_INET) {
+        monitor_printf(mon,
+                       "Could not remove host forwarding rule '%s':"
+                       " only IPv4 supported",
+                       src_str);
+        return;
+    } else {
+        struct sockaddr_in *host_in_addr = (struct sockaddr_in *) &host_addr;
+        err = slirp_remove_hostfwd(s->slirp, is_udp,
+                                   host_in_addr->sin_addr,
+                                   ntohs(host_in_addr->sin_port));
+    }
+#endif
 
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
-        goto fail_syntax;
-    }
-    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
-        fail_reason = "Bad host address";
+    p = parse_protocol(p, &is_udp, &error);
+    if (p == NULL) {
         goto fail_syntax;
     }
 
     if (get_str_sep(buf, sizeof(buf), &p, '-') < 0) {
-        fail_reason = "Bad host port separator";
+        error_setg(&error, "missing host-guest separator");
         goto fail_syntax;
     }
-    host_port = strtol(buf, &end, 0);
-    if (*end != '\0' || host_port < 0 || host_port > 65535) {
-        fail_reason = "Bad host port";
+
+    if (parse_hostfwd_sockaddr(buf, is_udp ? SOCK_DGRAM : SOCK_STREAM,
+                               &host_addr, &error) < 0) {
+        error_prepend(&error, "For host address: ");
         goto fail_syntax;
     }
 
-    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
-        fail_reason = "Missing guest address";
+    if (parse_hostfwd_sockaddr(p, is_udp ? SOCK_DGRAM : SOCK_STREAM,
+                               &guest_addr, &error) < 0) {
+        error_prepend(&error, "For guest address: ");
         goto fail_syntax;
     }
-    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr)) {
-        fail_reason = "Bad guest address";
+    port = sockaddr_getport((struct sockaddr *) &guest_addr);
+    if (port == 0) {
+        error_setg(&error, "For guest address: invalid port '0'");
         goto fail_syntax;
     }
 
-    guest_port = strtol(p, &end, 0);
-    if (*end != '\0' || guest_port < 1 || guest_port > 65535) {
-        fail_reason = "Bad guest port";
-        goto fail_syntax;
+#if SLIRP_CHECK_VERSION(4, 5, 0)
+    {
+        int flags = is_udp ? SLIRP_HOSTFWD_UDP : 0;
+        if (slirp_add_hostxfwd(s->slirp,
+                               (struct sockaddr *) &host_addr,
+                               sizeof(host_addr),
+                               (struct sockaddr *) &guest_addr,
+                               sizeof(guest_addr),
+                               flags) < 0) {
+            error_setg(errp, "Could not set up host forwarding rule '%s': %s",
+                       redir_str, strerror(errno));
+            return -1;
+        }
     }
-
-    if (slirp_add_hostfwd(s->slirp, is_udp, host_addr, host_port, guest_addr,
-                          guest_port) < 0) {
-        error_setg(errp, "Could not set up host forwarding rule '%s'",
+#else
+    if (host_addr.ss_family != AF_INET || guest_addr.ss_family != AF_INET) {
+        error_setg(errp,
+                   "Could not set up host forwarding rule '%s':"
+                   " only IPv4 supported",
                    redir_str);
         return -1;
+    } else {
+        struct sockaddr_in *host_in_addr = (struct sockaddr_in *) &host_addr;
+        struct sockaddr_in *guest_in_addr = (struct sockaddr_in *) &guest_addr;
+        if (slirp_add_hostfwd(s->slirp, is_udp,
+                              host_in_addr->sin_addr,
+                              ntohs(host_in_addr->sin_port),
+                              guest_in_addr->sin_addr,
+                              ntohs(guest_in_addr->sin_port)) < 0) {
+            error_setg(errp, "Could not set up host forwarding rule '%s'",
+                       redir_str);
+            return -1;
+        }
     }
+#endif
+
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
index aa883eb84f..52fe056fbf 100644
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
2.32.0.rc0.204.g9fa02ecfa5-goog


