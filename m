Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DB34E468C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 20:17:34 +0100 (CET)
Received: from localhost ([::1]:44704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWk0b-0001PF-Hl
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 15:17:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWjxz-0007jd-Tl; Tue, 22 Mar 2022 15:14:51 -0400
Received: from [2607:f8b0:4864:20::102f] (port=41780
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWjxy-0005RQ-AW; Tue, 22 Mar 2022 15:14:51 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so3050042pjm.0; 
 Tue, 22 Mar 2022 12:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hkbus/u5e7icQPKpMpa2Rxe1myfOttHl8Kl3isWHAtM=;
 b=Ru02Bfwwwm1t6LxTyzCiuCl0DfXgKXnX7XxyfWoFXcSLGvEktTo+Mk1DO3xCkdByLu
 hZwlq8Waw1MyuDsuVyDzY9IDhVA1YqUY61IKx/QTxvIxryFXFdxA3ZptMzBguP7FEwmX
 kGjSoZSgub6Hy9rV27cL6DN6H+qqb4a/3lOFH+P++WsKYP6E8nrs5ef1WPgi3KNSsekC
 C8X+fEE3wfx+exaGUOen2q6HQLVf0jYFfxVrZsei8WQL8hQtoB4NA6ZgIla0JAtQTN6B
 WGpuguFwd6ILokSkbvBprtmxSc7ihb9JTN1nwsQJm9HMbdCj1a2iy7OhDpc/5LqWI23u
 Wl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hkbus/u5e7icQPKpMpa2Rxe1myfOttHl8Kl3isWHAtM=;
 b=KfBMef20wx9Tbruh6GQXGhMjcaEeEXhwVv3nm8UmbqJ28Py3LsmzPDn+vPHw6lXDv1
 FjodBJ08Iz67HpQLzlJU/aD/PlbjjPXRp2IODhoW0DrFUr/OKWtFMAz4ROrMRQ51khLr
 XUSfPgroIkej0i3eaBXHqjeQqI4mXxAb2mN59Z+7FUJOLYDjmGpuaisMeBOUQZLhBr8r
 Xmc380ZePe3KReFBa+mgyFlPZkiE8e0gw4cV7SqTMxRnrfbytZ6joJQcmKGRdvylTAKo
 HKlzWvb5KwsXYIB37ADgkuCUHaNkL+dDsHh4FL982IM7bkOKBHYzjuajLOsoLbuds+bH
 +R6g==
X-Gm-Message-State: AOAM532xCcmmBfp4iSJeHeQeDv13vEBPd6VfCGO89989clph/ZixGMxT
 QXXR72XS+J8D9bS/woOivRNQuga75lOmgQ==
X-Google-Smtp-Source: ABdhPJy/qz8OcWc3nERqhH4nbM3qhZat3NsoN6qiwD3GPbX+4nVzeydWN9WNUi1Wj7sP8HgFiCrfzg==
X-Received: by 2002:a17:90b:3b4c:b0:1c6:d9f0:77b8 with SMTP id
 ot12-20020a17090b3b4c00b001c6d9f077b8mr6709095pjb.124.1647976487922; 
 Tue, 22 Mar 2022 12:14:47 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 q20-20020a056a00151400b004fa99ba6654sm10146827pfu.115.2022.03.22.12.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 12:14:47 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: QEMU Devel <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/2] ci: Add github workflow for getting cirrus working
 properly
Date: Wed, 23 Mar 2022 03:14:08 +0800
Message-Id: <20220322191409.1330-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20220322191409.1330-1-luoyonggang@gmail.com>
References: <20220322191409.1330-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102f.google.com
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

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .github/workflows/main.yml | 29 +++++++++++++++++++++++++++++
 MAINTAINERS                |  4 +++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 .github/workflows/main.yml

diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
new file mode 100644
index 0000000000..85a392b962
--- /dev/null
+++ b/.github/workflows/main.yml
@@ -0,0 +1,29 @@
+# This is a basic workflow to help you get started with Actions
+
+name: CI
+
+# Controls when the action will run. Triggers the workflow on push or pull request
+# events but only for the master branch
+on:
+  push:
+    branches: [ master ]
+  pull_request:
+    branches: [ master ]
+
+# A workflow run is made up of one or more jobs that can run sequentially or in parallel
+jobs:
+  check-patch:
+    name: Check Patch
+    runs-on: ubuntu-latest
+    steps:
+      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
+      - uses: actions/checkout@v2
+        with:
+          fetch-depth: 0
+      - name: Install dependent packages
+        run: sudo apt install perl
+      - name: Checkpatch
+        run: |
+          git fetch https://git.qemu.org/git/qemu.git master
+          git tag base_tag_to_rebase FETCH_HEAD --force
+          ./scripts/checkpatch.pl --mailback base_tag_to_rebase..
diff --git a/MAINTAINERS b/MAINTAINERS
index cc364afef7..6d1dcc36b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3612,10 +3612,12 @@ Build and test automation, general continuous integration
 M: Alex Bennée <alex.bennee@linaro.org>
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 M: Thomas Huth <thuth@redhat.com>
+M: Yonggang Luo <luoyonggang@gmail>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 R: Beraldo Leal <bleal@redhat.com>
 S: Maintained
-F: .github/lockdown.yml
+F: .github/workflows/lockdown.yml
+F: .github/workflows/main.yml
 F: .gitlab-ci.yml
 F: .gitlab-ci.d/
 F: .travis.yml
-- 
2.31.1.windows.1


