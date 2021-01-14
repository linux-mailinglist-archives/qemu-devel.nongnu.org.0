Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07832F67B6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:33:09 +0100 (CET)
Received: from localhost ([::1]:46088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06Ue-0005Mg-RI
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wR-0003hM-MA
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:47 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wE-0004vY-Px
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:47 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m4so6494992wrx.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vQWOMznPD2cExFj9wpPJQCFomVI7plPwBnMAbJZFKA0=;
 b=St9ydIXavHWZqQgF/nWgSkmh5OaQZP0mIEy8GyCKj3nmi0EZeiLyW6JyWLrugEGY0O
 SDjUdlQWKYXNGO2q3/OZR6QDyz/aw4pKRA01jLx1XW/J6HH16+fN8UZEIslnGaRcVddx
 LieyTX0oK5GfMXxCHK+xh8BDUvUPQ3CsJcSUdBeXS6CL0uhKELHLKIAfTws76DGBihK8
 mSSuTMAleiTPVMpvC8FBLMg/O3KG5IE8J12VCUHEh37PWhX9wuIr1VpFncht2A2VWR9w
 34vILlSS49iktUeEjjL96Z8yephqR34VqbqYluKns/Q7zDio5okBHxtwrilfsGyaLDRD
 YpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vQWOMznPD2cExFj9wpPJQCFomVI7plPwBnMAbJZFKA0=;
 b=Mx4Ixef4Iif0/p/pDaWmW0DhXRkWzaLYQS+Npuxbz0VHdwH38d+DtfOOj8rcfuvnv9
 RhV9/TsEkPOEbOhwXEuAWOWc/GKdWNmX03bQlj01PXwE4TZWtAFG+bsBeP3i0yYBJDhV
 snosPRamQyFwbEdBiRFjo5bAx/FdBPUUaWzSwWB5LnRyMUOh52oUE3Qs61fyqZK+213x
 mTejfcBONHnwOTbHmzHLWKygyX9DnijK1VLzsqQqD+TVJlii8QunVzjGZN/phyy1Lh4I
 mp8ONW1HVYV08nm8FbGkuvvS6r+KWlidDZE0Cgsjiv9vM2+9Vvz1CYhlPDg97OaI7kH9
 gasA==
X-Gm-Message-State: AOAM530Em9kI9/OdKNl3FCYk/jfHWtPskVQRTpSwZ71wX6bfC6pzAwZP
 oUZDdPGXM1EHbbPuaHcDbcEIUA==
X-Google-Smtp-Source: ABdhPJxWN9F8GpTwMHpdByfdOwn5u92zWOJV37yTzni0U3DSyHowdywoBFULwg824zkKqkw0OskpTQ==
X-Received: by 2002:a5d:40d2:: with SMTP id b18mr8705900wrq.369.1610643453338; 
 Thu, 14 Jan 2021 08:57:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n16sm10767955wrj.26.2021.01.14.08.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 30AE81FF87;
 Thu, 14 Jan 2021 16:57:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 01/12] tests/docker: Remove Debian 9 remnant lines
Date: Thu, 14 Jan 2021 16:57:19 +0000
Message-Id: <20210114165730.31607-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Debian 9 base container has been removed in commits
e3755276d1f and c9d78b06c06. Remove the last remnants.

Fixes: e3755276d1f ("tests/docker: Remove old Debian 9 containers")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210107072933.3828450-1-f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/docker/Makefile.include | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c254ac38d0..0779dab5b9 100644
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
2.20.1


