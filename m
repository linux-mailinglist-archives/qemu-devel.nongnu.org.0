Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B493D3FF58E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 23:21:51 +0200 (CEST)
Received: from localhost ([::1]:46032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLu9e-0002Ai-AR
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 17:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GUAxYQMKCm4PVQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--dje.bounces.google.com>)
 id 1mLu8K-0001QC-Vx
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 17:20:29 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:51943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GUAxYQMKCm4PVQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--dje.bounces.google.com>)
 id 1mLu8J-0002Nt-9L
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 17:20:28 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 w8-20020a259188000000b0059bf0bed21fso4219350ybl.18
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=07NeH2JHst/KC4vBMXguS5I+gq0H49ZH07YyrF/mZrc=;
 b=vQs893dm8htEOGWHMSpYUA4aFIFJyBfhYUuM68YBJ5Us+EfQSsLTQKHRVSGAX2kyS1
 uyrl4+YxkIQZAZQuUc0JgSlKh3HDYVaQKQBygsSImQ6GHng5vwqbWP6dLGVhiHUSyOUu
 jPVRKdO1ldibX/1hRn1rer/InzkiBAVcc1F8r5Bc3e/5d0GKujwhkiONxHAWfIQQ6Qaf
 ErxSiXRet3FOOPtclcK+Ruef5Dq25bU7p6gqusUVlyaiXSzHAYVoB2H3X41ym/LKsaKS
 jdbxzNJ/jgQ92Ojtr+QFeFY1DV1aQ4aCSP2kDGUiKFq89iJ261UKpFbJtHkt7rGNYuV7
 KGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=07NeH2JHst/KC4vBMXguS5I+gq0H49ZH07YyrF/mZrc=;
 b=kBLj+mjaD32lQzZ5Ct0/oYl0snnWtMOuVKtFwyPzkaYBnqX2EA06Un1uMmS29shtsD
 3ypl0oYytsTD2EFdOVFqmk0gHPYwgs9/AFjAT0OiqQgPzi37CZ42+Dmq0JLS3vhZgeBx
 QV6ZklEy6K8n7Q0CLbVsXw4Gbu3AU7lSyERlyoOxAqdE9PvsVjyeKwwY4k/f7AS5oE++
 2301S+I7FMVbvlvjIlaxPV3Dds0hsmNUywxCZ1pFhATmo3xBbJo9W1//61dHFHOFeW+F
 xzsf4z96H7uXmXVaN6/ci9l5DsfXdluANFYisPSTJx8Zk6i9GrQmwAnBSCP7touzB8Ol
 g1wg==
X-Gm-Message-State: AOAM530e/xfbUdmvDUNPBFPPhzTtMxHFkVDpH+zRpwVQY13FkC/m4qae
 R0Ywo+GGc/PoSIlyJd5a+2earUYjnnOPl9RbV3k8b7B/tjmNoQwmyllzDoP9dqU/3McUwVygBtz
 MpYWo0UkUJhU9o940Pahaw+qp/AVnTV9FNpX9cqqACoLtbCRRAJ7D
X-Google-Smtp-Source: ABdhPJwngmvbxeULBYIkHjgdKmh99qSuGOCGylXq4lKbsTBbFFa0K4LnzuS7qdXmuz4ZbVPxerCK0xE=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:5272:f5b2:802:3dd3])
 (user=dje job=sendgmr) by 2002:a25:d105:: with SMTP id
 i5mr595705ybg.388.1630617625495; 
 Thu, 02 Sep 2021 14:20:25 -0700 (PDT)
Date: Thu,  2 Sep 2021 14:20:15 -0700
Message-Id: <20210902212015.1303865-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH] net: Add "info neighbors" command
From: Doug Evans <dje@google.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Jason Wang <jasowang@redhat.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3GUAxYQMKCm4PVQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--dje.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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

This command dumps the ARP and NDP tables maintained within slirp.
One use-case for it is showing the guest's IPv6 address(es).

Signed-off-by: Doug Evans <dje@google.com>
---
 hmp-commands-info.hx               | 15 +++++++
 include/net/slirp.h                |  1 +
 net/slirp.c                        | 15 +++++++
 tests/acceptance/info_neighbors.py | 69 ++++++++++++++++++++++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 tests/acceptance/info_neighbors.py

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 27206ac049..386f09f163 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -512,6 +512,21 @@ SRST
     Show user network stack connection states.
 ERST
 
