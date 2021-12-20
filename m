Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9E47B0B0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:52:05 +0100 (CET)
Received: from localhost ([::1]:51892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzKxG-0000Lt-If
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:52:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKQK-0001ws-Hx
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKPm-0005xM-7k
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VoMC7RjlqJ2CSRkrxYjUsH/v97JY1NqZo29Zh/Eb8IM=;
 b=EK6OoOXPlu85t+3bP2SbHhTZNm/5KGuNqE3SFo7+7WBxC8MnoOg8uG1FcCqv+6s4YP25CY
 Zyh3xOyyew40cWyL9J39/P5nDqEKYbWDpOgyPC1iNIc55Kss3iwoR9PefR8Rbf9RX/9KpE
 Kx2VjEbYbyifc5HjgpA+uR99S0wrt7Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-VHHvIJZ4OeOMedpFaW22lQ-1; Mon, 20 Dec 2021 03:54:15 -0500
X-MC-Unique: VHHvIJZ4OeOMedpFaW22lQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v23-20020a05600c215700b0034566adb612so1707398wml.0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 00:54:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VoMC7RjlqJ2CSRkrxYjUsH/v97JY1NqZo29Zh/Eb8IM=;
 b=ijnb7SlXJVfgoZUmhVfDmSAvYGVOJCatwoy1UpRrpyGroeFD+fgYxE0WqcEThlkYql
 AyTfeoY6Bf530JQblSTNbsZugEaQ6oT0udzzc2b0EwUjVV+fAjvoHfEWwVH3cmNJLP+X
 rTwUXalPTsTYznbPSW0D5MBrYLO+qSjGJx/SAhX2TcHGNNqqqfIhYvCECpqUJ1kA+OBJ
 q/1MaapoSv8WLNRFEsEvIlqnuONjLJ/kpwqTRIFe+x1oEoe2EzSoQJdTw/caJYiAOrLU
 Fch54sJeb+97odR8U2kSVcHjX1N8p0HKFd1jNwtbYdN9WJ2vuou8oUR0AkoT9Og9zg6q
 qD2w==
X-Gm-Message-State: AOAM531f+nFk7ynjkljN5POrxG8Kb6qyGdEacF4bnIIMs8QtSZo2cHYa
 n/4/wKfysDlo6Lp0eNWJ/weZD/yP5c0xJJQVq6M7awzXo/qagHHLFFMbvR+1k0OVvnDv83Os1N6
 NWpRPhB7HOjXzfiObOPo+M/4uMu9U2FqaEvnux/aSIEKmBq65WS305SwQdjoQIrPD
X-Received: by 2002:a5d:59af:: with SMTP id p15mr2491028wrr.237.1639990454330; 
 Mon, 20 Dec 2021 00:54:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziIHEk1aUaOi2ms9QjExZuzRnqS1Gr2FBISOYWn21PTU3ezGbX5JR4caGECfaSZ2iJ1C0Ihg==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr2490984wrr.237.1639990454015; 
 Mon, 20 Dec 2021 00:54:14 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.164])
 by smtp.gmail.com with ESMTPSA id h2sm14439713wrz.23.2021.12.20.00.54.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Dec 2021 00:54:13 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] migration: Don't return for postcopy_chunk_hostpages()
Date: Mon, 20 Dec 2021 16:53:49 +0800
Message-Id: <20211220085355.2284-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220085355.2284-1-peterx@redhat.com>
References: <20211220085355.2284-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.209, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7d9c8a508b..0ed0f51a09 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2580,12 +2580,10 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
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
 
@@ -2595,7 +2593,6 @@ static int postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
     postcopy_chunk_hostpages_pass(ms, block);
 
     postcopy_discard_send_finish(ms);
-    return 0;
 }
 
 /**
@@ -2617,7 +2614,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
     RAMBlock *block;
-    int ret;
 
     RCU_READ_LOCK_GUARD();
 
@@ -2631,10 +2627,7 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 
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


