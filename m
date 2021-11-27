Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E1546016F
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 21:24:34 +0100 (CET)
Received: from localhost ([::1]:43078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mr4FN-0001je-8C
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 15:24:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mr4Ag-0003oK-7u
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 15:19:42 -0500
Received: from [2607:f8b0:4864:20::12f] (port=46683
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mr4Ae-0004u5-Bf
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 15:19:41 -0500
Received: by mail-il1-x12f.google.com with SMTP id j7so12631166ilk.13
 for <qemu-devel@nongnu.org>; Sat, 27 Nov 2021 12:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=18nG1RiOQQDpk4JlKalLlRbugb78uilgZdJRzkAfZlM=;
 b=rk7KN4YpniH8nK8f6371T3eBKVCZ5uuCLe2p/s/s1UaXCWFc7QcS2ttQvkI4N5iHq9
 NHVXvYtrink5ehcWHsusehjMMwHzmLisOmHCB6R9J2IpGaIU14LA/+R3sAqKc6cgxXry
 NqYIUd9Aw/0nkgzqYVnSYc7c7Ptrz9+ohdBEtm3xBU/fQ5L1LJInfS/kU5xBZGcguyMe
 OoMumIQmOoCeyLuJyenqg44JTljyifZhijXRjiMOAAqVdMuBzOCvwiq8v+AtkX6CH28G
 hWwVuE2r9ksmpb8v1S0Uow6lge1J2iG6fpTfipSHZc4Skpc8LYjofYhxwjpUaqO2bSQ4
 /Ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=18nG1RiOQQDpk4JlKalLlRbugb78uilgZdJRzkAfZlM=;
 b=TwwR/q6gcXLxWGnKokNZ32RDBCYujypXua1cAk6GIEw38VRP0rKxehrf7LBK5fToBE
 3S9VRpKtUVedkYvOtemPaoG7tTqvVtnB0MfymNaWESdmdfD53+PAIZr9ME0AFWi+6Gpp
 JBK4SxrKbkVJ6fuxlbwdbsWq6ZWP5rkO2EuG33O1G+3c/WatDPexcSf/VQUVYQSz1YMe
 +j4WKs/t4sCN9cmF9LaHYkb0aytdFglnJ+/nqNRrQaaFZRDTN+I/bGYNY4X/GehCh3bi
 kMfkHkc0IA01qWG/Th/qoiuMSwAVeWnDZZiQjrniQMXRgVPZGWhBfUDpUe9VC4CkqCLL
 6pbw==
X-Gm-Message-State: AOAM530A9/6kLcTxdyzDWOTVw4WXQOPApuS8SXr6EWnhNXeLBj7jgcir
 xRVk25pTch9axpYnHSVWXmxNy6y7GIBEZ5Ze
X-Google-Smtp-Source: ABdhPJyf6V3vvq17qBwC1oNpEe3HjZz/Kqb5Ci+wJ6h9rcOVFE1KQ5Bvk7YRPhXQ5+LiDIqtZfVZkg==
X-Received: by 2002:a92:7d11:: with SMTP id y17mr37372864ilc.223.1638044379135; 
 Sat, 27 Nov 2021 12:19:39 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h12sm3091632ila.81.2021.11.27.12.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 12:19:38 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 7.0 3/5] h.amd64: Simple hello-world test for x86_64
Date: Sat, 27 Nov 2021 13:18:44 -0700
Message-Id: <20211127201846.64187-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211127201846.64187-1-imp@bsdimp.com>
References: <20211127201846.64187-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: arrowd@freebsd.org, kevans@freebsd.org, richard.henderson@linaro.org,
 f4bug@amsat.org, def@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A simple, tiny, statically linked 64-bit x86 'hello world' test. It uses
two system calls (write and exit) and provides a basic sanity check to
make sure that the arm bsd-user binary can interpret FreeBSD 64-bit
amd64 binaries. Please note: it's named amd64 because that's the target
name for FreeBSD's clang and it simplifies building a little.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 tests/bsd-user-smoke/h.amd64.S | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 tests/bsd-user-smoke/h.amd64.S

diff --git a/tests/bsd-user-smoke/h.amd64.S b/tests/bsd-user-smoke/h.amd64.S
new file mode 100644
index 00000000000..a769e59beb8
--- /dev/null
+++ b/tests/bsd-user-smoke/h.amd64.S
@@ -0,0 +1,28 @@
+# Copyright (c) 2021 Warner Losh
+# SPDX-License-Identifier: BSD-2-Clause
+
+#include <sys/syscall.h>
+#define STDOUT_FILENO	1
+
+	.text
+	.globl	qemu_start
+	.p2align	4, 0x90
+qemu_start:
+
+	# write(1, .L.str, sizeof(.L.str) - 1)
+	movq	$.L.str, %rsi
+	movl	$STDOUT_FILENO, %edi
+	movl	$len, %edx
+	movl	$SYS_write, %eax
+	syscall
+
+	# _exit(0)
+	xorl	%edi, %edi
+	movl	$SYS_exit, %eax
+	syscall
+
+	.section	.rodata.str1.1,"aMS",@progbits,1
+.L.str:
+	.asciz	"Hello World\n"
+.L.strEnd:
+len=.L.strEnd - .L.str - 1
-- 
2.33.0


