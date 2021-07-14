Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01593C8213
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:52:02 +0200 (CEST)
Received: from localhost ([::1]:37636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bYf-00004x-RR
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKf-0003Bw-64
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:33 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKb-0004jR-TM
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:32 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v5so2400805wrt.3
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36ZYxSkUrlGwP4eDj+IRB4lFW0WyyPghv1h1wo1zSZo=;
 b=Wb1XVq15u2zeKmv3Z7KK2g3wOkG6Zv7LF+vHd33dwleWwyoilTXVw5uEUY11ob9Hpq
 bdQ4/Ho70tn7cfoNhqVekwOs9UQ6TDvXXRie7kzjjatrOqrFEsRjlC5RsNVEzjiaG6Zt
 Ur23YALD4Y+1ae7yPIPCTpIg5iXtXhY9BwaVXe0QiHvfaoe4aHTSX+XbuHqI4fVC1Xln
 29HWGaBON1ywbaEryOxLFKdNvtA0tUCAaxM78c810qeweh8ObwW9vPdX0I0N2q3DjBV6
 g8V4uVlfns9+TJfDRkxiA25JUpRcdLWKxfntg7hAqAzO/rwpvO13+FD1hH2m3smL19iC
 6OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=36ZYxSkUrlGwP4eDj+IRB4lFW0WyyPghv1h1wo1zSZo=;
 b=MVkP7LJM0dUNnPBvvvaxaYNP2oiHpPj0Y3osailNJ6uhDZa64xvzv9coNeCYAIe81V
 HITKHbJVw25vpwh/WdEETAbutXfCEa9tn3OMKbnuTw8tk83pUklDjX4NbjKLpleey5t9
 z/k+i7EPWIeVdOLNcDcYIZ4jYqXQGg80KDVox0L6XxxV8L/AjCMCOM2H6J6UpbZmBfJu
 0u7loB23f3MeGxJE7C2DAWDAJQG1z8NmWzdus7arOqg66XHtXyC6ZOW6nrdtG1jP9ROA
 IdFx2Y0weDBtdHoYzUinfXKDfEB34gSeIq8eF8uHnee5+AvRZPJjrSY5K4pckiG3xQMm
 jWbQ==
X-Gm-Message-State: AOAM532R8el/WuKkT8yjPGq+m1FqwBKAj/mk0WGegcOdxPmXjMvALL7o
 Si0JdLm+ZbhsI6qb4ZXDLibYRw==
X-Google-Smtp-Source: ABdhPJztnYKe6u+Emj0030WdztbLXpP16MYOsiZlvIapqi8rT0jk+/ButJT1/dZ/11FqAj58F98OMw==
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr11837981wrn.420.1626255448657; 
 Wed, 14 Jul 2021 02:37:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p5sm2029272wrd.25.2021.07.14.02.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F6851FF9E;
 Wed, 14 Jul 2021 10:37:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/21] contrib/gitdm: add a group mapping for robot scanners
Date: Wed, 14 Jul 2021 10:37:06 +0100
Message-Id: <20210714093719.21429-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
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


