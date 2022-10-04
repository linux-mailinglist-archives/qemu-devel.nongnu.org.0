Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D73A5F4949
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 20:30:20 +0200 (CEST)
Received: from localhost ([::1]:39904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofmgN-0003ko-5d
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 14:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmaz-0007SS-Mr
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofmaq-0005dh-Do
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 14:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664907875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYjTCxwzaR6k7X+/FwHHerSAsgrOKjvz+lTgu/qcCzM=;
 b=M+zFfMrwm5K4CM4HOPBZf45gvkxkHiEKsOq18MMzY57O0hHMQO9LR/rehBzlxhX0G4bZj7
 MD4Q9tdc57mD3BCC6EqmdNdVcN9rgfYCC5oA8cSg2VLVDgluddRoa+ciss4H1MVx8hVmXd
 KVY6I3s+ISUw2j9mJg/3mcpnc3uYiJk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-379-IZxmu4K6MzyV76XcarZJAw-1; Tue, 04 Oct 2022 14:24:34 -0400
X-MC-Unique: IZxmu4K6MzyV76XcarZJAw-1
Received: by mail-qk1-f197.google.com with SMTP id
 bm21-20020a05620a199500b006cf6a722b16so12270082qkb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 11:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TYjTCxwzaR6k7X+/FwHHerSAsgrOKjvz+lTgu/qcCzM=;
 b=wIFrfdR8zP3lO3f3OCQ/UR5XCOubOGQDYPgS38WY81m2sESb1FPnpVArf326nd0An+
 PyAXd1lk2tld3YQpdOM+Ee45Aux2gqups2lbRhYYvG9tzaXt++r+z/t1U7cpmUa5sett
 Rtlgu7dGSpFvJRhLax5+rLGsZvcj4ZVwKnY+L3LMBXt2DdYkv1ZkpoMYcEndVv7uqk1L
 Es2CAZJtBsnZwEEBaV12KXwQpNrWroqkYeZTFZ+w4gJbreWF9tU2erhi6dLLfQ7CJK36
 GIUCJXHbsBr3ekjI31DG4+WMc828qMwlEuGoxkvlcYbe3U/j8KAokHG0ZppffKPsXKUx
 RDAg==
X-Gm-Message-State: ACrzQf0SMahbGKzod5EjNcpDdGSFl/LcEviZHWvLYD6dkO22TOy6xC9+
 +phr4s73VJao4fY6tYdSdysVkMLVJaD8ylBuNtDHY/oHIrAbAeVlFu6JvaKPds2+4NA2N17NSMa
 5OkehRiPf5B6UOyrzNn/MDb96MA4ZP3HTIFW+wv0T+Rz8k3EWFw2e7NEmeQnCL0s1
X-Received: by 2002:a05:622a:13:b0:35d:5558:6bfa with SMTP id
 x19-20020a05622a001300b0035d55586bfamr20881802qtw.160.1664907873425; 
 Tue, 04 Oct 2022 11:24:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7dj/2WfYeorJZ3cW8Sn154yvieu/l5+dREPEcbwBTzMt/QJ1rkxJ7Bn7t+8DNfqqQ2YO56ZA==
X-Received: by 2002:a05:622a:13:b0:35d:5558:6bfa with SMTP id
 x19-20020a05622a001300b0035d55586bfamr20881780qtw.160.1664907873176; 
 Tue, 04 Oct 2022 11:24:33 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 i1-20020ac813c1000000b0035c1e18762csm12334514qtj.84.2022.10.04.11.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 11:24:32 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v2 1/5] migration: Fix possible infinite loop of ram save
 process
Date: Tue,  4 Oct 2022 14:24:26 -0400
Message-Id: <20221004182430.97638-2-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004182430.97638-1-peterx@redhat.com>
References: <20221004182430.97638-1-peterx@redhat.com>
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

When starting ram saving procedure (especially at the completion phase),
always set last_seen_block to non-NULL to make sure we can always correctly
detect the case where "we've migrated all the dirty pages".

Then we'll guarantee both last_seen_block and pss.block will be valid
always before the loop starts.

See the comment in the code for some details.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index dc1de9ddbc..1d42414ecc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2546,14 +2546,22 @@ static int ram_find_and_save_block(RAMState *rs)
         return pages;
     }
 
+    /*
+     * Always keep last_seen_block/last_page valid during this procedure,
+     * because find_dirty_block() relies on these values (e.g., we compare
+     * last_seen_block with pss.block to see whether we searched all the
+     * ramblocks) to detect the completion of migration.  Having NULL value
+     * of last_seen_block can conditionally cause below loop to run forever.
+     */
+    if (!rs->last_seen_block) {
+        rs->last_seen_block = QLIST_FIRST_RCU(&ram_list.blocks);
+        rs->last_page = 0;
+    }
+
     pss.block = rs->last_seen_block;
     pss.page = rs->last_page;
     pss.complete_round = false;
 
-    if (!pss.block) {
-        pss.block = QLIST_FIRST_RCU(&ram_list.blocks);
-    }
-
     do {
         again = true;
         found = get_queued_page(rs, &pss);
-- 
2.37.3


