Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28035E43C7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 08:53:20 +0200 (CEST)
Received: from localhost ([::1]:56068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNtTK-0000VI-TR
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 02:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtDz-0003F3-3C
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:37:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtDx-0008Pd-2y
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:37:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35892)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iNtDw-0008P7-TN
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:37:25 -0400
Received: by mail-wm1-x333.google.com with SMTP id c22so765604wmd.1
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 23:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMazBJxRnY0zm7YsZlBAdLDLJgZeGc4MSXDFTtk/xpM=;
 b=GNIlXtzBhwrtoqWrbFpsN/cIUOXNuxaoT6Wlx7XeTbIUkU50xnhQA3rifiW8ZFXjyE
 twgwfgFZov1y/s+Eku1PCbTSCp3n8rLw4e0qlTb3O3fCBm1MQDt/GMJ5BuL8PhrwGk4I
 ZqTMDlq7OlI3kTzqhD1qW72CI6XWs+POtXvI9AXyXWZ5Ib/SbFJD/3LmvwddwmEV5Mkm
 EgTihJuqaOWnc29OMnPJ0c6OG/HT/OefIE4Ni2HRO3XE/1xOWJSfErPix5cvR9Hro8u8
 0HfOWQB30CbBQlhNV+pDiq4RhHR/DvUcVDa2V84MMK4E2M6PEqvETZAVVNAuq4zU3r/2
 TA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMazBJxRnY0zm7YsZlBAdLDLJgZeGc4MSXDFTtk/xpM=;
 b=fulMmq1Yq6JTIBKi71crMD3d6GBTq5zuiviN8PW1K3nRPFJ2bZiy5DGAiBfNONnTtR
 DIb2fqTR9eYjq1DctEDpsHmPZXdAbw+PkL8uThuRwDbVWBYOaoGd2Ea8slTL88YsIu8Y
 MlcGyIp6tlWmIN+x8ZIpWFVB64hAob8uG+W6Pd8diWQgMjndWn+e6H2zrWZZGpPvzs20
 Xayb9XgEkiht+xF1GgcinNXVQD1u4oiv26qBxQ0UH83wuMdIRKb2Ef2qACJkSOAHcVeO
 hhgACba2I9X8nnFvXGbUbLF0gTycqPv+4tiKd4qubJ2e8QmCtHc8FtilqOlIxfF5RL/e
 0TdA==
X-Gm-Message-State: APjAAAWh/0mLYaJDoKh9Kxex9+3FZYA4UIvUHw83NvDbX24AnQIY17HW
 Zvq4Va6MvMZJyOTtAZJiS1mCtAYeIh4=
X-Google-Smtp-Source: APXvYqw3/6yAbw2OxHoXuZsW3q5m7Wkykg47daj5GFg6mSbPl/z8XI3OLsNwGcudp36Ix+OwiWv+rg==
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr1876851wmh.76.1571985443807; 
 Thu, 24 Oct 2019 23:37:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h3sm1107207wrt.88.2019.10.24.23.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 23:37:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C62241FF9C;
 Fri, 25 Oct 2019 07:37:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 12/73] travis.yml: cache the clang sanitizer build
Date: Fri, 25 Oct 2019 07:36:12 +0100
Message-Id: <20191025063713.23374-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025063713.23374-1-alex.bennee@linaro.org>
References: <20191025063713.23374-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::333
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hopefully we'll see the same benefits as the other builds.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

diff --git a/.travis.yml b/.travis.yml
index da6a2063fca..c43597f1331 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -189,6 +189,7 @@ matrix:
 
     - env:
         - CONFIG="--target-list=${MAIN_SOFTMMU_TARGETS} "
+        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-sanitize"
       compiler: clang
       before_script:
         - ./configure ${CONFIG} --extra-cflags="-fsanitize=undefined -Werror" || { cat config.log && exit 1; }
-- 
2.20.1


