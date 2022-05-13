Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5AA5266B5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:02:25 +0200 (CEST)
Received: from localhost ([::1]:54464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXkG-0006Le-Dl
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXg0-0001R3-9l
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXfy-0002Ij-JL
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652457477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mr9baOup5pIFh95eY4zB+Hxx/05d8EL0oqEFRJE8hT4=;
 b=Rgqa7CdleQgTZqGfi6UtV3NgkraMnCm5qA1xeb4oezcytJXAYR6Du2WmBBlUk0OgFyUJKv
 PsD7QZixQVHvXoq/PKHyDM2ZZcARZjc4VuDku4VF8/z8EFMk/vZZXaa7TEtJBLfsskbypI
 FEh9GCMck68uhcumXATgyK/2Y6HpEdg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-T2mR9CLGMu6MLzkSWPTfqA-1; Fri, 13 May 2022 11:57:56 -0400
X-MC-Unique: T2mR9CLGMu6MLzkSWPTfqA-1
Received: by mail-wm1-f72.google.com with SMTP id
 t184-20020a1c46c1000000b00394209f54f1so3078139wma.4
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mr9baOup5pIFh95eY4zB+Hxx/05d8EL0oqEFRJE8hT4=;
 b=bzYkq8fs3pJb/icGaiubnYxS5Gsear+2K2bIRttaQXkMc/zZHx5H5pOsJ0ujlDC9MP
 Yjf6UjFFZnvnQTDwTunb4tk+L/woq62mgIQNIaaKT3PMghxu4/ct3pMtQcHBqlp0xWFd
 QvAnPZPp2bLk0VgEePjD2+sTEyFP0NLVFRq99sr+hwouX94l92kMr1cYBt+nml9mmYdX
 20KpVlDcM92btlXJ7D1+zY7sqZ7uNtUhAjjXdYhtXHp+Yl/P7aOUjERHc42IBq/FaMlj
 s1GlJLdPwqBLRwS1nqFmeZO+zmAjlSEvTH5NB68A8TXEhZjUSibl4qFoRgs1PLWoJwpA
 CnsA==
X-Gm-Message-State: AOAM530ruepWVZ8Ljh8nxU7Aj1khcCvtoTrGmmPK8kaXqG4VEVxp1Lfh
 s84bGplvZhezJitxc2nXjPMWSHQf0fBgeHKJS3RdsDCmRl3kuohZFFBRrdF/FQSPKu5EvfbvsEF
 5Bgi+OJQvL8JsmhP370bOxIhCrCYU+ANmV6zQEjKyYPP8pA2ymOmbLvlQaxNOMcmE
X-Received: by 2002:a5d:64c8:0:b0:20c:6969:b277 with SMTP id
 f8-20020a5d64c8000000b0020c6969b277mr4544267wri.354.1652457475402; 
 Fri, 13 May 2022 08:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKtE+HmIr+t9VOZKIRlHRErC4XceC5ZvjFpKn+tzqHDYFd5oAsFlUofki8fB6OU0ppRl25Ow==
X-Received: by 2002:a5d:64c8:0:b0:20c:6969:b277 with SMTP id
 f8-20020a5d64c8000000b0020c6969b277mr4544251wri.354.1652457475203; 
 Fri, 13 May 2022 08:57:55 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfc785000000b0020cdcb0efa2sm2558758wrg.34.2022.05.13.08.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:57:54 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 06/10] block: Make 'bytes' param of bdrv_co_{pread, pwrite,
 preadv, pwritev}() an int64_t
Date: Fri, 13 May 2022 16:57:45 +0100
Message-Id: <20220513155749.2488070-4-afaria@redhat.com>
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

For consistency with other I/O functions, and in preparation to
implement bdrv_{pread,pwrite}() using generated_co_wrapper.

unsigned int fits in int64_t, so all callers remain correct.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/coroutines.h           | 4 ++--
 include/block/block_int-io.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 830ecaa733..3f41238b33 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -91,11 +91,11 @@ int coroutine_fn blk_co_do_flush(BlockBackend *blk);
  */
 
 int generated_co_wrapper
-bdrv_preadv(BdrvChild *child, int64_t offset, unsigned int bytes,
+bdrv_preadv(BdrvChild *child, int64_t offset, int64_t bytes,
             QEMUIOVector *qiov, BdrvRequestFlags flags);
 
 int generated_co_wrapper
-bdrv_pwritev(BdrvChild *child, int64_t offset, unsigned int bytes,
+bdrv_pwritev(BdrvChild *child, int64_t offset, int64_t bytes,
              QEMUIOVector *qiov, BdrvRequestFlags flags);
 
 int generated_co_wrapper
diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index d4d3bed783..d1a6970dc6 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -56,7 +56,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
 
 static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
-    int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
@@ -65,7 +65,7 @@ static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
 }
 
 static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
-    int64_t offset, unsigned int bytes, const void *buf, BdrvRequestFlags flags)
+    int64_t offset, int64_t bytes, const void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
-- 
2.35.3


