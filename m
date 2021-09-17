Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F840FFA6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 21:06:41 +0200 (CEST)
Received: from localhost ([::1]:44748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRJC4-0002Ow-3Y
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 15:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mRJ5d-0005zt-0f
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 15:00:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mRJ5Z-0005f8-Eg
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 15:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631905194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G05cTUCHwzS6cXSpZNXkIEEVYtlshGTI4V0WMUKZa7o=;
 b=bTZwztExKCEeHaZDxUgCLKMTBX44x00ydPHgUSnkQyvc7Z7HNPmbVvLJ006g679ZIr+COp
 C8W/HnOQOQcwu6IvjYjQ9VA2wVV6k7EOJQmQUetd4xm/xvwvI93GRGs9uHwR0bzHE4wWFj
 ubCdT2bJwkINHIgXGpXPMYdd8Prt4m8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-10xq24aYO1KQ9D7yvTghVQ-1; Fri, 17 Sep 2021 14:59:53 -0400
X-MC-Unique: 10xq24aYO1KQ9D7yvTghVQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so4079853wml.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 11:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G05cTUCHwzS6cXSpZNXkIEEVYtlshGTI4V0WMUKZa7o=;
 b=GvRfOmdF/cjO0AwN7YJqJhkA9J3jyA9XL8s56ZKaBmJ4jzL6K+cnobqDgf1MKNxV6P
 MKB8iDj3MAxRkdldDhb69LvUkhoYJePaaQd0lCE0eBe/THvupJok3BK1bTdWmWBvP+Io
 F0NiR/4Ng7EMXDzQ2wUEMp5k1UtOvqxqLZgOzWrcfczLvA+1kHlyrW0p2ZBc0FSmoymh
 J7Dgd07HGjFHDvNHSMdaBlQn+zD7ctcDLffdMDmkdpasG7SXMSf2ghfypSE42V9CRwDp
 4M+RW/4YxjgfCfS7g6hjfE/bzMeh+kfd7TM5jw/bL5Hu7TjdgGb+X6I2/E4/JOejjx3G
 pWWQ==
X-Gm-Message-State: AOAM532g0+G29WPzx7CGULlOte1F8aOiGpuMiEl4Mkbsqs1EYg5E0kDo
 KtNt5Z2NS7AHf2zULycvVbxad8cRQrLCa/QC7ICWYm6SwEaULEXRFSZxO9P2i2nX4V95/24pRxK
 Hi3jh2shtnT/aCD57U6KiaWx9sXRCAyOkDeI5SJC/ROmvkmZ3kv2UBWENeCn81hqd
X-Received: by 2002:a1c:149:: with SMTP id 70mr16511794wmb.187.1631905192045; 
 Fri, 17 Sep 2021 11:59:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvDHyCcd9/t84rtWDdBPlMMkOO9PF/uGvQEV1OxrNCnRSlzemjNwIDUsY1Rg74IDIzEsrkcA==
X-Received: by 2002:a1c:149:: with SMTP id 70mr16511761wmb.187.1631905191611; 
 Fri, 17 Sep 2021 11:59:51 -0700 (PDT)
Received: from x1w.. (14.red-83-35-25.dynamicip.rima-tde.net. [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id 129sm7222720wmz.26.2021.09.17.11.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 11:59:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/loader: Restrict PC_ROM_* definitions to hw/i386/pc
Date: Fri, 17 Sep 2021 20:59:49 +0200
Message-Id: <20210917185949.2244956-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PC_ROM_* definitions are only used by the PC machine,
and are irrelevant to the other architectures / machines.
Reduce their scope by moving them to hw/i386/pc.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/loader.h | 6 ------
 hw/i386/pc.c        | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index cbfc1848737..81104cb02fe 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -336,12 +336,6 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
 #define rom_add_blob_fixed_as(_f, _b, _l, _a, _as)      \
     rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, _as, true)
 
-#define PC_ROM_MIN_VGA     0xc0000
-#define PC_ROM_MIN_OPTION  0xc8000
-#define PC_ROM_MAX         0xe0000
-#define PC_ROM_ALIGN       0x800
-#define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
-
 int rom_add_vga(const char *file);
 int rom_add_option(const char *file, int32_t bootindex);
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7e523b913ca..557d49c9f8f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -843,6 +843,12 @@ void xen_load_linux(PCMachineState *pcms)
     x86ms->fw_cfg = fw_cfg;
 }
 
+#define PC_ROM_MIN_VGA     0xc0000
+#define PC_ROM_MIN_OPTION  0xc8000
+#define PC_ROM_MAX         0xe0000
+#define PC_ROM_ALIGN       0x800
+#define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
-- 
2.31.1


