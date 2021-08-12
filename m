Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABD43E9D04
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 05:35:47 +0200 (CEST)
Received: from localhost ([::1]:57690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE1VS-0005I2-0d
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 23:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mE1U7-000452-Ut
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 23:34:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:55854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mE1U6-0002Gt-CT
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 23:34:23 -0400
Received: by mail-pj1-x102c.google.com with SMTP id w14so7098588pjh.5
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 20:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e5DSPciE22KHIDU6/6n+a9phao9qTwglFCEv7jPfpqY=;
 b=hzjBbC1iVfeAKe3lbQXqqejHoA887nOpi6cLWCb3m76M/wAdo6nyI0HqzpJfSYqo/m
 0dmdbnD4fuVLXLLPGDVojE1Y0N2OpkfDB23nwrb8Ugc0DvfXiudNBsLwH9pwkGMpLjPV
 x7PbLfbQb5URkdKbWhV64bTHQteUT/stpxM3a9BUvEkhVZOLME9kQ19SUA8TQnulADnl
 j82rckgA6jNyJBTN9qjjFbp0Sznj0WGIFjvcCH+vrF+RJv7H+fei7P28nYYP4kWRRyUH
 QINlxBQQfuyM859EYuckloJBw4MVWWsJHPuI8/XmETqG3I8SZ0TBzF/T7KerB6tIF5u8
 SQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e5DSPciE22KHIDU6/6n+a9phao9qTwglFCEv7jPfpqY=;
 b=hdvJ5scPjqzEv1tdqbaxSubBl7AoMZQ/mzVh9eqx+gMXvmyZKmZzCAi2Pq8npbE9TR
 EC6BlxwRp1Cmpihe8JV7A4pJYUwj1o45tH+tbCFmDgXP/PUv2rzndOzgogsaLCNua5jP
 jCmV9nYxbSwMmuQ6AiJu5sIrEKeYmWLfLdJ6i4lXWRBy5OWUXGVmFG8i5SLo+OTqtk0u
 yD3rh8v+ob64ZND2OaxWQTK5qfjBIU9tN/qVv2GWmuR6WXtphHSaxdNfgSZBDV7pMA5t
 90iM/7jtRdZ+JZDipVUSuNhwsLq72LJQqUmuwyWgm289L4XArEFdPvdgZQT5J3QHzfkg
 f32g==
X-Gm-Message-State: AOAM532SGPHTVSWcOu/zlWW1y6YXNo4PLFHtuZMop4r0lKGgzXO6nlNW
 E24h/sj3OVFKdHZAGAz1IXko82L26lFRgQ==
X-Google-Smtp-Source: ABdhPJz14GJrXET/oEnUR1+cfC+Mt550jR0AQPpW9HzaI8P4wuD+mJ4fpmaOtTCclOKp1Em58Doqdw==
X-Received: by 2002:a62:8042:0:b029:3cd:8339:7551 with SMTP id
 j63-20020a6280420000b02903cd83397551mr2043918pfd.79.1628739260570; 
 Wed, 11 Aug 2021 20:34:20 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.241.160])
 by smtp.googlemail.com with ESMTPSA id h24sm1130571pfn.180.2021.08.11.20.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 20:34:20 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/Kconfig: no need to enable ACPI_MEMORY_HOTPLUG
 explicitly
Date: Thu, 12 Aug 2021 09:04:05 +0530
Message-Id: <20210812033405.362985-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102c.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ACPI_MEMORY_HOTPLUG is implicitly turned on when ACPI_HW_REDUCED is selected.
ACPI_HW_REDUCED is already enabled. No need to turn on ACPI_MEMORY_HOTPLUG
explicitly. This is a minor cleanup.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4ba0aca067..38cf9f44e2 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -25,7 +25,6 @@ config ARM_VIRT
     select ACPI_PCI
     select MEM_DEVICE
     select DIMM
-    select ACPI_MEMORY_HOTPLUG
     select ACPI_HW_REDUCED
     select ACPI_NVDIMM
     select ACPI_APEI
-- 
2.25.1


