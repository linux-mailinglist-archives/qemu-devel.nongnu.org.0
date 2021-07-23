Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3BE3D3E25
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:06:39 +0200 (CEST)
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ydB-0002si-3r
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yap-0008Se-Hk
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:11 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yao-0005La-2j
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:11 -0400
Received: by mail-wr1-x432.google.com with SMTP id q3so3163097wrx.0
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yU2732V3wVHA/xI2IEW4PTiOjjz7ObznR5YyscnHajw=;
 b=NFe9ehn5Lh1+BL/MP+VtNJRxY0dBcJgznSMOYhBI2JiI4rzanHC8KcE5L58VBEs20m
 3UmPD1KzYuk4hN68LlFOwptHT/c685BH0cAUzcf+xoGAqQ7UmbmULxkIje1NmB6XBbm6
 6/a5xbu56SHsEE+3lQDW+h2PuUVUkLjt1SIhZeIKh24D1iOQS0d23lMmVrihWqIlr0Zw
 ZByOC5hoyb3hnQ8DvNCbO4HSag45XXgwJppXVXRXsu7p45dJ+A2Q/tjj6YvIklz28xV8
 PSggTel4639Z58pyo46EgKGkFRgf3CEsvAgdiX69FYMtn6NN0d8hl8equgKEoYE8cpJd
 vheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yU2732V3wVHA/xI2IEW4PTiOjjz7ObznR5YyscnHajw=;
 b=o/DEvWTKfuqZc4cpvNnAP24eYILtmPaERTSsmjv1k/DcnEFva1N6SGSHq7/dMgTklt
 QCcvBpw/4MpatXDyYTEYki814Yi7tvUx/nddcFyovBSsBNZ4HySI6h0X2Qmt8UXwEb96
 9m+QHSleA+Y9SX5/AiflhQq0zni31UzH8ck5k58qhsMO/R9PJK20+doBPSzQld4GP2Pr
 RLPkEAGlzhp9MUgrsUocU6XW3B2a6pMq8GOdk1iqRBcG9ynk33mc7bx0zYFZglyejT9t
 kh2EhuK6kjTXNMwrLbx33wPLtZcJLqZhTT0RT765U2nlWOMOZ4u3AXPRm6wtcaMU7X8J
 D/8Q==
X-Gm-Message-State: AOAM532udSpdo37+s9V4sZ/qwUFg0CAr87yXXbnRrNvlAsypCjlA8i5Z
 mbLRf08LVxXvMAucQpnmT9Ry4A==
X-Google-Smtp-Source: ABdhPJzmv6nDdVykExx4ec4jP6oW+MufZkn0V5P/rO1TYW/qD5TPUkK1H4UYj2Im+CCJjmmolXrAgg==
X-Received: by 2002:adf:ce82:: with SMTP id r2mr6476428wrn.161.1627059848459; 
 Fri, 23 Jul 2021 10:04:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e6sm5597400wme.28.2021.07.23.10.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6007B1FF87;
 Fri, 23 Jul 2021 18:03:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/28] gitignore: Update with some filetypes
Date: Fri, 23 Jul 2021 18:03:27 +0100
Message-Id: <20210723170354.18975-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

Update .gitignore to ignore .swp and .patch files.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
Message-Id: <20210720232703.10650-2-alex.bennee@linaro.org>

diff --git a/.gitignore b/.gitignore
index 75a4be0724..eb2553026c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,5 @@ GTAGS
 *~
 *.ast_raw
 *.depend_raw
+*.swp
+*.patch
-- 
2.20.1


