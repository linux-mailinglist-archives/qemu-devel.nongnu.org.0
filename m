Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30613C81D4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:39:22 +0200 (CEST)
Received: from localhost ([::1]:50674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bMP-0004g6-Tb
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bJs-0001rj-Ci
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:44 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bJq-0004E4-O3
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:44 -0400
Received: by mail-wm1-x329.google.com with SMTP id n4so1166302wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=07qbnshrUSR72AAoluEeIei2r45399bnXGyWSV2iqis=;
 b=ZidOLPwqKqepQQhdE9AgMozraI0lrF5BN+ZHsaMix6XKjVU5ecEGdSL8os8NLlz9Wz
 zbhK15qWDl+n8hW+lNvCUJqvHb8XbO45AqzWdwY/nvBY1/H/JtwofRnjZF363a3dWBlx
 qiyRyxdRF5mu1vbGpe3HD9Dx3motCy5SxIgPgKiDqlw4nsZVHaB+piFTpnyBBkLjF/ea
 vvucJVAM+qHVlpqgbbBcI1bCO7FWORLQlu1IEiLqgq4migetyU0RWNoeLsHCaCOKaLyj
 RRka0VVcYldnlUaJRfrgV0ZF5zLYrcfQ96IJPVyE4JII5ka7GwCro7TH50wDWorqWCII
 fhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=07qbnshrUSR72AAoluEeIei2r45399bnXGyWSV2iqis=;
 b=kITzN+C3YG8oNbdjwWI2VgwQWiSDAMthdfL0ogZpQGtZDfmQhYF/OOqv2i1y9Njt3N
 IrRNuEMDfhYQb5lgIDKJrsWnFPpXZ3u8gzzczEvAVbdojTysIcrBlali31IocEyqOQPc
 vyxo3iAIKDpCL++PuYRc1W7ASsTs/tlf1S8rm2u43qJ6BKTPX+rKRw6tdd21Dy6nv+J6
 jaRdpiyjHBAc8WDfm2uGLMhseL5I0jH4oBPjSvlY8EQvXhYsizXCE/9lq0cPv07COAj3
 819OoTwqRfJNXe5K5q5jJGrjQijQzDs3YDp24mTIfqlpls8OrkYx+ZQDW7Imsx3bFE6B
 +3xw==
X-Gm-Message-State: AOAM530CYZsEOMW3ZFRj/qKSPI/xkdfkBUemCMY1369SYF/O4XhxgcTo
 jxMUcjzlcJiTmOfwOCpIAlnF5Q==
X-Google-Smtp-Source: ABdhPJzfvLhIJh4FDssAVMSsqISatK9QI5wdLSTGIuDpY731O0Gmjh9MAaW5oPb6xFaQZphNNlwamA==
X-Received: by 2002:a05:600c:1c86:: with SMTP id
 k6mr10313710wms.147.1626255400405; 
 Wed, 14 Jul 2021 02:36:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x1sm5644168wmc.0.2021.07.14.02.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F30DE1FF87;
 Wed, 14 Jul 2021 10:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/21] gitignore: Update with some filetypes
Date: Wed, 14 Jul 2021 10:36:18 +0100
Message-Id: <20210714093638.21077-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

Update .gitignore to ignore .swp and .patch files.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

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


