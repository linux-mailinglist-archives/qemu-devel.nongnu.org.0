Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCF84366BD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:49:29 +0200 (CEST)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaJs-0001Su-Vk
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx8-0000R4-Ft
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:58 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx6-0002n5-Ir
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:58 -0400
Received: by mail-pl1-x62d.google.com with SMTP id t21so660647plr.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YRu/MDU+L2EeOsm4b1PTwNiPfEDkTApHO7aOs9wyn2k=;
 b=a5guZ69j8ejjmMtu0IGQNcQKVSEftT9fT8KQlorFtoyTeOlagZczCzvsdi1acIoI5E
 7AgMat92Jrw6tXPRiiI7uBQuUhozX44Sd0LQCq64PQ2l7dHsxkEBFNDtuYjIfNWVan4T
 1wYaWmt2P1cyKCywfcjq6URguq6b694LPqhyDvi8rF+kQ29seDEtTS7EHOkrJoLLC5+G
 k5l1p2+mXtUfMWhlhLznz4Eis4xvHhi2/LTJ6IYUDfjsMxRLOGy3Yr4namqyY834tbK9
 Syt9GWtGNbrBZ5rN1FqJJdbbMV9Bu4NdLux1nM+Sm5Niw8rcHdHuP9yH7FUMQ8s3Wi0A
 7ZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRu/MDU+L2EeOsm4b1PTwNiPfEDkTApHO7aOs9wyn2k=;
 b=UuxUQk3z4KAKdxL7cdA83t5lKUIPlw5ikhBFDcWvRJqQuoBOKsKVmZoD0RM1r/i0Fg
 4l+fPDuibxHYWMT88OF/F5hGJlCcfU2D9cJOS9zUs7xJcjEmpfPu2wkRdV2C69YdlQkJ
 F2pC0l0U/hxy8H6TAsTKC8PxImNt2bcEQJ41h9xYCmi+i9/oC2/VmmqLikWrUqtV8Qzs
 bcLmnYGzvM7Uyfw7XiX3fLLRZ/ozHWC55mYcrm10A7D0jyrFfuMtwyVcT+v7LELWX6jr
 umV3HKd4P8Oqc/K9b60VDpNO9P3YY8/6DOalz1A3RWGn9wzhR4JMdqtokjayW06UP5Ey
 1bHw==
X-Gm-Message-State: AOAM5324AF5HlJNjd0oy/CW6YkNGhMai475JB2qX/G4kO2GL4rM0iou9
 1bxDFd1fgZvoFDRBf7DpKM3wT7BPVFdlug==
X-Google-Smtp-Source: ABdhPJxoFURlIn00R5ZX+tGV6lIGllfatDNZHXqCKriy30Yj4GDQpA8bANkSRBbBdoNzhWDA3TDO2Q==
X-Received: by 2002:a17:902:904b:b0:13f:b0c9:3c5d with SMTP id
 w11-20020a170902904b00b0013fb0c93c5dmr6045631plz.26.1634829955164; 
 Thu, 21 Oct 2021 08:25:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/19] tests/data/acpi/virt: Add an empty expected file for PPTT
Date: Thu, 21 Oct 2021 08:25:39 -0700
Message-Id: <20211021152541.781175-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Add a generic empty binary file for the new introduced PPTT table
under tests/data/acpi/virt, and list it as files to be changed in
tests/qtest/bios-tables-test-allowed-diff.h

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20211020142125.7516-7-wangyanan55@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/virt/PPTT                   | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/virt/PPTT

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..cb143a55a6 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/PPTT",
diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.25.1


