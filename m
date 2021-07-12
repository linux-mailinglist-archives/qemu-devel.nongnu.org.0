Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C44F3C5CB6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:57:52 +0200 (CEST)
Received: from localhost ([::1]:41584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vVP-0008Eo-6B
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7T-00051B-61
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:07 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7R-0002MT-Fm
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:06 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so11396666wmq.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=roEQiiqn4/d7JzDwl79ddq61d39aQG0jRwujhTpjOXc=;
 b=A2TAQ44BTbm/i4+ic38gekCWPvmnnnQGfyw9LQJ9lHvW/lEhR9anZv7h6rDgrFaq8g
 QEj7fF2jHU1uG0Hl1RfxGITYWue5OQb/s6pqx9m52gGpQDF33+5425zcAJrCY/DAh+5K
 viMJZ2cKep00+VS8+CTPUg+dGQ1iroga2o2o/CheRN9N5z/ZD6e4K4KWi1659od0fP9F
 C86Wo4C3jYh/6gAE+8I7UyGUzExRUQMv6NnVnNHC+rGy4KNWH2MFRprFoD1ZBJLtAz2U
 SmYAyOTh/Gv5IwEKgus+S3h5edyGjcE9TtYf/KD/JZEGApyq5fKMBX3V7vBwjxf/C/Mg
 M2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=roEQiiqn4/d7JzDwl79ddq61d39aQG0jRwujhTpjOXc=;
 b=fOfUpSVqWx0yVl3C62wn9DW2Ovg628BClHq78auYUcig2ydgT2IKfjzdbyXsVRXUwd
 Y/bBi+7zPC/7Z0K3bqJYH1GSjIO/w+uTTB33mebCYLUNEJoy80w7DjFqvSy2mdtJmn1u
 QBFK6zb1gXgsA/DYITQkNpOZVH3wzuwFDlbSXqvYhH/nUneUdlvZ09HyZvVx3ZK/JrJe
 BA0kzHK0p5QBWDEyGnyvle1TMSIvr+Yzo4cczGAIMxQj9nNPhQmBMiMPeyJdd3MWsnjR
 xb/QnXw1s4EbtfXzlz7jp9Zu5GqcnSxFlzHxBzmFkQ+7QM6d9k/mWnK0ffhEXXgEPAdH
 8n0Q==
X-Gm-Message-State: AOAM533D/+0QbNbZeoE5PSybmQedTTX4ypm1/6s2Dqtm2RuHq9hih2hd
 cqqZZAJkH10odK7ehofxEbIqgw==
X-Google-Smtp-Source: ABdhPJyd5BzkMVjyz2g8mW6C/6WjDLTd5JerLOoJUXtx/GMWYjNh0SePgnCjXlpN1enGMxRUglk4hw==
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr12804461wmj.80.1626093184282; 
 Mon, 12 Jul 2021 05:33:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v11sm13994059wrs.4.2021.07.12.05.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:32:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 064B71FFB7;
 Mon, 12 Jul 2021 13:26:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 30/40] configure: add an explicit static and plugins check
Date: Mon, 12 Jul 2021 13:26:43 +0100
Message-Id: <20210712122653.11354-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Moving this check earlier will make the later re-factor for enabling
by default a bit neater.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210709143005.1554-31-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 7f906be68d..2c9c6ab870 100755
--- a/configure
+++ b/configure
@@ -2184,11 +2184,14 @@ if test "$modules" = "no" && test "$module_upgrades" = "yes" ; then
   error_exit "Can't enable module-upgrades as Modules are not enabled"
 fi
 
-# Static linking is not possible with modules or PIE
+# Static linking is not possible with plugins, modules or PIE
 if test "$static" = "yes" ; then
   if test "$modules" = "yes" ; then
     error_exit "static and modules are mutually incompatible"
   fi
+  if test "$plugins" = "yes"; then
+    error_exit "static and plugins are mutually incompatible"
+  fi
 fi
 
 # Unconditional check for compiler __thread support
@@ -3979,7 +3982,7 @@ if  test "$plugins" = "yes" &&
       "Plugin support requires dynamic linking and specifying a set of symbols " \
       "that are exported to plugins. Unfortunately your linker doesn't " \
       "support the flag (--dynamic-list or -exported_symbols_list) used " \
-      "for this purpose. You can't build with --static."
+      "for this purpose."
 fi
 
 ########################################
-- 
2.20.1


