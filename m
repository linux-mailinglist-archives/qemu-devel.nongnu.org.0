Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C6A3D0C98
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:54:49 +0200 (CEST)
Received: from localhost ([::1]:45486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69sG-0005un-6j
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69aw-0004Gu-0F
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:54 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69at-00059l-Jb
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id k4so1631033wrc.8
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jcYcrXSu+KqlQ/6QrGFdUV6rCUe9Kbh1qvz/TUIqCys=;
 b=tvIUUkCIuv8pOzB2FUz5EiTHZpdeISfZ2Y99V9NNtZRU+4s4j4+wXIShaO5KZ0oRzB
 qdTZIIH6gan3ZxQsLrlZhZbChdyggsLOmx2cXHdot8MkP8idGt17Ath398Nhfgf+4LnC
 9+mQZa87bmjlBnCI8CBbiVW/K6D1WjjQkd//ev6Ee4LutEjChpF12wTVjIwatdRTIp/a
 kIJPpkMVUg7dcZK7QdSDdW/ZzAfHD72CZ0EyQhg0DKkDHzkjCEqnK3a3yFkpkGwQh6jy
 V77QY09rKAsHZxMyft+HEQJtBMRtI1tsQcTErmA08WBwF+MyfFMIpG+RZy4hBBxyDhNk
 hObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jcYcrXSu+KqlQ/6QrGFdUV6rCUe9Kbh1qvz/TUIqCys=;
 b=Y6IFZb9iTM4f2pWMPb5J661jTCMqYnTeYg7zRuPEpqLRZTattprgztRZT24HuyySWw
 DJyBKIGWGCyQgQ3MuuN6A6RjVoGKPDC3koG70CBF3IO86fAmfv24O1gpUWKwSFctTkNc
 Ekbxrk7QjDKdvKdh1WftyclSm4xUd7Ok+Wek9jiVf0ES+kAUftas57LoXHvYYLk9bDEP
 fLFcil9s+SCmk2JBHZ7dk7X4LRy8vFHAZcuPabd8Ob19yGtXJromDHNRjAH95qeZW4+B
 BOLyKQJVjPeSGTmhuqXiBAE/cKMcKE3SYQ0F9EHmChNdOqB2Tte3SOhhvck2KGp+EFyM
 6j3A==
X-Gm-Message-State: AOAM531rrMT4RhQ5EzX/RllxBbiXMMaf330l7GPQb6f0S2RWPZsCzSat
 J3BNNcWwY12an8eKI5irvFo2O9OT0ns=
X-Google-Smtp-Source: ABdhPJykPWW6v4IoecSxgjiZgJVBFLgkTj+g/+FW9/jU/SbO1xhXTS6Z6QRL2wcCAIQR3KASAm9ISg==
X-Received: by 2002:adf:f54e:: with SMTP id j14mr41443082wrp.91.1626863810035; 
 Wed, 21 Jul 2021 03:36:50 -0700 (PDT)
Received: from localhost.localdomain ([102.47.167.62])
 by smtp.gmail.com with ESMTPSA id s24sm28854019wra.33.2021.07.21.03.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:36:49 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] docs/devel/tcg-plugins: added cores arg to cache plugin
Date: Wed, 21 Jul 2021 12:36:10 +0200
Message-Id: <20210721103612.48844-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721103612.48844-1-ma.mandourr@gmail.com>
References: <20210721103612.48844-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x431.google.com
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


