Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26F13DD736
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:35:20 +0200 (CEST)
Received: from localhost ([::1]:37032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAY6C-0008EP-0A
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAY38-0003qR-G9
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:32:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAY36-0006WO-TQ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:32:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c9so1245203wri.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jjAeLDqMEb8VI0Zdg34bOjhlOJkykWbPtTqIWH2Cx+Q=;
 b=Oi5pK6+3UzBZq5xS+03ul5EJBO5KotuiDDsY+rDByyxrMPY3wKh9Svg5HAWgP77IO4
 BzBp/kM8QlFHMQh/Towxw/543ap6jnVzWBnR3G7BiVgVdnldZiIu43+X88iCExCeJHQr
 V1z1IaXByrhi28mfooLViy3HOYjJGWckOgeiYAQhQdkzi98q2qjcQ4SCCZpIRBwOudth
 s5Yx6CmncQbX1/6Bmqm8af0UPxSRCDhB62spTmWdPQtVWiNCLa6LbOpY+VgJ6gpXsg4t
 HFILclrrBhUFNh+YI/8q5xD4U9BnXrZgdSwOD7Bga0URQH9vpj21kTNYBI6lWdQ3qNM7
 Oj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jjAeLDqMEb8VI0Zdg34bOjhlOJkykWbPtTqIWH2Cx+Q=;
 b=CHfIhSwCdchjCO+wfogoI8jWbl70vZRtIpL9hyR4aReJOYaT/4LqnsAsDmnt1LiH0q
 cQO/CzaHCoN/aBV0ymk1pdDFB6tp3rfamFHRJkr3fuCaOI9uOWr5IiAw5CYL2d1gMO53
 IAS1Jy/02WUigsjB4WdEpC0ZYjiZdLlOvvtQkEdp+y3sPphzEO9m1dzxyMRKV9y2DfZ/
 eTai/ShK21Va+12222q7ZqfxxuYka+usQrtuifoZB7Fjl/CeCuzh4ILsshyxoAyga1rh
 pVS8IHUtcqfOnazlljAwleusky9QIaHTEFr9t76M6mC5JYm98lVAVH6EPggosv6+l9Lo
 zmVg==
X-Gm-Message-State: AOAM530wiuvCp4pkwe1YqmtGiRhSpDgA4vcXMEKqtD1SEwx7CIj20+/R
 ROOEJVQWS1T+DqFM2nDeNjWGziKu8L0=
X-Google-Smtp-Source: ABdhPJy2vylgJjHJbEEgORd38ShyTyPZc5dJtJFAmk5IiXOvFqFBDzE59w3zWpiRQtusUXBXzEukgQ==
X-Received: by 2002:a5d:4803:: with SMTP id l3mr17936141wrq.131.1627911127315; 
 Mon, 02 Aug 2021 06:32:07 -0700 (PDT)
Received: from localhost.localdomain ([197.61.223.190])
 by smtp.gmail.com with ESMTPSA id a2sm11269589wrn.95.2021.08.02.06.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 06:32:06 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] docs/devel/tcg-plugins: added cores arg to cache plugin
Date: Mon,  2 Aug 2021 15:31:43 +0200
Message-Id: <20210802133144.45196-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802133144.45196-1-ma.mandourr@gmail.com>
References: <20210802133144.45196-1-ma.mandourr@gmail.com>
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
 Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 alex.bennee@linaro.org
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


