Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA203F1DB9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:23:18 +0200 (CEST)
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkp3-0002nG-7X
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGko8-0001vP-Q6
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:22:20 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mGko6-0006Fn-Tl
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:22:20 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso5162781pjb.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p44jCeYKdrpA7KiWVnFT5WLCgnHA26AOQy7zDNCARlM=;
 b=Bg6a5swKB3Gi+XauMZ5TataNQDj7q6CfoHP1Ajynri3ysO+3v+LVNv1bUSDDrY5aDL
 pSa30jLrq4nEO9LBvhO3ah6pt94DSRXp9/BWYEi+XTgfOUAN2guE1vu4t5LGaMmXKHTm
 rin5eElcU1SqvDyXPtZ3bfIst+2DuVBc6cHTjmg1IRL0bcb6+3o2PZbp1Bh8Js74p8wp
 3+rdbwaNqk9wgO0V/dmEuekOlFzNbwCKis/JgcscCzENzmhXnaur53D0ks3dvUSS3c3C
 ScZVaPuc0kd+HDhss7W18gyjglpD6Tn3HDZ+viGELzghw8xYiyDvufhVZE7q2VmodY66
 UZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p44jCeYKdrpA7KiWVnFT5WLCgnHA26AOQy7zDNCARlM=;
 b=mxs2IQdbyhNVGujbajwaPiVIwJKRjw7Wkl8RmTGs0bHTe/tuB9zJIqtJVd3LKkZJNu
 K/JvV8Jap3guPKiQnWMOXfJZOUPt3hNONF29fLt1B64A9A22cztcnDH1mCpG9V/F00Rc
 /KO/fBqLHraMj7PoBlzybsIVfEbhqfR60w3idBqM5W0FxjnvFy3zwumLAb4tIzcdlLPS
 SaZhNCyk4cKlIkbIMy73xX0y0STlKhepyZwjUCysZ6jinL1t6ASqzGpmdr4t5o0vjJnT
 TOXvCWaRraBdimJWG4H9+ROsVC3+yFjh6OTzGvdzhhnNOVCsBm44aieB+mC3WYiiBS5D
 82aQ==
X-Gm-Message-State: AOAM530/bLCt4wktd2yY8O0uIgQ0Q0s7+BqVue2R6/wCt90izIRriEJ2
 TfqtLkeJEz8EuaE1PYNIHfXoHLmC8FIxIg==
X-Google-Smtp-Source: ABdhPJzmMwoNG4GwahWFNH3Bh1kV4HbBHUq6VzK3rxExR6LVcbzCF/p8Cie0/jV2HeqxRVcM48K8vQ==
X-Received: by 2002:a17:902:d343:b029:12d:3624:d997 with SMTP id
 l3-20020a170902d343b029012d3624d997mr12599682plk.79.1629390137161; 
 Thu, 19 Aug 2021 09:22:17 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.110.72])
 by smtp.googlemail.com with ESMTPSA id a6sm3445595pjs.40.2021.08.19.09.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:22:16 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/arm/Kconfig: no need to enable
 ACPI_MEMORY_HOTPLUG/ACPI_NVDIMM explicitly
Date: Thu, 19 Aug 2021 21:51:57 +0530
Message-Id: <20210819162157.518203-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
36b79e3219d ("hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)",
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


