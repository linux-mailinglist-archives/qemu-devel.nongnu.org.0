Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FB25BF189
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:51:39 +0200 (CEST)
Received: from localhost ([::1]:56946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oan1e-0008Oc-AB
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam5D-0003lO-K9
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam5C-0001QQ-0P
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663714273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fBntkORANdSFcod4owFYGT32WIlQPkv35mQCzO/lmko=;
 b=WQ8hR1G1yN2KnkDOZv8DW+N7NA05zdfCWtd9+6XY5RFaBFrK9eDan7vsHTvi9qQn/v8dEG
 lb7T6o1A6espThe/z1CIvOa+wYMJ6bCG40gNihNceWam5F6zfNSR/jXDGYMkpmq8Y8x4MQ
 FO9QL5ZNs903F3dfoP6reniB46l32jI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-cQU4iLcHNZSYrHQFpLXbdA-1; Tue, 20 Sep 2022 18:51:12 -0400
X-MC-Unique: cQU4iLcHNZSYrHQFpLXbdA-1
Received: by mail-qt1-f197.google.com with SMTP id
 e22-20020ac84b56000000b0035bb64ad562so2898110qts.17
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fBntkORANdSFcod4owFYGT32WIlQPkv35mQCzO/lmko=;
 b=wg8u0K8PS4ACWKTSy4KUKD28g8onqvWYti4L+Kj4IAaZvb7aeA/LjcUObljUJJZv8z
 cso/17BfqiECufPXSbdpyN26rol6DgGdqdRWHkTnNBLkPfyAO16k+d5aHcmMDSThJndV
 G8MIWDD/mI6gF0UAklrDMTgNjQcgz8ZQMkG3QceyOkeFYisB/70rBKQOtSjXowY6Ir2C
 U39OKvCsLkEuNGu+RiXrZvVSI2ELuDiyGFxtPDwC4Jia15wY6hd5iioWvF0zDCEToyGl
 T2iuXGytGf4nN47jG9mouwkMNAAK/gdOvrAmLPYz9ast31FjOdlioDZPRiNLDYFbIww7
 nJbg==
X-Gm-Message-State: ACrzQf1JjIOuSingZ6GPB7beLGL0UmSsKGL4FkebRR4HMf4ax8rTedzS
 HUSQ6eOvD2k/vwmzVl/l9VyO/i6FlYkUuZCPvO9mEzRh0VgJvUPSRQNktp8JrP1NFK0g3xKK2rJ
 PRfXgEeUghrl7cSkS3ghPoLLNnQjG5BDr2f4yeAq2rZpR9g86Rk+GrEWW9wIIV989
X-Received: by 2002:a05:6214:242c:b0:4a7:d1cd:427c with SMTP id
 gy12-20020a056214242c00b004a7d1cd427cmr21098951qvb.45.1663714271657; 
 Tue, 20 Sep 2022 15:51:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6vLvSwHSxZ2fg3J1Qk5vXLk0KdN1HZFHUdlbX5LWcD6oiFgSELPGNYprJGgW3it7qhTeJt9g==
X-Received: by 2002:a05:6214:242c:b0:4a7:d1cd:427c with SMTP id
 gy12-20020a056214242c00b004a7d1cd427cmr21098933qvb.45.1663714271347; 
 Tue, 20 Sep 2022 15:51:11 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 j12-20020ac8440c000000b0035d0655b079sm275470qtn.30.2022.09.20.15.51.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:51:10 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, ani@anisinha.ca,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 02/14] migration: Cleanup xbzrle zero page cache update logic
Date: Tue, 20 Sep 2022 18:50:54 -0400
Message-Id: <20220920225106.48451-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920225106.48451-1-peterx@redhat.com>
References: <20220920225106.48451-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

The major change is to replace "!save_page_use_compression()" with
"xbzrle_enabled" to make it clear.

Reasonings:

(1) When compression enabled, "!save_page_use_compression()" is exactly the
    same as checking "xbzrle_enabled".

(2) When compression disabled, "!save_page_use_compression()" always return
    true.  We used to try calling the xbzrle code, but after this change we
    won't, and we shouldn't need to.

Since at it, drop the xbzrle_enabled check in xbzrle_cache_zero_page()
because with this change it's not needed anymore.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index d8cf7cc901..fc59c052cf 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -741,10 +741,6 @@ void mig_throttle_counter_reset(void)
  */
 static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
 {
-    if (!rs->xbzrle_enabled) {
-        return;
-    }
-
     /* We don't care if this fails to allocate a new cache page
      * as long as it updated an old one */
     cache_insert(XBZRLE.cache, current_addr, XBZRLE.zero_target_page,
@@ -2301,7 +2297,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
          */
-        if (!save_page_use_compression(rs)) {
+        if (rs->xbzrle_enabled) {
             XBZRLE_cache_lock();
             xbzrle_cache_zero_page(rs, block->offset + offset);
             XBZRLE_cache_unlock();
-- 
2.32.0


