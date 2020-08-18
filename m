Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC378247D81
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:28:41 +0200 (CEST)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tEm-0006cT-SU
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t68-0007Mz-HX; Tue, 18 Aug 2020 00:19:44 -0400
Received: from ozlabs.org ([203.11.71.1]:52515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t66-0006LS-Ia; Tue, 18 Aug 2020 00:19:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNZ64LBz9sV9; Tue, 18 Aug 2020 14:19:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724366;
 bh=hzgAt1O6dYjmUZB5vBufIOGpmcBVYQk4j7ZI3PZ6rtI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hIwVS9NxWrKhyVpL7uy1fPTexpeeR++bXm1ig3xjjYq8nb+QpY46KrM6LZWT6DlaE
 RtmzfIkH2pis9rBtulJgShDXg7XqfxyeLHtldbB//k+nMo6uem/aqQbI7I6z1pAH2E
 tVrjnO5CTkXeLVcDByH6dcsVxcY4I7oq7IbTEYdY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 11/40] Update PowerPC AT_HWCAP2 definition
Date: Tue, 18 Aug 2020 14:18:53 +1000
Message-Id: <20200818041922.251708-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 00:19:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Lijun Pan <ljp@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lijun Pan <ljp@linux.ibm.com>

Add PPC2_FEATURE2_ARCH_3_10 to the PowerPC AT_HWCAP2 definitions.

Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
Message-Id: <20200724045845.89976-2-ljp@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/elf.h b/include/elf.h
index 5b06b55f28..c117a4d1ab 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -558,6 +558,7 @@ typedef struct {
 #define PPC_FEATURE2_HTM_NOSC           0x01000000
 #define PPC_FEATURE2_ARCH_3_00          0x00800000
 #define PPC_FEATURE2_HAS_IEEE128        0x00400000
+#define PPC_FEATURE2_ARCH_3_10          0x00040000
 
 /* Bits present in AT_HWCAP for Sparc.  */
 
-- 
2.26.2


