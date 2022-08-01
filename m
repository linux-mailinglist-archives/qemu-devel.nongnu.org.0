Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AC5586258
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 03:43:12 +0200 (CEST)
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIKSd-0000kT-Cf
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 21:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKJI-0003Ge-3N; Sun, 31 Jul 2022 21:33:34 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKJE-0000d5-Qv; Sun, 31 Jul 2022 21:33:30 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so10472618pjl.0; 
 Sun, 31 Jul 2022 18:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=rbTfjrlfp2f4Jk/H8zP36u4wj3Q7NZoPN3xcxEBsKtM=;
 b=mRqGa60nR917gKy4fvXB6TgcrZDyf3+aVsAvS0JXNFBSXP3ZbW086Nn9ZCm9JTPy/j
 K6w/kEAofqTHCsehOQpXnpAzdpScw9fEPK+hyKRnbVF9C+o6gprUqtrk556fCjyuNVVk
 2yYj4tjtzAxQ67Ir/2EoqsG34CLJ/rBCzKJtmWM/gPzEhd9G9Q8UEXcBSaCxi/HOW843
 35grT/0pWFPJirn7/ixjXWtQdOo7Q1GtzuQwLoPjXG8GqARY3SxyS+i/NDHiBD/tvcBZ
 RtnzTqAZ4iV7lBmPMUNzfo1gBi50jpRVp1Ze/yvqM1QHHCo2AApQiZLfq+k44v90IBms
 Ar5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=rbTfjrlfp2f4Jk/H8zP36u4wj3Q7NZoPN3xcxEBsKtM=;
 b=ATtono6sPVAfleRl+qWExq6AEts49aXG3sHkT0q3XRCzIbd9XnnN0l+RjJc64WUPJf
 JlzPZHVB2/NstvCx10ygQlkPkUwIbqGzQhOTZJK8KGRbw3Qy7e1YuotL6r3vSFG3Lrv0
 7pMT1yvDrqYY+JbLaOp9Chv1x0I58tSzXbtlGqAUHp0x+UAECU6qKU4AO8vlCZDu6bd7
 yXih93m8rwpfR8se95odcM9Ifvr7FeQwW1tnaP4hMy6+z99RDyDw211BKsJBFn8Wbydn
 Iq5z9LlkxL0S9+0uZMu8HOsxsHK2Cts9eOcJYWCXWFFukgPZ2jW25WcQizRg47OwzOGl
 n4mw==
X-Gm-Message-State: ACgBeo0phPEQCNDUIJ1g2kRMzk8FhCNt00sG1lc80bHICiMGn5zNPGPb
 SeLvwVW3RNVhm2z1Dx2Ac4Cn09dxIIMutuF8
X-Google-Smtp-Source: AA6agR5HzLd1FEKVUQixZ8jHSWJ6rJ6pmL2JWosOs2XRX2p3yra83yXUwCzKNJUH1vG9QC7FxP0KWg==
X-Received: by 2002:a17:903:244e:b0:16d:d5cd:c184 with SMTP id
 l14-20020a170903244e00b0016dd5cdc184mr12733134pls.44.1659317606873; 
 Sun, 31 Jul 2022 18:33:26 -0700 (PDT)
Received: from roots.. ([106.84.131.7]) by smtp.gmail.com with ESMTPSA id
 c136-20020a621c8e000000b0052ab54a4711sm4886017pfc.150.2022.07.31.18.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 18:33:26 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de,
 stefanha@redhat.com, mst@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 06/11] raw-format: add zone operations to pass through
 requests
Date: Mon,  1 Aug 2022 09:33:18 +0800
Message-Id: <20220801013318.10607-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

raw-format driver usually sits on top of file-posix driver. It needs to
pass through requests of zone commands.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/raw-format.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 69fd650eaf..6b20bd22ef 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -314,6 +314,17 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
     return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
+static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int64_t offset,
+                                           unsigned int *nr_zones,
+                                           BlockZoneDescriptor *zones) {
+    return bdrv_co_zone_report(bs->file->bs, offset, nr_zones, zones);
+}
+
+static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
+                                         int64_t offset, int64_t len) {
+    return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
+}
+
 static int64_t raw_getlength(BlockDriverState *bs)
 {
     int64_t len;
@@ -614,6 +625,8 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pwritev      = &raw_co_pwritev,
     .bdrv_co_pwrite_zeroes = &raw_co_pwrite_zeroes,
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
+    .bdrv_co_zone_report  = &raw_co_zone_report,
+    .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
-- 
2.37.1


