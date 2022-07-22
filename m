Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AE357E715
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:11:52 +0200 (CEST)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEy3z-0001lB-5X
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxw-00072x-BN
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:37 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:45285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oExxu-0005IZ-9j
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:05:35 -0400
Received: from thinkpad.redhat.com ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MXGak-1o00FF2LgE-00YmO2; Fri, 22 Jul 2022 21:04:47 +0200
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v7 02/14] net: remove the @errp argument of net_client_inits()
Date: Fri, 22 Jul 2022 21:04:30 +0200
Message-Id: <20220722190442.301310-3-lvivier@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722190442.301310-1-lvivier@redhat.com>
References: <20220722190442.301310-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4KWCMWFzK8aE43ToMQWexc+rxFUvnSO4o6ys1POS14kdMfq+EqU
 QDl0i2dXRNndwPjzHuqGHN+aMwTv3nXx/QY8ynEeJqspLcIgV+eWzJmSHFilqrhQZQN1CBA
 rQK1Vp/mfHIXhnWU+sScvyefPtjsq1tcNV4QjUy0fOUZGeIlLftbCTr1A1dIovwx9ax1xIU
 2Pa46z9VMFmeJCJBdkRqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6bp4zs6BPMI=:/2K9Vx9EzSp6JLa+26VClz
 y51x/NdjkrgIAdvMkjasBX6k5CrahtU0wx116nARPE+bBHeBTYNtQWqzxOH+A38TtuO7MncmB
 kV5/xPf3pr0YyHR1J9/pQC8DYfFqCHII5KrZ0P2kK5Bi2XO8zFe6sJUhmgqWUn133k9zZa5Hj
 jgzTGDQlSR7CvJP3fkOmSWde+waW3QlpueXqyXHqvX/e72NEl0TcQOQmNUrOkfPIkVuJU0wDq
 GqQqFEwOrqsIURsygD5WaTuc47nEBP0BXnN1HLXMufgektzkTHy5V4tpgARae6Hsy3YpRP4DL
 wU+YWQwt9RNN1ut8YmJI4EOdHYvHisyG9rH4oBojNprnknrAg3S9Nf+JsgVt6uUP0QLZpnpqe
 oR9JDUcNW6ktz+2RYZvBho3YYvQRBop51QNsMFXPa/g1Qm2aIFVPc+I1dw2rANBO1mX2mhxAj
 GqUaXJ4JBsjzDFn5v4X9NJTQT8CZIHGsaIB2PisnjYMZXameCdFpHAuKFThSoVcjkEnvWddVv
 6NE7m3OKCpwAK6HIFH6nyzgNxq13bUMKbsX+lLMZ9ikBnEqLWPsoiCzg7GWy+9E8Tzd0g1ZTc
 3O/CYvBvXG2JQgqOjNVTMJ11S1p4+Qb9gERZcT0pzQWEAO+Uw0ed5oTre4uG1ZnfakyZMDvXW
 XnfPeBQ9Xb3tqDKvgDcgtzMors9XRuonZJSuQzqvf6YrXxA57pQsr2u/erEf7wx7jdihGlfHd
 upbF81YdYmFAcSDyeOw730212eW6fzzujSV2wg==
Received-SPF: permerror client-ip=212.227.126.134;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The only caller passes &error_fatal, so use this directly in the function.

It's what we do for -blockdev, -device, and -object.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 include/net/net.h |  2 +-
 net/net.c         | 20 +++++++-------------
 softmmu/vl.c      |  2 +-
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 523136c7acba..c53c64ac18c4 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -216,7 +216,7 @@ extern const char *host_net_devices[];
 /* from net.c */
 int net_client_parse(QemuOptsList *opts_list, const char *str);
 void show_netdevs(void);
-int net_init_clients(Error **errp);
+void net_init_clients(void);
 void net_check_clients(void);
 void net_cleanup(void);
 void hmp_host_net_add(Monitor *mon, const QDict *qdict);
diff --git a/net/net.c b/net/net.c
index d2288bd3a929..15958f881776 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1562,27 +1562,21 @@ out:
     return ret;
 }
 
-int net_init_clients(Error **errp)
+void net_init_clients(void)
 {
     net_change_state_entry =
         qemu_add_vm_change_state_handler(net_vm_change_state_handler, NULL);
 
     QTAILQ_INIT(&net_clients);
 
-    if (qemu_opts_foreach(qemu_find_opts("netdev"),
-                          net_init_netdev, NULL, errp)) {
-        return -1;
-    }
-
-    if (qemu_opts_foreach(qemu_find_opts("nic"), net_param_nic, NULL, errp)) {
-        return -1;
-    }
+    qemu_opts_foreach(qemu_find_opts("netdev"), net_init_netdev, NULL,
+                      &error_fatal);
 
-    if (qemu_opts_foreach(qemu_find_opts("net"), net_init_client, NULL, errp)) {
-        return -1;
-    }
+    qemu_opts_foreach(qemu_find_opts("nic"), net_param_nic, NULL,
+                      &error_fatal);
 
-    return 0;
+    qemu_opts_foreach(qemu_find_opts("net"), net_init_client, NULL,
+                      &error_fatal);
 }
 
 int net_client_parse(QemuOptsList *opts_list, const char *optarg)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index aabd82e09a20..8f3f3bb74389 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1904,7 +1904,7 @@ static void qemu_create_late_backends(void)
         qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
     }
 
-    net_init_clients(&error_fatal);
+    net_init_clients();
 
     object_option_foreach_add(object_create_late);
 
-- 
2.37.1


