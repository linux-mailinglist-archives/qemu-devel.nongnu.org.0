Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72463C5C91
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:47:05 +0200 (CEST)
Received: from localhost ([::1]:39582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vKv-0003ci-51
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vH0-0007Pt-IV
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:42:58 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vGy-0006GM-S8
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:42:58 -0400
Received: by mail-wr1-x42f.google.com with SMTP id f17so25434084wrt.6
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q40Rn3JF+d2/b2IrZBQBwjU1N/Ro9qFu5x8Qg9QFHkA=;
 b=Le6DTuwL8LYqBzAkOnz/5DpTsoLqG995HvVJdmpsAtYi29w550wwwAoT/vXGUJEIyP
 fK6kAho4WyHJAlb8xXGJVslBPgbBPz/8j7hcpn7RMZpbdz1ADmrcKQTyKCE5duViELoM
 V/R5WdtTyKqRMVtk6eF6bhG+LbWX4o4yze50Ezb5UDQnhsQe9s/XUkDmKwChB+FsTr5Y
 mLLOeLSVccjB/GLyVYGPIV8Bw09qjvWma9ps5yFNq9QzDtvjKdPxmtfyMx0w1+w1Gmku
 MjaqvfGa+ewrLYcMwZR4yAVHvJZp1KxASJOaI5wEwIJqLv6UT9uXVmhs7OQx0Fr6scZ4
 iMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q40Rn3JF+d2/b2IrZBQBwjU1N/Ro9qFu5x8Qg9QFHkA=;
 b=unGPfTy2hj9dtYjmlItckCUqiwB7iu5rzg4W/M22gaTQSxQPaDF3Lw93ZFNKOIhjk1
 qpH6Xuy1Q1d9wOtM1PZoBz6tUhy7DsdA5x557p0wd8RdYVxXL1q0TZz3qApqQaNQfdxL
 wUIoITpTNRPkd7YAI5QXa6R1mNbmUbyI/SYqUjGJxkcBH1tkW4T7k5Ex3Pu7BAejJQaK
 W12WEvLRJKX+8r/Bf0XGt3eg3KpVD/22y8NHy1X3zB1EdNR+yWfwwAZuEaa05b5djz/Q
 3C6+rh+553hxuskwREalwoX9u1NYths5XoF04f+2BGDMUu3C0T128IsVixsVYBxegaei
 NwxQ==
X-Gm-Message-State: AOAM532o7wbuVJpj8ZhLXAI3vJIDP/OhOzjlOfwlFB7ojitxmHsFa7mC
 fuVKd1kE7BpD8giOth1qoIXeXQ==
X-Google-Smtp-Source: ABdhPJxmP/bWt820/NFnBM/epaqvLkIB1NauZqQs8WISkX9ppZngr9p6qN6GNQJJ5UsrJWPtrP2AZQ==
X-Received: by 2002:adf:82f1:: with SMTP id 104mr58743960wrc.306.1626093775625; 
 Mon, 12 Jul 2021 05:42:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r9sm12685546wmq.25.2021.07.12.05.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:42:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 81E861FFAF;
 Mon, 12 Jul 2021 13:26:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 25/40] tests/vm: update openbsd to release 6.9
Date: Mon, 12 Jul 2021 13:26:38 +0100
Message-Id: <20210712122653.11354-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

tests/vm: update openbsd to release 6.9

Signed-off-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
Message-Id: <20210709143005.1554-26-alex.bennee@linaro.org>

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 4d1399378e..c4c78a80f1 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/6.8/amd64/install68.iso"
-    csum = "47e291fcc2d0c1a8ae0b66329f040b33af755b6adbd21739e20bb5ad56f62b6c"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/6.9/amd64/install69.iso"
+    csum = "140d26548aec680e34bb5f82295414228e7f61e4f5e7951af066014fda2d6e43"
     size = "20G"
     pkgs = [
         # tools
-- 
2.20.1


