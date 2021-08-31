Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29E33FC439
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 10:32:46 +0200 (CEST)
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKzCH-0001jw-PT
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 04:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKz9T-0005qb-Vk; Tue, 31 Aug 2021 04:29:52 -0400
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139]:24898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKz9Q-0007y7-Ay; Tue, 31 Aug 2021 04:29:51 -0400
IronPort-SDR: iY7Y/DdAVKZFCKMZRnAzJp+KI8QKgHazL2S2Feiw9LOM7V/f/FaIW4ekcCMaMr2HRINM2BZ8RL
 hufiBVQQSuk5taJLPRa9dbPJqr3YHZFPVzsLMox9Bhjf+RqImuBYKa5reINobjg488p5ew2GD/
 vWCewmh1awKnCYLkqqJz29TgdCbfTxBQLsUnbqQLcynMf87IHRyrpEHW/cvSa2RQ8qdCEOqdhG
 tCWp24Gig10OR5Vk0EDohkfOdIeGHssNW/K+HuGv/b1N/CB0wnCzmVNV+ZlGg/pVy+fBPuq9It
 Ms1l331+KpEAsMCu5Ief5P9U
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="42584013"
X-IronPort-AV: E=Sophos;i="5.84,365,1620658800"; d="scan'208";a="42584013"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
 by esa6.hc1455-7.c3s2.iphmx.com with ESMTP; 31 Aug 2021 17:29:46 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com
 [192.168.87.59])
 by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3386C248D04;
 Tue, 31 Aug 2021 17:29:44 +0900 (JST)
Received: from oym-om3.fujitsu.com (oym-om3.o.css.fujitsu.com [10.85.58.163])
 by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C5DFAF453;
 Tue, 31 Aug 2021 17:29:43 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om3.fujitsu.com (Postfix) with ESMTP id 3F96040164EBE;
 Tue, 31 Aug 2021 17:29:43 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	drjones@redhat.com,
	qemu-arm@nongnu.org
Subject: [PATCH v6 3/3] tests/arm-cpu-features: Add A64FX processor related
Date: Tue, 31 Aug 2021 17:29:40 +0900
Message-Id: <20210831082940.2811719-4-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
References: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=68.232.139.139;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa6.hc1455-7.c3s2.iphmx.com
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
Reviewed-by: Andrew Jones <drjones@redhat.com>
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


