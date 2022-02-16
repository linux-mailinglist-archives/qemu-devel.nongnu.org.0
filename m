Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0784B80E5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:02:55 +0100 (CET)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEL0-0005dF-2V
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:02:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDod-0004Fz-9i
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDob-0006Go-Gd
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqoEel/aQ2/EMHLZUVdA76gOV6xHTWZL7xjBPEinNUI=;
 b=Ic/SwIOU4ePiWlcVmb0cJiMOnv2c8EW0owX+W7J+Ryh2QgLnfIGDSZKAw5V950dlK2NCxY
 wSroJrfywTBf0Qw0YNTPVtngBAdpTaxaWJndSH2wyp5hhJm6rs54/TKffc7j9lkTsYVSPL
 fJtj3TIPvL4sEKZ1YN8NTc5tJyDx9h8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-AJwayvHvMqS6qqZU0vIvuw-1; Wed, 16 Feb 2022 01:29:23 -0500
X-MC-Unique: AJwayvHvMqS6qqZU0vIvuw-1
Received: by mail-pj1-f71.google.com with SMTP id
 q40-20020a17090a17ab00b001bafa89b70aso868378pja.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uqoEel/aQ2/EMHLZUVdA76gOV6xHTWZL7xjBPEinNUI=;
 b=nbZfQZtwWu4DHv3UHE/8qgh2O64qU8ptmn8FlWpVMXqVwnCOD+vXVOffkMwN0xDW7z
 K0pLAKXYYvHg+fawhMDj1MswZQuHS3qtPX69LMfsxoUhrEGQfs2dOVdK0bx+967dBFzS
 2J9A0vm4lN6MSi+QNUzlbpZHV+AzFAShHdD8SadWbChjWK05MsI/7S1U+EadKQMX8juj
 dZUY5RUTDYPzrDjC97O3lmzveIP5y8Wm00lh3s5rD0AKBpCYwjkxgCOi/6X/sJVvxXXt
 DLO4Vi7RxcrQY0wac4oCFxPqkOXZE9FGM+eOVOKw2sIp5IfYi4h/sx7SWSDl4lRVy2yp
 +veA==
X-Gm-Message-State: AOAM532FuU5KIvMGokWGd3Q0CsV0oJgDwBPO4jBS3KHrHwl7FJ4b+o+3
 +/l+HbKiS12r4twYsWqXA27hyT9o74LOd2fukNEgIanyS//aPxcYzBEEpvlerm+YDc4fJdpk6JK
 GYrVTUU7ZT7/eQoHhbYFkA54ywB6M53OhdxtbyVze3y1PCsbqI4NRYVlyCPMCL4Vg
X-Received: by 2002:a05:6a00:1810:b0:4e1:2d4f:14aa with SMTP id
 y16-20020a056a00181000b004e12d4f14aamr1206051pfa.43.1644992962479; 
 Tue, 15 Feb 2022 22:29:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnbVcMOLTbjpOKLhe6BgbMMLXwwWks8u0Ledv/ePC16s9RVg5PGtp8m6TRlyECT1jF3w+BLg==
X-Received: by 2002:a05:6a00:1810:b0:4e1:2d4f:14aa with SMTP id
 y16-20020a056a00181000b004e12d4f14aamr1206020pfa.43.1644992962132; 
 Tue, 15 Feb 2022 22:29:22 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.29.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:29:21 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/20] migration: Add pss.postcopy_requested status
Date: Wed, 16 Feb 2022 14:27:57 +0800
Message-Id: <20220216062809.57179-9-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This boolean flag shows whether the current page during migration is triggered
by postcopy or not.  Then in ram_save_host_page() and deeper stack we'll be
able to have a reference on the priority of this page.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 25a3ab5150..1ed70b17d7 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -413,6 +413,8 @@ struct PageSearchStatus {
     unsigned long page;
     /* Set once we wrap around */
     bool         complete_round;
+    /* Whether current page is explicitly requested by postcopy */
+    bool         postcopy_requested;
 };
 typedef struct PageSearchStatus PageSearchStatus;
 
@@ -1486,6 +1488,9 @@ retry:
  */
 static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
 {
+    /* This is not a postcopy requested page */
+    pss->postcopy_requested = false;
+
     pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
     if (pss->complete_round && pss->block == rs->last_seen_block &&
         pss->page >= rs->last_page) {
@@ -1980,6 +1985,7 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
          * really rare.
          */
         pss->complete_round = false;
+        pss->postcopy_requested = true;
     }
 
     return !!block;
-- 
2.32.0


