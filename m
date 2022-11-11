Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE9A6255C5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:54:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otPmO-0004ix-H3; Fri, 11 Nov 2022 03:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otPmL-0004fg-MF
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:52:49 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otPmI-0003xq-SQ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:52:49 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so7203147pjs.4
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 00:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Niv9UTdehWhRNPj4LJiEgip92ka/9MjHPhUEUKlQlG0=;
 b=VevghG9nG0yMVpheg7EfNucPkWGqjPEx3LzLp14MFpHKBzRDycC0xaj0CktzzCM6f/
 tCO4dlbybCXOjvYxzsncQEBtBwZjhcAFXf6ZKEPhBiDtkPKtzdze/w3iC/4EN/uz3sHu
 LRxUPt6d/cO7uGTJNe33OYUWPMn2qtidVkB/1W2hbLmshKjUAfgsZ7wC9Q8Wsw91A4eP
 gNvyU5Dma7dl8M4xbGNmYWzpAxHsw7sBaifZIG9L9VtgYdnMoA7X1oAm7tusmTIjP9vy
 mm6WO3uZwqlMrL5ef2m9fMpTJZ1ISKt+3yUryucqPnxmqqwRx6vvVpO5e85kjL4GiPS8
 1c6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Niv9UTdehWhRNPj4LJiEgip92ka/9MjHPhUEUKlQlG0=;
 b=5wUKOHbuNnobwGoxd5aj6jvJ+Dh53TESqshiucDA+9TLhj3/BPjSEmo7xhASGhIlZD
 g9uV6IyqDgrjUnqkLqwQfKffO0GB8MRkwSeLWwn7n7sFUSpemsQORCcYe0q2Klyt23HJ
 NdTFOcxD4HC7HYCBQlh/AOmwMZMNAhaJj1n1lYNX4kPaLMRXrrcXTMOZzzrTmeSeAnBE
 QSzpO2K03vKFsxuN5r4f2buxVk5uq5sa3nxP3Xjm+Rco36msuRvbIf/lvhjnsmKkl25r
 mdWk4nLSvQ78iMPdP+gx6I4aR8A8AX3VvdubFG+v0eMM+3ZznpViS6IQ2XMoKWBsV+c8
 fS+A==
X-Gm-Message-State: ANoB5pk5wFQ1e0zjgX/aaTjxnaTJxvGJBBoZVmy9m9PM16YvCw/lPZLS
 9d5SfDSd5yBRUt2rWPwb0Ksosg==
X-Google-Smtp-Source: AA0mqf6m3Bot3aPI44r+d8Rq+LOX6OlXCisYmQA5osvUaFnMFvM6kU29Prc3T/zcv/baKAZieYLSFQ==
X-Received: by 2002:a17:90a:2f47:b0:213:c302:695e with SMTP id
 s65-20020a17090a2f4700b00213c302695emr860267pjd.131.1668156765061; 
 Fri, 11 Nov 2022 00:52:45 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.143.216])
 by smtp.googlemail.com with ESMTPSA id
 i13-20020a056a00004d00b0056286c552ecsm1036421pfk.184.2022.11.11.00.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 00:52:44 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] acpi/tests/avocado/bits: some misc fixes and spelling
 corrections
Date: Fri, 11 Nov 2022 14:22:20 +0530
Message-Id: <20221111085221.1216196-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Most of the changes are cosmetic. The bits test timeout has now been increased
to 90 seconds in order to accommodate slower systems and fewer unnecessary
failures. One spelling correction in docs along with removal of the reference
to non-existent README file.

CC: Thomas Huth <thuth@redhat.com>
CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 docs/devel/acpi-bits.rst   | 3 +--
 tests/avocado/acpi-bits.py | 5 +++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index c9564d871a..a9020adb2d 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -41,7 +41,6 @@ Under ``tests/avocado/`` as the root we have:
    │ │ ├── smbios.py2
    │ │ ├── testacpi.py2
    │ │ └── testcpuid.py2
-   │ └── README
    ├── acpi-bits.py
 
 * ``tests/avocado``:
@@ -132,7 +131,7 @@ Under ``tests/avocado/`` as the root we have:
 
    (a) They are python2.7 based scripts and not python 3 scripts.
    (b) They are run from within the bios bits VM and is not subjected to QEMU
-       build/test python script maintainance and dependency resolutions.
+       build/test python script maintenance and dependency resolutions.
    (c) They need not be loaded by avocado framework when running tests.
 
 
diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index 8745a58a76..5ebe8c14a2 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
         self._vm.launch()
         # biosbits has been configured to run all the specified test suites
         # in batch mode and then automatically initiate a vm shutdown.
-        # sleep for maximum of one minute
-        max_sleep_time = time.monotonic() + 60
+        # sleep for maximum of a minute and a half to accomomodate even slower
+        # test setups.
+        max_sleep_time = time.monotonic() + 90
         while self._vm.is_running() and time.monotonic() < max_sleep_time:
             time.sleep(1)
 
-- 
2.34.1


