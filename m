Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F835723A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 18:36:47 +0200 (CEST)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBAc-0006y7-Bx
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 12:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@gorilla.13thmonkey.org>)
 id 1lUArR-0004BA-8d
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:16:58 -0400
Received: from 13thmonkey.org ([80.100.255.32]:65421
 helo=gorilla.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@gorilla.13thmonkey.org>) id 1lUArN-0000p1-FV
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:16:55 -0400
Received: by gorilla.13thmonkey.org (Postfix, from userid 103)
 id A40E22FF0796; Wed,  7 Apr 2021 16:16:45 +0000 (UTC)
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 4/4] Add NVMM Accelerator: add maintainers for NetBSD/NVMM
Date: Wed,  7 Apr 2021 16:16:31 +0000
Message-Id: <20210407161631.1780-5-reinoud@NetBSD.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407161631.1780-1-reinoud@NetBSD.org>
References: <20210407161631.1780-1-reinoud@NetBSD.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@gorilla.13thmonkey.org; helo=gorilla.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kamil Rytarowski <kamil@NetBSD.org>, Reinoud Zandijk <reinoud@NetBSD.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kamil Rytarowski <kamil@NetBSD.org>
Signed-off-by: Reinoud Zandijk <reinoud@NetBSD.org>

---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 554be84b32..cf9d81ea7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -510,6 +510,15 @@ F: accel/stubs/hax-stub.c
 F: include/sysemu/hax.h
 F: target/i386/hax/
 
+Guest CPU Cores (NVMM)
+----------------------
+NetBSD Virtual Machine Monitor (NVMM) CPU support
+M: Kamil Rytarowski <kamil@netbsd.org>
+M: Reinoud Zandijk <reinoud@netbsd.org>
+S: Maintained
+F: include/sysemu/nvmm.h
+F: target/i386/nvmm/
+
 Hosts
 -----
 LINUX
@@ -530,6 +539,8 @@ F: include/qemu/*posix*.h
 
 NETBSD
 M: Kamil Rytarowski <kamil@netbsd.org>
+M: Reinoud Zandijk <reinoud@netbsd.org>
+M: Ryo ONODERA <ryoon@netbsd.org>
 S: Maintained
 K: ^Subject:.*(?i)NetBSD
 
-- 
2.31.1


