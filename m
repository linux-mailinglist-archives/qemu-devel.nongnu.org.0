Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 66442386DC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 11:15:35 +0200 (CEST)
Received: from localhost ([::1]:47372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZAyE-0003JB-52
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 05:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39400)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hZAp1-00048Q-T0
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:06:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hZAp0-0004Qj-37
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:06:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37434)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hZAoz-0004KG-Nk
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:06:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id v14so1350003wrr.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 02:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jMI2SGNeZLWPMTiphBl8d5qoJBryaOiVTeyWEFf0GRk=;
 b=IjChq4jlAKRwvAQredZdjoabtSchtttqVsl0Qj+mYjguYu7xjuiJoGUZe7O2rmqcmZ
 EyYwlQOTOMy+JWg7QZ6piVE1sQLBnS9Fj9QtO4Ryfzp1ApwnsaUVHWEZVFv2rgnYA5/I
 X/eaN5a6L3BqG5FBNJ3SFyXS3LkjyjlKAq77LGNeEakaFiYmqJjM+j0bcC519NopcBeg
 NcX+WhAEpZW/Rdwj03qADNsKFenNohWSNnw7rncP/UTgjQnUsMyjBRZXkTtLUoQJ3HCD
 /J160FpaWI5hSvQB+WBEc0lW+DX1R7fGn4NHEtrd5PEb9Kf1bOAP1+8IvS+hOUiAT+z4
 qBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jMI2SGNeZLWPMTiphBl8d5qoJBryaOiVTeyWEFf0GRk=;
 b=ZtU6KcCWiMdJyRAE1vTVQsxojkjw9WzuI6G15gb6oqMSc0hqzfqGbtAxhuORUXP7Pj
 dXNFlBV6tpTvVvmNN2L3yygIqnAtbRnyvBvZJsR+LOAKq1AYviBuO604JyNjaYSrCiS3
 XIucAYRBbuVfc4IltCDPrbg1XrJyT9yKT3aNYIXnKths4Lncpe1GCiV+jR6kV+zw+yYs
 bQq8Cc7Tx1LRfcfYOLTF/JuPbW+pcfXjZvoEk3M9T+4xcVG0Z5pawarRpq2TG3sbbfS/
 3waKVkxl9kzH9Orknv34Y3+Jl4UuDRsXzZP0rZPhzCLWPa8gnUT0WD4HG+XqIl5i/gvX
 +Skg==
X-Gm-Message-State: APjAAAVozcKnPzltewOByyYIZHmeaLlf3RIV1+XkEX7hkjbduuQ6fAlI
 v/ltYuUR2DvrtCIEnJoesc9LIg==
X-Google-Smtp-Source: APXvYqw8zDl2ZPcAhoThNQ6HwVwEZKkEhGFei7kK+oMa3YvvD+jZDTVKojR6CFvfJCI7KimCRdJ8Ww==
X-Received: by 2002:a05:6000:cf:: with SMTP id
 q15mr1677853wrx.52.1559898359991; 
 Fri, 07 Jun 2019 02:05:59 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id u5sm1515236wmc.32.2019.06.07.02.05.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 02:05:57 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C8D5C1FF9A;
 Fri,  7 Jun 2019 10:05:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Fri,  7 Jun 2019 10:05:09 +0100
Message-Id: <20190607090552.12434-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607090552.12434-1-alex.bennee@linaro.org>
References: <20190607090552.12434-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
Subject: [Qemu-devel] [PULL 10/52] tests/vm: Fix build-centos docker-based
 tests run
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

`make vm-build-centos` run docker-based tests on CentOS. The
created containers should have network otherwise some tests
fail. Also fixed the BUILD_SCRIPT template to correctly
evaluate "V=1" for verbose output.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20190329210804.22121-5-wainersm@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/vm/centos b/tests/vm/centos
index ba133ea429..7417b50af4 100755
--- a/tests/vm/centos
+++ b/tests/vm/centos
@@ -26,9 +26,9 @@ class CentosVM(basevm.BaseVM):
         export SRC_ARCHIVE=/dev/vdb;
         sudo chmod a+r $SRC_ARCHIVE;
         tar -xf $SRC_ARCHIVE;
-        make docker-test-block@centos7 V={verbose} J={jobs};
-        make docker-test-quick@centos7 V={verbose} J={jobs};
-        make docker-test-mingw@fedora V={verbose} J={jobs};
+        make docker-test-block@centos7 {verbose} J={jobs} NETWORK=1;
+        make docker-test-quick@centos7 {verbose} J={jobs} NETWORK=1;
+        make docker-test-mingw@fedora  {verbose} J={jobs} NETWORK=1;
     """
 
     def _gen_cloud_init_iso(self):
-- 
2.20.1


