Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5C817AB13
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 18:01:42 +0100 (CET)
Received: from localhost ([::1]:53258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9tsT-0003oZ-FT
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 12:01:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j9tiB-0002UK-Td
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j9tiA-00066M-Px
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:51:03 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:51840)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j9tiA-00065c-Kg
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:51:02 -0500
Received: by mail-pj1-x1044.google.com with SMTP id l8so2728250pjy.1
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 08:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=1MaaEtwKMFY1TpAkMmcdOhFvki73sjGjSM2t7iCfOEQ=;
 b=sWATFSgaSug5/N3mEcHrbK+PoJ7a6Gv9Y3fIJGJlfGQCcjjcRvXO0Xcb83LNmgUx+2
 kgoGQp1p6EPWCpNIN8GKAwQ9hGkVNfEAYWBWTZQsrVRINeIFcOVl4BKi7trLtHfG7d9G
 taxlKpls4W2zP9q00R7ZL6a2YSbfl4QLsJqn72LC9ibWV2xIh/qmDwVk/Om9PnYEM62u
 91gxzGnMlMa9czWzOKRAkZUT3OgSHz+h/WL8uqceY5cmIkj/MFXlmQvB0HUH6Z7ySbNO
 +XCZDyGulGt22Ha4ZrWjjzIxHqD4Jdab9ufc3rzEr4kJ1N+vYMemPEAgz+iqP1nII3u9
 cN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=1MaaEtwKMFY1TpAkMmcdOhFvki73sjGjSM2t7iCfOEQ=;
 b=hOc1H+48T9uN56ZDrA5gLfS1JM2BFrpnS9kHpbRAUNBFr4KwIA54rKrLPN0DzQ/fZb
 6dIRqdT2l01Qw71pKDzJ3xh/bdxcMe37N6aBoEikL+/Vn4D+b0t6Tj1yObSM/yNEQQ6V
 qOn61AVYXVwNcJQv0EkGPSvRqa2d8MwgNFolrtKTV71D6ANGP8PEeB3FXVF+aCHgKOkc
 56M4Jg/V0nZsbj/bRVICOypeS8LsA4WHuRfI8la/Y7AAaP1KvdeNzyS/Pp1pMnr+N1Zm
 d7xo/JOJ8lRHxv15x6GoF+CZwbKl/qCZ18AU7/krqDwc+ovMXv5L5o1Pes1ekxZ02Mu5
 Em2g==
X-Gm-Message-State: ANhLgQ0Ooft6DMrX77aSwkhXfVC0dXiSW/x4ccmRiFW+6xNYZpfKSmbd
 MWCxzs34WE8iDnmlpQnodzYccdrwJYJGvQ==
X-Google-Smtp-Source: ADFU+vuH7aN0Tp6YM5B0ZXPmtUMMM96PDTWdg6dNPVpFnC5hEoMDrRMOVcPRYpu+tR8djvHmm50E+Q==
X-Received: by 2002:a17:902:9349:: with SMTP id g9mr382084plp.16.1583427060673; 
 Thu, 05 Mar 2020 08:51:00 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id n9sm29033303pfq.160.2020.03.05.08.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 08:51:00 -0800 (PST)
Subject: [PATCH] RISC-V: Add a missing "," in riscv_excp_names
Date: Thu,  5 Mar 2020 08:48:39 -0800
Message-Id: <20200305164839.201311-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>,          qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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

THis would almost certainly cause the exception names to be reported
incorrectly.  Covarity found the issue (CID 1420223).  As per Peter's
suggestion, I've also added a comma at the end of the list to avoid the issue
reappearing in the future.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c47d10b739..c0b7023100 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -66,7 +66,7 @@ const char * const riscv_excp_names[] = {
     "exec_page_fault",
     "load_page_fault",
     "reserved",
-    "store_page_fault"
+    "store_page_fault",
     "reserved",
     "reserved",
     "reserved",
@@ -74,7 +74,7 @@ const char * const riscv_excp_names[] = {
     "guest_exec_page_fault",
     "guest_load_page_fault",
     "reserved",
-    "guest_store_page_fault"
+    "guest_store_page_fault",
 };
 
 const char * const riscv_intr_names[] = {
-- 
2.25.0.265.gbab2e86ba0-goog


