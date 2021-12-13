Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B6C472036
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 06:05:12 +0100 (CET)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwdWM-0001Ij-Qa
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 00:05:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mwdS7-0000GM-P0
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 00:00:46 -0500
Received: from [2607:f8b0:4864:20::631] (port=40681
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mwdRc-0004AG-3l
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 00:00:33 -0500
Received: by mail-pl1-x631.google.com with SMTP id v19so10341715plo.7
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 21:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5V5AKnnqISYDz7P5Ld9GmLXGdV2kSFF7PxjrtmVCOno=;
 b=eJrGw3eDQ4EGpHxyl+u1oEcMHCKYa1+uVZpMpHXaBoHmisudwvzRPA/MkD49FV6F9+
 /8ueQtL4XNVD9cDFFt2m8z+l2Wzg8LH+AT/ZTMgzsBoZB/RoaOPCjCV97Ir5cUdGHcsL
 Tb19HdBnOLVxwuLp85xC+3mVrgWGr8fGwx1A7YJRvOchDLzELY0/lRqt4np3xnfIFJTW
 MsseBfi6Edm+cmAsOhiIDqkXs71HR9V7dZ8ooHqihyInOppo4Pz7frlJ8nGXs9GSXqTg
 7uKV8NVNZwpcuuYLTTjKRnPpsESYwqYdeOi9tBfoZXqoYtYgB0kpQbNJ5ZPMFYDmxWFI
 VoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5V5AKnnqISYDz7P5Ld9GmLXGdV2kSFF7PxjrtmVCOno=;
 b=Sg1JrrfxrvzZcOGsJ3W5Ex7ua6u9Twh069TXG7ObYD/1dtlLyUX5kdpelwvwMsNouT
 68RMB+b6vOPzU2kspQcTdyz0DilO1rlpG4Eoc91T5e1CsBXymxtYCcWRuiXLcTt3vYnV
 t5Bh3fYwW7CZuckKut81EMdsimM09LwAESppsHHt+kicXENrAHX0R8DhbXXZ705FKzfv
 6Mw5aacE+3bYO3pp9SThOw3CzqiO3CzjTLHxsG0VvyqIl1aT6SXqM2dBrId2eQzda+6O
 pY6MdAYlDKpXNf6UkfgXntd5R8obH/XZb9fhOc8vf+i+o2n8ytiLREOc0J94SBlBjT+c
 GorA==
X-Gm-Message-State: AOAM5300cuOukpWlQGDa75SLG3PeNtSsC/5JOUQ4MUCD3y8cdXWeo2U9
 tzGpiJcTo4AIVJ40gYQt+2Y+PA==
X-Google-Smtp-Source: ABdhPJzYciyf8cyLHuwkoB8SNuuAXdJyqFckZJURgpe+7x1oElD1ynekvwUN8lOzL3yHYuAYsMqqyA==
X-Received: by 2002:a17:902:cb8f:b0:141:fa0d:1717 with SMTP id
 d15-20020a170902cb8f00b00141fa0d1717mr93305068ply.45.1639371578374; 
 Sun, 12 Dec 2021 20:59:38 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.107.163])
 by smtp.googlemail.com with ESMTPSA id s8sm10411106pfw.75.2021.12.12.20.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 20:59:37 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: 
Subject: [PATCH] MAINTAINERS: Add a separate entry for acpi/VIOT tables
Date: Mon, 13 Dec 2021 10:29:24 +0530
Message-Id: <20211213045924.344214-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x631.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, jean-philippe@linaro.org,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All work related to VIOT tables are being done by Jean. Adding him as the
maintainer for acpi VIOT table code in qemu.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7543eb4d59..f9580f2fe2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1776,6 +1776,13 @@ F: docs/specs/acpi_mem_hotplug.rst
 F: docs/specs/acpi_pci_hotplug.rst
 F: docs/specs/acpi_hw_reduced_hotplug.rst
 
+ACPI/VIOT
+M: Jean-Philippe Brucker <jean-philippe@linaro.org>
+R: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: hw/acpi/viot.c
+F: hw/acpi/viot.h
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
2.25.1


