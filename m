Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018D0E3197
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 13:57:33 +0200 (CEST)
Received: from localhost ([::1]:40394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNbkB-0005AX-I2
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 07:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iNaGe-0002QI-8j
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 06:22:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iNaGd-00049R-9l
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 06:22:56 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52356)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iNaGd-00048v-3j
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 06:22:55 -0400
Received: by mail-wm1-x341.google.com with SMTP id p21so727165wmg.2
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D36PJ31cBqi6Xsx0ubeHOSTavNbH+1+Xrogs0tJwB/8=;
 b=JxMSVBcAKDKdQgMPchzRQTdK/AOe9NYxD1ug4Ggyj/RGGPl81ucOIqhr75VAednwLe
 hZvwbxf4j+XR6mCeYARKw4fU+jY+Fb0J95Unn9maMMGJKneVlevmmMv96A8zWFWApmCa
 MLxmOBYfi1B3dS7fGR8w91nwvSIe0ze3bWAplDykkxVtV5aMKy7mh4KEI3nJWnN2iFEi
 9/Zr1bIxaa6vzUhZfLugWpm/hI1zIoqA1QZq8ppF8g7bVF28jG10rODgva/zhVBccQVa
 OsN5tlBfBzkEBAmyN+M2EyrHipCTy44g6baNAr52jPzTXK7MtxCcUlO+XikrVRsxb9F5
 MYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D36PJ31cBqi6Xsx0ubeHOSTavNbH+1+Xrogs0tJwB/8=;
 b=rb35Ogw4J8KkmH9Y2d1jh+Xw1jQFVBsCvC9nUAArK7x1sUrLKtfWwqNBKt9n9xI3kP
 tZt2/UP3O3vlrLQzv365PqqOb9+P3BYUfSkljJBUPEfq5R3IzmHcidujvE4hJEZUONe1
 1axV481jb7BrFiPlOhPEgnaSV/CjMvmPelDJygaFVlgImw6tVqgPGU3BMmeuYf/f7JTM
 g/f+sPL0TqZ1KfLmpAlnxSDR9+a7Fw1Jjpbp/tVpMn/25Xxn/tvoh13e++RcMvYpaFXx
 fRTJSn8QF+IgLMj474X98fPTWkcBWI2B5cLdz055NGo9X5cUcw0GzLPpG2EXe946kKf/
 ym6w==
X-Gm-Message-State: APjAAAUX2QxNuiXPBZ8/XcbpsCIkDg0MP7Gb5c0Uk4VF/qiQgRfyAdYi
 kWq6IHP3BtLrgsb/BGI9l0QTvZIoxxk=
X-Google-Smtp-Source: APXvYqxX7lpf+ywXJI5PGvZa1JCwcH4LyZIbCSsOQZim9//UuQZCJ94vv3saVhDIJvEcr4zuhHEcUQ==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr4004243wme.83.1571912573980; 
 Thu, 24 Oct 2019 03:22:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c16sm12233590wrw.32.2019.10.24.03.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 03:22:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ACE441FF9F;
 Thu, 24 Oct 2019 11:22:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 15/17] travis.yml: --enable-debug-tcg to check-tcg
Date: Thu, 24 Oct 2019 11:22:38 +0100
Message-Id: <20191024102240.2778-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024102240.2778-1-alex.bennee@linaro.org>
References: <20191024102240.2778-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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

This adds a whole bunch of asserts which will catch bugs you might
introduce into the TCG code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index c43597f1331..ba3a8d4cfc9 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -334,14 +334,14 @@ matrix:
 
     # Run check-tcg against linux-user
     - env:
-        - CONFIG="--disable-system"
+        - CONFIG="--disable-system --enable-debug-tcg"
         - TEST_CMD="make -j3 check-tcg V=1"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
 
     # Run check-tcg against softmmu targets
     - env:
-        - CONFIG="--target-list=xtensa-softmmu,arm-softmmu,aarch64-softmmu,alpha-softmmu"
+        - CONFIG="--enable-debug-tcg --target-list=xtensa-softmmu,arm-softmmu,aarch64-softmmu,alpha-softmmu"
         - TEST_CMD="make -j3 check-tcg V=1"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
-- 
2.20.1


