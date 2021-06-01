Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F222A397AFE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 22:08:45 +0200 (CEST)
Received: from localhost ([::1]:60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loAgv-0008Nk-0W
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 16:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1loAbl-0002Xp-Bs
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:03:25 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:39780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1loAbe-0002y2-Ss
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 16:03:25 -0400
Received: by mail-pl1-x636.google.com with SMTP id q16so7488828pls.6
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 13:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hWMEMeWS1rJpbPU/bwAynu8rJ3Hz8BETIjICwx5CVa8=;
 b=dSV2fgLieD94DqXaTh1FwvRU6L/ewQP4qVQyGRUzKcCwIXE771UcSzvQDCX5RLwUHk
 xrgVigpojLzmzijtFQl3QsHcIR7C7bs7//ajKYwhmyZHUuZEx/ciwdEYR6W1luZplKVW
 v7DxYkxTdzBPlmHzzafWFp4GubAbihox9b8wi1WaYSkFsurSuLSlofd8qq3aVQSTpfXc
 JPOvJ+ZOVxanxHRE9IOcYCuLYftwCH4qEAZHBSYM6HpdilApWAyu3NFzc+DjlJHG1d2B
 rId6Hte1ImLrA6tZG679skcy60TpIdnRETKXJtJkMQQGyk6bOFqkazepVz48jNld6W4p
 cj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hWMEMeWS1rJpbPU/bwAynu8rJ3Hz8BETIjICwx5CVa8=;
 b=p9kbExF4bJC3PcysNjcy/P/BJlV8nm6obvawIQLUpC+Xl9gtT6r6Bj3bxjV1WOEmYi
 w6hWsU0EwRNRD98XFTfyHKXUuzf2/TPdQlytPBQtDHB7qIP137n7Ef8xyEleYYY8Q/oa
 Tcn6x8JfDgr+jzO6IGqLxcs4QL9Ky2lqleaVyJMMbKz0tH1HWCFK2kmDaopA7vwXSiTJ
 Ih7VZgEYYJ2cEg9RNQEza44rEJcKG1PRZjGa3HaFXEpxgor2AVZQhIxX7NFnhQEu2Ckh
 KdW6HsiC2ZBi8nGhY+gvPczHvVJsJC9ATeOJNeEe4yR5nIsKGH7IOAZIQmiKYBYf3eg6
 eqmg==
X-Gm-Message-State: AOAM530aJgxeWDvB3YeDcQ6f7Ch1G4waYLKXz/ACBexHf7iemYoRvJOs
 Cr6ZtLe4y6SyFpLwYiTsf9L/Ww==
X-Google-Smtp-Source: ABdhPJxwIc0XwMcy0j+A2glFHFWKYBRYo2sGc2pqaGdgM45s3Ml+rQJmIOgP69FNDFNt9Y1T1SSsxw==
X-Received: by 2002:a17:90a:3f8a:: with SMTP id
 m10mr1534326pjc.77.1622577796943; 
 Tue, 01 Jun 2021 13:03:16 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 23sm15486229pgv.90.2021.06.01.13.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 13:03:16 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com
Subject: [PATCH 5/5] MAINTAINERS: Add maintainer for vhost-user RNG
 implementation
Date: Tue,  1 Jun 2021 14:03:05 -0600
Message-Id: <20210601200305.1772391-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601200305.1772391-1-mathieu.poirier@linaro.org>
References: <20210601200305.1772391-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: viresh.kumar@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds entry for the vhost-user-rng related files.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f55404f2fae..6a0d61443571 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1937,6 +1937,15 @@ F: include/sysemu/rng*.h
 F: backends/rng*.c
 F: tests/qtest/virtio-rng-test.c
 
+vhost-user-rng
+M: Mathieu Poirier <mathieu.poirier@linaro.org>
+S: Supported
+F: docs/tools/vhost-user-rng.rst
+F: hw/virtio/vhost-user-rng.c
+F: hw/virtio/vhost-user-rng-pci.c
+F: include/hw/virtio/vhost-user-rng.h
+F: tools/vhost-user-rng/*
+
 virtio-crypto
 M: Gonglei <arei.gonglei@huawei.com>
 S: Supported
-- 
2.25.1


