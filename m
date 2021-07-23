Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1DC3D3E2C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:07:44 +0200 (CEST)
Received: from localhost ([::1]:43870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yeF-0006O2-70
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yb3-0000BJ-3O
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:26 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yax-0005Qx-B3
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:22 -0400
Received: by mail-wr1-x430.google.com with SMTP id b7so3073468wri.8
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TK26LfdZXPpYghFl5vK6J3cYjHv0xRQAKz+x9nOqQGM=;
 b=sErB/vXo/zW4jdgBgNGFj3S9cEt9H5TJIHtPniR8qfN5MJbVrmXZj4NfCSr0em+/CO
 FrVqWVu3890HG4ByDuJHEx73CsvdT8KlmDHLHeOc7G02rJDK3Y7DZSge0RjM2B3pc0t3
 nTo4ZvqoxTlUseexOe/wKef1/phpdAlim5EaRQzsRM3dTizFi1qgYakXqpwemT1KwVmC
 Xkp/YBgp2B+e1M3mtUvgytiZLMpxSr/oMfnleCVY8Kw0g6FQ8z6NsuNckwaK6zCyHFfg
 Ef0awaBsWHDsNmS8EMf41z66dTtCaYTVjTsi6vKpULz6mM8HnoZ1VBNTYQnzDsv9gQCf
 AM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TK26LfdZXPpYghFl5vK6J3cYjHv0xRQAKz+x9nOqQGM=;
 b=b8LKoFj1XnRBooKpDC6OMenRNH22m5Knn4R696calwzUxbit/dPg+Bt7/HVxu4ZPgg
 LLjPyDRHSYs7GD/1TlMtD0DmdNmu+Aw3GuQmegYGFlnah20Du9q4/139j0jZLo7a1eCe
 1IgXtTr4B6JWhFYus3rH0cbfFOnwDnHFkZa+ih/MQfc8LLJA9iwkVwXogkY19kOUMh48
 iBzHJZdeYwQmHNZLD6gMAVlH+rClu014FEWmuTcybFgSUQ4MrleYdiOJOTSBLQwseDD7
 7bm/sWUFRE+fGt93n5cEt5E/JIxDz+S+Cey/rgNHztb6FkGueVtz6Adr6td3H6zih5O0
 QgiA==
X-Gm-Message-State: AOAM530qtlrPeleXphJCgTLFhyVDlAmRvCP2TOZy46FAMZKlGj1c3RRD
 sbtc7h7NtVvOSOE/0i88ScyM5A==
X-Google-Smtp-Source: ABdhPJwEMryTVbuWE74Qeb6kbwLdXahTmbMT04fI8HfHYw2zXG8GdCCfGfA4xpvvw9Z1zA4xScJOew==
X-Received: by 2002:a5d:6148:: with SMTP id y8mr6405511wrt.20.1627059857651;
 Fri, 23 Jul 2021 10:04:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g3sm33488345wru.95.2021.07.23.10.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A234A1FF90;
 Fri, 23 Jul 2021 18:03:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/28] configure: remove needless if leg
Date: Fri, 23 Jul 2021 18:03:30 +0100
Message-Id: <20210723170354.18975-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

It was pointed out in review of the previous patch that the if leg
isn't needed as the for loop will not enter on an empty $device_archs.

Fixes: d1d5e9eefd ("configure: allow the selection of alternate config in the build")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210720232703.10650-5-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 0005cd140d..69cef68861 100755
--- a/configure
+++ b/configure
@@ -5103,12 +5103,10 @@ if test "$skip_meson" = no; then
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


