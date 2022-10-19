Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CD060386E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 05:08:21 +0200 (CEST)
Received: from localhost ([::1]:44488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okzRM-0007Za-10
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 23:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIT-00029E-HS
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:59:09 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzIR-0003TA-1y
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:59:09 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso19273949pjf.2
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 19:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyu7QZZcn9Q1/zGtjEBOGs4FcuSFU9uCRS/DX2QmpGI=;
 b=RLnbPcKoY7ZXBCrK1Nawod8qazmHX841vqoI2PqGXIojuIenfL0XUuGAdmj/4uee4F
 Xt7caC3XSKlf7UcaJjsSeCLNk42bHqxExXsuXXL4azbxZRuCyzfpPzhT/77UBqgsPN/p
 EGaZzYoxjI/I/CImN1rSSQJiYkZn2nGJ8pEGY190+sninCKXc2x1EB79eRa0YJOno0OR
 sgUywf3Sx+H1xiGIoi895D8rBrFl6GjLoOdMDeta0fk+DOKQXE5H0YdOJSv7dF7un8Kz
 l3jAHVpStiNgsAx/FxntdH2AQaESevzyAKwkyExV2XzGenLtXzaY/SHMxMaBOIvfKGif
 bVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dyu7QZZcn9Q1/zGtjEBOGs4FcuSFU9uCRS/DX2QmpGI=;
 b=wKnmW2iEoVb47aitYTwg6USi5ZG5K7E6wsNVKjRk5pylVuttDS5NoNRAz6+WXzHFz/
 rXWnF2zItVd7DCHQeYzYAljHaJoh+k1Mk2SXSS3gx6ohn1Du4ab7yiZIbAFSZ/HRbngZ
 BeDdQvPACqsBRGSmXqBGTgcCwtpqyyFCmAwWQ3Sezo4LDg/3VuM7oxJwGyztT8cAjWk1
 +xsVYeoxM1PkXFBcw4eqFYiHWeG3lCP0AeDDuq0ODsW0Xjrc0I3PULghYmj2dvKH2Hmr
 hO9f4vcIb2EtIE7tpvQFUyAluCSi5nNtCS6D0VgwHNrarbMi5e3c+HbdHGHgnjPIDWWf
 eUzQ==
X-Gm-Message-State: ACrzQf2fkTk/ITWzBSYYuj67bp696xi338VE4+tekIF/Mg2uMVDZEynl
 udgn0B/r/femv9AX9ueDCU/PsA==
X-Google-Smtp-Source: AMsMyM7fmVmdbASgEsGUmwlTE+mbGO8PDyiCXqH+9C26AxZvxNCyByr850WVrUs0I86W96FC2zSkzw==
X-Received: by 2002:a17:90b:4d0c:b0:20b:c983:2d85 with SMTP id
 mw12-20020a17090b4d0c00b0020bc9832d85mr43244069pjb.45.1666148342762; 
 Tue, 18 Oct 2022 19:59:02 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.142.248])
 by smtp.googlemail.com with ESMTPSA id
 203-20020a6214d4000000b005626fcc32b0sm10320593pfu.175.2022.10.18.19.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 19:59:02 -0700 (PDT)
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
Subject: [PATCH v5 05/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits smilatency tests
Date: Wed, 19 Oct 2022 08:28:23 +0530
Message-Id: <20221019025828.683113-6-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019025828.683113-1-ani@anisinha.ca>
References: <20221019025828.683113-1-ani@anisinha.ca>
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


