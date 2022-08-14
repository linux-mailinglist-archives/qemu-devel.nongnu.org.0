Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA6859204D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 17:00:14 +0200 (CEST)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNF65-0008So-Ki
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 11:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oNF29-0002Gs-Av
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 10:56:09 -0400
Received: from mail.xen0n.name ([115.28.160.31]:54608
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oNF23-0007Ok-GM
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 10:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1660488952; bh=QjsDyZnb+B3PuXXr3jo/IJYwPW9wT9MymKbqCh7O60g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LsZBvcZydOu1NqAHGtCxe/ukzm0FebBzskZ9oyLfBtxEEkdP9HloPjyOC5Q6FnfNN
 atZoj/xfRkzy/3OBkaK3pbT74wVvPh/jNgFdp1cRtnKyoDBvbKVGu3Z5FRZmDvv/bN
 hJDlnThY8TvsN/jY43OG9hX6jdgDrfCxeYv2/AGY=
Received: from ld50.lan (unknown [101.88.24.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C843660685;
 Sun, 14 Aug 2022 22:55:51 +0800 (CST)
From: WANG Xuerui <i.qemu@xen0n.name>
To: qemu-devel@nongnu.org
Cc: WANG Xuerui <i.qemu@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 WANG Xuerui <git@xen0n.name>
Subject: [PATCH for-7.1 2/4] target/loongarch: Trim type name suffix in -cpu
 help output
Date: Sun, 14 Aug 2022 22:55:20 +0800
Message-Id: <20220814145522.1474927-3-i.qemu@xen0n.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814145351.1474753-1-git@xen0n.name>
References: <20220814145351.1474753-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: WANG Xuerui <git@xen0n.name>

Also add a header and indentation for each entry, while at it.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 target/loongarch/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index dc233ee209..4663539443 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -416,13 +416,15 @@ static void loongarch_la464_initfn(Object *obj)
 static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
 {
     const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    int len = strlen(typename) - strlen(LOONGARCH_CPU_TYPE_SUFFIX);
 
-    qemu_printf("%s\n", typename);
+    qemu_printf("  %.*s\n", len, typename);
 }
 
 void loongarch_cpu_list(void)
 {
     GSList *list;
+    qemu_printf("Available CPUs:\n");
     list = object_class_get_list_sorted(TYPE_LOONGARCH_CPU, false);
     g_slist_foreach(list, loongarch_cpu_list_entry, NULL);
     g_slist_free(list);
-- 
2.35.1


