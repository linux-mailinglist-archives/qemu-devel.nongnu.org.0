Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCF92D6602
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:09:44 +0100 (CET)
Received: from localhost ([::1]:60420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knRJv-0007l4-32
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knRFR-0005ta-Do
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:05:05 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knRFP-0003bt-Nj
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:05:05 -0500
Received: by mail-wm1-x341.google.com with SMTP id q75so6399946wme.2
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 11:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxNIt5plYdOKFCx5JryMY8PTARCk/pBAH37rhtHgN+o=;
 b=o5RAQET9u0IEgQJyGpNGtrUOsI8wVxd6kv0w3yJcsKC4AgYXGwDt21WIL51/nTLOu9
 iN/3bNkF/dGfvMVtxzjz/hvQQKJVGSKE9PxTUcG3p1apNRZgGzWNWKLX4KcZzMiRHGHd
 piVqSL8psIjbxxxHGri1yG0ccpjFR12KHxKQKgfIuu3Ehi1N8G1IEU09I26kSD7ZRnKX
 z+MDE2cNJ8PH8lUcMpcmGpr6cDtKm+spOeQuRougtlY8ptkMkXtky7n+B/vyxw+mn2Hy
 +rY+rVAYM1AnctfU55B2ArMkhmjpZCX1v2McbY96n+BlnP+A0+9b003E3GVbn8XC0cQL
 nu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OxNIt5plYdOKFCx5JryMY8PTARCk/pBAH37rhtHgN+o=;
 b=LYnjhvhJRu/Yq9EuF751hLhpSkSwEl0mOejXDbsKFEXFz5x94sqWz9w3dYIkRHkY9t
 NqlkwTvKlUzRCG+8WeohfnXW3YZBlIb2n3HRbhZ8VEn7/U8mnRqc3ZckKyBbe9q7Kkve
 JRDSuMEWAzag6sezP/PN1xXiNcmoJmFHnF4Q2I1VgPT3MBvP3DwgJVTZ4w+7uJTBsboa
 Px2fYg7TnBWwM6Jj87sNPpDLls0nh1GWDuuPoDLZAB6vywvFs3EAkpV7N7lU6tN5u9BU
 abzivUsWpFEjNn8wIj3GDWDhHjJBpyZqtQr+J1jnfLwvT8RJerITobufHK621kKzI6nF
 coag==
X-Gm-Message-State: AOAM5313Lc4k8Bk0Mf68hYRYqEfCt1yuUIOVv9u59tuOKJ0lZLgDXPia
 7HJYPo8X7vJZqgk8Q+rmy4oP6A==
X-Google-Smtp-Source: ABdhPJz14xfSCc2Mc0BksGPDa/U43MGmTdIR5dqUpORVoMHKAJJyBHMA7yTPKnj7EcalbiFSlZMD/g==
X-Received: by 2002:a1c:6287:: with SMTP id w129mr9574892wmb.71.1607627102372; 
 Thu, 10 Dec 2020 11:05:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e16sm11589970wra.94.2020.12.10.11.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 11:04:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67C0E1FF91;
 Thu, 10 Dec 2020 19:04:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] python: add __repr__ to ConsoleSocket to aid debugging
Date: Thu, 10 Dec 2020 19:04:14 +0000
Message-Id: <20201210190417.31673-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210190417.31673-1-alex.bennee@linaro.org>
References: <20201210190417.31673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
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
Cc: fam@euphon.net, Willian Rampazzo <willianr@redhat.com>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, richard.henderson@linaro.org, f4bug@amsat.org,
 John Snow <jsnow@redhat.com>, cota@braap.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While attempting to debug some console weirdness I thought it would be
worth making it easier to see what it had inside.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>

---
v2
  - make more pythonic
---
 python/qemu/console_socket.py | 7 +++++++
 1 file changed, 7 insertions(+)

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


