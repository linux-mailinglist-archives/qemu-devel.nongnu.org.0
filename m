Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D52749364E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:27:30 +0100 (CET)
Received: from localhost ([::1]:43020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6JO-0007t2-NZ
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:27:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62W-0006xF-Ch
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:09:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62S-0000tc-Jp
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5w+DAZKfAMMjbu0RXHKRc9bVXuM3CL/GD3quFyKBLo=;
 b=OWgHAboTuF72G6TMGiNI8YfyNwXThfEtPH1GWKNMF+x0qSuc2egN9cs+d3K3xbIR2TXDSt
 U6lRntOQzRGuLBQnRKN9wLwdgJs9GBWDw9527oIM7NcUTFdb/4yHNL5xheOvwrSOjlgaOA
 ourOHKcJ1DncCsO+XuxtVpeIEfJja6Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-IuoSFsOvOU2Yf76F8Gxs8w-1; Wed, 19 Jan 2022 03:09:51 -0500
X-MC-Unique: IuoSFsOvOU2Yf76F8Gxs8w-1
Received: by mail-wm1-f69.google.com with SMTP id
 c188-20020a1c35c5000000b00346a2160ea8so782436wma.9
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p5w+DAZKfAMMjbu0RXHKRc9bVXuM3CL/GD3quFyKBLo=;
 b=vGCQ1fFvmx2md8nXBZJ3EueJt6FWn3d87moTPVkwRTVZAIBH3ezfP2NmH/3WSgGZ43
 9dPU7bZdVyR4lLRlA6pL2OiS0L3HA9UJbuDzkKMj5tdXwx4NQ3jYwAu+PHn0evoyedAW
 pX1LrqB567sWn6jJq+46GdDqJA1I5rlRyG02S+xKLXow6SnXZhI7nymLes3F1Ec5JPzv
 Yq+5qCYnD+iR94mZH6zxy3Ka2kCfgeqwOz8P9q1BSZgUvKSsEflT3i/16pj+x1fayLHZ
 MV9RKayCGYd9rO88+4oHOpi5fDvYHZydOjQSpKny1cPGddCRsu9Iy+COkFxn7d5LOdwZ
 ve4Q==
X-Gm-Message-State: AOAM533sDuIzGbXYod0RmL4K+Jg/xopND6iVv/vpDfdWKSGj7CqfOuoB
 IcKyGObdvT1AIDEkpvEGOV3kNCzcf0yw/SyVblxvbIKjABNONAiZFPRV8dwD4LDz+QV+TYg6YZ0
 nzUbdSw2su7s0o9HARV475bVd+6jmNuU3jiiqXspcQjVPWgeo6NsJrH+GIeOE21z2
X-Received: by 2002:a5d:5590:: with SMTP id i16mr26735084wrv.34.1642579789469; 
 Wed, 19 Jan 2022 00:09:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDq09WHGjvr6pY/lTc9mBrSZ0ODNH6EBrgcxeiI1OK1gDbx+zLeK79lgXuW3uWuHUVS9q2mA==
X-Received: by 2002:a5d:5590:: with SMTP id i16mr26735057wrv.34.1642579789121; 
 Wed, 19 Jan 2022 00:09:49 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.09.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:09:48 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 02/15] migration: Allow pss->page jump over clean pages
Date: Wed, 19 Jan 2022 16:09:16 +0800
Message-Id: <20220119080929.39485-3-peterx@redhat.com>
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
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit ba1b7c812c ("migration/ram: Optimize ram_save_host_page()") managed to
optimize host huge page use case by scanning the dirty bitmap when looking for
the next dirty small page to migrate.

However when updating the pss->page before returning from that function, we
used MIN() of these two values: (1) next dirty bit, or (2) end of current sent
huge page, to fix up pss->page.

That sounds unnecessary, because I see nowhere that requires pss->page to be
not going over current huge page boundary.

What we need here is probably MAX() instead of MIN() so that we'll start
scanning from the next dirty bit next time. Since pss->page can't be smaller
than hostpage_boundary (the loop guarantees it), it probably means we don't
need to fix it up at all.

Cc: Keqian Zhu <zhukeqian1@huawei.com>
Cc: Kunkun Jiang <jiangkunkun@huawei.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 381ad56d26..94b0ad4234 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2229,8 +2229,6 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
     } while ((pss->page < hostpage_boundary) &&
              offset_in_ramblock(pss->block,
                                 ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
-    /* The offset we leave with is the min boundary of host page and block */
-    pss->page = MIN(pss->page, hostpage_boundary);
 
     res = ram_save_release_protection(rs, pss, start_page);
     return (res < 0 ? res : pages);
-- 
2.32.0


