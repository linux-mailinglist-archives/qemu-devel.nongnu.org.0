Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BEC5BF1C9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:12:16 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanLb-0005Xl-6n
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam5D-0003lA-Gu
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam5A-0001QF-RA
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663714272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nrFe7joiBGxWYq/BylgVOGeA8n5rVAbNSYrRgCoSmoE=;
 b=HQsJ+2hSocNgkYEZ9JDTJnqYR6REqN5l5vsX3MBwl8G6Vj47D1EiJ/4x494BCT0e8tokyr
 sM5+/ZkgpAreVWjKg32D9K2gz8CxdQTZC0o9GvQoffNLCsE0EWpEvIp3ac5+1wOeshidKx
 r6O/4ImLGsJSYJtYEf45XIlcIHaJeMc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-ywqhi4rxNgmHCiFACnqFWg-1; Tue, 20 Sep 2022 18:51:11 -0400
X-MC-Unique: ywqhi4rxNgmHCiFACnqFWg-1
Received: by mail-qv1-f69.google.com with SMTP id
 c1-20020a0cfb01000000b00495ad218c74so3065444qvp.20
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nrFe7joiBGxWYq/BylgVOGeA8n5rVAbNSYrRgCoSmoE=;
 b=hSHkcskBmv3m0/gL66A3HPu3Gz7qH/5OD9am+h0SW8zSagwro7NisBxhn0Ba9zQUzG
 wMQhbkNqkQxrzqEzqfgAESIN2M2lVtqfVK2EFbPLw9fLBgxcN1pJZexD2blbyG9McyCP
 mwhQuqfvftk87hkSmhnr4d3R4KBnJX+F15ffvwUMnH+ArigBkYZWQvFapuomnyc0t5vt
 GLfitNsmM2DY16fnuNaJJAqat2IMneBzYIB7Za9K4yHiEDWsVO8U2JdUCe7fggagwPI5
 mQz3qIroxa0QRMdsjZKt6sTjPV70ovBTn9xeGtdkeMZ29Lcx4rJf+vLdCYLQaee2sqjZ
 9PFQ==
X-Gm-Message-State: ACrzQf0b8rHuY5kykKRLrzorzIyxRqMnaYKx/LhKE8OJVubW2jnKK0Jd
 mlv4OxxV6GhK1XP1ftbOpUnMbeuGDcP3wjjssq5sQo1Xw+sLvVyANfH7LLGJDTvhNakeyoCYh3m
 xi3qC2gqrT3zmkrL7fTIxhf2k4eZyIa8TP3qyHoxxvISWMtXRReKWJvgUShPDh1xX
X-Received: by 2002:a05:620a:490a:b0:6ce:d88f:30fe with SMTP id
 ed10-20020a05620a490a00b006ced88f30femr13484513qkb.534.1663714270157; 
 Tue, 20 Sep 2022 15:51:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5R/fIYX222ygjCJQ8pnogOuVhm+XeuKINlmp67r7LfNq5bbx440igQazEksRzjHVXuLCh4XQ==
X-Received: by 2002:a05:620a:490a:b0:6ce:d88f:30fe with SMTP id
 ed10-20020a05620a490a00b006ced88f30femr13484497qkb.534.1663714269900; 
 Tue, 20 Sep 2022 15:51:09 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 j12-20020ac8440c000000b0035d0655b079sm275470qtn.30.2022.09.20.15.51.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:51:09 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, ani@anisinha.ca,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 01/14] migration: Add postcopy_preempt_active()
Date: Tue, 20 Sep 2022 18:50:53 -0400
Message-Id: <20220920225106.48451-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920225106.48451-1-peterx@redhat.com>
References: <20220920225106.48451-1-peterx@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the helper to show that postcopy preempt enabled, meanwhile active.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1d42414ecc..d8cf7cc901 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -162,6 +162,11 @@ out:
     return ret;
 }
 
+static bool postcopy_preempt_active(void)
+{
+    return migrate_postcopy_preempt() && migration_in_postcopy();
+}
+
 bool ramblock_is_ignored(RAMBlock *block)
 {
     return !qemu_ram_is_migratable(block) ||
@@ -2434,7 +2439,7 @@ static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
 /* We need to make sure rs->f always points to the default channel elsewhere */
 static void postcopy_preempt_reset_channel(RAMState *rs)
 {
-    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
+    if (postcopy_preempt_active()) {
         rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
         rs->f = migrate_get_current()->to_dst_file;
         trace_postcopy_preempt_reset_channel();
@@ -2472,7 +2477,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         return 0;
     }
 
-    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
+    if (postcopy_preempt_active()) {
         postcopy_preempt_choose_channel(rs, pss);
     }
 
-- 
2.32.0


