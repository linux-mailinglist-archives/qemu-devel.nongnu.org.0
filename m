Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8CB3C81F4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:45:00 +0200 (CEST)
Received: from localhost ([::1]:39710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bRr-0007p6-Ii
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKB-0002VP-73
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:03 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK9-0004Pz-G0
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l17-20020a05600c1d11b029021f84fcaf75so3482607wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dj4mMGcH2r0ZsEWBcoJNgJByYUBns+eSWULgbZIRVNI=;
 b=VxlJmz+N0rTwZNL8VUtRHHJbCNN40EEl4x+WDhWtUt9KszYz3YiC/wgXzYZf94Ff1y
 dF49Fz5h7wSYi3zkOMzYxGBpzIQJGMEW4+1gBYeFuUMVgnEsfyjuq45iwS+wcUbhRiJ7
 XDfmaEISZNnZyIlkk5cUsD1XW3mRKIcDp4+bjdS4puSRQN7zyCL6qvwAmyU+gWrgqu4N
 WKPLHKwUSet0wsPYeSI/X6YsT87beMbvXErnDR9W7OGBcqiOxVO70Nu86nyRIT4uD1b5
 nWK3HU6hz8leL+1jSf3vGTMgNqt4ym9UTmqpQXoqLeB08tr7wGrhAjl3xSIr+UNCVBWY
 I03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dj4mMGcH2r0ZsEWBcoJNgJByYUBns+eSWULgbZIRVNI=;
 b=gWv0FBprJCOoGU+WO3qxtq4fgNChAuCmr2WXAudA2khUAYLaeNL6HTS/tjGDw8vxc3
 2xsnm1Rhl3aYWHfprPFo7GM597viDtBfaPSIXjgyAKyzDWgu+0GIDAEHTAvTGNIjg2Rz
 ScyRR9iclL+Oli7TFb8c8fHrVf/l2hnh82HC4LnpF9G3j/enEHXtfMpNOJJtOec0VzUK
 +kdMNqL/Or0JEXFqx9pF97Z9CYQU8Nm+lC5vFlED38gGfLL/lZbfSQyl/lXJ27/jrMGs
 rvyYRop5TNAXLdC+FMXadhAh+wl+2/iuY4sN6abkE7N9Ux59BYM0D0cSRDsSyk1AUJGN
 3CLQ==
X-Gm-Message-State: AOAM5310r8zDtap4UMW0MnUsJzuHA4ngKYsbl3NSNPqAVMkm9KKpuVQb
 TjkHRrEtM9245k5951MxSEvQZA==
X-Google-Smtp-Source: ABdhPJy1hwjQBh2p6JftdOzp9eJVO3z2acJFvZ2vQ92qTDv/OAkdd2VUAtTSqDbEsIqys1TsCucilQ==
X-Received: by 2002:a1c:9dd6:: with SMTP id g205mr10204307wme.82.1626255420200; 
 Wed, 14 Jul 2021 02:37:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p5sm2027169wrd.25.2021.07.14.02.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BEE2D1FFA9;
 Wed, 14 Jul 2021 10:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 20/21] contrib/gitdm: add a new interns group-map for
 GSoC/Outreachy work
Date: Wed, 14 Jul 2021 10:36:37 +0100
Message-Id: <20210714093638.21077-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


