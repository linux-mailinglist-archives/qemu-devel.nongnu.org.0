Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9925F518F6E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:52:27 +0200 (CEST)
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzVS-0005p6-LF
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZw-0000le-SQ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:01 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZr-0006O0-Ap
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:59 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so3254562pjq.0
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ocWIh32CouzGFfi6GAu6bp81akmgvCStQtCfH36MgiM=;
 b=eUJ6tNVTMwM1wm+HV9JryQMqqsYDnb7huOrG1P+TLz+Czcy2+mrfwXx37Jd6irFwEL
 7D49/BSHQu3fiRquAyJ2VZjBTXmBpkp6n52MfAjpn1v2rnoGq/cQmPTWxtFSWqDvqjuG
 PgkUBdQC4IujNo4UcwJicw2ZFPi9wAChGyLkppGbbLNjWVGIZOhvJCR6ugcDTADRb0LC
 goQKKCEl2+mXawAorMQA9ChQ8rS//tjiyIpWFpZlvU10K3iW9iaqC24alU7ZkXMLic8g
 LEaFwpChD5Q4/Xy8nrKPmgh5t0F1ceXh4a15ZEwVU6O4hG4dNKoA/W1El/of5IvPiuCX
 IW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ocWIh32CouzGFfi6GAu6bp81akmgvCStQtCfH36MgiM=;
 b=B6Jl3mwtMXdlaC9Db/4blZsKVJ+BeQmoTnUE/RxU4Avh+nTxFcca/6TjA20wnPCsd8
 BqbXExZHcZZSytUMW1DtcpkE1K9yH7Q+NEhe/ojZvzKv5kJAqrwpb2hvVXjJjNFH6YwB
 KPp6oMSjCTfWb7hirKiIxxcEiUvrRbAQnDUIoHWMO80HXlez9YnYDvDZ8Sxik6N4+EJ+
 nUNW3YokeZRV4I8S0pIsbaAgd7ws9KjEDSHVBkiQ+rhYEpod5B1DUmzgpK6+jhD5S00/
 HEGvo4M1AVMWsXwISrLLalCMt3MCc7fuBhl4SE9DOB05dqBoj1MnFVjCHwK/s+4rWbkV
 Cevg==
X-Gm-Message-State: AOAM530g36n+58g2VzOC2iG7ksjIattL4YJuN2zhBmoPHXNjYc7ZyZzB
 NqmDieOq/voqGsk1b18GKKL6plkDUHBcfA==
X-Google-Smtp-Source: ABdhPJw4TWg7nNvPUPIA+XfbvFyluyjw7g9Ci4F0JRDg3QVYhggXgPTCZfbR8AiFvKbktxgSILd2Ew==
X-Received: by 2002:a17:903:410b:b0:15c:fd57:aa34 with SMTP id
 r11-20020a170903410b00b0015cfd57aa34mr17922864pld.82.1651607573962; 
 Tue, 03 May 2022 12:52:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 68/74] hw/rx: Handle a kernel file that is ELF
Date: Tue,  3 May 2022 12:48:37 -0700
Message-Id: <20220503194843.1379101-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Attempt to load the kernel with load_elf.  If this fails with
ELF_LOAD_NOT_ELF, continue to treat the kernel as a raw image.

This will be handy for running semihosting programs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/rx/rx-gdbsim.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index be147b4bd9..64b533181d 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -26,6 +26,7 @@
 #include "sysemu/device_tree.h"
 #include "hw/boards.h"
 #include "qom/object.h"
+#include "elf.h"
 
 /* Same address of GDB integrated simulator */
 #define SDRAM_BASE  EXT_CS_BASE
@@ -57,15 +58,32 @@ static void rx_load_image(RXCPU *cpu, const char *filename,
                           uint32_t start, uint32_t size)
 {
     static uint32_t extable[32];
-    long kernel_size;
+    ssize_t kernel_size;
+    uint64_t kernel_entry;
     int i;
 
+    /* Try an ELF image first. */
+
+    kernel_size = load_elf(filename, NULL, NULL, NULL, &kernel_entry,
+                           NULL, NULL, NULL, false, EM_RX, false, false);
+    if (kernel_size >= 0) {
+        cpu_set_pc(CPU(cpu), kernel_entry);
+        return;
+    }
+    if (kernel_size != ELF_LOAD_NOT_ELF) {
+        error_report("could not load kernel '%s': %s",
+                     filename, load_elf_strerror(kernel_size));
+        exit(1);
+    }
+
+    /* Not ELF: load a raw image, e.g. zImage. */
+
     kernel_size = load_image_targphys(filename, start, size);
     if (kernel_size < 0) {
-        fprintf(stderr, "qemu: could not load kernel '%s'\n", filename);
+        error_report("could not load kernel '%s'", filename);
         exit(1);
     }
-    cpu->env.pc = start;
+    cpu_set_pc(CPU(cpu), start);
 
     /* setup exception trap trampoline */
     /* linux kernel only works little-endian mode */
-- 
2.34.1


