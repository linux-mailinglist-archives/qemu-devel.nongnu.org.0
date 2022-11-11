Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E50625ECF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 16:54:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otWLf-0008Um-4j; Fri, 11 Nov 2022 10:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otWLd-0008UR-1n
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:53:41 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otWLP-0000Ee-Mc
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:53:40 -0500
Received: by mail-pf1-x42a.google.com with SMTP id g62so5211974pfb.10
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 07:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=68IGbKpIUJiT4vOMy40NhRKUjViYosQVoKmJGCzi6i8=;
 b=QC+SIVkHfxC6ixBhTp1TFgnOtWmSHeLi5fUmUKyeUxtJNAfUwFRe8iaiEh64cdZa45
 Ra2GI6rHNxQoZRuxUvePjDHu7Ueim2JdQRuQSQdo36Rv/U9IHcGGVPh7d9+2ZJD77BSr
 ZG/gNklD0pH1it4BI1WgywQa9zYQOyzQy4zbnJN3yv8gRjwrTfl3rpxGWi5xMbG8bRNH
 aYBl0w2fdHgXW5matM715aAWLgz6dCrVNtRbG08R8HTtvwPHhZN+aZSMVXqfqH+kkMJa
 ydp2Xu+vqC3CldtpkvgGqJJWxEJMPkym0rtOqjXoxwQYM4IxXBWeFcwR7WD/M7PcF3Vg
 EitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=68IGbKpIUJiT4vOMy40NhRKUjViYosQVoKmJGCzi6i8=;
 b=uCZTyG5HY11NiMI0tNwSEav047KMfo2N7HTmIEBMdeQsIt4Nc+69TgW0FCkAJUr3AO
 mrcOsmFOI3EOnSlCQ4pQSYR2U+OrFZksyailvoQwcx2cHUZ9IjsetGE6G7ihhFzTnYSj
 lmJQBduUWPhio2mc6a4Z8k4D0XkQJT9eMXkCFGJlO/BCixNXDzFJwBOqMX2OEBzJy4q/
 Cyc3iqd1CoI6CydHq6tj6FvpnISWctJczgTUZiJW+vuK6xZciAUGrQDHvdA2bjLzlNpG
 Io704+K7oil3pNgvxr4pfzYCOkj892KWx9dns558ZBu0oKRO2gG54pdnt2prE8Xdvf2b
 nVeQ==
X-Gm-Message-State: ANoB5pn+XeIKSxkgpX4EO7CGwXEI4KUuJpfmrV2uMxQ8v6H57hVSjIpt
 6Ie227B3d2HxozLHHQnklS7FlQ==
X-Google-Smtp-Source: AA0mqf5866QW8I0jSs9YDBO26dfkrMgozTNSvsmzTjP9bMM2VDmVV/cKnn6eotCL+aNCryWEJkLZ2w==
X-Received: by 2002:a63:e00d:0:b0:464:45b5:745c with SMTP id
 e13-20020a63e00d000000b0046445b5745cmr2266824pgh.118.1668182005961; 
 Fri, 11 Nov 2022 07:53:25 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.143.216])
 by smtp.googlemail.com with ESMTPSA id
 a4-20020aa795a4000000b0056d7cc80ea4sm1753151pfk.110.2022.11.11.07.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 07:53:25 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3] acpi/tests/avocado/bits: some misc fixes
Date: Fri, 11 Nov 2022 21:23:07 +0530
Message-Id: <20221111155307.1256579-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Most of the changes are trivial. The bits test timeout has now been increased
to 110 seconds in order to accommodate slower systems and fewer unnecessary
failures. Removed of the reference to non-existent README file in docs. Some
minor corrections in the doc file.

CC: Thomas Huth <thuth@redhat.com>
CC: Michael S. Tsirkin <mst@redhat.com>
CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/acpi-bits.rst   | 12 ++++--------
 tests/avocado/acpi-bits.py |  5 +++--
 2 files changed, 7 insertions(+), 10 deletions(-)

changes from v1: address Thomas' suggestions.
changes from v2: more minor corrections in doc, tags added.

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index c9564d871a..56e76338c3 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -16,11 +16,8 @@ end user. The other is that we have more control of what we wanted to test
 and how by directly using acpica interpreter on top of the bios on a running
 system. More details on the inspiration for developing biosbits and its real
 life uses can be found in [#a]_ and [#b]_.
-This directory contains tests written in python using avocado framework that
-exercises the QEMU bios components using biosbits and reports test failures.
 For QEMU, we maintain a fork of bios bits in gitlab along with all the
-dependent submodules:
-https://gitlab.com/qemu-project/biosbits-bits
+dependent submodules here: https://gitlab.com/qemu-project/biosbits-bits
 This fork contains numerous fixes, a newer acpica and changes specific to
 running this avocado QEMU tests using bits. The author of this document
 is the sole maintainer of the QEMU fork of bios bits repo.
@@ -38,10 +35,9 @@ Under ``tests/avocado/`` as the root we have:
    │ ├── bits-config
    │ │ └── bits-cfg.txt
    │ ├── bits-tests
-   │ │ ├── smbios.py2
-   │ │ ├── testacpi.py2
-   │ │ └── testcpuid.py2
-   │ └── README
+   │   ├── smbios.py2
+   │   ├── testacpi.py2
+   │   └── testcpuid.py2
    ├── acpi-bits.py
 
 * ``tests/avocado``:
diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index 8745a58a76..2edc36fc26 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
         self._vm.launch()
         # biosbits has been configured to run all the specified test suites
         # in batch mode and then automatically initiate a vm shutdown.
-        # sleep for maximum of one minute
-        max_sleep_time = time.monotonic() + 60
+        # sleep for maximum of a minute and 50 seconds in order to accommodate
+        # even slower test setups.
+        max_sleep_time = time.monotonic() + 110
         while self._vm.is_running() and time.monotonic() < max_sleep_time:
             time.sleep(1)
 
-- 
2.34.1


