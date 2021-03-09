Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22533321B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 00:56:28 +0100 (CET)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmDD-0004EG-GZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 18:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm7w-0003yx-3v
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:51:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm7u-0000xY-IJ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:50:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615333857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6hiB0Ry4U+40peR1g9DMU6zeYRKlNPh+KKp/RGq7bo=;
 b=MJ2dKC35E//uYsDpT3hI2IAKKkJ7QaQm6j8e5S2STAjIABsizaa8EsbKFaknjG9GiT14Nx
 Qum6choXPZoLlzk6CN6mfH3Sk7+/+u3hB5OIKWWam4zpiin6TLVAJ2CRwkE4PJIrQZetPz
 LjWbyzp4+gui1M9YnyG8aNXhENktk0w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-l-ITBZ1nORaxwfHOGQua4Q-1; Tue, 09 Mar 2021 18:50:53 -0500
X-MC-Unique: l-ITBZ1nORaxwfHOGQua4Q-1
Received: by mail-ed1-f70.google.com with SMTP id p6so7506230edq.21
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 15:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6hiB0Ry4U+40peR1g9DMU6zeYRKlNPh+KKp/RGq7bo=;
 b=NqZSk/n1Q0ciyAv3C3Wr6sUckbMqR26bJGNM8npt4Qb2vg29oIw9nKmf00HAau2uc6
 cBOAvVBsFpfp80+EbvNFSAumO75e0WXt1WMx8H7B+/FfrAWtU2ZCkcLdyf0GyNIpYTZg
 uUe+LI4SPrGCyd2WWWI0E0/I8CnqHhK89mQT23n1qGkThRaEGfgW/aKAyt+Azrm+cNi3
 Ho5hgkqjjEUbbfQreNLdy3U7L8YCQoHObzKE+A2nPVQS3knHKcOzArvQ+F1CquLn7+Hk
 iA25VEdPnKXuTih+3h0IhhPKnO4KHMoGbvuf8X+mI6jUmN3hELyzoesSDHSHz85Xjd+k
 cFmQ==
X-Gm-Message-State: AOAM530eehChbxMZ+62Prkle4TMp6fxzO6wzbM3gghZN0UDERfI0wCVx
 i7s45xfsk2GnTKUtBW0h5yEsyOdYX9Nixb6CsQiPmEFQAt9C6hIrGrAXmqRuXp/NxYGfOVD6Ten
 AlRJBLMXSDOQmyFKiAVdKDI7b2UywoPonfZXKy0qhR0VUg/nNqCvm5fxtDaT72bMX
X-Received: by 2002:a17:906:4d44:: with SMTP id
 b4mr585783ejv.338.1615333852571; 
 Tue, 09 Mar 2021 15:50:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhpJFHaX+Nz2j5x4uC5whRpvKqGT7q4Sw6OBlrjk3szSME4l5+uOFdZeahZvrYAKy1C10Rkg==
X-Received: by 2002:a17:906:4d44:: with SMTP id
 b4mr585766ejv.338.1615333852397; 
 Tue, 09 Mar 2021 15:50:52 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id qo25sm1705379ejb.93.2021.03.09.15.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 15:50:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] hw/block/pflash_cfi02: Set rom_mode to true in
 pflash_setup_mappings()
Date: Wed, 10 Mar 2021 00:50:23 +0100
Message-Id: <20210309235028.912078-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309235028.912078-1-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is only one call to pflash_setup_mappings(). Convert 'rom_mode'
to boolean and set it to true directly within pflash_setup_mappings().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 845f50ed99b..5f949b4c792 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -108,7 +108,7 @@ struct PFlashCFI02 {
     MemoryRegion mem;
     MemoryRegion *mem_mappings;    /* array; one per mapping */
     MemoryRegion orig_mem;
-    int rom_mode;
+    bool rom_mode;
     int read_counter; /* used for lazy switch-back to rom mode */
     int sectors_to_erase;
     uint64_t erase_time_remaining;
@@ -181,6 +181,7 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
                                  "pflash-alias", &pfl->orig_mem, 0, size);
         memory_region_add_subregion(&pfl->mem, i * size, &pfl->mem_mappings[i]);
     }
+    pfl->rom_mode = true;
 }
 
 static void pflash_register_memory(PFlashCFI02 *pfl, int rom_mode)
@@ -927,7 +928,6 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->sector_erase_map = bitmap_new(pfl->total_sectors);
 
     pflash_setup_mappings(pfl);
-    pfl->rom_mode = 1;
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
 
     timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
-- 
2.26.2


