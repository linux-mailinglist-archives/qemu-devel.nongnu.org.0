Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49C480858
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Aug 2019 23:09:32 +0200 (CEST)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hu1HQ-0003Qz-00
	for lists+qemu-devel@lfdr.de; Sat, 03 Aug 2019 17:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52017)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hu1GK-00013j-Ua
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 17:08:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hu1GJ-0005T1-Qw
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 17:08:24 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42475)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hu1GH-0005Na-Qb
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 17:08:21 -0400
Received: by mail-pg1-x544.google.com with SMTP id t132so37748074pgb.9
 for <qemu-devel@nongnu.org>; Sat, 03 Aug 2019 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bmpQuQaLO45/V21gwxDx+DwJ2G3aSCxmFjq9t4PMMQo=;
 b=TbDJ/7UnbJ5tKa+3jraWvw1FWaKuke5i8tZyS9pWJDDeQtApkyFVJM+SU6NDcd0JDS
 r702rKwzJRI0CPJ1dBDY8ZQaPev/ARW0VKWwSKRkxcXtz9kpTR1JwV2ms145AAcGqcBG
 fWymPRWy6iHEmfj3IK9leFrMGixXIx4peU61F0MUjJpO8ULjZUSQp8o1DXLEwHLivYOd
 h2QUK6aPr5w06YfjxkZokkRIljBuczwD3O/RaiaBPMbxOKjdJpzpHk1RAGsRlpIuwbat
 kuY+TzlwhC1H9k00Oqw2mF5Y5urGPdilkgtwrI7SobGrg7Ft0kP9YUlgg16XxY9tgA7H
 w1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bmpQuQaLO45/V21gwxDx+DwJ2G3aSCxmFjq9t4PMMQo=;
 b=jPmQHqGiAaA7+fJVK+e5d6+DoesJAV2HaNO2iTcVjGPC/G7Z2/etFMWj9jyBXCbcDI
 AYeIGW2JuEqZtG0uUcJmWMkOCpVkKPIeSoR3/4XlP26/LxMrdmu3Q6cjwTzUwIovLasa
 7gK+Di/FRw9r8tPeX+E/ptADRjjbmiEhqJpefiQcC4Db9SPI1GwK57CHiU4WYNt741fp
 w91b3Rr9yaQW40nJlzuct7mBscJKhDjTC6j2Rowfn+gxE3uS/DZ8lAMSN5Z6PXGWYreZ
 XHCttV9xGEimCl1le4r6mahXo3Pxjw80DLLGh8M7eLBvizPT6sh7uUyxCFRCej/bWiir
 uXqw==
X-Gm-Message-State: APjAAAU7sf297wuwmQ6D53Qcn5Bui2rYkYuC4/2pKk+1s9qEeyzufgIe
 PtEW+F3oRRVScBI0XWVMP0Ictj42J4Y=
X-Google-Smtp-Source: APXvYqwrSbtV283JX55qzojT9ktHXZ98fzkzKQWggzPk4Ci6ekdt41cXHVTIQmb7Ix5SYA9RQ/bv5A==
X-Received: by 2002:a63:6947:: with SMTP id e68mr94509807pgc.60.1564866491659; 
 Sat, 03 Aug 2019 14:08:11 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id x25sm110129644pfa.90.2019.08.03.14.08.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 03 Aug 2019 14:08:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  3 Aug 2019 14:08:01 -0700
Message-Id: <20190803210803.5701-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803210803.5701-1-richard.henderson@linaro.org>
References: <20190803210803.5701-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v7 4/6] include/elf: Add defines related to GNU
 property notes for AArch64
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are all of the defines required to parse
GNU_PROPERTY_AARCH64_FEATURE_1_AND, copied from binutils.
Other missing defines related to other GNU program headers
and notes are elided for now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index 3501e0c8d0..7c4dc4b2cc 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -26,9 +26,13 @@ typedef int64_t  Elf64_Sxword;
 #define PT_NOTE    4
 #define PT_SHLIB   5
 #define PT_PHDR    6
+#define PT_LOOS    0x60000000
+#define PT_HIOS    0x6fffffff
 #define PT_LOPROC  0x70000000
 #define PT_HIPROC  0x7fffffff
 
+#define PT_GNU_PROPERTY   (PT_LOOS + 0x474e553)
+
 #define PT_MIPS_REGINFO   0x70000000
 #define PT_MIPS_RTPROC    0x70000001
 #define PT_MIPS_OPTIONS   0x70000002
@@ -1651,6 +1655,24 @@ typedef struct elf64_shdr {
 #define NT_ARM_HW_WATCH 0x403           /* ARM hardware watchpoint registers */
 #define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
 
+/* Defined note types for GNU systems.  */
+
+#define NT_GNU_PROPERTY_TYPE_0  5       /* Program property */
+
+/* Values used in GNU .note.gnu.property notes (NT_GNU_PROPERTY_TYPE_0).  */
+
+#define GNU_PROPERTY_STACK_SIZE                 1
+#define GNU_PROPERTY_NO_COPY_ON_PROTECTED       2
+
+#define GNU_PROPERTY_LOPROC                     0xc0000000
+#define GNU_PROPERTY_HIPROC                     0xdfffffff
+#define GNU_PROPERTY_LOUSER                     0xe0000000
+#define GNU_PROPERTY_HIUSER                     0xffffffff
+
+#define GNU_PROPERTY_AARCH64_FEATURE_1_AND      0xc0000000
+#define GNU_PROPERTY_AARCH64_FEATURE_1_BTI      (1u << 0)
+#define GNU_PROPERTY_AARCH64_FEATURE_1_PAC      (1u << 1)
+
 /*
  * Physical entry point into the kernel.
  *
-- 
2.17.1


