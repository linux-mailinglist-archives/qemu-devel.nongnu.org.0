Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 466C033A0C0
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:53:10 +0100 (CET)
Received: from localhost ([::1]:40010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAJw-0002Lk-Vo
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:53:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFw-0006TG-0e
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFu-0006v5-Hh
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:48:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id u16so6626019wrt.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vo/wOkAEHZzISR8kxsy1npD6PBbaQKYO5QfdkGe+lII=;
 b=gVOwDkbrQhjSdJesfoNLlEMzD5mfub8PqpLT90DOeJ8Iz4pfkLwHdXUalKEGRPJKus
 C445CDad+T9ljHQ9Ljyui3M+4eecndmOz1uB8S/NkF7hH5q3HEOcyyaMUrRsC+vV8n6A
 wvSzyPJgbCUPvaWHyo9L1iUFAclt0crk50ebTSHdm9P7IwWMxaxShgb/x7ggEk1QDLnq
 shbVszJLYSh2Hxsg9FWfP3vDkYOmQc8dTIt1k148I9W1f2tDuZx6fYmoJcJHXfKfe+gQ
 UnCsdDLGzEQc/vFcgZ35jCFrKRvW4FpwG0tbUxjgi9NuBjNE10Lo9jsEEU08Uo8Xw++t
 nI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vo/wOkAEHZzISR8kxsy1npD6PBbaQKYO5QfdkGe+lII=;
 b=pHp+AJPI90o3l25E+YdK5hVE1JnxTEH30L0Jaos9R8Yt3xP0leMH/IyOa4KL9SbjRI
 zKiUnT3pkWbBYHW2XkjRCk2zUmTEePwF1dl7qJeswdQt24wmjz2qMVKF1ksznDWAgDa8
 U+kfycMkOnLfGuHSRyeWZvaAYk2qFb+aLhNalgRhb6xnSEQI6cSlLm04I7jkAoFY0Cpf
 NlK79Z1oQ2ZjyuTMACcM2seMk/8QE/afbJ82UyCMnTL3TtrirInU0Mws68f0gM4usNp8
 4JX97zdI32E6ZdpHikdlIOSK60SRCvK2B3orPvn70nyGK6XX9r1jy6Jgc6DGZkXrGmTv
 JrmA==
X-Gm-Message-State: AOAM533sGFDmq4ZOydKVVwzOTp3/Wm077aa4gQCOZFeJKA/8HQ+RLcWA
 Lf7cRO+uZBNNt88Hs0Me9ssYdp3KHG6TNg==
X-Google-Smtp-Source: ABdhPJyrv3KsWsn8pC3Kx81vGfT2EWR2AhOJXbmXJupfFfJ0AXgQ+lGOAbe5vTnKoIcR1l4FzVCmWg==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr20134733wrt.133.1615664937014; 
 Sat, 13 Mar 2021 11:48:57 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f7sm14929492wrm.36.2021.03.13.11.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:48:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/27] hw/mips/gt64xxx: Trace accesses to ISD registers
Date: Sat, 13 Mar 2021 20:48:07 +0100
Message-Id: <20210313194829.2193621-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trace all accesses to Internal Space Decode (ISD) registers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20210309142630.728014-6-f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 2 ++
 hw/mips/trace-events  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 9a12d00d1e1..43349d6837d 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -387,6 +387,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
     PCIHostState *phb = PCI_HOST_BRIDGE(s);
     uint32_t saddr = addr >> 2;
 
+    trace_gt64120_write(addr, val);
     if (!(s->regs[GT_CPU] & 0x00001000)) {
         val = bswap32(val);
     }
@@ -966,6 +967,7 @@ static uint64_t gt64120_readl(void *opaque,
     if (!(s->regs[GT_CPU] & 0x00001000)) {
         val = bswap32(val);
     }
+    trace_gt64120_read(addr, val);
 
     return val;
 }
diff --git a/hw/mips/trace-events b/hw/mips/trace-events
index b7e934c3933..13ee731a488 100644
--- a/hw/mips/trace-events
+++ b/hw/mips/trace-events
@@ -1,4 +1,6 @@
 # gt64xxx_pci.c
+gt64120_read(uint64_t addr, uint64_t value) "gt64120 read 0x%03"PRIx64" value:0x%08" PRIx64
+gt64120_write(uint64_t addr, uint64_t value) "gt64120 write 0x%03"PRIx64" value:0x%08" PRIx64
 gt64120_read_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 read %s size:%u value:0x%08" PRIx64
 gt64120_write_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 write %s size:%u value:0x%08" PRIx64
 gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" PRIx64 "@0x%08" PRIx64
-- 
2.26.2


