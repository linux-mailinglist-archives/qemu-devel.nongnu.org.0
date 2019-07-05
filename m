Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31DE60A06
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 18:14:21 +0200 (CEST)
Received: from localhost ([::1]:54638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjQqr-0004L5-4Z
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 12:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40430)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hjQhi-00034A-35
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 12:04:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hjQhg-0002Im-Rr
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 12:04:53 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44550)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hjQhg-0000Qk-Ii
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 12:04:52 -0400
Received: by mail-wr1-x442.google.com with SMTP id b2so9214066wrx.11
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 09:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pnvxSKN5dF6BFileI9vCwcNPxM0MUq6YBqg0MnEs6Us=;
 b=wxvvzLI3pUyLFfRu4W8fnfvua8x4klS/NKHe8jRWR31kuqfg2IJeaGiC8S54hKVZZB
 hadE+mlk9PaZIrRtjrtIYqf8c8xHylMDOSmrf28HMNKhKrbVVG5b8tpQ/S0mXGJwq36m
 NyyiyenTL6o0BL8poTqxi0dWeOXnoY03k0Sw5KDlpwGBCb4AKPLaKlaSggbk+jo9HDmo
 6WNH26IPsT8gP9I1V7QWHZ4ihuFP3xwHwsFx0nu1klugcYiSuocHdzbj4OLB6AI3EbxS
 8QV+BBXs6hsQXo6mxlUncumhCu2dsSX2MywhUB3FSMkW9B9uZYjvOfWaaTKkFt4eo8BI
 lQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pnvxSKN5dF6BFileI9vCwcNPxM0MUq6YBqg0MnEs6Us=;
 b=AriaxK6u4dBRMEbi7WEvrrJxutZgB6qJNwP2exo+t1XuzhQBPfk67crVp9sOKtZ27S
 2XJFoFF8RfFaSy2Y9YbGlNlq3xM+kQ4QTy6m9R5AbCI2G22m31booqYUJoE4m9fIur61
 OvDQqiIKvOvX2QCRFdDokHmaW5a1lPOphe43A7NlydkL0YHE04F3UuMtDpdTlcOetaoK
 TEK7SwNUG7UcYCC8PYzAYr4U9pCNjfebT+HLvIkZ8idy0DY/MgmMoELvlSvjDEMq6kvG
 00QGgjFpDVpEBnOUjcidK0ouSrYx1AxF+zKwCYrmvGzFbsTa3aFzhvZMAZDxwiEUv0uI
 J5JA==
X-Gm-Message-State: APjAAAUxBH7yxGTzfi1FW0woAmmwMLPeEfaO1QmRad0zqDx1lq8GfxLX
 zJlq+SVemzLLQI4z+SZXGGm3PQ==
X-Google-Smtp-Source: APXvYqyFv8HmS1JRFskvuOTk1R5Kaq6SR+WCg7p2oMhWUWWCf7Oexv80lnbKwptXaT3GFHp5gi4Rgg==
X-Received: by 2002:a5d:6089:: with SMTP id w9mr4796366wrt.166.1562342663656; 
 Fri, 05 Jul 2019 09:04:23 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id j189sm8758466wmb.48.2019.07.05.09.04.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 09:04:22 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A10841FF8F;
 Fri,  5 Jul 2019 17:04:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 17:04:18 +0100
Message-Id: <20190705160421.19015-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705160421.19015-1-alex.bennee@linaro.org>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v1 2/5] tests/tcg: fix up test-i386-fprem.ref
 generation
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Jan Bobek <jan.bobek@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We never shipped the reference data in the source tree because it was
quite big (64M). As a result the only option is to generate it
locally. Although we have a rule to generate the reference file we
missed the dependency and location changes, probably because it is
only run for SLOW test runs.

The test still fails with mostly incorrect flags and different than
expected NaNs. I'll leave that for the x86 experts to look at.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Jan Bobek <jan.bobek@gmail.com>
---
 tests/tcg/i386/Makefile.target | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index b4033ba3d1..d0eb7023e5 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -35,9 +35,9 @@ test-i386-fprem.ref: test-i386-fprem
 	$(call quiet-command, ./$< > $@,"GENREF","generating $@")
 
 run-test-i386-fprem: TIMEOUT=60
-run-test-i386-fprem: test-i386-fprem
+run-test-i386-fprem: test-i386-fprem test-i386-fprem.ref
 	$(call run-test,test-i386-fprem, $(QEMU) $<,"$< on $(TARGET_NAME)")
-	$(call diff-out,test-i386-fprem, $(I386_SRC)/$<.ref)
+	$(call diff-out,test-i386-fprem, test-i386-fprem.ref)
 else
 run-test-i386-fprem: test-i386-fprem
 	$(call skip-test, $<, "SLOW")
-- 
2.20.1


