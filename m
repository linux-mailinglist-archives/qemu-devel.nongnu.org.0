Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A6C6063EE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:14:00 +0200 (CEST)
Received: from localhost ([::1]:60400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXF9-0006Mm-17
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:13:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWvT-0001jk-Dy
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUmS-0008D6-Ey
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:36:22 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:34326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUmQ-000785-VZ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:36:12 -0400
Received: by mail-oi1-x22d.google.com with SMTP id y67so274185oiy.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyu7QZZcn9Q1/zGtjEBOGs4FcuSFU9uCRS/DX2QmpGI=;
 b=cmuU8OH0DMpGS1g/z2Q776xxGtGZu6tpAnZK1fCXu8M01LUtdPywQ3wvalYyfZaknG
 /L2lwvPkZkNUzjt98nHL2cKxGw3bfM40lOkM6rG6ZeMig5ai6Hd589+shc5fdg4MFzLj
 QOJn9QIPu3HaxNp159zUGvJ+qfI2OAgp4eTtkTN3eqsZmZTq2arrWwuQ41hVXRExbkx7
 7OjxKbzBYsJQUzpcNMt57JDJGq+qyiFWjd/6mGCoE1UH7KhZiBy9D/EvgbXT7D7lDpaO
 Wfq4dHTyEAdflo5CPT+SXJS94/dqt4glcNRNAn5AGMp3bX50C/KH5/kRVd9QEwIXvMg8
 Eqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dyu7QZZcn9Q1/zGtjEBOGs4FcuSFU9uCRS/DX2QmpGI=;
 b=E9Mn/L4PLrZ32VXYnbkLgahudIVmCfaDJERAeXxXIkT+acbthGhlO2ouUDvL4Vtdng
 ljBSJ5I6rAfNcC/QQ5DAXEZ+5FWf/6+hnGSsCbS1d2+EHMjBrpqr8B4ZhPj6GtQc3KBn
 13Q3LAFyG6YsrnLi5ucnbZs9p5Rwo5XhrdqMmJGQsp7x6xs/V9WWh//jssTJgql3tgpA
 F1wfw9T6iAsbAY7K5CrhVs+X+i6WxhjP3Ss7TOvRItcmtOLTA2eEpbdLps4iigkf4s5L
 8nFmURSeoZ0Wgg3JInjoIn1neCeAT7T6lzoQ2SBT60EJ6zomeiz6RrLi2HEE8Ii/0QC8
 8XmQ==
X-Gm-Message-State: ACrzQf3kbMlv0l22h7q/rdILwNNjiKcYrJ2XWBPzj53kuDMk8aKEAqzP
 OkghY0w8OXHLMNUhj+zz0wccyqmdBLszvh/E
X-Google-Smtp-Source: AMsMyM6L2Pxeqq+J4MYMk7pKurIVI8vnkciLwinPxzcUTFsRNbMgT9HPcwtb5LhxFOAJ7NAHt91gMA==
X-Received: by 2002:a17:90b:4a11:b0:20d:382d:3994 with SMTP id
 kk17-20020a17090b4a1100b0020d382d3994mr15462424pjb.173.1666269359512; 
 Thu, 20 Oct 2022 05:35:59 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.246.137])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a170903244b00b00176b3c9693esm12794174pls.299.2022.10.20.05.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:35:59 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v6 05/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits smilatency tests
Date: Thu, 20 Oct 2022 18:05:01 +0530
Message-Id: <20221020123506.26363-6-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020123506.26363-1-ani@anisinha.ca>
References: <20221020123506.26363-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::22d;
 envelope-from=ani@anisinha.ca; helo=mail-oi1-x22d.google.com
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

Added the SPDX license identifier for smilatency tests.
Also added a comment indicating that smilatency test is run from within the
biosbits environment/VM and hence is not subjected to QEMU build/test
environment dependency fulfilments or QEMU maintanance activities.

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
 tests/avocado/acpi-bits/bits-tests/smilatency.py2 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/acpi-bits/bits-tests/smilatency.py2 b/tests/avocado/acpi-bits/bits-tests/smilatency.py2
index fb1b7228e3..d616970b31 100644
--- a/tests/avocado/acpi-bits/bits-tests/smilatency.py2
+++ b/tests/avocado/acpi-bits/bits-tests/smilatency.py2
@@ -1,6 +1,8 @@
 # Copyright (c) 2015, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
@@ -24,6 +26,8 @@
 # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
+# This script runs only from the biosbits VM.
+
 """SMI latency test."""
 
 import bits
-- 
2.34.1


