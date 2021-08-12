Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AD23E9E64
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 08:23:57 +0200 (CEST)
Received: from localhost ([::1]:56472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE48D-0007iI-1b
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 02:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mE46J-0004xH-Lw; Thu, 12 Aug 2021 02:21:59 -0400
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139]:35174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mE46H-00015F-L1; Thu, 12 Aug 2021 02:21:59 -0400
IronPort-SDR: /h3X4kCgfyfJ3ZstNohKdpVJwBj6KrZc1461LojweSKT91C0Uv6q3BB0pr8OVi+Eu9YGQTBXbC
 VCp5GhBuIrIYWTIZTdAJPevAKU2Nrb3rINcQotef1BW8Bbh0IFXeEns8RPORdsETEZWOpNeOPw
 xFHVNrO4mZsGfeZZRJ8l7e7jwnrueP10tJ70EwpmEjRLu9HRyQDvfDQ/Vwe+gnq3JzyqY5Tzdp
 AJGwyuK1LuYDfekqtC4r0cCPu1ljnPWjtbsPpR+B5YY3BfBurpaY1g4fZOUcfWYxzwxCAQts6P
 UTNOlzUUk+TST3fxvUhYoKI+
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="39964541"
X-IronPort-AV: E=Sophos;i="5.84,315,1620658800"; d="scan'208";a="39964541"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
 by esa6.hc1455-7.c3s2.iphmx.com with ESMTP; 12 Aug 2021 15:21:55 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com
 [192.168.83.67])
 by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0253DE9E8C;
 Thu, 12 Aug 2021 15:21:54 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 590EBEA176;
 Thu, 12 Aug 2021 15:21:53 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id 2B6E34007B803;
 Thu, 12 Aug 2021 15:21:53 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 3/3] tests/arm-cpu-features: Add A64FX processor related
 tests
Date: Thu, 12 Aug 2021 15:04:40 +0900
Message-Id: <20210812060440.1330348-4-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
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
Cc: drjones@redhat.com, qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 tests/qtest/arm-cpu-features.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb8..6d704bc947 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -472,6 +472,8 @@ static void test_query_cpu_model_expansion(const void *data)
         assert_has_feature_enabled(qts, "max", "sve128");
         assert_has_feature_enabled(qts, "cortex-a57", "pmu");
         assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
+        assert_has_feature_enabled(qts, "a64fx", "pmu");
+        assert_has_feature_enabled(qts, "a64fx", "aarch64");
 
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
-- 
2.27.0


