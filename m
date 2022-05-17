Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD752A279
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:02:03 +0200 (CEST)
Received: from localhost ([::1]:43518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqwpu-0002AF-7c
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXO-0001RV-UN
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXM-00031p-A4
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbHjgAuBiTIZfhuyF7aCBmD3cJYURuCRHR+mofh519Y=;
 b=UoB1/cDbzLiQgmGgH1NqDP3J7DWl7VXfyjcdissiW8Jfv6nEWWnXUREMjXR4HGOOsyuq5J
 bxETy9in8GiZbSsOaQuL8cqtmPx4PtJ/EYBzdgfxJJVhiEmiqp99lhJRZwZPzMwAx+izv1
 razG6H4MEkCpH8ayOvtpRxaJduDEbKE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-OYUyt9ELMoClI9sIBcfxjA-1; Tue, 17 May 2022 07:38:46 -0400
X-MC-Unique: OYUyt9ELMoClI9sIBcfxjA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso3618276wma.1
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sbHjgAuBiTIZfhuyF7aCBmD3cJYURuCRHR+mofh519Y=;
 b=BXOhyzkKTcGZuBn9012aFFo4rBdCAf5uYTxPV9iQ+8Ps0IzNvpVif1nKArUVUD6/Dy
 fl5Lr4NR9s1jV7BQ88+7uhDcrM7hknc8gPNpxR8xFcgE0Yevct2WeccjY4dcf5jl/NkX
 1mvTg2ddergwXtYUUBrQDEskRsZyG61L/xzyuAKSTln4IaWB07IWaqYIeSL5yQ0K7/qd
 9vYl4os1xV87sZJ1li1Xv/7g+/N8ouVSGohSttOS6T0P1RcScdqp+s7YPIc89PaQyVUZ
 TyiJusVTHjjNZW197X8/EHCZekSSCpmqpV440W1ZSFPhy8e5X6y1AVtQBJ5DuIRA2odg
 HdRg==
X-Gm-Message-State: AOAM532BZlTkhoXPYkNjglFAYEAVsZUK4dwNXTLAJg+bJ4WYzuQtCDRh
 drfgfpE8urmwYj0Qs34uelOqiuMTlQQ3yAhlNzzhiilqhoFn2sFUY+e2B91sfX5irc4YBCMvd2h
 ZqSf27mGtf265OAIUv1AYVOKsQ/AkLcRn4+nWdMtzgEq7GPE5g/xlckALsLpE2eXw
X-Received: by 2002:a05:600c:a03:b0:395:bb63:b457 with SMTP id
 z3-20020a05600c0a0300b00395bb63b457mr27802667wmp.192.1652787525189; 
 Tue, 17 May 2022 04:38:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF4ufcpf4xgwoYUxlyp1+62RuTTnQRWHlxohNjJtNR2EMdt9QMFgUkUWblzprpB+w3aQ2o8Q==
X-Received: by 2002:a05:600c:a03:b0:395:bb63:b457 with SMTP id
 z3-20020a05600c0a0300b00395bb63b457mr27802641wmp.192.1652787524892; 
 Tue, 17 May 2022 04:38:44 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0020d02cbbb87sm8090317wrb.16.2022.05.17.04.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:38:44 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 10/18] block: Change blk_pwrite_compressed() param order
Date: Tue, 17 May 2022 12:38:29 +0100
Message-Id: <20220517113837.199696-6-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517113524.197910-1-afaria@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
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

Swap 'buf' and 'bytes' around for consistency with other I/O functions.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             | 4 ++--
 include/sysemu/block-backend-io.h | 4 ++--
 qemu-img.c                        | 2 +-
 qemu-io-cmds.c                    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 35bf35aadd..ddb1d4e179 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2324,8 +2324,8 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                           flags | BDRV_REQ_ZERO_WRITE);
 }
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int64_t bytes)
+int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
+                          const void *buf)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 31ebd8b6cf..c64207cdcb 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -168,8 +168,8 @@ int blk_flush(BlockBackend *blk);
 
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
-                          int64_t bytes);
+int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
+                          const void *buf);
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int64_t bytes, BdrvRequestFlags flags);
diff --git a/qemu-img.c b/qemu-img.c
index 8d214e649e..52f3aeed9b 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2114,7 +2114,7 @@ static int convert_do_copy(ImgConvertState *s)
 
     if (s->compressed && !s->ret) {
         /* signal EOF to align */
-        ret = blk_pwrite_compressed(s->target, 0, NULL, 0);
+        ret = blk_pwrite_compressed(s->target, 0, 0, NULL);
         if (ret < 0) {
             return ret;
         }
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index c8cbaed0cd..952dc940f1 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -631,7 +631,7 @@ static int do_write_compressed(BlockBackend *blk, char *buf, int64_t offset,
         return -ERANGE;
     }
 
-    ret = blk_pwrite_compressed(blk, offset, buf, bytes);
+    ret = blk_pwrite_compressed(blk, offset, bytes, buf);
     if (ret < 0) {
         return ret;
     }
-- 
2.35.3


