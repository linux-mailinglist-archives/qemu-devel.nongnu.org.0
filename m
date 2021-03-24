Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2B3476C5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 12:06:34 +0100 (CET)
Received: from localhost ([::1]:36704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP1LN-0005LY-OM
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 07:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lP1J2-0004bl-Da
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:04:08 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lP1Iz-0003KT-Up
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:04:08 -0400
Received: by mail-pl1-x630.google.com with SMTP id ay2so7719998plb.3
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 04:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Z0xzCdPwJRUIKceAEOKB1kbiCBjvah4w81faIcfzc8=;
 b=DGvapLwJvU+vl/zGUgjt+Oa0ONxg2klBG2jXRKwoZiChykrnnnssbl7b21eWTdwAKr
 fjSeXFln7zbjN9GtVpLmTWuOspJ6/cXP56qzeXq6KC3v4Bhi4KKrQdNqVPV4QP/nv7bF
 +JsZuVF1rfJqoHVHnKJnfwC0C938c7j/udSb2rsLkjx02ldxdCGEt8f9UsYePFV/zNBq
 dfJUPtMTGrDJ5pZYMcYG8jlD8H2pzgu7AYCcqbZKy2OynGIfHGXxC8VN9w452zdBOfmS
 flHLS9IbvWkf0lDiuCbOy0/rH7TcBLGxHE5k5dyepUaMIqzW12LSXtAzF3ULC0PciDal
 9rMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Z0xzCdPwJRUIKceAEOKB1kbiCBjvah4w81faIcfzc8=;
 b=GHbcNOjbq0DuRiNlfxhgYubNKS6a4WH47kCyo9Smncj/5o1CXCq+3Cl0nEfC5G0LLR
 7ahX0QwKyqR8PDUTzsbeSTmbfVdzEG+4IC0hqdJEeZWI/Q0ZtovhLNfFJF+mcNxng3E+
 80aUfhWD+4XxWUjVe5I0BFI9XYLnOTDis3zH+VASAWajJlr65OIGL0cuyaz2O7FrETNB
 Ul+MlEFEp3CzKORUCCJEESHFPb33XY5q4gH++kd9U4kIJOjp8w7pDxB6uXBDtEgnpMfd
 h03OayKuaZtET77N2brz9o9XBG/LiLoART8M3yryEXg5P0TApznjr8kpOkEuqRvWzzMd
 A6MQ==
X-Gm-Message-State: AOAM531UA6KXaBlxYEtedbsjsQCRCqMgHFM3ybawbUPb/7BvsbanJpoe
 hCH8SaXjBuuJvpp9u+muz7HLxHVUYseeAw==
X-Google-Smtp-Source: ABdhPJz8s0Q1BCTCsq6RtJ6W5MAtX2e+VNDn5DSW7r4TEgA76dCijZK63wbOZbbyq/6j7gFQ1QFgGQ==
X-Received: by 2002:a17:902:f547:b029:e4:6dbc:6593 with SMTP id
 h7-20020a170902f547b02900e46dbc6593mr3043396plf.4.1616583841818; 
 Wed, 24 Mar 2021 04:04:01 -0700 (PDT)
Received: from localhost ([122.172.6.13])
 by smtp.gmail.com with ESMTPSA id k5sm2376292pfg.215.2021.03.24.04.04.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 04:04:01 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitignore: Update with some filetypes
Date: Wed, 24 Mar 2021 16:33:56 +0530
Message-Id: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update .gitignore to ignore .swp and .patch files.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index 75a4be07240f..eb2553026c5e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,5 @@ GTAGS
 *~
 *.ast_raw
 *.depend_raw
+*.swp
+*.patch
-- 
2.25.0.rc1.19.g042ed3e048af


