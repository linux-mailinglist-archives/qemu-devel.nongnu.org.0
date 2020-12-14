Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865F92D9B19
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:35:31 +0100 (CET)
Received: from localhost ([::1]:49644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopso-0004O9-Gl
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnp-0007gs-BL
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:21 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnn-000667-LW
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:21 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r3so16865381wrt.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tRKsmU0qEAtPOv4DujHsfCCXKQEIa7oRhg2frJNfMMw=;
 b=AgTJa4H2j87RYqtKV4o6KTnuDtE01uatIL8Yb/x2iMIpRe7PPcjiGuUst/jXT9juwZ
 GPZYXtNL2QF1+Mc89t8RgjYlEyMclVWP2JhdrJZ5gr8wFHjHQvLvTF0QI/f/tx2Uods/
 UaTw8AVd5sKfrGrDmGgRIUqR+fUrpWlYOWsBnNYVz6FovS6/Fxd7i1rRMSfvkniU50ED
 mZ76IFXg1nowN/Nc1tV/+iOA7d7XaUxLeaXYPydrUEXsz2mdL0ciKDAw20E4PrAcLm0s
 kuct9Ib2Av1hItHOkFE/8J5wJUzflDXGjSYXCpGDX7hNlv8vXZQr3C60nQHeWRXlwJhv
 jnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tRKsmU0qEAtPOv4DujHsfCCXKQEIa7oRhg2frJNfMMw=;
 b=Mu5AC3px/qihKUxPGlk1Z3n8oZzXOQr9PAJF6M3/kOb8m1Ugu+/oT7KoVk9LVHMfsk
 HE3iuayENJOpGjZTUk2HhLco3fBILT3MYj8MvCUnMU1yRxkpADNmJnbY7xQocs627Yfe
 dpf4rBex/GRcX584UJZG+6G2WzHPpPXr7JN8EUCG+Fbhm3fN7vGmfSCD/iCa/QTPBEk2
 6qiQYwrLO51nA8zmC+aYCroeQJrAfDAQzeihhUEOdqGOp/9kYPMl9xHbfcdi2M7FenuM
 jAjyUAm+pbcu8oOMwDY8jHP5njhyfCtiIjk6K3uSlPM+ezvVonVVEBlrQ8tPBfTVgkLH
 r5IA==
X-Gm-Message-State: AOAM530tyOU7pw8IaoM0EzQLatp8JWFQNvZ5rIczSo9IgY5kEC8JjuSS
 T1jWHstimcdhPSxdJStRM/NuRE3rxKtEVQ==
X-Google-Smtp-Source: ABdhPJxB0H8zV5opZvOPXInKOsZc2Byz2qeGgEMLJLrdloZenk8LbA/7W0lKyuD4CIrgIRDy1muxgw==
X-Received: by 2002:adf:fd42:: with SMTP id h2mr15513769wrs.142.1607959817966; 
 Mon, 14 Dec 2020 07:30:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q15sm31706534wrw.75.2020.12.14.07.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 07:30:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D45CE1FF8C;
 Mon, 14 Dec 2020 15:30:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/6] configure: gate our use of GDB to 8.3.1 or above
Date: Mon, 14 Dec 2020 15:30:08 +0000
Message-Id: <20201214153012.12723-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214153012.12723-1-alex.bennee@linaro.org>
References: <20201214153012.12723-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Certain earlier versions of GDB have (possibly distro) derived issues
when running against multiarch guests. Also given the problem of
clashing ports it is preferable to use socket comms rather than TCP
ports for testing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 11f5878a59..f6347382e9 100755
--- a/configure
+++ b/configure
@@ -6721,8 +6721,11 @@ if test "$plugins" = "yes" ; then
     fi
 fi
 
-if test -n "$gdb_bin" ; then
-    echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+if test -n "$gdb_bin"; then
+    gdb_version=$($gdb_bin --version | head -n 1)
+    if version_ge ${gdb_version##* } 8.3.1; then
+        echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+    fi
 fi
 
 if test "$secret_keyring" = "yes" ; then
-- 
2.20.1


