Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22E03EBEDC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:48:51 +0200 (CEST)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEguw-0000rz-QF
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34wMXYQMKClY1724CC492.0CAE2AI-12J29BCB4BI.CF4@flex--dje.bounces.google.com>)
 id 1mEgqt-0003VP-DG
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:44:39 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:54176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34wMXYQMKClY1724CC492.0CAE2AI-12J29BCB4BI.CF4@flex--dje.bounces.google.com>)
 id 1mEgqr-0003oK-Bm
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:44:39 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 v40-20020a25abab0000b02905938a82d807so10710896ybi.20
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 16:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=8ZZayAidmPUQDV0tyDxng6Qz9QMwPwCZfNg7G4F3Inc=;
 b=vqXz+7AnyVtqWmZVuKrnh5PDk1NGnNSo0xaTt62Rf11GiqfeTKauQFRKdm1L3Jalyh
 EhO7tMVDnTJ1OUGNaquGLgz1gbJfWe6TvIgI42b055w6zMTvjHfUKMFCNCL32CM7eQ7g
 /R1C8tmyWovu79scNaT6rbE2CP3lMaJmonJ9rMy/UPsF+TQrPuuOvuK3k8J7zAM1rXQV
 FO0KNDwk/jXJZroO5OLayOEyPTrbXJJ87zECIdNgpEyQzFJOq7Yy07RpfEH2uv49surI
 pq5m8YJ5/GoAsfsz+1J4zaHsaiCeTc36ICVrmSwKzQMzpDpiqsCUy9thRIa/RvFSLy56
 evCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8ZZayAidmPUQDV0tyDxng6Qz9QMwPwCZfNg7G4F3Inc=;
 b=q2AylnjSXOOEiZmHrwM/gyXsEy4qorwTOKDfB/RrYGEBcxqpmjO3fc1lG+g+HD0Z8M
 6wGtTqp/aorEjeIf9Zon1SPvZ5BgsLAxtvRJLYRFW6fASLSP2dEsKzqecAHN10TbcX9j
 5Z7QY0znlMslppPGJ9LF9F31p/2d2dltAZhiZA1GyQE34/mJ/K8KJmtlqRDnfmweRQwE
 jxTgmU6/Qh0+1T2LVT9ZiJK4TtGmbJSpeo96TFf9qWdlbpuZNIRI2mSNdyTTkalhF7ET
 qAIHNULNnZkfmmvqjmV5r29EIq9APhntlJt+ZIcdyxJ2WsmPeP8gjn0bclAS3fP3xkyq
 lpdg==
X-Gm-Message-State: AOAM530c+PRyJTmvw8r5ydGxOwzkcLA1NQmCalrJJYxHVHd1ELD10Zia
 dQ8tsQL90JI43eBtTofQBTu43B0CY60CTm8XghioxxnnRRQSfLFSNrILN7NKsiQZe19V6zHEg8j
 rVZaUVZ7bWoFAgetMEPYvy5CIBsZ9+oSZYmqzBSkUx4z7a6TbJFe2
X-Google-Smtp-Source: ABdhPJx5YSSO9PqFP1nFeNRTWwZwLlPOWSbUOQIVVWuE9WH9KkmHBquLJX6Ur5Hs5dD5meko0kA1M9Y=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:94ae:6a1e:bc04:4f63])
 (user=dje job=sendgmr) by 2002:a25:ad18:: with SMTP id
 y24mr6255076ybi.50.1628898275596; 
 Fri, 13 Aug 2021 16:44:35 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:44:24 -0700
In-Reply-To: <20210813234424.2029019-1-dje@google.com>
Message-Id: <20210813234424.2029019-4-dje@google.com>
Mime-Version: 1.0
References: <20210813234424.2029019-1-dje@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH v8 3/3] net: Extend host forwarding to support IPv6
From: Doug Evans <dje@google.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=34wMXYQMKClY1724CC492.0CAE2AI-12J29BCB4BI.CF4@flex--dje.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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

Net option "-hostfwd" now supports IPv6 addresses.
Commands hostfwd_add, hostfwd_remove now support IPv6 addresses.

Tested:
avocado run tests/acceptance/hostfwd.py

Signed-off-by: Doug Evans <dje@google.com>
---

Changes from v7:

No changes.

Changes from v6:

No changes.

Changes from v5:

