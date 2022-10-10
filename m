Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F5C5F96C4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 04:26:33 +0200 (CEST)
Received: from localhost ([::1]:52134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohiUz-000271-1e
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 22:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiQb-0002aU-7B; Sun, 09 Oct 2022 22:22:02 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiQZ-0006KK-GT; Sun, 09 Oct 2022 22:22:00 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 d7-20020a17090a2a4700b0020d268b1f02so2467990pjg.1; 
 Sun, 09 Oct 2022 19:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AIHQcxGv2y7N0tWFmPYr9OaOhU+lEkTYpY2ZatQLIvY=;
 b=OdzwEI9baHVSpkXSL6AT8tgapYJSIij0rNXPl6WmHAoFpeYttAOdYNW24KvGMof1DM
 okK/jkXO/pxDevOxdkaKjpXvAVooPt3xJWFv41P8CRRjLpnBL6YM9Ya/4KncAHo9k1oq
 yn+qxhnHU8vMiAXrMufhYUq750zG0BJdJeDzKAfGYWySBY8rZxaEDUBUkpn5+GGKz5Pr
 7+Ii5mDju2fUe6BD/AQIGzx2xtzARoDujnIZEoe2m9Y964ATiYyfGqPb7Gop04ld8ZtI
 DvxOT3GOBEptJt964b36E3YbdYeRWIo449rANQSSg5Tr9r8HFr6TIAkFLCUr5Brh4LO6
 0Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AIHQcxGv2y7N0tWFmPYr9OaOhU+lEkTYpY2ZatQLIvY=;
 b=M06D7cDJH5Yg6Mt9oLJez9f34CAdkUir5xkqpmEDCMq+nNcKc14vEn61c1GdbCBioc
 ioAUpWGO+pFxu8UysjreEB22DqCV1n6bVZarbjeXJHti/Xv+nSZf+AkC5yAUHkPKJB/r
 qQoaEyJRordfPf9rgtKS8ST/Hy5AVNEQcNadFkLIf0PD8Ptdl3tVXvtUDiAiKXvWCECp
 Qkkaje1b5RgZ4wp5MAR1zPQ25bc2m3zBPHPnutAzMW6SBRs+WcknY3NTX0ySTJVVm/9h
 AOpEprpaqqOkQkxUJzjScCQ6RC8Ld28ZwWKAFQ7JkBI99uDId1VWU/RDa5Lh+ctcuRAM
 G0tg==
X-Gm-Message-State: ACrzQf2cj9hbN7yi1aMfqgXqAaIaSdCFjIq9MdZodwPSZF+lBAaDhAJh
 RQZRMSZ91nNNyNhIMJvYqDGsPKMGPvU3w/cqDvM=
X-Google-Smtp-Source: AMsMyM53hB7/ye56iTMbjIUW7JXd/icCChzH8ccSJ1421O/XaZsoEDXevIod3zncTMNyVIRQhSGBLg==
X-Received: by 2002:a17:903:41cc:b0:176:d89d:63e3 with SMTP id
 u12-20020a17090341cc00b00176d89d63e3mr16879265ple.31.1665368516832; 
 Sun, 09 Oct 2022 19:21:56 -0700 (PDT)
Received: from roots.. ([112.44.203.212]) by smtp.gmail.com with ESMTPSA id
 l12-20020a170902f68c00b00178323e689fsm5372740plg.171.2022.10.09.19.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 19:21:56 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 hare@suse.de, damien.lemoal@opensource.wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v11 4/7] raw-format: add zone operations to pass through
 requests
Date: Mon, 10 Oct 2022 10:21:13 +0800
Message-Id: <20221010022116.41942-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010022116.41942-1-faithilikerun@gmail.com>
References: <20221010022116.41942-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1033.google.com
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
---
 block/raw-format.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index c7278e348e..618c6b1ec2 100644
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
2.37.3


