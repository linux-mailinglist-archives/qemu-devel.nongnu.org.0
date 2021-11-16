Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4FC4537A2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:35:34 +0100 (CET)
Received: from localhost ([::1]:59564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1Qj-0001JK-L4
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:35:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mn1Nq-0007Ts-KV
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:32:35 -0500
Received: from [2a00:1450:4864:20::431] (port=40659
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mn1Nn-0005DM-OW
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:32:34 -0500
Received: by mail-wr1-x431.google.com with SMTP id r8so38663945wra.7
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=meR3HTWCSYW2lfsBTs1Qo625nRMPuZz6UFeuiNja+Nc=;
 b=ju59t5quYmyFR1tk7Qso7gRj7sJB9Fv9+B/Oxdj/xgD4yhlL7P4TlcSmMqY7jPnA9p
 A6lbMuc99/iEZv9TNMfD8u2kTfV4tCl/rFxqYhIiKx4RvwvKSvbLRheOK8SFxUMMfcel
 CpnZzwP/KIWTyFVexQIR+v7dVEvdt4FxH1Ctq57PgvsRrOv4FRI4uQmo6eybcGz+tslV
 QwTyoRvK6k8q8VHPMokD/nESKK8C2AoqITT/L09G56dQtIz5KL8SkOt9H0BTwQ6yy+l/
 RwXf0u3cIoHBCxXd116xonPDyg0209RlEY+O/vZJrrQSra/iockk2Rcd9SiJ48aGlveD
 X3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=meR3HTWCSYW2lfsBTs1Qo625nRMPuZz6UFeuiNja+Nc=;
 b=tjcIAwwAkxpb1zndGBhqg3EYyUfWl3Yg48Iu3TnJZ3xbxDUXrOZaOFBvJo5zqjUIY+
 ucGVrcqwkDN4cchFLQDmE1l07kM7rutd8j+MO8RZg8QBK94n3JDdKA28okETdyLybpDJ
 zBUzSaqIU9jQ+m5MZ8zOFalot+SZYciAPxGl5UR4hPiihwSukc9LNfLTvxd2+w7qK3H+
 OgKaN8/rKFgoCp6pC5vprOoWzbaCipqcc1KBwFHIWH2p5uFtpRQD8+VYKNizCWnjLOeb
 KKApa+GKpsOcM4nymEofxM5feb+phSImEE7hpwG2b5ia+n1N7cew6rI4BQ6UZQYqI/vz
 r48Q==
X-Gm-Message-State: AOAM531zguhHguJxaUFizpQA6Z6R3wnoC3DuUYGlACy+uH2q2nNPZ530
 FtxnRvfzgU2xsr2oHFF7+5YvmcjMM18=
X-Google-Smtp-Source: ABdhPJwv+na6cOSLDPwSX0rsovwYFuSFqwV6FpXT5wz8D0e/HZ8nFgaifXdEYDrHV0mLe3z47qdzHQ==
X-Received: by 2002:adf:e904:: with SMTP id f4mr11125630wrm.245.1637080348666; 
 Tue, 16 Nov 2021 08:32:28 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l16sm3426825wmq.46.2021.11.16.08.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:32:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Add section for Aarch64 GitLab custom runner
Date: Tue, 16 Nov 2021 17:32:26 +0100
Message-Id: <20211116163226.2719320-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a MAINTAINERS section to cover the GitLab YAML config file
containing the jobs run on the custom runner sponsored by the
Works On Arm project [*].

[*] https://developer.arm.com/solutions/infrastructure/works-on-arm

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: <20211116162515.4100231-1-alex.bennee@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c12..f215e50f502 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3511,6 +3511,12 @@ R: Willian Rampazzo <willianr@redhat.com>
 S: Odd Fixes
 F: tests/avocado/
 
+GitLab custom runner (Works On Arm Sponsored)
+M: Alex Bennée <alex.bennee@linaro.org>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Maintained
+F: .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+
 Documentation
 -------------
 Build system architecture
-- 
2.31.1


