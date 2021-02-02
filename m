Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EB930BFE0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:45:16 +0100 (CET)
Received: from localhost ([::1]:46648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vzX-00008P-2a
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuo-0003k7-B2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:22 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vul-0007KD-EU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:22 -0500
Received: by mail-wm1-x331.google.com with SMTP id c127so2330527wmf.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z+c1gdfURC3gpajhj3DjnSG8qvivfLcnBlGq7OtGWkI=;
 b=YZc3E3kkA2k+bUZVOWnGKn6rbeQOozsFnYxzMg2H1j8O//SE+yq3EprFIR5tEkWdmZ
 fBASnr5jXaVJBpys7IuDoBUZhk40i1orzXBZt1UezrH5WUm4CA8MPmp2h3OZX48LskvD
 EBpySlPW7vMWvMPpgrmgPk28v67IiRQJAWqDwgU7pQDgY7vPI9oomVLgFWuqUrgIP6qP
 lcx9hk/zaVEha6Wqp7j53B3ulnQaty6yFrH++zOnhp9mM5p22j/JxGHDhSVSG2S42ub3
 EhFXOaKlanh3Ves8Vg2VuVWAs41CrLMyt7WGaamdu82SsY1ite0rnWd8CL2h82m3ewtk
 rEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+c1gdfURC3gpajhj3DjnSG8qvivfLcnBlGq7OtGWkI=;
 b=Qr+clrcazt1zad2opNhq6HkSp+R2ZOWZmFkkIbue10n3b5J0UcmwyCE/Vw/KQtjPXv
 iDzRIta4qaraAdO2ERDKYwRF+OxCJeYCw/i6woe5KI1a3NwTO2JHoqPAGaLB5hMtn6IO
 LHeVcHXZXhF9hgM1pJEu3ktKDBsdxVwTbhF2+nHxSLnTjbNOm8Vj4Pg/3GTQp1vz0v+Y
 aKyyI+pbNYbkGpAKmWhy2Ch1Dn4q3iNb1LGmDnUeoFs3M2W3BQk9K57nI2VGLM0Oj3gf
 sp2/qdaO00boNT4KAg5NEOhHpChnTtSeTgrjBG0UsVhwWAvN0k35QLuigMrCgX7LBFLf
 7Dkg==
X-Gm-Message-State: AOAM533qefpz0Zf7cvl1n9adEl2By3SYScPZk7vCF3Iut9XxBrYzNwxs
 Jx/WcZ1zWgza8jR6eBnf6HtvVQ==
X-Google-Smtp-Source: ABdhPJwxIjRNKtT1J42YA+nhRzy9vx0+RwzyT3KTyUfKi/yumi8OCodyA8RAgNMG5AOqS/6to3lvZg==
X-Received: by 2002:a1c:4303:: with SMTP id q3mr3710189wma.3.1612273217890;
 Tue, 02 Feb 2021 05:40:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o14sm30174874wri.48.2021.02.02.05.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB39E1FF98;
 Tue,  2 Feb 2021 13:40:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 09/15] tests/tcg: don't silently skip the gdb tests
Date: Tue,  2 Feb 2021 13:39:54 +0000
Message-Id: <20210202134001.25738-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise people won't know what they are missing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/Makefile.target | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 1dd0f64d23..abbdb2e126 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -63,8 +63,11 @@ run-gdbstub-qxfer-auxv-read: sha1
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
 	"basic gdbstub qXfer:auxv:read support")
 
-EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read
+else
+run-gdbstub-%:
+	$(call skip-test, "gdbstub test $*", "need working gdb")
 endif
+EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read
 
 
 # Update TESTS
-- 
2.20.1


