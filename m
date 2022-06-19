Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC04A550ABC
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 15:05:18 +0200 (CEST)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2uc9-0003Jz-6R
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 09:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imranyusuff@gmail.com>)
 id 1o2j0g-0005TM-Lz
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 20:41:50 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imranyusuff@gmail.com>)
 id 1o2j0f-0007ka-2B
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 20:41:50 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 j5-20020a05600c1c0500b0039c5dbbfa48so6067733wms.5
 for <qemu-devel@nongnu.org>; Sat, 18 Jun 2022 17:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=muK/ohyAeBIcf/2/4KUf6c5y7qAwMW+ZriKSdZFeq/M=;
 b=a+847UtGk+RfItNJt+HK5flZewxFPJuqXl3XryoLIu3c2k0aFt6K14rEdLZLY1nMFD
 GZNSA/h4TelyxnZgRR2eKaHMvvGEDFdXGO4F7EqYOkM1uItd2cUIeKtzmR+StczdgXqr
 lQYTlSkFsAF6ZsHj1iRPRo9i4CTHDBKx9FyoJGu8SxNFTGCp39jc7+mhPZjiqDdvc9Ju
 hc0ZeghQMC1fXgCh9yLiY/ZCIY6HUsQOCk/pjS2QiOWSPfMvBQIByeWDiZ4F2AnCOHCV
 But0sMSs+tkoy7m6dgMkwPNkTbmHbNW0TyesDjV/+6E1zstxV8kWPS9dQgVwK+QDC1Tw
 VDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=muK/ohyAeBIcf/2/4KUf6c5y7qAwMW+ZriKSdZFeq/M=;
 b=pabT+4xJpCR3DgwNsAOFn4mPd9qXVfkzyeszgbztupuCbHF1T1DB7zgv8HomfTNc+b
 eRlgxgbgQEa0XXGVdVhAkxLVHyoVt7ujJo5WQryWmycQisQGwDAF4P44btRI0J0uepI+
 ebXWwCHc0pwAl3zqAVnGjsnUTQysjp4QXlgP+edNn6zrXafSlOgn+TwZ2Xzdwftp3C0a
 QWiBds7Z9aEW6T4xTqhQHa/6WukZBaOTwa8xW1Pd56+drl0B5THr140Iyq2v9UJgTQX/
 FKCVx33Rom+TKanS32KoH+w6gyWIBE89cNqGC6GSxgx2C1KVNvuigLiwA1X23rvx9jtD
 8Rmg==
X-Gm-Message-State: AJIora98Hw1rR0wHdoyVdDL+8fY6GyN5qOw2QTIUriisyhKNnN+3mTeI
 ch5q2te+YKmQPGFIIdfHcGxq/Lw1zg==
X-Google-Smtp-Source: AGRyM1voWAFTtXyJmY0qe6XRjrv1gzzF2N3a51L5xC19hmZEUFVQLjCf11sd1iel55mzDiSqjFFlKg==
X-Received: by 2002:a05:600c:4e09:b0:39c:6c5d:c753 with SMTP id
 b9-20020a05600c4e0900b0039c6c5dc753mr17485280wmq.34.1655599306738; 
 Sat, 18 Jun 2022 17:41:46 -0700 (PDT)
Received: from localhost.localdomain (82-132-213-179.dab.02.net.
 [82.132.213.179]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b0039c50d2d28csm14346140wmq.44.2022.06.18.17.41.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 Jun 2022 17:41:46 -0700 (PDT)
From: Imran Yusuff <imranyusuff@gmail.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Imran Yusuff <imranyusuff@gmail.com>
Subject: [PATCH] ui/cocoa: Fixed modeswitching glitch in zoomed fullscreen mode
Date: Sun, 19 Jun 2022 01:41:36 +0100
Message-Id: <20220619004136.35351-1-imranyusuff@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=imranyusuff@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 19 Jun 2022 09:01:21 -0400
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

This applies only on macOS using cocoa UI library.

In zoom-to-fit fullscreen mode, upon graphics mode switch,
the viewport size is wrong, and the usual consequence
is only a part of the screen is visible. One have to exit
and reenter fullscreen mode to fix this.

This is reproducible by setting up a Windows 3.11 system,
booting into DOS, enable zoom-to-fit, enter fullscreen mode and
start Windows by 'win'. Then you can see only part of the screen.

This commit fixes this problem, by including one line of code
which is from the fullscreen mode initialization.

Signed-off-by: Imran Yusuff <imranyusuff@gmail.com>
---
 ui/cocoa.m | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 84c84e98fc..bd602817cd 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -636,6 +636,7 @@ - (void) switchSurface:(pixman_image_t *)image
     if (isFullscreen) {
         [[fullScreenWindow contentView] setFrame:[[NSScreen mainScreen] frame]];
         [normalWindow setFrame:NSMakeRect([normalWindow frame].origin.x, [normalWindow frame].origin.y - h + oldh, w, h + [normalWindow frame].size.height - oldh) display:NO animate:NO];
+        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
     } else {
         if (qemu_name)
             [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s", qemu_name]];
-- 
2.24.3 (Apple Git-128)


