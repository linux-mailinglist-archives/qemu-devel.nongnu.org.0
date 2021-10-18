Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5322F4328A7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 22:54:57 +0200 (CEST)
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcZeq-0003JC-CK
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 16:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZdG-0002Wb-Ef
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 16:53:18 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZdE-0003LF-L7
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 16:53:18 -0400
Received: by mail-pg1-x529.google.com with SMTP id t184so4373402pgd.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 13:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mucWqwJBlCh2kzObwJE5L4gDkHxeY+asqcd+ToWL4Wg=;
 b=qgj1sN1V34CZjMA8pPKbf3H7MkthpoyLOV0iidZopA7siC928D+Qt4S63cGI8FYCMv
 b4wqnjyqvKO4/8NUNrPTqhGaYwxINd+41XzcDaJ5PnY64FuoUKzLLXAvy2Lg3jcnwFJp
 8Kos2AN5F9TgyqSq+IPdnOBv/HUK1HmT2GeCC1jhg+jsLQYuyaSZc7MhMFXuMISphJwG
 ipAtybRHOTAQX3XnNAdMILb59HvDUFol/T+XqPy8wdcMkwjnMcmDLxtnJVZbjXaZwUci
 7hnOjR/XznEHKw/D7Qj2bGl8nrjJQz6/6oSY1mgqGfcrJqjEtU1rdaKr5td4q23kv3ot
 b7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mucWqwJBlCh2kzObwJE5L4gDkHxeY+asqcd+ToWL4Wg=;
 b=W+HwlrnrRmLaa5qCCCze38QoqLYFVmVzjLud7eZIAd7TwGG47H0ADrJH5Woq9yexGf
 odPa1OquMrsVjs/2A9hbR5wz8RuYdyOon7drHG3CqGB9EUARiEyx9rBeStq9qQ4BavWR
 yX7Q02LxnObaWbkT1t3X2zrHEh+Ae4BtjITmC6Tte1PcIJ2U0EpXWVNSkn6IEjZRF8oC
 8QIQ8hZn33pExVAjKFBfrxBRcczpBEvYP1edhRXSWpTFoduu36Lak/GWG0U2dmTEPlFt
 0YatCOwRyceHS2BvlREA/tVgwmSF7iVuGZqz5O7eozE2zAsaXMnfweaRai3+DmoxghpJ
 ZL2Q==
X-Gm-Message-State: AOAM53208gFk7QOzN9hu1l72t3as7fzQrwZaJHHLMEyNAwo41hBsRbJN
 SNj+uwJeZu+V/h0RtNLdWOcZ6xhXxQAK7g==
X-Google-Smtp-Source: ABdhPJyAz35caX+2wQUoCndjYe2H1Is7EptgQqZe2sS76hI2XPB09eTPVGhTDbwuGyESVxnPOyPMNw==
X-Received: by 2002:a05:6a00:a1d:b0:44d:aa2d:9665 with SMTP id
 p29-20020a056a000a1d00b0044daa2d9665mr16136413pfh.24.1634590394831; 
 Mon, 18 Oct 2021 13:53:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p20sm3881443pfw.5.2021.10.18.13.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 13:53:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/vm/openbsd: Update to release 7.0
Date: Mon, 18 Oct 2021 13:53:13 -0700
Message-Id: <20211018205313.3526915-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: thuth@redhat.com, brad@comstyle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are two minor changes required in the script for the
network configuration of the newer release.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/vm/openbsd | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

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
2.25.1


