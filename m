Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4ED5BEE59
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:18:06 +0200 (CEST)
Received: from localhost ([::1]:51290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajgz-00022a-EL
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHV-0007ZY-K9
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oafHU-0001N8-12
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663688127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2J03FfwtPzT75HxAMTzi+3ev9KgHoeCwOJ2RoueaWQ=;
 b=hi57SiT3zXaESmvHvy52RAtOAyhkP88d4F0HNcZK6CxbyrbTQN4xh6kgUKrWHWRvmjrt4Y
 JvA/0t2OcuF94cUeJDEfw0/EN+cGn2r0tded6Ke4c8F6fjSeMi6rtNqWTjJhMVJ317W3HO
 zU6V1BGu+g05PJsBJ/JIvUi42F+t66I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-vY_F4xzPOjmZTcyolqsHYw-1; Tue, 20 Sep 2022 11:35:23 -0400
X-MC-Unique: vY_F4xzPOjmZTcyolqsHYw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58DE0882821;
 Tue, 20 Sep 2022 15:35:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FA52492B04;
 Tue, 20 Sep 2022 15:35:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Subject: [PULL 04/15] tests/qtest: npcm7xx-emc-test: Skip checking MAC
Date: Tue, 20 Sep 2022 17:35:01 +0200
Message-Id: <20220920153512.187283-5-thuth@redhat.com>
In-Reply-To: <20220920153512.187283-1-thuth@redhat.com>
References: <20220920153512.187283-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Patrick Venture <venture@google.com>

The register tests walks all the registers to verify they are initially
0 when appropriate.  However, if the MAC address is set in the register
space, this should not be checked against 0.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
Message-Id: <20220906163138.2831353-1-venture@google.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/npcm7xx_emc-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
index c373d24e1e..b046f1d76a 100644
--- a/tests/qtest/npcm7xx_emc-test.c
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -381,7 +381,8 @@ static void test_init(gconstpointer test_data)
 
 #undef CHECK_REG
 
-    for (i = 0; i < NUM_CAMML_REGS; ++i) {
+    /* Skip over the MAC address registers, which is BASE+0 */
+    for (i = 1; i < NUM_CAMML_REGS; ++i) {
         g_assert_cmpuint(emc_read(qts, mod, REG_CAMM_BASE + i * 2), ==,
                          0);
         g_assert_cmpuint(emc_read(qts, mod, REG_CAML_BASE + i * 2), ==,
-- 
2.31.1


