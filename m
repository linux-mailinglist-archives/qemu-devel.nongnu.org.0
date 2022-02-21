Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08354BD9BF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:55:34 +0100 (CET)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8Dx-0003iB-4T
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:55:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7O7-00040D-Eh
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7O5-0000uH-Mg
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zDxyUQCIYSBimr5MnShN2wZxhJ6OCFQSGm+jDm8kcg=;
 b=bLp5JXgdCBeYo/aDoJrdtBe10VffDfF9gOmu6PU75njdXjwajcdyZVxx1WGdWxvV1qmvIJ
 BtfLuIOhIuoHkRoN6BV20R1f/B5niNg5PGsihzzOcgaK6OMbD9vX9pT7Pbrd3sDhFZYMhz
 boG+pGjuHF/KRWfmFaWMZF2iU79GX+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-VUsHuQEFPO24RvyLz-hreA-1; Mon, 21 Feb 2022 07:01:47 -0500
X-MC-Unique: VUsHuQEFPO24RvyLz-hreA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F338801AC5;
 Mon, 21 Feb 2022 12:01:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F2B073160;
 Mon, 21 Feb 2022 12:01:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/25] hw/tpm: Clean includes
Date: Mon, 21 Feb 2022 12:59:57 +0100
Message-Id: <20220221120008.600114-15-thuth@redhat.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
References: <20220221120008.600114-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

"tpm_ppi.h" only requires to include "exec/memory.h" to get
the MemoryRegion declaration.

tpm_ppi.c requires "hw/qdev-core.h" to use the DEVICE() macro,
tpm_crb.c is the only source file requiring "exec/address-spaces.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220207082756.82600-2-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/tpm/tpm_crb.c | 1 +
 hw/tpm/tpm_ppi.c | 4 ++--
 hw/tpm/tpm_ppi.h | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 58ebd1469c..aa9c00aad3 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -18,6 +18,7 @@
 
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "exec/address-spaces.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci/pci_ids.h"
 #include "hw/acpi/tpm.h"
diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
index 274e9aa4b0..6dbb9f41e4 100644
--- a/hw/tpm/tpm_ppi.c
+++ b/hw/tpm/tpm_ppi.c
@@ -14,9 +14,9 @@
 #include "qemu/osdep.h"
 
 #include "qapi/error.h"
-#include "cpu.h"
 #include "sysemu/memory_mapping.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-core.h"
 #include "hw/acpi/tpm.h"
 #include "tpm_ppi.h"
 #include "trace.h"
@@ -44,7 +44,7 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
     }
 }
 
-void tpm_ppi_init(TPMPPI *tpmppi, struct MemoryRegion *m,
+void tpm_ppi_init(TPMPPI *tpmppi, MemoryRegion *m,
                   hwaddr addr, Object *obj)
 {
     tpmppi->buf = qemu_memalign(qemu_real_host_page_size,
diff --git a/hw/tpm/tpm_ppi.h b/hw/tpm/tpm_ppi.h
index 6f773c25a0..bf5d4a300f 100644
--- a/hw/tpm/tpm_ppi.h
+++ b/hw/tpm/tpm_ppi.h
@@ -12,7 +12,7 @@
 #ifndef TPM_TPM_PPI_H
 #define TPM_TPM_PPI_H
 
-#include "exec/address-spaces.h"
+#include "exec/memory.h"
 
 typedef struct TPMPPI {
     MemoryRegion ram;
@@ -29,7 +29,7 @@ typedef struct TPMPPI {
  * Register the TPM PPI memory region at @addr on the given address
  * space for the object @obj.
  **/
-void tpm_ppi_init(TPMPPI *tpmppi, struct MemoryRegion *m,
+void tpm_ppi_init(TPMPPI *tpmppi, MemoryRegion *m,
                   hwaddr addr, Object *obj);
 
 /**
-- 
2.27.0


