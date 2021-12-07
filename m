Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C59346BA6B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 12:52:15 +0100 (CET)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muZ14-0007s5-69
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 06:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzW-0005Ae-KW
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzS-0004ly-LL
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638877833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xkNoxRGiLarQHKJMZMA2Rdjez5Quwer/Kh6c3bPYS8g=;
 b=OTaTnYRB1xomoWrQF/6W1+40KG1pomOZtS7zjsBilhSz0YiV08xGvNnKBK/G8RPccmzhCR
 w/cwS+u/KdX1Ypr994Ua7Jv/VoE4/dwVripXU43Ajsdk3mkymPvZ4vihk/nTinlS8A6L6K
 0p56YBsBv/KHONokV6/GSYQdYk7snog=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-LlvohfHAOmeunuyemSZtUw-1; Tue, 07 Dec 2021 06:50:32 -0500
X-MC-Unique: LlvohfHAOmeunuyemSZtUw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso1245502wms.5
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 03:50:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xkNoxRGiLarQHKJMZMA2Rdjez5Quwer/Kh6c3bPYS8g=;
 b=deuaYVvr6fZQbd+kF8i+NBBvsob4p+rOyhCvRh8WABnySFiQ1tIVithftxV7HniTor
 rhYVFMpyJL5nd170vQb/a4g2QlQk+wM0pTWjk7UK+MyuTfW0XRlSn3OCidwKTKYvV+GV
 1wjFyeD1SWQVLFd+MBJNkP1skC+LqHxwaHMQUI1BbWltVC1vXM8UpdneldIhB/X+7DFc
 U/jyqPj69FegYmNKQGX1D1N+a8kgwd5+lf8hpuCyZ6e/td+WxDYsZEtLgbmCw1r9q3Re
 sQkgnRHG/zZQ9Tjr5S7le0Yx56Fnv0cl0Shmn29hA5gIBIcDbU7Aos83Y+/FRtvVS02R
 t/iQ==
X-Gm-Message-State: AOAM530O5YGqx6Ea0JOiP/b4ZOX8hHzSuxHUFUGIiKIQnLS2+OOTmmg/
 orabzRXO6b+cVKFRHFtjOBGE0BIbG8WGxlXVrC9g9SQa0eY1zyejVoz5gFp438itr0WjlTIT+5O
 KPrvsoZicMYkVHBUMneTKdJyT6n0Z1qBfgRAaax94FvqVwz8wz7A0F+Ysn/NfqPVs
X-Received: by 2002:a05:600c:4fcc:: with SMTP id
 o12mr6534703wmq.110.1638877831254; 
 Tue, 07 Dec 2021 03:50:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtLTAVUDCuausXrZXiws+xNCGC4LGpjeafjACE3lCrA5CLMfwtSM3hTHteB9NBfjVmsziB+A==
X-Received: by 2002:a05:600c:4fcc:: with SMTP id
 o12mr6534673wmq.110.1638877831035; 
 Tue, 07 Dec 2021 03:50:31 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.177])
 by smtp.gmail.com with ESMTPSA id g18sm3023551wmq.4.2021.12.07.03.50.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 03:50:30 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] migration: Don't return for postcopy_chunk_hostpages()
Date: Tue,  7 Dec 2021 19:50:11 +0800
Message-Id: <20211207115016.73195-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207115016.73195-1-peterx@redhat.com>
References: <20211207115016.73195-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It always return zero, because it just can't go wrong so far.  Simplify the
code with no functional change.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 756ac800a7..fb8c1a887e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2585,12 +2585,10 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
  * dirty host-page size chunks as all dirty.  In this case the host-page
  * is the host-page for the particular RAMBlock, i.e. it might be a huge page
  *
- * Returns zero on success
- *
  * @ms: current migration state
  * @block: block we want to work with
  */
-static int postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
+static void postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
 {
     postcopy_discard_send_init(ms, block->idstr);
 
@@ -2600,7 +2598,6 @@ static int postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
     postcopy_chunk_hostpages_pass(ms, block);
 
     postcopy_discard_send_finish(ms);
-    return 0;
 }
 
 /**
@@ -2622,7 +2619,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
     RAMBlock *block;
-    int ret;
 
     RCU_READ_LOCK_GUARD();
 
@@ -2636,10 +2632,7 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         /* Deal with TPS != HPS and huge pages */
-        ret = postcopy_chunk_hostpages(ms, block);
-        if (ret) {
-            return ret;
-        }
+        postcopy_chunk_hostpages(ms, block);
     }
     trace_ram_postcopy_send_discard_bitmap();
 
-- 
2.32.0


