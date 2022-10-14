Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221D05FF32D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 19:52:08 +0200 (CEST)
Received: from localhost ([::1]:53224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojOqt-0001Z1-7a
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 13:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojOcH-0003Lm-HR
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:37:01 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojOcF-0008Br-2C
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:37:01 -0400
Received: by mail-pf1-x42a.google.com with SMTP id d10so5537370pfh.6
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 10:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4J+5otHGIWAjT4aMqRCkXRkSZ4ThU62OfISaDKouQ4=;
 b=2Fm6ja6okko1REsEcZX18oqekO+6vTatcRXP/uxnkypLJybuDt0cfZYQ9Qc3hMVIRm
 U1OdLrTflMAteRqdHLk+BI3iuVqb+9ctprQyO+StRvp5TXewDWibJ303Uo6G1X1UBMxX
 mmKCSc/ujvU5Mov8iN+g1j4yqEhxJOYI2SNPMq0UY1Q3YiOnWA8bbkAnrSctGngIrVnC
 A3SpkbyjdACPiEKIYKCN9is1HsK3v0rEZS8oAa+7xtmxW4HNhu61BJDVMTBbc8FXNP8F
 yuDgYatp5uFgqwEnvgWte3NWcgGFszwvwOINIrm/FNnFro6ssNusH0EfS2WxJbYtjVsg
 CekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4J+5otHGIWAjT4aMqRCkXRkSZ4ThU62OfISaDKouQ4=;
 b=4Yp+T7a2YATGz8yG93+ceotu64sIFjn2EMXNsiNnwQ9HC4ExfZZFqqyghsYanivX7y
 nM0Pdf5B3T5bTKZ9pfoRf308x3uLgmjLQJx9Vz1hgphAp3vELcjvGkpJ9NsBLq0TIVDX
 zVYJRu3vV/hv3s5IArz1MizxvhXTS9+HKWPeoSUObuwxFTjqb6hz5Pc573m4BZONxnuD
 K2+zDyvz44i7uT5FIqUx01wLcE611XrxTm138/OL66FsK9ydc+zQhZqrow6l6OGZGIyh
 sd5zH5xuTzt0juSASuX8lvyTOi/DimGHnu00lPxmMe1rS/77Cy7WD/waNOGSw1Gr4GOq
 2ecg==
X-Gm-Message-State: ACrzQf0gfm2ZCCIhpI2jbfv8RAaWjk26pTehFHDq51IKOaPLlGhguhVy
 WYvLwNUeD+UZTaOGUJW3OWfGSw==
X-Google-Smtp-Source: AMsMyM5oRbi4G0nmqxUDc6gOizdGhV3yvEb69Ku2+8LYKi8EzPw+fc5gzMpjROcaFZxMXyYBX9RE4Q==
X-Received: by 2002:aa7:8f04:0:b0:563:1a66:9f with SMTP id
 x4-20020aa78f04000000b005631a66009fmr6518349pfr.75.1665769016136; 
 Fri, 14 Oct 2022 10:36:56 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.243.197])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a1709027fcd00b0016d8d277c02sm2030042plb.25.2022.10.14.10.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 10:36:55 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: 
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v4 10/10] MAINTAINERS: add myself as the maintainer for acpi
 biosbits avocado tests
Date: Fri, 14 Oct 2022 23:05:08 +0530
Message-Id: <20221014173508.222823-11-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014173508.222823-1-ani@anisinha.ca>
References: <20221014173508.222823-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I wrote the biosbits avocado tests for testing QEMU's ACPI/SMBIOS implementation
and all the related changes including fixes in biosbits software itself. Making
myself as the maintainer for QEMU's biosbits related files and test scripts.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8ae2e43c83..30c7cd96ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1859,6 +1859,12 @@ S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
+ACPI/AVOCADO/BIOSBITS
+M: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: tests/avocado/acpi-bits/*
+F: tests/avocado/acpi-bits.py
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
2.34.1


