Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9526F3C8AF9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:33:06 +0200 (CEST)
Received: from localhost ([::1]:48096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jgv-0002Hg-KT
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVL-0003UX-5Q
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVJ-00020z-PB
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:06 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r11so4351966wro.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=esIygr0E9T94j67boLNWQxTQpKP1kT5Tz5kmDwipelY=;
 b=ryVyDvzdctBufGibagFnA7SHtJGHxjGenjQoJEWdkgHZwa+8Cvq5br0u52Xy4Vh3S8
 WJT6axb+OiCXJGbpCIEPe3iR1pqz2IG2+d0ADOcEEZMp4DaGzdbWXB5YmnNkKmt/VGGO
 zkQ0wKv6A9i59HDopaZK4V6IuF+dngJhA6ZZ0Wk7ke/cx5HTM8QPKLGEwfdrTkD6i3qQ
 9P1twRUkXj+a5lWTpTi5pF1oBwpBTTYKHmRYdYbk7jTjcwZLYCdFaJwuAbf9XK1Vm2WC
 87LAcd/r5Is2odY1e4fggIUXTeuEhM1DGzmv+G7z6jWfHwhbpNoBeJlD6u+oSPHReF/A
 2xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=esIygr0E9T94j67boLNWQxTQpKP1kT5Tz5kmDwipelY=;
 b=Rf2P0p7aARkCGUpZyGeOwok+UICNVtprB46TKPDgHHJg7xxhI+E4mlJdMLQhcJ8Dhp
 oWuFVkWgTLiCbL7oErTlc78cmI6/vZwbdn3ybL9AimWGZVxwgN/hJTgNY49ZyP9/vnuM
 fyQQwDpySd73zjGsTjWlq9QAVUDz5DN0ZZH9ARtLb1S6nxtutwfln+wI5dOP3vzwsXNX
 kbyNS12WJQ9GES5UIZMnoOCQ3vrJG25IuVDwUXERbl+tHGcJolhDJzXiOeDbd0u5znEl
 SMx8kfgtN07Wvzb0biQt15HpNL6r7erq+II6UA3GFaMlEUC8FFnOvKSlMPKFtv5tG+IZ
 rRbQ==
X-Gm-Message-State: AOAM530QPmAaPQ1b2Kklms++kXaDbXmMw4cPD+NYAIFfqySSkBPS0a0n
 IX/rz7EYfRLi+VPEQSd0Wg6j+g==
X-Google-Smtp-Source: ABdhPJy59pFfWg5LomrZZbcWaSai0BuefS5MQ2jNZVEE4RrF9Q3b11uy6Dsl9zSe3kasFMBibz0SyA==
X-Received: by 2002:a05:6000:1048:: with SMTP id
 c8mr14380181wrx.202.1626286864401; 
 Wed, 14 Jul 2021 11:21:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p8sm4820363wmc.24.2021.07.14.11.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08A7C1FF90;
 Wed, 14 Jul 2021 19:20:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 04/21] configure: remove needless if leg
Date: Wed, 14 Jul 2021 19:20:39 +0100
Message-Id: <20210714182056.25888-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was pointed out in review of the previous patch that the if leg
isn't needed as the for loop will not enter on an empty $device_archs.

Fixes: d1d5e9eefd ("configure: allow the selection of alternate config in the build")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210714093638.21077-5-alex.bennee@linaro.org>
---
 configure | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index 4d0a2bfdd8..013f327f4a 100755
--- a/configure
+++ b/configure
@@ -5083,12 +5083,10 @@ if test "$skip_meson" = no; then
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
2.20.1


