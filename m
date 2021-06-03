Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D1B39A5CE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:34:29 +0200 (CEST)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqIe-0006EJ-Od
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl4-0001iC-6w
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl2-0007HP-HP
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:45 -0400
Received: by mail-wr1-x429.google.com with SMTP id m18so6401717wrv.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WjYQQ5KbIebYt2UlSAav3EDFRgbRHxYYXAO/kzuH6OE=;
 b=wQM5FJWQbFDNMYx/N16t3/fkg4Kj6Q/017fDRAeGCbc1bqNJbX3j/qle7zWIgIZLR1
 k+o4xXCJO118NKdLtYxqyzA4syVcpgd7h9AZ4Q8H3ms0rcjmYy8iHzfjqA2tcS5ZI9Z3
 0baL1FDipdZUoZh+szYJxmE91z1itbKgPiG2ieBp516F51q7e/kAvtpgRIVMEWWmI85U
 jLzF3bJzcCigyxLNeqlrjEBwqhyQF6MeOuOmcTzWXos6kQHPeqR1OH9Y45BqGurocp//
 801HEBel0yBRQn0iaO/F1OTWWT+7Uqez2qmNJJ7Uo8CQXy/CLDjgPR9ly07imgWSclVq
 LmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WjYQQ5KbIebYt2UlSAav3EDFRgbRHxYYXAO/kzuH6OE=;
 b=kxqkSONYwgFce7jZZA4V0qGLcLHNAC+R78Fdm2Iu9iiA8ME5mjmWUK1uOFGhx7txov
 XZ8tJWJ1NAlSn36sEQCN7Sno3HqaJmLGxshNj/wgIAPsmpUxLPbsOVBw1wbtAOl8mszo
 wOOfaKCE2inj3Pxbh0BNV8NcPZE15sU/qJ/sJFZl/clvESA26/s07XAbyfHvmrMmCCBv
 68X5aES7oGp7rabjHBpU0v9hScnUkAgCLMDow21Lk8o6jytVvzwVYYeBy+qbw2+TZZ3p
 Ev4QrOeLdM7mo1yISivWmDQXrF6vS+fjO/AuDbJvStZQH6vrGOiVwassZ/hdtD6rcP+r
 SmZA==
X-Gm-Message-State: AOAM531lP+JjlchitesPBBd6Jh0TKma/0/58Z8P65Hp7NuMiXCIVxlVC
 vhrM6YsNIl04Vztx5H7LrkCwqfsTcPNPD9ss
X-Google-Smtp-Source: ABdhPJwL/dVVvYXBT3dKj/PI8YI7h5hqXgIzz5ErvMGpcDz/Dh9fHYScf+tcYgcow5gEtBH11vMhRw==
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr683534wro.164.1622735983278; 
 Thu, 03 Jun 2021 08:59:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/45] hvf: Remove hvf-accel-ops.h
Date: Thu,  3 Jun 2021 16:58:56 +0100
Message-Id: <20210603155904.26021-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

We can move the definition of hvf_vcpu_exec() into our internal
hvf header, obsoleting the need for hvf-accel-ops.h.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210519202253.76782-11-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/hvf/hvf-accel-ops.h | 17 -----------------
 include/sysemu/hvf_int.h  |  1 +
 accel/hvf/hvf-accel-ops.c |  2 --
 target/i386/hvf/hvf.c     |  2 --
 4 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 100644 accel/hvf/hvf-accel-ops.h

diff --git a/accel/hvf/hvf-accel-ops.h b/accel/hvf/hvf-accel-ops.h
deleted file mode 100644
index 018a4e22f6d..00000000000
--- a/accel/hvf/hvf-accel-ops.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * Accelerator CPUS Interface
- *
- * Copyright 2020 SUSE LLC
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef HVF_CPUS_H
-#define HVF_CPUS_H
-
-#include "sysemu/cpus.h"
-
-int hvf_vcpu_exec(CPUState *);
-
-#endif /* HVF_CPUS_H */
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 80c1a8f9466..fd1dcaf26e0 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -46,6 +46,7 @@ extern HVFState *hvf_state;
 void assert_hvf_ok(hv_return_t ret);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
+int hvf_vcpu_exec(CPUState *);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 69741ce7081..14fc49791e3 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -58,8 +58,6 @@
 #include "sysemu/runstate.h"
 #include "qemu/guest-random.h"
 
-#include "hvf-accel-ops.h"
-
 HVFState *hvf_state;
 
 /* Memory slots */
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index c7132ee370c..02f7be6cfd6 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -73,8 +73,6 @@
 #include "qemu/accel.h"
 #include "target/i386/cpu.h"
 
-#include "hvf-accel-ops.h"
-
 void vmx_update_tpr(CPUState *cpu)
 {
     /* TODO: need integrate APIC handling */
-- 
2.20.1


