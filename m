Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFAF3329CA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:10:07 +0100 (CET)
Received: from localhost ([::1]:38802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdzl-0001Ng-Fo
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdK9-0004aC-Ee
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:27:01 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdK7-0006Bu-Rb
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:27:01 -0500
Received: by mail-ej1-x62e.google.com with SMTP id dx17so28184697ejb.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L3v18ZL7N+cktt0efKAeS8NVT3CCQT0jjeaLH5CTmjc=;
 b=FrqJHveuA7Z+/pB0t1KxhikvGLPi6lv9laW28yFYD9A/lJ5RLNZctUe8UB0WG0HfIb
 9yfFPCCifSZp5+gC1hwsWkT+E6mdo9M6UCthFzjFv1ELF0RVGl6TcOXsoAwpG3xoYFYz
 HrDhNUrnsdqnyOU8s3owmBW9/lngTAtU3FAv7RGUeK3TLSjWKFBgE01rR/rGq5jf6Ruo
 LA10l9bh5TMAfOJgzHgfVGHnPgvAdl1vL+AsPxMuhlUKi4ElB+WNp9+1gukDRuW09j0Z
 low8OSQMsAXNel4h65dR5MMzcpTl2KqNjcceqQgn0wCfC8QeXDlOK4k5WtiMnERhjGrW
 HG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L3v18ZL7N+cktt0efKAeS8NVT3CCQT0jjeaLH5CTmjc=;
 b=joW9NCYVQekXfJZqZdNS4AfQGTX7yDamOaHy7VYc5jKO/dZIuoyBD//wCLmr+dTP+V
 e+N4T8bg51aKIWYjKWj5kQg/UBBxDLCjLw7RFZnsvCAT3vrXu3+/DKRk8gASPtwHslCk
 AadU8qxFYMzmX80IE8KDZXw+zm5Cynj3OOQRAIJSqN6oXgxYncLCFwXrHJvvcZa9Fjbb
 OWBKpj2Ljxe/sSroCCWRkGC1F/YGZV1fGp/pVvoz5ALf2XYvgNEaige9+1CvxKG9X3EL
 m+JEXWz3PlaozbR5qOQYrMBZIfoZflLpdCbp5rJ35e6nxZVBd/rulMCJ4+fTlY9llv4d
 F94A==
X-Gm-Message-State: AOAM531/vluSQu4zUsHesV60xfIlUPVciMsdKOUwqSItvnIHIm3RtF3B
 u/ty/83Wd9Yp/S2Tih2kGiXncLS9uGI=
X-Google-Smtp-Source: ABdhPJx1Ys/9MMOAZWU/fFfAVB2g9FVVlyJ+7Y7XCgD7JdN6/EIjYZfZmgfJWoMo+1o4BN9pTRogPw==
X-Received: by 2002:a17:907:9808:: with SMTP id
 ji8mr18971135ejc.333.1615300018292; 
 Tue, 09 Mar 2021 06:26:58 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s11sm3065335edt.27.2021.03.09.06.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:26:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 5/6] hw/mips/gt64xxx: Trace accesses to ISD registers
Date: Tue,  9 Mar 2021 15:26:29 +0100
Message-Id: <20210309142630.728014-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309142630.728014-1-f4bug@amsat.org>
References: <20210309142630.728014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trace all accesses to Internal Space Decode (ISD) registers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


