Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A014536468E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:59:17 +0200 (CEST)
Received: from localhost ([::1]:33388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVMq-0008C4-Ig
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIW-0003DE-71
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIU-0006wD-IK
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:47 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r7so22359638wrm.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NfQWLdBWIgKsNWC8ZCEGrHzxCbu+vjdpX5KlljKYAME=;
 b=CEWgJ2Jy92P6I+GlQNN/qs8k0s1Rk1JG+HOm+SfHbdzOGPDMIUmZ4im9d4QoRUeDFZ
 d5w/r3enlVDnS1dj7U9ZxQiU3bHCFzp3mW7yB9r8hTAHjdpUVFsMMmZut1AUV7xYSJ+9
 /rkPnUTv6vspDC0Phsl51JoICd71Uhdu4jn7SaZo+WucoSGqBRVJTK6OVBYHl85KCVks
 m0HM2aGr3V6ziZbtpZzFpXlODFh9/pTfbkZfDDOou0MXTPSxe+a3oEWf8p9Uk5xvQz9g
 tDmu7dtck6DsagIm2moMMwFHKsOsw1wewsadv6dM9aeh1BUJmGDl39TURts76u8NRbSY
 3Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NfQWLdBWIgKsNWC8ZCEGrHzxCbu+vjdpX5KlljKYAME=;
 b=LK+7vAXNocw3BvnFRiiZyxSV2BnAmxKzswS5H6AeZ2uvt29fiOvUirG7e0id4tSYV5
 PSKmCJTfV3sXQJxD/iM6ZptQ2xwxeOA7nQE9UNPeEH7CQtblXg7TXud4Fjw690NAB6ei
 UiLOSL3vPWkTOSlwYcBdPPp2tckjLGpFDagve0C1StZ9t9MCeWIZHg6yeVk6Fjwlj+V+
 lrC76bDEjJ+3gK+kl9wnBxMlDYsrZflSHuwsRVdQ1Jl04u+U7p6IKwbDIJWfVEIrHB62
 ggGhnFx0JLdBkEyj1asHGysMBDwzEkTu+0YeFhTsP2PiV86M8QIlBC3OIIPtcTkzuFpW
 cjRQ==
X-Gm-Message-State: AOAM532GcOZ4aXZ83/89Wzus4HB8DKIzwEu1o+lNSvdnLJkAXFyMcPaR
 yg3HoFlDNHgmpcJUHt/XqBVkQw==
X-Google-Smtp-Source: ABdhPJzYg9g0qH4xZt52YoSdxkokzx7kINkpjTLyztMrwuO1RTtS9meCfjxs6UWl1kMaSFIdZnQm/A==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr14866933wrm.32.1618844085235; 
 Mon, 19 Apr 2021 07:54:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b12sm24738406wrn.18.2021.04.19.07.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 46E7C1FF93;
 Mon, 19 Apr 2021 15:54:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 07/25] tests/tcg: Use Hexagon Docker image
Date: Mon, 19 Apr 2021 15:54:17 +0100
Message-Id: <20210419145435.14083-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: fam@euphon.net, Alessandro Di Federico <ale@rev.ng>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

[PMD: Split from 'Add Hexagon Docker image' patch]

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210228222314.304787-5-f4bug@amsat.org>
Message-Id: <20210305092328.31792-6-alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index fa1a4261a4..8b97cc9a19 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -128,6 +128,10 @@ for target in $target_list; do
       container_image=fedora-cris-cross
       container_cross_cc=cris-linux-gnu-gcc
       ;;
+    hexagon-*)
+      container_image=debian-hexagon-cross
+      container_cross_cc=hexagon-unknown-linux-musl-clang
+      ;;
     hppa-*)
       container_hosts=x86_64
       container_image=debian-hppa-cross
-- 
2.20.1


