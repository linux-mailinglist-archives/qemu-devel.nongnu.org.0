Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E521352753
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 10:18:36 +0200 (CEST)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSF0l-0007Jh-HW
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 04:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSEy1-00037J-Py
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSExw-0003z5-BO
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617351338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/kycABK0M+vjHovdD6xwhSTUUAijobYcIusSoMV/T6s=;
 b=LI0SWQHp84qBkPXg6vnveDzjZIta4nhsLNby7cLen8RO4aKwy7ipo9co6nJ2+7/4leBzgj
 fiFVutT6XHVbGV3V6aXgLXmDl1B6R3CpXKi+meXITa7jCLT7QTNrSHFANO92o6rWkIlgO4
 H8xQhzK1vHA6aFuqEbXKI1LJlFWGYwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-h3QEgPxfN9a6rExChBw9hw-1; Fri, 02 Apr 2021 04:15:36 -0400
X-MC-Unique: h3QEgPxfN9a6rExChBw9hw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2D6B87A83A;
 Fri,  2 Apr 2021 08:15:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-26.pek2.redhat.com [10.72.12.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4863F61F20;
 Fri,  2 Apr 2021 08:15:34 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	lekiravi@yandex-team.ru
Subject: [PATCH 4/5] Revert "tests: Add tests for query-netdev command"
Date: Fri,  2 Apr 2021 16:15:18 +0800
Message-Id: <20210402081519.78878-5-jasowang@redhat.com>
In-Reply-To: <20210402081519.78878-1-jasowang@redhat.com>
References: <20210402081519.78878-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several issues has been reported for query-netdev series. Consider
it's late in the rc, this reverts commitThis reverts commit
3c3b656885473ef0d699290ba966177f17839aa5.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 tests/qtest/meson.build         |   3 -
 tests/qtest/test-query-netdev.c | 120 --------------------------------
 2 files changed, 123 deletions(-)
 delete mode 100644 tests/qtest/test-query-netdev.c

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 902cfef7cb..420cd9986e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -33,9 +33,6 @@ qtests_generic = \
 if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
 endif
-if slirp.found()
-  qtests_generic += [ 'test-query-netdev' ]
-endif
 
 qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
diff --git a/tests/qtest/test-query-netdev.c b/tests/qtest/test-query-netdev.c
deleted file mode 100644
index 1118537a9f..0000000000
--- a/tests/qtest/test-query-netdev.c
+++ /dev/null
@@ -1,120 +0,0 @@
-/*
- * QTest testcase for the query-netdev
- *
- * Copyright Yandex N.V., 2019
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-
-#include "libqos/libqtest.h"
-#include "qapi/qmp/qdict.h"
-#include "qapi/qmp/qlist.h"
-
-/*
- * Events can get in the way of responses we are actually waiting for.
- */
-GCC_FMT_ATTR(2, 3)
-static QObject *wait_command(QTestState *who, const char *command, ...)
-{
-    va_list ap;
-    QDict *response;
-    QObject *result;
-
-    va_start(ap, command);
-    qtest_qmp_vsend(who, command, ap);
-    va_end(ap);
-
-    response = qtest_qmp_receive(who);
-
-    result = qdict_get(response, "return");
-    g_assert(result);
-    qobject_ref(result);
-    qobject_unref(response);
-
-    return result;
-}
-
-static void qmp_query_netdev_no_error(QTestState *qts, size_t netdevs_count)
-{
-    QObject *resp;
-    QList *netdevs;
-
-    resp = wait_command(qts, "{'execute': 'query-netdev'}");
-
-    netdevs = qobject_to(QList, resp);
-    g_assert(netdevs);
-    g_assert(qlist_size(netdevs) == netdevs_count);
-
-    qobject_unref(resp);
-}
-
-static void test_query_netdev(void)
-{
-    const char *arch = qtest_get_arch();
-    QObject *resp;
-    QTestState *state;
-
-    /* Choosing machine for platforms without default one */
-    if (g_str_equal(arch, "arm") ||
-        g_str_equal(arch, "aarch64")) {
-        state = qtest_init(
-            "-nodefaults "
-            "-M virt "
-            "-netdev user,id=slirp0");
-    } else if (g_str_equal(arch, "tricore")) {
-        state = qtest_init(
-            "-nodefaults "
-            "-M tricore_testboard "
-            "-netdev user,id=slirp0");
-    } else if (g_str_equal(arch, "avr")) {
-        state = qtest_init(
-            "-nodefaults "
-            "-M mega2560 "
-            "-netdev user,id=slirp0");
-    } else if (g_str_equal(arch, "rx")) {
-        state = qtest_init(
-            "-nodefaults "
-            "-M gdbsim-r5f562n8 "
-            "-netdev user,id=slirp0");
-    } else {
-        state = qtest_init(
-            "-nodefaults "
-            "-netdev user,id=slirp0");
-    }
-    g_assert(state);
-
-    qmp_query_netdev_no_error(state, 1);
-
-    resp = wait_command(state,
-        "{'execute': 'netdev_add', 'arguments': {"
-        " 'id': 'slirp1',"
-        " 'type': 'user'}}");
-    qobject_unref(resp);
-
-    qmp_query_netdev_no_error(state, 2);
-
-    resp = wait_command(state,
-        "{'execute': 'netdev_del', 'arguments': {"
-        " 'id': 'slirp1'}}");
-    qobject_unref(resp);
-
-    qmp_query_netdev_no_error(state, 1);
-
-    qtest_quit(state);
-}
-
-int main(int argc, char **argv)
-{
-    int ret = 0;
-    g_test_init(&argc, &argv, NULL);
-
-    qtest_add_func("/net/qapi/query_netdev", test_query_netdev);
-
-    ret = g_test_run();
-
-    return ret;
-}
-- 
2.24.3 (Apple Git-128)


