Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6067445377F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:30:51 +0100 (CET)
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1MA-0003ig-Gr
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:30:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gr-0004TM-Pu
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:21 -0500
Received: from [2a00:1450:4864:20::42d] (port=40578
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gp-0004Bn-US
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r8so38620424wra.7
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFTQIJHmHLwhfupY0wZqpFqclRFbQp8X+erMaavnLPE=;
 b=qTbSq95Si4Vp90sc3zO4JVcirSDM2SZTdOLysEWG+Vt7XBgrhGwwFZL/nwQBQlC2OX
 JmTd7/d+EIpLwCpUIOkaw/rAU4EX1CAL13NWJQ8HhAPsA6Wazd68OhqGGfAy1WOPNRMK
 mK/Q7//Y8IyNtpAgpJDVSqDhAilKRT1iiCbIjfX+3Y29k9dRaqO+7EUkP/kw1y1YHZuh
 28/XNi/QhZTU8dayz2A0OgKKaZ22nkRbqqPUZS+VMFC7VNpLZ1PBf1MAkEMWyEa4HpZP
 8i/m2rG0KdGG8AoZDEiw8YLdLLH1DWK2SQLIseGmNPiAKgyjrI/tBGmyhBKpBQMSS0OF
 FOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFTQIJHmHLwhfupY0wZqpFqclRFbQp8X+erMaavnLPE=;
 b=0J3DDM56NzHQRBqrvxxkAwbQUv91sF4yJdU+y9goYfrQl8Xw2edST+63trZW7ODtP+
 eWISQ2ZmytoU1ECPg4hsU4TRTqa+ydoAN1zQwXl1yqZ6FaSDb0VHQ563r+JFMQzMVanR
 dxqaNYLgEuJVcp/c1AwaInE0VUBEnUHnUDv6cO8FoyVKmkccXKM/Ka+TT4g5TOOMpIbV
 hegmaVMdsXJpyBznYud979rpnVRSx3kGq+Hf4hxyTryYwP61heTYwnrPboYV8x87qe8E
 dZJ9uvSeQZdhhJdVhhtenR2Wo4N14YvFjpPopiTW5rJXNUcSlQmnrGDl+zZH5xpaKLF4
 39yw==
X-Gm-Message-State: AOAM533isF4/V2TEFCW/Im7/i6A9Bgv7Qj5OfDjIGYv6OXMR8gqflukj
 de+PVf7GFuRnEunCPugjS47uMg==
X-Google-Smtp-Source: ABdhPJwdI3wvBBYAzmJwZpVSNqzieDthIUYUFBk40BAoYzxJeKtC3GUIVYzwBXR+P6GDoJHBaY+X8w==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr10785454wrr.152.1637079917688; 
 Tue, 16 Nov 2021 08:25:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g13sm2706061wmk.37.2021.11.16.08.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:25:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6BBD51FF98;
 Tue, 16 Nov 2021 16:25:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 1/7] tests/docker: force NOUSER=1 for base images
Date: Tue, 16 Nov 2021 16:25:09 +0000
Message-Id: <20211116162515.4100231-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116162515.4100231-1-alex.bennee@linaro.org>
References: <20211116162515.4100231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As base images are often used to build further images like toolchains
ensure we don't add the local user by accident. The local user should
only exist on local images and not anything that gets pushed up to the
public registry.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211115142915.3797652-2-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 7a63a3b7f7..f1a0c5db7a 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -150,6 +150,9 @@ docker-image-debian-sparc64-cross: docker-image-debian10
 # The native build should never use the registry
 docker-image-debian-native: DOCKER_REGISTRY=
 
+# base images should not add a local user
+docker-image-debian10: NOUSER=1
+docker-image-debian11: NOUSER=1
 
 #
 # The build rule for hexagon-cross is special in so far for most of
-- 
2.30.2


