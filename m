Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A60F3C5C5D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:40:04 +0200 (CEST)
Received: from localhost ([::1]:50324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vEB-0008KQ-3Y
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1s-0004R9-Df
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:21 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1n-0008Cz-3V
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d12so24725203wre.13
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/EqKRf54i8gl3hRcUpVK1o+1fj8ip12CroRx4jiNsRI=;
 b=GzfZ4Ypg6eJEUgXwucyKeZeTkOkkE2BvFv2O274ZsadIa3s6rz837pN4/88MAs9uCo
 ITNpus1lqL8qERrg76FId9SXRrU59p1V5LzFeb9GYoMjaGEZTwbid+PL4sFGSaZUYO2h
 PGPzMcDozTewfWQXbeVdG0Y+dXiC9Xm7Q2LBUSc9VMX9MvBG1MeEuvi4NZy6nI9Yl6vG
 KXFQEJqXk/vzvpDbMUQGy2JArg09po+hfIj9RFRRAYzC0bzQP9jg+CFSaN0wXc1fh1Hj
 aVZ+zPLKk+OjkAMoxaqiAKoXwlUTgPSx+/nglbepcTuCGCbbrenkdx/Anq8rVDq7hGOQ
 xAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/EqKRf54i8gl3hRcUpVK1o+1fj8ip12CroRx4jiNsRI=;
 b=Ql79j5akh4fZbSeSSMwx5ZdGcSAN0nkW8RBxHFYIzQ3evUXGeyw/cLuLiP2k8d9EEi
 p6u4Jr6oEw5Ee5nCLmlC1ghCAO0e2QY/KL9ge4wY09+BfPd5UVnWrM4RIsymVTkjWP70
 wYJXOH5w3U6fT+TGXC7teSwnDt0IXzw54wURPj+q7E24xqbq1YP9Ip3zmaf6FSmGVKg+
 gELiEd9aT/VmMOhi7V5Rd/EosCDFiI+yqe/SgRqPFfCYmz8PvHH7/K6YyfLEAkCHMOya
 Q0FxYxGldoCTFCX/J6uNO3JaLbP8mYxllrh98j6LlXLJF/u+72rpqoTqMK69foPxC+3y
 GWpg==
X-Gm-Message-State: AOAM530ZqO2+nEKFUgzy3XvMnFavTCNiwBmKzJ24PhZYMEad2/HlpTDC
 3EF8D5+JvJdNEGXynhQ/WXa+qw==
X-Google-Smtp-Source: ABdhPJzndsqQU50pH/XKVMbHmtpe0wCd7cqWLW9EzQzACHYDbvFcr+UgQQi5X63bjDoluVVoQRWxFg==
X-Received: by 2002:adf:e488:: with SMTP id i8mr58753537wrm.285.1626092833785; 
 Mon, 12 Jul 2021 05:27:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y66sm12813532wmy.39.2021.07.12.05.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D0CE1FFB8;
 Mon, 12 Jul 2021 13:26:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 31/40] configure: stop user enabling plugins on Windows for now
Date: Mon, 12 Jul 2021 13:26:44 +0100
Message-Id: <20210712122653.11354-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some patches on the list that enable plugins on Windows but
they still need some changes to be ready:

  https://patchew.org/QEMU/20201013002806.1447-1-luoyonggang@gmail.com/

In the meantime lets stop the user from being able to configure the
support so they don't get confused by the weird linker error messages
later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20210709143005.1554-32-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 2c9c6ab870..97ea6e6629 100755
--- a/configure
+++ b/configure
@@ -708,6 +708,7 @@ MINGW32*)
     audio_drv_list=""
   fi
   supported_os="yes"
+  plugins="no"
   pie="no"
 ;;
 GNU/kFreeBSD)
@@ -1510,7 +1511,11 @@ for opt do
   ;;
   --disable-xkbcommon) xkbcommon="disabled"
   ;;
-  --enable-plugins) plugins="yes"
+  --enable-plugins) if test "$mingw32" = "yes"; then
+                        error_exit "TCG plugins not currently supported on Windows platforms"
+                    else
+                        plugins="yes"
+                    fi
   ;;
   --disable-plugins) plugins="no"
   ;;
-- 
2.20.1


