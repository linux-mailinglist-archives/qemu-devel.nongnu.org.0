Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18CB3DF13D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:17:56 +0200 (CEST)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwB1-0006F6-To
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAw6l-00014V-EH
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:13:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAw6j-0001IJ-SM
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:13:31 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z4so25723270wrv.11
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jjAeLDqMEb8VI0Zdg34bOjhlOJkykWbPtTqIWH2Cx+Q=;
 b=JawZCfXNAFH//wfb42zgPtabSk599Tm82cqNPYBlTYqS9aI42j09qejHHaGqtEiU0j
 rhyD69cX5B+WhY6cGXUj0Aw0MGzG65oZP6nnNdVBR7OMAnXScxOho27yapuo/2BeEOql
 quRKg1V+lODISihxU6AN594z6s1mgpj3ROe0SIArYrWVUCu33x/49q25UNY6+jl2D7IM
 tqtHzv9aL63KslagLa7uY8V602YKUMpUp+qtlWeo2q/6KouXneWTWv94V+VrxPwG3yRZ
 +zL5jp2xTKtS9CYYszb8aVkmNXvOIgehaz1yGequG9H7flVZiX4yB5csGDEv5SYCp2SO
 jAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jjAeLDqMEb8VI0Zdg34bOjhlOJkykWbPtTqIWH2Cx+Q=;
 b=GPNe0OZrlCXmfcGNBEOYdLpAKrF7Fw0fbhUynwf4/MiIZ6ljetJ0LJn6df+Y5sX7Bs
 YvCv7yVJ3aF3FKwT1z9bD3Zmqyb80a2667qTYP9UmLHv8LgLNVQUjmibduM1I0PTlowJ
 nuaTo84bcm+tlwUnI63ydqDN1vLviaKbyTzcM03H0NUZ0R38Ps11KjCSKgvCZmkClwia
 HlhwZxkcrNVLH+baVsOqKHh1rCPYdGsqvFHUSscamfw0wfVpNHNQp3/zaCcJAbxz/iv7
 TiY94c1oYPhljtWX0IPGXfw0pyYLoQfsdXL726dL1Vxzit4Xx+alzfluBbw2+5eK/Iib
 gXGw==
X-Gm-Message-State: AOAM533GJf1X2ridEpqE7qmsNRfII9N8CwsJOhwojdddK1iPY7GFywls
 W2cCBBhNC0g2/1XmmQ36Tl/4kQHhZCs=
X-Google-Smtp-Source: ABdhPJx2v9hYthIgsy0n5ZFmJDrdd946DALsNrtHoCX4XMSwsZO+mNxuvOg8Q7SJhe3B/vTqq+liGw==
X-Received: by 2002:a5d:500a:: with SMTP id e10mr9994579wrt.408.1628003608014; 
 Tue, 03 Aug 2021 08:13:28 -0700 (PDT)
Received: from localhost.localdomain ([197.61.80.206])
 by smtp.gmail.com with ESMTPSA id u23sm2737468wmc.24.2021.08.03.08.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:13:26 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] docs/devel/tcg-plugins: added cores arg to cache plugin
Date: Tue,  3 Aug 2021 17:13:01 +0200
Message-Id: <20210803151301.123581-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803151301.123581-1-ma.mandourr@gmail.com>
References: <20210803151301.123581-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 docs/devel/tcg-plugins.rst | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 7e54f12837..863828809d 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -355,11 +355,8 @@ configuration when a given working set is run::
 
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
@@ -403,3 +400,9 @@ The plugin has a number of arguments, all of them are optional:
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


