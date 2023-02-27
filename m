Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4D56A4461
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:28:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeCA-0004Zl-BX; Mon, 27 Feb 2023 09:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBY-0004D6-Ju
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:00 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeBW-0000V4-Ig
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:09:00 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t15so6359630wrz.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ySdhuu+HBdkQKc4PyRG/80iLRfXGK1b4SJkc+12EU2g=;
 b=pnctJ0tXRhEX9nVjm2rtoLLnDo3PSeIKMSz3XsrCnxVWcBhX+5ZRhXJQUjeH//k+ez
 1jvctsnvIPeTaMZv31BhOJCxiBh8fxqRu0k6lSDcDsJ8fZ48Y+O+kTheCCGusQhfxmSp
 E+yxQD0uE3ZORSmuf1+/3fhvOi+xmTbJJxSfTZH8rgnxXAKTw1HhYBbx+CeVPIc+5NZu
 OaaaNmACpaoi26FzRior8L3wXuQtXlqeL8pF7w63h7lnSeeFyIkJwNk6EbXg/lF/hl6u
 /gYlO6L85iQVaVMRoVST+s4Ukki/iaZz9bCT6QYDnNJ47Nx32eNWm/2JS3fveQyr40YN
 88JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ySdhuu+HBdkQKc4PyRG/80iLRfXGK1b4SJkc+12EU2g=;
 b=djNxnHFtbgR2UuznXWsZKVaFOilAN/Cgj44SkNHicRR4fbcPBhnP35Jo1YyIcLkLy5
 oGi9WfWhqMs0PSgmlO3JLMA6zarqDCOVpAhhIIYFYlxJsqX5ZJ28O/iLgFqeQHgQw4sA
 L77xxPGLQph76cZSGIVIN7a9C9QyYGsC1AWwCR/N3LFgSJDqYlEsaEETze7oB1ZbubTr
 Q0Lacj7C88i8fIVNan+1wvocZ+qE6Mjir4r+rbDOSLDwJZAKmnb7epyx5MBBO1Y9xlw5
 F0ouSfip1lci8aKVq3KdtiAbbntfRiR/tfDkMggxFl7Dd3FIJHchyNtQ+uhXY9idRvhV
 5B7w==
X-Gm-Message-State: AO0yUKXOkpI7aUTN7Onati004suJgicDQQtjPd+BqOdPclR4bnoxGdvG
 oCx4XjXecwPOwpCLdUnGMKcK+0ePPbkf9L2U
X-Google-Smtp-Source: AK7set+nPlG2SfnfndoLmY9j/pDgnioR3/NRgIz88KmNpuHCG1jyHuX1eYVCTVFkbegSpqy8pose1g==
X-Received: by 2002:a5d:608f:0:b0:2ca:6442:c817 with SMTP id
 w15-20020a5d608f000000b002ca6442c817mr4146542wrt.57.1677506936808; 
 Mon, 27 Feb 2023 06:08:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a5d4a88000000b002c70c99db74sm7106772wrq.86.2023.02.27.06.08.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:08:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 083/126] hw/usb/ohci: Add trace points for register access
Date: Mon, 27 Feb 2023 15:01:30 +0100
Message-Id: <20230227140213.35084-74-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