+#if defined(CONFIG_SLIRP)
+    {
+        .name       = "neighbors",
+        .args_type  = "",
+        .params     = "",
+        .help       = "show the ARP and NDP tables",
+        .cmd        = hmp_info_neighbors,
+    },
+#endif
+
+SRST
+  ``info neighbors``
+    Show the ARP and NDP tables.
+ERST
+
     {
         .name       = "migrate",
         .args_type  = "",
diff --git a/include/net/slirp.h b/include/net/slirp.h
index bad3e1e241..b9ccfda1e7 100644
--- a/include/net/slirp.h
+++ b/include/net/slirp.h
@@ -31,6 +31,7 @@ void hmp_hostfwd_add(Monitor *mon, const QDict *qdict);
 void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict);
 
 void hmp_info_usernet(Monitor *mon, const QDict *qdict);
+void hmp_info_neighbors(Monitor *mon, const QDict *qdict);
 
 #endif
 
diff --git a/net/slirp.c b/net/slirp.c
index ad3a838e0b..29a4cd3fe1 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -1028,6 +1028,21 @@ void hmp_info_usernet(Monitor *mon, const QDict *qdict)
     }
 }
 
+void hmp_info_neighbors(Monitor *mon, const QDict *qdict)
+{
+    SlirpState *s;
+
+    QTAILQ_FOREACH(s, &slirp_stacks, entry) {
+        int id;
+        bool got_hub_id = net_hub_id_for_client(&s->nc, &id) == 0;
+        char *info = slirp_neighbor_info(s->slirp);
+        monitor_printf(mon, "Hub %d (%s):\n%s",
+                       got_hub_id ? id : -1,
+                       s->nc.name, info);
+        g_free(info);
+    }
+}
+
 static void
 net_init_slirp_configs(const StringList *fwd, int flags)
 {
diff --git a/tests/acceptance/info_neighbors.py b/tests/acceptance/info_neighbors.py
new file mode 100644
index 0000000000..ff79ec3ff3
--- /dev/null
+++ b/tests/acceptance/info_neighbors.py
@@ -0,0 +1,69 @@
+# Test for the hmp command "info neighbors"
+#
+# Copyright 2021 Google LLC
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import re
+
+from avocado_qemu import LinuxTest
+from avocado_qemu import Test
+
+VNET_HUB_HEADER = 'Hub -1 (vnet):'
+NEIGHBOR_HEADER_REGEX = '^ *Table *MacAddr *IP Address$'
+
+def trim(text):
+    return " ".join(text.split())
+
+def hmc(test, cmd):
+    return test.vm.command('human-monitor-command', command_line=cmd)
+
+def get_neighbors(test):
+    output = hmc(test, 'info neighbors').splitlines()
+    if len(output) < 2:
+        test.fail("Insufficient output from 'info neighbors'")
+    test.assertEquals(output[0], VNET_HUB_HEADER)
+    test.assertTrue(re.fullmatch(NEIGHBOR_HEADER_REGEX, output[1]))
+    return output[2:]
+
+class InfoNeighborsNone(Test):
+
+    def test_no_neighbors(self):
+        self.vm.add_args('-nodefaults',
+                         '-netdev', 'user,id=vnet',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.launch()
+        neighbors = get_neighbors(self)
+        self.assertEquals(len(neighbors), 0)
+
+class InfoNeighbors(LinuxTest):
+
+    def test_neighbors(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=machine:pc
+        :avocado: tags=accel:kvm
+        """
+        self.require_accelerator('kvm')
+        self.vm.add_args("-accel", "kvm")
+        self.vm.add_args('-nographic',
+                         '-m', '1024')
+        self.launch_and_wait()
+
+        # Ensure there's some packets to the guest and back.
+        self.ssh_command('pwd')
+
+        # We should now be aware of the guest as a neighbor.
+        expected_ipv4_neighbor = 'ARP 52:54:00:12:34:56 10.0.2.15'
+        # The default ipv6 net is fec0. Both fe80 and fec0 can appear.
+        expected_ipv6_neighbors = [
+            'NDP 52:54:00:12:34:56 fe80::5054:ff:fe12:3456',
+            'NDP 52:54:00:12:34:56 fec0::5054:ff:fe12:3456'
+        ]
+        neighbors = get_neighbors(self)
+        self.assertTrue(len(neighbors) >= 2 and len(neighbors) <= 3)
+        # IPv4 is output first.
+        self.assertEquals(trim(neighbors[0]), expected_ipv4_neighbor)
+        for neighbor in neighbors[1:]:
+            self.assertTrue(trim(neighbor) in expected_ipv6_neighbors)
-- 
2.33.0.153.gba50c8fa24-goog


