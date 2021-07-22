Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ABD3D1E8E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 08:57:12 +0200 (CEST)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Sdr-0002Dr-0P
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 02:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6Sbb-0008UF-3p
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:54:51 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6SbZ-0006x2-OJ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:54:50 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 a23-20020a05600c2257b0290236ec98bebaso2313487wmm.1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 23:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jcYcrXSu+KqlQ/6QrGFdUV6rCUe9Kbh1qvz/TUIqCys=;
 b=EjXwaD5275dJT6MSYAgr2Yh0s5/Y7t8NSrsoZzq63xik/JNVA8J21ikdmP9y2m97/6
 Dl7BIvPT1XtiOFWuBlpKezj66I2FdL8ZfQ+d2llk+oG/49q4VmJrn16NBAoPS3bJx7P8
 xgvEzNi654JCRFm0KYQfp4RYwBSthv8ZDOhnu8a4jRKbIzD/AMSNPrUmYoGjgpkxcmYm
 b5QFZMqnaZPwVUlf7P5Yz42F5uKDEGZtDBL5NEyx282Y9ugcqaGTk8VyQtDYE/99hIuh
 4RcKtx5VA0sHpphn0OemYGz2pB+KWompIJwoNG8MZjT4UmMNaaNDElJ647AcZG6jlU+9
 zGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jcYcrXSu+KqlQ/6QrGFdUV6rCUe9Kbh1qvz/TUIqCys=;
 b=mOEJhqieaG0CYui57TlEwLCzG+d3vVPD7ihNdzIMp3MshFq53+i2rCTgNgYI1+iewP
 onwTrz8wTaS/rQEDLNCM+uPHzDMV94zj6ckXvRuoX7k/OZrUaoCZDMh8kaZEXjSNia1A
 8BqObctKz18rMknJ/j8mfQJz8GOiV64C7nQHQN/wCentMlG6uTCjEBq4oKMKBdo9qWbQ
 ZIuispKjiKUrANTxwupngqVsb/Y2NEjvv73hkO9m8BBsmwVBgMrlso9a6znf/sJnH+Yi
 b6WH+lYtZlgyThhGl3ZO+ImbpLCymOrubsp66F+R6aKYWhNgt2Qw9sAyhdQH3YnX5KOJ
 r8FA==
X-Gm-Message-State: AOAM532BnNbP4AQbTbsiK99EJFtzNGF3Oyl7sJx3cj1kYi19MvKaEdXW
 VNOxPnqUc/JC6MCDVcr0gKcEbVhHkyA=
X-Google-Smtp-Source: ABdhPJxyPgRNZQTC/LXtUrvxIDmjDRrUk6CXsx8zEP0jvyIR24Nuw0RmxhvvqkleiOE5Cg6JEMvHxw==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr7159995wmh.89.1626936888180; 
 Wed, 21 Jul 2021 23:54:48 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id b16sm29245426wrw.46.2021.07.21.23.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 23:54:47 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] docs/devel/tcg-plugins: added cores arg to cache plugin
Date: Thu, 22 Jul 2021 08:54:27 +0200
Message-Id: <20210722065428.134608-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722065428.134608-1-ma.mandourr@gmail.com>
References: <20210722065428.134608-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 docs/devel/tcg-plugins.rst | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 595b8e0ea4..370c11373f 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -330,11 +330,8 @@ configuration when a given working set is run::
 
 will report the following::
 
-    Data accesses: 996479, Misses: 507
-    Miss rate: 0.050879%
-
-    Instruction accesses: 2641737, Misses: 18617
-    Miss rate: 0.704726%
+    core #, data accesses, data misses, dmiss rate, insn accesses, insn misses, imiss rate
+    0       996695         508             0.0510%  2642799        18617           0.7044%
 
     address, data misses, instruction
     0x424f1e (_int_malloc), 109, movq %rax, 8(%rcx)
@@ -378,3 +375,9 @@ The plugin has a number of arguments, all of them are optional:
   Sets the eviction policy to POLICY. Available policies are: :code:`lru`,
   :code:`fifo`, and :code:`rand`. The plugin will use the specified policy for
   both instruction and data caches. (default: POLICY = :code:`lru`)
+
+  * arg="cores=N"
+
+  Sets the number of cores for which we maintain separate icache and dcache.
+  (default: for linux-user, N = 1, for full system emulation: N = cores
+  available to guest)
-- 
2.25.1


