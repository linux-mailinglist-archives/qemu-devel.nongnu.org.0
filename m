Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A333213F4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:17:42 +0100 (CET)
Received: from localhost ([::1]:41750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8He-0001FF-1S
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F7-0007wC-1V
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:05 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F5-0005HW-8l
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:04 -0500
Received: by mail-wm1-x32a.google.com with SMTP id i7so7141612wmb.0
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 02:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJMafUOam+Pe3hXKN8vqOtvg4QC9jgWNymkevszRItM=;
 b=Pbumq3fWF/3Ef+3p6T9ZaD12cSSVoXp1n+1AuP+7O9Fr2dL/EzV86kZBnpq+tRTLMb
 0iRmCqw6RhkFb4OG1Nrgo3KWhp9Ug782vheUcjOw7IErL5bzQ5aHLMlI4MlPahJdVn8F
 6GKL4I5A1yYudq6dS9jSj5i4Ecu7droaggl3g5YEkH5T+Dl+waVAmpgl8nirmzEmTBOG
 t0hFybbDf67ZRsWERsEqm/3tvTzUVTJIJ79KbpmZaOA7pb6ahD9UJNbr5akEBpKe9Ggw
 FmoJ78uCgcJJucrPr34DmIyQjMS+UlpERsVfTSJ4rcE2r4asWl+H8uh8WxHqR10C9pXd
 Nu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJMafUOam+Pe3hXKN8vqOtvg4QC9jgWNymkevszRItM=;
 b=mMDxs7MMl7pawMLAbtXqr/L5YsBzj4oeaKmuJ63NyF6KrywEq0ar7FdA02dDGVVB7B
 C4NbPNTh1FGPO0BCa/CTqCDK1dPLek7VnKwfuuth76DD6GKWt0xUbrGRRjgs8KHwIEEr
 ATnToDDDOW8kJQLDMrbsOkFPZqTGE2HvSGYb2j+GU9lspin0vbQ14ZCjepBbbASMEVoG
 oKtt/U4n8IBfqiyaBTEZyVeIGKlbzWs+MmE3L9OnzpxGKyqRlc28vQh3qVDkrPL7hHHh
 mItR1PHlfKLRpngSvJ3d+Gi+typiQuxOxWlozuaXpbDHs5rHzB9aEW+0atZHihc9geRt
 v/Ww==
X-Gm-Message-State: AOAM5309r7ehcT6LPb5QprHd9l2jmShXnI7H9hpp2FyZASEpi3eFtbX7
 FGMlEG4AW9LiI0dLlEQ9grcvFA==
X-Google-Smtp-Source: ABdhPJyneYZJw9dY+HdyUwbxz3zl6toNt5Jou/ZO7EG7zItjj02G8lrBtRHxlTcfQWdNscAsR5ZmSA==
X-Received: by 2002:a1c:1dcc:: with SMTP id d195mr19977308wmd.42.1613988902026; 
 Mon, 22 Feb 2021 02:15:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm25120370wmi.48.2021.02.22.02.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 02:14:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 167081FF8F;
 Mon, 22 Feb 2021 10:14:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] tests/acceptance: allow a "graceful" failing for
 virtio-gpu test
Date: Mon, 22 Feb 2021 10:14:52 +0000
Message-Id: <20210222101455.12640-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222101455.12640-1-alex.bennee@linaro.org>
References: <20210222101455.12640-1-alex.bennee@linaro.org>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a band-aid with a TODO for cases when QEMU doesn't start due
to missing VirGL. Longer term we could do with some proper feature
probing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210217121932.19986-7-alex.bennee@linaro.org>
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


