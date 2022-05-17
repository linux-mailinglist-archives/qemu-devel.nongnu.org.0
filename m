Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0714152A1F4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 14:49:22 +0200 (CEST)
Received: from localhost ([::1]:52150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqwdd-0005N5-2Z
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 08:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvWt-0001Hx-6z
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvWr-0002y3-FZ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p8fubifgvUx4aKzc12MRBVGC/H09uzZcP6aLv24/EHk=;
 b=NgUK1NoyviaW3AIqWTPSOMxYpONEDn9azECs3QyY7LJYsKolfFU5dt7npDFHBy31xQ0Gdz
 l+wFqu9oDfwBhCyJlvvrA605raeVvEPw94FmO4IkDuqgWZAUYv4ER0G8+psnr57OVSLpzy
 WhXTrRHAMLbG5909hBaoDJj8o6l4ebc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-oBlIRUJfMeSmJZG2msw3JQ-1; Tue, 17 May 2022 07:38:16 -0400
X-MC-Unique: oBlIRUJfMeSmJZG2msw3JQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 g14-20020a1c4e0e000000b0039425ef54d6so828973wmh.9
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8fubifgvUx4aKzc12MRBVGC/H09uzZcP6aLv24/EHk=;
 b=gfQvgF9Yfn47IpOHIhVZm/rxPBrPeSeaEG4P/QkJK2Y+E2wLjIvscK393Tdv2GJimW
 8XCQN9WyTayMw+sYtHkrJ97cyKb7EI1w4TfhhrsmoI1tAkP3lvgcLFSj1gjib3gGt5Nd
 CBeinrg1QkUadX23ugfJeWUA0AoXLOhhqaBY5Z4J7vdV3680ELGmsCJD3+CeTo95VQAS
 V+SdEI+gkmCoei0Q70WMGs/bwn0s2IgPJlJl4PS9U9BsyAjyaw2hGKA3MEj/+JxrS5WV
 K3sirUSCly/kzKy22eCT3baZKN/R9Uh76vweSE3fkOd9uibGKO1pUj0YeeyWa0nOBYCB
 m4Kw==
X-Gm-Message-State: AOAM531GS4SyoyFdAoC81oMhdJm3mdIMn3/+Z+VplJWlOdKDb36w7iX7
 upLb8bY+NcqOM9emS+C6VJGW5A5xSefVhPa/zjpBAU1t+L5r/FXe6S/tsFXwsFG3dfwEecIF4FK
 nfOoiCzhUgv3EuneCS6Ru2YLfyGBBwEkZxG78iSrjUnHOnTDAetOH4m7jJ0rGoReQ
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr31319819wmb.29.1652787494342; 
 Tue, 17 May 2022 04:38:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG4cuLQUNbg7eAMbCWRnjL3o4kUxo72cbTgvdikjlqnhrcrvqMmEM3jifXwgTf9OCCqO8xUQ==
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr31319797wmb.29.1652787494058; 
 Tue, 17 May 2022 04:38:14 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05600c229600b003970b2fa72dsm1648177wmf.22.2022.05.17.04.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:38:13 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 04/18] block: Make 'bytes' param of blk_{pread,
 pwrite}() an int64_t
Date: Tue, 17 May 2022 12:37:58 +0100
Message-Id: <20220517113812.199312-1-afaria@redhat.com>
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
implement them using generated_co_wrapper.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c             | 6 +++---
 include/sysemu/block-backend-io.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 16a0093c52..5b9706c443 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1567,7 +1567,7 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }
 
-int blk_pread(BlockBackend *blk, int64_t offset, int bytes, void *buf,
+int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
               BdrvRequestFlags flags)
 {
     int ret;
@@ -1581,8 +1581,8 @@ int blk_pread(BlockBackend *blk, int64_t offset, int bytes, void *buf,
     return ret;
 }
 
-int blk_pwrite(BlockBackend *blk, int64_t offset, int bytes, const void *buf,
-               BdrvRequestFlags flags)
+int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
+               const void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 357534e3de..6630316795 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -102,10 +102,10 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
  * the "I/O or GS" API.
  */
 
-int blk_pread(BlockBackend *blk, int64_t offset, int bytes, void *buf,
+int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
               BdrvRequestFlags flags);
-int blk_pwrite(BlockBackend *blk, int64_t offset, int bytes, const void *buf,
-               BdrvRequestFlags flags);
+int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
+               const void *buf, BdrvRequestFlags flags);
 int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
                                int64_t bytes, QEMUIOVector *qiov,
                                BdrvRequestFlags flags);
-- 
2.35.3


