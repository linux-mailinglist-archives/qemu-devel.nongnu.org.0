Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058CA3C266D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:58:38 +0200 (CEST)
Received: from localhost ([::1]:36924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rxd-0002L2-0u
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rmw-0003CH-El
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:47:34 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rms-0004Lc-LO
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:47:33 -0400
Received: by mail-wr1-x436.google.com with SMTP id d2so12554721wrn.0
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPKLxk04De7Sb5Hr8SfgY3P9LZx+smJYFH9/zYZ+ZF0=;
 b=OnuKpWaJi/pL6JfYRT5jolc0Tn6d3QbxTsBRa94razu3N/ChsOXfP6He8Js6HBcSg5
 9zn/3vEVWE0KuJBVbZOqdgc3t+mkYndz89VJYjnMPHulud9GD7OKC3ZaS9NN6ZAYVUNj
 rdqx+HPBGyI1hJUi8C+sG+CqcZ2WNQr2OPyIU0WUPTp/K3evuFOiTtjphz58c/c7Hjt6
 DokuTjZosCueRAHv7ShcSU88mYvpmyPYJjsI4RCksqxorKc4Dk5ZrzsBQTMrj8KFQ2Bg
 +BBtkpxc15eVwrQgFIU2aUvfN2Eio54j0jXoXG5tFpYRaYaZmeicsJR4W8WAtElM5Kjo
 mKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPKLxk04De7Sb5Hr8SfgY3P9LZx+smJYFH9/zYZ+ZF0=;
 b=J9ySXYk1u4/Q6l+6+1D0H4qjNSlJLkjqgPzecrnMDaGSSMY8BdLdtOJnhf7q30p6gm
 R9qaGlmWpwSoW5E08O8/cdiY6w42bUAcHgkpoD06Tt0amsIrW/ZrBRkbtYbkqc1Kwxee
 ZTzEYDwZb7MGYsxIlyvtYxdG91pbOvvw2Cwc03+qmHVypzQ66dFWP5BVdiYIK2Q5Krqs
 qQ/2unPy5rsp4F6lgsmBya4Ow6feVyrEIbacnvmeDj2091vr78PHq5JIM1jcigBruQLz
 0Vqu0AcQ9m5LzmqYNr2iJcEcQpJpwaualnQurmcJxGsp4TKFKak4p/6I1uKUAmldvr6q
 eSyg==
X-Gm-Message-State: AOAM533Ruz+HrFLK3sHN1zstbahZRs/HrYt8lV9I0+iGbUF+6GSJfD7n
 1lbMT+SIXgGlb+QhFRuYlS+iWw==
X-Google-Smtp-Source: ABdhPJyRaEabvynvbw+KyL45uYify98yd6MhlT5JKhwQsTma0zOFYqVOvMstRrIHCSbScwBsPK4WVw==
X-Received: by 2002:adf:d236:: with SMTP id k22mr17486531wrh.392.1625842048290; 
 Fri, 09 Jul 2021 07:47:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm5457023wrw.56.2021.07.09.07.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:47:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3A9B1FFAC;
 Fri,  9 Jul 2021 15:30:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 25/40] tests/vm: update openbsd to release 6.9
Date: Fri,  9 Jul 2021 15:29:50 +0100
Message-Id: <20210709143005.1554-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


