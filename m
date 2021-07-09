Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B643C262F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:46:40 +0200 (CEST)
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rm3-0007x1-KF
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWh-00059U-3b
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:47 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWS-0005bG-9Y
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:46 -0400
Received: by mail-wr1-x433.google.com with SMTP id m2so1397702wrq.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P9Upb7I6HMRjCcJjpxGvstVHkB7w6Pb+oVKK25wH7Y4=;
 b=icbHxvmm8bDnI4Sy4LQ3N4xbdczm8L+Rrij+uAQwkD2B9eVLqSKDodXyVVJfZJwELx
 pS+q15eBPtyuKM3EzJiv8heVEITQXvvdTRDob8F4YtdAH4tCGhCHgTmpEZ50ayYbt1O2
 QO466qCmYHGMgGhar3aYtu7n9SjRl9Z6qTiXoqDfNgz/kPD5A+S+49UnKucTKrlz2F2P
 WWN8doxybe/7uMUuIE/NYre55Mnxw2yc3ML2EoTCWENoZ1h1tJCCSKeiLdBDEjoDeFF4
 7c2CSi7sX7uvPP/ngndSgM+76ReZ11B1/efZ5cq1jhFQ7euhjWkDMhZ4p8x86J+cvnCd
 zwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P9Upb7I6HMRjCcJjpxGvstVHkB7w6Pb+oVKK25wH7Y4=;
 b=kM4o5icjlj/ty75gJ+/dLOzdPU8lLINHd7ADw5/bc8AAdRySL3kuiMly+Pzg5NXOS1
 LPVY3aoCfyouQK0CLZoCeB/u081dAgCaDGS96ZVf6aMhIO7jSL3Sc2RRHAA8exgGzdkh
 Ng732o4yN22Yx02tNUsVORqtAqzq7C91J1p9aWapm3T+maMiqPFWDvVZnzsd0lCt1DxE
 tG13Sn3slm49Q0BGSXSToN6PH53nxyiIseLpgr02dzLB5ApfEkE4DccNKxhoypUiGEhE
 +fp4PfEjeCdn6KSMg+JZWXcqll1lz1pBBletRjnaUAM5bhU70jgh+lhiLtv7Sq9uQCPx
 onnA==
X-Gm-Message-State: AOAM530U8a6tLaOvWO9hL3u2atb2vyEM9oGgLke+xJKcHbrd75+K3Baa
 yA+HVWkzE4OIoXv7TlFaTLWmfg==
X-Google-Smtp-Source: ABdhPJx1mC0YRPuJJUqHoFIvDUTnp9ezEf7zXCRZHKdD0DV6TbtA+iyAInPPK1W1Na/xd2PpDTzyJg==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr41802390wrn.337.1625841031089; 
 Fri, 09 Jul 2021 07:30:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k13sm1058680wrp.34.2021.07.09.07.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DA941FF9F;
 Fri,  9 Jul 2021 15:30:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 18/40] tests/docker: remove mingw packages from Fedora
Date: Fri,  9 Jul 2021 15:29:43 +0100
Message-Id: <20210709143005.1554-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

There are dedicated containers providing mingw packages for Fedora.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-11-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora.docker | 27 --------------------------
 1 file changed, 27 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index f667f03cc5..5849ea7617 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -52,33 +52,6 @@ ENV PACKAGES \
     lzo-devel \
     make \
     meson \
-    mingw32-bzip2 \
-    mingw32-curl \
-    mingw32-glib2 \
-    mingw32-gmp \
-    mingw32-gnutls \
-    mingw32-gtk3 \
-    mingw32-libjpeg-turbo \
-    mingw32-libpng \
-    mingw32-libtasn1 \
-    mingw32-nettle \
-    mingw32-nsis \
-    mingw32-pixman \
-    mingw32-pkg-config \
-    mingw32-SDL2 \
-    mingw64-bzip2 \
-    mingw64-curl \
-    mingw64-glib2 \
-    mingw64-gmp \
-    mingw64-gnutls \
-    mingw64-gtk3 \
-    mingw64-libjpeg-turbo \
-    mingw64-libpng \
-    mingw64-libtasn1 \
-    mingw64-nettle \
-    mingw64-pixman \
-    mingw64-pkg-config \
-    mingw64-SDL2 \
     ncurses-devel \
     nettle-devel \
     ninja-build \
-- 
2.20.1


