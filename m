Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2605499AA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 19:19:13 +0200 (CEST)
Received: from localhost ([::1]:49740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0nia-0000N0-4b
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 13:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncm-0001JB-Fy
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:13 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0nck-0006wr-3S
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:11 -0400
Received: by mail-ej1-x635.google.com with SMTP id n10so12428468ejk.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 10:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3yWf9U1NzI+4Nys+xW3u44fbHi66jzdV22IJPzINLgQ=;
 b=I8ahZXAo0PAe3ANex+mQcwD8prysxlKWMYkPuCNpShkd4E1lxu4lU1o43BQ+dRCj3P
 JT+66g9U/QuuboovirMBBOd91YALv4ZznszuTwzCWVqMRYFBW19sj8AAjmp1tKRCQxUK
 etkji6nDmuhzoNu4eeDdjEYB/XargXaoN1izpkpGdzo7UBpqzUnanAxflZbSJhpeY/tw
 1wuve4CYkUtixE7jTHTFo3ZU+G0DKcfwgrG1uECFUWOiuh0F7Y7O5xsVlg1L1cOZyqJY
 rkJGWtJRl6X/aJCp1whQ+2xvtWsjWYX7H+0Xhpu7nqBaUmpXkpIrOViwiaCz791gRCA9
 Jgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3yWf9U1NzI+4Nys+xW3u44fbHi66jzdV22IJPzINLgQ=;
 b=Nkk3Ahw3hleK/dSN54sSHW5mYmMrbDRAs2U/kwZJ5uaN7tDqTdSp5GsCA49TodJ+hd
 VEYo7PGlZN89sqi54wsvvFfjNh06fSt0BB02KY0cpUlp7ThFJCt5oHQFqqv1fveaZtSn
 beCEyMINKHOSZmtZIozfYPWg4En5AS+19/aGN9rh82cakA7P/O4hJssPxxBfeDsOpE/X
 FTAaHomva6kBrlFhnjZUONCcObcppr55sO0rWG02oIpJ+wpwyT26I1ysIBEtWSvMY3qM
 L+Y7FqaHmxY0zjQrCOHnsNFV7X4zH6XfUuatH+wrVsKYY4sUWnRNTVdE+W7qtJcMJcpJ
 S16g==
X-Gm-Message-State: AOAM530sLpYSsQJEdUQ8e4rWArVLyuengkggUwYf6tPvtmA0u2/xuIpL
 1xyKjAJdNlqJEvHchlQIrQlJbw==
X-Google-Smtp-Source: ABdhPJw2h4lyxJOTIsalZfV2DQyTJMDZ1F+bYWiHDdGa2fPjssCa7edALZw7sTV6F4KS/fSdYtP4cA==
X-Received: by 2002:a17:907:d8d:b0:711:d82f:5d33 with SMTP id
 go13-20020a1709070d8d00b00711d82f5d33mr695726ejc.595.1655140387503; 
 Mon, 13 Jun 2022 10:13:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 hh14-20020a170906a94e00b00703e09dd2easm4118379ejb.147.2022.06.13.10.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:13:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 596F51FFBC;
 Mon, 13 Jun 2022 18:12:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 4/7] tests/docker: fix the IMAGE for build invocation
Date: Mon, 13 Jun 2022 18:12:55 +0100
Message-Id: <20220613171258.1905715-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613171258.1905715-1-alex.bennee@linaro.org>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We inadvertently broke the ability to run local builds when the code
was re-factored. The result was the run stanza failing to find the
docker image with it's qemu/ prefix.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: d39eaa2266 ("tests/docker: simplify docker-TEST@IMAGE targets")
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e68f91b853..ef4518d9eb 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -171,7 +171,7 @@ DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval .PHONY: docker-$t@$i) \
-		$(eval docker-$t@$i: docker-image-$i; @$(MAKE) docker-run TEST=$t IMAGE=$i) \
+		$(eval docker-$t@$i: docker-image-$i; @$(MAKE) docker-run TEST=$t IMAGE=qemu/$i) \
 	) \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval docker-all-tests: docker-$t@$i) \
-- 
2.30.2


