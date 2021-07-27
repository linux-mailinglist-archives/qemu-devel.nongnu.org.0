Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6E3D7BE3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 19:10:31 +0200 (CEST)
Received: from localhost ([::1]:58664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Qb8-0002qt-8z
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 13:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QVG-0006Gs-06
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:04:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8QVC-0006bo-Vk
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:04:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l11-20020a7bc34b0000b029021f84fcaf75so2392038wmj.1
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UgTDCipvYLinXo5dTrVix7FeXSihY1wLnUUlaXYy1z4=;
 b=AWhKbnfpnGO9QijCMu1xWMuH4tlHUo5te5i/bSUYz2AbkqPTpb02mTJ3q3EbnsOqwn
 AK5DOSOvbOpwJwAETAalJFmWPMf4pnsXBFXrsPwPMSC1N6UyGvVEwxPFggQ2uLwAdJfR
 I9A2ZRe0FdNgxvM6bG1H7RVC8iozlU2+yjUD+gc7DvjQMhAGKjuIbwvNDpBHgF0z1JrZ
 nN9tscjYyjAYniJQQS5+sgId3b3xYYfHG41KtUPvULYLtKHROP2D2N9iZttd0S+mjJ3J
 NXBgNPT/rB0NpzNXs3bF/u+63Uy/t6TrrubHIHE9yAyyYBlRYbOV+aSCBj22/C0ARS1H
 8auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UgTDCipvYLinXo5dTrVix7FeXSihY1wLnUUlaXYy1z4=;
 b=tWiDT4z6Dbx6PXRpiiJyjyXL3YEowfSNMpTy5waoYEWkY5e0u05Iv4nOBMnLARJEey
 3sS1uWkGc8WsQKFAgFKPLsxN8abOFa0WsGH9w/BTzonlUdeZzSn8HOp4M7RmVZxpaB15
 6hOEmmVNp/b6BPdkVIdx+hUyptgd/d6KAwm90NQQlkqiDXSHB34hknpdgFNkluT1+SYS
 nz+08gOnHN8arlEKGd5gAPF05IIaKYHe3hGhv4otFNXkS+2XJI292lZsRUMmIPjNyYYh
 sCu1aAqVny7zarjgJKxZE9PG+IFT7Ph6VCvcuWY/BrLwCcMwdPwYT2WQg/XHME9mpZvp
 DlTA==
X-Gm-Message-State: AOAM532R0HTjwcxSyDJMVo7uwsSwXdgmBN3+HVa9VPOV2W7PGdL/HI7j
 wdvJXCdd+nlO+ZEV3OxhOTdY0K51Sfhdug==
X-Google-Smtp-Source: ABdhPJxwukNFwY8cOKa395Rwwa+F0SbwUX8g1VE+bT8//B1LUoU7fPXAANqXIYsXbrcYj/ZwnzhCNg==
X-Received: by 2002:a05:600c:3793:: with SMTP id
 o19mr24118344wmr.31.1627405461710; 
 Tue, 27 Jul 2021 10:04:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 129sm3708518wmz.26.2021.07.27.10.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:04:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] MAINTAINERS: Add ACPI specs documents to ACPI and NVDIMM
 sections
Date: Tue, 27 Jul 2021 18:04:14 +0100
Message-Id: <20210727170414.3368-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727170414.3368-1-peter.maydell@linaro.org>
References: <20210727170414.3368-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add entries for the ACPI specs documents in docs/specs to
appropriate sections of MAINTAINERS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is an educated guess; feel free to suggest that these
files should go in other sections.
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 445f7fe2d19..ae9c2680134 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1751,6 +1751,10 @@ F: qapi/acpi.json
 F: tests/qtest/bios-tables-test*
 F: tests/qtest/acpi-utils.[hc]
 F: tests/data/acpi/
+F: docs/specs/acpi_cpu_hotplug.rst
+F: docs/specs/acpi_mem_hotplug.rst
+F: docs/specs/acpi_pci_hotplug.rst
+F: docs/specs/acpi_hw_reduced_hotplug.rst
 
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
@@ -2058,6 +2062,7 @@ F: hw/acpi/nvdimm.c
 F: hw/mem/nvdimm.c
 F: include/hw/mem/nvdimm.h
 F: docs/nvdimm.txt
+F: docs/specs/acpi_nvdimm.rst
 
 e1000x
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
-- 
2.20.1


