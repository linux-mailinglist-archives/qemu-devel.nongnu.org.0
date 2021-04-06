Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6177F3559D1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 18:58:48 +0200 (CEST)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTp2N-0007zl-GL
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 12:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lToxB-0004Ee-BV
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:53:26 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTox5-00071M-70
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:53:25 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a6so8969183wrw.8
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 09:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AuaJwaKhUNoYh/ZcFYNjPltT1xEmne8xtIRiBDrxUzQ=;
 b=R6Rkr6TR2cMZEGw1pcApzTwuoMWwsk2nbexz6DxJV6k0qKWx5O3zHo93Ro67xQ2rYB
 AdcIMgVcGMfpVThaLcBnXRnC5u2HPsdUbbTMdRhDkcX8ef3lXSDej3Wv2+3tPdSlURqH
 nWrPRGUvxfJ2iZmXBvBzCTu0wRZS0rf6t3gYto3ZwoKXiniVwJxPgEtAvExe2pCp82ih
 jf9ZG1vdND5/onvdtR/X0HcMKJc4zjskUxMPeEoRGl0dw+nO+Rrl/PVt2dhpV0KOT6VU
 MuWvIem77gtru3IA1N38mXdioxxg+GQitRVKCcushFt0x2SlmEKIwCXGCRKLOXgr6gUy
 1tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AuaJwaKhUNoYh/ZcFYNjPltT1xEmne8xtIRiBDrxUzQ=;
 b=hBhKdKAT+7uTQ4KlNpuOrIOzrIamKkvvdNitpz0YUmaylO3EKxhcbrjWMA4o0f4Yas
 /H2xJBO9tHG+Vnolc+UqB6I3tg3Lw3IU96bDEwICWTwkqcaZpiSWz0f6HIAJXjNIUSgp
 4HSgdp48GrVCIU3ItaTYCFwJX7KNZqHKoRhfFEjMu8XBFmgD9SMVXm6Y6A0wmIX2c4ye
 RaLjIyjTLQ/TLRPABwhZZr4gbpEO78XMuZUXGpd507ENhTQGm3wCuwNy4RrNr57IFvA1
 5oys4/TkYPEkJcjZ32vkWksqCqG9A7U/TQfxVt9C4BtppcVie28b/zGss+3myKOu5TFo
 Y7DA==
X-Gm-Message-State: AOAM531lbZN3ltmRQhcTx/FjlKYg/fK1QTb2ePE8T39sBZjeZ4HCB6S4
 MviH5y4upz7dqjwEBJaxzJ/0kw==
X-Google-Smtp-Source: ABdhPJwmEVoyNUpOBvd0NNaj3VRAzDYqceDd6KV+/pxO7j8Rq3oOwSHycZYc7379DhMZ8zBJa90M0g==
X-Received: by 2002:a5d:4307:: with SMTP id h7mr35811544wrq.227.1617727997250; 
 Tue, 06 Apr 2021 09:53:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d7sm1926280wrw.63.2021.04.06.09.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 09:53:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 44BB31FF7E;
 Tue,  6 Apr 2021 17:53:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] scripts/tracetool: don't barf validating TCG types
Date: Tue,  6 Apr 2021 17:53:07 +0100
Message-Id: <20210406165307.5993-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 berrange@redhat.com, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TCG types will be transformed into the appropriate host types later on
in the tool. Try and work around this by detecting those cases and
pressing on.

[AJB: this seems a bit too hacky - but the problem is validate_type is
buried a few layers deep. Maybe we should just drop TCGv from
ALLOWED_TYPES and manually do if bit.startswith("TCGv_") in validate_type?]

Fixes: 73ff061032 ("trace: only permit standard C types and fixed size integer types")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 scripts/tracetool/__init__.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 5bc94d95cf..ea078e34b4 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -87,10 +87,11 @@ def out(*lines, **kwargs):
     "ssize_t",
     "uintptr_t",
     "ptrdiff_t",
-    # Magic substitution is done by tracetool
+    # Magic substitution is done by tracetool TCG_2_HOST
     "TCGv",
 ]
 
+
 def validate_type(name):
     bits = name.split(" ")
     for bit in bits:
@@ -405,9 +406,13 @@ def read_events(fobj, fname):
         try:
             event = Event.build(line, lineno, fname)
         except ValueError as e:
-            arg0 = 'Error at %s:%d: %s' % (fname, lineno, e.args[0])
-            e.args = (arg0,) + e.args[1:]
-            raise
+            # these get translated by TCG_2_HOST later
+            if "TCGv_" not in e.args[0]:
+                arg0 = 'Error at %s:%d: %s' % (fname, lineno, e.args[0])
+                e.args = (arg0,) + e.args[1:]
+                raise
+            else:
+                pass
 
         # transform TCG-enabled events
         if "tcg" not in event.properties:
-- 
2.20.1


