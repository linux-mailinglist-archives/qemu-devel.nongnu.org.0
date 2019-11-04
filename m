Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A35EE63A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 18:39:33 +0100 (CET)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRgKC-0007x2-32
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 12:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34499)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iRgHj-0006AW-MU
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 12:37:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iRgHi-0000zT-NO
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 12:36:59 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52595)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iRgHi-0000z4-HV
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 12:36:58 -0500
Received: by mail-wm1-x329.google.com with SMTP id c17so10280451wmk.2
 for <qemu-devel@nongnu.org>; Mon, 04 Nov 2019 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XcS/d+z9U2mFL1U0Ml1IHJyqP5nrDCHJ2/oKDxLE0wY=;
 b=pga89U5NPAe5A22AAkeGSQIWYDYyghmfzvZht4LJ3bJ7KzVzoVUvmnFiwPv+cg3weL
 UPnESsXXDcY3IhJrrryCIu8qK03bV+n86HRogMoj2yM8s2P1zbYdIfaEIxiPXXT/LpYl
 2ZCR9wMTuqI3KUJSW/Gu6MjEtxXXH44fGn/CwbbrCziMXtdx2WQzVNKe4XVWz6OMElRO
 A96IwOUqdPJ28FCsWYQLe6jYQ2dWvCNbuWrbljGCEtSqGYRIU1iSFF9n7nS0oHh+mFtj
 10Cvu6c8/CIeQhFDzWb1cT1ceFfyK7zxUdwBFdax0R3xLyny02bEulY9ZYCI7twgyUHU
 T6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XcS/d+z9U2mFL1U0Ml1IHJyqP5nrDCHJ2/oKDxLE0wY=;
 b=P6nP3foYHUy/gihTlWuOHhkNLkEbhYeS9v9azjPGlQEAIzw80Xax3e5NwtZIbgB4Ab
 7m/W7DYhysa7dco2p0icKMF8I62Ve4CFmBrasUYdBln1gCeTRysP7UpDI6uOWSDHygBo
 OQwQQHIYo6f+8Qy1g5i9Kk3Xc7Ze5oZTQu75tYgRQPWbCfT0XmclyYXTkjOatfR9IOt/
 C3ddHXsPVfGd6ktdJkKV0e0bk+9BI8P7ceswpi+UCP44sfhsNv3Pu2IO8Vd9eIMy5LEi
 6knWjGtyLHM8RswRzgFl1GbvLxGEr4J+ImPGZOCDUyyL0PaQtiGODOfpPaUPPmMkwckI
 P0HQ==
X-Gm-Message-State: APjAAAVrfDvAw/sXaD19QerdE5Z7RSziDmLszTWIUyq0VdL4LARRoxyH
 HMRirQPgpHTjFpKJCDGWB3nrAskirRQ=
X-Google-Smtp-Source: APXvYqyv1U5NjmZUgAs1Ym/rvcLDS5HxP/o8SxaHQdYCr7w1RwTir+/5r6TWKKiYE2Jqf6+bYpbt0g==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr219802wmc.134.1572889017366; 
 Mon, 04 Nov 2019 09:36:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a15sm18356066wrw.10.2019.11.04.09.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 09:36:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF0C61FF8F;
 Mon,  4 Nov 2019 17:36:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/6] tests/vm: add console_consume helper
Date: Mon,  4 Nov 2019 17:36:50 +0000
Message-Id: <20191104173654.30125-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191104173654.30125-1-alex.bennee@linaro.org>
References: <20191104173654.30125-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::329
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 Gerd Hoffmann <kraxel@redhat.com>, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Helper function to read all console output.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20191031085306.28888-3-kraxel@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/basevm.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 2929de23aa7..086bfb2c66d 100755
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -242,6 +242,25 @@ class BaseVM(object):
             return False
         return True
 
+    def console_consume(self):
+        vm = self._guest
+        output = ""
+        vm.console_socket.setblocking(0)
+        while True:
+            try:
+                chars = vm.console_socket.recv(1)
+            except:
+                break
+            output += chars.decode("latin1")
+            if "\r" in output or "\n" in output:
+                lines = re.split("[\r\n]", output)
+                output = lines.pop()
+                if self.debug:
+                    self.console_log("\n".join(lines))
+        if self.debug:
+            self.console_log(output)
+        vm.console_socket.setblocking(1)
+
     def console_send(self, command):
         vm = self._guest
         if self.debug:
-- 
2.20.1


