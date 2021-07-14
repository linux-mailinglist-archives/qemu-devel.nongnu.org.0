Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CB83C8AFA
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:33:17 +0200 (CEST)
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jh6-0002cB-5e
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcE-0002sj-TL
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcA-0006ao-VV
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id k4so4378098wrc.8
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MahSUq7EJua5My1f3HXZ9H/oUpbvLVcnEDR+GKXvQJY=;
 b=UghS3sZQP4VoPUB+lxdFz2f8Mzxa8JxR/BxPI3WTL7nPnXiFnRODlib1bxmKr+tNEV
 Z1DpmvyUx5vCJmyVd0x1Cj1xYG1D8ljOYElXEeZFxurfwmFi+mblLnfd6SgpHTgXFbna
 F9jsoxjmtCiIPBjrz+Gd2cWXWt0GwXD/uGFYtm+7rKeUmJtFegfHdtpYsyF2iW4Md0bW
 T7Cpph77MG99PDWYoeaqu9t6mMlSuolQLNb05FRM7YkLWjIU1AbgsD5/+Y1FtG9nG6r8
 l40nsM4+y+aRPc6JNP6zEeIUdVSt05AsK6QQADVjhquSaY7Z4HfFihK1Cf8WodE7s5I6
 HBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MahSUq7EJua5My1f3HXZ9H/oUpbvLVcnEDR+GKXvQJY=;
 b=i+G/cNcxUWZrFITlLTCVahuFCc6sy4iDITOWKGyvmcOMn0tTUbKWrIKwBwoW31pdy5
 xqO52J5pQxZU+shdMBXJoHTuRlsGSZMdQcZ9J5cJIPgrI6lqmXy+V445F8Zhy685ugYg
 uBsxEXUvVMoN3S2pK6SIRJZRAY8ELCHlRGF3pteS2nhFPFHYcGq14gf+5Wq93eGuQ9bF
 LVFca4V7QlBX5i6/RUvn5Ta/kKYcab/Bt1CQnSStAt7u61s4fCaeJpDYpoISISiu9G1e
 DEfne/23jLxSid8NVoT83nBg4RCOU8RYWeJ4oWxXhDeubXXqkMJrqq7BQ4uTGItByenv
 WspQ==
X-Gm-Message-State: AOAM5324Jxw41umK0y9xaneivG92cBJ7EhEFtRWZoZmLIkuc/Ui/RRdk
 nnQDDxnN6mO32xaz1RDz9XlKvQ==
X-Google-Smtp-Source: ABdhPJwDRPeQcIsd77x2yIa7AweInUJa1Tl4n/Pxv8ETi8wljsi8p8PTFUVW2wh3jwB6MverP/fZnQ==
X-Received: by 2002:a5d:68c2:: with SMTP id p2mr14170684wrw.27.1626287288658; 
 Wed, 14 Jul 2021 11:28:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z11sm3382375wru.65.2021.07.14.11.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:28:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6DEB41FFA9;
 Wed, 14 Jul 2021 19:20:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/21] contrib/gitdm: add an explicit academic entry for BU
Date: Wed, 14 Jul 2021 19:20:54 +0100
Message-Id: <20210714182056.25888-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some reason Alexander's contributions were not getting grouped
from the plain "edu" mapping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210714093638.21077-20-alex.bennee@linaro.org>
---
 contrib/gitdm/group-map-academics | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contrib/gitdm/group-map-academics b/contrib/gitdm/group-map-academics
index bf3c894821..44745ca85b 100644
--- a/contrib/gitdm/group-map-academics
+++ b/contrib/gitdm/group-map-academics
@@ -16,3 +16,6 @@ cota@braap.org
 uni-paderborn.de
 edu
 edu.cn
+
+# Boston University
+bu.edu
-- 
2.20.1


