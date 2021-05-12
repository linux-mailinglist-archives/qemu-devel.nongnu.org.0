Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F837B58C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:42:20 +0200 (CEST)
Received: from localhost ([::1]:33012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lghdT-0000FW-4Y
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghZ5-00025w-9R
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:48 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghZ3-0006iw-Ih
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:46 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e7so3751926wrc.11
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3SkTTNfbgrgPZRsbTajuJ3tzgEyu0ZeYqUT1Kjom0eE=;
 b=rzXnf0rTNzwh9xCCcC1GHTOTgwx/mlrXWoTAXJK3qe9pYBDXg7whQHHhoMK4cz4Eyz
 U33fuMAeGzSYi/WN7cLNGgqBunpRU5blkV9ggwcOmg5S+zYmGFpo/b3X5j10pjtOWxLS
 EmTGXSuybBN8lyc3pkikS0GAGWAt1oa3z1EAg8qWxvM79sZiOjanfJFmR7Lvft36GXGT
 TbwvruRzdSCMJ5v7Z/BdlzwgEoqMaIs/VrxGlkJwD/uxxQujkZlqXAhDPYMAipnUp6lO
 Kyz0ml0zoaeGCNN6gOIJUnCdoHaPcuyWKScKR70J5dI4arqdn3JtDsF10RHCg2W9IjHK
 yEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3SkTTNfbgrgPZRsbTajuJ3tzgEyu0ZeYqUT1Kjom0eE=;
 b=iVAenHwEhI+zDpXTGKTQSSTtGXZfR1d8nQCe0u9WWMUMj/Rr2U8kjM/slKKD0cACMH
 CdI67W6Vqe1/QB7zrpzPatJE+NJWCPiuZvJhnZowzdG0s1adoTDfaUdfoCF6OpfdRroY
 IXvL56wbmkhqNg3MWFguAJ6xNgXkrrzr1FQiP0BxLZOF4zVdwZ5NLNFPJTTWbNnyoLm4
 4lu+C7ambKCyfxlO+syqN7f82qp0JWf0TXTG9iB9hpqSX1/+JI8sAAUTP0fmVBzNWEZa
 hg93B9vuIg2ek1yECgZ8RbMB9XcwpGR+FBLo2yvTWFyFUfAFnzJDh4V8AH2WbfSkw5DE
 9RaQ==
X-Gm-Message-State: AOAM533iAhJjDFM9Ik/CiigXah449ob6JWsyudWU6dRmOiJeIZhu17Rq
 50M3Ntl8rJYph3Qj3ey9Uw4AnkhJcCG17Q==
X-Google-Smtp-Source: ABdhPJw9UMAu3ERUhUZ2JepIGpKR3KsFpeMKsLMIfyUnrE5204J7x8jHm4xt0ZiTvV5WJr06WSuDeA==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr43184800wrv.335.1620797864114; 
 Tue, 11 May 2021 22:37:44 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g8sm197890wmp.40.2021.05.11.22.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 22:37:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] gitlab-ci: Simplify before/after script for Avocado
 based jobs
Date: Wed, 12 May 2021 07:37:13 +0200
Message-Id: <20210512053714.3268162-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210512053714.3268162-1-f4bug@amsat.org>
References: <20210512053714.3268162-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index a625c697d3b..f968fa1ad99 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -74,7 +74,7 @@
       - build/tests/results/latest/test-results
     reports:
       junit: build/tests/results/latest/results.xml
-  before_script:
+  script:
     - mkdir -p ~/.config/avocado
     - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
     - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
@@ -85,6 +85,9 @@
         du -chs ${CI_PROJECT_DIR}/avocado-cache ;
       fi
     - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
-  after_script:
     - cd build
+    - find . -type f -exec touch {} +
+    # Avoid recompiling by hiding ninja with NINJA=":"
+    - $MAKE NINJA=":" $MAKE_CHECK_ARGS
+  after_script:
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
-- 
2.26.3