To help debugging add trace points that print values read from or
written to the device's registers.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <1bb4985e5dfc1df5a290e77f76fd827ae3592ab7.1676916640.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci.c   | 27 +++++++++++++++++++++++++++
 hw/usb/trace-events |  4 ++++
 2 files changed, 31 insertions(+)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 2a52aace80..35a1a55145 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -235,6 +235,24 @@ struct ohci_iso_td {
 
 #define OHCI_HRESET_FSBIR       (1 << 0)
 
+static const char *ohci_reg_names[] = {
+    "HcRevision", "HcControl", "HcCommandStatus", "HcInterruptStatus",
+    "HcInterruptEnable", "HcInterruptDisable", "HcHCCA", "HcPeriodCurrentED",
+    "HcControlHeadED", "HcControlCurrentED", "HcBulkHeadED", "HcBulkCurrentED",
+    "HcDoneHead", "HcFmInterval", "HcFmRemaining", "HcFmNumber",
+    "HcPeriodicStart", "HcLSThreshold", "HcRhDescriptorA", "HcRhDescriptorB",
+    "HcRhStatus"
+};
+
+static const char *ohci_reg_name(hwaddr addr)
+{
+    if (addr >> 2 < ARRAY_SIZE(ohci_reg_names)) {
+        return ohci_reg_names[addr >> 2];
+    } else {
+        return "<unknown>";
+    }
+}
+
 static void ohci_die(OHCIState *ohci)
 {
     ohci->ohci_die(ohci);
@@ -1478,6 +1496,8 @@ static uint64_t ohci_mem_read(void *opaque,
     } else if (addr >= 0x54 && addr < 0x54 + ohci->num_ports * 4) {
         /* HcRhPortStatus */
         retval = ohci->rhport[(addr - 0x54) >> 2].ctrl | OHCI_PORT_PPS;
+        trace_usb_ohci_mem_port_read(size, "HcRhPortStatus", (addr - 0x50) >> 2,
+                                     addr, addr >> 2, retval);
     } else {
         switch (addr >> 2) {
         case 0: /* HcRevision */
@@ -1582,6 +1602,10 @@ static uint64_t ohci_mem_read(void *opaque,
             trace_usb_ohci_mem_read_bad_offset(addr);
             retval = 0xffffffff;
         }
+        if (addr != 0xc || retval) {
+            trace_usb_ohci_mem_read(size, ohci_reg_name(addr), addr, addr >> 2,
+                                    retval);
+        }
     }
 
     return retval;
@@ -1602,10 +1626,13 @@ static void ohci_mem_write(void *opaque,
 
     if (addr >= 0x54 && addr < 0x54 + ohci->num_ports * 4) {
         /* HcRhPortStatus */
+        trace_usb_ohci_mem_port_write(size, "HcRhPortStatus",
+                                      (addr - 0x50) >> 2, addr, addr >> 2, val);
         ohci_port_set_status(ohci, (addr - 0x54) >> 2, val);
         return;
     }
 
+    trace_usb_ohci_mem_write(size, ohci_reg_name(addr), addr, addr >> 2, val);
     switch (addr >> 2) {
     case 1: /* HcControl */
         ohci_set_ctl(ohci, val);
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index b65269892c..6bb9655c8d 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -57,8 +57,12 @@ usb_ohci_ed_read_error(uint32_t addr) "ED read error at 0x%x"
 usb_ohci_ed_pkt(uint32_t cur, int h, int c, uint32_t head, uint32_t tail, uint32_t next) "ED @ 0x%.8x h=%u c=%u\n  head=0x%.8x tailp=0x%.8x next=0x%.8x"
 usb_ohci_ed_pkt_flags(uint32_t fa, uint32_t en, uint32_t d, int s, int k, int f, uint32_t mps) "fa=%u en=%u d=%u s=%u k=%u f=%u mps=%u"
 usb_ohci_hcca_read_error(uint32_t addr) "HCCA read error at 0x%x"
+usb_ohci_mem_read(uint32_t size, const char *name, uint32_t addr, uint32_t offs, uint32_t val) "%d %s 0x%x %d -> 0x%x"
+usb_ohci_mem_port_read(uint32_t size, const char *name, uint32_t port, uint32_t addr, uint32_t offs, uint32_t val) "%d %s[%d] 0x%x %d -> 0x%x"
 usb_ohci_mem_read_unaligned(uint32_t addr) "at 0x%x"
 usb_ohci_mem_read_bad_offset(uint32_t addr) "0x%x"
+usb_ohci_mem_write(uint32_t size, const char *name, uint32_t addr, uint32_t offs, uint32_t val) "%d %s 0x%x %d <- 0x%x"
+usb_ohci_mem_port_write(uint32_t size, const char *name, uint32_t port, uint32_t addr, uint32_t offs, uint32_t val) "%d %s[%d] 0x%x %d <- 0x%x"
 usb_ohci_mem_write_unaligned(uint32_t addr) "at 0x%x"
 usb_ohci_mem_write_bad_offset(uint32_t addr) "0x%x"
 usb_ohci_process_lists(uint32_t head, uint32_t cur) "head 0x%x, cur 0x%x"
-- 
2.38.1


