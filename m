Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E293274F4
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 23:46:22 +0100 (CET)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGUpR-0002yk-Bo
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 17:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUmz-0001wy-Rs
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:43:50 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUmy-0006YN-3C
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:43:49 -0500
Received: by mail-wr1-x436.google.com with SMTP id v15so14161267wrx.4
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 14:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2kdcy0sdbgADwb36cqE0PH+LAqeIhqaW0nO0Wg/Y6U4=;
 b=kawu9bvZ7Ke86KEzA45rK7/Z8DNUVWsAsAjCuJqdublj6AuPir5S+f/S8h9y8i/1k2
 dvX4hDcK5CBiD7BswqdHI7I/32az7MiegmvekhKh9iJmacMndpln7UaU1yF8sfm9HEFr
 u3JlK0d5YJyXxhD6lQxSYzYIpHfkvM9VUkM71Q6TKyscwOanyJwlOTSKTmsL3LIeGIRn
 USBzNPYnFwprLBvgDYE1YNs1By+9cLNv50rOI0q9aRfidVINSfsE1Ny0VtiapaHOrBJp
 jFcMTuFBuanJbsnEMarbmU5i10ZiCmq5nu0r+9wqP3FjT7rqdIa3kWZcZiE9MhlVVJwU
 Fuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2kdcy0sdbgADwb36cqE0PH+LAqeIhqaW0nO0Wg/Y6U4=;
 b=DLc+e9X/eCbZ6sQ5eDiAMF3cN3Ny906GMXHhE5ZIE7VQXmlFWVAoXdr9jLympHlQNm
 LCAbCgAlIbQdH6ycBf4tYgRfJoC67d32/7q4ll1+lwWDidZ/rhpkSz8VlYnXCFuRaFQB
 0oKNe97yFdcmXAlVHmQYRnaimPQtFBsdlRJyFg+sxgznlhts59J84CAUOWAIhhrXbB5O
 oPkXO1qhxyY8u+JPIRAzlTOLUdv19zPAryqJi9xVE0VDetpkipPzBkyrnWvoTAoiVJse
 k4S0QMOEBx2zWse6KEL9CPyE53jHgvVo13qnvFNI6JWHjon3p3Asx64XydTFa5wEFZSk
 PUKw==
X-Gm-Message-State: AOAM533UGwb2wEwI70LOz+C0nUZz+najPWxvrOb/3uiOg7dBZ0drH1GR
 g6pbEk2VL1AnTJH+Dh7eZSpOn7/bm8Y=
X-Google-Smtp-Source: ABdhPJxuyZH8+l47w/lhIkig2uznNYVqFjEPnZxApj3ZmM0YdR/Mu2zfLdWVXNlppx8DYYD7n2mNHg==
X-Received: by 2002:adf:8151:: with SMTP id 75mr13546212wrm.152.1614552226132; 
 Sun, 28 Feb 2021 14:43:46 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u137sm20033795wmu.20.2021.02.28.14.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 14:43:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: Use imgtec.com URL for Fedora 22 artifacts
Date: Sun, 28 Feb 2021 23:43:43 +0100
Message-Id: <20210228224343.310677-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having artifacts stored in personal namespace is not ideal,
as these might get closed and disappear. Use the original URL
where these artifacts could be found.

For more references:
https://fedoraproject.org/wiki/Architectures/MIPS/2015Bootstrap/mips64el

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 4 ++--
 tests/acceptance/replay_kernel.py      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index eb012867997..138bd8cb7d3 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -239,8 +239,8 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
         """
-        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
-                      'raw/9ad2df38/mips/malta/mips64el/'
+        kernel_url = ('http://mipsfedora.imgtec.com/development/22/'
+                      'mips64el/images/20150601/'
                       'vmlinux-3.19.3.mtoman.20150408')
         kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index c1cb8624683..efdd4233bc2 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -397,8 +397,8 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=endian:little
         :avocado: tags=slowness:high
         """
-        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
-                      'raw/9ad2df38/mips/malta/mips64el/'
+        kernel_url = ('http://mipsfedora.imgtec.com/development/22/'
+                      'mips64el/images/20150601/'
                       'vmlinux-3.19.3.mtoman.20150408')
         kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-- 
2.26.2


