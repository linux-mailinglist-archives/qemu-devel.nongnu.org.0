Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887472D4777
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:08:05 +0100 (CET)
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2wd-0002NW-Up
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2px-0006SC-OW
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:09 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2ps-0000pq-V6
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id i9so2534568wrc.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/gVjUyQJHvf964o2tWPO/N3WzaEBmst0tBLcwGp2eSE=;
 b=L2kedjPQ915ydVAHwc3C8jrdncEhgTz11k/gtrZCnFAj6mTp10fgIw0OfoTw/Q8eqI
 a/HL5cuaLlXQ563n4bM50unxsQYoae83ZAdpw18abZ88l6XYnu7bvD4XOMN1ljESrrlc
 hwsKyz/zGwwMMrAMfAb0Bie+gTmCLIVpNdgNMozIC4MZLLdr9NrPjET7uuPW87Ew3cta
 ei5HpSgwtRT/h3FHUmfBmzKybeFqMYyb/FXJQUk+B2iWSUKZFbmN7oKNBA3uFZ2Xw3db
 lLZ837LdBew1rwar+MJmpinJO1oYJXtVfVXazYGsph6ehcBDY0IMik0h/3XjdPlOY0fw
 WIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/gVjUyQJHvf964o2tWPO/N3WzaEBmst0tBLcwGp2eSE=;
 b=kWxku5O9psBB6HXhS55QlmR5tQsw5Cfe64/OsCoBhuEamk4DCXQNU/c29ZXyNeTpxp
 lsuv5bTJDBO0O+6PHPTdDILgkFrgc3g7UydEWaqDC8bt0cywGZjsAwU+cDyxhxNs0xnY
 J0DjE0JGaEh5FbWQMaPBec26mI1nhrdOM4cB7RgdgmXvE9eWWEFc/0dAQkG0a9PW0lcP
 RicxwxEqUYmrbz1NtMvYCA3OtG5AsHImsMTdCNkKvQHtEho+vIxI1DM3wI7rr8Y5OGRr
 rQHX1Yi+xI5cDbgSCTQSjBPkAruraFuA4u2xg/p+LBPN8z/pq+plOeW8s+Zs6OcVR9ff
 Xd9Q==
X-Gm-Message-State: AOAM531aN7NfD+0nAXYiyvyeaqL9aw7ULirXyGtpjjOOIC7JjwoUAf3x
 941OJ9lLv5EMwez9NAXHYVEYaA==
X-Google-Smtp-Source: ABdhPJz9/K8VzwYS3AG+UBpZdNev6bfuPwNEpnnYzFexwS0hAE9Q4RE9LBkgRwel4wHC5jrynqG+9g==
X-Received: by 2002:adf:c589:: with SMTP id m9mr3712662wrg.370.1607533263338; 
 Wed, 09 Dec 2020 09:01:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w17sm4423618wmk.12.2020.12.09.09.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 09:00:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4EA2F1FF87;
 Wed,  9 Dec 2020 17:00:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/6] configure: include moxie-softmmu in
 deprecated_targets_list
Date: Wed,  9 Dec 2020 17:00:54 +0000
Message-Id: <20201209170059.20742-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201209170059.20742-1-alex.bennee@linaro.org>
References: <20201209170059.20742-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We still build it but there is no point including it in the normal
builds as it is ushered out of the door.

Fixes: 4258c8e221 ("docs/system/deprecated: Mark the 'moxie' CPU as deprecated")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure      | 2 +-
 .gitlab-ci.yml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 18c26e0389..8f2095a2db 100755
--- a/configure
+++ b/configure
@@ -1610,7 +1610,7 @@ if [ "$ARCH" = "unknown" ]; then
 fi
 
 default_target_list=""
-deprecated_targets_list=ppc64abi32-linux-user,tilegx-linux-user,lm32-softmmu,unicore32-softmmu
+deprecated_targets_list=moxie-softmmu,ppc64abi32-linux-user,tilegx-linux-user,lm32-softmmu,unicore32-softmmu
 deprecated_features=""
 mak_wilds=""
 
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0173e82b1..21b01c0547 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -291,7 +291,7 @@ build-deprecated:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-docs --disable-tools
     MAKE_CHECK_ARGS: build-tcg
-    TARGETS: ppc64abi32-linux-user tilegx-linux-user lm32-softmmu
+    TARGETS: moxie-softmmu ppc64abi32-linux-user tilegx-linux-user lm32-softmmu
       unicore32-softmmu
   artifacts:
     expire_in: 2 days
-- 
2.20.1


