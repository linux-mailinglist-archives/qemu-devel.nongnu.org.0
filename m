Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B6C320226
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:18:26 +0100 (CET)
Received: from localhost ([::1]:40502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDFyb-0006TI-O0
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3MVQwYAMKCqIFLGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--dje.bounces.google.com>)
 id 1lDFu2-0000gX-VQ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:42 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:50821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3MVQwYAMKCqIFLGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--dje.bounces.google.com>)
 id 1lDFu0-0005Tl-9o
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:42 -0500
Received: by mail-pj1-x104a.google.com with SMTP id me5so4674336pjb.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 16:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=FQeIi349Douf5mLeGHfD41Z7YRFz4ase8V++WPVO8f4=;
 b=iOyJu+h66Ijue6r4c91KQfu4pS8vNYX7EVWGTPYVbXFrXMaNHJhDrQpgG5dnhKHAJ0
 1oNxzHyj+KT4mnb03LEjSDQTFO6C9Bf4NLh3mLS2T26Ejp3Eh/FCsBR3Jdg/0BF7R9ee
 xM/nxHeLKh7qiiBX6i0655o/i3FPOrsQ+MFjx2Q4hDPcMDEIOgJgypLwbc4estCCXOah
 DoTtJLny8Vt+Wgly+hJ/j5T3774e+BXB2thPpUbpvPPvLpZ0zofjJc4QbvPUpwczRn8t
 PybSBd+Njash0r+8CbdwQaPM843rXj9O1ngYVzF6cIlD2gjDyDzNcf1C3m/GEaUyP452
 DqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=FQeIi349Douf5mLeGHfD41Z7YRFz4ase8V++WPVO8f4=;
 b=Al9xllo/b+rQUikLhG6izdWpLWA1BGfkvWzFQIw5nM+zGnShOS/s2Sb6I8E9qrB0SG
 YbM9/isgEI5Qbd9uyCKKRa6zctpZqZ/NEVV9QyP5mI6z8jXq0+1kaxIVLX/j8DkomEtw
 Jrjf4RVj7yP6hxMdKy8Zb72BWREupTkNY80HG3UsnByH+NsrsI8WVRknTwZos6COEl6M
 61NCbGa5vV0M6KVg/ifSAYTNt6tIhLTPo0Hw5zUQ45X6tHusp08WkG0I2x0OzmMwrAhs
 iWJzCYt9oOUbcifnrxT8EVXtgCZAoAE1lWg7C7KlC5CgEGL4XHOXRmD1VRccFS9Ob55z
 T08A==
X-Gm-Message-State: AOAM530eavbUWTPxZ3wBojL/24A0tZ3B2JwsUAw3Hyc0+opd708zW/eg
 Ol7+9NKDWXjPLWeXUAo6lAgfl09j0AK+r1YmjxxOF+yfu9URxnXJvvEdyi3awdZPAlpL6tdk8s2
 1e6pR+z9nH3BxrsdE8/a1P/u/veaDNGmyGYdkd4KKrlfla+ses3tW
X-Google-Smtp-Source: ABdhPJwdZU8sQN8ijI5Q/+hID+YJH6IeFjAggQph0JenM7GjIHtyuFP/U6alB6dvJWduof3UEkZSoo0=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:7d06:9b98:ec95:3f70])
 (user=dje job=sendgmr) by 2002:a17:90b:4ac8:: with SMTP id
 mh8mr12006466pjb.38.1613780017796; Fri, 19 Feb 2021 16:13:37 -0800 (PST)
Date: Fri, 19 Feb 2021 16:13:22 -0800
In-Reply-To: <20210220001322.1311139-1-dje@google.com>
Message-Id: <20210220001322.1311139-6-dje@google.com>
Mime-Version: 1.0
References: <20210220001322.1311139-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v5 5/5] net: Extend host forwarding to support IPv6
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3MVQwYAMKCqIFLGIQQING.EQOSGOW-FGXGNPQPIPW.QTI@flex--dje.bounces.google.com;
 helo=mail-pj1-x104a.google.com
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

Net option "-hostfwd" now supports IPv6 addresses.
Commands hostfwd_add, hostfwd_remove now support IPv6 addresses.

Signed-off-by: Doug Evans <dje@google.com>
---

Changes from v4:
- was 4/4 in v4
- fix some formatting issues

Differences from v3:
- this patch renamed from 3/3 to 4/4
- ipv6 support added to existing hostfwd option, commands
  - instead of creating new ipv6 option, commands
- added tests to tests/acceptance/hostfwd.py

Differences from v2:
- clarify spelling of ipv6 addresses in docs
- tighten parsing of ipv6 addresses

Differences from v1:
- parsing refactor split out into separate patch (2/3)

 hmp-commands.hx             | 15 +++++++
 net/slirp.c                 | 77 +++++++++++++++++++++++++----------
 tests/acceptance/hostfwd.py | 80 +++++++++++++++++++++++++++++++++++++
 3 files changed, 150 insertions(+), 22 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index d4001f9c5d..4de4e4979d 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1375,6 +1375,16 @@ ERST
 SRST
 ``hostfwd_add``
   Redirect TCP or UDP connections from host to guest (requires -net user).
