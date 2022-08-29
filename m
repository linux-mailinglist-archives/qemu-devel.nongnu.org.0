Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D935A52CD
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:11:10 +0200 (CEST)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSiI1-0006o8-A2
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4g-0002fB-8g
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4e-0008H2-Mr
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661792240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SAw+KBxODpeo0q8eAHUrT+axCF1AXEnatmPu6o5lxes=;
 b=HuOYDZ5rLJJILqhyrITBEzqdNtltzor8yPyUor2Mvy6SCEIWO+RXMvskU7JUZzghGoS9La
 VjCKRDT8iCh7ADRM0V7eH33IIfMKORXP0abDpxqXbxHCCx+aihF6JpTJzMMFljkANFWy3d
 49VTwzzj6T0AERaK4dwg/PF//wjFDDA=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-XbBOyv8HOhKbzQaM9w22wg-1; Mon, 29 Aug 2022 12:57:19 -0400
X-MC-Unique: XbBOyv8HOhKbzQaM9w22wg-1
Received: by mail-io1-f69.google.com with SMTP id
 q10-20020a0566022f0a00b00688d703717bso5017311iow.9
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=SAw+KBxODpeo0q8eAHUrT+axCF1AXEnatmPu6o5lxes=;
 b=CgoqRQqwIBjWmE9eIsBeLrLfaHHw7+tkl0V9B0ZFo4/R9O+pIGTCOlFoaIknwEOL5m
 rBsmMX50YXKT/eoNYbugJ32IVEjxCTnYLOhwRyJ5EkzJUvweTZ6H9b7V40pWDzrAwE/x
 9hy4fVXUEjmT1qr63HGD9YZby1bWKp93DrmhhX2klozJJNINNhkPdxK73fq5zdXihvBS
 mRhf9JqrNYnYYs8GKGJBOoHugGEZESvC+9ufPUmmlRi/QBIPRJMuJLEUMvbwKxe/UUpO
 kBgQOTYf+8IvZrlwVTf4rqHvgKLN+gODsoTNaupivbdQKwRTXxXsw8kNtAOokYlPDp99
 Al1g==
X-Gm-Message-State: ACgBeo2l0NdSxpYsD3f8gHkN0MNJ0hjbrFFBz6vBrlsvqxHbph2vxAMQ
 dXdzTadDgBrABFRbj3swmMucMRpIdZOqmCKAnMEOsxEN3D7nfewjEvH4L0fGApsDQ9dSsWbeKe0
 do77NqwF8M4RrmZ3X3n7hfzhFwMqJgZMJzY9LpauhnQN6x81rAaGwxvAiPfWcBUlv
X-Received: by 2002:a05:6638:2042:b0:346:e51a:da4e with SMTP id
 t2-20020a056638204200b00346e51ada4emr10597295jaj.164.1661792238318; 
 Mon, 29 Aug 2022 09:57:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5OX92x8c39bNwXM1FVSOZdVmdjabkOAwdZS7svCZnLlcv300dtEiao9uPOvz85DYD7gSx1/A==
X-Received: by 2002:a05:6638:2042:b0:346:e51a:da4e with SMTP id
 t2-20020a056638204200b00346e51ada4emr10597272jaj.164.1661792238049; 
 Mon, 29 Aug 2022 09:57:18 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b00344c3de5ec7sm4404709jas.150.2022.08.29.09.57.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Aug 2022 09:57:17 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 10/13] migration: Add pss_init()
Date: Mon, 29 Aug 2022 12:56:56 -0400
Message-Id: <20220829165659.96046-11-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220829165659.96046-1-peterx@redhat.com>
References: <20220829165659.96046-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Helper to init PSS structures.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index adcc57c584..bdfcc6171a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -535,6 +535,14 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
 static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
                                      bool postcopy_requested);
 
+/* NOTE: page is the PFN not real ram_addr_t. */
+static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
+{
+    pss->block = rb;
+    pss->page = page;
+    pss->complete_round = false;
+}
+
 static void *do_data_compress(void *opaque)
 {
     CompressParam *param = opaque;
@@ -2625,9 +2633,7 @@ static int ram_find_and_save_block(RAMState *rs)
         return pages;
     }
 
-    pss.block = rs->last_seen_block;
-    pss.page = rs->last_page;
-    pss.complete_round = false;
+    pss_init(&pss, rs->last_seen_block, rs->last_page);
 
     if (!pss.block) {
         pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
-- 
2.32.0


