Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C841438397C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:19:21 +0200 (CEST)
Received: from localhost ([::1]:55810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifxg-00078k-Sk
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpa-0007Xc-9G
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:58 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpH-000636-CB
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:57 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p7so3279533wru.10
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8WpVHuD4UB9TOqFcf5IX/GBrauc6iTp1wyZlgKWXCkQ=;
 b=KYVwM8F97qIUIsPqi26bfep7FzlixrOAqigZZzY8fmb08udEXvRt2TDsTLBQxsjGz4
 U08p1SXjGj9LjwiCOMl1XOqyQzhZXZ+Nd5rvvrNyPiCuCgduSvlJh6z+AJtqmZKdyEPe
 1IL/z+h1lL8rWcaO6zEm7GuLg0GHu3A4AJsMxYswRn+GeJjecIiARlKPs9bRL2SUjp6p
 V7PS7ayzSajsq2cLTbfSai0J1t16QMGmletVCGhN9HsQr8eRsmLOUDMhrIyrN+9BU2gy
 fI3pA/BaM+RmTaaEJoK7uYTnl3/8v2RU2tHzGKveMjZKWT8VeJ9RQO5QkiFj0fezqfch
 krpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8WpVHuD4UB9TOqFcf5IX/GBrauc6iTp1wyZlgKWXCkQ=;
 b=l24SAf4cDVgPYKZYqSQ+p+rW+Zm6id029mgBu1s+S4h6Xy7R1mNULIDLmZ4Cdr7IE8
 Adii5lJFefzOSIZJRC4tyS4ETjJKPnJ88uwC7V5hgFIrBUzp+qHfbxkWClJA13ZD/N+k
 2Yi6neQkGugNgDtqYWFFXzGy+c+j2Ia1tAgvbiK7CCNWzPGhCMAoYJzAMjkRT/bYT/hI
 hNe2CCtjcmfHa4oSjkW/xxfmJdKm/7y+15Sy3mYtaHd5rSZH2Kl2h+AEQRQf63VHfFTF
 /2TC3L8zF8WgVur4iiGsqdkIk7v/4QjYvXkBfdScHSIWH36TdiTrQZicJpRxpmkQYPGT
 /QTg==
X-Gm-Message-State: AOAM532VsQ6lJkUo+sdLTiJheW+Da//hQgw+P50ud1V39+UFth/IZTA6
 gmUTA+LIQ89D+ux60/zlLbR7ReYe8+vjjw==
X-Google-Smtp-Source: ABdhPJxPV587pbNOjbteeGN/oj6lUks+o3D35+N3j6bo7P/WSluFUO/raK8dqMSzgWbhnR0RFz48Xw==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr537097wrv.204.1621267836666; 
 Mon, 17 May 2021 09:10:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e10sm18282107wrw.20.2021.05.17.09.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9BA7E1FF92;
 Mon, 17 May 2021 17:10:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/29] tests/tcg: Use Hexagon Docker image
Date: Mon, 17 May 2021 17:09:59 +0100
Message-Id: <20210517161022.13984-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

[PMD: Split from 'Add Hexagon Docker image' patch]

[AJB: add container_hosts]

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210228222314.304787-5-f4bug@amsat.org>
Message-Id: <20210512102051.12134-8-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 8f20ce065d..cf6062a15f 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -128,6 +128,11 @@ for target in $target_list; do
       container_image=fedora-cris-cross
       container_cross_cc=cris-linux-gnu-gcc
       ;;
+    hexagon-*)
+      container_hosts=x86_64
+      container_image=debian-hexagon-cross
+      container_cross_cc=hexagon-unknown-linux-musl-clang
+      ;;
     hppa-*)
       container_hosts=x86_64
       container_image=debian-hppa-cross
-- 
2.20.1


