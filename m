Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7923F1DCE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:28:12 +0200 (CEST)
Received: from localhost ([::1]:56082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGktn-0007Et-Kd
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGksW-0005Vt-EF
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:26:52 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGksU-0000oB-C9
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:26:52 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso7534411pjb.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zw05ZFdqHjgGhtKrtox9DSnlZFeRGCATj1DKecGTSRI=;
 b=l6cB0Y9+YDGQnzNBJiYDqR0Qdbxq72BTLyvXeBZ5gSKMSCxLtLe9QiHLUDn3jRAfi8
 KY+zH1dQ8gpPWP6qQfYvUhkH6HyhfICtBA7v2MXSYlOnuBAJtTyQHyYhozbTWf6o8ILK
 sryTj6e0Kcz+CM4FMH8EgdciKlLNBs6RmcanZKROO0pJGiHrCXMRVX9kECr7iuKb1AxD
 +ND90aUbJ4MSR6cv4Z9VKBewVI+p9/kvxdsTcb4B+nWdMqKyhq8rXQCo90tR7xy6b6ok
 DXa53UjBgIv1scjBkIThH6iOs7ZKxrAtP1Y/AXw9drw/aV5bYv8RaA6ELdomFqbBnPRo
 BIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zw05ZFdqHjgGhtKrtox9DSnlZFeRGCATj1DKecGTSRI=;
 b=P7RCA6VAPpxUmOZT/9eza5Ulmx9dMQnHt+/wgcsZ5K8JIrkC6pSmrGzZSHIWbVrxLH
 FaOKWt/FJHv2UrZn7vmYYC654QTCtXbelVAjRyj86mUpuSPu8DOKFjA+0n5oBIPd7hhH
 2jy/3/oo5egSR03ZX16vmioAehUFXT30RoRhDd+NrKHMQQ4Z0UJ2gZaXfAgdBvijj6Vd
 wY1FK+Y3Sr0X5cenx5zmJSp9mdVO4piccOgrZS2aejsst6RgIAeGGMQAA6RXBZHg4wD5
 DjHeLvJO7Ed+tv0K11ktyDyGVobsAfr1o46MEsOlcqIdX9o3K1OXHMz1H5AndRJHhNSd
 wc2Q==
X-Gm-Message-State: AOAM5310HdEgsxTNBxt4JZ0Fyj0KuVNOgzAJBJR7H8eQiCLr3r0hWm3T
 afYquRPuZHnnrFOtKRfif+EKN4tPVH37Bw==
X-Google-Smtp-Source: ABdhPJy7/2IEDSUTuVKbcn2bJGhKDPltVjQN2qiAwOCLSN/93hn/u8V52/SbKo9jniiEc1qf7G5ChQ==
X-Received: by 2002:a17:90b:4d8d:: with SMTP id
 oj13mr15814470pjb.74.1629390408576; 
 Thu, 19 Aug 2021 09:26:48 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.110.72])
 by smtp.googlemail.com with ESMTPSA id u20sm4703800pgm.4.2021.08.19.09.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:26:48 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] hw/arm/Kconfig: no need to enable
 ACPI_MEMORY_HOTPLUG/ACPI_NVDIMM explicitly
Date: Thu, 19 Aug 2021 21:56:37 +0530
Message-Id: <20210819162637.518507-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
 shameerali.kolothum.thodi@huawei.com, qemu-arm@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit
36b79e3219d ("hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)"),
ACPI_MEMORY_HOTPLUG and ACPI_NVDIMM is implicitly turned on when
ACPI_HW_REDUCED is selected. ACPI_HW_REDUCED is already enabled. No need to
turn on ACPI_MEMORY_HOTPLUG or ACPI_NVDIMM explicitly. This is a minor cleanup.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 2 --
 1 file changed, 2 deletions(-)

changelog:
v1: initial patch
v2: commit log updated and ACPI_NVDIMM also removed from config.
v3: added missing parenthesis in commit message.

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4ba0aca067..dc050b5c37 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -25,9 +25,7 @@ config ARM_VIRT
     select ACPI_PCI
     select MEM_DEVICE
     select DIMM
-    select ACPI_MEMORY_HOTPLUG
     select ACPI_HW_REDUCED
-    select ACPI_NVDIMM
     select ACPI_APEI
 
 config CHEETAH
-- 
2.25.1


