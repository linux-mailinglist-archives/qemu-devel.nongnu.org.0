Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E231662D2D5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 06:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovXaF-0005gc-Iu; Thu, 17 Nov 2022 00:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovXa9-0005fa-NZ
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 00:37:01 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovXa7-00072v-TK
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 00:37:01 -0500
Received: by mail-qv1-xf36.google.com with SMTP id h10so543630qvq.7
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 21:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PNJskpCv5bZH7FJsEWQg4Ok2Mg4NZEtrtXSnwsK7iFg=;
 b=RwaXxBJymzsMH4BU6IC0jKI483hLzpcbTyBcWCGq339LGPH8P1sLHOfe87XC0yszsj
 I8PJT7eEj8+1sL9prdlM4z0hbwCNHM0X6wNoB+X2J+J7Ns3EA9G2xKA22JduS0VNtCWp
 yweASgUia7gyBWejkB6cyb6gqbFjtbSo33lb3dR5GNZ9KSLcnslga/QK4edTGVnwXh70
 cfnFl2WijFUET5I/aPlh1lfzL5qEURa2jzPTopONHYiSNgOMv9WqKDejEIbn2aZvtEzN
 b7GxF56kkmRhFxW6HyU2n/pzVRbyKP4z4sDzYzv0qYRzGqwQDB8YF/MgKhJoHeG4XU96
 Gg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PNJskpCv5bZH7FJsEWQg4Ok2Mg4NZEtrtXSnwsK7iFg=;
 b=lrhXubiv15+Vpf1W8BOM8VhVR+/e2fXt4SEDZk2clEfouExt83PsLMT/Vqyb+MMiD6
 w03Lqyy/PPCwv5dDZK1WTjN4ndh2RQr8mUs/XXpf9ICrMdMldC68F7rpLjAMzwlretb8
 94JElr5N9LKxwOcBuYooBsrDXUzn14CAdaajmTYPIf0d6UBCnIZpKL8S8dvLp3PS545M
 qvRWrzc72Xp3z7igHx/TCMNhp7d0uFhfKDFtQFNMEm3yvnL164CZun4k+H8h3JwQoQcW
 YYdPgMiso0UAsPDht2i/+Mti4mo/Rj6399ouF+EBgkFaBbNQ6nj8rXEX2AgpgThVKYZy
 0ETg==
X-Gm-Message-State: ANoB5pm+f/7LenTUw5DDVGdMqbwE3Q2kZX0gC9yLSrpHOwrMZTBmeVI9
 Q1bGGaX3P18iP0QceK0KhZ9pyg==
X-Google-Smtp-Source: AA0mqf5ShAm7t9HHtz7qYe1g4YDE9LcUUU1K+iOJ/S+qS5p13V1FaynjrGxCeksJjCGXQclQizzriw==
X-Received: by 2002:a0c:f208:0:b0:4b1:ae16:ee41 with SMTP id
 h8-20020a0cf208000000b004b1ae16ee41mr1366133qvk.0.1668663418499; 
 Wed, 16 Nov 2022 21:36:58 -0800 (PST)
Received: from anisinha-lenovo.apac.nsn-net.net ([131.228.104.90])
 by smtp.googlemail.com with ESMTPSA id
 de43-20020a05620a372b00b006fbb4b98a25sm1708299qkb.109.2022.11.16.21.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 21:36:58 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5] acpi/tests/avocado/bits: some misc fixes
Date: Thu, 17 Nov 2022 11:06:44 +0530
Message-Id: <20221117053644.516649-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::f36;
 envelope-from=ani@anisinha.ca; helo=mail-qv1-xf36.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Most of the changes are trivial. The bits test timeout has now been increased
to 200 seconds in order to accommodate slower systems and fewer unnecessary
failures. Removed of the reference to non-existent README file in docs. Some
minor corrections in the doc file.

CC: Thomas Huth <thuth@redhat.com>
CC: Michael S. Tsirkin <mst@redhat.com>
CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/acpi-bits.rst   | 12 ++++--------
 tests/avocado/acpi-bits.py |  3 +++
 2 files changed, 7 insertions(+), 8 deletions(-)

changes from v1: address Thomas' suggestions.
changes from v2: more minor corrections in doc, tags added.
changes from v3: raised timeout to 200 secs overriding the default
avocado timeout of 120 secs.
changes from v4: rebased to adjust for changes from john's patch 
https://www.mail-archive.com/qemu-devel@nongnu.org/msg921975.html

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
index dd1f238ae2..ec2261893d 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -134,6 +134,9 @@ class AcpiBitsTest(QemuBaseTest): #pylint: disable=too-many-instance-attributes
     :avocado: tags=acpi
 
     """
+    # in slower systems the test can take as long as 3 minutes to complete.
+    timeout = 200
+
     def __init__(self, *args, **kwargs):
         super().__init__(*args, **kwargs)
         self._vm = None
-- 
2.34.1


