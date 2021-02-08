Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1351313DBB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:40:48 +0100 (CET)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BSp-0002qj-QR
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pk-0003jz-AO
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:40:04 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pO-0007ib-Km
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:40:02 -0500
Received: by mail-wm1-x32d.google.com with SMTP id i5so4393733wmq.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=69e0vkOf0vuiM1aa1l4UrAX0DX83ZQ+TUhL623hzy0g=;
 b=f95uW4qrrMR8Mb2n6Sah6GsJwNy+PDqDZaVvA9wau7tqpKhJq5szlH7sDtVOTq3VRP
 1rPnqaKnL+Brc0V4hKob86Vk09kwOcq46W+dhsdlB88rReCHX3Vd/GOK3IHcXTKzQx9L
 CRjc7EOKa6ntC//tYLcI66/97mB+6m0d8XG99eyRQhiVgSBsKunAmNZrfh10XMt3vjd2
 vNXeEaOID2VPtY2u6MpKr7gBaNzFvrYa5j7MCsi+7H15ddNKqOD49uUDrFS4gc0bclVH
 GiU+O0PnLFU0CMwBiDPVOWdG5i8DTtCDWEfYyA3bVOwIqqgc7By8BQzfzWdH/z5XSXNb
 JU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69e0vkOf0vuiM1aa1l4UrAX0DX83ZQ+TUhL623hzy0g=;
 b=au7A7Lt91cHHofhCDYRrujYLUdNJzmwFdkWwKVe8gO83X9UqjEn89BU8VUtvlIVm8d
 oKPze28jkwWiwHzsR9U3kg1KGCqkNuaNxCJOLJjHWnYd7sRSMTFINMXWzDyjXCzGJrLC
 l/v3aCw4Oy8262GqEGo8NMkSQfvw/h4dYpr6LcJe4Y2MV4GybJrv1daLIoPTy5A6aOFd
 iEwyvR81GcI+KWA60CIhuYgCuQSCPAc3qLe1CeAUkXz026thwGQLV/yPBM5u1vc4G+gH
 +bi1QdLBw3QW/2DE61+T3HpJq30p0rN3kfCQJX/bAUH3E9cy4bKPRwpx+eeDHzpa1/aH
 JUOQ==
X-Gm-Message-State: AOAM531qEjctM3BhyIMUPRTPt/Vd4hu6l5T/J5MYUIAt8ln/MmB50SiN
 8apkMR12h/1RifuLFQwGbrNEOQ==
X-Google-Smtp-Source: ABdhPJxNfsh8kRyKjR9ZqUIsahOSnQGpV7k3jLTW6A7hjrXSjXqkKQ1wjdthJF8iBHYyrGaqxEK9dw==
X-Received: by 2002:a1c:67c4:: with SMTP id b187mr14724330wmc.17.1612787908039; 
 Mon, 08 Feb 2021 04:38:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n10sm29030792wro.39.2021.02.08.04.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 022A61FF8F;
 Mon,  8 Feb 2021 12:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/16] tests/docker: Fix typo in help message
Date: Mon,  8 Feb 2021 12:38:08 +0000
Message-Id: <20210208123821.19818-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

To have the variable properly passed, we need to set it,
ie. NOUSER=1. Fix the message displayed by 'make docker'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210119052120.522069-1-f4bug@amsat.org>
Message-Id: <20210202134001.25738-3-alex.bennee@linaro.org>

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


