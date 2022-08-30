Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7655A6D4B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:27:34 +0200 (CEST)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6tZ-0001mf-Cn
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AJ-0007ah-Ki
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AH-00059T-OT
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uml0oO77GjXtcldzIsgvt1ZsIFDto3Mwgo8XIM/8nsI=;
 b=RKdO6H0jc8RWsgbJW9ZcgDjcw5axOElVaqpdY2kgxTXMLq4SEDoOzoDj1p+uSTVSjk2W3z
 mHyKd0ps/C2LcVdy8JrFSMM/J4rLKmmLuTrU75QSzzcCtZSnPuyiiCd3kn9K8KT2RDc+ZB
 jkieFJB3uC6QnNcaZF0as1YuZRiMW1o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-A1JLYV9DPXO8M7CDwreMlw-1; Tue, 30 Aug 2022 14:40:41 -0400
X-MC-Unique: A1JLYV9DPXO8M7CDwreMlw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41E661C05AAD;
 Tue, 30 Aug 2022 18:40:41 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 028191400E71;
 Tue, 30 Aug 2022 18:40:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 15/23] tests/qtest: npcm7xx_emc-test: Skip running test_{tx,
 rx} on win32
Date: Tue, 30 Aug 2022 20:40:04 +0200
Message-Id: <20220830184012.77978-16-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

The test cases 'test_{tx,rx}' call socketpair() which does not exist
on win32. Exclude them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220824094029.1634519-44-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/npcm7xx_emc-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
index a353fef0ca..c373d24e1e 100644
--- a/tests/qtest/npcm7xx_emc-test.c
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -209,6 +209,7 @@ static int emc_module_index(const EMCModule *mod)
     return diff;
 }
 
+#ifndef _WIN32
 static void packet_test_clear(void *sockets)
 {
     int *test_sockets = sockets;
@@ -243,6 +244,7 @@ static int *packet_test_init(int module_num, GString *cmd_line)
     g_test_queue_destroy(packet_test_clear, test_sockets);
     return test_sockets;
 }
+#endif /* _WIN32 */
 
 static uint32_t emc_read(QTestState *qts, const EMCModule *mod,
                          NPCM7xxPWMRegister regno)
@@ -250,6 +252,7 @@ static uint32_t emc_read(QTestState *qts, const EMCModule *mod,
     return qtest_readl(qts, mod->base_addr + regno * sizeof(uint32_t));
 }
 
+#ifndef _WIN32
 static void emc_write(QTestState *qts, const EMCModule *mod,
                       NPCM7xxPWMRegister regno, uint32_t value)
 {
@@ -339,6 +342,7 @@ static bool emc_soft_reset(QTestState *qts, const EMCModule *mod)
     g_message("%s: Timeout expired", __func__);
     return false;
 }
+#endif /* _WIN32 */
 
 /* Check emc registers are reset to default value. */
 static void test_init(gconstpointer test_data)
@@ -387,6 +391,7 @@ static void test_init(gconstpointer test_data)
     qtest_quit(qts);
 }
 
+#ifndef _WIN32
 static bool emc_wait_irq(QTestState *qts, const EMCModule *mod, int step,
                          bool is_tx)
 {
@@ -843,6 +848,7 @@ static void test_rx(gconstpointer test_data)
 
     qtest_quit(qts);
 }
+#endif /* _WIN32 */
 
 static void emc_add_test(const char *name, const TestData* td,
                          GTestDataFunc fn)
@@ -865,8 +871,10 @@ int main(int argc, char **argv)
         td->module = &emc_module_list[i];
 
         add_test(init, td);
+#ifndef _WIN32
         add_test(tx, td);
         add_test(rx, td);
+#endif
     }
 
     return g_test_run();
-- 
2.31.1


