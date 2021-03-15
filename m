Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B13933CA11
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:40:57 +0100 (CET)
Received: from localhost ([::1]:33192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwpU-0006ez-CV
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkc-0001Pr-Cn
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwka-00060y-7Z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615851351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KigJthQczVlEvSbGoKPxU7lWca8CwaHC2NQv0DBkw8U=;
 b=cmGc9CCcoTdZ4okYa4yc2c/SVVivTKEMqCwTpx08iE5opD0SlEcWjMri5YOKNJ1g3GexwQ
 PZsn4oqVLY40n7f+5E2bzmm6wDu9aRlbxos+fPGGFo1KgirRiiN+gV+RMykaLyr+EtJRkA
 K4dIyD3RXZ9RjcezAiPRbHna5+u0Tpo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-8EB1LqIHOC-IpRMISex6tw-1; Mon, 15 Mar 2021 19:35:50 -0400
X-MC-Unique: 8EB1LqIHOC-IpRMISex6tw-1
Received: by mail-wr1-f70.google.com with SMTP id s10so15763540wre.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KigJthQczVlEvSbGoKPxU7lWca8CwaHC2NQv0DBkw8U=;
 b=guXtUvzds3qYY89tDIPZVh5KEbAS4pCWcg3GYW16nqAHYQ09+nwDYdA4hP3JGD+Vbm
 O1ApY7voaWGqR4zPvUHMcXvpOQFKA/rEzltWCicgsdBYsli4sdlfzxRCL8GPj1JJYPQr
 HblI65q99CMdzS1KUtcRRLcnXx2xPv8jaMfHMtvFlRdILBs6ObDSYXRzIlTmTrylxmys
 jer9lz8uuvNuiQdzdisEec+GCSytdI2vs9NkiGlccCIZ5qUDccXrjkXzjOU0QuNTgOtI
 XOmIdiANI9jk22KQZluCW3v+M6PkzsvtRGE83+JLxx/YoT8LQsGOBdtiHUv6XbVNF+kE
 udeA==
X-Gm-Message-State: AOAM532E05ERqARqMvsFRetM0T8rr+kCvZhzJdItmDfHo9RC5VbETkNJ
 T4Hnz5b002FWoVFLx86DH0dUFS9fLzf/iU031XCd9pCEX+OTooUbgxj3uyIxCHMs04Sy4ZKG7b6
 //w9Bm10zgIzDC7KwaitdhiR/zH6EDrYnP8oxXjNPFC2LEmAAgQOk8r0pMRBuHJwV
X-Received: by 2002:a5d:5047:: with SMTP id h7mr1932979wrt.111.1615851348773; 
 Mon, 15 Mar 2021 16:35:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjTV5u83mAwmKvn9BTH0bMKimCZJxJmPKAv8yET+g/t8klfgFKaJsPLVxs/n8DPMQlP40BGA==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr1932956wrt.111.1615851348578; 
 Mon, 15 Mar 2021 16:35:48 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 12sm1121191wmw.43.2021.03.15.16.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:35:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] hw/block/pflash_cfi02: Set rom_mode to true in
 pflash_setup_mappings()
Date: Tue, 16 Mar 2021 00:35:20 +0100
Message-Id: <20210315233527.2988483-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315233527.2988483-1-philmd@redhat.com>
References: <20210315233527.2988483-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is only one call to pflash_setup_mappings(). Convert 'rom_mode'
to boolean and set it to true directly within pflash_setup_mappings().

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210310170528.1184868-5-philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 845f50ed99b..0eb868ecd3d 100644
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
@@ -181,12 +181,13 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
                                  "pflash-alias", &pfl->orig_mem, 0, size);
         memory_region_add_subregion(&pfl->mem, i * size, &pfl->mem_mappings[i]);
     }
+    pfl->rom_mode = true;
 }
 
 static void pflash_register_memory(PFlashCFI02 *pfl, int rom_mode)
 {
     memory_region_rom_device_set_romd(&pfl->orig_mem, rom_mode);
-    pfl->rom_mode = rom_mode;
+    pfl->rom_mode = !!rom_mode;
 }
 
 static size_t pflash_regions_count(PFlashCFI02 *pfl)
@@ -927,7 +928,6 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     pfl->sector_erase_map = bitmap_new(pfl->total_sectors);
 
     pflash_setup_mappings(pfl);
-    pfl->rom_mode = 1;
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
 
     timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
-- 
2.26.2


