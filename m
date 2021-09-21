Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27FF413B32
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:22:31 +0200 (CEST)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmHd-0006ui-O7
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmEo-0003z0-KQ
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:34 -0400
Received: from [115.28.160.31] (port=55960 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmEm-0000Lc-KV
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:34 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A94C8633F2;
 Wed, 22 Sep 2021 04:19:25 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632255565; bh=+iUspIXOsG/uaNec4qlFLc69K3AZxcAoGJIJBpYxthc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N2WAdWzXlLo0cQc9j1w/R7bQT2jNwffoRMhUta8MgnDcNBOqRTUUWCHRj8oNVEtcC
 Eu8k3bJTDRaNTKgOVRExySv4sDjFeic7CBCgr/ek6tn/kTPoV2/MJS2eYiM9HE50ev
 VI63qUWSz8DIeAtg24fdDNY1Fk2EaK5pZA+Qj1hE=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/30] elf: Add machine type value for LoongArch
Date: Wed, 22 Sep 2021 04:18:46 +0800
Message-Id: <20210921201915.601245-2-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921201915.601245-1-git@xen0n.name>
References: <20210921201915.601245-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 include/elf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index 811bf4a1cb..3a4bcb646a 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -182,6 +182,8 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_NANOMIPS     249     /* Wave Computing nanoMIPS */
 
+#define EM_LOONGARCH    258     /* LoongArch */
+
 /*
  * This is an interim value that we will use until the committee comes
  * up with a final number.
-- 
2.33.0


