Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3466B3A6
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 20:29:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH8eZ-0007nL-Qi; Sun, 15 Jan 2023 14:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathbappai@gmail.com>)
 id 1pH8eW-0007n2-0S
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 14:26:48 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nathbappai@gmail.com>)
 id 1pH8eU-0006FU-A0
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 14:26:47 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so29150583pjj.4
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 11:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1BLWkQ9eEvwhuqMdEUvB8OeIbunClgqRFPLcxjMT5vU=;
 b=f4x83aG/i6QBuoelcelweK8Y6ohrHi7rAo4Ah0l+xedwI49GLmv09BkJsyPYgsCR7r
 I0f+HGAl7ZzeEHh1Nz698dYPX4emPcPePvCq1rXoCZZpg6kJo8pNFfUTNoMWwALrq0al
 H3AHJnZ7KGRcNH6uEZ3aHELq6vm1cT8JyVmaxM7BjJOFlItlB9kDtk+WeoJpKlCDAd2y
 0XcMjaWcLQfpx7RxdJi7BuzunkRxh7KQOQ9wteRT8AH1QoiskgLig74v8blRR2M/zxZv
 ZhPJw+53VX54Rs2lgtjrIY9kaDfdeaRLyWeDNwhvFOrBKeJ94BM9HNtVeHHWsdW92i5J
 5rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1BLWkQ9eEvwhuqMdEUvB8OeIbunClgqRFPLcxjMT5vU=;
 b=Tlp9Zv+JAlEGaSwPXuuGUdkaqRgex0cu5gNlGEmGnc0BRjjyTPHi1QuT4OA+CFuEpQ
 ItY2vvfhlFWAaWIF5DfV69UQuLZZhm1ubENn2oVXRTPjiqr3yIsmMRvnbTB8se3yyPf9
 Z/bnSQ9qoDKpGteguB78dXIjve70rtRnFGTZpUohAZFiokNTVY3B8nZUlPDZpYVAxgSI
 mtTTfXyRDUod3k5d2BvbWNVBvLRiaq8yrq9Xbse2VTuVtn/Wlpb7TvqsCtx1IHzSZSmy
 6+ZwNjzNQkZVlGlHQQ0MrkbKFTPHSkDXshB+Kcbl9D8/mcV2eRpBSGaaC3vGkwNf1d1t
 Tytg==
X-Gm-Message-State: AFqh2kr8WSQ6InKZ/s+jYG09vhKc/c4pWTacOKmNJiu1hFNRsQSYzTbd
 vJbeqoKfy7/VtF1fj3yzzhvjdZgYpO9Z/A==
X-Google-Smtp-Source: AMrXdXvuQT67bS8PF3aetIlIjD3KOJgrWmdPGdnvVtSoi6nFpRzGGpfponzTCwnNTGxDVSQaqeuq7w==
X-Received: by 2002:a05:6a20:7f96:b0:b6:8f0e:11fe with SMTP id
 d22-20020a056a207f9600b000b68f0e11femr13432569pzj.16.1673810803996; 
 Sun, 15 Jan 2023 11:26:43 -0800 (PST)
Received: from localhost.localdomain ([43.226.29.54])
 by smtp.googlemail.com with ESMTPSA id
 k28-20020a634b5c000000b0046fefb18a09sm14319088pgl.91.2023.01.15.11.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 11:26:43 -0800 (PST)
From: nathbappai@gmail.com
To: qemu-devel@nongnu.org
Cc: nathbappai@gmail.com
Subject: [qemu-web PATCH] Add download procedure in Windows with msys2
Date: Mon, 16 Jan 2023 00:56:28 +0530
Message-Id: <20230115192628.2072-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=nathbappai@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Biswapriyo Nath <nathbappai@gmail.com>

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 _download/windows.md | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/_download/windows.md b/_download/windows.md
index 5ccf8b4..43c9ac7 100644
--- a/_download/windows.md
+++ b/_download/windows.md
@@ -1,3 +1,35 @@
 Stefan Weil provides binaries and installers for
 both [32-bit](https://qemu.weilnetz.de/w32/) and
 [64-bit](https://qemu.weilnetz.de/w64/) Windows.
+
+**MSYS2:**
+
+QEMU can be installed using [MSYS2](https://www.msys2.org/) also. MSYS2 uses
+[pacman](https://wiki.archlinux.org/title/Pacman) to manage packages. First,
+follow the [MSYS2](https://www.msys2.org/) installation procedure. Then update
+the packages with `pacman -Syu` command. Now choose the proper command for your
+system as following:
+
+* For 32 bit Windows 7 or above (in MINGW32):
+
+```
+pacman -S mingw-w64-i686-qemu
+```
+
+* For 64 bit Windows 7 or above (in MINGW64):
+
+```
+pacman -S mingw-w64-x86_64-qemu
+```
+
+* For 64 bit Windows 8.1 or above (in UCRT64):
+
+```
+pacman -S mingw-w64-ucrt-x86_64-qemu
+```
+
+Some QEMU related tools can be found in separate packages. Please see the
+MSYS2's [mingw-w64-qemu](https://packages.msys2.org/base/mingw-w64-qemu) page
+for more information. Any QEMU package related issues can be found in
+[MINGW-packages](https://github.com/msys2/MINGW-packages/issues?q=is%3Aissue+is%3Aopen+qemu)
+repository.
-- 
2.39.0


