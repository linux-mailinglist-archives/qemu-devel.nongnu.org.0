Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D738F83E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:35:49 +0200 (CEST)
Received: from localhost ([::1]:42812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMv5-0000xl-UU
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llMtX-0006IZ-FQ; Mon, 24 May 2021 22:34:11 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <swethajoshi139@gmail.com>)
 id 1llMtV-0002fB-NY; Mon, 24 May 2021 22:34:11 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 cu11-20020a17090afa8bb029015d5d5d2175so12362888pjb.3; 
 Mon, 24 May 2021 19:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7bhSMjdX4k1QqylFVmICkYFB8VtzxihGRidXvxfttQ=;
 b=S+neCCofqfgGd1hhGOISrodnMyh2TU/890o/cJKi57/dv6XtsWIynpu1kHaL8Tp+4q
 mQIsIL1ycLxOmU4FoYCco4ilA3zQlfLuPIJCy2iCYY33pnU3iMAxhqHkpNgySVLYBeKB
 F3Ikq87Hs3eweU4CnBurtrB/x3Z9kDEqoL60JMXfR9TZBQNo7OVpPIEFsAvP+R6C4ubB
 YoulmYIa0fJ1jqgTDBv4LRXRCJUyrti4KRzRMadwfyWmSl+SfX8EoGYCsEDdgt/n1xIO
 GwCWax1gV86Ro+so6OOegZkjSiicsyTWfCh7hmpIVKYw5Na8bS2y17/fkRTSSy5cPk9c
 BiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7bhSMjdX4k1QqylFVmICkYFB8VtzxihGRidXvxfttQ=;
 b=ISRbQe8j2A4GgAP9x9L9RvAGnfZjjvmvjhD5XTB+1SGHV+mujPQ/I0UunvUpApcfTQ
 t763Cys0BBzLufg1yQMIvdpO2SFdLTBP8kSWXEZgA8rXKkzCumtKGeAa8ie8EvzN2CxA
 K5wYk0/umG4sz7Z9Cc+JZzrIOixw+ElQ5zCCZbmsvgbrWu45nRBVy9rKPmx2u/sUackJ
 gjNco6TRtLZ1CYFJUSZAd0gS2LgsjE3AJG3PuIWirXvpDXH4ef3Xt7/Hl6uMuaPI52p6
 H/ZD9b8hqHkEJJ3WXHJ1Q6BmA4iRlY6nNScF7MlXNDRDjPO/dUUCtllpaUn/+4x1MdBH
 986g==
X-Gm-Message-State: AOAM533zi0pkqCmXMJgakGiUgsgwyCZDPxPdSK+Dui51Xt0Lwqc5pGig
 88FW6WnI+IgbVZonjXDfnFTGTCVIiau20w==
X-Google-Smtp-Source: ABdhPJywj5phGqTJw/MOwy1YaO7jHycdED7VwOEkkGqG1J4wi45DV3Mp3lXyQRwbYeAAv0UeGIkSrw==
X-Received: by 2002:a17:90a:4b8d:: with SMTP id
 i13mr2465019pjh.34.1621910047739; 
 Mon, 24 May 2021 19:34:07 -0700 (PDT)
Received: from swjoshi-Precision-7920-Tower.hsd1.wa.comcast.net
 ([2601:600:8680:7470:ca3d:eee7:b3e3:ee1c])
 by smtp.gmail.com with ESMTPSA id u11sm11711107pfk.198.2021.05.24.19.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 19:34:07 -0700 (PDT)
From: Swetha Joshi <swethajoshi139@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH_V2 2/2] Removed double declaration
Date: Mon, 24 May 2021 19:33:46 -0700
Message-Id: <20210525023346.3206241-2-swethajoshi139@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525023346.3206241-1-swethajoshi139@gmail.com>
References: <20210525023346.3206241-1-swethajoshi139@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=swethajoshi139@gmail.com; helo=mail-pj1-x1033.google.com
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
Cc: qemu-trivial@nongnu.org, Swetha Joshi <swethajoshi139@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 target/arm/kvm64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 724ce78265..47a4d9d831 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1405,8 +1405,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
     VirtMachineState *vms = VIRT_MACHINE(obj);
     bool acpi_enabled = false;
 #ifdef CONFIG_ARM_VIRT
-    bool acpi_enabled = virt_is_acpi_enabled(vms);
-    #endif /* CONFIG_ARM_VIRT */
+    acpi_enabled = virt_is_acpi_enabled(vms);
+#endif /* CONFIG_ARM_VIRT */
 
     assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
 
@@ -1431,8 +1431,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
                 kvm_cpu_synchronize_state(c);
 #ifdef CONFIG_ACPI_APEI
                 if (acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
-                  error_report("failed to record the error");
-                  abort();
+                    error_report("failed to record the error");
+                    abort();
                 }
 #endif /* CONFIG_ACPI_APEI */
                 kvm_inject_arm_sea(c);
-- 
2.25.1


