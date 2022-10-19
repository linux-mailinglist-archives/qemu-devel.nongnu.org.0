Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12245603871
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 05:08:35 +0200 (CEST)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okzRZ-00083W-4G
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 23:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIm-00033F-M4
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:59:28 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIl-0003Ud-1Y
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:59:28 -0400
Received: by mail-pl1-x631.google.com with SMTP id h2so8310829plb.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 19:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BudlTvOWerERuhN9firEtF5P6oWWwNEC+Zk0jHYYDxg=;
 b=woOygJgIZTK7ZuWHQKb/nFOleNap3O3ZfCeZMcSUpF+DQ3aYrXUXmjnmpchkWSH58K
 lU9cQWXH0G+GfT4rje+lWw5oMKpc+SU6weytlc5gcg3hByu6p1CTK40PCCt6fqLBCSzq
 90UTCCDuN7AGL81GJWFhFeZuWQSJH5pKkdqP+zc22zP3fO0DxU9xG8k1h/cNUiu+J0H/
 5RQkHyGmKfmPUV3Xf9TsLA0LscAsw+JpEFjy0k2WCORd9jSBzvRfvlJ7qSllVpIQOqm0
 eXpcdzyGktl6/Sdd1xHQmZ2kAAtmAIvOvLpi4MdMCl0UyLIWBNcsAnI5X7fM7n9GZ1AF
 s8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BudlTvOWerERuhN9firEtF5P6oWWwNEC+Zk0jHYYDxg=;
 b=JoSBTzvcVFyEb3dx9V4X+lE+6jdrhAJK6tv04UgYFeVrKkNIbMmtEUmBX+RzdW2YQH
 DaFoC0TREBpV54DXj3ZS33IXaHyxhE2sT21qcD2L7rnX5l2WpbkXjhDM0ogWdAoOWH6x
 7s3u3NiLUmL9a6Xb4gQaaY6WsG4asZ3UQwbZrsHaBM+/3gpgOFdlsRquUY9lWUv0Gwo/
 KRcnUeCx5BEE4tWBVnTEfHRBMdULEY+kkm1iWyNVFduAUJe0aSuk1V2iQPc2LWoNJcWv
 FQHfsjUG3O6xQ7Zr/fqimBI5EZRbKtkDZdTfXluv8BS2OJLvw0nal6yzqa5La+XlUiU9
 nnlQ==
X-Gm-Message-State: ACrzQf28TXf+nIBFpP8yWSdP17HLbxI2mMa0FlnmGfmNcTxhuXpSoARC
 uewQ/VhLVeM8d5QLxPrS5LjkFw==
X-Google-Smtp-Source: AMsMyM6cB1L2KTtJVphS7R0wc5mYgGT/BFqSd7vTkfC9KEn/Wzn9jDvtaObDmCJGmO7TTx81+oBXJw==
X-Received: by 2002:a17:902:b942:b0:178:be25:203f with SMTP id
 h2-20020a170902b94200b00178be25203fmr6383984pls.101.1666148365346; 
 Tue, 18 Oct 2022 19:59:25 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.142.248])
 by smtp.googlemail.com with ESMTPSA id
 203-20020a6214d4000000b005626fcc32b0sm10320593pfu.175.2022.10.18.19.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 19:59:25 -0700 (PDT)
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
Subject: [PATCH v5 10/10] MAINTAINERS: add myself as the maintainer for acpi
 biosbits avocado tests
Date: Wed, 19 Oct 2022 08:28:28 +0530
Message-Id: <20221019025828.683113-11-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019025828.683113-1-ani@anisinha.ca>
References: <20221019025828.683113-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x631.google.com
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


