Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6F9150306
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 10:11:01 +0100 (CET)
Received: from localhost ([::1]:36556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyXky-0008Pw-Iw
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 04:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iyXjh-0006VT-UL
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 04:09:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iyXjg-0000uS-P8
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 04:09:41 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43545)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iyXjg-0000sm-Ig
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 04:09:40 -0500
Received: by mail-wr1-x442.google.com with SMTP id z9so4685111wrs.10
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 01:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JsR4jQ6aw+facdRlgBdRMw3JO188UsKCZh8bwNTdKqk=;
 b=qrMz3lGqOv2Ce+1DlC1ofxDLmIHjJdfIYvSZWurEH+kPz8SJ8N64BfGaB8oRqyBEal
 ZHw8980erLZfIw+Xv5sU5FiVeVW08aeM+HB467LFlev4Y+sYXcPJ8HkIT9ew9lLcCU3v
 0EfMmzeJH0nuvy12k/xZvO1byMAmSaueR37M3v0ylihrPlCCNYjD10ZH2RXIClOv4g55
 vHAfLnG/7Tvc0fltFKCgEdE2EkWMJELo8X0m7h0a1K+eO0BpwTxHRgaDyvtNJYnoZfzK
 PuolPQzI9b712v7DEKhUu//ns1zAbwVTY7ywmSDigsFJZWoxQFz6uQIuPq2HygCuI+aB
 DNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JsR4jQ6aw+facdRlgBdRMw3JO188UsKCZh8bwNTdKqk=;
 b=hsj7X19ruBmx3X8lrfVjaWafx6x3F+ez3dY3O49oJlzvCaO4MhGUdUnLEaZWP0R3vZ
 Ua3U+QTD6nu91i5qsIXSx0rEVJnlz2a7tTUvSihDn++B7Tt9pKyuuNK5tAQUxtOWvMx1
 8unkHEBrHLOPBklUXrdU1W9pXGDO2bA/nS1szKrL0bg65y6hG6k3bZ4afy1oL8vZud08
 hDGIgWaQaJMxjr5cq2dsO07XS3FlZ2jKQjfSY+NUdLsdT1SCR+y4xVWyVz3Xd89PAxwa
 z2IJtLT9CR8qQ1rcV8htVFECeuOktBPXf2yghoInKi8syfp5g9DNGAWcUyqJ2M+iVp4j
 3UAg==
X-Gm-Message-State: APjAAAUOYDrxDASaKTIZWbo+AktG1c0cKgUtbyV5SfNzPbngte8Mf6ue
 QzAWpPHt3qbJV2VRDSjNz1tY4A==
X-Google-Smtp-Source: APXvYqyWAv3OFW1GNmwV/Zemolegj0jA9Nl103PgKe7qV8p8A+5nh5JV+9ZDxu362wo7Qagl9KPaNg==
X-Received: by 2002:adf:fd84:: with SMTP id d4mr13881671wrr.211.1580720979622; 
 Mon, 03 Feb 2020 01:09:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g128sm22040269wme.47.2020.02.03.01.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 01:09:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD6041FF91;
 Mon,  3 Feb 2020 09:09:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 04/17] travis.yml: Install genisoimage package
Date: Mon,  3 Feb 2020 09:09:19 +0000
Message-Id: <20200203090932.19147-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200203090932.19147-1-alex.bennee@linaro.org>
References: <20200203090932.19147-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The genisoimage program is required for tests/cdrom-test
tests, otherwise they are skipped. The current Travis
environments do not provide it by default, so let's
explicitly require the genisoimage package.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200110191254.11303-2-wainersm@redhat.com>
---
 .travis.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 1ae645e9fce..e75c979b6c5 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -51,6 +51,8 @@ addons:
       - sparse
       - uuid-dev
       - gcovr
+      # Tests dependencies
+      - genisoimage
 
 
 # The channel name "irc.oftc.net#qemu" is encrypted against qemu/qemu
@@ -383,6 +385,8 @@ matrix:
           - libusb-1.0-0-dev
           - libvdeplug-dev
           - libvte-2.91-dev
+          # Tests dependencies
+          - genisoimage
       env:
         - TEST_CMD="make check check-tcg V=1"
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS}"
@@ -412,6 +416,8 @@ matrix:
           - libusb-1.0-0-dev
           - libvdeplug-dev
           - libvte-2.91-dev
+          # Tests dependencies
+          - genisoimage
       env:
         - TEST_CMD="make check check-tcg V=1"
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},ppc64le-linux-user"
@@ -441,6 +447,8 @@ matrix:
           - libusb-1.0-0-dev
           - libvdeplug-dev
           - libvte-2.91-dev
+          # Tests dependencies
+          - genisoimage
       env:
         - TEST_CMD="make check check-tcg V=1"
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
-- 
2.20.1


