Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575205A527E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:02:49 +0200 (CEST)
Received: from localhost ([::1]:59566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSi9w-0008LZ-8A
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4X-0002d7-II
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oSi4V-0008Fg-HB
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 12:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661792228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgr99bIWyM5L4P9pc8hfhC39aU33CUh7xyLzYjt26gI=;
 b=N2ylz5kxbfKJOpDOKF+dluTfqTyMg3BU5Blbqvw8/57vb+daiWP3gWlKkpbpXu2/waAOQK
 oxihFl6MmmvdLZPY8h+hYR42PtNOsyBee0nQYXukKGoENmv/6RCT7kzv6zZ6tJ6eMib4SE
 Zl/Oqfwllw3MlWdnk3ss9QaGLj0AQXQ=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-542-h9Ay70-BOZm47rYEAzDrWA-1; Mon, 29 Aug 2022 12:57:07 -0400
X-MC-Unique: h9Ay70-BOZm47rYEAzDrWA-1
Received: by mail-il1-f198.google.com with SMTP id
 k9-20020a056e021a8900b002e5bd940e96so6334815ilv.13
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 09:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rgr99bIWyM5L4P9pc8hfhC39aU33CUh7xyLzYjt26gI=;
 b=fQ9NpN9fyRCyx/TbViHp5IGmJYoWj5Ea/WaqsgJEuHkZyEVxAk+6vw8yhuY6+GnOQL
 AyuDYW+xiD2NRT/F9P2oA3toquxALJTtHe2ETRLvUKERQmwBz48ATTSTVbifagmuSwWf
 u6QVG62geOVvqisDVpVPFXL+aeRiTTBi8ClfRngohxPjR+/wQfWOIS5HY0jjm+SoiE5L
 nq0qBNkinK9NhVMsuIodL2kWNtw5mPK8vBsm1qE9kInnOOkIWuShBw4HUIJJHPSc6Jjg
 HypBI1CsCb766G+hQkSXNxTECFZTvF/tpE9LfG3wkjVf3OdjPhjbT2Fo1c7Cbx679gjZ
 0yag==
X-Gm-Message-State: ACgBeo286ubD4bD7ukg5TVyWTntlJ9PYLaSEA/QEJTIn/Tbeub7A9KS+
 8lLvb0q2TPDDm/k5j9Fj94qU3It8GXaXdsGfn9yn6BSD+ha3/LxdqL7kw+Zd5AY+J76fmfZhnTX
 7i9+Bc868i1fvAAKJ9SiJsyvocFTTdku6QdBvv5Yjpgke6Pf3jbgDtDVcBmZkF9zq
X-Received: by 2002:a05:6e02:923:b0:2eb:2f46:c97 with SMTP id
 o3-20020a056e02092300b002eb2f460c97mr1781854ilt.116.1661792226233; 
 Mon, 29 Aug 2022 09:57:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4YO8x2Mhi4UUg5anPTnYKI/M25Hhf/KcwIhMUouNhOfnK3HQItrU8NZO5cakBCFTtPoI2V/A==
X-Received: by 2002:a05:6e02:923:b0:2eb:2f46:c97 with SMTP id
 o3-20020a056e02092300b002eb2f460c97mr1781841ilt.116.1661792226041; 
 Mon, 29 Aug 2022 09:57:06 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b00344c3de5ec7sm4404709jas.150.2022.08.29.09.57.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Aug 2022 09:57:05 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 02/13] migration: Add postcopy_preempt_active()
Date: Mon, 29 Aug 2022 12:56:48 -0400
Message-Id: <20220829165659.96046-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220829165659.96046-1-peterx@redhat.com>
References: <20220829165659.96046-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add the helper to show that postcopy preempt enabled, meanwhile active.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index dc1de9ddbc..8c5d5332e8 100644
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


