Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2FD4953F0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:16:15 +0100 (CET)
Received: from localhost ([::1]:56570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbyo-0000LL-OT
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:16:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWqU-0006OD-Et
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:47:18 -0500
Received: from [2a00:1450:4864:20::32d] (port=55279
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWqS-0001hT-GW
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:47:17 -0500
Received: by mail-wm1-x32d.google.com with SMTP id p18so11818092wmg.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CoTkP8l+jcq19PG8CyNU7y23hcxr4xnihYbUsB0r8Ts=;
 b=DSF40kVBV0nBYLq7zjpYmg2IfOPPGRiKbmE6ACB1NVn/FUUKCLy8KTR59BGFBn5/as
 egmjpBALlbwgSJm4Wep6BgS+OK4LiXvs3ZAm892FSFAWH8g9acsXtcsXX647GfHKXZC3
 DNGiOnj1bzLYS13PrcEW8fmde1q5E01b2nmow7lhpKpEGdhJXzo4OJXYiq26S0jl0CxV
 Aa4Lb0EQAAStisgv0FK/1ilMB6tVd+SkKOSmHXhDK0+or8AyH3KVDaQzjZDdOWccOeAM
 IUmEJcoPDgvEOd/A16NBh56dY6CJ1ukb6qoVqy3hCMKDddUwvEwoFShu688QVfOQW+0/
 CNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CoTkP8l+jcq19PG8CyNU7y23hcxr4xnihYbUsB0r8Ts=;
 b=DxCLbia6ZXOI2OL/+5U2Z1BWdi3wRQzGjfm98f/HWJaY5hcOAoAV/j8zhTcgOlnqL2
 M7TCGsKlYYX4/N8gN0mmHGfdvI5/wGLaXKn2c4bcoBr8YCMXqJOODIjPMVk/1+gZZpyI
 PdczBDGrvlxyI6Sz1BDtttU/Bapcft2q7GhUvQ6vLvpmbT0jlZTMhiDSAfWRu+Lws6oc
 pJqpUczNlRloQyWJDYEabWOP0Wy8xZSx80Ef7wXceWV4s4JE9MN9bxQDTsSh+FSfZUPQ
 aZwREIXSU5IM02dVtgo7XG+pABd5XY1Lj5UXGpDxtR5U9OachSS2pmRXVhjEZi/b9O34
 yxEg==
X-Gm-Message-State: AOAM533hDKdYKaHH6YaG7fWKp6WuKyxdKUlB4H3Z7UuxeQYoQEqAv07S
 KBA6/anljqiUMguywFBao7xIy7K5qM0rJw==
X-Google-Smtp-Source: ABdhPJwdAzMz8e8hDMCohLW9/vSuG25mTQTduEBkllbhD2DIeAcsDxVUC27udGm4caTy+E1SRjugiw==
X-Received: by 2002:a1c:21d6:: with SMTP id h205mr1215860wmh.164.1642682835146; 
 Thu, 20 Jan 2022 04:47:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id l20sm10929508wms.24.2022.01.20.04.47.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:47:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] Update copyright dates to 2022
Date: Thu, 20 Jan 2022 12:47:13 +0000
Message-Id: <20220120124713.288303-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's a new year; update the copyright strings for our
help/version/about information and for our documentation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
For once I remembered to do this in January :-)

I suppose at some point we should try to arrange that Sphinx
can pick up the copyright year from a common location so
we don't need to change two places.

 docs/conf.py          | 2 +-
 include/qemu-common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index e79015975e6..49dab44cca5 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -98,7 +98,7 @@
 
 # General information about the project.
 project = u'QEMU'
-copyright = u'2021, The QEMU Project Developers'
+copyright = u'2022, The QEMU Project Developers'
 author = u'The QEMU Project Developers'
 
 # The version info for the project you're documenting, acts as replacement for
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 73bcf763ed8..0e7e7bab959 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -13,7 +13,7 @@
 #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
 
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2021 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \
     "Fabrice Bellard and the QEMU Project developers"
 
 /* Bug reporting information for --help arguments, About dialogs, etc */
-- 
2.25.1


