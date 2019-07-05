Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E3D60A09
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 18:15:50 +0200 (CEST)
Received: from localhost ([::1]:54682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjQsH-0005ho-2Z
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 12:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40286)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hjQhc-0002v9-J4
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 12:04:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hjQha-0001op-9K
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 12:04:48 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33405)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hjQhX-0000Ue-Eh
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 12:04:44 -0400
Received: by mail-wr1-x444.google.com with SMTP id n9so10475431wru.0
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 09:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rcuPIsMvIORKeTdOPCcArgmZ5EQEGenIxSqtwUik0XE=;
 b=jW3QtI5c8Zulhdo28F5UE+/Zatu6U5f4ri7hwx76IrIzPTUZjqR+pGLiUWBWeVNJuy
 x++NA1t0ukYLSNmQzgy+9MX7rpOleDxIzEOul2339Hu++lMumqcagWJDJ5YHmgfVGNl3
 /KrpLHG8ywA3HJvQE2R5NjpS2W+Z916vi6J5IQRVbdwjKYXVhHHJIgNJFsEYHRVdgf5L
 ceD1awHUq47TKANxJQW05wlaL1lQnNCO98CZ0g/NoSHPpeHHYcpqoHUB830ehs17H855
 hRpW0dsCgsMrwCoTlvWcFZUvJWo6xn94651YCGA4hvEktiA0F4EGLIUYaRR+jL6JeBd6
 yelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rcuPIsMvIORKeTdOPCcArgmZ5EQEGenIxSqtwUik0XE=;
 b=snthMem2eCMYeP7Y0c7Z6TLb6rgAcpmhAGNRjN6aropo5ijasvccxZvkTDxDghWDpI
 TKBbk2grlbQjsO7JsxRS3BBsrebYJjGL1v1ayIBtv75SG7trfzFd4dQRm8fwM/1aLutB
 7VK+tFmxM6SNLpGoP7vGehdEht2c6771MUYGnXRWl2i9oUSb8/QlwZqXHD9Ukn7gzh7A
 IICi6VIeQ362/r5lPzqZf0o6kwLLP6TB/+GP6Cchnl881CWfJnfsxSMdhClAzvZz6rOD
 o9R1Bm1xCLLt2mDfF0ReAcG4VPY2A2J8JEVz9OGgl6doPKtRkqL5Lj7/aUETeWNKvKpZ
 Rc3w==
X-Gm-Message-State: APjAAAXqcD6wRu/bLECdhb0KFKH7oMtZhf5KjzlbFr4+m+k9jVWOIj07
 W9M4CYJlpt6+0LAIyiZkIOmulw==
X-Google-Smtp-Source: APXvYqw/4QnXqhib/bI/fFHCde7xC+xSE83VQjWl9M9szQiovNXVoA1dnMUUv8JMQ5shBeOiy4Nx+A==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr4835967wrk.121.1562342664880; 
 Fri, 05 Jul 2019 09:04:24 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id 91sm1900253wrp.3.2019.07.05.09.04.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 09:04:22 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B65081FF90;
 Fri,  5 Jul 2019 17:04:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 17:04:19 +0100
Message-Id: <20190705160421.19015-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705160421.19015-1-alex.bennee@linaro.org>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v1 3/5] tests/tcg: fix diff-out pass to
 properly report failure
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A side effect of piping the output to head is squash the exit status
of the diff command. Fix this by only doing the pipe if the diff
failed and then ensuring the status is non-zero.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile b/tests/tcg/Makefile
index 6fa63cc8d5..7973cd1ba2 100644
--- a/tests/tcg/Makefile
+++ b/tests/tcg/Makefile
@@ -45,7 +45,11 @@ run-test = $(call quiet-command, timeout $(TIMEOUT) $2,"TEST",$3)
 endif
 
 # $1 = test name, $2 = reference
-diff-out = $(call quiet-command, diff -u $1.out $2 | head -n 10,"DIFF","$1.out with $2")
+# to work around the pipe squashing the status we only pipe the result if
+# we know it failed and then force failure at the end.
+diff-out = $(call quiet-command, diff -q $1.out $2 || \
+				 (diff -u $1.out $2 | head -n 10 && false), \
+				 "DIFF","$1.out with $2")
 
 # $1 = test name, $2 = reason
 skip-test = @printf "  SKIPPED %s on $(TARGET_NAME) because %s\n" $1 $2
-- 
2.20.1


