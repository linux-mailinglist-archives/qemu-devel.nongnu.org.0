Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6931D494D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 11:20:58 +0200 (CEST)
Received: from localhost ([::1]:38664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZWWX-0006fZ-Rm
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 05:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZWVD-0005DJ-DY
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:19:35 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56307
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZWVC-0005W4-JB
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589534373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OijFkYnHWsK6cznwFWgTWV8JklEMK8NT1sHvffpXdIk=;
 b=PDu6xgjpIobCDqswjgEWADQ/rRtl00QeTPB9J7ZKTzco+76iEfG61VMCYdAXZdIDPrfRtW
 0rOVP1mFQkrLgDmcxJm6sFNT4yXB/zoDhAC/XyJ5ao8ubORtDqE+9y51WAK/25nHVaQFv8
 qmpBnSmsFkrhH8dUUl2u3IQMAlr+0FI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-uBMmzUc3O8OW_JIXXKK2ig-1; Fri, 15 May 2020 05:19:32 -0400
X-MC-Unique: uBMmzUc3O8OW_JIXXKK2ig-1
Received: by mail-wm1-f70.google.com with SMTP id l21so890435wmh.2
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 02:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OijFkYnHWsK6cznwFWgTWV8JklEMK8NT1sHvffpXdIk=;
 b=BLOu1F6EcZ8EaBztCzSgVkAEr2yHMehOfb6vkfYzHvZtDGPfKKPQb5VHMYXgpud/QD
 IKnWoicvJ6OMwswO9GRVgxIhJSYSvyqZQAxs7iQ9TwySebNEf3RHxBiqSVnXlfRP9Qcf
 SydHht7+BLTP2PE5NnlQuc8eu5y/3fyItc7mv4KLu112TJczXg1u9JW+1pRhsFc8LvPv
 05szyynTvc9B6KxzxeEqHJaW4wZ8tSsm1RCLXG1vT5U+Y2CjseYXW4BIv72BVHfNt9uS
 m+IYAqx6ztbt9fF/ENDcrEa78gIwD69I9xouwqIQgqihRppYzkiUjWMiaiNsDJUEHMIJ
 ZvCw==
X-Gm-Message-State: AOAM532N5AdEPHmaU+T+1imO3FzVVWhxlSxOd65rJWBNFlP721E0NKyR
 b/xBnkusaU3MOYtbh0b4H4jue6J6rREl82zdkFKKxbovCFjrWlJDtjmaZa0T11q5eJysLuTdK4B
 gP3FCJrnfC256BFE=
X-Received: by 2002:a1c:e188:: with SMTP id y130mr3138624wmg.105.1589534370975; 
 Fri, 15 May 2020 02:19:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6XCcW384NEB1WapXIwrguMFgNQVXQWQi7G5hcnXZ42O9vfKYJHP2/UMevts5yFJDN9pZqUQ==
X-Received: by 2002:a1c:e188:: with SMTP id y130mr3138607wmg.105.1589534370771; 
 Fri, 15 May 2020 02:19:30 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id v124sm2823004wme.45.2020.05.15.02.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:19:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] qemu/osdep: Document qemu_memalign() and friends
Date: Fri, 15 May 2020 11:19:20 +0200
Message-Id: <20200515091924.14380-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515091924.14380-1-philmd@redhat.com>
References: <20200515091924.14380-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document allocator functions that require a specific
de-allocator call.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/block/block.h          | 4 ++++
 include/qemu/osdep.h           | 3 +++
 include/sysemu/block-backend.h | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 4de8d8f8a6..480e6b6837 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -525,9 +525,13 @@ void bdrv_img_create(const char *filename, const char *fmt,
 size_t bdrv_min_mem_align(BlockDriverState *bs);
 /* Returns optimal alignment in bytes for bounce buffer */
 size_t bdrv_opt_mem_align(BlockDriverState *bs);
+/* callers must free the returned pointer with qemu_vfree() */
 void *qemu_blockalign(BlockDriverState *bs, size_t size);
+/* callers must free the returned pointer with qemu_vfree() */
 void *qemu_blockalign0(BlockDriverState *bs, size_t size);
+/* callers must free the returned pointer with qemu_vfree() */
 void *qemu_try_blockalign(BlockDriverState *bs, size_t size);
+/* callers must free the returned pointer with qemu_vfree() */
 void *qemu_try_blockalign0(BlockDriverState *bs, size_t size);
 bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov);
 
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ff7c17b857..b3eccce762 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -294,8 +294,11 @@ extern int daemon(int, int);
 #endif
 
 int qemu_daemon(int nochdir, int noclose);
+/* callers must free the returned pointer with qemu_vfree() */
 void *qemu_try_memalign(size_t alignment, size_t size);
+/* callers must free the returned pointer with qemu_vfree() */
 void *qemu_memalign(size_t alignment, size_t size);
+/* callers must free the returned pointer with qemu_anon_ram_free() */
 void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared);
 void qemu_vfree(void *ptr);
 void qemu_anon_ram_free(void *ptr, size_t size);
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 0917663d89..7996cb61bb 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -205,7 +205,9 @@ uint32_t blk_get_request_alignment(BlockBackend *blk);
 uint32_t blk_get_max_transfer(BlockBackend *blk);
 int blk_get_max_iov(BlockBackend *blk);
 void blk_set_guest_block_size(BlockBackend *blk, int align);
+/* callers must free the returned pointer with qemu_vfree() */
 void *blk_try_blockalign(BlockBackend *blk, size_t size);
+/* callers must free the returned pointer with qemu_vfree() */
 void *blk_blockalign(BlockBackend *blk, size_t size);
 bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp);
 void blk_op_unblock(BlockBackend *blk, BlockOpType op, Error *reason);
-- 
2.21.3


