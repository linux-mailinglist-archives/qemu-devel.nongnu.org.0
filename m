Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057D5EAFB6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:24:48 +0200 (CEST)
Received: from localhost ([::1]:48122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsmc-0004Mp-Fs
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4a-0008BQ-F6
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:18 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:45790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4Y-00026c-8D
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:16 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-127dca21a7dso10147343fac.12
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UgreoWc098GvxeIjx53eCAF9CT2DztfGmXSr51V9AOM=;
 b=V/Nei7Um6GZPLMXrc2K6h7dbcziVo8K4rM2OS74+WLMnQCcsFod/m9aKD24vHQ6oCE
 BT6OpaqvS22RAF5ETs0w4hS8WvhNy3BuZxEY+n4QN7HpHDRNPJHMWcvRJoCmzf9LwtVg
 41PPPHJoghpbnkJL1QMQkMWdJhhF1ikVUMflNoVULNn3Z7aMxafjhJycX7wXRebTQ7TN
 FfueVEHlS79yw/MyhUYxHSPDSCWPQzr6GiyFu6wGWqA5XuOGaiVL9mHtMyS5fFQkZxAX
 ZqxEbLrG/hVV0jnMZvY9QzZc77PWYhlLoPhtV1GI05D0VvvttjU2PNT5Aaahs9EG3xj0
 0O6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UgreoWc098GvxeIjx53eCAF9CT2DztfGmXSr51V9AOM=;
 b=rwEmhdekEGNhHAcDjUdL0yrT7zdEZnCD0u/ZHeaTl+dAT8ajm9RTw4Xz15XIqe79Se
 FmNmVH8s1B/z3sAiQ1o8k4Zh9p768MeLNWJKseYVhQA1Wn1Gu4aE5Rs3+yMTU4NXeoM7
 XwcEbO8z3j00Q0nJ+kUAdQUaj2ucI4pS2mnio6ffLmRfM/HqebQyefDV4VFg1eYhaMsx
 uVeb3zfwa7bIcpro7SQeAhLmKDRWWFww6DIBcLGkqmVuN/B4yM3+tciEAnVrh/txxjFJ
 p6nztY65enNUDCA1vGLatJZ5CKN4h7h7Tsof6DLFqKp+G7Lk5bqXCVYBFf1evZncwS3u
 dUKg==
X-Gm-Message-State: ACrzQf32bqm3i1B6yBbdkzTyaIMFatsSKCdip/Sg9SkM2Kpuvyvm5Ya9
 Zbv4D7HImbQAlhvQhxfM1XiyR1gsNrI=
X-Google-Smtp-Source: AMsMyM4phianjCg8RV7b/8P2SNc1uj+ol+CwPQjFQkZApIiY2EEvKYX64SOcCw99hYShRj8YHVUWfA==
X-Received: by 2002:a05:6870:f70c:b0:12b:b4fa:f509 with SMTP id
 ej12-20020a056870f70c00b0012bb4faf509mr13435283oab.11.1664213952202; 
 Mon, 26 Sep 2022 10:39:12 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v8 05/16] hw/microblaze: set machine->fdt in
 microblaze_load_dtb()
Date: Mon, 26 Sep 2022 14:38:44 -0300
Message-Id: <20220926173855.1159396-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

This will enable support for 'dumpdtb' QMP/HMP command for all
microblaze machines that uses microblaze_load_dtb().

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/microblaze/boot.c      | 8 +++++++-
 hw/microblaze/meson.build | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 25ad54754e..bec0538ce6 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -40,6 +40,8 @@
 
 #include "boot.h"
 
+#include <libfdt.h>
+
 static struct
 {
     void (*machine_cpu_reset)(MicroBlazeCPU *);
@@ -73,6 +75,7 @@ static int microblaze_load_dtb(hwaddr addr,
                                const char *kernel_cmdline,
                                const char *dtb_filename)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     int fdt_size;
     void *fdt = NULL;
     int r;
@@ -105,7 +108,10 @@ static int microblaze_load_dtb(hwaddr addr,
     }
 
     cpu_physical_memory_write(addr, fdt, fdt_size);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     return fdt_size;
 }
 
diff --git a/hw/microblaze/meson.build b/hw/microblaze/meson.build
index bb9e4eb8f4..a38a397872 100644
--- a/hw/microblaze/meson.build
+++ b/hw/microblaze/meson.build
@@ -1,5 +1,5 @@
 microblaze_ss = ss.source_set()
-microblaze_ss.add(files('boot.c'))
+microblaze_ss.add(files('boot.c'), fdt)
 microblaze_ss.add(when: 'CONFIG_PETALOGIX_S3ADSP1800', if_true: files('petalogix_s3adsp1800_mmu.c'))
 microblaze_ss.add(when: 'CONFIG_PETALOGIX_ML605', if_true: files('petalogix_ml605_mmu.c'))
 microblaze_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-zynqmp-pmu.c'))
-- 
2.37.3


