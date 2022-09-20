Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94465BF1B5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:07:38 +0200 (CEST)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanH7-0005CV-VM
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsq-0007N4-8K
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oalsV-00083B-SP
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663713485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nq13aToG9AQhbr4EScEaPEhP5YTaWi+1UK6cTWaKltc=;
 b=L8ht4GKuCRF0KF1kszXyBu6tvShEjlJE1i0pSr/daFb8evPEMUi8diOXv26asOrRFkTUNC
 3/aT6WAQ4Ll+/2ZhrSrqVHKiSK46++tDFqJvSDoN12KdeJdOKKBMEIFvRTkqkerD82HKq+
 xquezABQAosHtfTDifL7P7zLeWKE97w=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-SfJILhwLOwyGFMAx5tOwqw-1; Tue, 20 Sep 2022 18:38:04 -0400
X-MC-Unique: SfJILhwLOwyGFMAx5tOwqw-1
Received: by mail-qt1-f199.google.com with SMTP id
 fy20-20020a05622a5a1400b0035bef08641dso2863120qtb.18
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Nq13aToG9AQhbr4EScEaPEhP5YTaWi+1UK6cTWaKltc=;
 b=MjgTmzLZwwb3BsBBKTbH0uGxSPWpU7btloNldMBVUR/II2KVD1eE+8xrLXFYkto49U
 6uTpWbe5F1MduwqyRQMSJY9vBI/AGzp81i1vSy+rdbF+sWuCFSjiBLDziMdBOv8qRZkp
 ba7Xe/vsoK87TabTRdLHwqaPpDTBGdkd+3LFCTzI533HDhBexw1P53Ag9gMU8CkfJXQG
 j7XEZ01ClpgPpbAMBKr4S/rLdDzuE+ny0ND4h2z0lhRj2R3x0QoqVx/KxNiafYf5TYGz
 jDFMhOp+6F0DBN+keHEuRVJ93BYM5K4SNhSqLTNlENS1EU0vIg0xDSkY6kgq+DuHdxQw
 ydlQ==
X-Gm-Message-State: ACrzQf2A0MRlkNHUZnIM2GqpZxtPRmChEmg43rQlMSZ/KTie3+aPUkiO
 gmNaoSpQ4USblSErScAkPzzyhiki/oYNeNAA6VyS5KL0qb9WbzE1Zo9cT3vosvohyHiIKxeKwl8
 kQBpU1vqTcmCS4u6l/60PqS94YaxTImMa4op5unISYICP2KfVa0WAOl0Eitg0bkCU
X-Received: by 2002:a05:6214:2342:b0:473:e142:f758 with SMTP id
 hu2-20020a056214234200b00473e142f758mr21496211qvb.83.1663713483825; 
 Tue, 20 Sep 2022 15:38:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM79qZMjDQxwCJcn8T6bwAgTKWhK4edorZJIOyvQThmyVyjQcR+X+qOE/+6zKwmr/QEnYCTtew==
X-Received: by 2002:a05:6214:2342:b0:473:e142:f758 with SMTP id
 hu2-20020a056214234200b00473e142f758mr21496190qvb.83.1663713483574; 
 Tue, 20 Sep 2022 15:38:03 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 de4-20020a05620a370400b006bbb07ebd83sm697499qkb.108.2022.09.20.15.38.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:38:03 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 1/5] migration: Fix possible deadloop of ram save process
Date: Tue, 20 Sep 2022 18:37:56 -0400
Message-Id: <20220920223800.47467-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920223800.47467-1-peterx@redhat.com>
References: <20220920223800.47467-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

When starting ram saving procedure (especially at the completion phase),
always set last_seen_block to non-NULL to make sure we can always correctly
detect the case where "we've migrated all the dirty pages".

Then we'll guarantee both last_seen_block and pss.block will be valid
always before the loop starts.

See the comment in the code for some details.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index dc1de9ddbc..1d42414ecc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2546,14 +2546,22 @@ static int ram_find_and_save_block(RAMState *rs)
         return pages;
     }
 
+    /*
+     * Always keep last_seen_block/last_page valid during this procedure,
+     * because find_dirty_block() relies on these values (e.g., we compare
+     * last_seen_block with pss.block to see whether we searched all the
+     * ramblocks) to detect the completion of migration.  Having NULL value
+     * of last_seen_block can conditionally cause below loop to run forever.
+     */
+    if (!rs->last_seen_block) {
+        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
+        rs->last_page = 0;
+    }
+
     pss.block = rs->last_seen_block;
     pss.page = rs->last_page;
     pss.complete_round = false;
 
-    if (!pss.block) {
-        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
-    }
-
     do {
         again = true;
         found = get_queued_page(rs, &pss);
-- 
2.32.0


