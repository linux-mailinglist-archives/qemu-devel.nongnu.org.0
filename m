Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1B9210D56
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 16:17:12 +0200 (CEST)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqdXv-0002rZ-2L
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 10:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqdL1-0005B7-5J
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:03:47 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqdKz-0006r2-8p
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:03:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id k6so24005188wrn.3
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wb2ncrOo7CGsE7dWRGEM3akfUu5tO0R9Fr5WIVAS98=;
 b=Nxl6d1nyOgVwpHdrLCNWKsP8PXAXIFBdgvSu7rQ3azXHfDlLo3j89/DC6/R5v3i00o
 QAqA2XM7DL9jsa6gzAMipm65qR6WPmnn/t3mqoyFxO6AYt55wSb5VIEkLVmflfSQzBzv
 C10pJODqSa9oStqUj/K8/Q5Fp8lJ79P+2Bf9okdse/A2ZZVHZUZ6rJDVS/h3yrPNiOUw
 kiztgE8fS93mmWVUiDznYWPFQJPz8Mp2dc1mGmt+Jh5b1eTSWSWY6llFtH1ujLLanU+W
 4SEh8jV8fis5sOLBBKjket5qblmdqqI2qYqtOQvznpLzibiYH5jsOFG17UYQyoSZ+9Lc
 rVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1wb2ncrOo7CGsE7dWRGEM3akfUu5tO0R9Fr5WIVAS98=;
 b=i9UrniUg/Xg1zMM/gEjnavBFoxBCgZk4Knytf5PC4i45CabT2TnfohVES2j7gNUo2O
 7IZY1HeoTRX8g5lFAjH0/VYPwhBQ2kZY8vlyIgl13EsQHayuWw+rUTkMzbKGVo4dYzA+
 Z7MpbFXRiz7NlKy1UvJ3JNf8fyhDlxcp8jjpAtZcJMD6Oj4wBzLxMnUKhpgmIsyu/lQm
 JAmO8bcu7Tyl2BJ3kjPX2S7dn4wNoygTSbVz+WRZJSXgwZUQIP12yu8k/RcXTdKHxeGN
 lcRLWYiODhmGGwoqi+pa1dCKmd3lhnUy51FbPXt51l7Ss1KtILLvEwCAsZgQ1v6jtwTG
 VYgw==
X-Gm-Message-State: AOAM5315EsgcOnXupgawGURAGMcL6bBa9HqlhBpfD4bvcH/XIW7DMYml
 BqpsMjIx94JZ1NbYbxJgnxkYCw==
X-Google-Smtp-Source: ABdhPJwAzeBVGmdKv+xxL68CVKsI+hXbDeaO/+WJ5/8trRIG5Lxvh/lpt45mlGMpGbYIZiNizjaW0Q==
X-Received: by 2002:a05:6000:1283:: with SMTP id
 f3mr27272527wrx.106.1593612223846; 
 Wed, 01 Jul 2020 07:03:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l132sm7504530wmf.6.2020.07.01.07.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 07:03:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B85A91FFB4;
 Wed,  1 Jul 2020 14:56:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/40] tests/acceptance: skip multicore mips_malta tests on
 GitLab
Date: Wed,  1 Jul 2020 14:56:40 +0100
Message-Id: <20200701135652.1366-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200701135652.1366-1-alex.bennee@linaro.org>
References: <20200701135652.1366-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 berrange@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, cota@braap.org,
 Cleber Rosa <crosa@redhat.com>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some reason these tests fail all the time on GitLab. I can
re-create the hang around 3% of the time locally but it doesn't seem
to be MTTCG related. For now skipIf on GITLAB_CI.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 tests/acceptance/machine_mips_malta.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/machine_mips_malta.py
index 92b4f28a112..7c9a4ee4d2d 100644
--- a/tests/acceptance/machine_mips_malta.py
+++ b/tests/acceptance/machine_mips_malta.py
@@ -15,6 +15,7 @@ from avocado import skipUnless
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
+from avocado import skipIf
 
 
 NUMPY_AVAILABLE = True
@@ -99,6 +100,7 @@ class MaltaMachineFramebuffer(Test):
         """
         self.do_test_i6400_framebuffer_logo(1)
 
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_mips_malta_i6400_framebuffer_logo_7cores(self):
         """
         :avocado: tags=arch:mips64el
@@ -108,6 +110,7 @@ class MaltaMachineFramebuffer(Test):
         """
         self.do_test_i6400_framebuffer_logo(7)
 
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         """
         :avocado: tags=arch:mips64el
-- 
2.20.1


