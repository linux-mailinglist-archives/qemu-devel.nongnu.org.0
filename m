Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BFDB3230
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 23:25:47 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9c1i-0000OA-5a
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 17:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i9bw6-0003Ns-Pz
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 17:19:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i9bw5-0000pk-Pv
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 17:19:58 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38660)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1i9bw3-0000nu-ME; Sun, 15 Sep 2019 17:19:55 -0400
Received: by mail-wm1-x341.google.com with SMTP id o184so7969379wme.3;
 Sun, 15 Sep 2019 14:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9QGPKoXDG7IUIkbuFGhhPeiHEwhhMV7swOpD0OI7chI=;
 b=Jsam9RUGrCWdCKYGShz/wmYW+pbbjMMeINuVK7x2/5VpLG5CfyWyU26bdC/HxHOX9z
 /a26WKw2dAFDCUPI56GxSutr/0lyc2sZLY6W9gVuM8TzaLzZZwK4IAfbTzrQZPWN6vbn
 bPqmABI4k9aWjXhAnsnVwul/tAZyM+H/GAodjJmMkJat3j/r5/vQnCMJzQGyM8MUi2dn
 kEOZiwp6Fw2lnLmhkBvSp5wtq5cHkncATBFf0sn3aShIlbdLHhFwsvTNloLWGbtwjxYX
 vDM0O4xQi93l6PUZZQBqItqFJU7W+x5FIykNwGjgzZZqrL3GA1j2nmGRukOo3oT9KzLE
 2hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9QGPKoXDG7IUIkbuFGhhPeiHEwhhMV7swOpD0OI7chI=;
 b=ZiHsZ/vfVEIi75kfksGxX5YKr0bh3gAmACvGM1brTWoFRmDvT0LRahSxMUWnTwC6Ci
 Ervwh6bnqhNdCZ1CebvXAErVWmP6rEYIHnyCeUU8JcThGxJKrClDkuySFF+j7fAIMTm1
 haARuEfWtmSXYI783kxqQPhTiiZM0VgE72pA5ENIZEfOnxEe8SJ2Ekf9GigBarumo8sx
 rYifLKmonbqwDSOdcsA/OxxPJ2ooreEP8OZqM17ASF5rQ5DKW37UmrpPLm9R3Clufk0G
 9VgqeZQd44oYDiYOKjZ0ZWtVzdOOII5QKBs9E8nKqRdcj756CczxhiZAkANDAlVr9g9b
 uP2Q==
X-Gm-Message-State: APjAAAVlb2/7nflmGAaShsYdMqRZo1YgNXhvS+47Uu+wZP9nOzY+YMAM
 MxBtK/7fVehMDTWx9oCDyRHDQvFC
X-Google-Smtp-Source: APXvYqwvcF3Q7nKEgn2AtynYud3pTZ6ulZKBHIGHzx5To8gsZfMP+WyGafCBIhpfckxY/354qHRElw==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr11163941wmb.118.1568582394612; 
 Sun, 15 Sep 2019 14:19:54 -0700 (PDT)
Received: from localhost.localdomain (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id s1sm50271021wrg.80.2019.09.15.14.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2019 14:19:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 15 Sep 2019 23:19:40 +0200
Message-Id: <20190915211940.30427-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190915211940.30427-1-f4bug@amsat.org>
References: <20190915211940.30427-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v2 6/6] .travis.yml: Split enterprise vs.
 hobbyist acceptance test job
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .travis.yml | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 69a37f7387..753276eb33 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -265,9 +265,23 @@ matrix:
         - "3.6"
 
 
-    # Acceptance (Functional) tests
+    # Acceptance (Functional) tests [enterprise]
     - env:
-        - CONFIG="--python=/usr/bin/python3 --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu"
+        - CONFIG="--python=/usr/bin/python3 --target-list=x86_64-softmmu,mips64el-softmmu,aarch64-softmmu,s390x-softmmu,ppc64-softmmu"
+        - TEST_CMD="make check-acceptance"
+      after_failure:
+        - cat tests/results/latest/job.log
+      addons:
+        apt:
+          packages:
+            - python3-pil
+            - python3-pip
+            - python3.5-venv
+
+
+    # Acceptance (Functional) tests [hobbyist]
+    - env:
+        - CONFIG="--python=/usr/bin/python3 --target-list=mips-softmmu,arm-softmmu,alpha-softmmu,ppc-softmmu,m68k-softmmu"
         - TEST_CMD="make check-acceptance"
       after_failure:
         - cat tests/results/latest/job.log
-- 
2.20.1


