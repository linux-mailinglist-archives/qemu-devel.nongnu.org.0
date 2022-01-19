Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FCF49361D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:20:04 +0100 (CET)
Received: from localhost ([::1]:34380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6CJ-0001Qy-4L
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:20:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62T-0006xB-Ot
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62Q-0000tC-LE
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PSDx2fKo/UzR+lo/LkmSaHIqGIyIJEzEwY50huIabEg=;
 b=JVZyKDqWgrZvfriZ5sjm3ZBcBn4Y+zFZAOzduUQrNYvnJyB+EE1zNJ+fIDCJyHNd9ZD5lA
 gZ7me99hmgFwZ1NYvgb/Pfa23uNZvsJUtiAnkFOjCRQyFN4VMp07TbJARgTD9PUadw7BBl
 RvrOHVtGEmKNIAYJXo0c53YwmWQtB+U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-JsNUn9pvPQStKRL1S6cjhQ-1; Wed, 19 Jan 2022 03:09:46 -0500
X-MC-Unique: JsNUn9pvPQStKRL1S6cjhQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n13-20020a05600c3b8d00b0034979b7e200so789627wms.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PSDx2fKo/UzR+lo/LkmSaHIqGIyIJEzEwY50huIabEg=;
 b=BdJbafelxNlxisVXS3+BCVu9tIJompaT9lwjdf8JfyViXCvBM6V39WzPMew6a0tZ58
 gU910L5/asIbOJ6P2pXS2Xdaao2ebnkVf2HFa8Jal+lmr60rzlo0rkGHnukj2NGQRa6C
 Jj9fHj/twYhTqshrHtme4KKu63gVmpjcCaValqDFJoc50MVwJDrkcu/SQoWBXoEQJvh+
 7D3A+Wa9amMv/kCrx/BMbif2riqvQb162J3G2clYF0OvzuC7BGKnS9jmtorHQQDaTFX3
 E5izau2TvyP12tCdegv4MrTHl9l+jyRJeVQzPRIuyIPM9umSuPXkplncT9ny/l/3S3HF
 5PQg==
X-Gm-Message-State: AOAM530fP07Lx0FVSLrba8ryZwsl7n5b88UQZXG5NmWWDcb3maYVKTYW
 qeQOhu3kDYs48npo3y77MF05vFGchg+y08LQV0oMOpwfjKhBRPNXjsqvrcHpxWIJ+KbWjX6sASF
 pNETTQTkK97GPoBzNVbPenfj4t8EXfTrSu+Ap4GkwAvFjMvFPrm4kdgxZNIPmeAvm
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr27930627wry.194.1642579784740; 
 Wed, 19 Jan 2022 00:09:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPd+iHNYr5kRzcHnL3fDPcT4VfyS9DWZVfH0BHXl083Z3n+zwCmWaTZWoIn51fzyXdlMMkIw==
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr27930602wry.194.1642579784523; 
 Wed, 19 Jan 2022 00:09:44 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.09.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:09:44 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 01/15] migration: No off-by-one for pss->page update in
 host page size
Date: Wed, 19 Jan 2022 16:09:15 +0800
Message-Id: <20220119080929.39485-2-peterx@redhat.com>
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
Cc: Juan Quintela <quintela@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to do off-by-one fixup for pss->page when finished one host huge page
transfer.  That seems to be unnecesary at all.  Drop it.

Cc: Keqian Zhu <zhukeqian1@huawei.com>
Cc: Kunkun Jiang <jiangkunkun@huawei.com>
Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 5234d1ece1..381ad56d26 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1611,7 +1611,7 @@ static int ram_save_release_protection(RAMState *rs, PageSearchStatus *pss,
     /* Check if page is from UFFD-managed region. */
     if (pss->block->flags & RAM_UF_WRITEPROTECT) {
         void *page_address = pss->block->host + (start_page << TARGET_PAGE_BITS);
-        uint64_t run_length = (pss->page - start_page + 1) << TARGET_PAGE_BITS;
+        uint64_t run_length = (pss->page - start_page) << TARGET_PAGE_BITS;
 
         /* Flush async buffers before un-protect. */
         qemu_fflush(rs->f);
@@ -2230,7 +2230,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
              offset_in_ramblock(pss->block,
                                 ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
     /* The offset we leave with is the min boundary of host page and block */
-    pss->page = MIN(pss->page, hostpage_boundary) - 1;
+    pss->page = MIN(pss->page, hostpage_boundary);
 
     res = ram_save_release_protection(rs, pss, start_page);
     return (res < 0 ? res : pages);
-- 
2.32.0


