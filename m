Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6255E2EFB59
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:49:20 +0100 (CET)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0ZL-0002Hp-Eq
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TH-0005Wp-3s
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:03 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TF-0003BO-ED
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:02 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g185so9678838wmf.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vQWOMznPD2cExFj9wpPJQCFomVI7plPwBnMAbJZFKA0=;
 b=q2tLCTiqM0TgBOJtOBz3TIXEnU0VeVgNMI8/PiJ9yMq18DT9Z5jMAGRxmpo1ktM9aB
 mzlpBbTeTeHjQyvqDa6EHsRZin9qKF/6UAlHrzfaG3fcLRVmhbBt5MvfVzwHkWAgBo8p
 XHbuRNRqQ0RcoOsKhk58Bv1dB5EQA682Ugv0FL+xX2KmkGrNNf7KMtqNrjZf+t6JGLUZ
 tJyqTVJjxeD0MzyC8WstRsTgKXfIALkE19/GMPdNW2P8/7eZXde0RoT5cQT3laBJcBL6
 N8HOY/p5a3q+I647oETwq/0QDXeiWahv0YaVDHADxvHZNJh8MiSavUnW0yoL3Eigbef7
 HmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vQWOMznPD2cExFj9wpPJQCFomVI7plPwBnMAbJZFKA0=;
 b=hLCTWDKkHQWKJYVdeM/8dtnGZWgMXt0JWDhXZ5sIm9+pRMP4OJjS4wb3G8H63kpm/R
 vzB1RJw3X6ARPa+QSiZUZ7jx4IJbboSIGE1m8Hn6lxpfcYVkXTjPp0jLpi3mnCqfJ4lf
 swAnn9sPvuMtvlZbs8Jf4ZAMEJkPABI1aJ0nEwB8P8u1TwUuZbDvUZRWenv1J7g/eqof
 JxVPAzlKinuDBezVUEDTQNe3ssucoGfPZA8Ts7AEw0umkW9sS+P++bxVd+HyPWfzbbHY
 vmmR5G7SinqH0+ukoAVpePbQVa3eB7beu6OZ1Kk8v0V4+soedFxunZeNUnmlbNFST+/z
 vAZQ==
X-Gm-Message-State: AOAM533uMRygtIfoVsH9jr/FkgMFzJW42zy8W0OPlgiWy8DXU6dDdpyi
 mZj2w1CnNntl4jRF4j5hwRnsFw==
X-Google-Smtp-Source: ABdhPJwNrFEyizc5F3AWG2b3RUlSpkexH6VDqYHIaTIDzJF3BSD4s15NVIe+GvX7p4lv143cZSOAsQ==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr4974040wmm.122.1610145779672; 
 Fri, 08 Jan 2021 14:42:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t10sm14397846wrp.39.2021.01.08.14.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:42:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 03D2D1FF87;
 Fri,  8 Jan 2021 22:42:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/20] tests/docker: Remove Debian 9 remnant lines
Date: Fri,  8 Jan 2021 22:42:37 +0000
Message-Id: <20210108224256.2321-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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


