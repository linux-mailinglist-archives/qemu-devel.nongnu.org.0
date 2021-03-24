Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5B3347AD4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:36:03 +0100 (CET)
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4c6-0003JG-Bo
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4X0-0006fr-Sa
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:48 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wy-0007Sj-8v
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:46 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v11so24655068wro.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=npU6r7xZSGyA8GLtc47RoK9WHIJiinn1HgWpSszKGrI=;
 b=pRKAgewOPsKbYrGmNBZqECTHNdIR5UKiefbQHVahw/0zhBgVIKZXhpwjsRq+SVNfOs
 JMBLj/mgtGRGE9Bq4J8c+5uTXTSpvowunuJZB9XQxJCpIOfXCEL+ye6M7mCXGOa+rnRu
 AHAkPgROwYrqIwdQsLbamlB+isxVDTRw4QUNAEL3ODaT8ucad9i9o8Gs77vUlzJC70tI
 q7pCM9DlmWRO4exclcpVw62d1fov4Q6JS4VHyUru0JcnESE6fi4/VfrJKSoDS+33RpHK
 SF+JNJC4HQ9aVSwQQj3jPqEjREgM6cT02E3ncFdPqjHLgH27xMEcqiT3fMK7wx7mfXF7
 KgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=npU6r7xZSGyA8GLtc47RoK9WHIJiinn1HgWpSszKGrI=;
 b=bZ5E5upi2pSB52p1r4YD/232nBunIMJhYtDz1/PBGdX3SnW1GSNClO3u+cFm7Otk71
 AdDoHZvmYziv7FtDQt4E7HupoQaF2j42PbVGlRpBPvPwM9ItWgeDaZrIQAC5TcelmB1Y
 x2RQtClXzxhAIn1fwzNO7lIGWObx6ju0jNtzMhpO3VtYs90a00b4zAjLJZrASTQHyqfD
 6SNQfBAR3axeSVm9d/Lrmg9KS3Btsm/aDkUat8qFOumyR+mF7GZ3V8WoQ8Cf7dP/4hSe
 DTbaDWjfj1w8hyJWMgtpSdL1CA78i8EYWrhbRYXnwG6jCNJNxJ4FFq8aq+3z7pmPtFK6
 TNTQ==
X-Gm-Message-State: AOAM532BnPnB3SjLk0LwIuLwD65n5vJvKaamlNTvVm9yPSUtA3mEYVUo
 LcaVIwDVsVPiguSWOkNIiYweDw==
X-Google-Smtp-Source: ABdhPJxyLRw7fkObyXK5FIw9jimmk5i+bhZa87ApFr8+poX+41OQ2jD2aDU93izPw4T7mlZRufS2Fw==
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr3920246wry.68.1616596242956; 
 Wed, 24 Mar 2021 07:30:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p6sm3419861wru.2.2021.03.24.07.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D43EE1FF9B;
 Wed, 24 Mar 2021 14:30:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/22] cirrus.yml: Update the FreeBSD task to version 12.2
Date: Wed, 24 Mar 2021 14:30:11 +0000
Message-Id: <20210324143021.8560-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210319101402.48871-1-thuth@redhat.com>
Message-Id: <20210323165308.15244-13-alex.bennee@linaro.org>

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


