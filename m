Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80673334504
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:21:27 +0100 (CET)
Received: from localhost ([::1]:39388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2WU-0003Lr-GO
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2Hc-000507-56
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2HR-0008Vj-Vk
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0p2T4LOlo1WwNURg6exWZWmw0vfUpBnGF9RSkW5uJpI=;
 b=OOv/uDY826rb5otwCdKhheFSHLzGZWJvqTknaFATDrmpzQod9498ODKdC8UzyExrKlBDH/
 iYCO9cGa/a7qHAUrrRfd9tIBjfLJ5pICCe48hwx6NSSxUw2gG4FF6iF6V+pzyV3uYoAkiS
 k+iouX12Adf6LgkayS5bkbedCcXvzyM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-5sW6A_XcNnyGHwdjmylUzw-1; Wed, 10 Mar 2021 12:05:49 -0500
X-MC-Unique: 5sW6A_XcNnyGHwdjmylUzw-1
Received: by mail-ej1-f71.google.com with SMTP id v10so7500593ejh.15
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0p2T4LOlo1WwNURg6exWZWmw0vfUpBnGF9RSkW5uJpI=;
 b=iJbzJge51r4tJOt4o7sriWv/dXde4ZLSGatAL+0cuAqJLTiSEpifeL1TRTzpXci4sY
 HzE1sJ/dzs02t/JsnnmNp2kDIspLx09A04r7ksa3HOp+GIEt4tRin/ooLZxNo8CT/50H
 VtAM3i6GF43ANC3dsKFZ1pdlKQxY4eo8GwH5OX2avLRBfZ5sCMbHhM6p+WGIWMgm0JEl
 bt5G6ZkRz5hGnLl2t/6iiDx7gJFdWhfzLHcOXmLnR2CTxLdb3n1I2wqH0ZxBoeN/xgJ7
 EJVQmyod1VOn/OzfyiTuNOV9GixCI3vasWufdcHP1w6W5xizZQkmmmWovxHBtEawsHFS
 MfCQ==
X-Gm-Message-State: AOAM530CYceMT1qUf7/dlrpr7IMdjfPYzGe3YV1pMnMHpAOdS8Tpn8IX
 VLVfBqHXrSQBJN4Qh84rpQ64AxagFaoV1CszSrTnyq0BVS8Do8ZHQA7VJpgsIDMY4VSHAgkL+nZ
 nkG/eyZXg4ohg8S3J4+R2xarcfgnCUSWTrHwDd9h5DLK3whC6LbdNqsfhobvI1VKG
X-Received: by 2002:a17:906:2504:: with SMTP id
 i4mr4733034ejb.115.1615395947775; 
 Wed, 10 Mar 2021 09:05:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzL4BGaDaskaudXSodstxoWEbJ5WyVz6yHWXhY64YFw++K8wXpzcP/22nWHKUMz9pVrVyyLmw==
X-Received: by 2002:a17:906:2504:: with SMTP id
 i4mr4732978ejb.115.1615395947286; 
 Wed, 10 Mar 2021 09:05:47 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r17sm2642145edm.89.2021.03.10.09.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:05:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] hw/block/pflash_cfi02: Extract
 pflash_cfi02_fill_cfi_table()
Date: Wed, 10 Mar 2021 18:05:19 +0100
Message-Id: <20210310170528.1184868-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310170528.1184868-1-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill the CFI table in out of DeviceRealize() in a new function:
pflash_cfi02_fill_cfi_table().

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 193 +++++++++++++++++++++-------------------
 1 file changed, 99 insertions(+), 94 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index fa981465e12..845f50ed99b 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -724,6 +724,104 @@ static const MemoryRegionOps pflash_cfi02_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void pflash_cfi02_fill_cfi_table(PFlashCFI02 *pfl, int nb_regions)
