Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB810709E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 12:23:45 +0100 (CET)
Received: from localhost ([::1]:49740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iY72O-00021i-2p
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 06:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iY71L-00016l-3a
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 06:22:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iY71K-0003gF-3i
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 06:22:39 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38368)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iY71J-0003fr-Tu
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 06:22:38 -0500
Received: by mail-wr1-x442.google.com with SMTP id i12so8166072wro.5
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 03:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cmingHp/pYAvd/fW+C1TdJ6cE/xSSfkdicUWZuew/qA=;
 b=mpT5lEPcHiy4pvRBllbzborT/FREw4vxbiSG2CB9Qbuv/jWFV4xGbPu4cz4OpWNbzK
 OMwzIdRWL3avOgIGn2xSUM0F4HpmDtw1am7hs5PaNAbZY6/LKDerv2HAEi2vf5GUmekI
 abCh1r/A1JZxPS8QA3NbawoLECpL0kxaR0K5xSgzw/PtM7WraWqA1YCZMXQYr6YBGr7E
 w/et/wL6Gd+laFQY6nXeKr9otwU8DqLHbzoYmj1xYEY38/FtcvQhzwP6mYf1ukzZU/bd
 GHZHrP74TFb2R6D1v6+3bNp4DWHAJoXdd4m2xQ9BWOhHs9QI0EsgCQOt86TqdBHlV5Y8
 9REA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cmingHp/pYAvd/fW+C1TdJ6cE/xSSfkdicUWZuew/qA=;
 b=WADcG6r3FdS+iMKK+jiKMzzHlm5wGefoWEpjleEd2QsWvsTDlSCPbgb6OY7L7IQ+Gn
 yGKFOJdHolY6aUsTdfC52rmYf7ibErTOzrN8v27LaHuk0tcN5yAIQWPrGvGS3D0aMmmP
 GN/BCeVEMQUgONe7Eu10XUkNxwg5FzX70gSFuOFemuDoLePq6iByM5wXITwAI3gIV3lo
 y/qgO6Gup/ZFWeF5J5PKC7hLlp0XB68ixMX7J6xRWqi3ZvoBu+cGrL3wTX3KUq5ZNbCM
 S0UY0WsLkWjqNs1XbdpMoLkr6Tg9+RQqWQUqX6dnpqWX7kv/R/V5APjzRF++DxO9gy5J
 /jIw==
X-Gm-Message-State: APjAAAXVDrrWCTlOqUOu2/H/YUCo0M6KrTHm19mJ64t83zT0Jdyv8rc+
 O/vV3MzbZ9Xp9O3IBfNw/2NOyQ==
X-Google-Smtp-Source: APXvYqw3pX/5N1yKCYZRRXK/JxmXb9w1dF+XX452WCgoFwmucgcvRgaZtQKnjUkVeMl+R3B9M8I+4w==
X-Received: by 2002:a05:6000:18c:: with SMTP id
 p12mr16988648wrx.154.1574421756682; 
 Fri, 22 Nov 2019 03:22:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g8sm3050396wmk.23.2019.11.22.03.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 03:22:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 308581FF8F;
 Fri, 22 Nov 2019 11:22:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/3] tests/vm/ubuntu: include language pack to silence
 locale warnings
Date: Fri, 22 Nov 2019 11:22:30 +0000
Message-Id: <20191122112231.18431-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122112231.18431-1-alex.bennee@linaro.org>
References: <20191122112231.18431-1-alex.bennee@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The iotests in particular don't like the output being spammed with
warnings about locales.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/ubuntu.i386 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index 38f740eabf7..18b1ea2b72c 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -84,7 +84,7 @@ class UbuntuX86VM(basevm.BaseVM):
         self.ssh_root_check("sed -ie s/^#\ deb-src/deb-src/g /etc/apt/sources.list")
         self.ssh_root_check("apt-get update")
         self.ssh_root_check("apt-get build-dep -y qemu")
-        self.ssh_root_check("apt-get install -y libfdt-dev flex bison")
+        self.ssh_root_check("apt-get install -y libfdt-dev flex bison language-pack-en")
         self.ssh_root("poweroff")
         self.wait()
         os.rename(img_tmp, img)
-- 
2.20.1


