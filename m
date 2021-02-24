Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C72D323B7D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:51:10 +0100 (CET)
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEshB-0007EX-4t
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfg-0005t5-Ug
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:36 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsff-0002V3-Ii
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:36 -0500
Received: by mail-wm1-x332.google.com with SMTP id n4so115663wmq.3
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 03:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eoIdMvHWxMQbDl3UBMTrBtc6tQc91c3mmdrnsIe6cmw=;
 b=SzfTz6lFjhcF2CnQ3opsnFVQLpJmJ7i3s1RD5N0oYaRAaB+jLEIJ2Bl6jMvM4S0r0j
 60ljvkVcxfnrkHGgc/qnPAIT/xI5Wh1SIn1XoYQOKggM76XMvwCo1U+6r9Y4t/opuutj
 1ejFpD67PauFrw+GSd0brOjMJwxYMyqGC745EAUm1HDmALNcGGWJgEFXmcLgyFtTCfOF
 uzzBGojpv6p1cpjctmF5N8YiSKiCoaCyDAa+O9v5VNAzinGR6o4/B+I7wUk/OZRYXi02
 cow2Es/zip/oZ8TRYEQQMu7wuS3SadypKPHBclCn8WOPZ2orSBBpeOU2NoWJ2NVx6zsD
 B/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eoIdMvHWxMQbDl3UBMTrBtc6tQc91c3mmdrnsIe6cmw=;
 b=lw18acbuIWCh/pQ1iI575QMi61b1izDdwlPNdTSK++U14D763gUQb6JE6jvORs2z9Z
 G3UHlpjUT9/3qyHTs4iWO4bnv0vdZJP+Akx0q4023Cj3xuv80gEYEaZSRVF/LOp9SVdS
 UVS59ii+Ehv6SUPtTQlGgVA/iUlCCQHsWdoxWcuMraEwmGD6sRPi4Vy1ItmLJcqRbaH1
 rsSVma9Sy650CXo58+TZ/aVFGkx5nUNEv2QOjaYEEipQvdAWt1kJ+tVPRVcXlQno41v+
 gyDNsVE8n5VCFnUbZiSIV3YwxDReQxTU3s2mKpj46gy7saTTL1LCWdryZAW4HZrrNGwr
 hWOA==
X-Gm-Message-State: AOAM531WCP8Eo04iF1COKohe/daFxUPvEccBIxpd0N7esAyzM5JpkqOj
 jPhgF4pWoOVS843Ervj8D6mUYw==
X-Google-Smtp-Source: ABdhPJyGL6cBK0YjVJWLsF4dsmstSwWpNd47loj9z1StofUi7MS0bZS2JJp/MnVJBlqwuNjbqUQ9Lg==
X-Received: by 2002:a05:600c:4ba2:: with SMTP id
 e34mr2555597wmp.121.1614167374339; 
 Wed, 24 Feb 2021 03:49:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b7sm3142799wrv.6.2021.02.24.03.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 03:49:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA71B1FF8F;
 Wed, 24 Feb 2021 11:49:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 3/7] tests/acceptance: allow a "graceful" failing for
 virtio-gpu test
Date: Wed, 24 Feb 2021 11:49:22 +0000
Message-Id: <20210224114926.6303-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224114926.6303-1-alex.bennee@linaro.org>
References: <20210224114926.6303-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a band-aid with a TODO for cases when QEMU doesn't start due
to missing VirGL. Longer term we could do with some proper feature
probing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210222101455.12640-4-alex.bennee@linaro.org>

diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index ab1a4c1a71..ab18cddbb7 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -85,7 +85,12 @@ def test_virtio_vga_virgl(self):
             "-append",
             kernel_command_line,
         )
-        self.vm.launch()
+        try:
+            self.vm.launch()
+        except:
+            # TODO: probably fails because we are missing the VirGL features
+            self.cancel("VirGL not enabled?")
+
         self.wait_for_console_pattern("as init process")
         exec_command_and_wait_for_pattern(
             self, "/usr/sbin/modprobe virtio_gpu", ""
-- 
2.20.1


