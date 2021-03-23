Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662693466AF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:49:47 +0100 (CET)
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlA2-0001NV-1t
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHa-0007BR-Ix
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:32 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHY-0002w2-FZ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:30 -0400
Received: by mail-ej1-x62b.google.com with SMTP id b7so28255374ejv.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lkjS4b2AHoEMW5vF18Zs+QdO57LRsD31yQd7ZNao5mM=;
 b=mxdFpdYZA0DKdO32yDDviIyqfoVz69uYr/jpG/bSG+aDGUQU5qyIxIisunBxnzi334
 S0oqh3WDPevxojSWo0ts1PBR6PLJCerktKBb9vXus870iW+XMw2YKdlm18aHPY1dDIEd
 1vqjXBBTHaPsuM2puMLf79R0xJYhBP1iwusOW+T7+VwoiTtG4rFgqAucAVn5IY0B6Nwn
 QHUfd1evLll7AREGfcmsikug375rjTSLxH9PQqvDSzaUp3Mgu8mA+oup1snvjYbA9nnV
 C4LU+2SfLzy5uKAmzPeLB1WtTFr4hd74VadUcViMhhDXhUPsrs+t+Pw8kfWpQ/SxjHDn
 GSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lkjS4b2AHoEMW5vF18Zs+QdO57LRsD31yQd7ZNao5mM=;
 b=Zd4jOHw6p2z7smtt5nCcJ9jYYdawRWxE9/8p0mDVHay9D+qSUjuUDdp+h8C5G/7ArT
 GPQhj4ZSwiuIykQN00+aZN7smmokfkRkp4hgSX0rd+cp3OdaluoEFPEwBRazbMQwh+Ob
 TA1dsrGj8qgHzuCNbQ8QYVdr1B4ugs2JxCnrNrN0pIsx173WYNJnthN/6cpokjJmPkWW
 IJT7TCAbc40sJYDWmLhGs4bEgX29+biuw2fmTlmXRgYfnTlBWuISgh5/TRLHh9y/Czap
 8JVB0xNUZfpcljVEq1yOe1+YJWu2BfLlhEZG3Qnn7kIpwU+3CFIiJSuQBEY342ZHm3zZ
 rQlA==
X-Gm-Message-State: AOAM532UQ3niJe/6Jbv9P/rEzQuojwzAbs5k6wj8u2lUdRIXgFgCMObE
 fMvGWAx0tcj+Bu1xzHu6RVBkCw==
X-Google-Smtp-Source: ABdhPJz7e/fI+hSGKnUbHUNY132dPeuVx3gw1J+hr2yM7tOcNs1pgYjJMWyZNH+rgYF7mIgRircvxg==
X-Received: by 2002:a17:906:7194:: with SMTP id
 h20mr5816048ejk.154.1616518406624; 
 Tue, 23 Mar 2021 09:53:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x4sm12741992edd.58.2021.03.23.09.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD2B61FF9A;
 Tue, 23 Mar 2021 16:53:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/22] cirrus.yml: Update the FreeBSD task to version 12.2
Date: Tue, 23 Mar 2021 16:52:58 +0000
Message-Id: <20210323165308.15244-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>
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
Message-Id: <20210320133706.21475-13-alex.bennee@linaro.org>
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


