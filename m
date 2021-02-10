Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228B2315F55
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:22:38 +0100 (CET)
Received: from localhost ([::1]:50474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9itZ-0007An-5A
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ioz-0001Sa-LL; Wed, 10 Feb 2021 01:17:53 -0500
Received: from ozlabs.org ([203.11.71.1]:36981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ioq-0000CW-NB; Wed, 10 Feb 2021 01:17:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gk3VyCz9sVm; Wed, 10 Feb 2021 17:17:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937858;
 bh=whbxUw1hQtddKfy74WUX7daGJXxv3K7Nf/2vKGFWs4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IF2koHgEeY2Nj2qGpwFg3KD+z54xhCmm4Z27U+928Q9XhhQ1oRS0UHr45TfzqHfc/
 4H/gpENKUsYGMhRF7XhhMni3g0ScvYAY4L8gZMAx0uLopPRfIIgcPVa2Dtj0vnOR1D
 HNzpoFfV/YWoiRNHPMPL89srbwBYlC3WdTC4xico=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 04/19] target/ppc: Remove unused MMU definitions
Date: Wed, 10 Feb 2021 17:17:20 +1100
Message-Id: <20210210061735.304384-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Remove these confusing and unused definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210127232401.3525126-1-f4bug@amsat.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2609e4082e..cb00210288 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2205,9 +2205,6 @@ enum {
  * may be needed for precise access rights control and precise exceptions.
  */
 enum {
-    /* 1 bit to define user level / supervisor access */
-    ACCESS_USER  = 0x00,
-    ACCESS_SUPER = 0x01,
     /* Type of instruction that generated the access */
     ACCESS_CODE  = 0x10, /* Code fetch access                */
     ACCESS_INT   = 0x20, /* Integer load/store access        */
-- 
2.29.2


