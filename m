Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513733C8AC5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:23:10 +0200 (CEST)
Received: from localhost ([::1]:45474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jXJ-0006NL-AF
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVO-0003aX-Sc
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVN-00023J-3D
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u1so4416842wrs.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6UGuqeut4fizvCtw8CXoY4QUAspgkHi0zIY8ZDavs3Y=;
 b=eOnHefKJbbAOun1/j4abx64XPlxcvqm7RZpRzYXn1W14B3pLqTVu2A3cRxFTGCggcr
 RqwxEWDkpLJXyIfeDWQ8CVtmr8QxR5LDo0X4sAbQo01IQ7wfCj9TlZDORpiqRV6a4nhk
 LOhwFhDAXWGA2fu4RChlpGimJqWYJ6dSjVJjsHCtwsqWZKxRIzBl7FUn8+0BBK4cxdQE
 eOvQIqQf2q24aA1F1+Fzc24ZCz6gfsKCUZanDNQbHnSL/CkJc0VQ7bFXs7S+yhb9yoLp
 L1fXdZARyx527hm1o6hBJyDYunHmm+o/nJU2Z2lL5wnjW2KAXIp+Ghz4QcD8T4zP0oGW
 UfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6UGuqeut4fizvCtw8CXoY4QUAspgkHi0zIY8ZDavs3Y=;
 b=ujrqHjUmQgUDEiFJODMptlxNCdPQqlGXpz86YILx9ihQqU4x80MNFIKcGmW07JT87N
 Q/OoticIzuiCs7O9Tn8yqnipe+a6xG5QQf9xvQMtFya/bLGlBK6cIU/yk1m9D2zUdIc6
 De8L7Bd/l+vayH3gkGEQc2V+QOoqpMeN89YEru+/LRkZESaKygfKVZT70noL+n9wOkUW
 d7MeNSrF8iS6c1mulcaycGDG6n42jbQV4eqpmObEYShrOLPIp5qic/yNCTNQUzp/vA9t
 faDF2MKY+RcDKDzsja0pwS4syxSFoA7ptZAMWx/wR/uL/SzeLdrDUH7ldaq4mt+v5ntZ
 Lfww==
X-Gm-Message-State: AOAM531ewbUNKwooV6jWUQjEVj8Uj3OkgIs02qD25Q/SAbz9yRD0hQCs
 zMT9pOtA4NXRCtGLIVx4phA+Cw==
X-Google-Smtp-Source: ABdhPJzjy7QvfT4wRMBrkVrl2bdrMWGLgvyVsFL8oIDk0jeLlDUh0WOU9lcfzc6KWAteeozLL6YL0g==
X-Received: by 2002:a05:6000:1212:: with SMTP id
 e18mr14675834wrx.255.1626286867821; 
 Wed, 14 Jul 2021 11:21:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a10sm3338599wrm.12.2021.07.14.11.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5FB901FF96;
 Wed, 14 Jul 2021 19:20:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/21] contrib/gitdm: add a group mapping for robot scanners
Date: Wed, 14 Jul 2021 19:20:43 +0100
Message-Id: <20210714182056.25888-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Message-Id: <20210714093638.21077-9-alex.bennee@linaro.org>
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


