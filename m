Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD6D30F91
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 16:03:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWi86-0005wZ-TN
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 10:03:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWhos-0007XO-PJ
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:43:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWhor-0000Tj-Pe
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:43:42 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33115)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWhor-0000Sq-Kt
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:43:41 -0400
Received: by mail-ot1-x341.google.com with SMTP id n18so9230387otq.0
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rNgSWAbxlywlQ4KxHC7oNVwolWTAQUxbjiBFeCf/M3w=;
	b=W5o53EZBCXmYPS30t0zcWJXRsn1SgcwCAZqNHFiwmu/wst3HCvKHp2/pzgCBEgagBr
	NnuaJBPK9EuzOH/2yL9beFP5dzXvxuRq5a7BwDbQSNPyzrI/HaIedQFoWqNVtq4nItkO
	lWZ4bd2gCnUA4r2phqnCV99sUA/osZX3Xh14V4ShbIfAyGvETsRAqWnqG+v1xpt14p6o
	Q7eUGqUZ4m25bCT/zRsar8Xf3yHGLqf8Ey0zh2hYZ7XFTyhfKUFdjtBqCHIYtPK+KsOp
	uLxD59JOj+giHXkz5sBVkZiKp7XRVVCZsJgIh1S5BBvAD0o1BrQ23U+UG1eWVJE4Lciz
	WX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rNgSWAbxlywlQ4KxHC7oNVwolWTAQUxbjiBFeCf/M3w=;
	b=G0xSsJPU/jNsHhj2wufTBSHwIY05b0IFcG7syN3A0yYGoAe7djgPRu/F7pzmaTqxM1
	AGjQjDZqlgZrP6iF8nU0qr+Outdo55kDZnuECGXRHUEw/5pf+YoiKxO4nI1QX9Rv5JaL
	uKJwEJotczMXXs/gMwzIQEQl8Kx5j6apqtn9AmZAvnGydRc4OMrHXDkLqWaAbq2jPd+e
	+F3Oq2KWXAZ0sCewS5VX2sntYM68ruy22i1c8fl0sq+NMWyLg0Q8lVAfXt9az3eLfgBU
	NSLiEO1oTVQDLiKrpELVZE11SPVZivAsrJy5iXPLaxwJeN12Yka+7G/ZC24Va2KqR9+D
	IsYg==
X-Gm-Message-State: APjAAAUa6r5zn3yw8YEtK1TiPvw7YtIzeFmGKvoPTOTDBRNbc7ZXdG6q
	5SXk3oii6jLFsJBy+296P2SRp9fAQK733w==
X-Google-Smtp-Source: APXvYqxWFc55Kayj13+jVqy1DGF9lXmUzccT7x7LoEmEH7q9iUjOSRfAgWw/rOVNAE2mNxnLFALshQ==
X-Received: by 2002:a9d:6296:: with SMTP id x22mr1892564otk.94.1559310220869; 
	Fri, 31 May 2019 06:43:40 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168]) by smtp.gmail.com with ESMTPSA id
	r23sm2391176otg.49.2019.05.31.06.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 06:43:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2019 08:43:07 -0500
Message-Id: <20190531134315.4109-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531134315.4109-1-richard.henderson@linaro.org>
References: <20190531134315.4109-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: [Qemu-devel] [PATCH v16 15/23] hw/rx: Honor -accel qtest
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: philmd@redhat.com, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Issue an error if no kernel, no bios, and not qtest'ing.
Fixes make check-qtest-rx: test/qom-test.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/rx/rx62n.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index 3a8fe7b0bf..e55257c622 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -21,11 +21,13 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/rx/rx62n.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/qtest.h"
 #include "cpu.h"
 
 /*
@@ -190,8 +192,14 @@ static void rx62n_realize(DeviceState *dev, Error **errp)
     memory_region_init_rom(&s->c_flash, NULL, "codeflash",
                            RX62N_CFLASH_SIZE, errp);
     memory_region_add_subregion(s->sysmem, RX62N_CFLASH_BASE, &s->c_flash);
+
     if (!s->kernel) {
-        rom_add_file_fixed(bios_name, RX62N_CFLASH_BASE, 0);
+        if (bios_name) {
+            rom_add_file_fixed(bios_name, RX62N_CFLASH_BASE, 0);
+        }  else if (!qtest_enabled()) {
+            error_report("No bios or kernel specified");
+            exit(1);
+        }
     }
 
     object_initialize_child(OBJECT(s), "cpu", &s->cpu,
-- 
2.17.1


