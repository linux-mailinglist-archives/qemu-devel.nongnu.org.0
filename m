Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF03C8218
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:52:33 +0200 (CEST)
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bZA-0001zB-RD
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKo-0003SX-27
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKk-0004pQ-LA
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id d12so2338747wre.13
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dj4mMGcH2r0ZsEWBcoJNgJByYUBns+eSWULgbZIRVNI=;
 b=BB2L8bJiwbZK3Tj83bQBAOhSoYMguSUGy9lPfTdzP/RKmI1K8E3W4I9EbvHBbY+MVj
 Mv0NKpXzY3Nbn6tzsZvAnPnRS5vwoKJAsh5abT7DwLQWFktMEIXwrp1IDpOhCTGVf4vw
 d4meX8eGMCXa3prJa5TZAt6krigeQohG+r/EbVmInIlvG1QEJTtzwRh1L1Ot4afHZ9T/
 +gT9FKQ8ubfp96vwTX0zHv9yUAEcI2nXHXAC1Zu2C7BYtq2ekV3CDHOZOrjhQFyXiu+b
 wFmj+7zZ3AQ91qvIrWek7Xp5GmAgOvUf8w+EcXZvA8hYAwmnyCL1PCloXp1m8GH3YFH3
 EMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dj4mMGcH2r0ZsEWBcoJNgJByYUBns+eSWULgbZIRVNI=;
 b=t9h4BAPyu9KVTnbswuAaKFheZQFvX5L7pldpySnz05/AqFDXFUmYYLJTOu6nwQXoYM
 HIFR2jBx7N0U4ZULRR6eI3pQzCzn+Kv53BJ9xoxG8uXI4lh80Nrde3wBzSyLJcUVdwz5
 YsMSfzSXIQ8u5WHX1PHtk4OShUhL/a7e5xj68/zZUJtnwkeVKNaXcXAwsRgYhwqORYNb
 mhygS+qZjVENdUIo8XSFZszm/2Fg/I1QmOA+kMAKhqlYxNdiBmr6oyfxK1D7NXp52jTX
 eLj3HqmWPERtgNi+P+9V5lnsAykceynuJrKHTvivP33uYbnJBdsJ4Q0MX7GIKLVUxJLx
 9syA==
X-Gm-Message-State: AOAM533OAdt77TqhiRudAxZkAr9IphyUUAl0PARkxLCv7GXfaXX0XFZr
 bTD5pdN3L8gLdvTSiNrv7a4+jg==
X-Google-Smtp-Source: ABdhPJx1gDem8kPwEkG1/P8zQC5HCj9K5KkwMySxn3v2Jxw+aQW2aSP0prfkyY2+7Q2nBp2W2mal/w==
X-Received: by 2002:adf:f292:: with SMTP id k18mr11558369wro.265.1626255457420; 
 Wed, 14 Jul 2021 02:37:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n41sm4663105wms.26.2021.07.14.02.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83F1B1FFB5;
 Wed, 14 Jul 2021 10:37:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 20/21] contrib/gitdm: add a new interns group-map for
 GSoC/Outreachy work
Date: Wed, 14 Jul 2021 10:37:18 +0100
Message-Id: <20210714093719.21429-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It makes sense to put our various interns in a group so we can see the
overall impact of GSoC and Outreachy on the project.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Cc: César Belley <cesar.belley@lse.epita.fr>
---
 contrib/gitdm/group-map-interns | 13 +++++++++++++
 gitdm.config                    |  3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 contrib/gitdm/group-map-interns

diff --git a/contrib/gitdm/group-map-interns b/contrib/gitdm/group-map-interns
new file mode 100644
index 0000000000..fe33a3231e
--- /dev/null
+++ b/contrib/gitdm/group-map-interns
@@ -0,0 +1,13 @@
+#
+# Group together everyone working as an intern via one of the various
+# outreach programs.
+#
+
+# GSoC 2020 Virtual FIDO/U2F security key
+cesar.belley@lse.epita.fr
+
+# GSoC 2020 TCG performance
+ahmedkhaledkaraman@gmail.com
+
+# GSoC 2021 TCG plugins
+ma.mandourr@gmail.com
diff --git a/gitdm.config b/gitdm.config
index 47317bcee7..3ad781911f 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -42,9 +42,10 @@ GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 GroupMap contrib/gitdm/group-map-windriver Wind River
 
 # Also group together our prolific individual contributors
-# and those working under academic auspices
+# and those working under academic or intern auspices
 GroupMap contrib/gitdm/group-map-individuals (None)
 GroupMap contrib/gitdm/group-map-academics Academics (various)
+GroupMap contrib/gitdm/group-map-interns GSoC/Outreachy Interns
 
 # Group together robots and other auto-reporters
 GroupMap contrib/gitdm/group-map-robots Robots (various)
-- 
2.20.1


