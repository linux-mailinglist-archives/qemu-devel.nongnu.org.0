Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07F4611AC2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:19:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUrB-0001hL-Ud; Fri, 28 Oct 2022 15:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUrA-0001gt-Gk
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:28 -0400
Received: from esa10.hc2706-39.iphmx.com ([216.71.140.198])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUr8-00031O-Uf
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:28 -0400
X-IronPort-RemoteIP: 209.85.166.71
X-IronPort-MID: 235579308
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2xvnGaANYv8LlBVW/5jhw5YqxClBgxIJ4kV8jS/XYbTApD5002EHz
 WYdWjqPPfffZzf8e9t+Otu//RhVusSByodhTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyCULOZ82QsaDhNs/jT8EgHUMna41v0gHRvPZing3eDzxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu+Tnn8iG9Y+DiDX4pZiYJVOtzAZzsAEPgfXA9JHAatfo23hc9mcU
 7yhv7TpIesiFvSkdOjwz3C0usyxVEFL0OavHJSxjSCc50HJKl3t2/hnN04zZ90b9fpsUFhF6
 dVNfVjhbjjb7w636LeyS+0ph8N6ace0ZcUQvXZvyTyfBvEjKXzBa/+StJkIgXFp2J4IQq+2i
 8kxMFKDaDzJZw1JNk0/Ao94keu17pX6W2cD9Q/K9PFvswA/yiR20+KwNfXwJOauSJ0Kkx3Im
 37Z5HvAV0Ry2Nu3jGDtHmiXrvbCmD6+VI8MGbmQ8Plsj1uOgGsJB3UruUCTpPC4jgu/XIsaJ
 RNNvCUpqqc2+QqgSdyVswCEnUNodyU0A7J4e9DWIinWokYIy2513lQ5cwM=
IronPort-HdrOrdr: A9a23:eqRyMqFMLoCR75u5pLqENMeALOsnbusQ8zAXPiFKOGdom6mj/P
 xG88506faZslsssTIb6LS90dC7IE80rKQU3WBzB8bBYOCFghrREGgK1+KLqQEIfReOk9K1vp
 0OT0ERMrHN5BdB/KHHCaSDYrAd6cjC2pqBwc3Zy25pTQlsYa0l1QFkEQyWe3cGJzWuQaBJba
 ah2g==
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 15:17:17 -0400
Received: by mail-io1-f71.google.com with SMTP id
 f17-20020a5d8591000000b006bcbe59b6cdso4943305ioj.14
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GgsC9drkjsxk4oyLe5Cp3wBBVsfVPperDzRvSbbTlmQ=;
 b=Vzhj2BlAuGrx8uvYE97JvdHNR80Od1SUt962y5I+fK09lnsElLOg/+5lUa6YG7eJ6S
 O5znDu2lZ2KWFFMWhXFvTh9jrEj4Gruww6Imyytgx6EGXskyrJVh9+03gKzu0wqoyQMk
 i34U48KG8i/Ojo8ay2ageNWA6Dow0/aW3jq6xagr/5v8xI9NsZRU06FS2nepDpCtm+IY
 MTfYnOkMjHdtxVPr1QAJav1REOMsxlanQF4K7Ogf++LzM90fUEZFHlOjxJuU6N8UHpcz
 /Ebhw28iNaNS9wzNEgiIvobTVsq7l2EkGDlxZ/eiZzrakk1lsB7f7RBUduU1VEZfpiOP
 noqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GgsC9drkjsxk4oyLe5Cp3wBBVsfVPperDzRvSbbTlmQ=;
 b=fIncW7wMy1J5V8Z30OkL6x1TzJ3zs347qqedTscB5wW2nAm9CqeZms39yMAqDd8PPf
 kE8O4uMr4s5vZELjrWaBSeLk4iiLqN2KabC3/o9lNMKrYinF9ixCEgobFSv/iEWsTkFW
 tUhL8Wr7c6eWgpVzMukXyW2nsqUCB3ph3D/VQmbrgTT+2Kj3tWVzfwBkLYNAqbUNfr9r
 Br6qwlezrn0lQJPxHkSOsAuCnhJDh94D/L9uoMMdzFfupqwEZEaesYycBmEPzMi8LOC1
 whcGKFuZg6UtMRr3o6c4F15Pq97cje6has3DcT3n+loiWr7wNegzw4FwZdb8HBWolvkq
 TJAg==
