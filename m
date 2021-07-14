Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC843C81E6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:42:51 +0200 (CEST)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bPm-000253-GJ
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK0-0001wM-HU
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:52 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bJz-0004IJ-3H
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:52 -0400
Received: by mail-wm1-x334.google.com with SMTP id k32so1152399wms.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1YFfcNF4LkvFeRrj0McNGwJ95momCe8V6bBvEw7Hvfw=;
 b=xYkxTyvnCvdi1YnORgUQT/fvH3qmuj93dPc8DkXCT/c+/2pjVpaIoP3Gz2GMhf9eLm
 cYQXIsWudS5+OXvtkNOHCezFZPCMK9TRF/+W3vhuHvEXR5Mq0uVQsbtxalL4PiR8ul1i
 qMn4lqFgtyH5QS7lo4fxBtpwvK0tf7MwYmzK/HmLC41HD/9axAr9bIUCcmM+VEb6DFGf
 LULvgJpdxnMk89CjIHiIkwb1CywFEoRA0gLtKQNuqRIHu985N8S6sW8qCPNniiovBbzu
 YJLTNC+ARkdGEM8i8WpL7S8evr/Lo8mw3MOfdrY7tXGo1wvIYpu6pDSPXGQiFEkDwe2Y
 /n7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1YFfcNF4LkvFeRrj0McNGwJ95momCe8V6bBvEw7Hvfw=;
 b=ikfIMUw6oxpk01BzboQKmelB6nup7AcnkVqVFmyztZhfELOGfSFTstHpRKQQXMNhpX
 NBFXAAhQvIGnx2ZU8guNCAkALIqMOWjtB+Pl53K0nXB8nwzheKbbdUIfVWBsAWx513Aj
 4zh+IDnA5RRMpuPqFELWg7B+TVZ4Lba9PW9QizdNHJ3jp6Rv/Xx9ccJiAz4ahU3+DXpC
 K86TJGCOv2eIP6YFzZ5Dpwis+Tu19vki/r4ssorrrnYv+6KIq3KATBUOjwkbO/sIIMC7
 bo3kRw/ckB7rF/01cCjs2oSXlV/WuK14A0SbP+mvVH9fcdn2hDzFz+JvK07KJAr6XD6v
 6LRg==
X-Gm-Message-State: AOAM533rQ1fg+mrR6P+A4OCRgIAtUUJetaMTHJWYcyK+AqDa2Ak5ErCj
 AapkKW+kYF7kUPgTLTMb0dRHYA==
X-Google-Smtp-Source: ABdhPJwnaayqn8XaSFTShS/Gh4BEQ2QkV226xYuDBoc8WowIC3Ft97Qb17xSwyGRTW6PVOo1A6c7bA==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr10204188wmi.99.1626255406504; 
 Wed, 14 Jul 2021 02:36:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e8sm1991825wrq.10.2021.07.14.02.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 498BE1FF90;
 Wed, 14 Jul 2021 10:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 04/21] configure: remove needless if leg
Date: Wed, 14 Jul 2021 10:36:21 +0100
Message-Id: <20210714093638.21077-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was pointed out in review of the previous patch that the if leg
isn't needed as the for loop will not enter on an empty $device_archs.

Fixes: d1d5e9eefd ("configure: allow the selection of alternate config in the build")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


