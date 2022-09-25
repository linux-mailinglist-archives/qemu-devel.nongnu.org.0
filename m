Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2285E9321
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:37:10 +0200 (CEST)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQsf-00037G-So
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsV-0003pq-H1
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:33:05 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsT-0006VW-BP
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:54 -0400
Received: by mail-pl1-x635.google.com with SMTP id iw17so3974364plb.0
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WijaFh1+3eGNmoiPADdFaEnlm/n1XUXqlNMKiv/+vQo=;
 b=Ip0L8/OFM69Vaxz/SdSSAF3O4mqnqYTXLZ+plCQMRST7JBNtMGcD4wpVtn9d1Iot8r
 F4SYOwKOQ8v6FqRjh/h+8uzXCg+PRxy6GwlrIVIte6SDfrPYvjD/japAfmehh6t8H9IO
 xfqDJ+sll0+mpAfCDJ5GYKxM77N7YaBJOcjdxiBDyS6bnFboPEEawKZJoVp5fsB+fTOW
 axFyOhaYLxkOlMwwbfipBgvD293uA9+F62hlI2yyKM7eawKETIkBMR8vnh1MDlgnteod
 bBqXWvWFMrBtQJlnLmxwkigbtW0IRoAwlL6xTo3DMIDW1qUtDdEyDPhQgOcFMe3L+/yY
 tpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WijaFh1+3eGNmoiPADdFaEnlm/n1XUXqlNMKiv/+vQo=;
 b=jaRv+5I+vrswIv9SYYF+BoknCg+iCQSDyTpOLKWUV3wHNNqPHVE5FXPLkwsFkIJlDV
 QOaMg2dLOBdQUSZSb3vK1O63OaC5/HJq95rqKKGPwnot9cS59/SOnxIVlWWZwZrkRnpC
 M67LyMy8SwL6MHw1siYBCgBOR7zm1EeZA8/Xzxdf4LNCeH0r9QvTDLN2AFAf0T1buaOO
 6Qwnoao0kA1ojH5qF7f04tjjBnX+S+xQOPBwpOZkESZ8nGhUdYd4C49SpKOxEG7HITc5
 aAiBy1DswOuIw04YxXofYyozLHEb7kbTXkWHkZGadEAa5oESfb5k5m31ingLSNGK8bZ6
 mqrw==
X-Gm-Message-State: ACrzQf2E0S5NtDtvCAa5FHxbhKYCsW6mVhUXnP8jtNcH3Tw+86J48r9G
 qZD60Y7lpaIqyGiaR5anIOYzjDt6cSo=
X-Google-Smtp-Source: AMsMyM4SXgadq0LC79zGE/h1Eow7+GYslY5YeCln3VZ2PSdh6luLSaBEV+YPDrshPmpG6N4rGpKvDA==
X-Received: by 2002:a17:90b:4b05:b0:202:b76e:a274 with SMTP id
 lx5-20020a17090b4b0500b00202b76ea274mr30914320pjb.59.1664105571857; 
 Sun, 25 Sep 2022 04:32:51 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 51/54] .gitlab-ci.d/windows.yml: Increase the timeout to 90
 minutes
Date: Sun, 25 Sep 2022 19:30:29 +0800
Message-Id: <20220925113032.1949844-52-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
changed to compile QEMU with the --without-default-devices switch for
the msys2-64bit job, due to the build could not complete within the
project timeout (1h), and also mentioned that a bigger timeout was
getting ignored on the shared Gitlab-CI Windows runners.

However as of today it seems the shared Gitlab-CI Windows runners does
honor the job timeout, and the runner has the timeout limit of 2h, so
let's increase the timeout to 90 minutes and drop the configure switch
"--without-default-devices" to get a larger build coverage.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v2)

Changes in v2:
- Change the timeout limit to 90 minutes

 .gitlab-ci.d/windows.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 86a4339c48..9ef4667317 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -10,7 +10,7 @@
       - ${CI_PROJECT_DIR}/msys64/var/cache
   needs: []
   stage: build
-  timeout: 70m
+  timeout: 90m
   before_script:
   - If ( !(Test-Path -Path msys64\var\cache ) ) {
       mkdir msys64\var\cache
@@ -59,7 +59,7 @@ msys2-64bit:
   - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
-      --enable-capstone --without-default-devices'
+      --enable-capstone'
   - .\msys64\usr\bin\bash -lc 'make'
   - .\msys64\usr\bin\bash -lc 'make check'
 
-- 
2.34.1


