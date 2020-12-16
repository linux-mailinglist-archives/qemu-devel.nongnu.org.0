Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBFF2DC4C9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:56:34 +0100 (CET)
Received: from localhost ([::1]:48658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa6L-0008QK-Hv
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyn-0008C6-Uw
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:45 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZym-0002PG-CK
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:45 -0500
Received: by mail-wr1-x434.google.com with SMTP id w5so20107532wrm.11
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xEbb1A8Q3vElPyecINXk4fjojRKvByDa/JdiywVldrM=;
 b=u8oKpPcpIYQ7rO9MjYtE5FKM2r3HEQFChtIJT8ET+uRxw46OGO9HLCWeYP1//7mx/i
 +s214MKZvJKHjbpO4Vis3UUdR0W9cTO7JGihB/hvpgnoUd6Qaohowf52sw7o0/zf1myS
 mQwCN8ff7zAv1JXC9I167sFJDuB7mXuTnbYTTDvCX8KSlzIwE0XPIcEI52CRtVTI5WfM
 wJhniJ+IKD3vPam0UAx1Y//TcQI7FAxvcXJhQp1WyJPA/nY2tdpReP2hD80biJ/EN4Jy
 wi9FOpJ6dYNj7guwoq/V9HHhF7BzsQ5aHDAVHUFsYqeeG9rFP1LuecUgPARTHEELcadZ
 RaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xEbb1A8Q3vElPyecINXk4fjojRKvByDa/JdiywVldrM=;
 b=Xs4CsaawuPhF74Q9yjMh0DxToIuTh4ZNxIwwj72Wofa7AkqvCLHMgroGxaxoO/c0xe
 OYJKGoDGi/Q0pdINLj4/mZyeak8u8vM7MCGA47NbIEMDjxV+xMD0ftCMvYT1QAX7LLXD
 L3191zf4qg0S1uTKbkBcy+CsPD/dsmqh9o1HhcA8CTfyhJGOYoql0DUJuceDSYbrjZcF
 SfgQ88pSN0dbA8ZJR7Eo7vtRrGor4CD3qZfnibZvUkn6sHR3MD96/7YnFGF+fToY4vVI
 R8bGagXzLz7J6uroTc1dvxTsMDmLhc1nqitCIfdAedeCa/Am8mmvQcmZMXUY56GztQzB
 j8NA==
X-Gm-Message-State: AOAM532nTCFUSW3KsEBlBF1uXDYvo7EFvkTBvRvqfGhaO+Ip8sQqW6Lq
 +vNiNOxk26LyIj3xihWBTjqaDw==
X-Google-Smtp-Source: ABdhPJyPIekJoP1ssKl2ry1op7IYEODTFgyiqzR4RqCyV3LJFjFFIGzRIG5ivTWNvBmK0XyOuknLvg==
X-Received: by 2002:adf:eec6:: with SMTP id a6mr38582310wrp.239.1608137322977; 
 Wed, 16 Dec 2020 08:48:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm3968964wro.40.2020.12.16.08.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 970251FF96;
 Wed, 16 Dec 2020 16:48:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/11] tests/tcg: build tests with -Werror
Date: Wed, 16 Dec 2020 16:48:24 +0000
Message-Id: <20201216164827.24457-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216164827.24457-1-alex.bennee@linaro.org>
References: <20201216164827.24457-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hopefully this will guard against sloppy code getting into our tests.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201210190417.31673-9-alex.bennee@linaro.org>

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 2ae86776cd..24d75a5801 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -94,7 +94,7 @@ ifdef CONFIG_USER_ONLY
 -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.target
 
 # Add the common build options
-CFLAGS+=-Wall -O0 -g -fno-strict-aliasing
+CFLAGS+=-Wall -Werror -O0 -g -fno-strict-aliasing
 ifeq ($(BUILD_STATIC),y)
 LDFLAGS+=-static
 endif
-- 
2.20.1


