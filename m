Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071663C2647
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:50:24 +0200 (CEST)
Received: from localhost ([::1]:38736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rpe-0000VL-W9
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdV-0004yr-DN
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:49 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdP-0000GQ-CE
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:49 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso6441598wmj.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=77kFc+Y+5Qbz2V5mv8qtdgKvR0JhiM/gX4TZj6U9Mb0=;
 b=QFaPXiKW7BbgiZTB2aq6DW7FLPG1lGSp1H1KG1n5a/zNWzXG/a5lWWVcVjtNtSeptS
 P2BnF5ilB962LKiO9dBpAbVOCPJQm1TEYQ1YZfyqsE1mrnwHk1qlJ63SFvBuLu5IOq17
 ZnIfrp9wIs1AHcJYUoKUMsaHHAtFtxQcPht12KWjv/6rpaqQlUDO+MT6dQnIfLxxfji1
 Y07u+Wx5xgfGqjapOPJ4qCiV/t36Xtr37JR63kqMC7NHNwQOrDuJmyFCfCuoGP/G2Zo7
 95wTA/+NP5wHtzorbcSaLNIgkzkWBfIQuTPDHuRpGYMFHn3sEM4Qtg5xWvlGZZS97xcf
 I9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=77kFc+Y+5Qbz2V5mv8qtdgKvR0JhiM/gX4TZj6U9Mb0=;
 b=DpPsyzLj7I0v6tJ2X/kUwaOfjMWGcgEXNl6jKqGsC76OSvJNxFQgv92lq5eMX9vkft
 JyVnZe3wfZc9ddablnb2aC42lss90eyUyZpnzYf767nUlzRibR15y5pH9Z9Z6HSsaY30
 1grlDV7+PwY7zT59MLlGHYXfWMv83ZNo2wVAeHRTIeqdBTkPjok5kwg9T7+0Jr6SUTm3
 hF4iD8120hpYtC8031nivn1A4PDlIYDRtFGplb3We8vSdLlaGJ49cN7YsS2nz4ln1+6I
 +nUdcYaTwduXI8JURJdMGl/yfzs8c8HaKe3dGs1NZX1TDbEOzjLuj2QRu9EGVjdvMej2
 TKjg==
X-Gm-Message-State: AOAM532pcROIzdmMCZQTX9wk6ec/yy5unS9stIQAQ4Dqay2a/fa02ZE3
 z9m/86AP2NhGNP5YyJgxC9HAEw==
X-Google-Smtp-Source: ABdhPJx2nedH0TyMSwcKZvijUkHnDEdYHLCDfZTLj8/ao6g3yyndWNU4e1QOppqD3vTZFO2e7LjrZw==
X-Received: by 2002:a05:600c:4f4e:: with SMTP id
 m14mr12450822wmq.151.1625841461654; 
 Fri, 09 Jul 2021 07:37:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c2sm1427408wrn.28.2021.07.09.07.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1D601FFB4;
 Fri,  9 Jul 2021 15:30:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/40] configure: stop user enabling plugins on Windows for
 now
Date: Fri,  9 Jul 2021 15:29:56 +0100
Message-Id: <20210709143005.1554-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 f4bug@amsat.org, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some patches on the list that enable plugins on Windows but
they still need some changes to be ready:

  https://patchew.org/QEMU/20201013002806.1447-1-luoyonggang@gmail.com/

In the meantime lets stop the user from being able to configure the
support so they don't get confused by the weird linker error messages
later.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yonggang Luo <luoyonggang@gmail.com>

---
v2
  - move targetos check to if we try to --enable-plugins, default no otherwise
v3
  - fix missing test, s/targetos/mingw32/
---
 configure | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 25daabd0ff..1eb8ef5341 100755
--- a/configure
+++ b/configure
@@ -708,6 +708,7 @@ MINGW32*)
     audio_drv_list=""
   fi
   supported_os="yes"
+  plugins="no"
   pie="no"
 ;;
 GNU/kFreeBSD)
@@ -1511,7 +1512,11 @@ for opt do
   ;;
   --disable-xkbcommon) xkbcommon="disabled"
   ;;
-  --enable-plugins) plugins="yes"
+  --enable-plugins) if test "$mingw32" = "yes"; then
+                        error_exit "TCG plugins not currently supported on Windows platforms"
+                    else
+                        plugins="yes"
+                    fi
   ;;
   --disable-plugins) plugins="no"
   ;;
-- 
2.20.1


