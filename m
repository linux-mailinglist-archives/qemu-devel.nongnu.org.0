Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95C3D6DB1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 06:47:48 +0200 (CEST)
Received: from localhost ([::1]:49428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8F0N-0003tS-3Z
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 00:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m8Eyq-0002jO-Es
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 00:46:12 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m8Eym-0004pz-NB
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 00:46:12 -0400
Received: by mail-pl1-x632.google.com with SMTP id i10so11287569pla.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 21:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lOIOYNdB3fNX3h1Ge5giFUpseAy+LYr/Eb/x8dSryOg=;
 b=Z0+jpDkGj21GAH/Qj+0O0WfJ2HCWX2218v6aFQzcySrkfo6QqkXcnGdnZb7Gx3VKF0
 zqO8FeVWbqcPWWOi/4XC3WFmTzsaySfs9srRb1+GXJ4eDVVVfMendBbpkJfZJqaBQ+as
 D9dKO5xey+oDwz7IfhK5iIMa3W/9BAteh4oHu6Pso84Sf7QZf/cZArOPe7TkH6So9Zeu
 St2LGQW2EZFBqGIyAd52sT2SNk0f5kgM5zmo9S6Y7nGxO2P+vBooyyoej1kuusj+QUeR
 cvuTMtzKsP3JYQyQn3hRml9DOHjIMGoSUcT9p2nSklFOu/HXxur4TVGN9IvqlFVMWelS
 OyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lOIOYNdB3fNX3h1Ge5giFUpseAy+LYr/Eb/x8dSryOg=;
 b=rAY2xnIyUofGMD30d2HTA/KljpodFOFWA7aZX5RmSLEIIoLrarERJRUwh2CdpGbq/I
 OFGVjHL5AhWKlCzoCGkJqDgXVIEvnQtjz8XDVg+UUfcrxbbXHUq30zBOnWUQIQZmKrtY
 19yTrjlB6Hi+ap8WeqrPBMdzNztDOsIJRb6Mjgvw0Gj2QLuw4k5CvmyA3m4cBuU02Vqv
 XX2cgfeRR+CzbcJNiTsBb/hsu+Ba+h6Uzd70iV/z3wMAyD2DanwZEE0c46i4/YwPnJvd
 x04ZBxioLT9jL3nSdcqe3fFGPBb0Lwlb5634+0fhWDV7vYP9kagDDgmMzPhZ6cdMiaN4
 bVqA==
X-Gm-Message-State: AOAM530/HM2df/mmcwO/k9t33jfV6g4yvR5nYhRwV14n0YqlbRFA3peE
 RrYbJDJERJGGsqVLcr/93HfnWfe/JikVtA==
X-Google-Smtp-Source: ABdhPJyUIAu7uN+Xsz4Df6P+fLKPgJY7yd7yrXd4JfgvQYXmU65w1XX6moLfpDEGZE964PBLwToecg==
X-Received: by 2002:a17:903:187:b029:12b:aed5:d2c5 with SMTP id
 z7-20020a1709030187b029012baed5d2c5mr17225000plg.81.1627361166851; 
 Mon, 26 Jul 2021 21:46:06 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.105.121])
 by smtp.googlemail.com with ESMTPSA id z6sm1687043pgs.4.2021.07.26.21.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 21:46:06 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/i386/ich9: add comment explaining an argument to
 acpi_pcihp_reset call
Date: Tue, 27 Jul 2021 10:15:46 +0530
Message-Id: <20210727044546.246363-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x632.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

acpi_pcihp_reset() call from ich9/pm_reset() passes an unconditional truth value
as the second argument. Added a commnet here to explain the reason why the
argument is being passed unconditionally.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/ich9.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 778e27b659..b2e3c46075 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -281,6 +281,11 @@ static void pm_reset(void *opaque)
     pm->smi_en_wmask = ~0;
 
     if (pm->use_acpi_hotplug_bridge) {
+        /*
+         * PCI Express root buses do not support hot-plug, for
+         * details see docs/pcie.txt. Hence, the second argument
+         * is unconditionally true.
+         */
         acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
     }
 
-- 
2.25.1


