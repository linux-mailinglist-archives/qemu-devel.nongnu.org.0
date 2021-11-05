Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB84C446897
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 19:44:45 +0100 (CET)
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj4Ci-0005bG-KQ
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 14:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj4AQ-00043g-Lm
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:42:22 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj4AO-0006Ih-C7
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:42:22 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s13so15163278wrb.3
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 11:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ugjwDDgfi+3q5Zu40iXuSSdXYJFrAimLuAKg/svA9UI=;
 b=yK8TfVrpAZPBNknlZPxwyy1ZD68WIPXQVcdKxXCtJfpeFJ9T+QkG1IUDouyxXqhmi4
 7CsYtTdk7fi1lEej+WjZwXaKr8umtF89yd6vnE0nkV9DNGjSiQ/IuthFp1kzaR5fdoxZ
 IAXN4P+li/NKBJrfdyCR7LDpnOztN4qI6LfoMtNO1KgBDGbYg4pOsjYCrDInGPbzUpGN
 FWKcyUyCih1QN7MWhju5vNN0Bbs8fz1eP/DOnWq6/s7+KGCGBjX7nYmpCNcWtKNTjr2T
 PoY6LiW0Lt55C0CY6Tiz9B2EXum02w9IsIDavIQ6hTQn0RS7wWCrN7FrLAFaWuahTcJH
 XtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ugjwDDgfi+3q5Zu40iXuSSdXYJFrAimLuAKg/svA9UI=;
 b=YJoUOCHVKyBFhMYnUDnDFWapKYFzBP/+zWs300BXbEzlyGSdl2bBsHn1V846SPTIT/
 8LPPx2fqvjOIISNH6P+kYNIaM3YZSMg+LYgqgqt2ESa21VNihuU2OKeujQgeuLDtlVCY
 SC0+YUF9NFkeJKQxr3RXUqtkBJ1W4rDTk0zH/NTH+iooR2sUYe8U9v3Gg38oHrx80ci4
 DHdu1v87VQhy4QZTxIZ15NC5STq+bxdlL5wPSdazQK8DheJiOtrUxoUJ7E6cYeGRtiR3
 vLbLcPnK4Afd93xbWDGIE+ksOapOAKX5uf7Fa56F7qykXIRhylAQ/uOSZ2AWREkeJWFE
 PTjg==
X-Gm-Message-State: AOAM533NM80GcsEGAuQDjz2vkFETSbTO3WM930quSfTVgM3CIAO8QYGU
 snFZxFNHM2upQf5OiBfBFY00uTs0DHzI3Q==
X-Google-Smtp-Source: ABdhPJxInr033Dlnb6/k/OOItmMS1QdCDLbma6Uw5OBvBq5xfMmml3eH0JgY+LMlvnqc2HVVnvR6uw==
X-Received: by 2002:a5d:4d8b:: with SMTP id b11mr50537393wru.393.1636137738602; 
 Fri, 05 Nov 2021 11:42:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id d24sm7954759wmb.35.2021.11.05.11.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 11:42:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/ppc/mac.h: Remove MAX_CPUS macro
Date: Fri,  5 Nov 2021 18:42:16 +0000
Message-Id: <20211105184216.120972-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mac.h header defines a MAX_CPUS macro. This is confusingly named,
because it suggests it's a generic setting, but in fact it's used
by only the g3beige and mac99 machines. It's also using a single
macro for two values which aren't inherently the same -- if one
of these two machines was updated to support SMP configurations
then it would want a different max_cpus value to the other.

Since the macro is used in only two places, just expand it out
and get rid of it. If hypothetical future work to support SMP
in these boards needs a compile-time-known limit on the number
of CPUs, we can give it a suitable name at that point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Minor bit of cleanup prompted by discussion on
https://gitlab.com/qemu-project/qemu/-/issues/672
---
 hw/ppc/mac.h          | 3 ---
 hw/ppc/mac_newworld.c | 3 ++-
 hw/ppc/mac_oldworld.c | 3 ++-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index 22c8408078d..a1fa8f8e41a 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -36,9 +36,6 @@
 #include "hw/pci-host/uninorth.h"
 #include "qom/object.h"
 
-/* SMP is not enabled, for now */
-#define MAX_CPUS 1
-
 #define NVRAM_SIZE        0x2000
 #define PROM_FILENAME    "openbios-ppc"
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 7bb7ac39975..4bddb529c2a 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -581,7 +581,8 @@ static void core99_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Mac99 based PowerMAC";
     mc->init = ppc_core99_init;
     mc->block_default_type = IF_IDE;
-    mc->max_cpus = MAX_CPUS;
+    /* SMP is not supported currently */
+    mc->max_cpus = 1;
     mc->default_boot_order = "cd";
     mc->default_display = "std";
     mc->kvm_type = core99_kvm_type;
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index de2be960e6c..7016979a7cd 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -423,7 +423,8 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
     mc->desc = "Heathrow based PowerMAC";
     mc->init = ppc_heathrow_init;
     mc->block_default_type = IF_IDE;
-    mc->max_cpus = MAX_CPUS;
+    /* SMP is not supported currently */
+    mc->max_cpus = 1;
 #ifndef TARGET_PPC64
     mc->is_default = true;
 #endif
-- 
2.25.1


