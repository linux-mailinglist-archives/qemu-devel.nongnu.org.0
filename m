Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0715EB0EA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 21:08:33 +0200 (CEST)
Received: from localhost ([::1]:37264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1octSx-0005xU-Tb
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 15:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4w-0008G2-Qj
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:39 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:36416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4v-0002Ab-8i
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:38 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 t4-20020a4aa3c4000000b00475624f2369so1229650ool.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zECDqm6f1LsQeHy+YP77QCUaQ1hC8k4wbK8cK5DRO7g=;
 b=IXMRNArAF35bioxQdlM2kjqpEo29Ka8+Gsm6UOBpdrpmUEhN6WpDn8sIcYP6LRHHge
 7U8gNlFkdVQfXLAG19OYFCSnBdvVOylKNhz4jeB0MZHlK64jcfvaixWh3fczDAdr1CfH
 OI5Ge3oGcmug3Yw2HICyiro0QWT6/cToY1fSICtipvX+A9IqzPRX16Ofu/D1ee94eRik
 Ni43tGKd2wlQhy2+v8/h5QnkBx7bOhifLKL618iRkzxXTw1P0fnV7T1LH1XaRo1fFV3v
 +G3eJY+7efLkY2t5pY569iiZEUJDjIUB+iVEcyNn8NzkFNBA1m6YedkWk+Gz1B1G9tEB
 7lOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zECDqm6f1LsQeHy+YP77QCUaQ1hC8k4wbK8cK5DRO7g=;
 b=aiBWhgcMWX+OgaQdWtYW7uiArDhcVHS1FwlyKYze4awuP3IOHojWEjqJg7C0zT+kw7
 ZtdoDNGerGv2D7/s5ro76GQoz40nb/rmtKOt2ykEk1Gp/yuehj8ExBeOgQECWH+3HHGC
 NnCRB7qrvJPNhk3JUCG4sChlHsMfmoVpgbaBzgD9f0y9YG3OBPIszwWZZHb+JXaNqSCw
 zRkA/JqO0yISf/k9n4ZKoakXQlP6n2J3Ic4UiYxViaPZm031KA6WJ4J498PQ2qGXAD4C
 l7BqKk1IcYG/4ec3hVPXD+3suGXp1Tve7PpWTNU9xiPHckkKFicuPDrl1LdNJa/ScFcn
 2Oxg==
X-Gm-Message-State: ACrzQf1s2m6e0zBwFS9rEY/wWdOSg3pdot9hnNuwWx/uobLALIiXEbzC
 u3lcKwWyEgazhdb+Qv0AzTLjkICxF2Y=
X-Google-Smtp-Source: AMsMyM7d0c0xe5R1x6xNZFc+PrGiHDTatN/uixxEvjx3pGkDSQ2f/dEuytZT9EvoF3VOT3kjxLFtaw==
X-Received: by 2002:a4a:a7c4:0:b0:476:c9f:773 with SMTP id
 n4-20020a4aa7c4000000b004760c9f0773mr9206301oom.49.1664213975338; 
 Mon, 26 Sep 2022 10:39:35 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:34 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v8 16/16] hw/xtensa: set machine->fdt in xtfpga_init()
Date: Mon, 26 Sep 2022 14:38:55 -0300
Message-Id: <20220926173855.1159396-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc31.google.com
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

This will enable support for the 'dumpdtb' QMP/HMP command for all
xtensa machines that uses a FDT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/xtensa/meson.build | 2 +-
 hw/xtensa/xtfpga.c    | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/xtensa/meson.build b/hw/xtensa/meson.build
index 1d5835df4b..ebba51cc74 100644
--- a/hw/xtensa/meson.build
+++ b/hw/xtensa/meson.build
@@ -6,6 +6,6 @@ xtensa_ss.add(files(
 ))
 xtensa_ss.add(when: 'CONFIG_XTENSA_SIM', if_true: files('sim.c'))
 xtensa_ss.add(when: 'CONFIG_XTENSA_VIRT', if_true: files('virt.c'))
-xtensa_ss.add(when: 'CONFIG_XTENSA_XTFPGA', if_true: files('xtfpga.c'))
+xtensa_ss.add(when: 'CONFIG_XTENSA_XTFPGA', if_true: [files('xtfpga.c'), fdt])
 
 hw_arch += {'xtensa': xtensa_ss}
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 2a5556a35f..867427c3d9 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -50,6 +50,8 @@
 #include "hw/xtensa/mx_pic.h"
 #include "migration/vmstate.h"
 
+#include <libfdt.h>
+
 typedef struct XtfpgaFlashDesc {
     hwaddr base;
     size_t size;
@@ -377,7 +379,9 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
             cur_tagptr = put_tag(cur_tagptr, BP_TAG_FDT,
                                  sizeof(dtb_addr), &dtb_addr);
             cur_lowmem = QEMU_ALIGN_UP(cur_lowmem + fdt_size, 4 * KiB);
-            g_free(fdt);
+
+            /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+            machine->fdt = fdt;
         }
 #else
         if (dtb_filename) {
-- 
2.37.3


