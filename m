Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045B3C1761
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:49:26 +0200 (CEST)
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XDJ-0003eJ-Jv
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>)
 id 1m1Wn6-0008Uy-Jy; Thu, 08 Jul 2021 12:22:20 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:22989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>)
 id 1m1Wn3-0002un-7g; Thu, 08 Jul 2021 12:22:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625761330;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=6D5KRVSpEhClV6Mf0624Nr/TvTUusNkkQkJ6bcrT3bw=;
 b=fn8zCC3GB4h+Xe2RyKitGY9yyJVKfLiu+PmTb8FKg9chSmpURkDSURWYQ25NjpsABh
 hGgNOw/+Ybp4YHGqKx8ifOPZBOvZQlZC3tNtO+dYn3FnSUwghAxpZlPIT7ZSUAtB09n+
 pRm/37rMQDABSaKV03rgOhDlt80vhT7TyJo2rAHKMBF3STE3JCGh7NMyrICYoy060sfk
 jDvJuGx7F3M+AWqDmgAVudBaG4/0nSwl1l0he0czsazp5lXnyG9sp+raiZQgePXZcmEJ
 Hm85ebotSE5057PBe9SfhK/Qv1tlZw6WJ+aLHjgghjLcO36o3lNqHw4eUxPtBKd2lhxm
 MzKA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx68GMAbLQ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 18:22:10 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v1] migration: fix typo in mig_throttle_guest_down comment
Date: Thu,  8 Jul 2021 18:21:59 +0200
Message-Id: <20210708162159.18045-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=81.169.146.219; envelope-from=olaf@aepfle.de;
 helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Olaf Hering <olaf@aepfle.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes commit 3d0684b2ad82a5dde68e3f08b0d7786dccaf619c ("ram: Update
all functions comments")

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 723af67c2e..88ff34f574 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -600,7 +600,7 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
 }
 
 /**
- * mig_throttle_guest_down: throotle down the guest
+ * mig_throttle_guest_down: throttle down the guest
  *
  * Reduce amount of guest cpu execution to hopefully slow down memory
  * writes. If guest dirty memory rate is reduced below the rate at

