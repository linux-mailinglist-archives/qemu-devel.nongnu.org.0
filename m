Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6AD38FCDF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:32:27 +0200 (CEST)
Received: from localhost ([::1]:43190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSUE-0008QP-RG
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOk-0005eP-1u
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:47027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOi-0007bP-Gt
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:45 -0400
Received: by mail-wr1-x432.google.com with SMTP id y14so29120782wrm.13
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0e3a0Zp2hWBCA67KvWrU4k0qkaPiwmUI0f3UIGc5xk=;
 b=VE9/2XmDVwHjKKD+BEDvqDe2jW9NfXVyzYgDHifT1hSTt9WrhsGeRlEmoYUVVOwBoI
 qsCuUt15OrpQhyvBca7WF1g5sPJcAKdshYgy2nDwG6cjQZ1gKGgHgfx+OzZQKN2UQD9W
 kgKR4G37l591K8YjGK4gby7s9TL7Wq2tf8HJ4JzJrlgQgHIS7HVxpusrEtJb3K2Gkf/g
 CU99C0HS4g1NL9/n18bzlbkkwfNK5WNYUkyts99xfeThkxkBhFD2TSx0+uW1l7Ad93pO
 B9GfFUSdjml1jHWl4tZjMDsXnnVBxAJewn6LH0bm11vXzqAwlMCC6VFK3WwCL9aBA7Su
 a1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p0e3a0Zp2hWBCA67KvWrU4k0qkaPiwmUI0f3UIGc5xk=;
 b=B/OOwWeNtuBGK3TtKOgShmotbUQfI4JSRzz8KNU+UTnSKBUJHiCuMslRi3819C/TkN
 /Uaf6ZxU1T8KynVOBf3flkXxpzs9nbkMFfuoVozca5DEN+FWdjB4za03DH5HC1B6lCNy
 F0h1ZK6wYvjZKTR46BwVtFIh2le+f/j8rVWIfq3VXa5tC+Rb88DIwyKRfWXNJ4z3GgEl
 1UpCUWirc1G/mHI102DxEWQf7k5SE67QLupcYjRYAT9+4iMLA/gRlR2iynwnBNs9BuYd
 7lFGbfqgrOEiaVq+z/ApAgn/niN5QEre6d3zqRH5EPXwi7mbZlSvaZMS1Lrml1xWkq7k
 vITQ==
X-Gm-Message-State: AOAM533ob51pc1nt7+QuVlJ4vShsIlw2KJfO06UCXBoCaBR/oZQiA8sV
 51O4E7pPKEmE11ex4GocN1iFnHCi7iXzTQ==
X-Google-Smtp-Source: ABdhPJwn59Du8F7AxzX4BC67gnfyD13lUu2j/KVu5eSr/U7S0V0d0Z4DKyuEeYjZQ8Ol+Nr/uKMyHQ==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr26754920wrr.336.1621931203079; 
 Tue, 25 May 2021 01:26:43 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id h13sm10562134wml.26.2021.05.25.01.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 01:26:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] gitlab-ci: Use absolute path and simplify firmware jobs
Date: Tue, 25 May 2021 10:25:56 +0200
Message-Id: <20210525082556.4011380-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525082556.4011380-1-f4bug@amsat.org>
References: <20210525082556.4011380-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GitLab 'add job on file changed' feature doesn't work well
with relative paths: use absolute paths instead.

Change the 'rules:' section by an 'only:' one which is easier
to read.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/edk2.yml    | 11 +++++------
 .gitlab-ci.d/opensbi.yml | 11 +++++------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index ba7280605c4..f543a10fbe2 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -1,10 +1,9 @@
 docker-edk2:
  stage: containers
- rules: # Only run this job when the Dockerfile is modified
- - changes:
-   - .gitlab-ci.d/edk2.yml
-   - .gitlab-ci.d/edk2/Dockerfile
-   when: always
+ only: # Only run this job when the Dockerfile is modified
+   changes:
+   - /.gitlab-ci.d/edk2.yml
+   - /.gitlab-ci.d/edk2/Dockerfile
  image: docker:19.03.1
  services:
  - docker:19.03.1-dind
@@ -28,7 +27,7 @@ build-edk2:
  needs: ['docker-edk2']
  rules: # Only run this job when ...
  - changes: # ... roms/edk2/ is modified (submodule updated)
-   - roms/edk2/*
+   - /roms/edk2/*
    when: always
  - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
    when: always
diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index f66cd1d9089..7bc96a29366 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -1,10 +1,9 @@
 docker-opensbi:
  stage: containers
- rules: # Only run this job when the Dockerfile is modified
- - changes:
-   - .gitlab-ci.d/opensbi.yml
-   - .gitlab-ci.d/opensbi/Dockerfile
-   when: always
+ only: # Only run this job when the Dockerfile is modified
+   changes:
+   - /.gitlab-ci.d/opensbi.yml
+   - /.gitlab-ci.d/opensbi/Dockerfile
  image: docker:19.03.1
  services:
  - docker:19.03.1-dind
@@ -28,7 +27,7 @@ build-opensbi:
  needs: ['docker-opensbi']
  rules: # Only run this job when ...
  - changes: # ... roms/opensbi/ is modified (submodule updated)
-   - roms/opensbi/*
+   - /roms/opensbi/*
    when: always
  - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
    when: always
-- 
2.26.3


