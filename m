Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875BF354306
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:53:07 +0200 (CEST)
Received: from localhost ([::1]:40320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQbC-0002AJ-HB
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHk-0001bv-Gd
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:33:02 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHQ-0001qj-5H
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:55 -0400
Received: by mail-wm1-x331.google.com with SMTP id p19so5818049wmq.1
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DUse1n/oBxKc6TNMgInqNeRNbQw//OjkdVm9LIiyh7o=;
 b=j0WHpnXgd0Zn+eBq+UvSwfafJC0Zz9fVPZwOnXwVcHdlPupFEqDWJijGmZzXzrmX0/
 UhGli4wHnrkduI88HL3F2HqWhH1uCQAkVe4k4pHQttCfr2sYsM3q9oGJZbQ0woNDnHPP
 0c5AT1mThafy2z210LPN3TfXjNgQOwKASsAzY5gZfrA/pspW7sL6kNXMkby7gNuBlHoQ
 HlKGQKFH6ZURpA1dnwwtUtWZd7ko1RcxFq4K3EEcsoZ4HuMq1LL6tAu7N07ePErO417B
 0OIbNgz00amcAKIcM/Za0AV6RXdNewXpUI6uZeBsvPyfdqYDfAelQVDDm+RUo+12XLKT
 PHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DUse1n/oBxKc6TNMgInqNeRNbQw//OjkdVm9LIiyh7o=;
 b=KUq2VdmDkUnKUiDXYNm6QxjSYBUQ4TpmXtwlaI9uYx9GRv8vUgOLzRZPs+/jfFn6xl
 EuCqoSl+KLFSATtk7Yv97uIh2cIjwkvSELqydogIhcuun63gS9kVCIgZibVD5RcQKM+K
 tU5UIHDl7KPbxs1hb783Pjxx+fSJH2fMctzBVoRQcv5njRRY0P7qzeM/bOg0Cj3g6FXl
 Qy7mBLXm7cE/8gIst6L3ku2jjuwTcWeCdc8E4N8YDNygZeR6QSRyyAmRyDP9EKM2yU4V
 tCAEBgm5i7NC06qIRTbJ18Q9pnKcHRO9JT1Pfp3tL6iEFJJ4DCJdAyFGNuVl1DVYgrus
 wgtg==
X-Gm-Message-State: AOAM53069MtBCQRSJykAFXzjlgJx6PE1sODe89XmQ426DIGm6mySmR/1
 7V/gmen9jaGV3ZQutnOeSm+zFTGE0eKF1g==
X-Google-Smtp-Source: ABdhPJwNluAuZQQbGzUhv8F3FUDcVGNUTynAjV0CLOWu8OZLKUqfLO/xGmITC3piZZNckZGrMyxyXQ==
X-Received: by 2002:a05:600c:2145:: with SMTP id
 v5mr25815101wml.65.1617633157256; 
 Mon, 05 Apr 2021 07:32:37 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:36 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 26/27] arcv3: board changes
Date: Mon,  5 Apr 2021 15:31:37 +0100
Message-Id: <20210405143138.17016-27-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 hw/arc/boot.c | 1 +
 hw/arc/virt.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/hw/arc/boot.c b/hw/arc/boot.c
index 962fc03b03..0af559e44b 100644
--- a/hw/arc/boot.c
+++ b/hw/arc/boot.c
@@ -69,6 +69,7 @@ void arc_load_kernel(ARCCPU *cpu, struct arc_boot_info *info)
     }
 
     elf_machine = cpu->family > 2 ? EM_ARC_COMPACT2 : EM_ARC_COMPACT;
+    elf_machine = (cpu->family & ARC_OPCODE_V3_ALL) != 0 ? EM_ARC_COMPACT3_64 : elf_machine;
     kernel_size = load_elf(info->kernel_filename, NULL, NULL, NULL,
                            &entry, NULL, NULL, NULL, ARC_ENDIANNESS_LE,
                            elf_machine, 1, 0);
diff --git a/hw/arc/virt.c b/hw/arc/virt.c
index 8f7d7cbd5d..e07fa5c123 100644
--- a/hw/arc/virt.c
+++ b/hw/arc/virt.c
@@ -120,7 +120,11 @@ static void virt_init(MachineState *machine)
     boot_info.kernel_cmdline = machine->kernel_cmdline;
 
     for (n = 0; n < smp_cpus; n++) {
+#ifdef TARGET_ARCV2
         cpu = ARC_CPU(cpu_create("archs-" TYPE_ARC_CPU));
+#else
+        cpu = ARC_CPU(cpu_create("arc64-" TYPE_ARC_CPU));
+#endif
         if (cpu == NULL) {
             fprintf(stderr, "Unable to find CPU definition!\n");
             exit(1);
-- 
2.20.1