Recognize ipv4=,ipv6= options.

 hmp-commands.hx             | 18 ++++++-
 net/slirp.c                 | 54 +++++++++++++++++----
 tests/acceptance/hostfwd.py | 94 +++++++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+), 11 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8e45bce2cd..a787bf8185 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1326,7 +1326,8 @@ ERST
     {
         .name       = "hostfwd_add",
         .args_type  = "arg1:s,arg2:s?",
-        .params     = "[netdev_id] [tcp|udp]:[hostaddr]:hostport-[guestaddr]:guestport",
+        .params     = "[netdev_id] [tcp|udp]:[hostaddr]:hostport\n"
+                      "[,ipv4=on|off][,ipv6=on|off]-[guestaddr]:guestport",
         .help       = "redirect TCP or UDP connections from host to guest (requires -net user)",
         .cmd        = hmp_hostfwd_add,
     },
@@ -1334,13 +1335,20 @@ ERST
 SRST
 ``hostfwd_add``
   Redirect TCP or UDP connections from host to guest (requires -net user).
+  IPV6 addresses are wrapped in square brackets, IPV4 addresses are not.
+
+  Examples:
+  hostfwd_add net0 tcp:127.0.0.1:10022-:22
+  hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22
+  hostfwd_add net0 ::10022,ipv6-:22
 ERST
 
 #ifdef CONFIG_SLIRP
     {
         .name       = "hostfwd_remove",
         .args_type  = "arg1:s,arg2:s?",
-        .params     = "[netdev_id] [tcp|udp]:[hostaddr]:hostport",
+        .params     = "[netdev_id] [tcp|udp]:[hostaddr]:hostport\n"
+                      "[,ipv4=on|off][,ipv6=on|off]",
         .help       = "remove host-to-guest TCP or UDP redirection",
         .cmd        = hmp_hostfwd_remove,
     },
@@ -1349,6 +1357,12 @@ ERST
 SRST
 ``hostfwd_remove``
   Remove host-to-guest TCP or UDP redirection.
+  IPV6 addresses are wrapped in square brackets, IPV4 addresses are not.
+
+  Examples:
+  hostfwd_remove net0 tcp:127.0.0.1:10022
+  hostfwd_remove net0 tcp:[::1]:10022
+  hostfwd_remove net0 ::10022,ipv6
 ERST
 
     {
diff --git a/net/slirp.c b/net/slirp.c
index 2349eb2c23..075a283d35 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -664,25 +664,55 @@ static const char *parse_protocol(const char *str, bool *is_udp,
     return p;
 }
 
-static int parse_hostfwd_sockaddr(const char *str, int socktype,
+static int parse_hostfwd_sockaddr(const char *str, int family, int socktype,
                                   struct sockaddr_storage *saddr,
-                                  Error **errp)
+                                  bool *v6_only, Error **errp)
 {
     struct addrinfo hints, *res = NULL, *e;
     InetSocketAddress *addr = g_new(InetSocketAddress, 1);
     int gai_rc;
     int rc = -1;
+    Error *err = NULL;
 
     const char *optstr = inet_parse_host_port(addr, str, errp);
     if (optstr == NULL) {
         goto fail_return;
     }
 
+    if (inet_parse_ipv46(addr, optstr, errp) < 0) {
+        goto fail_return;
+    }
+
+    if (v6_only) {
+        bool v4 = addr->has_ipv4 && addr->ipv4;
+        bool v6 = addr->has_ipv6 && addr->ipv6;
+        *v6_only = v6 && !v4;
+    }
+
     memset(&hints, 0, sizeof(hints));
     hints.ai_flags = AI_PASSIVE; /* ignored if host is not ""(->NULL) */
     hints.ai_flags |= AI_NUMERICHOST | AI_NUMERICSERV;
     hints.ai_socktype = socktype;
-    hints.ai_family = PF_INET;
+    hints.ai_family = inet_ai_family_from_address(addr, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto fail_return;
+    }
+    if (family != PF_UNSPEC) {
+        /* Guest must use same family as host (for now). */
+        if (hints.ai_family != PF_UNSPEC && hints.ai_family != family) {
+            error_setg(errp,
+                       "unexpected address family for %s: expecting %s",
+                       str, family == PF_INET ? "ipv4" : "ipv6");
+            goto fail_return;
+        }
+        hints.ai_family = family;
+    }
+
+    /* For backward compatibility, treat an empty host spec as IPv4. */
+    if (*addr->host == '\0' && hints.ai_family == PF_UNSPEC) {
+        hints.ai_family = PF_INET;
+    }
 
     /*
      * Calling getaddrinfo for guest addresses is dubious, but addresses are
@@ -764,8 +794,8 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
         goto fail_syntax;
     }
 
-    if (parse_hostfwd_sockaddr(p, is_udp ? SOCK_DGRAM : SOCK_STREAM,
-                               &host_addr, &error) < 0) {
+    if (parse_hostfwd_sockaddr(p, PF_UNSPEC, is_udp ? SOCK_DGRAM : SOCK_STREAM,
+                               &host_addr, /*v6_only=*/NULL, &error) < 0) {
         goto fail_syntax;
     }
 
