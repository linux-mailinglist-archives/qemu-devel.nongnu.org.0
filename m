Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D13426ADA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:31:11 +0200 (CEST)
Received: from localhost ([::1]:48848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYp1q-00066Y-Mm
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYows-0002wU-IC
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYowq-0006rH-Ne
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id t8so29476790wri.1
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMmeyhB+N7zk91H6V9iKKmYMPFJOsMjTkfaY9u1DH2A=;
 b=hX/HcBVx0wcPDBG0vo4HxTrxmMHLZUkbHR3WeTQZR+3b9R4Zeoo9qI6NdfceyDA2DA
 aC/NkgHfcgNGadlYmsCoPT4/VjvXj9WS/ZxKCSC/t0n0PkIswRR8gBUmtCM0epnr2Ow6
 l9ZPASkxXHJ5xDtuhphcXOQhNjvroQ8jVECKj5xxIwnoTpsapZCY2mRcx9qnTGbtWXew
 9z2+y60Vdp3gHHjF+f8UmhOBSEdLpsT7E/MwFPW998WU/WcZMkPyIUvoXP3CoCIpjE/f
 Qlli2C1e71i/QRc0bU9W9l3Sm4kXkS5fzerWIlgMfl2OKeIWEIaUJg+9LcGzxDaZY1SS
 sLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lMmeyhB+N7zk91H6V9iKKmYMPFJOsMjTkfaY9u1DH2A=;
 b=6WEeiKdX1nesfOyiDcJ7TQnfcDA1ZIevXiR3duFK3vECoWiA6Zc8sWKteMhgz+po0y
 QSFlK//gSCeLHgmk3ObTNER4qqUlc/DuWS/UKw/RhxY7GBJeTZTtpoZDfLsasv3FIocq
 sPPCXS/UtTCX31rmFfzh8TsQNfyFaa5usYbtEC8/kMMYaWhZQAjEFlBRzK00tEDQmmsI
 ZZM9it3qqmojtIPOmZv8x3SUn25iaw4geTvXglwuLPl//Fj4QI4bDfhu75DJpyOtozHj
 n5zw524gqE/DQvzXHCvU4NAQPu4tMD5zAVXgS2uK37abJ2jvBTczd+HJFB0IyHOcxio5
 pV9Q==
X-Gm-Message-State: AOAM531kd+rccqwU5dIZtK0GCEkACHIVyA0++WMRQSY5t3bJJwH5OSnD
 rREwDp5FWObuf/BMA1RrM+7hTg==
X-Google-Smtp-Source: ABdhPJx84HQ5xMoWEKZRpNXkWjaBFWGf+p6zCC+yGGKOoJREoCwPIOZzTgHQsnBxR12E5PKOUmsO8g==
X-Received: by 2002:adf:aa99:: with SMTP id h25mr3694648wrc.271.1633695957892; 
 Fri, 08 Oct 2021 05:25:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm2592886wmj.33.2021.10.08.05.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:25:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 444391FF98;
 Fri,  8 Oct 2021 13:25:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 01/12] configure: don't override the selected host test
 compiler if defined
Date: Fri,  8 Oct 2021 13:25:45 +0100
Message-Id: <20211008122556.757252-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are not many cases you would want to do this but one is if you
want to use a test friendly compiler like gcc instead of a system
compiler like clang. Either way we should honour the users choice if
they have made it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20210917162332.3511179-2-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 877bf3d76a..e2750810e2 100755
--- a/configure
+++ b/configure
@@ -1686,8 +1686,10 @@ case "$cpu" in
     # No special flags required for other host CPUs
 esac
 
-eval "cross_cc_${cpu}=\$cc"
-cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
+if eval test -z "\${cross_cc_$cpu}"; then
+    eval "cross_cc_${cpu}=\$cc"
+    cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
+fi
 
 # For user-mode emulation the host arch has to be one we explicitly
 # support, even if we're using TCI.
-- 
2.30.2


