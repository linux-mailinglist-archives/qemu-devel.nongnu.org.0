Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617E96ECB3D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:23:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pquGx-0000rE-2e; Mon, 24 Apr 2023 07:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pquGr-0000p1-7V
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:22:15 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pquGl-00056f-Mx
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:22:13 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4edc63c82d1so4378389e87.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682335319; x=1684927319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CwD/L5o2/pRtObZ6GaVbf9uZzAG747kqUQpZ52beJ+0=;
 b=YbPswaCEfTvIyRqScUWXa3VJwc0ZVesbG/XWWU24qY5AL2guxiWI7ZcPEQZhnO3wLa
 /lUi8CyxJMa2TdGeHvMow/dJxGY6RCTUK3gAZSgs7hKCEyPI73MgHrzC5P63hbgSzEM8
 8AX7ssrM4BVsqtCBAQ+R9+L7VFvsj6NrK9sPTLYAxqkaT4fDHIMbVz3cSi1XeMck2JD7
 SvIYaQF43fuY+wfO3qxWgWxYqvjlPJqTbUuSRtI9HKm8Mqx4o8vVqsfW7p6WQ92xqWRG
 wwY4w1ge7Ey1jMEGFLXsOSKi90Zi/OXMZgFvd7GahsqrrGU86aQeTrSW0XLlRCnt0daq
 qkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682335319; x=1684927319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CwD/L5o2/pRtObZ6GaVbf9uZzAG747kqUQpZ52beJ+0=;
 b=Vz0lVKec3PzxmwJgcWM20PvJayC6vr6mDhta6aHbkHZYcJJyqiR7A/ycXmYfS3XdtA
 HqbCxwB3DFw4/0GDOWaGucOJmAkdgAHIrcpaEwRwElloSoARgkfJn9YgZvPw9es4RLrv
 FZ8NoLAPUTf1xWJXeKpTSrd5nTcUE83eSsTjX7KO9qcXx+DkPI3HovIIi6L95lpmFaGv
 tqvMXI6woutMXH94JSFb83f0or7UQYBGknBtB5bkgvNPWWnoXxOb1wKdMO4KBIaY6VjM
 mtmm9ji6M5QL0DRJ05MfkhC2WE/PrG1YQX6AdpE7O1xdpFtOPq3L0JOSYCwYK+3D3dWp
 +yLA==
X-Gm-Message-State: AAQBX9dd6cplTIs20fMJ1breqdi3Rb9iks9L/Awhi1Ql/ecxlQS8Zn8/
 yWRgtF9vrnCQUzqWnJWPII8wwA==
X-Google-Smtp-Source: AKy350awPhHPM3dijDynX5CBhrdIcVS7YvxvZwmZ4BtQR1BcfHKRceZHhwCaxDuEluyb5aDJJyJA/Q==
X-Received: by 2002:ac2:5ecf:0:b0:4ec:a786:1f23 with SMTP id
 d15-20020ac25ecf000000b004eca7861f23mr3419143lfq.59.1682335319416; 
 Mon, 24 Apr 2023 04:21:59 -0700 (PDT)
Received: from localhost.localdomain ([80.250.80.22])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a19f501000000b004eff0bcb276sm415542lfb.7.2023.04.24.04.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 04:21:58 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com, jasowang@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, peterx@redhat.com, david@redhat.com
Cc: philmd@linaro.org, qemu-devel@nongnu.org, yan@daynix.com,
 yuri.benditovich@daynix.com, Viktor Prutyanov <viktor@daynix.com>
Subject: [RFC PATCH 3/4] memory: add interface for triggering IOMMU
 notify_flag_changed handler
Date: Mon, 24 Apr 2023 14:21:46 +0300
Message-Id: <20230424112147.17083-4-viktor@daynix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230424112147.17083-1-viktor@daynix.com>
References: <20230424112147.17083-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12d;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This interface helps if IOMMU notify_flag_changed should be triggered
after changing IOMMU notifier flags in the runtime.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 include/exec/memory.h |  2 ++
 softmmu/memory.c      | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2e602a2fad..c8d5f69add 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1772,6 +1772,8 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n);
 void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
                                              IOMMUNotifier *n);
 
+void memory_region_iommu_notify_flags_changed(MemoryRegion *mr);
+
 /**
  * memory_region_iommu_get_attr: return an IOMMU attr if get_attr() is
  * defined on the IOMMU.
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9d64efca26..e4a53cde6c 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1950,6 +1950,18 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
     }
 }
 
+void memory_region_iommu_notify_flags_changed(MemoryRegion *mr)
+{
+    IOMMUMemoryRegion *iommu_mr;
+
+    if (mr->alias) {
+        memory_region_iommu_notify_flags_changed(mr->alias);
+        return;
+    }
+    iommu_mr = IOMMU_MEMORY_REGION(mr);
+    memory_region_update_iommu_notify_flags(iommu_mr, NULL);
+}
+
 void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
                                              IOMMUNotifier *n)
 {
-- 
2.21.0


