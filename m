Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA083C1A3D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:56:45 +0200 (CEST)
Received: from localhost ([::1]:60142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1a8a-0002dj-PN
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZgM-0005cE-Cg
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:34 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1Zg9-0001zC-DT
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:34 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l7so7968068wrv.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPKLxk04De7Sb5Hr8SfgY3P9LZx+smJYFH9/zYZ+ZF0=;
 b=xljAbs8f3yDh0PD0Bf9afYZGIjAsbWfngyhXrPMObYodZ/sWeX8Kim1uZoPbVTOD8h
 9qWi2OVx84KN9vsLewukOHm71gXiCv/9OW3laWtgZzRUNarHw1cT9O5VQwEDnjHApN8S
 dl5Awq97AvcGXjqf+FerkPW00awPTcFdo3SPP+H9yqob7cGuUrAFqBuW9Cykg7s7ZVC7
 yBNpBFID1IyqYSVD3JMxmQhOL8mUOTGQN557mOVqmi0x1TC2JGm5TnFX2HCd1QuXI7xm
 ASqUe3ND3XcQ+2sQRywYgfAABCFiUbzOdEObtBigINnhMHXxht3Onrt0vneto+Gdmt2+
 e1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPKLxk04De7Sb5Hr8SfgY3P9LZx+smJYFH9/zYZ+ZF0=;
 b=sZ825HirnUamnWojLypzPaikkiuh+DjZP5g7mSg5bIaZyg/A2o1AuXPrrEa4jsslMp
 lFgnVR5C6/L0tqggpY/VkPcG73P6fvrBUaZL/7pw5CDxd4tiQQ3Ipf/FptA4p1sSDB6V
 FIdzClxfOhrLVEkZfhjGyuPc/8vsODts+L6AVW03KkRirMCnVyTQoFvPPBwUayyIKY1P
 7fGzEDF5fTZVkuKCUC3CdR6Pfb9YAJlhIFv+HzrIQMSyVNSH2HtpgA9sHu8ooKkIttHZ
 0RBLCGvkrwmLrVGsEKvdZcRasOimh4uRD7Aiy0q78RpZMX2tHn/u8ubCiUKIFfMOIp8T
 HnZw==
X-Gm-Message-State: AOAM532wFIC+OgHKnp/eufTxdad0t2QqegHTWC78LbMix+sCfTATYHIX
 YgpRMpqdD25BiMkWlv8cKgTlYQ==
X-Google-Smtp-Source: ABdhPJyr4Szn3S1N1if2ocZc5nO3EX88rC3CW9g7aePHtD36YuS2CPS8LJWIhL9JNKBosBbryKk0Og==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr36671045wrn.408.1625772439264; 
 Thu, 08 Jul 2021 12:27:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r16sm1932480wmg.11.2021.07.08.12.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9E261FFAE;
 Thu,  8 Jul 2021 20:09:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 25/39] tests/vm: update openbsd to release 6.9
Date: Thu,  8 Jul 2021 20:09:27 +0100
Message-Id: <20210708190941.16980-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Gerd Hoffmann <kraxel@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

tests/vm: update openbsd to release 6.9

Signed-off-by: Brad Smith <brad@comstyle.com>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/openbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 4d1399378e..c4c78a80f1 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/6.8/amd64/install68.iso"
-    csum = "47e291fcc2d0c1a8ae0b66329f040b33af755b6adbd21739e20bb5ad56f62b6c"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/6.9/amd64/install69.iso"
+    csum = "140d26548aec680e34bb5f82295414228e7f61e4f5e7951af066014fda2d6e43"
     size = "20G"
     pkgs = [
         # tools
-- 
2.20.1


