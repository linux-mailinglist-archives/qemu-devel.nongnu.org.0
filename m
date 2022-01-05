Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE004854AB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:34:48 +0100 (CET)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57NI-0003Gt-0h
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:34:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q3-0004al-QP
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:32 -0500
Received: from [2a00:1450:4864:20::430] (port=33487
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q1-0006S8-OV
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:27 -0500
Received: by mail-wr1-x430.google.com with SMTP id d9so83302440wrb.0
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TtepZHQN5/znWv0868oBdmS5Aai2cc8av1kDEdpWxVg=;
 b=qQelJAF0dyFj7pORmOwxIFqsU+1mDwSCKrin9LaT9NTe2Ra1cknBvs0nD58IC1wYxo
 Hwci5DAiaK8I6qjpYZ+0j3zxT3ucKirqFMP3lZOW8G6LHEh30to5ELgMlaQZ1b0iRD6x
 l/0Mbd4lonp6uSYzSYf3Xe2PCL5NCxVn5yrKl/LOYSHWftenro5f28mCt7Kaf2sloQRq
 p3+gIbnk6EG9wyKhucnzFe5plJKKGRxvaYN2a1h4yn1W6ExszoKnmZ+5gPVDT7EYN4Ou
 ic6FSa+Qk8RlqYRezKPoW6FhFzOUQ3WdxY7XGWbGwdyUtVw6kj+gHpiwOr1SUhAT+rbL
 qjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TtepZHQN5/znWv0868oBdmS5Aai2cc8av1kDEdpWxVg=;
 b=SCimf28Dg+PKos3yuinI9mGZD8AmPzPa7w8RxJN2PQel93ouI9P73O5AGq98lv/7uX
 pdHfUaqAV2SCV1iZ5D6q1+o1xinn9Nw+N57ajCPVLrqi6t67FZMkTbZb7pvYtiSAHvRG
 blQ2mW+uQ+b0dfdvSqjtCtfQzURtk+A3isVXP6PqGjvRPcLj7Xv/3yq15y4VtwOjlpQ8
 RTn5+J4ws1rVbBgTg1l9d8Tw0IOF4eK1hrLFBSi+x5ZjO82LBTAxNvhL/laOyO1WBf4Q
 tfx1GUcZj4JjEStPVpWL41BKF0QRqKtWWpVeNmfPCiOB1jmCnk68scl556XP6tdcNbia
 yANQ==
X-Gm-Message-State: AOAM533A/y2Cv2Po3jMSkQC9ZiLU3pPTimQhliqcGhKXDgzeWfHM0gxk
 nZ2Ps3OBwTx5gK89M4wmbvuvy9uMSHiCig==
X-Google-Smtp-Source: ABdhPJzVSed6zg4pg2c8+s/jBUqt+rh3MU10yZK/D95EcQBx5mnqKHRTT6Ws3oWdDxaXr5HcpkfrDg==
X-Received: by 2002:a05:6000:545:: with SMTP id
 b5mr30545153wrf.452.1641391224582; 
 Wed, 05 Jan 2022 06:00:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t15sm18602501wrz.82.2022.01.05.06.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D8DF1FFB7;
 Wed,  5 Jan 2022 13:50:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 31/34] docs/sphinx: fix compatibility with sphinx < 1.8
Date: Wed,  5 Jan 2022 13:50:06 +0000
Message-Id: <20220105135009.1584676-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com, f4bug@amsat.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

SphinxDirective was added with sphinx 1.8 (2018-09-13).

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220104074649.1712440-1-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/sphinx/fakedbusdoc.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/sphinx/fakedbusdoc.py b/docs/sphinx/fakedbusdoc.py
index a680b25754..d2c5079046 100644
--- a/docs/sphinx/fakedbusdoc.py
+++ b/docs/sphinx/fakedbusdoc.py
@@ -7,12 +7,12 @@
 # Author: Marc-André Lureau <marcandre.lureau@redhat.com>
 """dbus-doc is a Sphinx extension that provides documentation from D-Bus XML."""
 
+from docutils.parsers.rst import Directive
 from sphinx.application import Sphinx
-from sphinx.util.docutils import SphinxDirective
 from typing import Any, Dict
 
 
-class FakeDBusDocDirective(SphinxDirective):
+class FakeDBusDocDirective(Directive):
     has_content = True
     required_arguments = 1
 
-- 
2.30.2


