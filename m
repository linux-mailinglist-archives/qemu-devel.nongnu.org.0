Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC49131D94B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:21:51 +0100 (CET)
Received: from localhost ([::1]:41524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLq2-0004K4-Mv
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLo8-0002U5-CT
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:52 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLo3-0000Kq-8G
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:52 -0500
Received: by mail-wm1-x32a.google.com with SMTP id w4so1952870wmi.4
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OqAjlZdVetE4v7d7JppPQVOHmx3wwh9lYwKIF6G6NII=;
 b=xuYtj/eaHOGzDiEwbbkymqnnUu/sA/mPqyvrNsnVtdHTJyglPQuLJobgfA9/juOr5H
 ddYfL3Z1sI1q5MAoHioFudBokrfRSaW9sV6AyaiRJL6NmyLRFeOnkvx1dbS+ZlOgygm7
 VCxANzgh6LJE0j+0l4JAmj6ufqYEVsPvQtJorNsC68AW9XVvWYph3u7eA313xpnZazYf
 IqZ2yMshMaLqn1SWBdnLSPxjoTr57zrlYBMFccBKmkaFWQCnlBGNbVOuVaKuXiJT0+JR
 o/0vsgj23luTpGXPbRjDiWsNQqXFkcS9dOTQymk5gwlg0WmdLy/mA1KOyR93H+xwbP2v
 MoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OqAjlZdVetE4v7d7JppPQVOHmx3wwh9lYwKIF6G6NII=;
 b=e81UgN/+jsSs6NyTTTBfuNo0Pdgb1VfAJ67DGW9ElsMXyOaP1DPwf4vJazzT4EnTW5
 T1GreuVxZrYSbSUQZgOngSRhZaGAWGA/Tu/BsK49VgIaUwJ3YSRF7Z91h7CHYw57C7pC
 0zGzn0exI96vnzPazdpZ7/HtDJZdXkCJxx+GHwXUIss4dOvmW3pzlulWD5TYUVODLHhM
 hpGHdihmdA8OHjsyrSbWO1j+slgwo2go73x4WOu2ikWs8psDIjMhQOyGTk2HkTouricR
 msx6+ls6pYyCPJmztXZvV2kJ6cfFS4RtbPiezgypyH6SOSCCub6rmeot0mkd81xpAD/+
 5JsQ==
X-Gm-Message-State: AOAM530b5kp8yNWu7H7ViulYqPRBBW/CCQNseRR+IwXfKnMAONzp13Yv
 l7hP+0iuKDo9e7X6tHo82LbJ1A==
X-Google-Smtp-Source: ABdhPJzP3pbVoRuIyNBQrpwVwo4004a2b0w5XVdYzyYrGhtoPbiuSiTwtLWlNMLruPPxvZbJ/LUwaA==
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr7050260wmc.168.1613564380402; 
 Wed, 17 Feb 2021 04:19:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w4sm2578107wmc.13.2021.02.17.04.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:19:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 101251FF92;
 Wed, 17 Feb 2021 12:19:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 6/6] tests/acceptance: allow a "graceful" failing for
 virtio-gpu test
Date: Wed, 17 Feb 2021 12:19:32 +0000
Message-Id: <20210217121932.19986-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210217121932.19986-1-alex.bennee@linaro.org>
References: <20210217121932.19986-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a band-aid with a TODO for cases when QEMU doesn't start due
to missing VirGL. Longer term we could do with some proper feature
probing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/acceptance/virtio-gpu.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index ab1a4c1a71..ab18cddbb7 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -85,7 +85,12 @@ def test_virtio_vga_virgl(self):
             "-append",
             kernel_command_line,
         )
-        self.vm.launch()
+        try:
+            self.vm.launch()
+        except:
+            # TODO: probably fails because we are missing the VirGL features
+            self.cancel("VirGL not enabled?")
+
         self.wait_for_console_pattern("as init process")
         exec_command_and_wait_for_pattern(
             self, "/usr/sbin/modprobe virtio_gpu", ""
-- 
2.20.1


