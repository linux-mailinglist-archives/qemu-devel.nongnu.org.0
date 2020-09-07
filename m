Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE61260458
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 20:15:00 +0200 (CEST)
Received: from localhost ([::1]:46892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLfP-0007lj-NG
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 14:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFLYZ-0008Vd-Kg; Mon, 07 Sep 2020 14:07:55 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kFLYY-0002qx-57; Mon, 07 Sep 2020 14:07:55 -0400
Received: by mail-pl1-x643.google.com with SMTP id y6so4738966plk.10;
 Mon, 07 Sep 2020 11:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YVurF/hUMxchCmYZOrtbwzZS9w+k/OG5fGLGmCNakdA=;
 b=QzvDzzT6xoGXawHESqtyyOYKnD2GVM6DU78X+DxQxrRg0nq7D/sDdIw6yUZHz4uxiv
 JKZkkNUv70nRYGR1iu0p2nln0SXSLgVHbgeuot/fgTrU65uVqr7m063uzPMnrdBzSn2d
 5wVFJHBHT+WiaAjiRp7sQCJPld0dLCIqwS+k32fsL7hNOECDcuOlEOHspgk7E2qvg68Q
 M9aAJuzPSjllhPtoAWGXNp8k3kHCJ5e46WDMwA4TPd8DIqhJdr7DyJW6nXN4brOha8pe
 qPXLlNqkd6IrGQi0UcO+Pj+staDfi/csarahkZTSD6ijtjUlHWV59gtAdDuMDaNHbN6w
 /OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YVurF/hUMxchCmYZOrtbwzZS9w+k/OG5fGLGmCNakdA=;
 b=Tq7g8Y1RPA6m5Hr72DIBocq2UUlSZPKZ32FIZO43jtLMUQBs2IDTGxTRcSUubngf7W
 5fGRxHYtfnf8HMsROCOSdKYhtfsZHIJhhJHlFbdA7UNXfWF/82PsIYJ5TDXdVZiCMu/Z
 F+oMjd8DaupGSaxWuVLqEesMrCnaVBvgdLDIT5GrYE9VXRykhrYOTMuxVx+unSYhI0+f
 +S3QILuAd2nvyFKitvEiPBaPHWbdeCHJQwbGEuZp7sz2PlHC00vdjDnjj12/jCefm8JN
 7UJl3gHAgctf4TPxuPyvAl4pyLxIyPoULHnv0ilM2bXxBJih6PImkDC8OO2kpGxPa3gd
 2Rew==
X-Gm-Message-State: AOAM530yMvr1Y/oc7JCTERkZdzGGUuJxrkTePgtMjPXjtRTufn5/jjJD
 BFRwP1HA9RcFJ2WN+nz6ManWynwI8PTfuhEd
X-Google-Smtp-Source: ABdhPJyy+dNagYdprmG83chr4T3KJsGTyWplViKBm3MVTjb0G1o3Eihlxw0SOJWSasPIgLK3FoYBDw==
X-Received: by 2002:a17:902:b092:b029:d0:89f1:9e2c with SMTP id
 p18-20020a170902b092b02900d089f19e2cmr18796179plr.8.1599502071821; 
 Mon, 07 Sep 2020 11:07:51 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id
 w66sm16269839pfb.126.2020.09.07.11.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 11:07:51 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ci: fixes msys2 build by upgrading capstone to 4.0.2
Date: Tue,  8 Sep 2020 02:07:37 +0800
Message-Id: <20200907180737.2093-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Block <qemu-block@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yonggang Luo <luoyonggang@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Lieven <pl@kamp.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 capstone  | 2 +-
 configure | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/capstone b/capstone
index 22ead3e0bf..1d23053284 160000
--- a/capstone
+++ b/capstone
@@ -1 +1 @@
-Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
+Subproject commit 1d230532840a37ac032c6ab80128238fc930c6c1
diff --git a/configure b/configure
index dbacbbee7a..1c634c8468 100755
--- a/configure
+++ b/configure
@@ -5141,7 +5141,7 @@ case "$capstone" in
       LIBCAPSTONE=libcapstone.a
     fi
     capstone_libs="-Lcapstone -lcapstone"
-    capstone_cflags="-I${source_path}/capstone/include"
+    capstone_cflags="-I${source_path}/capstone/include -I${source_path}/capstone/include/capstone"
     ;;
 
   system)
-- 
2.28.0.windows.1


