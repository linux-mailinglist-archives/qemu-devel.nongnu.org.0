Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97261300B03
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:21:53 +0100 (CET)
Received: from localhost ([::1]:38098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l314A-00014j-B4
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311V-0007Y2-4u
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:05 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311T-0006rE-5i
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:04 -0500
Received: by mail-wr1-x436.google.com with SMTP id q7so5941879wre.13
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 10:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sE2rw1O4u9cYqn0FvywReTtt3n/OCFCQyRnzm4hokb8=;
 b=L4CKDPG3h/ELlAHycAPDD38TFU6PiRrQXH8ClGXPRCVUHLTEQGDF4p3n0S22OCY60W
 8n/hPlzmS35PbsFB7BmNqYkm3lo7rH85STsB7unQ7XYQSVfuaH9gyNzZNzKN17h0PLDM
 MP+ApkvTW+rukSch0Av+peBjRvFq6LxymZrUzrRol9SH1rUoanwW+DyU+SQ+vnUIPh0G
 +jqO5kEIvTOc36SdtCrkjJq/UwMjbCpuQJZvJ0xUZ7riL5YQjes7wv7o4sHGexrMkFwu
 7pAC5SxN5n4Mp9P+FJVwVNkGfSJWIwQLKM7CM5SeU+fcXn9l2h98SEdCz3hcyr6PBCXZ
 783A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sE2rw1O4u9cYqn0FvywReTtt3n/OCFCQyRnzm4hokb8=;
 b=N89HftY2RaQUF1+RIJ+0BzW8l4q8nRp6ocFNQwp0H2ahnesX92a5L6ubIwcHjdj9IJ
 CVTwKBhHzDBLEmxzp32gc3SBw0jFW8sRggcH96HjC2ypCfwEE79c/CVDI/s/mwJSeCGu
 ICKubk4OyONrjicW48PCvn41+B64ruq5tKYaGBAW9pSnusPuJ2uuFt5ttSVx65DdDrup
 Q/cNRdfm293BulKsuSoHjAUvTtWbiahS/okiQQ2HoznigMrUBZ9tXgHwxefQSVRKq7wg
 1CoeHXEzILBGvM78BPLZDypwHlBcfB9LxpVyNNx9Us9/yWADpUS9CRfFgN1nr9vMNWrb
 Oy+g==
X-Gm-Message-State: AOAM532jJaDI70hC8maECd/8I6me/sDmRsxgKcQXLlVaQvuEzRFaThEr
 xBl2vDKd8EKPbWkaROTuYfzNMg==
X-Google-Smtp-Source: ABdhPJx7saTyzTdrXPUB34EL8t9fPp91LEJLJFg+QPwTsBW5yQg+1ATWsABb1JkHZeGUGMPZY8vZ+A==
X-Received: by 2002:a5d:55c6:: with SMTP id i6mr5910057wrw.145.1611339539478; 
 Fri, 22 Jan 2021 10:18:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f14sm12228461wre.69.2021.01.22.10.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 10:18:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D00F31FF8C;
 Fri, 22 Jan 2021 18:18:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 2/8] tests/docker: Fix typo in help message
Date: Fri, 22 Jan 2021 18:18:48 +0000
Message-Id: <20210122181854.23105-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122181854.23105-1-alex.bennee@linaro.org>
References: <20210122181854.23105-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

To have the variable properly passed, we need to set it,
ie. NOUSER=1. Fix the message displayed by 'make docker'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210119052120.522069-1-f4bug@amsat.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 0779dab5b9..bdc53ddfcf 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -209,7 +209,7 @@ endif
 	@echo '                         before running the command.'
 	@echo '    NETWORK=1            Enable virtual network interface with default backend.'
 	@echo '    NETWORK=$$BACKEND     Enable virtual network interface with $$BACKEND.'
-	@echo '    NOUSER               Define to disable adding current user to containers passwd.'
+	@echo '    NOUSER=1             Define to disable adding current user to containers passwd.'
 	@echo '    NOCACHE=1            Ignore cache when build images.'
 	@echo '    EXECUTABLE=<path>    Include executable in image.'
 	@echo '    EXTRA_FILES="<path> [... <path>]"'
-- 
2.20.1


