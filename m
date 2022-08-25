Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2125A156F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:17:18 +0200 (CEST)
Received: from localhost ([::1]:49664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREbd-00009j-GR
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERx-00049V-1u
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:17 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERr-0002MX-Qp
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id n17so392160wrm.4
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=xf12vm2J9pTBvB1Rs+/alRNUQSzG8ZNSmZQQA8BoXwU=;
 b=G9IBdo6IQjSpmZ0OrgRGeMhKzlVAFsnRvNSqx0o6ZyIvAJWq/viaykAF+GpABVTRTm
 CkbLTV0REb8uAVFxJCmRo2XloXCuDF+FmKaDH1UZCZK5J4LBg/zsx/+c7YOqp2ynWcjg
 7fJDUEeLqs9mL34c1WlGKAxz/x+KMHxz63DW/08h52+YXhi08sUAY8IkUYsKLdfwC8Zq
 2ec4+mtT613507llsPBTzlK7HUi3BwPTWSPa3SPrj4TVZiNmbMPQt+pa5+B3NRTqaaKw
 xSvq1cqbkavYTP+l3sUp69LGoD5kyEdMFA3oLRrQUkGfQpiy7W4+59e1ENZ8TIcv6F7B
 NBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=xf12vm2J9pTBvB1Rs+/alRNUQSzG8ZNSmZQQA8BoXwU=;
 b=tdOdQvyKIfLbVXwMx88fFMaS94SqyxXlSm/TrT3TsEY+rPie+TJmN7V9QhpEhEOekX
 esDzrMYHGvHjnMf7A78hlfFiftEubkl/oXunDq+dUFBRQCqI+Fq5YZ4pncZyf1RPdvIO
 cRJzrk/V4j/d/x/hfJYfXwXpjmPrVgCGTcTn0pt0iN/yAMR3zAW1P4QiEdSymwuRxNUL
 FQY7cZTf3gDCJNJ9DSgtz9CkvjpbZem/OBkKo03PUiYloR6TLSc4W61zotGfE4Q7RcBi
 nYZgr7q8fMvAdox6lvAhchaN6YFkeag0rMzXXux7Jdm7f/CKIqtS9w8slzICS3PlRsQq
 plOA==
X-Gm-Message-State: ACgBeo010mZjE03F3puNpr0SbBEXWgRJyhkq073uM/dpsutVtBqcUXwc
 4qBkIK4LA0RS6PmLsvOMtC9nowRjDx3d+g==
X-Google-Smtp-Source: AA6agR6K4UYKghxxH+WspfKZ+evlmvg6aHh5h3xsUcdjhptCGXvsR3yqOsi/NPsuS+J6zhUCTo3Gkg==
X-Received: by 2002:a05:6000:250:b0:225:624b:13 with SMTP id
 m16-20020a056000025000b00225624b0013mr2460816wrz.127.1661440030511; 
 Thu, 25 Aug 2022 08:07:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bo20-20020a056000069400b0022585f6679dsm1064638wrb.106.2022.08.25.08.07.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 08:07:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] configure: Remove use of backtick `...` syntax
Date: Thu, 25 Aug 2022 16:07:01 +0100
Message-Id: <20220825150703.4074125-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825150703.4074125-1-peter.maydell@linaro.org>
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's only one place in configure where we use `...` to execute a
command and capture the result.  Switch to $() to match the rest of
the script. This silences a shellcheck warning.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index d5b6546ae81..5c1992d5bce 100755
--- a/configure
+++ b/configure
@@ -2317,7 +2317,7 @@ LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
 for f in $LINKS ; do
     if [ -e "$source_path/$f" ]; then
-        mkdir -p `dirname ./$f`
+        mkdir -p "$(dirname ./"$f")"
         symlink "$source_path/$f" "$f"
     fi
 done
-- 
2.25.1


