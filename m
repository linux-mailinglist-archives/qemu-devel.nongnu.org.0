Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7DEB558C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 20:44:07 +0200 (CEST)
Received: from localhost ([::1]:49572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAISL-00052I-MZ
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 14:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iAIPa-00035J-0J
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:41:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iAIPY-00008g-R1
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:41:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33668)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iAIPY-00008I-J0
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:41:12 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b9so4306437wrs.0
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SHjQoS6z0zylffDjZxpFaKRkLa7bX+oY5h5OCIdOnkc=;
 b=mRjSzbByjosJyLTkoC53jHs64SZxlCG1A+Wz+2kkyq03UCTfRR7ysuQH/sBskdw3zY
 6A5SVNpsL40PXNeJeLiAu4H5Y3BatED4AiEE+tApNfFE7SKl+Ocv6t+yO3A+28w6oRd2
 opOZzaIXtBZCh5ufaBRcosu5mAQFEG334Y6ZHtPNzKEWGiKuIR4y/M8f0UXsB8ErhRHz
 Qy83h6Bnwty4bsIFcEVO0ux+5A1KrbKdrl7kWhF0sqnd4cBUMoK+lbJ5TM/Gccs1Ppkd
 WEJBeMAm8LD1ix49xvQ5l2I3f65HXbZ1sw/VOCrjIs0/6v2eZzQ8afXQOOIQocGhVSIY
 pnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHjQoS6z0zylffDjZxpFaKRkLa7bX+oY5h5OCIdOnkc=;
 b=mGoM+YeP05CAX4hHOowHpcBy88TdYLC0xWMzaUae9lLPnGm4mjE1Tj//xpX9IH2fjh
 C4b8H3VLwV5F+wYVqcGmvDBkMuqnPf/x37xQqJ0q+9XThHGzSQDEV98i/IF1fp7UD9/o
 wk7JdfwCorT5TeMYd/r8eN+McE6NhmievzgpnOI8Wo9VzhHdkOAzyGMwhcEn6KHcSyGx
 5vInk05wayHz+U8zsrYAC+97n3egnXlVNgoKUbp3NYNAovTU8UKikNObRK/yjCc+HWj0
 8KKrwL8RsRxPssuQ/YVYFM9p0RdLJQnS6k3FMmVaFUm24sfYteNygAh+kANRzsOuea+N
 WnUw==
X-Gm-Message-State: APjAAAXkIe4QgbXg/up5S6uUMrG2U6xuL7SnH2GI3V10SjHMFb9ZWpQa
 dMJOs4tStLnJ47xEbgksll2DLw==
X-Google-Smtp-Source: APXvYqywJu9Zo9bTNXYGQaNMpTmSJFrGfeqPWknYS9TDybdVi8M30MH3dOB59McYR9HFQpD2h0oycA==
X-Received: by 2002:a5d:6242:: with SMTP id m2mr31706wrv.261.1568745671163;
 Tue, 17 Sep 2019 11:41:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g13sm3695287wrm.42.2019.09.17.11.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 11:41:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98EA21FF8F;
 Tue, 17 Sep 2019 19:41:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 17 Sep 2019 19:41:02 +0100
Message-Id: <20190917184109.12564-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917184109.12564-1-alex.bennee@linaro.org>
References: <20190917184109.12564-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
Subject: [Qemu-devel] [PATCH v1 2/9] tests/docker: fix DOCKER_PARTIAL_IMAGES
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Finger trouble in a previous clean-up inadvertently set
DEBIAN_PARTIAL_IMAGES instead of DOCKER_PARTIAL_IMAGES.

Fixes: 44d5a8bf5d2
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 50a400b573a..0d033bfbea8 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -7,7 +7,7 @@ DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 DOCKER_DEPRECATED_IMAGES := debian
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian debian8 debian9 debian10 debian-sid
-DEBIAN_PARTIAL_IMAGES += debian8-mxe debian-9-mxe debian-ports debian-bootstrap
+DOCKER_PARTIAL_IMAGES += debian8-mxe debian-9-mxe debian-ports debian-bootstrap
 DOCKER_IMAGES := $(filter-out $(DOCKER_DEPRECATED_IMAGES),$(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
-- 
2.20.1


