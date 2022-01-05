Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49619485420
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:12:10 +0100 (CET)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n571N-0000TI-B5
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:12:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q2-0004Zp-Qe
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:32 -0500
Received: from [2a00:1450:4864:20::430] (port=37605
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q1-0006Rv-BK
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:26 -0500
Received: by mail-wr1-x430.google.com with SMTP id t26so83203412wrb.4
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dxymNqw19u2u6b/DdFXF8UywXmUK4R4aF4P0xtNCKU=;
 b=XdEaFXi3c02mDfS337SdIwtOBNdfmOAH6fbvBQeRRPXmvb2iwjyMnYtq1sl4+8EgZS
 jE67+XleNlMpqDq0zvY8WB91beB/8dFD/1hlu+Kleg/3zq/AL/Z7pplhOTGpN713eLT8
 a4gEChkogPOvZYkRUgY+Ltb2s/sIiH/L/91CW5v5X8L+10DaKUYCby4iWfKTnrJ/s80A
 cYp23qAy+ci2JM6p8lkWWmKzAUtoJPlY6A14mF05v/skt4mXAykTfHzWxPq4yCOQq7/l
 Tobxv9mJloTI6EBjxyQZ1VzPdvx/o4UGLv2yxe4G2YpMGu59shlKl4idyYrw5/ha+XxY
 CX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7dxymNqw19u2u6b/DdFXF8UywXmUK4R4aF4P0xtNCKU=;
 b=FNWun/d2Gx/BLwmJk2Sa9kVRXCzx/G2LBClg0/r5MULW1TDuzpgZPsWFHqOrJHDz0I
 nQBXrQ+Y3wFMzNqSJC5FAVhr509VgEFzKEfOiU2DruwQYc6tY1u9MtPOfy3ucMn0n6Nz
 I8C5RfEUNS3XckuN+YWJ/GvCvJEmbIKw8IhqPurb3uMkOslmBiNrHemt1iJ6oGaNE1qU
 49kb5P2j6vr/F4tl4jUg6dYsAvuM3JPoTWsZdmfeYjbRkp86tReSm3KNZ++VYRKjsfJB
 l4OZ0t5/Z1vRvlalnV6eueMATjFheVFAd6KSKH6p8Ui0tkK7wDXy191PQA9s05P+vrD1
 yJaA==
X-Gm-Message-State: AOAM5315xTFkQTwBBUzmIepFzlNCGf+zzH12frBHgLl2U1eK7VplMhRy
 GX1nXdoT0SmlripAvVXyCIplzg==
X-Google-Smtp-Source: ABdhPJygs6j1LqN0Rfl8+ZsPoJ0K8Iubotj8yWrfH4LeAq/CLjpwqmeWbQ9Mckf26uJTHnyoic5WGA==
X-Received: by 2002:a5d:58d5:: with SMTP id o21mr45662690wrf.254.1641391223693; 
 Wed, 05 Jan 2022 06:00:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r9sm2009611wrm.76.2022.01.05.06.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A3E81FFD6;
 Wed,  5 Jan 2022 13:50:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 32/34] gitlab-ci: Enable docs in the centos job
Date: Wed,  5 Jan 2022 13:50:07 +0000
Message-Id: <20220105135009.1584676-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We just ran into a problem that the docs don't build on RHEL8 / CentOS 8
anymore. Seems like these distros are using one of the oldest Sphinx
versions that we still have to support. Thus enable the docs build in
the CI on CentOS so that such bugs don't slip in so easily again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220104091240.160867-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index e77aec873e..8f2a3c8f5b 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -164,7 +164,7 @@ build-system-centos:
   variables:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
-                    --enable-modules --enable-trace-backends=dtrace
+      --enable-modules --enable-trace-backends=dtrace --enable-docs
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
-- 
2.30.2


