Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB6125C04E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 13:28:28 +0200 (CEST)
Received: from localhost ([::1]:47242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDnPn-0004aw-Ho
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 07:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kDnIx-0002hm-Td
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 07:21:23 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kDnIw-0007aD-2e
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 07:21:23 -0400
Received: by mail-wm1-x342.google.com with SMTP id w2so2494747wmi.1
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 04:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ol6/8ZnV+hKUM+GEucApUlAdOvqwrc7UlycrSSBdXg=;
 b=ykEB5jKkuQonv4sTg8MopB9Qu0oWWXi8OyApbAPA2tENo5DiVVBF6ft591aq7oT8hM
 HkaxtpsH2jGVsbG66BKRNfZJIPiNgVSauliyC5hI+Hx2DdEsQPg//k4AFA7wBFpxsitG
 1M2/1YLvaEdN5/sCIiYvjrhHoUHyKIBgnfhA29twUImbngfHLm4NxFSfFx3SB6cHRqHd
 jyqJ+2cV3qI/KsWUZqQPflM4Izi2rjUCUAUPcBD48qA7WZlhYlzOi2epg99Ssz9XwRhG
 pHu9RxVHOmy/7tnsX0IYFjGj3D1x69gZCe3CQpz0SvBHk4NXIWrcSADvXC/LmdOL+qlu
 UafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ol6/8ZnV+hKUM+GEucApUlAdOvqwrc7UlycrSSBdXg=;
 b=s2zZXLpuPkFTQFrUJqCJu7hgu2YL8INaVZrPTUASxswTedLZ2J+R9uKaE8Eut/RKU2
 drYwejVOE2sK12ES4r0WtEnPKAxvsNir4Jq8T7u+gMYzuo85JnNJR+1NeV5+c7cjKLaK
 c2WMaH8lxHS5pFt6BklKJh7YsRjCoODmWD19qf9d7YtSwqN/w3mrlN6G0T1jWk/3yLQR
 zexv68PtPy/48GiNoU+3vsgvC1Sr50CIr3VplGOlIBVlYo3pOqVVjhWTYSiUQxEwhdWt
 JEOo8qFHJJ+mKW0KBg6R6/IoJ2kuOz2cSs9M77TrgzOrjygtcdpAI0EOuZcm9LpB2ogM
 w8Xg==
X-Gm-Message-State: AOAM532xhUzOni0jiMkt7LcaHfoHtbxoTXn62o+ZNo51Czj99jil+Dhm
 IuwVVv4DjgabF1oVlxB0jGkVcQ==
X-Google-Smtp-Source: ABdhPJy+vfqskttAxRksrG9mUbClhfOiLwCn0V6rE08FXSJWqrt78XL7wOCuhFXNiiSFayln0B++BQ==
X-Received: by 2002:a1c:4e08:: with SMTP id g8mr1935906wmh.53.1599132080719;
 Thu, 03 Sep 2020 04:21:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g8sm3912454wmd.12.2020.09.03.04.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 04:21:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 58EC71FF92;
 Thu,  3 Sep 2020 12:21:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/8] tests/meson.build: fp tests don't need CONFIG_TCG
Date: Thu,  3 Sep 2020 12:21:05 +0100
Message-Id: <20200903112107.27367-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903112107.27367-1-alex.bennee@linaro.org>
References: <20200903112107.27367-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the tests build only softfloat.c no actual TCG machinary is neede
to test them (as is evidenced by GCC check-softfloat). Might as well
fix the wording on Travis while at it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml       | 2 +-
 tests/meson.build | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 1d0ade0a133..65341634d02 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -138,7 +138,7 @@ jobs:
 
 
     # Just build tools and run minimal unit and softfloat checks
-    - name: "GCC check-softfloat (user)"
+    - name: "GCC check-unit and check-softfloat"
       env:
         - BASE_CONFIG="--enable-tools"
         - CONFIG="--disable-user --disable-system"
diff --git a/tests/meson.build b/tests/meson.build
index fe2c6d8e6b6..bdcc5d75293 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -7,8 +7,9 @@ test('decodetree', sh,
      workdir: meson.current_source_dir() / 'decode',
      suite: 'decodetree')
 
+subdir('fp')
+
 if 'CONFIG_TCG' in config_host
-  subdir('fp')
   if 'CONFIG_PLUGIN' in config_host
     subdir('plugin')
   endif
-- 
2.20.1


