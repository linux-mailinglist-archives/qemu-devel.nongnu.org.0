Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767AC4446E6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:19:02 +0100 (CET)
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJuf-0002fT-Kd
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoA-00056p-EQ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJo7-00073a-0w
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id d13so4624936wrf.11
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eSTCgBq0uk3l/07IcpsOMHYU2kSqHZONAnfF9tBHDUo=;
 b=TcM1Fgy3hgB86D9jmh59lMonjLXXEyPL3TTDFxsyJaQNtU6+j7I5FokHY6vGbf3gKu
 zxzs1VvwP91ggM6UFywj/VT3GTOZKfF6QESET1dsfco7QjQSRcp1Rmn4b8OOrBp5IUAS
 bUfOmeUEPeknO0lDfpkqi35NIkwFimmzOTd9xcAv7YAtnv8pI9RINy204DkmJ7v3+G4D
 DLW2ePn2tFVIFoIXWnlKK8fkv7lwGH5ZFNmsLmcaaXmvhmZsNMtRWK2eI62AVW4kRkfZ
 MKQ0U09WEXwhnCqzhCE4JBoc3jlK6F83EYejHfYLNKD4Egt+RmycI673stqNI6wPEMYI
 fXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eSTCgBq0uk3l/07IcpsOMHYU2kSqHZONAnfF9tBHDUo=;
 b=DqllZ0dLaZiuMXiT3STaV1ev3XYokCNn3b0LLkU6I1nCyODFR5E1DjwMlGNyLBVEXe
 wCeO2hXpUqYO9KZua1jY4cazyvwTbG6nodswqSLU79niBEzqubmkxrPA/cFH119nhHxK
 tj1+d1Hl2Zv1PV4HFNE1mswnqhv6Z5njh4bC2qR67QzZ61Yo5UB/HzjYMUWsDOSSENy+
 ShAaCYbLQuuqN5zNCo2dGXK/vh7Uy34PuVr0AoV80IRNg3jTiBHQTyCv7ap1CaJgAwSF
 GpgPRdv0gy/ZZ6cbzVSD8HxWy9XySPg4aM2j5L7HiSApihraOqjlVbu/6qTS7+zrKd/7
 jsIg==
X-Gm-Message-State: AOAM532kikfwKlNezKPV+Km8W9Y178lUar+BFmQhifHChBTM3WsqJLvL
 9VsS7ZK7aNtKIRJbVBST3pK0Cw==
X-Google-Smtp-Source: ABdhPJxjI9VSMxtIaK70xX7xnHty/oT9nOtjWUV5YJb9UjNFaHEPHnwNN7J15aGxOaVIpcJvCVHfbg==
X-Received: by 2002:adf:f34b:: with SMTP id e11mr28741352wrp.62.1635959533566; 
 Wed, 03 Nov 2021 10:12:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q8sm2512412wrx.71.2021.11.03.10.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:12:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3F5E61FFB7;
 Wed,  3 Nov 2021 17:06:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 21/21] tests/vm/openbsd: Update to release 7.0
Date: Wed,  3 Nov 2021 17:05:58 +0000
Message-Id: <20211103170558.717981-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

There are two minor changes required in the script for the
network configuration of the newer release.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211018205313.3526915-1-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index c4c78a80f1..337fe7c303 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/6.9/amd64/install69.iso"
-    csum = "140d26548aec680e34bb5f82295414228e7f61e4f5e7951af066014fda2d6e43"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso"
+    csum = "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4ca3a4"
     size = "20G"
     pkgs = [
         # tools
@@ -95,10 +95,9 @@ class OpenBSDVM(basevm.BaseVM):
         self.console_wait_send("Terminal type",           "xterm\n")
         self.console_wait_send("System hostname",         "openbsd\n")
         self.console_wait_send("Which network interface", "vio0\n")
-        self.console_wait_send("IPv4 address",            "dhcp\n")
+        self.console_wait_send("IPv4 address",            "autoconf\n")
         self.console_wait_send("IPv6 address",            "none\n")
         self.console_wait_send("Which network interface", "done\n")
-        self.console_wait_send("DNS domain name",         "localnet\n")
         self.console_wait("Password for root account")
         self.console_send("%s\n" % self._config["root_pass"])
         self.console_wait("Password for root account")
-- 
2.30.2


