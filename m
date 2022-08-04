Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B98589BD3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:42:27 +0200 (CEST)
Received: from localhost ([::1]:51264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaBF-00031W-PM
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oJa88-0005cC-0T
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:39:12 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oJa81-0003P8-M4
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:39:11 -0400
Received: by mail-pj1-x102c.google.com with SMTP id t22so11553961pjy.1
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 05:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XNh2x3uXFAsJ0QMqL9t3/FBlvD4vkqv/Km3i1lXak7k=;
 b=ptcTnJLjA24g2d5anijLWGfndPzWge20d/q831nnsVJQK2znh5Yku6HNs9od2tVd6l
 K4kgjU6HcaBjA7nmHab35oAg4AInUUI6/o7e/zWodXDZ4zP1hm/Ivr2XZhGwrVVzp5Ue
 zceEcGWDPC4W+8a1lbWAU+lBjqFh0zjOLd+mAm0ASS15E3s6jjE4y/SwbNSZDIU8ltIy
 3Geq2aupCDpY75BnqBBAbiSyRHqQvCdsv+CxMxW4JlWTm2F/22qxhV7a2DExFVYfEuDN
 2ZpGpKf0d+m1Q4469AoQUciRtWkZN+o/Aa87wiFwldDYymJVPApeRTuWlCH64GT/CaXT
 9mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XNh2x3uXFAsJ0QMqL9t3/FBlvD4vkqv/Km3i1lXak7k=;
 b=WnJ+02QhlsT7aAo6XMdPoum4KZVcQP1U8hYeYjZBTMpwW/Mp4TBwCqZOTHRvxA7dkI
 N4F/pAy7EAo7xBtOp77bnO7jBEAI9mjG/EEIefHMPAxFjP/vf1kY1KXqaTq35a6lbMni
 lnSEUjjmKkg9U31UwBr36ZjFD5JU3Qwf2yQIyFRZ0lo59ZbmER98TWjVbPlFPNCcPw9h
 anG4BzbbNlEMKj4pg5wHYenmE2wFfhlmnusi/llUc/ygL4m5apI9s3ikaM3ABYM+Gmpz
 6cq1rdtYqfdoO0pDSQ8fLznWlRbdAMxStzI3ypowfEOY1kREPUEkqdO0/Q9FuBXAf9VC
 vynQ==
X-Gm-Message-State: ACgBeo1O6TWa7iV/LsMOWwnbbNLdPLAag7MuTgARtlP6do6NyRb8oUJ1
 dwJVsxasWKHrkekCmPlOBvomjYvvsqc3yNm+S2w=
X-Google-Smtp-Source: AA6agR4+S7UitbwsEVFmbCPzgqD3R0PzGwG2HYE8m6oc4/qyBdDYj3VtYODSbWr8+dRo7dTw+sxnnQ==
X-Received: by 2002:a17:90a:e7cd:b0:1f0:c82:c88f with SMTP id
 kb13-20020a17090ae7cd00b001f00c82c88fmr10275162pjb.100.1659616743156; 
 Thu, 04 Aug 2022 05:39:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:6580:98c0:1200:3d7:1081:d0d0:54fa])
 by smtp.gmail.com with ESMTPSA id
 n30-20020a63591e000000b0041a8f882e5bsm1060505pgb.42.2022.08.04.05.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 05:39:02 -0700 (PDT)
From: John Millikin <john@john-millikin.com>
To: qemu-devel@nongnu.org
Cc: John Millikin <john@john-millikin.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2] scsi-disk: support setting CD-ROM block size via device
 options
Date: Thu,  4 Aug 2022 21:29:51 +0900
Message-Id: <20220804122950.1577012-1-john@john-millikin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=john@john-millikin.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

SunOS expects CD-ROM devices to have a block size of 512, and will
fail to mount or install using QEMU's default block size of 2048.

When initializing the SCSI device, allow the `physical_block_size'
block device option to override the default block size.

Signed-off-by: John Millikin <john@john-millikin.com>
---
 hw/scsi/scsi-disk.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

This is the same diff as sent to qemu-devel@ about a week ago. That
first email seems to have been eaten by a grue, but replying to it
worked, so maybe the grue is gone now.

See https://gitlab.com/qemu-project/qemu/-/issues/1127 for some
related discussion about SunOS CD-ROM compatibility.

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index f5cdb9ad4b..acdf8dc05c 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2533,6 +2533,7 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
     AioContext *ctx;
     int ret;
+    uint32_t blocksize = 2048;
 
     if (!dev->conf.blk) {
         /* Anonymous BlockBackend for an empty drive. As we put it into
@@ -2542,9 +2543,13 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
         assert(ret == 0);
     }
 
+    if (dev->conf.physical_block_size != 0) {
+        blocksize = dev->conf.physical_block_size;
+    }
+
     ctx = blk_get_aio_context(dev->conf.blk);
     aio_context_acquire(ctx);
-    s->qdev.blocksize = 2048;
+    s->qdev.blocksize = blocksize;
     s->qdev.type = TYPE_ROM;
     s->features |= 1 << SCSI_DISK_F_REMOVABLE;
     if (!s->product) {
-- 
2.25.1


