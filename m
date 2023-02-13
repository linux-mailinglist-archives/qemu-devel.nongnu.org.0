Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546A5693CA1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:54:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROww-0002CN-OJ; Sun, 12 Feb 2023 21:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwu-0002Bk-Hf
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwt-0006uA-3k
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0yBf49pSQR7yhFHwz1wdYBEEVUVzX6IxyfnhrL83Mc=;
 b=gg7vvnBM/dKbQqOL8xeZ7HzX7mywSYN2SLpVvwEg7O0e6ldFDD1OLGFG2f84+mMpUPpyD7
 qW8UD7mywKby4wgfH6q2y7YT5YfY7rvyq4nmTmaKoVCtbgz8YrF+YxUPYuXpHCYlYaQvuw
 muDnzaBpqN2fu97ZHl6Mx79zBn45eaI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-kWW1wHYBPOOhIVVslvYYkQ-1; Sun, 12 Feb 2023 21:52:09 -0500
X-MC-Unique: kWW1wHYBPOOhIVVslvYYkQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 x10-20020a05600c21ca00b003dc5584b516so8385197wmj.7
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0yBf49pSQR7yhFHwz1wdYBEEVUVzX6IxyfnhrL83Mc=;
 b=wVX8TiWY7MbiMwkNONPzX+chur1h/UJ+mTM37F6c8p6tzEkx35ztyyby9nBA5mmV8r
 B45Cjr9OzKBKkDQ+y5bFVeKqkXUw7X0/I+2KS1sgLsOY55QnltyRh2aPtJKxaizk1xUV
 55TlBgRqEO14IO37fQ5Kue8m7iYKqHfV2TWLKmwU97MU3GmLhNyGwBCigeP9SmbxYi+J
 OFKGBD3WDeaf3VTTRnxi4IUIWSJSPb5uww+Mv7+lwix7u6XQ42VSRklioDD68v58BIZz
 D9RlMWri2kRQYhEwfkYjI5LwJajEdn5Ju3pGguiYPix0+wrmS7R5uu1ZM872S+JNjV+/
 qf4w==
X-Gm-Message-State: AO0yUKXZisYmlNus11rye+6pOp4g683r98NDPRN9vIwVKadhuF+YqgPF
 qKnFp2hDzTS0XyjK6Egqm0LQy1ejSFGF+l86vJlVO6JQVwGMIbvf50RmSnFDgOernZUfSlu/V8w
 ymoC+9QbJJw9DiJrsItM8xQCZJ1GXPUkSfLr7Nr4qC/6pFVX1LtywbCD9Iq/okdo+AJNqXLOU
X-Received: by 2002:a5d:6707:0:b0:293:1868:3a14 with SMTP id
 o7-20020a5d6707000000b0029318683a14mr18081515wru.0.1676256727913; 
 Sun, 12 Feb 2023 18:52:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9tc3eKcmHV81AV7FTi/F+cUpXgHE4iVfjahlFPUDi5eQMBm9rcSPprLob0mPFtARQR1H/hjw==
X-Received: by 2002:a5d:6707:0:b0:293:1868:3a14 with SMTP id
 o7-20020a5d6707000000b0029318683a14mr18081500wru.0.1676256727676; 
 Sun, 12 Feb 2023 18:52:07 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 s7-20020a5d5107000000b002c556a4f1casm2251510wrt.42.2023.02.12.18.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:07 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PULL 09/22] migration: Calculate ram size once
Date: Mon, 13 Feb 2023 03:51:37 +0100
Message-Id: <20230213025150.71537-10-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We are recalculating ram size continously, when we know that it don't
change during migration.  Create a field in RAMState to track it.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 migration/ram.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1727fe5ef6..6abfe075f2 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -330,6 +330,8 @@ struct RAMState {
     PageSearchStatus pss[RAM_CHANNEL_MAX];
     /* UFFD file descriptor, used in 'write-tracking' migration */
     int uffdio_fd;
+    /* total ram size in bytes */
+    uint64_t ram_bytes_total;
     /* Last block that we have visited searching for dirty pages */
     RAMBlock *last_seen_block;
     /* Last dirty target page we have sent */
@@ -2546,7 +2548,7 @@ static int ram_find_and_save_block(RAMState *rs)
     int pages = 0;
 
     /* No dirty page as there is zero RAM */
-    if (!ram_bytes_total()) {
+    if (!rs->ram_bytes_total) {
         return pages;
     }
 
@@ -3009,13 +3011,14 @@ static int ram_state_init(RAMState **rsp)
     qemu_mutex_init(&(*rsp)->bitmap_mutex);
     qemu_mutex_init(&(*rsp)->src_page_req_mutex);
     QSIMPLEQ_INIT(&(*rsp)->src_page_requests);
+    (*rsp)->ram_bytes_total = ram_bytes_total();
 
     /*
      * Count the total number of pages used by ram blocks not including any
      * gaps due to alignment or unplugs.
      * This must match with the initial values of dirty bitmap.
      */
-    (*rsp)->migration_dirty_pages = ram_bytes_total() >> TARGET_PAGE_BITS;
+    (*rsp)->migration_dirty_pages = (*rsp)->ram_bytes_total >> TARGET_PAGE_BITS;
     ram_state_reset(*rsp);
 
     return 0;
-- 
2.39.1


