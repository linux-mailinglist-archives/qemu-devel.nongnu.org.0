Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FCA60639B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:54:53 +0200 (CEST)
Received: from localhost ([::1]:49898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWwc-0004X0-Lf
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:54:50 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWsV-0008Ot-CI
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU5w-0002d3-Vq
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU5u-0000nW-S5
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:16 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so2108704wme.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+7e67dYziM0ASwMkluF/JHdWOtxzR9FEiDumxeR7RY=;
 b=selVZ8faGQY0taIvBmP9uxjH4lt+QX8zmakWdVHj8wlv3euxmCnXkqRHq5OhwMMiLy
 LrJAsurDLS6CQgfcZ+x0BXAffrATj7nVA0YvRD5LkUn2p4EEja/SB5pjHoubZ0lnr2hO
 kchto0LD9u5cQRoJmDXZ7j9fTrdiCTgPYul/IxkCvT3c8dfM6vdQ8k1zV19RX124Ubgp
 k3UW8Hi1qtzmTRCJJBKiVpUXlaEdBU0LxQlmnUHoRf7HbBeYawSGY6FQZKL+fOBYPtq3
 YN0PMdM7FKveW5FS7gDda389/OZYzY6t1BBbzyQt/9kGahuhvsRWB5EI42uOVe33u6w4
 mUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s+7e67dYziM0ASwMkluF/JHdWOtxzR9FEiDumxeR7RY=;
 b=3Bfg1LHK2Q64qNQA+PKcVV3P13/Y5DhID06UchMkwLT/P8aOzw+mhVcznlOvMqyJrt
 bP3/qz3oEfi6T3KhzZ0TCVIkAktbszD5r2Z7hd69JR6Bf04fbiDoajHDewrRRu+WbFTc
 oJ/eSOKIjYf/8U+F26HKZkji6/1FJh27qTNzUw18zX1LTirPzAWhtFeHt7/Ny62nPGyl
 17EtMi9xS3jc5lvSPB1WSwnew6dpQLZ0fWm4MAPQrmhtU8qemuaw1vx1BAyegrWJErYh
 XgZ748uvonOf8EkhjspbIIq+kiyrRBLCbgXQj47QFOgH0uQx2faKTndgpRb/O6d7B1oW
 5Zzg==
X-Gm-Message-State: ACrzQf3BnOiNxTYbC9vHwDvFphkK1A7lfMckICAHLGtUjI7x2J4JmEVt
 NQqMoGH6xKiPC/+iyJneLHltPg==
X-Google-Smtp-Source: AMsMyM4pbo1IxHfDSlN6kDy1r/Wk0ltez+viINp5HX0fEK3YFev4Hs0PFoLpNUdE/aQDkrrILvHY2Q==
X-Received: by 2002:a05:600c:19cc:b0:3c6:fd74:cb2b with SMTP id
 u12-20020a05600c19cc00b003c6fd74cb2bmr9186662wmq.6.1666266732646; 
 Thu, 20 Oct 2022 04:52:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003b4868eb71bsm2817009wmq.25.2022.10.20.04.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4117D1FFBA;
 Thu, 20 Oct 2022 12:52:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v3 02/26] tests/docker: update test-mingw to run single build
Date: Thu, 20 Oct 2022 12:51:45 +0100
Message-Id: <20221020115209.1761864-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the test-build test happily run for mingw the test-mingw case
runs more of the packaging inline with what our CI does. It however
fails if we don't find both compilers and expects to be run on a
docker image with both.

Remove that distinction and make it work more like the other build
test scripts.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/test-mingw | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/docker/test-mingw b/tests/docker/test-mingw
index 0bc6d78872..18366972eb 100755
--- a/tests/docker/test-mingw
+++ b/tests/docker/test-mingw
@@ -13,14 +13,12 @@
 
 . common.rc
 
-requires_binary x86_64-w64-mingw32-gcc
-requires_binary i686-w64-mingw32-gcc
+requires_binary x86_64-w64-mingw32-gcc i686-w64-mingw32-gcc
 
 cd "$BUILD_DIR"
 
-for prefix in x86_64-w64-mingw32- i686-w64-mingw32-; do
-    TARGET_LIST=${TARGET_LIST:-$DEF_TARGET_LIST} \
-        build_qemu --cross-prefix=$prefix \
+TARGET_LIST=${TARGET_LIST:-$DEF_TARGET_LIST} \
+build_qemu \
         --enable-trace-backends=simple \
         --enable-gnutls \
         --enable-nettle \
@@ -29,8 +27,6 @@ for prefix in x86_64-w64-mingw32- i686-w64-mingw32-; do
         --enable-bzip2 \
         --enable-guest-agent \
         --enable-docs
-    install_qemu
-    make installer
-    make clean
-
-done
+install_qemu
+make installer
+make clean
-- 
2.34.1


