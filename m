Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362762B9772
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:10:01 +0100 (CET)
Received: from localhost ([::1]:58850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmVU-00027h-Ae
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:10:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmUG-0001ey-5b
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:08:46 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmUE-0003D7-G9
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:08:43 -0500
Received: by mail-wm1-x341.google.com with SMTP id h21so7238289wmb.2
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+q3K40t2HbCAMUhLRuA65bt0kQ3tEBvB0h4LBbc5/0=;
 b=A9+WN4H2xbnKJC8FDnRiJKaLahWlVrxibQv7GCCeAYl4Syps31n7z7O/wZZJSZk1kX
 aVknZ3hGP28oyDiicGbjSBdAwxafFrFW8LkJnnPqZNncuCsJQO3IUWUbA7n1jGmvCNOl
 Nx+PZm3h1IJYj0Qgw9ogVLymN0t3PZ1JI5eUMJQ0ihlifeXlrMhVvBlR/kh7wBGJbVqs
 zxfezBxbd+WznhCdEUAIKkSCKsMfEqMElU8mZjGSVntOkGK6xgxgI9Bj92/p1znBlTtW
 1qc7Jfm76rpcTJNLKDX4vtWNHVjBcpf34juK/z0CRXLKPpcN3yw41ZOeGHmZ6/kIHij9
 CUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=X+q3K40t2HbCAMUhLRuA65bt0kQ3tEBvB0h4LBbc5/0=;
 b=KpGyqx66m4EzdvtajuXXnX+EnT0RNoumjaK7Yw4YUNo7zLCzKZZuhxh5yXbrJq0XCy
 ENmkW0IVSfow37K8vAx6SoS7gLPnhrj08cuwSvMPFicyGVZmNrurs5DuSjKF7pxPcNUS
 QuJacaNWR2GTvs79kdzsvtWD13v+fQ63ieBNmdfs07i6IZxtD+BYnlGQYcXLoMzXzl8r
 0qrD+qBECfV2h/lV0V+J4P0zcoVTYgiqtX/FUMatTtYzaNhRtCk91s4BZs8M95D6eye4
 zS+YWxIB+H5aKSzkUNJzfX/42kraCZVFdywNTqH8o4wq11VgOUKNosLqlGUWWk0Po8AQ
 hY6A==
X-Gm-Message-State: AOAM531yPMCMjwKyDC4q7kUZIy1bkOGXOODYEVEnsfYJFg29Tabm8Zqd
 rMUKUw/cYL+z+5opcWvWE/fNO2Vzadc=
X-Google-Smtp-Source: ABdhPJxDPhB9sASdMQGeg/0c/fK/jvJzDFqjxP4yyPfA5YITYboS36iJYAfmbrrX4G5PcigeF3S4ZA==
X-Received: by 2002:a1c:a548:: with SMTP id o69mr5063207wme.23.1605802120571; 
 Thu, 19 Nov 2020 08:08:40 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id e5sm311839wra.80.2020.11.19.08.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 08:08:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2] docs/user: Display linux-user binaries nicely
Date: Thu, 19 Nov 2020 17:08:38 +0100
Message-Id: <20201119160838.1981709-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

linux-user binaries are displayed altogether. Use the '*'
character to force displaying them as bullet list (one list
per architecture).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/user/main.rst | 99 ++++++++++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 43 deletions(-)

diff --git a/docs/user/main.rst b/docs/user/main.rst
index bd99b0fdbe9..8dfe232a3af 100644
--- a/docs/user/main.rst
+++ b/docs/user/main.rst
@@ -170,68 +170,81 @@ QEMU_STRACE
 Other binaries
 ~~~~~~~~~~~~~~
 
-user mode (Alpha)
-``qemu-alpha`` TODO.
+-  user mode (Alpha)
 
-user mode (Arm)
-``qemu-armeb`` TODO.
+   * ``qemu-alpha`` TODO.
 
-user mode (Arm)
-``qemu-arm`` is also capable of running Arm \"Angel\" semihosted ELF
-binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
-configurations), and arm-uclinux bFLT format binaries.
+-  user mode (Arm)
 
-user mode (ColdFire)
-user mode (M68K)
-``qemu-m68k`` is capable of running semihosted binaries using the BDM
-(m5xxx-ram-hosted.ld) or m68k-sim (sim.ld) syscall interfaces, and
-coldfire uClinux bFLT format binaries.
+   * ``qemu-armeb`` TODO.
 
