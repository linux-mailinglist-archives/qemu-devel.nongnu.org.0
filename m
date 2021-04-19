Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67A8364683
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:57:26 +0200 (CEST)
Received: from localhost ([::1]:53084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVL3-0004kv-NP
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIQ-0002zp-MI
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:42 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIP-0006sr-5Y
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:42 -0400
Received: by mail-wm1-x32e.google.com with SMTP id k128so18366916wmk.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jUznPzvzYHkJS30t4l+mHbEcaUIGUHIWC+isF9wstk=;
 b=ZH4KduCBUrOjWxEcg37NF6qIRyjPN05++M+GQYpBlk3zCOpuP7o735wj8C9DrLDGkr
 bKg7MunXx9aLcXVil2GlagEgprlgV7Z2NNFgpC1aXQZOdz9VtAbsl8KK+uKQFehRNC87
 RYdYrnZeKEBqTZWUaAjA8Hk3d705xAcQNdWRbUQwilNxrJs5PYhGpMuQ105+ImOBFWEU
 hacwtUTTrqDVvRn7gMycLTlx8T2vGT5gYE6DjjkjgoC5WjCzU+HF8dsK1+lUwpcwTgXI
 errfsvdQBLILd4VsECq9t8lA2teBdprmRtcXPxcY8mJRiX9jevRNPEWuwQKEdwOgSemg
 +tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jUznPzvzYHkJS30t4l+mHbEcaUIGUHIWC+isF9wstk=;
 b=lQ9ei85Z314ftqlpxW1lkbAkhGnclP/tzeAGxd/Dhqa0eQrV/3oAP8LS4ECkqyIyYR
 k5HS5pEF8f9WfcHblygMVwyEy6OXGYdKDOz/NZ4bSyfhuRM8SQRcEEi9IXp5lM5g6PEy
 qb46lycd3eogJW0h4nvxqJ1c1cmWefSy72Rcae4iFDqHK2ZuDVzLEbEayr0AxTMPPyau
 MjYRYsuc0VVJZ51mngRmSG4BpCnIcoxkA2+cMb8PVLTUZ1JbKLQPSi6TrV8vtOf577R5
 ukipzd4q13bnj3UON50OB5kNsxh9+Eq3hOfZYIq/9hAPL83XRXIb+1+ZDbBVVvH9nFtP
 Nkog==
X-Gm-Message-State: AOAM533mkZmoT1OQ2O8/uDnNSRaQFuLbYWnWOKAvtOziGlTw+fqjR3x1
 oEc0Mz9bSm33gZ/fTDT66VSmPQ==
X-Google-Smtp-Source: ABdhPJyWiS/BpXIG8FnLbsAACFbP0o4/rRZWui65sHPVRjeyGKQB+5cj+Z9hn4Pk4ZVyZNOJtzJLLA==
X-Received: by 2002:a1c:2857:: with SMTP id o84mr21899136wmo.181.1618844079827; 
 Mon, 19 Apr 2021 07:54:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c77sm19939554wme.37.2021.04.19.07.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C41E21FF8C;
 Mon, 19 Apr 2021 15:54:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/25] tests/docker: fix copying of executable in "update"
Date: Mon, 19 Apr 2021 15:54:12 +0100
Message-Id: <20210419145435.14083-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have the same symlink chasing problem when doing an "update"
operation. Fix that.

Based-on: 5e33f7fead ("tests/docker: better handle symlinked libs")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index d28df4c140..0435a55d10 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -548,7 +548,14 @@ def run(self, args, argv):
         libs = _get_so_libs(args.executable)
         if libs:
             for l in libs:
-                tmp_tar.add(os.path.realpath(l), arcname=l)
+                so_path = os.path.dirname(l)
+                name = os.path.basename(l)
+                real_l = os.path.realpath(l)
+                try:
+                    tmp_tar.add(real_l, arcname="%s/%s" % (so_path, name))
+                except FileNotFoundError:
+                    print("Couldn't add %s/%s to archive" % (so_path, name))
+                    pass
 
         # Create a Docker buildfile
         df = StringIO()
-- 
2.20.1


