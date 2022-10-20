Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611960613B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:14:04 +0200 (CEST)
Received: from localhost ([::1]:42918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVN3-0004ht-ED
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:14:01 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV73-0002XC-IK
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDO-0000ZW-Gv
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDL-00050V-FF
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:59:58 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w18so34014874wro.7
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1O0yduy7ttdhdCo/+WsHwgTbBgZqRMAaZeNoGq07XSg=;
 b=JeO8dBl7GXpiSHvGkZHeZwy8qcBN2yXHWIYgTbv5Z1yaXDY129ZK0UAKadGOkvuc98
 Nyw9N8H715dyTTfcZF0eCQNIGWRG1P5d5zbOE21LAmyGCaIDcMUzSHp4BDlUFA7J+2Pf
 kjbTEliqBVsiynsgb+CWy7EIgsFIFg2HhtWLHK5roh3g4Do7Naa6p0D9kIOyiaNtq/EV
 5ttBegjwtmoa2Rja6LxtxtfZQSIABt7xRkgA3tcG46CJ4m6qJla2dJfjuIZT3s+ni6Gf
 v9wudwLoCe1q+du7Z5T4eQSGYFn0L8ddz55dCntFMMbv+H8JmYFmWpkzPPwrRr+s1hD9
 0UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1O0yduy7ttdhdCo/+WsHwgTbBgZqRMAaZeNoGq07XSg=;
 b=iUfQfXRuz6O1DCDo924vHQASuKQGv7rYtKoSCl8SyDkJ2GLSdIqCNfMqPzrwyij+py
 qiSxYbbXPqnAY0t++mKU9onhoDW+BjpZDxFpaY+EN28HQVbhqRoMb35m9Olf97kvAzrU
 zr0QNp79+WXGC8jJwvfJix7VVKsdveys/JL+JBaAO9H4EWc7W2AL/BjRpywa0+oat9mi
 Seyybd3OIqjD2kX27vslWnHrz+TBkEQMLB/TaEW58IE56/OEHXVJ/DK1YHO1+omFV8En
 h8x4jRh6FuOdlUXutG2ELxbL5Ko6In+pKeygU/mtEMgiSZW6TGo0DFGASRUa/DEIP/4M
 1fbw==
X-Gm-Message-State: ACrzQf1H+fPeOy6Xq0PDuM7Px+b2+2+M23kmhnpIE8o2BbrZigWyult3
 RORxgB5lqSg55B5GhA7YIeiJmYVXSiiROw==
X-Google-Smtp-Source: AMsMyM5cyqEFNhutdQ5EKaxBU9xGuRR8430UsrHMLHfgZnOf1Ka9FX5zShzD4a9abqMUjgniYvVgyg==
X-Received: by 2002:a5d:59a4:0:b0:230:eaa4:88d7 with SMTP id
 p4-20020a5d59a4000000b00230eaa488d7mr8661005wrr.35.1666267194035; 
 Thu, 20 Oct 2022 04:59:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c35c600b003a1980d55c4sm2857846wmq.47.2022.10.20.04.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 044F71FFCB;
 Thu, 20 Oct 2022 12:52:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH  v3 21/26] tests/tcg: re-enable linux-test for sh4
Date: Thu, 20 Oct 2022 12:52:04 +0100
Message-Id: <20221020115209.1761864-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This test was marked as broken due to bug #704 which was fixed by
aee14c77f4 (linux-user: Rewrite do_getdents, do_getdents64). Local
testing shows this is solid now so lets re-enable the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 tests/tcg/sh4/Makefile.target | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 35ebe6b4e3..32b019bdf1 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -13,12 +13,6 @@ run-signals: signals
 run-plugin-signals-with-%:
 	$(call skip-test, $<, "BROKEN")
 
-# This test is currently broken: https://gitlab.com/qemu-project/qemu/-/issues/704
-run-linux-test: linux-test
-	$(call skip-test, $<, "BROKEN")
-run-plugin-linux-test-with-%:
-	$(call skip-test, $<, "BROKEN")
-
 # This test is currently unreliable: https://gitlab.com/qemu-project/qemu/-/issues/856
 run-threadcount:
 	$(call skip-test, $<, "BROKEN")
-- 
2.34.1


