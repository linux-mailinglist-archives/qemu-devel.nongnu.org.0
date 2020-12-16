Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644922DC4FE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:05:27 +0100 (CET)
Received: from localhost ([::1]:44348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaEw-0002jc-3M
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyj-0007zQ-8n
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:41 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyh-0002Oj-Fz
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:41 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a12so23815794wrv.8
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7e6pVGTMZRXmSLQg6pccI5FBxvVyO2S4CfqFpAeRJK8=;
 b=Ur4SkqHNljCfMvV1dG8MwfO3s7/9UX/mir3JkLo9HBm5fUjb/XqtmqBFCgU1L8YuaF
 KbmsyX/AWRBYY6DTnqvBR9kCIBIcpaOJfbkD4Y9KnMjGENrTLTSgqCLSENJB4c5apoeL
 C1gLHRLidrNFAxnatEcZSm8ISIm8QFNUqN3GDrF2TxKjIVbxWq6fa2Ng+R+uBRiahItp
 t+El+7VxA0JD7jYHpbOrn9qtfgTSefeFS5CUrGpCrh/s00LWyZtDquG+ffSKSuzT/ooN
 fLuBeB4uOqY4eSo2tUc3OwcsL4XN+aNotQ1ltfRteEb+LHQeMJhrl7JGySyB1mcfOjRv
 bJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7e6pVGTMZRXmSLQg6pccI5FBxvVyO2S4CfqFpAeRJK8=;
 b=inhiypgbLsC+ZibPOGhwWxkGLSR2ymgmSkRoLC+vunw5Yn/c7yC7Jo0yXWRMYBDHvc
 Boz/RHjb3MPT4DWZmwxqGYYrJCWkQRuj95U8JQcjCZlhj1R1OJDQbnSauz2teNvX755k
 ftIBa/qlp1hKDWyDK06g6/HqKmxC3iGNYW65HX7UsydWh/kuFg1aabC42gwtfq+eKDp9
 o7jvXZabIM7s4kramTrOreSRBklX1BXMyZJQbKg2Mfay8edYd2ndBN9MMaP0saosjbpf
 Hsi8kAOHO2dgsOknlWd99+6GdZT9a13We62yAPOVcAsN9PONhdWgt6bmEQCmT8mkRMF6
 tkcQ==
X-Gm-Message-State: AOAM533LmfcIDVwdJ2FEJ88Y8Mti7fXGGP57kzLuBoQTpxkiQjTYcHbl
 7NDeVXx35/hIkpCoONAPJh/RzA==
X-Google-Smtp-Source: ABdhPJz+Ei/7laOhr1KXTYx3hfaisNWjBumD4zmWf+mFbGOo3wKuAwj5fwAKAHGH7gqMJrfhX7LMPA==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr38308823wru.321.1608137318142; 
 Wed, 16 Dec 2020 08:48:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n12sm4007783wrg.76.2020.12.16.08.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 555271FF91;
 Wed, 16 Dec 2020 16:48:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/11] python: add __repr__ to ConsoleSocket to aid debugging
Date: Wed, 16 Dec 2020 16:48:21 +0000
Message-Id: <20201216164827.24457-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216164827.24457-1-alex.bennee@linaro.org>
References: <20201216164827.24457-1-alex.bennee@linaro.org>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While attempting to debug some console weirdness I thought it would be
worth making it easier to see what it had inside.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20201210190417.31673-6-alex.bennee@linaro.org>

diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
index f060d79e06..ac21130e44 100644
--- a/python/qemu/console_socket.py
+++ b/python/qemu/console_socket.py
@@ -45,6 +45,13 @@ class ConsoleSocket(socket.socket):
         if drain:
             self._drain_thread = self._thread_start()
 
+    def __repr__(self) -> str:
+        s = super().__repr__()
+        s = s.rstrip(">")
+        s = "%s,  logfile=%s, drain_thread=%s>" % (s, self._logfile,
+                                                   self._drain_thread)
+        return s
+
     def _drain_fn(self) -> None:
         """Drains the socket and runs while the socket is open."""
         while self._open:
-- 
2.20.1


