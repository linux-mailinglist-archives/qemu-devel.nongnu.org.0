Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77F1252C83
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 13:34:36 +0200 (CEST)
Received: from localhost ([::1]:55342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAthM-0003Ad-1m
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 07:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAte6-0007ZV-Pz
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:31:14 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAte5-0006WZ-4r
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:31:14 -0400
Received: by mail-pg1-x533.google.com with SMTP id d19so879257pgl.10
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 04:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kZmgaDEBNjpxaFbsHI9krVOWSzauPOV79k08lIpZd10=;
 b=uMkBCLVq8w2/VD6Mmv6MckRhJYEKHsFXBip+JgtzR7oJM/D4v84ivVbjf72PObS2uX
 RNCxWfrO7JW+G7LvwGtas/Z4FecoYiVOw/gY3aIbAv7njbJhZQtidrlsf1kNN9zrZpu3
 jCzwiklM3JCkaNXa1xjv9K8+VBK+UmHzeQmr/S+oX9+qV3VSsZg8iJ8t02MHhZ8cd3WH
 1TM05T9kDfSgyZeVg4GSwDyZOHgXGnUcBR09SRGadc+gQllU1eUAlxw7becHcM8pmQrZ
 dHAuztSJWPlvVWiN0PMKJgHnJNIATsZwK1CW1aYkC/BkIKBDJbv0llhlGmo9c8bm82Ci
 YuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kZmgaDEBNjpxaFbsHI9krVOWSzauPOV79k08lIpZd10=;
 b=PeYL+Nu9WDgvKCOb5zj8c8ESrlT7M86UzF/Qtdg+Ahfal5KUoIT8ecc0ffjbYLhFHk
 AdX/mLSTe5LemmU8AW9OkWrW552JNXccDolYe3dRoYoXpHlh05po6oVhP8L7c33Tpy+X
 1vgtaAnLPJMPPn4hMYJ64umpGrZDU9hFH/8N+D6zKjLexW7JC1L660AO9Ytgj25qOSCE
 yFiWPr1sTpPloMOprBpunebJmx7BHrh8+5AfnB5HLZScdqN5howonB7K+ISjvZ0il9+Y
 vpeJ1MYiGmzLNS0su9VosrXnZolejYJw8N6w1RoQlZnbjwX9TzF3/KZ6qwK8TKpl4Bw3
 g1QA==
X-Gm-Message-State: AOAM533BmHu1XkpkvT0xuEYR2IrxGJA3cnDNr0p2x3sbULIRcXeb1nEO
 242KBdRzImO2s+DR5SGkQ6pj4Atrasdsiy7h
X-Google-Smtp-Source: ABdhPJwt1CZFDEZ560m3Y6OhZu1kcF9hx3nzMmTxeXa+AkPOw6xJF9yvooKmKI1MxdAKAt1hjw74EQ==
X-Received: by 2002:a63:584a:: with SMTP id i10mr10580045pgm.315.1598441471399; 
 Wed, 26 Aug 2020 04:31:11 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id v8sm2310878pju.1.2020.08.26.04.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 04:31:10 -0700 (PDT)
From: luoyonggang@gmail.com
To: qemu-devel@nongnu.org
Subject: [[PATCH v3] 5/5] meson: Fixes ninjatool can not be recognized as
 script under Window/MSYS2
Date: Wed, 26 Aug 2020 19:30:35 +0800
Message-Id: <20200826113035.1564-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20200826113035.1564-1-luoyonggang@gmail.com>
References: <20200826113035.1564-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x533.google.com
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

use ninja instead ${build_path}/ninjatool

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 3b9e79923d..2ad0c58492 100755
--- a/configure
+++ b/configure
@@ -8222,7 +8222,7 @@ fi
 mv $cross config-meson.cross
 
 rm -rf meson-private meson-info meson-logs
-NINJA="${build_path}/ninjatool" $meson setup \
+NINJA="ninja" $meson setup \
         --prefix "${pre_prefix}$prefix" \
         --libdir "${pre_prefix}$libdir" \
         --libexecdir "${pre_prefix}$libexecdir" \
-- 
2.27.0.windows.1