-The binary format is detected automatically.
+   * ``qemu-arm`` is also capable of running Arm \"Angel\" semihosted ELF
+     binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
+     configurations), and arm-uclinux bFLT format binaries.
 
-user mode (Cris)
-``qemu-cris`` TODO.
+-  user mode (ColdFire)
 
-user mode (i386)
-``qemu-i386`` TODO. ``qemu-x86_64`` TODO.
+-  user mode (M68K)
 
-user mode (Microblaze)
-``qemu-microblaze`` TODO.
+   * ``qemu-m68k`` is capable of running semihosted binaries using the BDM
+     (m5xxx-ram-hosted.ld) or m68k-sim (sim.ld) syscall interfaces, and
+     coldfire uClinux bFLT format binaries.
 
-user mode (MIPS)
-``qemu-mips`` executes 32-bit big endian MIPS binaries (MIPS O32 ABI).
+   The binary format is detected automatically.
 
-``qemu-mipsel`` executes 32-bit little endian MIPS binaries (MIPS O32
-ABI).
+-  user mode (Cris)
 
-``qemu-mips64`` executes 64-bit big endian MIPS binaries (MIPS N64 ABI).
+   * ``qemu-cris`` TODO.
 
-``qemu-mips64el`` executes 64-bit little endian MIPS binaries (MIPS N64
-ABI).
+-  user mode (i386)
 
-``qemu-mipsn32`` executes 32-bit big endian MIPS binaries (MIPS N32
-ABI).
+   * ``qemu-i386`` TODO.
+   * ``qemu-x86_64`` TODO.
 
-``qemu-mipsn32el`` executes 32-bit little endian MIPS binaries (MIPS N32
-ABI).
+-  user mode (Microblaze)
 
-user mode (NiosII)
-``qemu-nios2`` TODO.
+   * ``qemu-microblaze`` TODO.
 
-user mode (PowerPC)
-``qemu-ppc64abi32`` TODO. ``qemu-ppc64`` TODO. ``qemu-ppc`` TODO.
+-  user mode (MIPS)
 
-user mode (SH4)
-``qemu-sh4eb`` TODO. ``qemu-sh4`` TODO.
+   * ``qemu-mips`` executes 32-bit big endian MIPS binaries (MIPS O32 ABI).
 
-user mode (SPARC)
-``qemu-sparc`` can execute Sparc32 binaries (Sparc32 CPU, 32 bit ABI).
+   * ``qemu-mipsel`` executes 32-bit little endian MIPS binaries (MIPS O32 ABI).
 
-``qemu-sparc32plus`` can execute Sparc32 and SPARC32PLUS binaries
-(Sparc64 CPU, 32 bit ABI).
+   * ``qemu-mips64`` executes 64-bit big endian MIPS binaries (MIPS N64 ABI).
 
-``qemu-sparc64`` can execute some Sparc64 (Sparc64 CPU, 64 bit ABI) and
-SPARC32PLUS binaries (Sparc64 CPU, 32 bit ABI).
+   * ``qemu-mips64el`` executes 64-bit little endian MIPS binaries (MIPS N64
+     ABI).
+
+   * ``qemu-mipsn32`` executes 32-bit big endian MIPS binaries (MIPS N32 ABI).
+
+   * ``qemu-mipsn32el`` executes 32-bit little endian MIPS binaries (MIPS N32
+     ABI).
+
+-  user mode (NiosII)
+
+   * ``qemu-nios2`` TODO.
+
+-  user mode (PowerPC)
+
+   * ``qemu-ppc64abi32`` TODO.
+   * ``qemu-ppc64`` TODO.
+   * ``qemu-ppc`` TODO.
+
+-  user mode (SH4)
+
+   * ``qemu-sh4eb`` TODO.
+   * ``qemu-sh4`` TODO.
+
+-  user mode (SPARC)
+
+   * ``qemu-sparc`` can execute Sparc32 binaries (Sparc32 CPU, 32 bit ABI).
+
+   * ``qemu-sparc32plus`` can execute Sparc32 and SPARC32PLUS binaries
+     (Sparc64 CPU, 32 bit ABI).
+
+   * ``qemu-sparc64`` can execute some Sparc64 (Sparc64 CPU, 64 bit ABI) and
+     SPARC32PLUS binaries (Sparc64 CPU, 32 bit ABI).
 
 BSD User space emulator
 -----------------------
-- 
2.26.2


