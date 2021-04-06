Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29677355778
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:13:46 +0200 (CEST)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnOj-0003Bf-8S
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCZ-0006hY-C4
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:11 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCX-0005Hi-J2
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id p19so7540311wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ZWLMlQokbn+ytm36tLs/g7l/rfbZT4dElLqTmVGEvY=;
 b=t5CMIakZ15gFy9GFcx/hZRKyfa6ytzlvJUCeJJXCU+idYrAJIODyCKWGz96fSxQ9hO
 YZK4FXJ+SWbdKthuqWlT70vV7oONCu3TZorR/hUSv7Ezgkb6l4VwcyZ29i6KaXkYvMtR
 K0nYG+EudOYRpd2NTUF5wlFBqA8QZEStcKvtCxRL7I1SaJyGgFw3zfiwwQclUrfNFsp4
 jaPLWrvll+nRdqwEZh83JtEH8pGRox0jpk5AkM5A+pPk2PevZWHrGPzDnMDH5dWxe1+k
 5zEyFP9TWF1zWbf7VbjRWaSL/mZhtr5RBmwV9hpQ5m6CznEuQAq07Dc2vrPgKjIzup1O
 v5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ZWLMlQokbn+ytm36tLs/g7l/rfbZT4dElLqTmVGEvY=;
 b=mpSolGfqyn+s5mC2rwXRjxHB81r5o1eOZmbVm2KM8NwOk1GMJdoQ8b68y3BmaSe30d
 J83ZnHYX+71ezYSvnwhsW/1Smikjs97Txs1XZuY8RqigwcB4x7mJEDj7rnaZqeoNlLdz
 zYERF7V6JhX1d8uT10mj3zwdrdz23w2VpTILoGjwATksli0M/2uajV3yIr2jQ0uZnY5+
 xCbf08ov1icud2iDEvQfkxosaDUTarWSIzmgCw6MZRnhlcRitot+YpKMaeQqgaKoUXcG
 ouvAwculmocnOk6CteAWqWV74mkU3wQTr6gH5AJUqWBoIbEThpRaX4K+q4D4/ddzQa2Q
 vxDw==
X-Gm-Message-State: AOAM533UmJfAP+nui2kDrVzegnvVG69zwBVIrx/aXhI/imfwYEcwEySG
 XMN0gYuAI5Xa/7U9FdQaMf+uxA==
X-Google-Smtp-Source: ABdhPJykDIc3xJZ/X3i0Isch2L+uNgTDcl+NOBXGCXBmKy3LI7sqcaOsM8FHB/m0wkBOkdZFEJdyPw==
X-Received: by 2002:a7b:c188:: with SMTP id y8mr4507569wmi.76.1617721268174;
 Tue, 06 Apr 2021 08:01:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u19sm3028804wml.28.2021.04.06.08.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A98F11FF93;
 Tue,  6 Apr 2021 16:00:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/11] tests/tcg: relax the next step precision of the gdb sha1
 test
Date: Tue,  6 Apr 2021 16:00:37 +0100
Message-Id: <20210406150041.28753-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
References: <20210406150041.28753-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the version of gdb we may not execute the first line of
SHA1Init when executing the first "next" command - instead just
stepping over the preamble. As we don't actually care about the
position of the PC after the steps and want to be sure the
context->state[] has been loaded before we inspect it do a double next
at the start.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210401102530.12030-8-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/gdbstub/sha1.py b/tests/tcg/multiarch/gdbstub/sha1.py
index 2bfde49633..423b720e6d 100644
--- a/tests/tcg/multiarch/gdbstub/sha1.py
+++ b/tests/tcg/multiarch/gdbstub/sha1.py
@@ -40,7 +40,10 @@ def run_test():
 
     check_break("SHA1Init")
 
-    # check step and inspect values
+    # Check step and inspect values. We do a double next after the
+    # breakpoint as depending on the version of gdb we may step the
+    # preamble and not the first actual line of source.
+    gdb.execute("next")
     gdb.execute("next")
     val_ctx = gdb.parse_and_eval("context->state[0]")
     exp_ctx = 0x67452301
-- 
2.20.1


