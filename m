Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE68939BCFA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:22:14 +0200 (CEST)
Received: from localhost ([::1]:45652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCaH-0004pe-Ey
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8m-0003Vk-CZ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:44 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8i-0000EG-8p
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:44 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso8196543wmi.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dsyKHQJNOhAXErDDhKEWsE1reIuTyEMwEV0R3vqvPqo=;
 b=ylkJNz4GI+pdjTJ8e7ZpdDZFzkDAO/0NVJO2mS/6czgbyE6dMwlXVTNjBmjnDCJ8ib
 LmDB1Aqtb57TQEIhiutaZ/3S7KYR6grnTepTaLHA8faoCcmB3x0EgXex7SXoAyniTgW5
 S4GemIN4svMgYyh/o63H7UXSy16BEZnxnYCFk8NxSfN3m3QN67FGLvzLT4/ZKeONndCF
 tc/wpq9AeQmfO0fYSptBj65S10PhJfIS4qRXu0ZQ1GII+8HbxzKc0+8ccDRLmfoYVLDA
 hmhDtF3YAh0mEd0xaBLnD/ZLghicvwnI35Krb42+buE9jYLn/lx3o2OVrm+IGdlwUIA7
 SjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dsyKHQJNOhAXErDDhKEWsE1reIuTyEMwEV0R3vqvPqo=;
 b=gnwC4d/K8AOc3+qsgPWRQJdWzK4HDy2BPUgHBSCXxZXfOLReHR2EVu5UtcpycrhBbU
 HUQ/z1McU5b9GM58mh5MFA2YcAn36X0DBJXbgJGFqRJPfgnPsYCYORLq53bmOmCiFkg+
 yUu72DT8lUywJGS/v+jjq34D2dZECo9fVW25G8py7ezz3b0SIZOP5hjKpimiB3yPrbuJ
 T/dgh5ccgMxbnJmKe6S0GiQajE87H5l4vvVksJSq2Xtngdpj23l/innWSuSikrsHGP7y
 8lk22NBKqzRSAGUGumIdgMIlWpDuTUMRAjavMAgm2Ac0TR4pIdBqv0qAvjey7fa6zIE6
 lMIA==
X-Gm-Message-State: AOAM530H2HS1ayJuvGlBalK11vEZJyF241F7mHgwnVeu+Dg01PtYPBWW
 F6my2t3zT0YydQRH/WtUT8+UjA==
X-Google-Smtp-Source: ABdhPJz8C3AWDs1VwBlGFojha1Z5+/DCrGZ9Kapu/NrazzA8jjF5qNukKeJCJdI7Sqo2HS08z0V7nQ==
X-Received: by 2002:a1c:8016:: with SMTP id b22mr4252034wmd.43.1622822018959; 
 Fri, 04 Jun 2021 08:53:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c23sm9110099wme.37.2021.06.04.08.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 96AC31FF92;
 Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 96/99] tests/qtest: split the cdrom-test into arm/aarch64
Date: Fri,  4 Jun 2021 16:53:09 +0100
Message-Id: <20210604155312.15902-97-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The assumption that the qemu-system-aarch64 image can run all 32 bit
machines is about to be broken and besides it's not likely this is
improving out coverage by much. Test the "virt" machine for both arm
and aarch64 as it can be used by either architecture.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/cdrom-test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 5af944a5fb..1e74354624 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -220,13 +220,16 @@ int main(int argc, char **argv)
             "magnum", "malta", "pica61", NULL
         };
         add_cdrom_param_tests(mips64machines);
-    } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
+    } else if (g_str_equal(arch, "arm")) {
         const char *armmachines[] = {
             "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
             "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
             "vexpress-a9", "virt", NULL
         };
         add_cdrom_param_tests(armmachines);
+    } else if (g_str_equal(arch, "aarch64")) {
+        const char *aarch64machines[] = { "virt", NULL };
+        add_cdrom_param_tests(aarch64machines);
     } else {
         const char *nonemachine[] = { "none", NULL };
         add_cdrom_param_tests(nonemachine);
-- 
2.20.1


