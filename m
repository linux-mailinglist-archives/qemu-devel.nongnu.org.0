Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58692313DEC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:44:52 +0100 (CET)
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BWl-0006L6-Bg
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pE-0003fy-Em
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:39 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95oh-0007i8-Jl
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:22 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m13so16850806wro.12
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ntQFxCLhqX7LYRou1Wz22akVKHJlOcWw8jf+IBT/9qc=;
 b=JXBG6MV6tmFfA/MPN7ceCtEjZAUJ1v/HDZgTZXmCi8W6vGA0KXaKYe+Xpcl1pMz/Zu
 TWSlo89QyhyR2OhifqhVsdC7gIEZPY4Nx4T6DfiZOgVrK9Lzf5R+PnqxeLh4ZDaSIcgk
 Vmre0mOoT9qk9cMQh0FCiC8zUQtTcRYa+M+ZDLrHmIiOeCUpZbEeE7zYvLMCMtBCx9fP
 O2XHbcp9iPeH2GKRnQX2T+y7x2bn/firT6FOp4iSarvT6wI/kybfJzrCopJV/oSS6S+Y
 TOnDonTq3DA/FBcvcD88HnegXUhXRmQnA8n66Z+5kissD3iyFf2goMXhNdItv3bc2UpV
 iRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ntQFxCLhqX7LYRou1Wz22akVKHJlOcWw8jf+IBT/9qc=;
 b=YZEvHbbYxhDkyByO28BCtXMDbNAtM7dd/3fioiTFZdr+CMwvPScnlrgdqy7nuO+3Sb
 9U5lv+d3Dt31yLCM1Tok8h2n8HQ8CVJGlekizBmlgSZ3uXq4V4R9c9wcTcQJHX+w/UQX
 0inmMIUjuEhb9iCkXjDKujyhFwD7o/fz6nltwmotos9GNQuZhuk0FmQnTwD0ZAmn0nRR
 rPPb3HRCkMlMrMkVFnxXpCZHF2AJWKKZDSKdWoO5ijLEHxNbipJGuRpb4pMt83+nBttz
 OXadZKLHRgYlKgz0sOokicnLqKrt71kH3uY6xZ5dbCqvHyYuQpot8vOR9sv0I8L2wd0n
 Q0nA==
X-Gm-Message-State: AOAM530JQloqzUIjG5cr4pn2bxjhs8uGAjNgZ9FsYnKdbG7hqYp3xZL2
 3XCeTmnjOY5huuXBUOhACxBvLg==
X-Google-Smtp-Source: ABdhPJzUBBsQXcS8JgCkh87AkSKhvMy2t3j1waC7kbU34YAxppCNwaszsi/e2Gsu7GwJ8j+S88UQcA==
X-Received: by 2002:adf:f7c5:: with SMTP id a5mr4356572wrq.243.1612787904552; 
 Mon, 08 Feb 2021 04:38:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c62sm20088546wme.16.2021.02.08.04.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA1231FF87;
 Mon,  8 Feb 2021 12:38:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/16] tests/acceptance: Increase the timeout in the replay
 tests
Date: Mon,  8 Feb 2021 12:38:06 +0000
Message-Id: <20210208123821.19818-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Our gitlab-CI just showed a failed test_ppc_mac99 since it was apparently
killed some few seconds before the test finished. Allow it some more
time to complete.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Acked-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210127065222.48650-1-thuth@redhat.com>

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 772633b01d..c1cb862468 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -31,7 +31,7 @@ class ReplayKernelBase(LinuxKernelTest):
     terminates.
     """
 
-    timeout = 90
+    timeout = 120
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=1 panic=-1 '
 
     def run_vm(self, kernel_path, kernel_command_line, console_pattern,
-- 
2.20.1


