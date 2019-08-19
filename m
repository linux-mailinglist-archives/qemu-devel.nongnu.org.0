Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7956E921BC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 12:59:11 +0200 (CEST)
Received: from localhost ([::1]:47880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzfNW-0002uR-L2
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 06:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1hzfMT-0002H6-Ji
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 06:58:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hzfMS-0002k9-3e
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 06:58:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53217)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hzfMR-0002f2-QO
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 06:58:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id o4so1203030wmh.2
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 03:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pR9bTkaYCxrZm1RvRbTYwPMqnYjjbOYd9K8cx6Kyt0k=;
 b=oOvBqGmnZ1tblYufbTjQ5UPD5DrK6GDyl7jYfCE+dsFH0Oju7Gacoqu70PGWyZTWYn
 BaAiyULDzsm9NUx4AFzQd7yEhH3B3Q67MRYNiMEG5um060c34a2UZCLMeXUKHHRX7SZW
 KP/dTtF5+OA1pWynxGGonKu4mz5b+sRRZL+OJcfIR3tFkJ6oiSb+CvK2ZLA4j6ugBzK5
 pyM0bnYYppHWzjYxdMeRnlIxsouKyDqixJ/t5PlaOD+RI7pRJM5dgqB/SkGrtMEnHk1X
 M/xLAf4AKXldTv8jDj/TBQwQdMY4r5jryMYtT12CDsZ0odiiYUHyeiyeZDk8VxEckATD
 q3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pR9bTkaYCxrZm1RvRbTYwPMqnYjjbOYd9K8cx6Kyt0k=;
 b=YXq55IzBV0sGE/PcYW0Sbl5vTVi61Q54mqmj5F+qnKJ68bmrY6jlzCnIICDrCM1/Sa
 Mj5HBFk8TGtRttIud01Us3m2ndTiCb6Oj2Ofz7hOH/p5G2u+vGgDIStkJW/cryWaE/9I
 lTLhRLYu5n22fNtZKopePDVvlekuacMNk5j5kwz5oVrGSBRN0gLhDQdRJGm+62XELtMJ
 AsJYOuJAwCKDK0vHjwUacwDvO+8qtfI9xVkur7B1DVPmZih+kq49W8g4VeWjIDKJmgUD
 qgaQjeuQkc264AFD02CsDk/QJBoY4ptXC5oV+3ht36dxEDutdCfcwOxm/LQ+yc/BUBnX
 07TQ==
X-Gm-Message-State: APjAAAUX7DoIR7UxxeeUvlhfzEU6maB820C+QWekun9HQEatHej/Sx1l
 R7mmbQXtrZsbSa98LPHerevJ6A==
X-Google-Smtp-Source: APXvYqxhobt4W2/cqT+tuFm0xLEDdORTVSCXMXyRJtRrM8YdxlQsEhdbL3+kBXNNw6SCUe9wE3pmGw==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr19492081wmk.91.1566212280872; 
 Mon, 19 Aug 2019 03:58:00 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id y23sm1829248wma.22.2019.08.19.03.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 03:57:59 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 926351FF87;
 Mon, 19 Aug 2019 11:57:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 11:57:53 +0100
Message-Id: <20190819105753.30913-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::330
Subject: [Qemu-devel] [Webpage PATCH] add support page
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

This is intended to be a useful page we can link to in the banner of
the IRC channel explaining the various support options someone might
have.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 support.md | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 support.md

diff --git a/support.md b/support.md
new file mode 100644
index 0000000..b9f4aa6
--- /dev/null
+++ b/support.md
@@ -0,0 +1,37 @@
+---
+title: Support
+permalink: /support/
+---
+
+If you have a support question that is not answered by our
+[documentation](/documentation) you have a number of options available
+to you.
+
+If the question is specifically about the integration of QEMU with the
+rest of your distribution you may be better served by asking through
+your distribution's support channels. This includes questions about a
+specifically packaged versions of QEMU. The developers are generally
+concerned with the latest release and the current state of the [master
+branch](https://git.qemu.org/?p=qemu.git).
+
+Questions about complex configurations of networking and storage are
+usually met with a recommendation to use management tool like
+[virt-manager](https://virt-manager.org/) from the [libvirt
+project](https://libvirt.org/) to configure and run QEMU.
+
+* There is a
+[qemu-discuss@nongnu.org](https://lists.nongnu.org/mailman/listinfo/qemu-discuss)
+mailing list for user focused questions<br>
+If your question is more technical or architecture specific you may
+want to send your question to another of [QEMU's mailing
+lists](https://wiki.qemu.org/MailingLists)
+
+* A lot of developers hang around on IRC (network: irc.oftc.net,
+channel #qemu)<br> QEMU developers tend to hold normal office hours
+and are distributed around the world. Please be patient as you may
+have to wait some time for a response. If you can't leave IRC open and
+wait you may be better served by a mailing list.
+
+* If you think you have found a bug you can report it on [our bug
+  tracker](https://bugs.launchpad.net/qemu/)<br>
+Please see our guide on [how to report a bug](/contribute/report-a-bug/)
-- 
2.20.1


