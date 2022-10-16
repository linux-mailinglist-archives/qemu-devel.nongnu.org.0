Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDDE60001B
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 16:55:10 +0200 (CEST)
Received: from localhost ([::1]:59688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok52j-00044B-6e
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 10:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok4ze-0006gz-6J; Sun, 16 Oct 2022 10:51:59 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:43651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok4zY-0004wZ-2B; Sun, 16 Oct 2022 10:51:57 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 x31-20020a17090a38a200b0020d2afec803so8854437pjb.2; 
 Sun, 16 Oct 2022 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j+M/LBgfLwQQ7dgzwJWSgwzrPrIRyP6liEoHS6+v348=;
 b=lTzasRAcFYRFs9eFfuStC3JkARqwu2BUS8/x11YLj//wrIPLAdUmvxcyKm0K+D2DW4
 YaUnS/73qiDlCraJjAY9yBlVED9cGC+mOnAZTcilbAwMtaRVlMwb0cYV6OGfZt+q1pXl
 JtCrEoT+MCvRIXvNA/rhvceHO997kThcVtK66S2E4g9jKjqJLfElPiCbVmsWavBZzgfz
 2/RKo7aPLqwx6Ka09iShiuK/efTc6+uBXJ/S299jcqmTyIM5v6uDKex2nE18M14gCktz
 bkfwcI6N18rIYuU1uakfBTuetc7W9LHBg+I6VapkQzd7wXJ4ylxtMCAPeB5fmgzCYA4V
 RYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j+M/LBgfLwQQ7dgzwJWSgwzrPrIRyP6liEoHS6+v348=;
 b=bvNVVZ9X/lAMIY3a0kJgC4758CxBt2NLShu29UJi9w62DaA1n16zHBwnPK8nNgscPZ
 dBptHzcXlQFw/Uk69nXEJqRtBrgfkj+Gncf2faHRwjEHjn9tv/WfGOi/wE0naYGa4T/B
 XMY/3eCAdP6owjv4VktMSBhiQc180AZcUJ4Oz09Co968pUNflCXt4+HTpKAxcZ6MyPic
 6zHeHiwAZb21cohH8FYt7nbi/Mo7xKTwcegNQZqXE5kOvQWZAvyYjBHAYEtQ9CoOX96j
 oqAF7KZlxmz3CbqHFBHLWyYjNEeaZnbe1yHz+H+tPFZd1eVIGkTavbD0/VrbErG6AjYw
 p9RA==
X-Gm-Message-State: ACrzQf1NOTdUVCEs4P8AdEpEIQ3puN6qAVb9o1fq37jEEB994dcpDt6Y
 LMfs29AdkKsG1Sh3gOfZqTcSTTlA+LoAlQ==
X-Google-Smtp-Source: AMsMyM75ijuwZ+98WaV/O20PScdu/D33fRytiqnxC+Y4Z7raf1NWqQe1Dx1w2Y+20PJd5iw/EmIQTw==
X-Received: by 2002:a17:90b:1e0b:b0:20d:7ddf:9b08 with SMTP id
 pg11-20020a17090b1e0b00b0020d7ddf9b08mr8704318pjb.187.1665931909446; 
 Sun, 16 Oct 2022 07:51:49 -0700 (PDT)
Received: from roots.. ([183.221.93.248]) by smtp.gmail.com with ESMTPSA id
 z27-20020aa79e5b000000b005377c74c409sm5143619pfq.4.2022.10.16.07.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 07:51:48 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, hare@suse.de, Eric Blake <eblake@redhat.com>,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v12 4/7] raw-format: add zone operations to pass through
 requests
Date: Sun, 16 Oct 2022 22:51:07 +0800
Message-Id: <20221016145110.171262-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016145110.171262-1-faithilikerun@gmail.com>
References: <20221016145110.171262-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

raw-format driver usually sits on top of file-posix driver. It needs to
pass through requests of zone commands.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/raw-format.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index f337ac7569..bac43f1d25 100644
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
@@ -615,6 +626,8 @@ BlockDriver bdrv_raw = {
     .bdrv_co_pwritev      = &raw_co_pwritev,
     .bdrv_co_pwrite_zeroes = &raw_co_pwrite_zeroes,
     .bdrv_co_pdiscard     = &raw_co_pdiscard,
+    .bdrv_co_zone_report  = &raw_co_zone_report,
+    .bdrv_co_zone_mgmt  = &raw_co_zone_mgmt,
     .bdrv_co_block_status = &raw_co_block_status,
     .bdrv_co_copy_range_from = &raw_co_copy_range_from,
     .bdrv_co_copy_range_to  = &raw_co_copy_range_to,
-- 
2.37.3


