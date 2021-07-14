Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4403C8B18
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:38:34 +0200 (CEST)
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jmD-0002EC-Ez
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcG-0002zI-V7
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:17 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcF-0006eE-Cn
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:16 -0400
Received: by mail-wr1-x431.google.com with SMTP id d2so4472465wrn.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YMSqiFdFxRZatDa4suJZPwZaQLYhR6IcsKTrEjf0PGc=;
 b=ZMYudVTRNriFXtI3yrd82JgqztxAZZsrzEvpNGjf+IHoDu33/edUlF1/khV40VVOmI
 IqZ60Wwilhv+svTE8xirKidlIlqZAbFsR4omW3ytqOzXF83/icaou6isfRdoBYZAEY6X
 CFS3xckKLici50js5CZFLhtNBDpeRpkIyrmrovZsRWx1BKIGfx9j7rzYKX5NpMVw9QrQ
 FJVcFImls+zVYe9M/fint0QmMGohbsFzT1u1cSdDvzNBOeauPVIm5w0Tvek72W8k0gL2
 sWcNb10f29UYndLFesHDRhL25K0UUQSTO8lj4unK0VujEFDiLhFb+hMtEKqCkP7DwbLJ
 0e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YMSqiFdFxRZatDa4suJZPwZaQLYhR6IcsKTrEjf0PGc=;
 b=Z+ayYhp1E3vl1jrsyRHnWlo1m5MQpYIlbst9IFiiG2an8Cy7L15VHnPXdPfRMuSIvt
 nq2IW7uEJgwYfdZsg9tjcOSxpbyJ4cZ9OG+l9msGNx2U1rvjK/npUK7Qd9Pmm1HodUMN
 +l1EmGEpjZK0PVx0GdyNeX71c2S95THxElmV7cE9R3mLvSiOsEQ/hnzEEdgQjJ5ByJjq
 ZJoZ2Z6DGmgHBgqwe2opC/ZEzD1MrcHI5EXEF7WFh+NDoC7BlYDlXNx+hk+PjK0iaWwP
 p8T7TNNWZbuu3SzXnL0fD6SaVYLh1PLutad7Sh0rc0K3BkN+BsmctubqcA2WjWVa0mNz
 w9Uw==
X-Gm-Message-State: AOAM5317bLSUCiTV2MNjDYywZ7+Pe5wXuZ9OwWZylqN7C/SrCdztKdnD
 WPKFceiQdfICLgpdIkvm0fgZCQ==
X-Google-Smtp-Source: ABdhPJx2CJa3vR86j4c86ROJSbec46dkCrPWXpbfiEiCuT9rW5Q0ReXDuBvhWjJi3JNeajCgxWYAzA==
X-Received: by 2002:adf:e4d1:: with SMTP id v17mr14395038wrm.206.1626287294106; 
 Wed, 14 Jul 2021 11:28:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r3sm3454992wrw.24.2021.07.14.11.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:28:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 85E7F1FF7E;
 Wed, 14 Jul 2021 19:20:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/21] contrib/gitdm: add a new interns group-map for
 GSoC/Outreachy work
Date: Wed, 14 Jul 2021 19:20:55 +0100
Message-Id: <20210714182056.25888-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Message-Id: <20210714093638.21077-21-alex.bennee@linaro.org>
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
index 17a7746892..21bb63aff1 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -41,9 +41,10 @@ GroupMap contrib/gitdm/group-map-samsung Samsung
 GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 
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


