Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B622048B4C1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:58:23 +0100 (CET)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7LPa-0000gQ-3T
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:58:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7LN1-0006us-5v; Tue, 11 Jan 2022 12:55:44 -0500
Received: from [2a00:1450:4864:20::435] (port=44756
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7LMx-00060a-8q; Tue, 11 Jan 2022 12:55:42 -0500
Received: by mail-wr1-x435.google.com with SMTP id k18so34407544wrg.11;
 Tue, 11 Jan 2022 09:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WgoFps54uxGzLDCch+sbSepa/SxC8O6afKaLMDxDhm4=;
 b=YCWlY+v+ALu0/nBcvqlXdHwDEeuOwCiHssAWW6uc+yLw6u9GXUzysmxNH88+zyxYWR
 WJJZL1TsHRopYWgLiLjHqFi/4i/EnZsFeO1ZYkz1o7faOV3p5RgWu3qbvdF6KM8FM13g
 pZ/7/Z11kfWkLqhZK5Chxj85oXyNYgrpcwLP43zI63xwrCJmFNVuGsib/pcfoitjr1nf
 4OYlaQzSFohmVf93fBBSnoucXkhgdFBC7GjpA1bTpH+D6RURQqKL+C/RPnC0TLw2/tpy
 lgw5TotYjX1wUh7lRmxaEJzW6Gf8Y96Ok4qAEZY4s9WMLF6nGlWT9SSJVyTYTb8KsyoL
 khYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WgoFps54uxGzLDCch+sbSepa/SxC8O6afKaLMDxDhm4=;
 b=dRNmazhs3JPSOXT6cS1h2O3cjh/ET07OtoguITKOfrn/NePLlhI/u6L7u8w5hQYJBS
 JCeHWy3o0kw8jd0WgLwqR7L/7cPIVqEGqcINSjEM+8vefqrB8ieLRjme9F+QmXWgdd2U
 XHllY3K1gI/APYTWNNqDiB8jrGR72VHYO+E3qG+UGI251o9/YL5LWh0/Yj1l5szgKKMG
 7Yxv2hcic1Rdjq8jP2Ief48NywDlcHTbHIO+LpQXqHOZ7N/0swp3F5vtXMNizHZ07+uG
 bAjvDlcgEylsY+ZKh5na6kn/yXFb392JmEuYbDc9R/awAeUZLvL2jiBu944xY9JCa/Ed
 +TSA==
X-Gm-Message-State: AOAM531OcF2Wn45wDiVOPTT+wgSXefDiytk3AZQPvQJ7m60bFMUEsHHz
 xTzequkO5lly9y2tZsf7OR14JTD/FVcb7g==
X-Google-Smtp-Source: ABdhPJyCb4onsMSoXRvARx3brP0W0JtpUsf0xuoFxxGfvGuU8oybcmVoGP/j3zOlRYZ3aHHTlve1ew==
X-Received: by 2002:adf:f644:: with SMTP id x4mr4855515wrp.174.1641923730589; 
 Tue, 11 Jan 2022 09:55:30 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id v13sm2230444wmh.45.2022.01.11.09.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:55:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: Fix typo in check-help output
Date: Tue, 11 Jan 2022 18:55:28 +0100
Message-Id: <20220111175528.22294-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix typo in 'make check-help' output.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 4c564cf7899..3aba6224009 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -23,7 +23,7 @@ endif
 	@echo " $(MAKE) check-clean          Clean the tests and related data"
 	@echo
 	@echo "The following are useful for CI builds"
-	@echo " $(MAKE) check-build          Build most test binaris"
+	@echo " $(MAKE) check-build          Build most test binaries"
 	@echo " $(MAKE) get-vm-images        Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
 	@echo
 	@echo
-- 
2.34.1


