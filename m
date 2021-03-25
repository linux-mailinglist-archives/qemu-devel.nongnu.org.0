Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C953498C1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:54:27 +0100 (CET)
Received: from localhost ([::1]:42268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPUBe-0007XV-2F
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPU88-0005km-Uv
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:50:48 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPU7v-0004p0-NI
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:50:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id g20so1656171wmk.3
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ycg8ACmx+oz2JrD2UYc7cfYfGDjv6wZoEd8IS0MEszo=;
 b=kZpSgh7lTVszEVfW6pMGvY+CNgiz2Ie6NIzXtj2KtOI3GTjhYHy+1SfFryJ7CDiVcu
 NtLQ6a9+kf6cHKEIlU0XsI46mBUnmiimsoRhnN9902TfgnS0vtfgxGfkBtwMCT1MBAhg
 Yxvfp6acu89I9tzrzbvNO4a/5CKD/110STPOindpvuFROznktq43W20v6MlDUNj8b9Hu
 ilnPgH+yinraLsNpqcESphcLgfk6WXR/FJYTE04TkqCyNpuW1nBoYv8OVaS4AYE/t+yO
 bZWMo+Z58mWhOOs41jL2R5KYrEIQX4pjtoW9JPVYGmG4IWRLShMjKGxLwTQ7FVYsls4c
 AFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ycg8ACmx+oz2JrD2UYc7cfYfGDjv6wZoEd8IS0MEszo=;
 b=RUJ6LkmiDCbmX7bpQzth4voAa2np7NbY/eXnHFaGtDYHW0lLngwB+sCYeeCxsYJ9Yf
 X8WUYlnqN6RKf4IqiWISUiPwKXkNx6BzzcqNQDO9wFY0/A4qcZvR29kKakKfL6otYdV3
 gMEvpa/mibNCxkiK0LiMZEds5oNkYI1boTHcltY1Wk5Q2pFyv/SKJBQlTPeDoxjKx2Vr
 jEZeRH5NogQTku7/yNDZ48hfSRECTZHNeaSwB+a48oT1WmV2qf1wjeivKneD7yYbkmrM
 fFsS4CXa56G4QIngWX8rjKidTDyIX0uKrRfLEcF+xjc1dpxB5budDAJtFclvDVfesgRe
 d2hA==
X-Gm-Message-State: AOAM530/thSppo8bcnpmvswrFKOeCcz3kp3J3dzpKE13EoCTy4F2rVch
 k0Sgmxztq+a9u/OQ/poc0YaepYT7j8wpZNhp
X-Google-Smtp-Source: ABdhPJzME/tudmK5F7sa7cQbG10JKgpcL1aqcw6lvF/vKH75YM5SLODjuKG6kIjqKgRPr8iVDCY/EQ==
X-Received: by 2002:a1c:5f89:: with SMTP id t131mr8874691wmb.173.1616694625985; 
 Thu, 25 Mar 2021 10:50:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s9sm8180794wmh.31.2021.03.25.10.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 10:50:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 1/2] docs/system/gdb.rst: Add some more heading
 structure
Date: Thu, 25 Mar 2021 17:50:22 +0000
Message-Id: <20210325175023.13838-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210325175023.13838-1-peter.maydell@linaro.org>
References: <20210325175023.13838-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to add a new section to gdb.rst. In
preparation, add some more headings so it isn't just
one huge run-on section.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/gdb.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 72b1e68f4ef..0bb1bedf1be 100644
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


