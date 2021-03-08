Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31363315CA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:21:48 +0100 (CET)
Received: from localhost ([::1]:55526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKVn-0002d2-La
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlD-0007Gt-IS
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:39 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkt-0007AD-2i
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:39 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso4312157wmi.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WuYgwF1OuHFbA8GlfM8FitSCI9xnRIwhF1a26ZyciRA=;
 b=nOMbKvdjCpCyaYVxaA2hvzrSAAeshnzsULdS7CVm2yoMhWQ7g4UmFxzvwF5gbt1C8G
 zdDXtdXUFsNfbG+zVRSG1avYnHh795DQtVQ2fvUq1ddm8i6MHLB6XJ5Sh+8H4OjjJGR7
 V3t4BjnITwh6JXWnSTlL59tlY2wc9eHy2arGGwbDknVZTqhMojq3dmzqOmY0BTrqieK3
 3F5WXO/+6uKcnpqBwKvu5qN6ej8qOnFFyHc6D/xzgq+vQ7Z/QwqpPk1VJl5deDjmo6T7
 Y+T0ZfcZLb4PQZLvZwtmJraLnuqRvpnIZVGENPqP+wPZZ4rjNkqlKmU3tN0eJgONxsuJ
 uMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WuYgwF1OuHFbA8GlfM8FitSCI9xnRIwhF1a26ZyciRA=;
 b=QnWOJV42xpQ7qfOUXSLOqY4MAzs+6KvbFrAwzDwirpZ1YOlmjs3XD9q24MxZ/y5QFU
 3oUYt/iprQBIftR20qCGSKdb50kbwWwROtLxFuGA/qjgfneF1eqQTnyhKPf4D0IWCx6U
 1Kcyrb6W+M09exg8lMCNrUGeDDYcI+TeNg9hEgNQsEQak20leCW2etdn7u6hA47Id2Lp
 EWZxnirfmIDrE7jrA0WGpf/7gN8YZQ/xhdx6e4I/FOUoO5zdTiF/uUqDishprbNJUDfp
 h3PwSm6wD7RxFtA9hjWbK4yCjNZZD4E7N/wMSqrMrJoMvnnz1ucC3bwQaUgrt6EkxN2S
 n83A==
X-Gm-Message-State: AOAM530NjeeyHfhMfa+SXwsmsXGcORkbYGmozpWfVG9zkEG9QzNmnihf
 QQOm3Z2aTRK7/bJle7UEFmGvR0vSWD7KQw==
X-Google-Smtp-Source: ABdhPJx3mzLWSnfOZrtNQP9KH471nrHXRPAnxCJa0kpgBErvazezG0fpHRBagNzH+VjAO67Won80PQ==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr23660324wme.114.1615224797847; 
 Mon, 08 Mar 2021 09:33:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/54] docs/system/arm/mps2.rst: Document the new mps3-an547
 board
Date: Mon,  8 Mar 2021 17:32:33 +0000
Message-Id: <20210308173244.20710-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add brief documentation of the new mps3-an547 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210219144617.4782-44-peter.maydell@linaro.org
---
 docs/system/arm/mps2.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
index 601ccea15cb..f83b1517871 100644
--- a/docs/system/arm/mps2.rst
+++ b/docs/system/arm/mps2.rst
@@ -1,5 +1,5 @@
-Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
-=========================================================================================================================================
+Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``, ``mps3-an547``)
+=========================================================================================================================================================
 
 These board models all use Arm M-profile CPUs.
 
@@ -27,6 +27,8 @@ QEMU models the following FPGA images:
   Dual Cortex-M33 as documented in Arm Application Note AN521
 ``mps3-an524``
   Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
+``mps3-an547``
+  Cortex-M55 on an MPS3, as documented in Arm Application Note AN547
 
 Differences between QEMU and real hardware:
 
-- 
2.20.1


