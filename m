Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1960C3D3E60
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:19:33 +0200 (CEST)
Received: from localhost ([::1]:57752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ypg-0000wY-59
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg5-0005Uz-Dk
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:37 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg3-0008C6-HT
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:37 -0400
Received: by mail-wr1-x435.google.com with SMTP id z8so3097270wru.7
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8Gza3kNGG3LdYQ0fp2VfRIEh3K5E1XeyB7C8G46+2E=;
 b=UQp7tVbLw6f1USqk+07DwECaXoTjDkHx0okf6yv3ILitWW2iMBCbO8c19e8/kMot9y
 yYjNvwMnSCnwvAjV0JENzIZNvalq0RKEcSeH6zsUPsTeXATXUp3A+1ItYrNHBXpsKw37
 H02sSgTz2RHkIV8KarwH5Dk+5jtgABheF7n4gv/PfXUWN70N0X6f+Lllnt9h3k4KEdpO
 +tEKE7FNWnl//g7ldRYwJuoKkZ1WgrAjXuNoqhdifBp/PjMuPRGMfCqmU5CpMzVOU4IG
 mLb0WgX7K743y9WxdG/Kv5E1mEdZB816PD2lKxJFx8WfG+vAdkUo0JxHsK5wUEUvdX0K
 LSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8Gza3kNGG3LdYQ0fp2VfRIEh3K5E1XeyB7C8G46+2E=;
 b=lDUFz+JEtJTJd2OFdDvtbnZDl71/1Z1jZ66DDj2qNcUCfZmFf3vkStkleXNPEIbVxV
 LisJUJeFZ1d3az+r3R1WQyHAzxjkSw8smZwNAqSLqWzDzDzofBXB5C6beJojJ2SvoCDB
 hXMTkLafcKkyrlBbw/LOMfeT0UxpXl24Q4f9HWmU1Xu9hmCfXTp0i9Mz2sOdB5xtGCQq
 +IHDocBImHWsZPBd7dFKVDPspCcQlS/2tfHpcdFPrcmDwHi8WoQEfWyp+GjfYPw6Isu+
 UJqHRNLJq1FjpMuIsPUYLdBXzq/5BK4qsdoVo//DUb+AtRQzTQhnX0ga8ZiihC71ntS+
 odxQ==
X-Gm-Message-State: AOAM533l9NX9oYL/Nq5ZXosA+bcpwvxVGIkpy9iDjBaZuhYkvBleglPX
 bWEg7o8dpaCw33j8tD5i8Y7epQ==
X-Google-Smtp-Source: ABdhPJyvvB4+culPxJwDcC8No46y0MKMKBHe3Z8/BHh81+rVbIkPCbl3xN4/BNpNskBYK25nCw/tVg==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr6364724wrs.405.1627060174206; 
 Fri, 23 Jul 2021 10:09:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z13sm34261120wro.79.2021.07.23.10.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 55C3F1FF9B;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/28] contrib/gitdm: add domain-map/group-map for Wind River
Date: Fri, 23 Jul 2021 18:03:38 +0100
Message-Id: <20210723170354.18975-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: Ruimei Yan <ruimei.yan@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per discussion at:
  http://patchwork.ozlabs.org/project/qemu-devel/patch/20201004180443.2035359-19-f4bug@amsat.org/

I've added Bin's personal email as an individual contributor.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Bin Meng <bin.meng@windriver.com>
Cc: Ruimei Yan <ruimei.yan@windriver.com>
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Message-Id: <20210720232703.10650-13-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 41875c9e75..27b8fbdf8a 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -34,6 +34,7 @@ suse.com        SUSE
 suse.de         SUSE
 virtuozzo.com   Virtuozzo
 wdc.com         Western Digital
+windriver.com   Wind River
 xilinx.com      Xilinx
 yadro.com       YADRO
 yandex-team.ru  Yandex
diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 4ac2f98823..9b6406e624 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -30,3 +30,4 @@ huth@tuxfamily.org
 jhogan@kernel.org
 atar4qemu@gmail.com
 minwoo.im.dev@gmail.com
+bmeng.cn@gmail.com
-- 
2.20.1


