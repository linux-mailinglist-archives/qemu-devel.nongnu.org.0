Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FF148F85
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 21:43:38 +0100 (CET)
Received: from localhost ([::1]:47702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv5nl-0004YU-LG
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 15:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iv5ks-0007xk-0G
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 15:40:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iv5kr-0005uR-5k
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 15:40:37 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36231)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iv5kq-0005sZ-WF
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 15:40:37 -0500
Received: by mail-wr1-x441.google.com with SMTP id z3so3602185wru.3
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 12:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CT3wh8Y3xSMP1+ExU06YY5pwEwL732fslH3YW3xC8eU=;
 b=d+X+u9dePCR6F45eM31qv4MaOF3hceSStw9vfa8ahr36zBJlPeudtaSFhC5scAEDjE
 JG2t+4BR5pgtuiXfFCWqDzUiODDaHxO3kAJNpEw8otTXNr2x4pPyLBqNlox6sl3/5WGT
 bXPAtBURAwkfxd9QLmXE+1UdQsGj3cVMsymIF4rOh2qVawUV9RGOVpbXULLCtkVa5ST6
 VSiVx5TDRcXoea+GZFdyVkOODVCPIR2sGVZ8KPJlKeXVOTwlcx3Kops3Fpp6pfbY2Ydk
 0keiDvtM8dW+WEREP0/eei9Nxyg/DAu3cBmRpRh63WF4EmQnBbKcQd3dyfwp31x9tKBD
 yQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CT3wh8Y3xSMP1+ExU06YY5pwEwL732fslH3YW3xC8eU=;
 b=ndyqLW4mVtgds7mk6HhMMBhooIS5fXWEhtqrhFmOJ+xIriSwH+F8iS35xbQjwXqswy
 rRPZl9/+80BPCfTnkKLlFK6AbpW77f0/KQ8ep4bMTQLZPIhFgsVt68VrmvILmcqSflrM
 ijfHHY3agEakUbS6uoX/yoJM1ucmE3DZgBNjq/ibMuRVIb+5fFtUtdE33bx1/kkrkRqL
 R0w9HaOfhQvp+axvgZcH9s/+FiUa4qpt9y1bB8IBAq8qlqX+iRpMAxvMItm+xzEg4Hz3
 XO5XWi0NQ/lKpT0H/FTphivFXp0/7uS9uAVxNa+QACUmOQ1c3oGIKmS3TAeSOtXlOyeL
 tUBA==
X-Gm-Message-State: APjAAAV090MXy/tRgHzviyGLJ6YhpggT3FLIgpI7EL+jbQk4v+KkR24n
 vF1wriDyQj1S55IW2H8k10iNtA==
X-Google-Smtp-Source: APXvYqxE0uPNv5Eo5PedGvod5OvWQrbDiOmzpF89Q88j6klNAWPEfkwlArehaN5jsqGCFRtbCeUQNQ==
X-Received: by 2002:adf:d183:: with SMTP id v3mr6628091wrc.180.1579898436103; 
 Fri, 24 Jan 2020 12:40:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w8sm8877443wmm.0.2020.01.24.12.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 12:40:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3A111FF92;
 Fri, 24 Jan 2020 20:40:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 05/13] .shippable: --disable-docs for cross-compile tests
Date: Fri, 24 Jan 2020 20:40:18 +0000
Message-Id: <20200124204026.2107-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124204026.2107-1-alex.bennee@linaro.org>
References: <20200124204026.2107-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sphinx support is fairly new and we don't seem to have all the
bugs worked out for cross development environments right now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .shippable.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.shippable.yml b/.shippable.yml
index 83aae08bb4..2cce7b5689 100644
--- a/.shippable.yml
+++ b/.shippable.yml
@@ -37,5 +37,5 @@ build:
     - unset CC
     - mkdir build
     - cd build
-    - ../configure ${QEMU_CONFIGURE_OPTS} --target-list=${TARGET_LIST}
+    - ../configure --disable-docs ${QEMU_CONFIGURE_OPTS} --target-list=${TARGET_LIST}
     - make -j$(($(getconf _NPROCESSORS_ONLN) + 1))
-- 
2.20.1


