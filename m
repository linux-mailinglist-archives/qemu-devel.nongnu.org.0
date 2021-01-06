Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AABB2EC4DE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 21:28:27 +0100 (CET)
Received: from localhost ([::1]:43700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxFPt-0001cP-M3
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 15:28:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxFNv-0008Qt-Il
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:26:23 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxFNt-0005SA-60
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:26:23 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m5so3551002wrx.9
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 12:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sl4Nwk171t/DqarKPeWmwpfhSWdvezshvzJ1z3X9Icg=;
 b=M4wrMBQ7ZK26XsZc9jZuHH2njPaO/azQ81TtoulyKgyhmKiIetYd8EnNudhh0fDo/6
 3fLtBrfT2tQ8kvFLDnPMBlZYRpMg0SyUAhtn5PAkoPpS3kXkNPbaD7jSwqKVSdgTwrIT
 LflbBe2+IAWogsdTfCTg++FOEC/SvjbYN5Mf7j1Js0pHVRIBWk2qaJTIhZ2G8/3YYkkc
 ADTBGOmYwtcPw38FwwLHwLV/ltor0XoVmv7aXfStWtLYs1/1pOz3wxAFzeqrkzUqqpWA
 TOekgpsLqWtEh3rdy40OAAyH4WGjgxJdr7D9anljn+Sew7fazh/kUlNHm9dtWvE2v4Ph
 Yfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sl4Nwk171t/DqarKPeWmwpfhSWdvezshvzJ1z3X9Icg=;
 b=cmbNLdjvJRHvHUvtnO9crXssCC9WEY53NBSrZpAa20rjFAerOhoODik+pwLeZa6AKj
 gTP2uN7hzQoTlrcFngnVhDD6uwxmG/YVbLRn3IF1MQ5W8WTYkHR5WMxLzRvPBsnfH9p7
 WHf7lH+tq0+i3fSa32CV/QjCGuca1OUPnmybkff6uywLkB2umTFiHyt3yFLyYcVXspTR
 HA1YEfG4cc+WsZdBauJKSJzAiB1dfXOGbiMB1WUeoBxR9lOjf570dGVOqtWofU6hDuoK
 qtaA1KTkeeKOV/rmGQeMfxoqo3lW3GqpfkACSt1b9ks0j4efvAMaaOQsc/ZkT87WaUkI
 2qew==
X-Gm-Message-State: AOAM532MCDk/gvV6my4oTpXaN0nrqsnxRT+ZUc8BWY5yS0yrAqZh7QL+
 IBbs8qu1j9elyjSNdbzVJDvgzQ==
X-Google-Smtp-Source: ABdhPJy/hnpH0z6pQfPuEi/eooHVDWa5VByWLBFfFfMGTXUPuSdIOOJYhegEFXRvH9uZye8lVYCeHQ==
X-Received: by 2002:adf:a543:: with SMTP id j3mr5635016wrb.175.1609964779392; 
 Wed, 06 Jan 2021 12:26:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm4221733wma.6.2021.01.06.12.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 12:26:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B8B11FF87;
 Wed,  6 Jan 2021 20:26:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v4 1/4] tests/docker: Include 'ccache' in Debian base image
Date: Wed,  6 Jan 2021 20:26:13 +0000
Message-Id: <20210106202616.20004-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106202616.20004-1-alex.bennee@linaro.org>
References: <20210106202616.20004-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Include the 'ccache' package to speed up compilation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201213211601.253530-1-f4bug@amsat.org>
Fixes: d6db2a1cdf ("docker: add debian-buster-arm64-cross")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 73a3caac9c..9d42b5a4b8 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -20,6 +20,7 @@ RUN apt update && \
         bc \
         build-essential \
         ca-certificates \
+        ccache \
         clang \
         dbus \
         gdb-multiarch \
-- 
2.20.1


