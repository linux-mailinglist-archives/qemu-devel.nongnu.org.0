Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7241DB7F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:51:24 +0200 (CEST)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwT5-00062G-Jx
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBO-00086M-1t
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBK-0005E3-BH
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:04 -0400
Received: by mail-wm1-x336.google.com with SMTP id b192so4698852wmb.2
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 06:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BBHBXq8Ru5s+ypJN2TXJKrG3+TagSinMXkrtblxPDYw=;
 b=MuqEC7ADWIydIie9+zHF4BxmwZBBaFTDUNZckPxCGh0GlkefILwa/TSktcrlaAItNZ
 IwbfDmesFqWZ6lBhMqwsQMR5hBCsKlrnGCj0LQqatz8f2olNHlcvX3oK8V8AMJqRSHJF
 6GZX1DB5kXzXUi1NNRcIOkTRfBw81aX3vb8nEWLKq/RjYhtA0rHlUYTOIdWU/oajOf6f
 63tLRSsmFMchxHSlBcndf+LhQpc7IKKbyijgkYG1ftbKJKvL2OO4z65Cp/aRaU2GOQGR
 UoR/ljfjXrmhNenCG+CBPaXmaKZN3eZu7aVrEjQLZhkIazlaX1/17rndeGFudtqOACjL
 eLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BBHBXq8Ru5s+ypJN2TXJKrG3+TagSinMXkrtblxPDYw=;
 b=r+rD30xYNDrgmkwIHcgx4qCEfqCFpxDMwDyFbDhoTDb2ActlJSr1Jiz6yr1WyjWIBG
 LthqLFKP0+9Ck0TzSF2cLNYgUqX1GopT2rOXcwgKvy95MkCkDJsY5tgjbdypNw/Plkuu
 B7W7LePgMh906LGwvaoTNdKRmggMm/uv+8QFZFo8E4YTna1mvN+VdhXybS2FJkgczeUd
 in/fAIDe4Ld0sv/Y5uTMXJciDfZQFpf80v4JOV6zcieQychKRpg9lycRF5G3AsFvFBwI
 GNSdbXPEGV9SQ8fhlytCU7S8OxOyU0R9nNBeC+9mb4wOQ4JppinpF43AylRj6Bpj3gvg
 39cQ==
X-Gm-Message-State: AOAM531FmVQjCVdEXdkl8iiWMULtXeU3UbQLmP13u4g28ZHeCirB20A/
 crrhTHgZn8LlRaIUuMvxBEnYbc6hf2Q=
X-Google-Smtp-Source: ABdhPJyZfSuEDy+wSUNhmIYQKlS55IPE/kQk6CBr+E+pHRsRghBdpa3s/7GxkkGn3Tu/GB1+GskUIw==
X-Received: by 2002:a1c:1f0d:: with SMTP id f13mr5414527wmf.25.1633008781053; 
 Thu, 30 Sep 2021 06:33:01 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c4sm3037168wrt.23.2021.09.30.06.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 06:33:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] docs: put "make" information together in build-system.rst
Date: Thu, 30 Sep 2021 15:32:46 +0200
Message-Id: <20210930133250.181156-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930133250.181156-1-pbonzini@redhat.com>
References: <20210930133250.181156-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/build-system.rst | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 3baec158f2..0f636d620e 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -380,6 +380,16 @@ phony target, while benchmarks are run with ``make bench``.  Meson test
 suites such as ``unit`` can be ran with ``make check-unit`` too.  It is also
 possible to run tests defined in meson.build with ``meson test``.
 
+Useful make targets
+-------------------
+
+``help``
+  Print a help message for the most common build targets.
+
+``print-VAR``
+  Print the value of the variable VAR. Useful for debugging the build
+  system.
+
 Important files for the build system
 ====================================
 
@@ -473,14 +483,3 @@ Built by Makefile:
   meson.build.  The rules are produced from Meson's JSON description of
   tests (obtained with "meson introspect --tests") through the script
   scripts/mtest2make.py.
-
-
-Useful make targets
--------------------
-
-``help``
-  Print a help message for the most common build targets.
-
-``print-VAR``
-  Print the value of the variable VAR. Useful for debugging the build
-  system.
-- 
2.31.1



