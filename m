Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3AC3FB280
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 10:30:04 +0200 (CEST)
Received: from localhost ([::1]:60254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKcg2-0007zj-MK
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 04:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKcef-0005jE-Sy; Mon, 30 Aug 2021 04:28:33 -0400
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47]:41725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKcee-0000u2-CY; Mon, 30 Aug 2021 04:28:33 -0400
IronPort-SDR: epkBQgRqP9ruip07jUdMJnI4tMCl/sp2D3NrrIkzJNaLax/KNpmH+XatsGTP7RogY/qVkSKVRs
 SQDiT+k3yXFW/8jlccjCRFgo030I8kJM9qWlX6cqS8puD8edHSSM/MXtgnC2mQ5zlkvaCW/uet
 oky26FZ+dMhAOqadSs/n9cOxYtaD2K4f3cNrK9zVtCw2yiv7YAOBPJwZl0oLUyL9RjP/KVgh1R
 i5MYRbTvxjepPGaaG3l+zYdBNsZHsad/ns1V8cJOxs/zgpk2CyyDlX+vSdJ6zQhpvtXs+evdTs
 +A8FI09AUeJMjPrAY7gBWLUn
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="42326706"
X-IronPort-AV: E=Sophos;i="5.84,362,1620658800"; d="scan'208";a="42326706"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
 by esa1.hc1455-7.c3s2.iphmx.com with ESMTP; 30 Aug 2021 17:28:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A14AEE6800;
 Mon, 30 Aug 2021 17:28:28 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE73AFF37;
 Mon, 30 Aug 2021 17:28:27 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id 912494006D7DE;
 Mon, 30 Aug 2021 17:28:27 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	drjones@redhat.com,
	qemu-arm@nongnu.org
Subject: [PATCH v5 3/3] tests/arm-cpu-features: Add A64FX processor related
Date: Mon, 30 Aug 2021 17:28:20 +0900
Message-Id: <20210830082820.2690275-4-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
References: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=207.54.90.47;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa1.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 tests/qtest/arm-cpu-features.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb8..90a87f0ea9 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -473,6 +473,19 @@ static void test_query_cpu_model_expansion(const void *data)
         assert_has_feature_enabled(qts, "cortex-a57", "pmu");
         assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
 
+        assert_has_feature_enabled(qts, "a64fx", "pmu");
+        assert_has_feature_enabled(qts, "a64fx", "aarch64");
+        /*
+         * A64FX does not support any other vector lengths besides those
+         * that are enabled by default(128bit, 256bits, 512bit).
+         */
+        assert_has_feature_enabled(qts, "a64fx", "sve");
+        assert_sve_vls(qts, "a64fx", 0xb, NULL);
+        assert_error(qts, "a64fx", "cannot enable sve384",
+                     "{ 'sve384': true }");
+        assert_error(qts, "a64fx", "cannot enable sve640",
+                     "{ 'sve640': true }");
+
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
 
-- 
2.27.0


