Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BAE342D21
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:42:54 +0100 (CET)
Received: from localhost ([::1]:57942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNbsT-0008JL-Qt
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbnK-0003Cs-9c
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:39 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbnC-0004Jl-Gv
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:34 -0400
Received: by mail-ej1-x636.google.com with SMTP id hq27so14059455ejc.9
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VB8vRbSp2i9eXPvNVzkYpyqjXytH9giTdm7GR1EGSD0=;
 b=poxqoFCmfrxVcc45IjXTwel7jkv/CR5rcjlUEGLb2tBnJot4I6Ka+5JEqv+pRl/UuV
 p9Mmtqu7QnxZ+nLjigumQbbYvUYfC3mQB13BhhiDNhbnXRqgx+SjBLZyPfuRXJXiy7N8
 gl1R9OYenkhePTtGgdhMZyXwbwN6k8CGU1TaoaPdAxBO+WsxW9Y8dgTEouxOCd+g6goB
 zcCkvOcrVOXOCw6iVMBsfSEJx5dVb49NwhZq+qtEd3CEaVrBYi5rHA8iPVhD/a1Ur518
 WuccR5THml+hPDV2BqcAOKRoGhf1e+eiWpqGuD/i9A0JA49EG8ejXVTgorjdJ23hYV5t
 WYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VB8vRbSp2i9eXPvNVzkYpyqjXytH9giTdm7GR1EGSD0=;
 b=H+kpuPA2AQOFvufmHyTQAvUdkb0IYuBDt5mJtkurIjoRsm3ZI0ZlP6paUur58gNQcK
 AXOYR9y2YC1HztuNaavgJPCeAqKxOZwQfyNUq7hA7RAzT0j9l0xVg9GDEdUqVZgUaF+h
 cR2bv79yf3tHZ24BRokYjCDK9yHWYoI+jfZafnWosmC88I+gdg7Yyj9ZxeaUe3EvuO7A
 ywrNmekumpDStUzpUDGbjO3dx+rL0NyLXoz3zZzR3XFPlSZf2ocp0wFTWvlPKBW09Gli
 NaViN3DSpOX53Qitakpk7SV8Gf9UG4/ugKqAqbiwfmliF0RdEoYMof2vxackpOYKfitf
 Le+Q==
X-Gm-Message-State: AOAM533X0ycgC3kbyyPC4jkN95ef9VZ1TJDxARa1Fe5R6WGVFnDxcpjX
 N8281DJwu2e1goT9lPtr60q4Uw==
X-Google-Smtp-Source: ABdhPJwfbmyz6ta4gkdXbmyqs5qR2/Zz419kN3yvxI4trRcRqgLzpXGefIva9V1IokNfMfoMBVlb2w==
X-Received: by 2002:a17:906:ac6:: with SMTP id
 z6mr9609147ejf.505.1616247443508; 
 Sat, 20 Mar 2021 06:37:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n3sm5322253ejj.113.2021.03.20.06.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7EBA1FF9B;
 Sat, 20 Mar 2021 13:37:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/14] cirrus.yml: Update the FreeBSD task to version 12.2
Date: Sat, 20 Mar 2021 13:37:04 +0000
Message-Id: <20210320133706.21475-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

FreeBSD version 12.1 is out of service now, and the task in the
Cirrus-CI is failing. Update to 12.2 to get it working again.
Unfortunately, there is a bug in libtasn1 that triggers with the
new version of Clang that is used there (see this thread for details:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00739.html ),
so we have to disable gnutls for now to make it work again. We can
enable it later again once libtasn1 has been fixed in FreeBSD.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210319101402.48871-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .cirrus.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index bc40a0550d..f53c519447 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -3,7 +3,7 @@ env:
 
 freebsd_12_task:
   freebsd_instance:
-    image_family: freebsd-12-1
+    image_family: freebsd-12-2
     cpu: 8
     memory: 8G
   install_script:
@@ -13,7 +13,10 @@ freebsd_12_task:
   script:
     - mkdir build
     - cd build
-    - ../configure --enable-werror || { cat config.log meson-logs/meson-log.txt; exit 1; }
+    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
+    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
+    - ../configure --enable-werror --disable-gnutls
+      || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
     - gmake -j$(sysctl -n hw.ncpu) check V=1
 
-- 
2.20.1


