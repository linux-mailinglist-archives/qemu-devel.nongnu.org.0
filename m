Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3BB476B13
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 08:34:08 +0100 (CET)
Received: from localhost ([::1]:38022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxlHC-0000Ah-SY
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 02:34:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mxlEm-0007Hv-SH
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 02:31:36 -0500
Received: from [2607:f8b0:4864:20::52f] (port=43760
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mxlEc-00009I-Pp
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 02:31:29 -0500
Received: by mail-pg1-x52f.google.com with SMTP id q16so22274739pgq.10
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 23:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=usIBRdAq1zApdJQtT5S0XOjkrgEQzATABbaNkeFAxZg=;
 b=SXAcgLoXu0g+5ZRMR3MQNuK0T4L70UEPRH8zNX6DKffRYHKV+GtCPwhCJ2bcxf0QeJ
 dP16SA2fz8RXc0NkwkdmOya66h2aHir/VabAs7uUYcRpOcyTwtN6wv6Kla1QMzkSwrwP
 5pjCZvw5cV/UFtqzsFUWPr1PjSYMFDl/cP5S3VM6YchnAfsGPdms5OVTBgbTZAZ99YwA
 rzcy3zcHgJQS6m+vB+CNWm4zK9UkllNPKtDQCR/iQg/niBFQdNya1OjMraOlVh0VJgXm
 0EFUzGd+07FH32d6d5eKsc23MFHcG+FMISx+mQJCX+xurkCAQeie3uutOk+cZrBWJvxb
 m7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=usIBRdAq1zApdJQtT5S0XOjkrgEQzATABbaNkeFAxZg=;
 b=fLk5xGbVsN0XEoxT0kQe0HzL0y3LlnMjPLxkpez0bPiEx4ALwvS3BD5kaqoZyrtkzm
 AIJ0VD1UPBLw68wbiQHrbG0/E+KgoP3zL+wq27P6L8zI64Ghct4RarnYHoIfJMaPuNAX
 d1cY/lt9molzDP+4tyvUWu5l/YX8wAUAdMuO/JIG6mCduTl1K1DteMz+I1duenm8GY8Z
 WBaNh7A13PiA+u+zitKygg7Ifm/HCbz2QIHyqxdfwlM501Mt0IPe5RmtS5LcIlEbyQps
 dhjL108e/bImk1qiHmUvXMj4SJw6kmhovSpRLRlme6sc0ki/TseA2NpURs2elEV42sPE
 ttgQ==
X-Gm-Message-State: AOAM530BcikH6EwBmtqhP851js0HJv1Z/7uymJmnsJxsi6JZoqxspqEh
 ocbegRY+7zU6ANz0nU1O4elOMrJzKV8=
X-Google-Smtp-Source: ABdhPJwtmdoQGgF2FXfTno1M9S9MOpe0GWgdDOddPqrKduOL7ui0fQuXgtcFxz13Xzf/9uASNvStqQ==
X-Received: by 2002:a63:205:: with SMTP id 5mr11211021pgc.57.1639639879854;
 Wed, 15 Dec 2021 23:31:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2b9d])
 by smtp.gmail.com with ESMTPSA id z22sm5098157pfe.108.2021.12.15.23.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 23:31:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] riscv: Set 5.4 as minimum kernel version for riscv32
Date: Wed, 15 Dec 2021 23:31:11 -0800
Message-Id: <20211216073111.2890607-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=raj.khem@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Khem Raj <raj.khem@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

5.4 is first stable API as far as rv32 is concerned see [1]

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=7a55dd3fb6d2c307a002a16776be84310b9c8989

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
---
 linux-user/riscv/target_syscall.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
index dc597c8972..9b13161324 100644
--- a/linux-user/riscv/target_syscall.h
+++ b/linux-user/riscv/target_syscall.h
@@ -45,10 +45,11 @@ struct target_pt_regs {
 
 #ifdef TARGET_RISCV32
 #define UNAME_MACHINE "riscv32"
+#define UNAME_MINIMUM_RELEASE "5.4.0"
 #else
 #define UNAME_MACHINE "riscv64"
-#endif
 #define UNAME_MINIMUM_RELEASE "4.15.0"
+#endif
 
 #define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
-- 
2.34.1


