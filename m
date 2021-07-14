Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395DE3C86A5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:09:43 +0200 (CEST)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gW6-0000Rr-7y
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUh-00064g-SR
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:15 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUf-0003rH-Ig
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:15 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d12so3593867wre.13
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rz4HF13UL2VWdnwq1nt65tHpQIxllRbUtKus9j4K7Ew=;
 b=veRAS1iS4K0AV3Xw9SpR+XuqUhvBTMeYtNP+6IFRZdePJlzYMYNrcMmfqrB6oYqXDa
 Ke59pNLgtH64U5X+H8xBlR0+7uMgBmOg/gToqDW7QC7UukDxt57RhhSBLFQm6FK4jW0H
 6aP3QRCTVIJ2yjjFUPA+70sjpS5XfQaCMHShYP5O7cfYqPkKL4XdRXu7VY4aiM8tawtW
 7cUDoIOU5eSUpjt9BDLlcZusHhjNPapHcca2NNXd0VFBHvy+DEQFSVg5bT+je7BzS7Od
 pmZOcDqeDqkLlzcTDvbfZvHWsDfO2/2IuuH1yH535lvHVOzvlVp/jgyrE4m+W0VvFhxx
 w8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rz4HF13UL2VWdnwq1nt65tHpQIxllRbUtKus9j4K7Ew=;
 b=TBJy1nZeWmz7ITpFp3Fv4mHTPZXbhbC0vRYjgNsTLKVzmXFZ/e9K5wDqGiFv+kkUWY
 VpNAnOFiOyjShTDmyZTFeOXknZxi7N0QyyklHZCSd8Oi5T4sbmSJ02TG4zbeytwP+gNp
 ZzksTqsCVL5nQ4qN5oSMBlPx6r/eYAPRAiSabYjvE5w7y8R9mCap9kqlm2SwrxuUT7Eo
 /qFLJlUhLKvFcOaNACBLLvlmtTHH1uZsuuQOqau8vFE+gQ70AZCmo5RS+gLNJqbR8GMv
 Q4lEnuppz51wk2VqdJrEi8EU1E89EAbRJT5OyHKN972quA/kzgdW8s4Ghd7UHlm7z6du
 wjIg==
X-Gm-Message-State: AOAM533REEhYPSH1LuHqhJ5kz0vLX6C9xBFdbiXw+oLxtf1Excl3oLBQ
 5RolJTugAjlDubsP2UxLBDdz+w==
X-Google-Smtp-Source: ABdhPJxiPkfdpJQn8RlxEkcMnYtMwiZx1G1gANBz0R/2eAOsdsEGexuJ2AvPmbXmAjovw0NyGH7uNA==
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr5956404wrb.172.1626275291779;
 Wed, 14 Jul 2021 08:08:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j16sm2951355wrw.62.2021.07.14.08.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E81F1FFBC;
 Wed, 14 Jul 2021 16:00:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 34/44] configure: add an explicit static and plugins check
Date: Wed, 14 Jul 2021 16:00:26 +0100
Message-Id: <20210714150036.21060-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
index e2a353ce1c..2c39ccf8e1 100755
--- a/configure
+++ b/configure
@@ -2197,11 +2197,14 @@ if test "$modules" = "no" && test "$module_upgrades" = "yes" ; then
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


