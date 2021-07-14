Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2093C81F5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:45:02 +0200 (CEST)
Received: from localhost ([::1]:39860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bRt-0007w4-WD
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK1-0001wr-0m
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bJz-0004JD-Es
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m2so2411292wrq.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36ZYxSkUrlGwP4eDj+IRB4lFW0WyyPghv1h1wo1zSZo=;
 b=TYFG1s3U090ay31iSxI14dEZOez3dTjXak9f3iuN9xdYPW9JKlwGUBoXd8zkWxxePv
 sLwWNsShaoepcvrseUZZGJCVFmKUdDbakRu8AfsJXdr/p/Crz0jXYQO0fFSuMSx7/j8Z
 7pSp5tIMihp7iTQwTiMtYEj0EbDnhuH5wfpXjQEEC5cA5F8w8KBlVzarQNqq0HVmenj0
 2ub5YAQunn7bRzd+5OJub0eHSwe8CYdSSKna4sdIevKqwuxqx+Hdb0kffLFQCk/VvurV
 i+sQsVwCbjTDCWziRcjMTTJJ3Ur4utgccUnaaOSgeX9m8Fy2fT4XhmBjdZEmQdEKUL/C
 1RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=36ZYxSkUrlGwP4eDj+IRB4lFW0WyyPghv1h1wo1zSZo=;
 b=kB5p+zWpVflKtcrPiAJGnnqNNrz/RRu3xk7FupoarBwmAz7pqV7mr4rn46TZvqGg0v
 BUGSNBirr/EeplS7RvIpcbL0pMnyADW5+4LPnHGEK1bpYOKEu6dBkN9U9oX6riGU4p2k
 UCwyzlbgf27350c+ucFYJohjlgwZHVE21RqC55lUiv7AIlIPcbCBwTogYPUdwxPw4TTw
 nPwWHGlcHzHZjsF9UnyyGno0JhH1JGlNvKoh2SMkQDqxU9iNUaBljcY7KqyVNHRlhjxs
 z/uGx/0sLIrXkI243jWxmzfWWO/+cyvgock+tsK+BRCTklIFoJUGD/Rqy+aUsO8rkO+5
 wUNg==
X-Gm-Message-State: AOAM532D+6Vx0TPOjiCv6fAQH+Q1/qTpYELCtP9KDbUxrlQmahEHMGaK
 8rdzthgKMiL2Q9Hpb3karSYI0w==
X-Google-Smtp-Source: ABdhPJzrBXbOJyeOK3N9U/r8TXeogMnWqDQ384XOEt7hwBOmmycw6qaQnC/280ZTaTpKWs83+OH0UQ==
X-Received: by 2002:a05:6000:2c7:: with SMTP id
 o7mr11912450wry.0.1626255410144; 
 Wed, 14 Jul 2021 02:36:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o18sm1925937wrx.21.2021.07.14.02.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A07E01FF96;
 Wed, 14 Jul 2021 10:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/21] contrib/gitdm: add a group mapping for robot scanners
Date: Wed, 14 Jul 2021 10:36:25 +0100
Message-Id: <20210714093638.21077-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This mostly affects Reported-by: tags

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/gitdm/group-map-robots | 7 +++++++
 gitdm.config                   | 3 +++
 2 files changed, 10 insertions(+)
 create mode 100644 contrib/gitdm/group-map-robots

diff --git a/contrib/gitdm/group-map-robots b/contrib/gitdm/group-map-robots
new file mode 100644
index 0000000000..ffd956c2eb
--- /dev/null
+++ b/contrib/gitdm/group-map-robots
@@ -0,0 +1,7 @@
+#
+# There are various automatic robots that occasionally scan and report
+# bugs. Let's group them together here.
+#
+
+# Euler Robot
+euler.robot@huawei.com
diff --git a/gitdm.config b/gitdm.config
index c01c219078..7378238c20 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -43,6 +43,9 @@ GroupMap contrib/gitdm/group-map-janustech Janus Technologies
 GroupMap contrib/gitdm/group-map-individuals (None)
 GroupMap contrib/gitdm/group-map-academics Academics (various)
 
+# Group together robots and other auto-reporters
+GroupMap contrib/gitdm/group-map-robots Robots (various)
+
 #
 #
 # Use FileTypeMap to map a file types to file names using regular
-- 
2.20.1