@@ -807,6 +837,7 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
     bool is_udp;
     Error *error = NULL;
     int port;
+    bool v6_only;
 
     g_assert(redir_str != NULL);
     p = redir_str;
@@ -821,14 +852,16 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
         goto fail_syntax;
     }
 
-    if (parse_hostfwd_sockaddr(buf, is_udp ? SOCK_DGRAM : SOCK_STREAM,
-                               &host_addr, &error) < 0) {
+    if (parse_hostfwd_sockaddr(buf, PF_UNSPEC,
+                               is_udp ? SOCK_DGRAM : SOCK_STREAM,
+                               &host_addr, &v6_only, &error) < 0) {
         error_prepend(&error, "For host address: ");
         goto fail_syntax;
     }
 
-    if (parse_hostfwd_sockaddr(p, is_udp ? SOCK_DGRAM : SOCK_STREAM,
-                               &guest_addr, &error) < 0) {
+    if (parse_hostfwd_sockaddr(p, host_addr.ss_family,
+                               is_udp ? SOCK_DGRAM : SOCK_STREAM,
+                               &guest_addr, /*v6_only=*/NULL, &error) < 0) {
         error_prepend(&error, "For guest address: ");
         goto fail_syntax;
     }
@@ -841,6 +874,9 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
 #if SLIRP_CHECK_VERSION(4, 5, 0)
     {
         int flags = is_udp ? SLIRP_HOSTFWD_UDP : 0;
+        if (v6_only) {
+            flags |= SLIRP_HOSTFWD_V6ONLY;
+        }
         if (slirp_add_hostxfwd(s->slirp,
                                (struct sockaddr *) &host_addr,
                                sizeof(host_addr),
diff --git a/tests/acceptance/hostfwd.py b/tests/acceptance/hostfwd.py
index 9b9db142c3..f8493c5bdc 100644
--- a/tests/acceptance/hostfwd.py
+++ b/tests/acceptance/hostfwd.py
@@ -37,6 +37,17 @@ def test_qmp_hostfwd_ipv4(self):
         self.assertEquals(self.hmc('hostfwd_add udp::65042-:42'), '')
         self.assertEquals(self.hmc('hostfwd_remove udp::65042'),
                           'host forwarding rule for udp::65042 removed\r\n')
+        self.assertEquals(self.hmc('hostfwd_add vnet tcp::65022,ipv4-:22'), '')
+        self.assertEquals(self.hmc('hostfwd_remove vnet tcp::65022,ipv4'),
+                          'host forwarding rule for tcp::65022,ipv4 removed\r\n')
+        self.assertEquals(self.hmc('hostfwd_add vnet tcp::65022,ipv4=on-:22'),
+                          '')
+        self.assertEquals(self.hmc('hostfwd_remove vnet tcp::65022,ipv4=on'),
+                          'host forwarding rule for tcp::65022,ipv4=on removed\r\n')
+        self.assertEquals(self.hmc('hostfwd_add vnet tcp::65022,ipv6=off-:22'),
+                          '')
+        self.assertEquals(self.hmc('hostfwd_remove vnet tcp::65022,ipv6=off'),
+                          'host forwarding rule for tcp::65022,ipv6=off removed\r\n')
 
     def test_qmp_hostfwd_ipv4_functional_errors(self):
         """Verify handling of various kinds of errors given valid addresses."""
@@ -89,3 +100,86 @@ def test_qmp_hostfwd_ipv4_parsing_errors(self):
         self.assertEquals(self.hmc('hostfwd_add ::66-:0'),
                           "Invalid host forwarding rule '::66-:0'" + \
                           " (For guest address: invalid port '0')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add vnet tcp::65022,ipv4=abc-:22'),
+                          "Invalid host forwarding rule" + \
+                          " 'tcp::65022,ipv4=abc-:22' (For host address:" + \
+                          " error parsing 'ipv4' flag '=abc')\r\n")
+
+    def test_qmp_hostfwd_ipv6(self):
+        self.vm.add_args('-nodefaults',
+                         '-netdev', 'user,id=vnet',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.launch()
+        self.assertEquals(self.hmc('hostfwd_add vnet tcp:[::1]:65022-[fe80::1]:22'),
+                          '')
+        self.assertEquals(self.hmc('hostfwd_remove vnet tcp:[::1]:65022'),
+                          'host forwarding rule for tcp:[::1]:65022 removed\r\n')
+        self.assertEquals(self.hmc('hostfwd_add udp:[::1]:65042-[fe80::1]:42'),
+                          '')
+        self.assertEquals(self.hmc('hostfwd_remove udp:[::1]:65042'),
+                          'host forwarding rule for udp:[::1]:65042 removed\r\n')
+        self.assertEquals(self.hmc('hostfwd_add vnet tcp::65022,ipv6=on-:22'), '')
+        self.assertEquals(self.hmc('hostfwd_remove vnet tcp::65022,ipv6=on'),
+                          'host forwarding rule for tcp::65022,ipv6=on removed\r\n')
+        self.assertEquals(self.hmc('hostfwd_add vnet tcp::65022,ipv4=off-:22'), '')
+        self.assertEquals(self.hmc('hostfwd_remove vnet tcp::65022,ipv4=off'),
+                          'host forwarding rule for tcp::65022,ipv4=off removed\r\n')
+
+    def test_qmp_hostfwd_ipv6_functional_errors(self):
+        """Verify handling of various kinds of errors given valid addresses."""
+        self.vm.add_args('-nodefaults',
+                         '-netdev', 'user,id=vnet',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.launch()
+        self.assertEquals(self.hmc('hostfwd_remove :[::1]:65022'),
+                          'host forwarding rule for :[::1]:65022 not found\r\n')
+        self.assertEquals(self.hmc('hostfwd_add udp:[::1]:65042-[fe80::1]:42'),
+                          '')
+        self.assertEquals(self.hmc('hostfwd_add udp:[::1]:65042-[fe80::1]:42'),
+                          "Could not set up host forwarding rule" + \
+                          " 'udp:[::1]:65042-[fe80::1]:42': Address already in use\r\n")
+        self.assertEquals(self.hmc('hostfwd_remove :[::1]:65042'),
+                          'host forwarding rule for :[::1]:65042 not found\r\n')
+        self.assertEquals(self.hmc('hostfwd_remove udp:[::1]:65042'),
+                          'host forwarding rule for udp:[::1]:65042 removed\r\n')
+        self.assertEquals(self.hmc('hostfwd_remove udp:[::1]:65042'),
+                          'host forwarding rule for udp:[::1]:65042 not found\r\n')
+
+    def test_qmp_hostfwd_ipv6_errors(self):
+        """Verify handling of various kinds of errors."""
+        self.vm.add_args('-nodefaults',
+                         '-netdev', 'user,id=vnet',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.launch()
+        self.assertEquals(self.hmc('hostfwd_add :[::1-'),
+                          "Invalid host forwarding rule ':[::1-'" + \
+                          " (For host address: error parsing IPv6 address '[::1')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]:66-[fe80::1'),
+                          "Invalid host forwarding rule ':[::1]:66-[fe80::1'" + \
+                          " (For guest address: error parsing IPv6 address" + \
+                          " '[fe80::1')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[:::]:66-foo'),
+                          "Invalid host forwarding rule ':[:::]:66-foo'" + \
+                          " (For host address: address resolution failed for" + \
+                          " '[:::]:66': Name or service not known)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]-foo'),
+                          "Invalid host forwarding rule ':[::1]-foo'" + \
+                          " (For host address: error parsing IPv6 address '[::1]')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]:66-[foo]'),
+                          "Invalid host forwarding rule ':[::1]:66-[foo]'" + \
+                          " (For guest address: error parsing IPv6 address '[foo]')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]:66-[fe80::1]:0'),
+                          "Invalid host forwarding rule ':[::1]:66-[fe80::1]:0'" + \
+                          " (For guest address: invalid port '0')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]:66-1.2.3.4:66'),
+                          "Invalid host forwarding rule ':[::1]:66-1.2.3.4:66'" + \
+                          " (For guest address: address resolution failed for" + \
+                          " '1.2.3.4:66': Address family for hostname not supported)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :1.2.3.4:66-[fe80::1]:66'),
+                          "Invalid host forwarding rule ':1.2.3.4:66-[fe80::1]:66'" + \
+                          " (For guest address: address resolution failed for" + \
+                          " '[fe80::1]:66': Address family for hostname not" + \
+                          " supported)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add vnet tcp::65022,ipv6=abc-:22'),
+                          "Invalid host forwarding rule 'tcp::65022,ipv6=abc-:22'" + \
+                          " (For host address: error parsing 'ipv6' flag '=abc')\r\n")
-- 
2.33.0.rc1.237.g0d66db33f3-goog


