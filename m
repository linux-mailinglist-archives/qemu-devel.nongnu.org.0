Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68924936D4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:09:19 +0100 (CET)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6xy-0005XT-O6
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:09:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA639-0007Nt-5A
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA634-0001ON-Om
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSNdZ8aqHo5b9ub2U6pUcsHjlxUs+BHNLv0gjEuikZg=;
 b=NohtlW1JN+CyHg0JsYJxFd4GP03m70F1lYaEuVd5+8t6J6y4ChZbkqngOO+BEUUU+rfBL+
 s3jvPAtf2bWyBfJynOV5v8oA7nJOFyay2Sm04DFGbhy3S60yKqiMRyRBz84U67SNdPjNtF
 rwxDQqcizNyBWcLwHHCj4UbUGkVuorI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-wBJmkcP3O-Ck-U_jsOxTVA-1; Wed, 19 Jan 2022 03:10:27 -0500
X-MC-Unique: wBJmkcP3O-Ck-U_jsOxTVA-1
Received: by mail-wm1-f69.google.com with SMTP id
 20-20020a05600c22d400b00349067fe7b7so789588wmg.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DSNdZ8aqHo5b9ub2U6pUcsHjlxUs+BHNLv0gjEuikZg=;
 b=oD62jDGv9c+FeVLk8zk95edn/4To4A5EDBtBktVhUGaySwWbG7IWqTAoT15Yx8gvE0
 NJJLqNIR65REhUekrGR8m1woeZZWIKe3Gl3K0pVbfVKbrAkxdZl8/CoDptOk/YCYVoFb
 I2ktjIK2NscC1qw3Va/y5IO9xRzr3ZewnGT0U+FXIb81jwMyvX75cI3nejzME7cpJ1ZS
 9fA+LTRba9hkgEzcD44zJvU/PH+mWg3YQO4/05zoSHnZFLzSbIZKI1r8QDd449L2gdwI
 F6589V70xHbzjx3X6iJA1JpGS9Kd73MELLhJcACd6N0jFQIXmfUhPmzMxU/8JbValJOV
 +EIw==
X-Gm-Message-State: AOAM533t4DTjIqqrk4CeKP2hAH9wpAAj1F7Z7npz7rLerI9DAHPHFtN6
 sLL6NpZixHvghjAW9exXsdZlOdk+WiDPf8WbtWp28zhYIj+iB5kZ96KaS8IuMLuVOkLpZBeAp1m
 HEBqHfHyO4ly6dDuX/FF/6wlL9VPExV7ThG8FGIXTYEIJ9D6WK2qSRSE02gcb7/WA
X-Received: by 2002:a05:6000:1ac7:: with SMTP id
 i7mr10013931wry.491.1642579826077; 
 Wed, 19 Jan 2022 00:10:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP/4YdssIjtQv13BiQBNACQwTgneVzLOjUK9L2P6TkaWV9NKOXTDG+tiObkelqQ3ofZyyR1g==
X-Received: by 2002:a05:6000:1ac7:: with SMTP id
 i7mr10013911wry.491.1642579825787; 
 Wed, 19 Jan 2022 00:10:25 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.10.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:10:25 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 11/15] migration: Add pss.postcopy_requested status
Date: Wed, 19 Jan 2022 16:09:25 +0800
Message-Id: <20220119080929.39485-12-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

This boolean flag shows whether the current page during migration is triggered
by postcopy or not.  Then in ram_save_host_page() and deeper stack we'll be
able to have a reference on the priority of this page.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 3a7d943f9c..b7d17613e8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -400,6 +400,8 @@ struct PageSearchStatus {
     unsigned long page;
     /* Set once we wrap around */
     bool         complete_round;
+    /* Whether current page is explicitly requested by postcopy */
+    bool         postcopy_requested;
 };
 typedef struct PageSearchStatus PageSearchStatus;
 
@@ -1480,6 +1482,9 @@ retry:
  */
 static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
 {
+    /* This is not a postcopy requested page */
+    pss->postcopy_requested = false;
+
     pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
     if (pss->complete_round && pss->block == rs->last_seen_block &&
         pss->page >= rs->last_page) {
@@ -1971,6 +1976,7 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
          * really rare.
          */
         pss->complete_round = false;
+        pss->postcopy_requested = true;
     }
 
     return !!block;
-- 
2.32.0


