Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A05266EF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:23:28 +0200 (CEST)
Received: from localhost ([::1]:48950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npY4d-0000dL-U7
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXg8-0001eJ-Hn
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:58:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXg5-0002KK-MO
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:58:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652457484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZiTTpsuZ33TDZjs3UGEEKFA0+EFT2f97t9Chg4BjWk=;
 b=h/876NfCVGahzp+3gAvXxA93Y5UYsY79Kfa2dbWAk9Xw2FCxLA6ARQealHfDou0OJbES7f
 EIC4NVCAXWYeCtcJ2VeXwVjRqsYSCIXV90bDW882s06XzMP56HLcok2hS17s8RKJKiubfX
 OeUqpaj0JlOzHQqKi8YcbM+jTx73K/s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-oZnF6NlMMCa3ulMJiaiOrA-1; Fri, 13 May 2022 11:58:00 -0400
X-MC-Unique: oZnF6NlMMCa3ulMJiaiOrA-1
Received: by mail-wr1-f71.google.com with SMTP id
 w20-20020adfd1b4000000b0020cbb4347e6so3086791wrc.17
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ZiTTpsuZ33TDZjs3UGEEKFA0+EFT2f97t9Chg4BjWk=;
 b=xlgTaIrGpNtjaa3B6cuyRRk+6uDggkMEt7GBIDDsf+J6rGOv0ftR9hnj9Vo/CwA+nT
 yN8kLwCnpK2X+V8ATckUKMQBSg0A3/Zp+uEA7xMwhVofLlkcy1v8MjapsXK9iyVr0mrE
 NtbBwM54EddRJasT4jJBFoIXJXrIrbFlvm52J4Kj0cKdNOkTdwLUNrMcoGR2QawwYGq/
 S1AWOfBugbKzfEw51+33OZw2D+SiZHdF4A0rfZJQZ7PO0R/3UYHzz0UgYe9y+kW9Cy5f
 WQCzPE0qUHwKNk7LP0i+RZKJMZqAmoEGPMEZTzJkaGbns8uaoaGBiIeopBNjY0FBAvTZ
 fQyw==
X-Gm-Message-State: AOAM532nI+KQNl3EZwNU5Aa2319v6ebPRu0gZudgio1Pwq1gCxDY7Zsg
 KldnLg1OUtDMAPi6NWZ4KFpFDP4LfGgsGj7fWxtpbE+cfYAv+6/JMVRuAXxhba6BlHp0YoF/QkG
 OQpJzFZz2Pmr49jNSdf3lxRH8ovcgVN9IWhZ0DARmY5fwk3OGbVot0WYx7aAe8+KN
X-Received: by 2002:a05:600c:4f0f:b0:394:54c1:f5b3 with SMTP id
 l15-20020a05600c4f0f00b0039454c1f5b3mr16045955wmq.33.1652457479482; 
 Fri, 13 May 2022 08:57:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaiITMnGmxDTx4yh24kd7XAX+ekpwI1aiEwDdqW8y+768s//RDPTd35b/+iXaRs40i46hnkA==
X-Received: by 2002:a05:600c:4f0f:b0:394:54c1:f5b3 with SMTP id
 l15-20020a05600c4f0f00b0039454c1f5b3mr16045936wmq.33.1652457479278; 
 Fri, 13 May 2022 08:57:59 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfc785000000b0020cdcb0efa2sm2558758wrg.34.2022.05.13.08.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:57:58 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 09/10] block: Use bdrv_co_pwrite_sync() when caller is
 coroutine_fn
Date: Fri, 13 May 2022 16:57:48 +0100
Message-Id: <20220513155749.2488070-7-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220513155418.2486450-1-afaria@redhat.com>
References: <20220513155418.2486450-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Convert uses of bdrv_pwrite_sync() into bdrv_co_pwrite_sync() when the
callers are already coroutine_fn.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/parallels.c      | 2 +-
 block/qcow2-snapshot.c | 6 +++---
 block/qcow2.c          | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index f22444efff..8b23b9580d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -481,7 +481,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     ret = 0;
     if (flush_bat) {
-        ret = bdrv_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
+        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
         if (ret < 0) {
             res->check_errors++;
             goto out;
diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 60e0461632..d1d46facbf 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -512,9 +512,9 @@ int coroutine_fn qcow2_check_read_snapshot_table(BlockDriverState *bs,
         assert(fix & BDRV_FIX_ERRORS);
 
         snapshot_table_pointer.nb_snapshots = cpu_to_be32(s->nb_snapshots);
-        ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, nb_snapshots),
-                               sizeof(snapshot_table_pointer.nb_snapshots),
-                               &snapshot_table_pointer.nb_snapshots, 0);
+        ret = bdrv_co_pwrite_sync(bs->file, offsetof(QCowHeader, nb_snapshots),
+                                  sizeof(snapshot_table_pointer.nb_snapshots),
+                                  &snapshot_table_pointer.nb_snapshots, 0);
         if (ret < 0) {
             result->check_errors++;
             fprintf(stderr, "ERROR failed to update the snapshot count in the "
diff --git a/block/qcow2.c b/block/qcow2.c
index c43238a006..f2fb54c51f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4551,8 +4551,8 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
 
     /* write updated header.size */
     offset = cpu_to_be64(offset);
-    ret = bdrv_pwrite_sync(bs->file, offsetof(QCowHeader, size),
-                           sizeof(offset), &offset, 0);
+    ret = bdrv_co_pwrite_sync(bs->file, offsetof(QCowHeader, size),
+                              sizeof(offset), &offset, 0);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Failed to update the image size");
         goto fail;
-- 
2.35.3


