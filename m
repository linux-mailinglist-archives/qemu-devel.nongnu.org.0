Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0596313E11
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:54:04 +0100 (CET)
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Bff-0004E7-Ta
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pk-0003kb-UE
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:40:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pO-0007jX-L6
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:40:04 -0500
Received: by mail-wm1-x334.google.com with SMTP id i9so13116270wmq.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w377RkShWfYVKD5bSJML+f06uux+L2r7mDqZb6Yuoo4=;
 b=SAnp8WD9hT6AkGAzwTgjyg4A40rKC0LWynko9+cvG3T0aJvIAiKoMY2OEKZpCFld41
 GB/sij7w0XRBqHt4pcM8xl5FOH+/YPXt6OGQ9D0IO0jDlIoesVPu2hr2wZbUwYIsX00c
 lL9mfZxarEm3ky9oMnnQ7Mpx8x6j5kBlu/zZvczGx1A6tCA3Rnb4P4OY/PZp4CJK9Pz+
 Q6RlPJo4OGRMRJ+oeScLyvl75V1fbKDL27BBKwkCn78f16ht/1XZ/X2ArORyoVDmmBhX
 m9njKkLHPdNE+MCyeRT10U+WuR0W5yQ+aDDc2iBn0sdD8cl+vi1/OrcFBUlYvarjfST4
 EQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w377RkShWfYVKD5bSJML+f06uux+L2r7mDqZb6Yuoo4=;
 b=Oa/hRaqpBGiXjed2KasD/e33wiXzIrX6/v6+z+k1dRanwdryN2FeCjlv8SueVjm3QQ
 O+NhdNA9l0WKCUUvRJO0OwxCV+frWTxJOfCWBJooC5dxc1c51W0IE/+rZMrHPdnmmYyh
 OEtbo3Zefi1OkPPwcGe8oJXPIgFhTWLuXxpDTZ2pscth+TzW3bXf5ghvTPhOyhT3yq4b
 T4/sb5Nw4ur5PJ0MpMhj/Iu+s6JXsHqfHc4FhvbPxXIb2wBexyBVkhPEauEsQRkj1/Hi
 uxoLERoqgz9a+FnTryZBVRZNrzz8oi+cAAA3zawV6mFIe38vbMwt5Qet/jDxcr5dNYs2
 QXFw==
X-Gm-Message-State: AOAM5338S94vmw+Kl+LJA+IBjBl7kT5u5kohSiiDibR1iXCY1Gx6ikOj
 O9BFcKJFqu3fZURFZGqMN0lK+w==
X-Google-Smtp-Source: ABdhPJxnMNFzesyVVYQa/s+LDy32tkoOwjlTDR3cCH8rIXbO0kyP/AEvnW989gxuKa3qbGKppm87fQ==
X-Received: by 2002:a1c:de54:: with SMTP id v81mr14563019wmg.181.1612787919073; 
 Mon, 08 Feb 2021 04:38:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y83sm20911258wmc.12.2021.02.08.04.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A474F1FF99;
 Mon,  8 Feb 2021 12:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/16] tests/tcg: don't silently skip the gdb tests
Date: Mon,  8 Feb 2021 12:38:15 +0000
Message-Id: <20210208123821.19818-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise people won't know what they are missing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210202134001.25738-10-alex.bennee@linaro.org>

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