+{
+    /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
+    const uint16_t pri_ofs = 0x40;
+    /* Standard "QRY" string */
+    pfl->cfi_table[0x10] = 'Q';
+    pfl->cfi_table[0x11] = 'R';
+    pfl->cfi_table[0x12] = 'Y';
+    /* Command set (AMD/Fujitsu) */
+    pfl->cfi_table[0x13] = 0x02;
+    pfl->cfi_table[0x14] = 0x00;
+    /* Primary extended table address */
+    pfl->cfi_table[0x15] = pri_ofs;
+    pfl->cfi_table[0x16] = pri_ofs >> 8;
+    /* Alternate command set (none) */
+    pfl->cfi_table[0x17] = 0x00;
+    pfl->cfi_table[0x18] = 0x00;
+    /* Alternate extended table (none) */
+    pfl->cfi_table[0x19] = 0x00;
+    pfl->cfi_table[0x1A] = 0x00;
+    /* Vcc min */
+    pfl->cfi_table[0x1B] = 0x27;
+    /* Vcc max */
+    pfl->cfi_table[0x1C] = 0x36;
+    /* Vpp min (no Vpp pin) */
+    pfl->cfi_table[0x1D] = 0x00;
+    /* Vpp max (no Vpp pin) */
+    pfl->cfi_table[0x1E] = 0x00;
+    /* Timeout per single byte/word write (128 ms) */
+    pfl->cfi_table[0x1F] = 0x07;
+    /* Timeout for min size buffer write (NA) */
+    pfl->cfi_table[0x20] = 0x00;
+    /* Typical timeout for block erase (512 ms) */
+    pfl->cfi_table[0x21] = 0x09;
+    /* Typical timeout for full chip erase (4096 ms) */
+    pfl->cfi_table[0x22] = 0x0C;
+    /* Reserved */
+    pfl->cfi_table[0x23] = 0x01;
+    /* Max timeout for buffer write (NA) */
+    pfl->cfi_table[0x24] = 0x00;
+    /* Max timeout for block erase */
+    pfl->cfi_table[0x25] = 0x0A;
+    /* Max timeout for chip erase */
+    pfl->cfi_table[0x26] = 0x0D;
+    /* Device size */
+    pfl->cfi_table[0x27] = ctz32(pfl->chip_len);
+    /* Flash device interface (8 & 16 bits) */
+    pfl->cfi_table[0x28] = 0x02;
+    pfl->cfi_table[0x29] = 0x00;
+    /* Max number of bytes in multi-bytes write */
+    /*
+     * XXX: disable buffered write as it's not supported
+     * pfl->cfi_table[0x2A] = 0x05;
+     */
+    pfl->cfi_table[0x2A] = 0x00;
+    pfl->cfi_table[0x2B] = 0x00;
+    /* Number of erase block regions */
+    pfl->cfi_table[0x2c] = nb_regions;
+    /* Erase block regions */
+    for (int i = 0; i < nb_regions; ++i) {
+        uint32_t sector_len_per_device = pfl->sector_len[i];
+        pfl->cfi_table[0x2d + 4 * i] = pfl->nb_blocs[i] - 1;
+        pfl->cfi_table[0x2e + 4 * i] = (pfl->nb_blocs[i] - 1) >> 8;
+        pfl->cfi_table[0x2f + 4 * i] = sector_len_per_device >> 8;
+        pfl->cfi_table[0x30 + 4 * i] = sector_len_per_device >> 16;
+    }
+    assert(0x2c + 4 * nb_regions < pri_ofs);
+
+    /* Extended */
+    pfl->cfi_table[0x00 + pri_ofs] = 'P';
+    pfl->cfi_table[0x01 + pri_ofs] = 'R';
+    pfl->cfi_table[0x02 + pri_ofs] = 'I';
+
+    /* Extended version 1.0 */
+    pfl->cfi_table[0x03 + pri_ofs] = '1';
+    pfl->cfi_table[0x04 + pri_ofs] = '0';
+
+    /* Address sensitive unlock required. */
+    pfl->cfi_table[0x05 + pri_ofs] = 0x00;
+    /* Erase suspend to read/write. */
+    pfl->cfi_table[0x06 + pri_ofs] = 0x02;
+    /* Sector protect not supported. */
+    pfl->cfi_table[0x07 + pri_ofs] = 0x00;
+    /* Temporary sector unprotect not supported. */
+    pfl->cfi_table[0x08 + pri_ofs] = 0x00;
+
+    /* Sector protect/unprotect scheme. */
+    pfl->cfi_table[0x09 + pri_ofs] = 0x00;
+
+    /* Simultaneous operation not supported. */
+    pfl->cfi_table[0x0a + pri_ofs] = 0x00;
+    /* Burst mode not supported. */
+    pfl->cfi_table[0x0b + pri_ofs] = 0x00;
+    /* Page mode not supported. */
+    pfl->cfi_table[0x0c + pri_ofs] = 0x00;
+    assert(0x0c + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
+}
+
 static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
@@ -837,100 +935,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->cmd = 0;
     pfl->status = 0;
 
-    /* Hardcoded CFI table (mostly from SG29 Spansion flash) */
-    const uint16_t pri_ofs = 0x40;
-    /* Standard "QRY" string */
-    pfl->cfi_table[0x10] = 'Q';
-    pfl->cfi_table[0x11] = 'R';
-    pfl->cfi_table[0x12] = 'Y';
-    /* Command set (AMD/Fujitsu) */
-    pfl->cfi_table[0x13] = 0x02;
-    pfl->cfi_table[0x14] = 0x00;
-    /* Primary extended table address */
-    pfl->cfi_table[0x15] = pri_ofs;
-    pfl->cfi_table[0x16] = pri_ofs >> 8;
-    /* Alternate command set (none) */
-    pfl->cfi_table[0x17] = 0x00;
-    pfl->cfi_table[0x18] = 0x00;
-    /* Alternate extended table (none) */
-    pfl->cfi_table[0x19] = 0x00;
-    pfl->cfi_table[0x1A] = 0x00;
-    /* Vcc min */
-    pfl->cfi_table[0x1B] = 0x27;
-    /* Vcc max */
-    pfl->cfi_table[0x1C] = 0x36;
-    /* Vpp min (no Vpp pin) */
-    pfl->cfi_table[0x1D] = 0x00;
-    /* Vpp max (no Vpp pin) */
-    pfl->cfi_table[0x1E] = 0x00;
-    /* Timeout per single byte/word write (128 ms) */
-    pfl->cfi_table[0x1F] = 0x07;
-    /* Timeout for min size buffer write (NA) */
-    pfl->cfi_table[0x20] = 0x00;
-    /* Typical timeout for block erase (512 ms) */
-    pfl->cfi_table[0x21] = 0x09;
-    /* Typical timeout for full chip erase (4096 ms) */
-    pfl->cfi_table[0x22] = 0x0C;
-    /* Reserved */
-    pfl->cfi_table[0x23] = 0x01;
-    /* Max timeout for buffer write (NA) */
-    pfl->cfi_table[0x24] = 0x00;
-    /* Max timeout for block erase */
-    pfl->cfi_table[0x25] = 0x0A;
-    /* Max timeout for chip erase */
-    pfl->cfi_table[0x26] = 0x0D;
-    /* Device size */
-    pfl->cfi_table[0x27] = ctz32(pfl->chip_len);
-    /* Flash device interface (8 & 16 bits) */
-    pfl->cfi_table[0x28] = 0x02;
-    pfl->cfi_table[0x29] = 0x00;
-    /* Max number of bytes in multi-bytes write */
-    /*
-     * XXX: disable buffered write as it's not supported
-     * pfl->cfi_table[0x2A] = 0x05;
-     */
-    pfl->cfi_table[0x2A] = 0x00;
-    pfl->cfi_table[0x2B] = 0x00;
-    /* Number of erase block regions */
-    pfl->cfi_table[0x2c] = nb_regions;
-    /* Erase block regions */
-    for (int i = 0; i < nb_regions; ++i) {
-        uint32_t sector_len_per_device = pfl->sector_len[i];
-        pfl->cfi_table[0x2d + 4 * i] = pfl->nb_blocs[i] - 1;
-        pfl->cfi_table[0x2e + 4 * i] = (pfl->nb_blocs[i] - 1) >> 8;
-        pfl->cfi_table[0x2f + 4 * i] = sector_len_per_device >> 8;
-        pfl->cfi_table[0x30 + 4 * i] = sector_len_per_device >> 16;
-    }
-    assert(0x2c + 4 * nb_regions < pri_ofs);
-
-    /* Extended */
-    pfl->cfi_table[0x00 + pri_ofs] = 'P';
-    pfl->cfi_table[0x01 + pri_ofs] = 'R';
-    pfl->cfi_table[0x02 + pri_ofs] = 'I';
-
-    /* Extended version 1.0 */
-    pfl->cfi_table[0x03 + pri_ofs] = '1';
-    pfl->cfi_table[0x04 + pri_ofs] = '0';
-
-    /* Address sensitive unlock required. */
-    pfl->cfi_table[0x05 + pri_ofs] = 0x00;
-    /* Erase suspend to read/write. */
-    pfl->cfi_table[0x06 + pri_ofs] = 0x02;
-    /* Sector protect not supported. */
-    pfl->cfi_table[0x07 + pri_ofs] = 0x00;
-    /* Temporary sector unprotect not supported. */
-    pfl->cfi_table[0x08 + pri_ofs] = 0x00;
-
-    /* Sector protect/unprotect scheme. */
-    pfl->cfi_table[0x09 + pri_ofs] = 0x00;
-
-    /* Simultaneous operation not supported. */
-    pfl->cfi_table[0x0a + pri_ofs] = 0x00;
-    /* Burst mode not supported. */
-    pfl->cfi_table[0x0b + pri_ofs] = 0x00;
-    /* Page mode not supported. */
-    pfl->cfi_table[0x0c + pri_ofs] = 0x00;
-    assert(0x0c + pri_ofs < ARRAY_SIZE(pfl->cfi_table));
+    pflash_cfi02_fill_cfi_table(pfl, nb_regions);
 }
 
 static Property pflash_cfi02_properties[] = {
-- 
2.26.2


