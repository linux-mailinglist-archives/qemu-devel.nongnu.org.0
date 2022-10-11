Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C555FB09E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:42:39 +0200 (CEST)
Received: from localhost ([::1]:55060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCid-0004zh-1A
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTh-0001fn-ND
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTe-0004FS-Cx
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cuphIr+mFW20bUhhqmhIieGdN2By5F1MAq8fBtfFWvI=;
 b=icGIHlbU7cQdqTqtR9jr0+95LHbThCWqOSQ+LKh55QHxV9saV49vRbC7vDspWh9cx2xGjs
 Dz8YuDNIZu4wJtzA1wbGNy+pkZzhaWqLnjYG/7LcBt+8lTVA3/39Z0qi+jk1Y5gkF2MPrr
 EBuOEc26y+NDGL0z9bypIPaCm8Fd7cE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-407-Lm6_Oqt0Pb6-FNM6_krNBA-1; Tue, 11 Oct 2022 06:27:08 -0400
X-MC-Unique: Lm6_Oqt0Pb6-FNM6_krNBA-1
Received: by mail-ed1-f72.google.com with SMTP id
 dz21-20020a0564021d5500b004599f697666so10794793edb.18
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cuphIr+mFW20bUhhqmhIieGdN2By5F1MAq8fBtfFWvI=;
 b=jAG+dMuBdiCrbpKVOkPcJ7a/lujOSUmh5pypTgJGWfsmuPjezRVetWrhG3vt2GYIN6
 al0w7S+siFH07YQN45coF1At7vyEbzicv9/G4nHvixhU9l3nHJaL5iaIu/d4bbAagZe6
 +ixvku8tv5p0NzYwpzPrDkQVvFqv1BYDXoAHBOajYQq7EpHqaH9AAQGBhvqCgp6z/0+I
 xQvbcW4bazT6sklb/AcETE9xrV3CR5X1K7sWIOiUN+LxziRlMaY7/r4lFvoqqHbG4GLy
 Cv10LPObB7Gdv5zRXczIxQkHh6ETJa9/1G6JSarG8F59VEXqHAbkeG+OksnNeV+Vcp08
 FVrQ==
X-Gm-Message-State: ACrzQf1471ZE3qLIhVAg/M3hY7wnhFfPwgkkqYE4Kmube2i8WIHkjEdl
 CMLBbSYdclf1FipgyTARuiC0pas69O+Iq09s1qY7DtY31iSK+pHhMrkf2iSH/2QqAcy4I2NofwU
 qMDTO5EfsGS6hRQkczjIv3dqdaLVl25GaWltbjtqd73IjnW189lUXrnU41/edw4GfK/k=
X-Received: by 2002:a17:907:94c6:b0:787:9157:a87a with SMTP id
 dn6-20020a17090794c600b007879157a87amr18111987ejc.5.1665484026617; 
 Tue, 11 Oct 2022 03:27:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5VAMPYQvYLAYgsUPHpF5B/xA8YY/QVWBp3cuHkBOnWnV2UW40TP5d8ui1yNFGmy8GRNFS/Mg==
X-Received: by 2002:a17:907:94c6:b0:787:9157:a87a with SMTP id
 dn6-20020a17090794c600b007879157a87amr18111980ejc.5.1665484026396; 
 Tue, 11 Oct 2022 03:27:06 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b00738467f743dsm6746650ejc.5.2022.10.11.03.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Millikin <john@john-millikin.com>
Subject: [PULL 01/37] scsi-disk: support setting CD-ROM block size via device
 options
Date: Tue, 11 Oct 2022 12:26:24 +0200
Message-Id: <20221011102700.319178-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: John Millikin <john@john-millikin.com>

SunOS expects CD-ROM devices to have a block size of 512, and will
fail to mount or install using QEMU's default block size of 2048.

When initializing the SCSI device, allow the `physical_block_size'
block device option to override the default block size.

Signed-off-by: John Millikin <john@john-millikin.com>
Message-Id: <20220804122950.1577012-1-john@john-millikin.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 399e1787ea..e493c28814 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2544,6 +2544,7 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
     AioContext *ctx;
     int ret;
+    uint32_t blocksize = 2048;
 
     if (!dev->conf.blk) {
         /* Anonymous BlockBackend for an empty drive. As we put it into
@@ -2553,9 +2554,13 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
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
2.37.3


