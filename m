Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EDAAC760
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Sep 2019 17:52:38 +0200 (CEST)
Received: from localhost ([::1]:35790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6d0v-0008TQ-QH
	for lists+qemu-devel@lfdr.de; Sat, 07 Sep 2019 11:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48811)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <th.huth@gmail.com>) id 1i6cwS-0003no-WD
 for qemu-devel@nongnu.org; Sat, 07 Sep 2019 11:48:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <th.huth@gmail.com>) id 1i6cwR-0007l6-LK
 for qemu-devel@nongnu.org; Sat, 07 Sep 2019 11:48:00 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:45599)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <th.huth@gmail.com>) id 1i6cwR-0007kA-DU
 for qemu-devel@nongnu.org; Sat, 07 Sep 2019 11:47:59 -0400
Received: by mail-wr1-f47.google.com with SMTP id l16so9423230wrv.12
 for <qemu-devel@nongnu.org>; Sat, 07 Sep 2019 08:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2jdSbx0h06goM+ImaeVDWGxaOiMgDN9DDo/rfIrNBMs=;
 b=fVG90uJWr/Z0K4IlV4QC8+AArLO1I+LrxM/3/uN6OjQXjk+Mr4qLtzezzb/f4Aj0GM
 6iD4dSqKQ7Pxo7CYq+vuabOjoUATlsu0MSAIHIz3ycP8No50bGVD3pA3hc87tlmOrmXJ
 4t9KEkqyS3Vs7LSvZEkLRp3rG5wsUXV56JPendhkBp/cxAnQoCBKAaax1M+2ZidUYBWI
 coh6U8XUWQXq3kJKo5BKiho1vkSV0WNE+RgxxTsHrEDWncFlAzfcRTxwVYftzj3h00YQ
 S7ckgrppKwctI+l2vbOqHYkEmLHVW3oKKOFxylWsTMi4JF7excdPYx+R3B0Zsmaczhel
 mX8g==
X-Gm-Message-State: APjAAAUZYUlqzwuYFJT1zLLUX2Nqs1QcCPGaXwEvzxda2UJMe/XWrvpV
 X0rhFlhGZDfhfHgFW912AJ5TVLkh
X-Google-Smtp-Source: APXvYqzoz6gsUshQXQNmY2BLVuO+CGYnK9qQ4Z2Zv6IVm+Wa0phykY4HlCVAdCo3IYcLGhVCzOfzTg==
X-Received: by 2002:a5d:6b0f:: with SMTP id v15mr10884118wrw.19.1567871278515; 
 Sat, 07 Sep 2019 08:47:58 -0700 (PDT)
Received: from thl530.multi.box (pD9E8385F.dip0.t-ipconnect.de.
 [217.232.56.95])
 by smtp.gmail.com with ESMTPSA id s19sm17173418wrb.14.2019.09.07.08.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2019 08:47:58 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sat,  7 Sep 2019 17:47:44 +0200
Message-Id: <20190907154744.4136-9-huth@tuxfamily.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190907154744.4136-1-huth@tuxfamily.org>
References: <20190907154744.4136-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.47
Subject: [Qemu-devel] [PULL 8/8] .travis.yml: Let the avocado job run the
 NeXTcube tests
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20190813134921.30602-3-philmd@redhat.com>
[huth: Rebased patch to master branch]
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 .travis.yml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 92b00927d4..106f9b5d01 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -232,15 +232,20 @@ matrix:
 
     # Acceptance (Functional) tests
     - env:
-        - CONFIG="--python=/usr/bin/python3 --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc64-softmmu"
+        - CONFIG="--python=/usr/bin/python3 --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc64-softmmu,m68k-softmmu"
         - TEST_CMD="make check-acceptance"
       after_failure:
         - cat tests/results/latest/job.log
       addons:
         apt:
           packages:
+            - python3-pil
             - python3-pip
             - python3.5-venv
+            - tesseract-ocr
+            - tesseract-ocr-eng
+
+
     # Using newer GCC with sanitizers
     - addons:
         apt:
-- 
2.21.0


