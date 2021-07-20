Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1933D0574
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:34:03 +0200 (CEST)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zFS-0000J2-3h
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8s-0003Ck-JD
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8r-0005bR-1L
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so2386066wmf.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vdy3N2EOhPTMwNJKyEghmnE7ZwP7wniHw5pSOd/v6nU=;
 b=o3Egk2CxXzvCvlFPINQi1gBYIDAki9ArcjKAkQDdYXhG8bfWrmfLjZ0BkktJ6O1UOD
 iHjKxh7EDQOkimrfjiwQneg/rZGWbX4GhqItdXQsmV+Njcw6Ii7BubowcQC2CWjwMD8C
 zoXE1wHw+Tyvp+Rznt0K3FRCxEli40wjP7WfFPULNiMcJQ5OQbUPpnTpYNVWFSQO6d1j
 M3RkG3d7/tQpCssx/iln+UH9o3zJalZoThKyn5ztMF549zIUq2DEg9yNMe8x16VC0HG1
 evYYEgEJCqNTNzTd2AMatSHPEELup6rlsA9YUsMvGC9x40r66y5FgezzFHwRVxCAHYT5
 rXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vdy3N2EOhPTMwNJKyEghmnE7ZwP7wniHw5pSOd/v6nU=;
 b=f55haBVok3hQ32zAVwH5gXJl4Zh9IeTAkZcUkWnQWQZQEKWH54LRHT8OLLqLJUkhkS
 kzfSiq+mkAUWHDnOhBdBHEyoRRBXajuOAdOivaN3WQuAkKbI+YXCnej/kB39Ko3vwIKd
 IuPWoVi5jFPOKdZyXdtl7V5ci/J9Rfmt/z2nU4DgT/WzimkmLMJcOCS1r+bemvDO0U8W
 PNN3XL0a5SBkFaNK20lFceKW65BoEFK+oS9X3qaXi9j44REJ6+VUX+S7f1MxMJ0k3nE4
 J0wfRIRdBu5goi8kwmBJpEPMWZYRJzzAVVl29XXU/9VuUqhkCB2PgKY0t332wfggKps+
 Xi+w==
X-Gm-Message-State: AOAM530i9c5U9MP5C8afjqiym6wublA5ugcjkcGvWfsZfhLPTmnY9vqM
 oDKgWEPynj1/rzkyWM7bjhgKKA==
X-Google-Smtp-Source: ABdhPJzini7YAf4yWj64GYsuFk/F6mKIMuP9GDF/aTwlQcAjuoDWARzVn5//GiErxsWwNDZrSvG/SQ==
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr24049224wmq.52.1626823631691; 
 Tue, 20 Jul 2021 16:27:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e11sm30915462wrt.0.2021.07.20.16.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D8831FF90;
 Wed, 21 Jul 2021 00:27:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 04/29] configure: remove needless if leg
Date: Wed, 21 Jul 2021 00:26:38 +0100
Message-Id: <20210720232703.10650-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was pointed out in review of the previous patch that the if leg
isn't needed as the for loop will not enter on an empty $device_archs.

Fixes: d1d5e9eefd ("configure: allow the selection of alternate config in the build")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210714182056.25888-5-alex.bennee@linaro.org>
---
 configure | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index 232c54dcc1..05d96afc17 100755
--- a/configure
+++ b/configure
@@ -5120,12 +5120,10 @@ if test "$skip_meson" = no; then
   echo "[properties]" >> $cross
 
   # unroll any custom device configs
-  if test -n "$device_archs"; then
-      for a in $device_archs; do
-          eval "c=\$devices_${a}"
-          echo "${a}-softmmu = '$c'" >> $cross
-      done
-  fi
+  for a in $device_archs; do
+      eval "c=\$devices_${a}"
+      echo "${a}-softmmu = '$c'" >> $cross
+  done
 
   test -z "$cxx" && echo "link_language = 'c'" >> $cross
   echo "[built-in options]" >> $cross
-- 
2.32.0.264.g75ae10bc75