+  IPV6 addresses are wrapped in square brackes, IPV4 addresses are not.
+
+  Examples:
+  hostfwd_add net0 tcp:127.0.0.1:10022-:22
+  hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22
+
+  Note that Libslirp currently only provides a "stateless" DHCPv6 server, a
+  consequence of which is that it cannot do the "addr-any" translation to the
+  guest address that is done for IPv4. In other words, the following is
+  currently not supported: hostfwd_add net0 tcp:[::1]:10022-:22
 ERST
 
 #ifdef CONFIG_SLIRP
@@ -1390,6 +1400,11 @@ ERST
 SRST
 ``hostfwd_remove``
   Remove host-to-guest TCP or UDP redirection.
+  IPV6 addresses are wrapped in square brackes, IPV4 addresses are not.
+
+  Examples:
+  hostfwd_remove net0 tcp:127.0.0.1:10022
+  hostfwd_remove net0 tcp:[::1]:10022
 ERST
 
     {
diff --git a/net/slirp.c b/net/slirp.c
index e0284492b9..32df65c1f0 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -96,6 +96,11 @@ typedef struct SlirpState {
     GSList *fwd;
 } SlirpState;
 
+union in4or6_addr {
+    struct in_addr addr4;
+    struct in6_addr addr6;
+};
+
 static struct slirp_config_str *slirp_configs;
 static QTAILQ_HEAD(, SlirpState) slirp_stacks =
     QTAILQ_HEAD_INITIALIZER(slirp_stacks);
@@ -663,32 +668,40 @@ static const char *parse_protocol(const char *str, int sep, bool *is_udp,
 
 /*
  * Parse an ip address/port of the form "address:port<terminator>".
- * An empty address means INADDR_ANY.
+ * IPv6 addresses are wrapped in [] brackets.
+ * An empty address means INADDR_ANY/in6addr_any.
  * Returns a pointer to after the terminator, unless it was '\0' in which case
  * the result points to the '\0'.
- * The parsed results are stored in *addr, *port.
+ * The parsed results are stored in *addr, *port, *is_v6.
  * On error NULL is returned and stores the error in *errp.
  */
 static const char *parse_ip_addr_and_port(const char *str, int terminator,
-                                          struct in_addr *addr, int *port,
-                                          Error **errp)
+                                          union in4or6_addr *addr, int *port,
+                                          bool *is_v6, Error **errp)
 {
     g_autofree char *addr_str = NULL;
     g_autofree char *port_str = NULL;
-    bool is_v6;
     const char *p = inet_parse_host_and_port(str, terminator, &addr_str,
-                                             &port_str, &is_v6, errp);
+                                             &port_str, is_v6, errp);
 
     if (p == NULL) {
         return NULL;
     }
 
-    /* Ignore is_v6 for the moment, if inet_aton fails let it. */
-    if (addr_str[0] == '\0') {
-        addr->s_addr = INADDR_ANY;
-    } else if (!inet_aton(addr_str, addr)) {
-        error_setg(errp, "Bad address");
-        return NULL;
+    if (*is_v6) {
+        if (addr_str[0] == '\0') {
+            addr->addr6 = in6addr_any;
+        } else if (!inet_pton(AF_INET6, addr_str, &addr->addr6)) {
+            error_setg(errp, "Bad address");
+            return NULL;
+        }
+    } else {
+        if (addr_str[0] == '\0') {
+            addr->addr4.s_addr = INADDR_ANY;
+        } else if (!inet_pton(AF_INET, addr_str, &addr->addr4)) {
+            error_setg(errp, "Bad address");
+            return NULL;
+        }
     }
 
     if (qemu_strtoi(port_str, NULL, 10, port) < 0 ||
@@ -709,11 +722,11 @@ static const char *parse_ip_addr_and_port(const char *str, int terminator,
 
 void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
 {
-    struct in_addr host_addr;
+    union in4or6_addr host_addr;
     int host_port;
     const char *src_str, *p;
     SlirpState *s;
-    bool is_udp;
+    bool is_udp, is_v6;
     int err;
     Error *error = NULL;
     const char *arg1 = qdict_get_str(qdict, "arg1");
@@ -738,11 +751,18 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
         goto fail_syntax;
     }
 
-    if (parse_ip_addr_and_port(p, '\0', &host_addr, &host_port,
+    if (parse_ip_addr_and_port(p, '\0', &host_addr, &host_port, &is_v6,
                                &error) == NULL) {
         goto fail_syntax;
     }
-    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
+
+    if (is_v6) {
+        err = slirp_remove_ipv6_hostfwd(s->slirp, is_udp, host_addr.addr6,
+                                        host_port);
+    } else {
+        err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr.addr4,
+                                   host_port);
+    }
 
     monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
                    err ? "not found" : "removed");
@@ -755,11 +775,12 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
 
 static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
 {
-    struct in_addr host_addr, guest_addr;
+    union in4or6_addr host_addr, guest_addr;
     int host_port, guest_port;
     const char *p;
-    bool is_udp;
+    bool is_udp, host_is_v6, guest_is_v6;
     Error *error = NULL;
+    int err;
 
     g_assert(redir_str != NULL);
     p = redir_str;
@@ -769,24 +790,36 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
         goto fail_syntax;
     }
 
-    p = parse_ip_addr_and_port(p, '-', &host_addr, &host_port, &error);
+    p = parse_ip_addr_and_port(p, '-', &host_addr, &host_port, &host_is_v6,
+                               &error);
     if (p == NULL) {
         error_prepend(&error, "For host address: ");
         goto fail_syntax;
     }
 
-    if (parse_ip_addr_and_port(p, '\0', &guest_addr, &guest_port,
+    if (parse_ip_addr_and_port(p, '\0', &guest_addr, &guest_port, &guest_is_v6,
                                &error) == NULL) {
         error_prepend(&error, "For guest address: ");
         goto fail_syntax;
     }
+    if (host_is_v6 != guest_is_v6) {
+        /* TODO: Can libslirp support this? */
+        error_setg(&error, "Both host,guest must be one of ipv4 or ipv6");
+        goto fail_syntax;
+    }
     if (guest_port == 0) {
         error_setg(&error, "For guest address: Bad port");
         goto fail_syntax;
     }
 
-    if (slirp_add_hostfwd(s->slirp, is_udp, host_addr, host_port, guest_addr,
-                          guest_port) < 0) {
+    if (host_is_v6) {
+        err = slirp_add_ipv6_hostfwd(s->slirp, is_udp, host_addr.addr6,
+                                     host_port, guest_addr.addr6, guest_port);
+    } else {
+        err = slirp_add_hostfwd(s->slirp, is_udp, host_addr.addr4, host_port,
+                                guest_addr.addr4, guest_port);
+    }
+    if (err < 0) {
         error_setg(errp, "Could not set up host forwarding rule '%s'",
                    redir_str);
         return -1;
diff --git a/tests/acceptance/hostfwd.py b/tests/acceptance/hostfwd.py
index e5602a7708..d4c4b7b86d 100644
--- a/tests/acceptance/hostfwd.py
+++ b/tests/acceptance/hostfwd.py
@@ -92,3 +92,83 @@ def test_qmp_hostfwd_ipv4_parsing_errors(self):
         self.assertEquals(self.hmc('hostfwd_add ::66-:0'),
                           "Invalid host forwarding rule '::66-:0' "
                           "(For guest address: Bad port)\r\n")
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
+        self.assertEquals(self.hmc('hostfwd_add tcp:[]:65042-[fe80::1]:42'),
+                          '')
+        self.assertEquals(self.hmc('hostfwd_remove tcp:[]:65042'),
+                          'host forwarding rule for tcp:[]:65042 removed\r\n')
+        self.assertEquals(self.hmc('hostfwd_add udp:[::1]:65042-[fe80::1]:42'),
+                          '')
+        self.assertEquals(self.hmc('hostfwd_remove udp:[::1]:65042'),
+                          'host forwarding rule for udp:[::1]:65042 removed\r\n')
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
+                          "Could not set up host forwarding rule "
+                          "'udp:[::1]:65042-[fe80::1]:42'\r\n")
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
+                          "Invalid host forwarding rule ':[::1-' "
+                          "(For host address: error parsing IPv6 address '[::1')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]:66-[fe80::1'),
+                          "Invalid host forwarding rule ':[::1]:66-[fe80::1' "
+                          "(For guest address: error parsing IPv6 address "
+                          "'[fe80::1')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[:::]:66-foo'),
+                          "Invalid host forwarding rule ':[:::]:66-foo' "
+                          "(For host address: Bad address)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]-foo'),
+                          "Invalid host forwarding rule ':[::1]-foo' "
+                          "(For host address: error parsing IPv6 address '[::1]')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]:66-[foo]'),
+                          "Invalid host forwarding rule ':[::1]:66-[foo]' "
+                          "(For guest address: error parsing IPv6 address '[foo]')\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]:66666-foo'),
+                          "Invalid host forwarding rule ':[::1]:66666-foo' "
+                          "(For host address: Bad port)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]:66-[fe80::1]:-1'),
+                          "Invalid host forwarding rule "
+                          "':[::1]:66-[fe80::1]:-1' (For guest address: Bad port)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]:66-[fe80::1]:66666'),
+                          "Invalid host forwarding rule "
+                          "':[::1]:66-[fe80::1]:66666' (For guest address: Bad port)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]:66-[fe80::1]:0'),
+                          "Invalid host forwarding rule "
+                          "':[::1]:66-[fe80::1]:0' (For guest address: Bad port)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :[::1]:66-1.2.3.4:66'),
+                          "Invalid host forwarding rule ':[::1]:66-1.2.3.4:66' "
+                          "(Both host,guest must be one of ipv4 or ipv6)\r\n")
+        self.assertEquals(self.hmc('hostfwd_add :1.2.3.4:66-[fe80::1]:66'),
+                          "Invalid host forwarding rule "
+                          "':1.2.3.4:66-[fe80::1]:66' (Both host,guest must be "
+                          "one of ipv4 or ipv6)\r\n")
-- 
2.30.0.617.g56c4b15f3c-goog


