Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E542B5846D1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 22:07:14 +0200 (CEST)
Received: from localhost ([::1]:33776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH9mr-000554-DQ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 16:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oH9iU-0001mk-3j; Thu, 28 Jul 2022 16:02:42 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oH9iN-0002mB-KU; Thu, 28 Jul 2022 16:02:40 -0400
Received: by mail-pg1-x536.google.com with SMTP id 72so2389867pge.0;
 Thu, 28 Jul 2022 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m0zl3TeCn86IKoa6p7FYTXNlI7C9XKjHCM/vPgbzrgU=;
 b=o+RuaQN5cUrs+EpP306vJ4Il4tfN8lU/SNviH6RuqnJOuUdNpNvKe3w8v9/EjMocWK
 bSGKujdFHak9x8BYhSc3YOUEyci3w4mKHc08Nh+YMLO18q46sHnNPnjTsYdB/z6spLC9
 eR4lVsVAPMqkZrgHI+2D4/Mew2UHT9TPZHo1wyC/6ircaaEMrn/gbmoVdJ5mAXsvC/c8
 9epbZQ3uxPct+utZg/W/zdYNRADnAnMfmZBJYU0PT3rDGwqcZqw+HlmePgNZNiRNOdqM
 VJTU20OlojCHLw+6TTJQObHYKIzOBgblnqHFe6A4wGynAmTGYhuwQIhULHeLBOdFxh04
 /12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m0zl3TeCn86IKoa6p7FYTXNlI7C9XKjHCM/vPgbzrgU=;
 b=uHty7xeo9SHVJCt2lqpGB4cfnqZqNTZJZy56V4+Ki4prVnLq+2jCat+Neeumqccmjb
 46jDPk1exEaYxN7oriSfeq67qtdhuul3KH6llHdCovpu1ufMphDRpc8fLb6R1tU688Jd
 RTN4CRLV3wPRnzlzTFoSHgiZK4i8wtMXuruyrhZs+qfuqFQPP+e/cQaeSKpK+fK3Gx7Z
 t9uppfb1lzaIJMACsZQv2Oq+9JJ6NTOm/UpsILMEZHjDabpkBOdMpKOlL95U2lnsfUwk
 zh//n6npovVz620mjGj0SA6nPYzJ1emQFcodPxxayRrEAr6vS7TfHEyt2mIpGrPMrsdf
 7heA==
X-Gm-Message-State: AJIora9DlJcz87ut0b64SLgRsAllHFwPPOnbtGGs7HZQgjZmWCIpMFpZ
 Yl1Y4DOd6to0I6GHAxxXSDpEv84ckV0=
X-Google-Smtp-Source: AGRyM1uctSGcSdfbixw8v0yLsFtwToVkzWNLsgfD9utbtR1vdExZP7bw/Z/wM38+WTXFbAgFwem+fA==
X-Received: by 2002:a05:6a00:998:b0:52a:db4c:541b with SMTP id
 u24-20020a056a00099800b0052adb4c541bmr179638pfg.35.1659038553474; 
 Thu, 28 Jul 2022 13:02:33 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 g197-20020a6252ce000000b0052531985e3esm1219294pfb.22.2022.07.28.13.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 13:02:33 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH] ci: Upgrade msys2 release to 20220603
Date: Fri, 29 Jul 2022 04:02:14 +0800
Message-Id: <20220728200214.1943-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.36.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml              | 2 +-
 .gitlab-ci.d/windows.yml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 20843a420c..4ffef6105b 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -12,7 +12,7 @@ windows_msys2_task:
     CIRRUS_SHELL: powershell
     MSYS: winsymlinks:nativestrict
     MSYSTEM: MINGW64
-    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-05-03/msys2-base-x86_64-20220503.sfx.exe
+    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-06-03/msys2-base-x86_64-20220603.sfx.exe
     MSYS2_FINGERPRINT: 0
     MSYS2_PACKAGES: "
       diffutils git grep make pkg-config sed
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 1b2ede49e1..da80fabe2c 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -17,7 +17,7 @@
     }
   - If ( !(Test-Path -Path msys64\var\cache\msys2.exe ) ) {
       Invoke-WebRequest
-      "https://github.com/msys2/msys2-installer/releases/download/2022-05-03/msys2-base-x86_64-20220503.sfx.exe"
+      "https://github.com/msys2/msys2-installer/releases/download/2022-06-03/msys2-base-x86_64-20220603.sfx.exe"
       -outfile "msys64\var\cache\msys2.exe"
     }
   - msys64\var\cache\msys2.exe -y
-- 
2.36.1.windows.1