X-Gm-Message-State: ACrzQf0tiEBucawW4jiwbkUyM3jGzpFAqP6kLetwMRP1A7JLeetc1TgH
 aBPCvkesj8dpxAYaJ1Ypx0YV43hLoVYl87ZGXa+6Dv5HqyBMYTm9OwwYhMgZYeTFTs4TEICItwK
 Eu1OriUegrYXSNjds0g/RVLIqQ/7pyA==
X-Received: by 2002:a05:6602:2e04:b0:6c6:641e:c174 with SMTP id
 o4-20020a0566022e0400b006c6641ec174mr497094iow.215.1666984637383; 
 Fri, 28 Oct 2022 12:17:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4HUQQYOZDaBmUNyb/xAsrVrtg+Q4qO7k/1iU4w6a+gotL0tjGXJVvPN8o80A3QstrYKGsSOg==
X-Received: by 2002:a05:6602:2e04:b0:6c6:641e:c174 with SMTP id
 o4-20020a0566022e0400b006c6641ec174mr497064iow.215.1666984637157; 
 Fri, 28 Oct 2022 12:17:17 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056e021c0500b002fff117027dsm1878505ilh.13.2022.10.28.12.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 12:17:16 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v3 2/7] dma-helpers: switch to guarded DMA accesses
Date: Fri, 28 Oct 2022 15:16:43 -0400
Message-Id: <20221028191648.964076-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221028191648.964076-1-alxndr@bu.edu>
References: <20221028191648.964076-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.198; envelope-from=alxndr@bu.edu;
 helo=esa10.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 softmmu/dma-helpers.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7820fec54c..ba2ad23324 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -90,9 +90,9 @@ static void dma_blk_unmap(DMAAIOCB *dbs)
     int i;
 
     for (i = 0; i < dbs->iov.niov; ++i) {
-        dma_memory_unmap(dbs->sg->as, dbs->iov.iov[i].iov_base,
-                         dbs->iov.iov[i].iov_len, dbs->dir,
-                         dbs->iov.iov[i].iov_len);
+        dma_memory_unmap_guarded(dbs->sg->dev, dbs->sg->as,
+                dbs->iov.iov[i].iov_base, dbs->iov.iov[i].iov_len, dbs->dir,
+                dbs->iov.iov[i].iov_len);
     }
     qemu_iovec_reset(&dbs->iov);
 }
@@ -130,8 +130,8 @@ static void dma_blk_cb(void *opaque, int ret)
     while (dbs->sg_cur_index < dbs->sg->nsg) {
         cur_addr = dbs->sg->sg[dbs->sg_cur_index].base + dbs->sg_cur_byte;
         cur_len = dbs->sg->sg[dbs->sg_cur_index].len - dbs->sg_cur_byte;
-        mem = dma_memory_map(dbs->sg->as, cur_addr, &cur_len, dbs->dir,
-                             MEMTXATTRS_UNSPECIFIED);
+        mem = dma_memory_map_guarded(dbs->sg->dev, dbs->sg->as, cur_addr,
+                &cur_len, dbs->dir, MEMTXATTRS_UNSPECIFIED);
         /*
          * Make reads deterministic in icount mode. Windows sometimes issues
          * disk read requests with overlapping SGs. It leads
@@ -145,7 +145,7 @@ static void dma_blk_cb(void *opaque, int ret)
                 if (ranges_overlap((intptr_t)dbs->iov.iov[i].iov_base,
                                    dbs->iov.iov[i].iov_len, (intptr_t)mem,
                                    cur_len)) {
-                    dma_memory_unmap(dbs->sg->as, mem, cur_len,
+                    dma_memory_unmap_guarded(dbs->sg->dev, dbs->sg->as, mem, cur_len,
                                      dbs->dir, cur_len);
                     mem = NULL;
                     break;
@@ -296,7 +296,8 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         dma_addr_t xfer = MIN(len, entry.len);
-        res |= dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
+        res |= dma_memory_rw_guarded(sg->dev, sg->as, entry.base, ptr, xfer,
+                                     dir, attrs);
         ptr += xfer;
         len -= xfer;
         xresidual -= xfer;
-- 
2.27.0


