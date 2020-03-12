Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8B0182F95
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 12:49:35 +0100 (CET)
Received: from localhost ([::1]:39940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCMLG-0004JM-Ks
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 07:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMGI-0003l4-Oa
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 07:44:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMGH-000285-NA
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 07:44:26 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38141)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCMGH-00027B-Gn
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 07:44:25 -0400
Received: by mail-wm1-x32b.google.com with SMTP id h83so2363576wmf.3
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 04:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x0nPLg6o5kFBPoh4kuF9kT3BgcDTmNXl/C7a8wQonTY=;
 b=h1F+dI61BkunoCYlaUv+sSw5WPXaFkuyUbaDtdg2hc3mJDYBxwo4arMlGYm4Ov920R
 6pTIS/LHOs6pQq6GtjKJm458uZ4WzAIgGWQPKyCMQjlb0oSHfi6kHlK47XNvRdc+CrZ3
 WFM/bsPFk6l4SW5wZYIcci1r/mNupEYsCIy8l30aV7vOZQ3qWx7zZQP9b6Nb1NQ2eYc7
 SfLejFuwrt3oU3ckkD/BmFL9s0iFtASc9LxBO5Aqhs5U/JEl6gMtGL3IyX/9gumRGVFL
 hfiHrcpyg4gu+lcLvzpjinleh+o22gF5swiwXWtG9fFLvvkqkK5uqu4GeJ+QDB0CL9+5
 2GNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x0nPLg6o5kFBPoh4kuF9kT3BgcDTmNXl/C7a8wQonTY=;
 b=JYhK4bj/jUPJnlJNbF6ArXL/0NauMcvrAvfJ6U5uRVuMedhcQcymhJn8fA5gvP8ajH
 t69u52BH0RSS7vYzNolajYgG80cFt5s2RO5pHvZZmTPEwEMrAsWbO/Ig62ikAYReAgyv
 oxyKMcG5+Yv3HM/1NyFEmS2wrTZFOWa92GQuu1gACwbcNGoNcXyYr0A93EvzJrkjLMpG
 w7sbhENpWuzzQ4fiAMB82CISAzi7R0/+Qq9z/4Nxg4L696rqCKt30pbBtH34yBbyK+8s
 yooRhpp/OLh5x/KCv7b8BfB/CBHNQt4OuRonPt3ooNR2FKUUjXRMWe2XiGolydVEJI5f
 wAFw==
X-Gm-Message-State: ANhLgQ0aGvtxZisrFhLJ3tqQadXevLjtbv7fHR2YuKJ9Fzi94SiRqXCs
 c+0nZyXNpXn0861K53eijjINcNozfOYCqA==
X-Google-Smtp-Source: ADFU+vuyyYFLUnwXULLu2HeiW/NUa2Pb9ACZzt21cV4ssL9ALOUBpKL2mmj435jSlt2F6GkU62wj2Q==
X-Received: by 2002:a1c:a78a:: with SMTP id q132mr4517597wme.107.1584013462468; 
 Thu, 12 Mar 2020 04:44:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2688564wmg.22.2020.03.12.04.44.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 04:44:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] docs: Move arm-cpu-features.rst into the system manual
Date: Thu, 12 Mar 2020 11:44:07 +0000
Message-Id: <20200312114408.16891-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312114408.16891-1-peter.maydell@linaro.org>
References: <20200312114408.16891-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we have somewhere to put arm-specific rst documentation,
we can move arm-cpu-features.rst from the docs/ top level
directory into docs/system/arm/.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20200309215818.2021-5-peter.maydell@linaro.org
---
 .../{arm-cpu-features.rst => system/arm/cpu-features.rst} | 8 +-------
 docs/system/target-arm.rst                                | 6 ++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename docs/{arm-cpu-features.rst => system/arm/cpu-features.rst} (99%)

diff --git a/docs/arm-cpu-features.rst b/docs/system/arm/cpu-features.rst
similarity index 99%
rename from docs/arm-cpu-features.rst
rename to docs/system/arm/cpu-features.rst
index fc1623aeca5..7495b7b672b 100644
--- a/docs/arm-cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -1,11 +1,5 @@
+Arm CPU Features
 ================
-ARM CPU Features
-================
-
-Examples of probing and using ARM CPU features
-
-Introduction
-============
 
 CPU features are optional features that a CPU of supporting type may
 choose to implement or not.  In QEMU, optional CPU features have
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 86ea6f2f568..1425bd5303a 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -78,3 +78,9 @@ undocumented; you can get a complete list by running
    arm/stellaris
    arm/musicpal
    arm/sx1
+
+Arm CPU features
+================
+
+.. toctree::
+   arm/cpu-features
-- 
2.20.1


