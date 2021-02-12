Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D06319824
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 02:59:30 +0100 (CET)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lANk1-0004qx-DR
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 20:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lALwu-0006gS-1Q
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:04:40 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lALws-0000BS-CR
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:04:39 -0500
Received: by mail-pf1-x432.google.com with SMTP id c11so4736486pfp.10
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SQSolHD56CysPPaB1EfYj1eQNgKh4RvsTWDzwhN95Iw=;
 b=BHslBMWizsM5QKupNcBPoa88OsamHesFByD8JaQ4NjtwuPLpDd5kck5vWJK6CcXx5J
 Q/D++QUap4TAv/A+gWteOULnK3DWNNoPVhXV75+SYLc6VPfRagGr7xaR0hnVN6sOpgWg
 CbFhi7OkOhX3GPv1F7DOsWNq6az4g/s8zkE81c/QcYc2heJF2YiSXKiz1YZXiYmAI+j6
 5FsCdxrpLRbCVjXJGKasw2UNYJ6SDGYzyQeTk/lB89bYQmYnY9rT5CmesRexeNtXAT52
 eIgjl4y5F83Pbu9Iyokp/+z62lP3e93WcZT7REbF37B+kqIu+pAQuit/jOZOSt4uNMNV
 kUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SQSolHD56CysPPaB1EfYj1eQNgKh4RvsTWDzwhN95Iw=;
 b=e/r1OMW1pXYdE7hL/VM3JtqJUeXN8rGWQ3VpHYo+P51YpGUDTD6dlzjdejpOoF+T/3
 h6Mh2l84PLVNWJZ88wfeXrHKVzP5WQ2yeW6SC94aGWTG5d1jMnGAyoc2u2KrNN7M0yJo
 CP4tMQsRjwIeKJYJyFtwS1Q8toEfumyqSYrz3fgB2VxJ3K3zbk7hqbSx2Pbd6c6A9dxo
 lvvfOUOZm4raye7T4bZxbEgYXKg7K78q8i4q2lIJ9u4vwi4fdusCL8bVd2JksnubEdxr
 Iv+5OLcYAH0+74vpwFuaL1ZnumrN5HajEwuSLjGD8ockPEKxsPraVjV2XbvC1t0SfU/v
 Q54A==
X-Gm-Message-State: AOAM5323tD3/kEZ9YzJ8YDfj+0FBfOn1WZd66pvmYZ9hGNGPTJ8I5IaV
 MjWo6hFCasuhDbDubP/tnJw=
X-Google-Smtp-Source: ABdhPJyBCax8DeWNnZWvlAPuC9VydwWI2K/y1fJ/5P5N6lSP5c1A+7fKgmdZj+2APwDmzpAjjNBAaQ==
X-Received: by 2002:a63:d751:: with SMTP id w17mr612122pgi.182.1613088276296; 
 Thu, 11 Feb 2021 16:04:36 -0800 (PST)
Received: from localhost.localdomain ([210.227.19.68])
 by smtp.gmail.com with ESMTPSA id y14sm6527550pjg.52.2021.02.11.16.04.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Feb 2021 16:04:35 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Support unique keys of JIS keyboards
Date: Fri, 12 Feb 2021 09:04:04 +0900
Message-Id: <20210212000404.28413-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Feb 2021 20:57:23 -0500
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 13fba8103e1..78fcfeaf04b 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -240,6 +240,13 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
     [kVK_F14] = Q_KEY_CODE_SCROLL_LOCK,
     [kVK_F15] = Q_KEY_CODE_PAUSE,
 
+    // JIS keyboards only
+    [kVK_JIS_Yen] = Q_KEY_CODE_YEN,
+    [kVK_JIS_Underscore] = Q_KEY_CODE_RO,
+    [kVK_JIS_KeypadComma] = Q_KEY_CODE_KP_COMMA,
+    [kVK_JIS_Eisu] = Q_KEY_CODE_MUHENKAN,
+    [kVK_JIS_Kana] = Q_KEY_CODE_HENKAN,
+
     /*
      * The eject and volume keys can't be used here because they are handled at
      * a lower level than what an Application can see.
-- 
2.24.3 (Apple Git-128)


