Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA73154258
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 11:48:52 +0100 (CET)
Received: from localhost ([::1]:35280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izeiJ-0005Sn-Gn
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 05:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1izehL-000515-Ai
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:47:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1izehK-0006Ne-9V
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:47:51 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45858)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1izehK-0006Es-2d
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:47:50 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a6so6499434wrx.12
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 02:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iUSl8zfe9kqlbNln8nAeF2OO9Z6PjRWsiU2jCCVtBsc=;
 b=XOY3XhFyqQ6844KFmifXnsigibkePAjkhYhH4/hs+QfxqKUaDjMUZecpDGeCSmU5S2
 hA3iUfGBb/hR8fM7jIvPO3qg4hz296BN76VmUQIqtepgC12KsYxCWYkqz1pOAh9ygILL
 2greHAijh4GVthpNTawbY668Dau7LJrmZC9bfUeASY0Q7adczTvyTpK5E7B5cs8cMIdm
 72p+wQ28ybqzh34XjagAnH4tsY6xhq8TNPGBYtzNJVa6RJrZkCKo0Wt85WfLeF39l0X9
 ki9SpZ3NMAdR+cyebjCu7wyDmVZ1K1X3YqKT9Z29kyHvm2upFBXfFbYJXCJIfVUWfPSD
 b3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iUSl8zfe9kqlbNln8nAeF2OO9Z6PjRWsiU2jCCVtBsc=;
 b=UcA1fTQRMD8S6SZakYMucuXSJobTyuxXGzrUbclShBcwRTxfsigknKmRzE+9ZTi1Oc
 F9CHBUL23CSg26+lV3o2xbY8q3m9GQ8qEpbemJI3hOAE558zcreGpnCA7l//WCBVxGYC
 yQQAZsINlLUC6EKx6BI9WNSr4UCAGQ3kp0IiqMAlvbWYBFR8JVdH/gEPbNTY/PD+huC8
 kjLQ9YMtTfzh7YIooRnlWw9TNYaIWZQDF3nHQuPEpXPklPOKZ7u9VDBriIYqf8SN92mK
 okEFG/IELvyLHd0Imye69Axug4rUbagV5VtZDx3e0pb70D51Y8IS1E4lyt0AfEJ+qhuE
 8fZA==
X-Gm-Message-State: APjAAAX9qUWhPNvzynkz/M3xCxYcTf1gyUwm7soyh3/Zb26wogueskUe
 hnqRxgcAv0IfdrbfDxbjHbgGrQ==
X-Google-Smtp-Source: APXvYqyafMyCYe0YHUrBjtczGYoE0oP8nVfNN+tcnbyMExX7VMwBIhqwyHmxDtovp+AFbi2upDMcJw==
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr3276827wrx.288.1580986068772; 
 Thu, 06 Feb 2020 02:47:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w8sm3304105wmm.0.2020.02.06.02.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 02:47:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 229FF1FF87;
 Thu,  6 Feb 2020 10:47:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH] .readthedocs.yml: specify some minimum python requirements
Date: Thu,  6 Feb 2020 10:47:43 +0000
Message-Id: <20200206104743.11740-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
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

QEMU is all about the Python 3 now so lets also hint that to
ReadTheDocs in its config file.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .readthedocs.yml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 .readthedocs.yml

diff --git a/.readthedocs.yml b/.readthedocs.yml
new file mode 100644
index 00000000000..99730364bbc
--- /dev/null
+++ b/.readthedocs.yml
@@ -0,0 +1,17 @@
+# .readthedocs.yml
+# Read the Docs configuration file
+# See https://docs.readthedocs.io/en/stable/config-file/v2.html for details
+
+# Required
+version: 2
+
+# Build documentation in the docs/ directory with Sphinx
+sphinx:
+  configuration: docs/conf.py
+
+# We want all the document formats
+formats: all
+
+# We need at least 3.4 for enum, but we enforce 3.5+ for sphinx
+python:
+  version: 3.5
-- 
2.20.1


