Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD032ECAF5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 08:31:02 +0100 (CET)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxPl7-0007kf-Nu
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 02:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxPjn-0007EP-G2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 02:29:39 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxPjl-0008Fr-Uf
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 02:29:39 -0500
Received: by mail-wm1-x335.google.com with SMTP id a6so4299882wmc.2
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 23:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DVnWHSxcnT/JcuWfCy2pRme8Z2W0yCPa0ghSL2aqpGk=;
 b=HJIRsydRMmX+AGtrwnlhD0G9MovjQYJsc9bJpnUPWg9xhoMm3VJR83GvdLtW8MlTbw
 Yh7ybUyc2iS60PEXo77WwC6YBvNdy4iOdXyduq76gPpOxF49olbMrr0AUjhPoXTqd9sC
 CfN4qP9m+MWxxtb8JEm1SmWZ+AUS5jlESp7nEzzOv3Q5qmh9ZoAtE9ROSreA1v+Ei1xW
 IEWE8ssXFZG6cvG3N+yMfvTq9fjKZsfxflOFOdh38FTJuDJdWbpmp4/CMa/4M7pk+12W
 /ioD3mWSSjW0t4SVmDlWID6UPXaofN3YQmPa2OewjFhfm0CcYD0aHTBXwuqOev0xBzju
 jipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DVnWHSxcnT/JcuWfCy2pRme8Z2W0yCPa0ghSL2aqpGk=;
 b=j+x/A0XEo/gWjUCTqjyVBMth0dx94EUpURDpLpKNpALS5wamg0T3RpE6f1FYZJTdof
 uRrx+CUX1pszIQJKtV1C5A1BtpGXUPHdnw4YeiyRlV4y9MW3yqtTRFXc8ItKGgBPd5D4
 m3ulQLe/NdPa7CIKE5PIEVs2mpd1GnTCC7f4+RohjlpuEkcod20qVBOrsGq+nGBFp4uR
 YTgVTLN3rrxA/onEYP4QmnsovzTR9PWtexvio701b+Uy2/xnnKK6owdzJdW30ofHBSW1
 bAB+Szme2OfoOk6oBWvSfNxBcmx85lU7jhicBj/O7jEjRyOQ2GsjBZNDrYCjq8C6xOqb
 +opQ==
X-Gm-Message-State: AOAM530af1OITX8Lk2DQEtRcg5rrEfOIgQSKrzDbwvi9x7HF/2Jau8SV
 jMK1+rGwzN+/Cng6lCSb/IzGV4596Rk=
X-Google-Smtp-Source: ABdhPJxF4CesLj84c1u+5YYKWL1872yo+ib8tNymOT8a4VPllRmY6ezXqITEzUZsep+mIjfLROzDrA==
X-Received: by 2002:a7b:cb4f:: with SMTP id v15mr6683926wmj.123.1610004576206; 
 Wed, 06 Jan 2021 23:29:36 -0800 (PST)
Received: from localhost.localdomain
 (241.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id a13sm6419528wrt.96.2021.01.06.23.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 23:29:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/docker: Remove Debian 9 remnant lines
Date: Thu,  7 Jan 2021 08:29:33 +0100
Message-Id: <20210107072933.3828450-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Debian 9 base container has been removed in commits
e3755276d1f and c9d78b06c06. Remove the last remnants.

Fixes: e3755276d1f ("tests/docker: Remove old Debian 9 containers")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/Makefile.include | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c254ac38d0a..0779dab5b96 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -108,7 +108,6 @@ ifneq ($(HOST_ARCH),x86_64)
 DOCKER_PARTIAL_IMAGES += debian-mips-cross debian-mipsel-cross debian-mips64el-cross
 DOCKER_PARTIAL_IMAGES += debian-ppc64el-cross
 DOCKER_PARTIAL_IMAGES += debian-s390x-cross
-DOCKER_PARTIAL_IMAGES += debian-win32-cross debian-win64-cross
 DOCKER_PARTIAL_IMAGES += fedora travis
 endif
 
-- 
2.26.2


