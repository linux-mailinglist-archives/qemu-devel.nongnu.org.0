Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E735572C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:02:44 +0200 (CEST)
Received: from localhost ([::1]:59428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnE3-0007lS-7b
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCM-0006Q0-Ou
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:00:58 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCK-00053l-81
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:00:58 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x7so14571790wrw.10
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+t3YZRN8RJbaF5Xe0/VHgfu1mXeGtvL3md2FwL8JLSU=;
 b=C7WvzXiWJ4ZnYjqrXinI7kHZNEYUBNuAV1CHezkBHB+XiecrI9qQO+Uf6pI4gir6/J
 MDX6d5Dvg+YjpeAYvC/aMNbLDBH9wIml2Ih71d29Km1b8Ow40nOH+0lTTvXh3vznIP17
 TPq+Nil86waRzIAqvqNOzJO0msDAsAapqFbU+FfUav/crU1GdeDRacyTgWtYyx3UJess
 yWiW6SRVvB4TgEvVZ1ZMx9Y23tzxm6UBYB5xeLvPWdn06plyqfWFEb4/SgkDUEhymbOA
 ykUm57g0nTr/s6fL0cA/frJJGt76n23hWXVk0movSO6z19sv5eC0VesDaO5l2+URAZ12
 cdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+t3YZRN8RJbaF5Xe0/VHgfu1mXeGtvL3md2FwL8JLSU=;
 b=GzVGHND0SlufWmUBdFIBdoxIZ5fyaB9ND+otOFhjU08bP1ZbQCs6kFEnhYBD52iGcS
 1Nq275LLOsZERR/T+fUrvctLJLMcCtF8D2dmBdqGyGWlQbn80sfh9bq+dcdbm68wQo3r
 77IggxJ54iOVSV4leAMDt4dawTnRXygsMkU8py8wKCFqpkUR8xsh5KfsnPbezXv/swY1
 HrNEDzrjEmga+q7YWblDRwZ4fPPksQqKG0Zi0xsR2FrEbanJFAP7KhumuX0MoxwL/aS/
 6vn/WBiHvPBfcb1uymZFJa/9qZz8NNnoDLWtL5Qdjz5ve6/OIc0uiUJZR36rLGy5afmQ
 lgAw==
X-Gm-Message-State: AOAM530UR1QIHnqZYUir1lLUxUD793Hy3VbnKuqkd1U0Ejd4bb1Q27lC
 xlzpryhPbBYj8B3s+rZAeATydA==
X-Google-Smtp-Source: ABdhPJww9U9Jff+Nbo1qQn/8XSrb+X7WBOs3XTPsSK77VT65mXVwaMDIS7VGXxX5V9Of24tvjv9xFQ==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr22804398wrs.410.1617721254818; 
 Tue, 06 Apr 2021 08:00:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a15sm32632574wrr.53.2021.04.06.08.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BDA451FF96;
 Tue,  6 Apr 2021 16:00:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/11] docs/system/gdb.rst: Add some more heading structure
Date: Tue,  6 Apr 2021 16:00:38 +0100
Message-Id: <20210406150041.28753-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
References: <20210406150041.28753-1-alex.bennee@linaro.org>
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
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

We're about to add a new section to gdb.rst. In
preparation, add some more headings so it isn't just
one huge run-on section.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210325175023.13838-2-peter.maydell@linaro.org>
Message-Id: <20210401102530.12030-9-alex.bennee@linaro.org>

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 72b1e68f4e..0bb1bedf1b 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -45,7 +45,11 @@ Here are some useful tips in order to use gdb on system code:
 3. Use ``set architecture i8086`` to dump 16 bit code. Then use
    ``x/10i $cs*16+$eip`` to dump the code at the PC position.
 
-Advanced debugging options:
+Advanced debugging options
+==========================
+
+Changing single-stepping behaviour
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The default single stepping behavior is step with the IRQs and timer
 service routines off. It is set this way because when gdb executes a
@@ -88,6 +92,8 @@ three commands you can query and set the single step behavior:
       sending: "qemu.sstep=0x5"
       received: "OK"
 
+Examining physical memory
+^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Another feature that QEMU gdbstub provides is to toggle the memory GDB
 works with, by default GDB will show the current process memory respecting
-- 
2.20.1


