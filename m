Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A645EF19A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 11:15:17 +0200 (CEST)
Received: from localhost ([::1]:41640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odpdV-0008Db-2Z
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 05:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp2r-0000hr-Pj; Thu, 29 Sep 2022 04:37:25 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp2q-0007kq-74; Thu, 29 Sep 2022 04:37:25 -0400
Received: by mail-pl1-x636.google.com with SMTP id n7so687624plp.1;
 Thu, 29 Sep 2022 01:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=57QnA/2Ol0DHKqe6YXTY3Gnm3ly91wDIHKEkFzHSeHU=;
 b=nnBX+pNBJXHXztOORjZ9jTZrBKRjeo3mF2vvl4Gv/87bw9ymnAuoFH7dUEjEevhoCC
 H4RCF9/8LlVrwfMhEqb+0vfH2UadLV/Rpi6X0uI8wDSeNoocXMV/q1D4hzv2e/SW9R+/
 9l68HMUn2XIBDP2RTS9G94LC4g2kxeG5+TKrZT6yG1aQD+ijn6ypWnK9IwL+SmvcIuhH
 nZn6XSjhCgWgbnWH86mcZfQkIe9GXTmQCsSYr3VGFLeiKomRM4Gu+k9836CWboO1uU8u
 V9rBiLBAl7VnoI1iBA6GtSOClWQN9PL4C327zUOyuia5jJWK17fVchNwqWSyQu/u7s8Y
 KGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=57QnA/2Ol0DHKqe6YXTY3Gnm3ly91wDIHKEkFzHSeHU=;
 b=dsLcfT6++THTAAXzrUQimBZYZ6Ubx2APhyY9f7mxVTXRgz3y6fUtT8MKgtc0laUh+3
 bbgHp2IoGtAHccZARVX1SutD0ZthQnmHrZVsc9KDW0KMQuF+nRd4+L9TxMLU1laXr9mu
 8F2i+K1nxGINurJWD2/sfzU5enB5inU8qshBGgxHZjG/FOPqGjgEIdmdhZZ+lmzhZKdr
 NTMbJkIUZK1jHFVXp94uxcKm7B/f+JHBhGRgidJBzAXRXgcudfHPPYy28UmfrpEBmO5x
 i+0kK+rKJSyOg3m8BF65Nglcw6L10Wo3XD54s2t+dmnol+TqOmFpOwAH8FVUDZux5j/O
 sa5w==
X-Gm-Message-State: ACrzQf0GzFHSjNgo5ABvDYhKokjuYNLt6sr/UHNkwF+awr9o+qpjBiFQ
 jsTglUH2L3RsD0hJc308IQjiUQ8ODMRHbA==
X-Google-Smtp-Source: AMsMyM5bGU5nurdXPoY6b+eyYBtEKfmEOEDPSiug/iNMRUcKNUbk8/I5w89EWC/x0n4EjwBgc1ZTJw==
X-Received: by 2002:a17:90b:164b:b0:202:d347:2512 with SMTP id
 il11-20020a17090b164b00b00202d3472512mr2511282pjb.185.1664440640615; 
 Thu, 29 Sep 2022 01:37:20 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 s5-20020a170902ea0500b0017829a3df46sm5324233plg.204.2022.09.29.01.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 01:37:20 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 stefanha@redhat.com, Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v10 4/7] raw-format: add zone operations to pass through
 requests
Date: Thu, 29 Sep 2022 16:36:28 +0800
Message-Id: <20220929083631.61899-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929083631.61899-1-faithilikerun@gmail.com>
References: <20220929083631.61899-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x636.google.com
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
2.37.3


