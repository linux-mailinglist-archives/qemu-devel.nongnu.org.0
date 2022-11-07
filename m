Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B43061F6A5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 15:53:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os3UM-0003Sw-TZ; Mon, 07 Nov 2022 09:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os3UK-0003SS-BW
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:52:36 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os3UI-0007vb-ME
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:52:36 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h9so16641936wrt.0
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 06:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Klayg+WpkH+CJg/U8pw+zZPeMnY3Djc00WEgkmrbmK4=;
 b=rN12ye+Ha30Vy878jAqZsBczem0k7a73UliXiLmqdOyvsUvwN3UAyeTr5Ee7B+EpZQ
 ulGPIxo0GNTyUezG1XnnOrDVaRUSMzkQsO1+KwwJIt14bSoFyKZonMG5G2RuDcEGoFnb
 SiBpvywZGXgCHjqWeaLBbTWWyP6vyLls+tBFZQ9D+dQdHhFZBBSl661UGA4tu460a9YE
 5LGHbepNAPcf/rH2SlijJgk2R5en9vFx3EeeSEu95jLXPQ8IIWXmlgwncwfolGWiH3lP
 jxgEobet57aTbZkXl5c0QT/kLVAwemMOU+dBVeMOp4irohu7naQPTvjjiLVE4yF7YVZg
 0pDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Klayg+WpkH+CJg/U8pw+zZPeMnY3Djc00WEgkmrbmK4=;
 b=U01k33PHMvdpc1Gj8FfAx2Vy8DNEIVd6K6ReEbHtTYDujQBry4TQbpddBzbZoXihIY
 /HT2v4XNDj/yA0vJWxx5zw4FdpJ7o7D3EtsIuTpsiiEaj81tmI3CNsDTGPVg+JVL9Sni
 54zxACZqJWdujhRe7dVPtp3z3cpwdbK9wEAu+AkayVb5AlXLPzM3wIitAk78KByNjbJ+
 Gcyh4IH2QanNYOYpFpR6saI/DCabGRfHLJoqSi6disV/jxJceqcu2Gc4sh/+pUiaaUBJ
 SV/46rYcWJ4lBEP5wH4wp9sSuQ7YKnM5Qs8VLu9rc+/Y6vwEZ6RV2izyn8Y+LapDX1jt
 6K/Q==
X-Gm-Message-State: ACrzQf2AQTsfOC5GQXXcVB5l+t73cPe66bH4H95Bf5YMaeURttLchCpn
 OVWM55aZoJhNmYNbopU6Jej+Vw==
X-Google-Smtp-Source: AMsMyM63ZGK16hwf9GNARKJB+Na1kQkQ7v/5CLvJlRnX/4eit8Fdb6QzpIrPvanvB4KEI2WCQA4CjA==
X-Received: by 2002:adf:a74a:0:b0:236:6dc8:f562 with SMTP id
 e10-20020adfa74a000000b002366dc8f562mr31688305wrd.717.1667832752844; 
 Mon, 07 Nov 2022 06:52:32 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fc15-20020a05600c524f00b003cf57329221sm12976185wmb.14.2022.11.07.06.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 06:52:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF73A1FFB7;
 Mon,  7 Nov 2022 14:52:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/docker: allow user to override check target
Date: Mon,  7 Nov 2022 14:52:27 +0000
Message-Id: <20221107145227.1210499-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is useful when trying to bisect a particular failing test behind
a docker run. For example:

  make docker-test-clang@fedora \
    TARGET_LIST=arm-softmmu \
    CHECK_TARGET="meson test qtest-arm/qos-test" \
    J=9 V=1

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 2 ++
 tests/docker/common.rc        | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c87f14477a..ece0aa77df 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -184,6 +184,7 @@ docker:
 	@echo '    TARGET_LIST=a,b,c    Override target list in builds.'
 	@echo '    EXTRA_CONFIGURE_OPTS="..."'
 	@echo '                         Extra configure options.'
+	@echo '    CHECK_TARGET="..."   Override the default `make check` target '
 	@echo '    IMAGES="a b c ..":   Restrict available images to subset.'
 	@echo '    TESTS="x y z .."     Restrict available tests to subset.'
 	@echo '    J=[0..9]*            Overrides the -jN parameter for make commands'
@@ -230,6 +231,7 @@ docker-run: docker-qemu-src
 			$(if $(NETWORK),$(if $(subst $(NETWORK),,1),--net=$(NETWORK)),--net=none) \
 			-e TARGET_LIST=$(subst $(SPACE),$(COMMA),$(TARGET_LIST))	\
 			-e EXTRA_CONFIGURE_OPTS="$(EXTRA_CONFIGURE_OPTS)" \
+			-e CHECK_TARGET="$(CHECK_TARGET)" 		\
 			-e V=$V -e J=$J -e DEBUG=$(DEBUG)		\
 			-e SHOW_ENV=$(SHOW_ENV) 			\
 			$(if $(NOUSER),,				\
diff --git a/tests/docker/common.rc b/tests/docker/common.rc
index e6f8cee0d6..f2769c1ff6 100755
--- a/tests/docker/common.rc
+++ b/tests/docker/common.rc
@@ -63,12 +63,12 @@ check_qemu()
 {
     # default to make check unless the caller specifies
     if [ $# = 0 ]; then
-        INVOCATION="check"
+        INVOCATION="${CHECK_TARGET:-make $MAKEFLAGS check}"
     else
-        INVOCATION="$@"
+        INVOCATION="make $MAKEFLAGS $@"
     fi
 
-    make $MAKEFLAGS $INVOCATION
+    $INVOCATION
 }
 
 test_fail()
-- 
2.34.1


