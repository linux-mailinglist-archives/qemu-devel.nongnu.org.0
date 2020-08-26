Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E7252C8A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 13:36:13 +0200 (CEST)
Received: from localhost ([::1]:34342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAtiu-0006Ev-7H
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 07:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAtgv-0002yo-N1
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:34:09 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:44549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAtgu-0006hw-5v
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:34:09 -0400
Received: by mail-pl1-x642.google.com with SMTP id q3so753563pls.11
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 04:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rIP9TCfc3oqvA8Vp/R/E5MTUabOcrCowAJuIfVAgJrs=;
 b=McxdFCJYs+BiH6gK7MPaLnbxsQ55pKhilJ5aycblqtnYfks6rOaE8OiGCLmLfPoPPB
 IuGuWwV5yzlzHsUyIGS2uaIbHMJcFFZd1OeJjmBdvJmP5+R6Zczhdk40GbonssIK6iUX
 4U21p4z0uzr4PcB/RXiCwPcjKb0LT1iBu9aY57o/Kw9+hYqOeprwJk/OrCtlKfUgjoSx
 cmCrh9Ialxr7dhWDZxICFm5YcVOG4LKBGG9vjrAhXCYwzlkQrAwgZLaGPKBuL2KpbbIi
 hL5saYAqhvA5bHUWjJN6DTJSUc2Zn+axkYbgQ7jCxL+mZazh5DdfFvOJjF0RUBu2a0Qo
 IN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rIP9TCfc3oqvA8Vp/R/E5MTUabOcrCowAJuIfVAgJrs=;
 b=qf6tg4q7T2jDSXUF0fzfg2lYSetcw4p6lyQ6MugBFvawWmP/KNssZwdCt7D1FoYSA9
 ofRLpBF4AqG4sUM0qUsjZ9Bpzb609SaFYwDZMrQYOhpbPiJq9bg4ABI2gjfLNIeFh4pq
 QCLCCw5kp5bkeQ4jvu7Og1GKjzHJqHsWnfzflqsTaoqblfNKMulJov7IpD8HQ1S3U8wY
 QLmamLzhfqp9M6bNL3Wic3RzVhiNM38OedVDa38q7EUmWO6IZ7q/qR3LwD6KgErEgXKC
 lP+v/hA1disi+6K29/I+rkPxdRTA0yOZ9qAzWnuczevakYFDUARHREmpOGNP7KHohmp6
 x7DQ==
X-Gm-Message-State: AOAM530WKXrlX2sqNnCSm+SpqV1nBPFhUsUy06USZWYTBk1l1UgIkcia
 VeEzZCdbkSmJQqCNNSqtPkruBAP1gB1eM6sY
X-Google-Smtp-Source: ABdhPJxVHwMA+AA1Ndg5VAuD+JTC9a1pd+rL/05ahWZDSnbtzpx/IclLCb2hsbeAIeExe4sP1kFNUw==
X-Received: by 2002:a17:902:d903:: with SMTP id
 c3mr11910434plz.145.1598441646381; 
 Wed, 26 Aug 2020 04:34:06 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id p20sm1915914pjz.49.2020.08.26.04.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 04:34:05 -0700 (PDT)
From: luoyonggang@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] meson: Mingw64 gcc doesn't recognize system
 include_type for sdl2
Date: Wed, 26 Aug 2020 19:33:24 +0800
Message-Id: <20200826113326.491-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20200826113326.491-1-luoyonggang@gmail.com>
References: <20200826113326.491-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x642.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Fixes this for msys2/mingw64 by remove the include_type for sdl2 discovery in meson

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index f0fe5f8799..1644bbd83c 100644
--- a/meson.build
+++ b/meson.build
@@ -224,8 +224,7 @@ if 'CONFIG_BRLAPI' in config_host
   brlapi = declare_dependency(link_args: config_host['BRLAPI_LIBS'].split())
 endif
 
-sdl = dependency('sdl2', required: get_option('sdl'), static: enable_static,
-                 include_type: 'system')
+sdl = dependency('sdl2', required: get_option('sdl'), static: enable_static)
 sdl_image = not_found
 if sdl.found()
   # work around 2.0.8 bug
-- 
2.27.0.windows.1


