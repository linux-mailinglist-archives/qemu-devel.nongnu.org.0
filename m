Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9710B4C1E1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 21:57:35 +0200 (CEST)
Received: from localhost ([::1]:41508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdgi6-0003GM-QX
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 15:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53944)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hdgRc-0006AA-Kh
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 15:40:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hdgRa-000098-Rl
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 15:40:32 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:32868)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hdgRZ-00006K-K2
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 15:40:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id n9so528650wru.0
 for <qemu-devel@nongnu.org>; Wed, 19 Jun 2019 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+wqq4GBFQwrMJ04FlDJ+2L8IS0oLTrKe+hT5DciI8mk=;
 b=JBAffJZGJkFH+KR0qxTHczfggE5KA8gE60L7XjGcbcFnlOJp8KCCErxUxkN0CnsdJu
 9G+kZHo485AOxm+xFbqAaDS8gwfkSOaMjzCEd80+c/DjSFKp9GF6Lyxezue2EXiOb7IA
 072gwJrYsVoFrvNej8gq/r9sfzXak+Mpof/tS0/cxPc4Nx0aWAN/8q1X4HsGZJF7jI2D
 kAgeAm30jJssYrgU0kVJktIZ6UhXcAQUkSsd8PuJGvOHrjeIdLO98b6WVmDHC1svdhDJ
 ZZO7jr41HkfdxeO46Qpkfgaec46fk5l9AIRreAzbbLQhTb0vj8IjLxYrfNPVUaukwWgK
 EPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+wqq4GBFQwrMJ04FlDJ+2L8IS0oLTrKe+hT5DciI8mk=;
 b=k6zbQJZMy3Yt8RON6TRr0JpT1qs6Enau8wiNksm1A/oic20whvaljzapUqaIHXReqF
 66Bs8Rk5oE2fDLCInKSyYJVigP6ZDQepmpBkr/lcRsDCmbwc0JZHLF77cMXcsglGFPyk
 zC/lYnw2rJKrKG6yT2Nt4XClzWQCWqMXhd2NKBw4lDD4lMMQdNToND/WWO9sQQX/B3Nv
 kMVMIL62kV7tFh1HqsLiu3qdUQvBeDc1Eh3qJ9mroA25oQenIwdOCSFJx/td5+tFnO4f
 kJddeVJsu+7WsemE9KqVHAsk6i+C/1Z1RWDLpkGieyvdmJcW5DDK28C/93/3zDj2r7Bj
 es/w==
X-Gm-Message-State: APjAAAUiCklwo4WhBHWqjh1qubvzrhMSBbfbrbVhoZAm6n3nH2T31UK5
 /0OrR8YFnyPyNUig/xQoRd3cIA==
X-Google-Smtp-Source: APXvYqxbdgnf51WIen5ArtHQyCo3PGoecalB+HW0svrxBvH/r+WjQ4BPoS71gIe7SLNUQ0DrTmRbWw==
X-Received: by 2002:adf:ce8f:: with SMTP id r15mr76694975wrn.122.1560973227907; 
 Wed, 19 Jun 2019 12:40:27 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id h21sm1393459wmb.47.2019.06.19.12.40.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 12:40:26 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E50D1FF96;
 Wed, 19 Jun 2019 20:40:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 20:40:11 +0100
Message-Id: <20190619194021.8240-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619194021.8240-1-alex.bennee@linaro.org>
References: <20190619194021.8240-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42a
Subject: [Qemu-devel] [PATCH v1 07/17] tests/vm: run test builds on snapshot
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

The build script doesn't shutdown the guest VMs properly,
which results in filesystem corruption and guest boot
failures sooner or later.

Use the --snapshot to run builds on a snapshot,
That way killing the VM doesn't corrupt the base image.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Acked-by: Ed Maste <emaste@freebsd.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190617043858.8290-4-kraxel@redhat.com>
[AJB: added tags]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index c59411bee0..276b870216 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -57,6 +57,7 @@ vm-build-%: $(IMAGES_DIR)/%.img
 		$(if $(V),--verbose) \
 		--image "$<" \
 		$(if $(BUILD_TARGET),--build-target $(BUILD_TARGET)) \
+		--snapshot \
 		--build-qemu $(SRC_PATH) -- \
 		$(if $(TARGET_LIST),--target-list=$(TARGET_LIST)) \
 		$(if $(EXTRA_CONFIGURE_OPTS),$(EXTRA_CONFIGURE_OPTS)), \
-- 
2.20.1


