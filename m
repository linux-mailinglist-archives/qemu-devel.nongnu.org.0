Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF541173C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:37:06 +0200 (CEST)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKPq-0001K2-0f
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSETW-0008RB-E9
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:16:31 -0400
Received: from [115.28.160.31] (port=35656 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSETT-0000pp-93
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:16:29 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4B2326340E;
 Mon, 20 Sep 2021 16:06:20 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125180; bh=fpSQtYgNWkiF6RriJDEQ8PrNe2lg1EUb631GLusOZt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pL5trb4eVDiD4aiZefsXPmjdSvjRZo0w5U646z0Aw72F3bNZGyOHFeOelWC+d+2yN
 gssF+xxBLjk0G32r6bkHT70toZkRjvzTDI33PDdy772VHqSYQHoe9UtW5hPamWrZ+J
 3h2/5s/vH2RRroNZtKcwsFzC86cqb90UAGcnNNEA=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/30] linux-user: Add host dependency for 64-bit LoongArch
Date: Mon, 20 Sep 2021 16:04:50 +0800
Message-Id: <20210920080451.408655-30-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920080451.408655-1-git@xen0n.name>
References: <20210920080451.408655-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Sep 2021 09:57:24 -0400
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently nothing special is needed for LoongArch hosts to work, so only
leave a placeholder there.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 linux-user/host/loongarch64/hostdep.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 linux-user/host/loongarch64/hostdep.h

diff --git a/linux-user/host/loongarch64/hostdep.h b/linux-user/host/loongarch64/hostdep.h
new file mode 100644
index 0000000000..4e55695155
--- /dev/null
+++ b/linux-user/host/loongarch64/hostdep.h
@@ -0,0 +1,11 @@
+/*
+ * hostdep.h : things which are dependent on the host architecture
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef LOONGARCH64_HOSTDEP_H
+#define LOONGARCH64_HOSTDEP_H
+
+#endif
-- 
2.33.0


