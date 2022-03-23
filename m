Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82864E4DE0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 09:13:12 +0100 (CET)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWw7E-0004jb-0H
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 04:13:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWw2k-0006nB-Sf; Wed, 23 Mar 2022 04:08:38 -0400
Received: from [2607:f8b0:4864:20::42d] (port=41779
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWw2h-0004r0-3U; Wed, 23 Mar 2022 04:08:33 -0400
Received: by mail-pf1-x42d.google.com with SMTP id p8so903427pfh.8;
 Wed, 23 Mar 2022 01:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZVwImMS1nZsmvW7H6O+7YLUqB3wspAldbnrI0QiASY=;
 b=ZZXjFQzLFC734I1NjwD86himosuDSO6Rg44S7iEPrXKleoB21RRxfGR9gV6lgbLGxM
 cYK5RZfvTrewa4JSe8ND8rbH8qwNfZmn3JiiuhFlZtibF52DRHHMcvUCgSvpglch0fa+
 BUYJcGYBQqxLPg0TJOs5PdI17DkvmFao1yxaaGDeCZIdX4645of/u9nsgPHl7dn6EA+p
 geqoHw/okfVhyz3z2liC9mbGpxzmObEyp/yNyfxDlmyIEP0tD27bmQIi/IjrvrKsW/6a
 MZy6EFxEMZ8Rf6GncmM0PrmGCZaWhnq4uH1AzlE8vCRmym1KFJKdQZYRy9SB1rqqMaI5
 2mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nZVwImMS1nZsmvW7H6O+7YLUqB3wspAldbnrI0QiASY=;
 b=sKez66hrZrshI5ZgCwMXwEkqQkR5Hhz9+DU/U7g8ak96qwIZJkJnsau9FcVHAq1zzj
 LyKWnz4+iYhZDNRIXmnWk0Xewpvjb4HvLx/c2e5RRCn20ETC7Ltvu+BWiyJS6VNRQXXf
 D8rgdsm6v8H1C5qSZAgfyOjaLcg4VQUlO/BOkZg4IA6mv6PZ+pkjjTqJJt+PWzX48pWp
 r2daQGUY/WWr66+Ta4WG736oVuEJbFS49eVgb9lza/SkBDdhSjIl791tSi0q2eQKqkjB
 u4by3LIaOmr7ALaEdjcdOBwgv4x2Ew6XUv16EiBUnaS6qa92dlQHCkGkH1tAXuQYlyfR
 H6Bw==
X-Gm-Message-State: AOAM531l1IQBEV6fVn8BqUf4o9jc5s1y29/yIS53JhsTqwpcxbKogJAs
 9jwDLxN46Z9LlbNrqsTz/G2djmxbqUqmJQ==
X-Google-Smtp-Source: ABdhPJwvxJalzzb3mf4A2qEHFdF6Z75g3mJATTbzbn+Mhs4p5jH/Dvz0cc1raG7KhUAX0D4LEwfthg==
X-Received: by 2002:a63:3688:0:b0:382:8bf0:aad7 with SMTP id
 d130-20020a633688000000b003828bf0aad7mr10136389pga.602.1648022908965; 
 Wed, 23 Mar 2022 01:08:28 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 v13-20020a17090a088d00b001c64d30fa8bsm4002999pjc.1.2022.03.23.01.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 01:08:28 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: QEMU Devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/3] cirrus/win32: upgrade mingw base packages
Date: Wed, 23 Mar 2022 16:07:53 +0800
Message-Id: <20220323080755.156-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20220323080755.156-1-luoyonggang@gmail.com>
References: <20220323080755.156-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=D0=B8=D0=B6?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=D0=B8=D0=B6e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is used to fixes the cirrus failure at https://github.com/qemu/qemu/runs/5652470682

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml              | 2 +-
 .gitlab-ci.d/windows.yml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 7552d70974..59b004721d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -12,7 +12,7 @@ windows_msys2_task:
     CIRRUS_SHELL: powershell
     MSYS: winsymlinks:nativestrict
     MSYSTEM: MINGW64
-    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2021-04-19/msys2-base-x86_64-20210419.sfx.exe
+    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-03-19/msys2-base-x86_64-20220319.sfx.exe
     MSYS2_FINGERPRINT: 0
     MSYS2_PACKAGES: "
       diffutils git grep make pkg-config sed
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 1df1630349..e8b65faccc 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -16,7 +16,7 @@
     }
   - If ( !(Test-Path -Path msys64\var\cache\msys2.exe ) ) {
       Invoke-WebRequest
-      "https://github.com/msys2/msys2-installer/releases/download/2021-07-25/msys2-base-x86_64-20210725.sfx.exe"
+      "https://github.com/msys2/msys2-installer/releases/download/2022-03-19/msys2-base-x86_64-20220319.sfx.exe"
       -outfile "msys64\var\cache\msys2.exe"
     }
   - msys64\var\cache\msys2.exe -y
-- 
2.31.1.windows.1


