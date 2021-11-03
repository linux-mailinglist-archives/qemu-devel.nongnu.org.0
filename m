Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5844445C1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:17:23 +0100 (CET)
Received: from localhost ([::1]:46354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIx0-0003ZF-HJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1miItC-0006jf-8E
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:13:26 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:42727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1miIt5-00046H-5B
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:13:25 -0400
Received: by mail-lj1-x22e.google.com with SMTP id j5so4692095lja.9
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l4eGc6tTv7y4u27o89v8L5qnwIlplazWZnMj4+zY2uU=;
 b=w2O5tl2kAm+yrU2AUy6Dd5ivWHj51kW4BC5gq8oAtf4FSKoXAdtjnt/xz815p1UO5j
 5m0kWM+SIly83M1s7RXVMU+q6jQE5z1Fzz6glJlI37QHwRoDBOZjFyRbbinqGAO+/Bav
 E9Ay+2Z0YXlRyeVC3ACosZa3PWNtyfD8QT80erGEkKVpK9CTIP11RgFpf9/l9VDb86Bx
 3sDSUP5SiGRkLLoKTJOfCVK/hLZLNbrXFQg3GrwBHhIqS8HlQj4AeInruDZatXrfu2U8
 MD0bQ/c8N8e+9TDl5eJFwTpRbKonqpZkAiVtomC9reH1kdGqfGEh5qqsjz7cnKItIZ5S
 0TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l4eGc6tTv7y4u27o89v8L5qnwIlplazWZnMj4+zY2uU=;
 b=muTQRChUXUrSizVzCctwcpc2lQ5Ff5EGH/5V/B6lpl3fSEkZpcvTfwUO2slY66SSTx
 AbxRo26lRzqFvyPofCId8u/wCGciZ5C+9W9fH4AAEY+TLn0kZMPU0fTEUlOpDNhCDhr9
 wNljxOrQN5ADxN/iKaGsWfmmTCoEenKteUJhXjUuKu0p99Bb7rUSCOwKkSf6FwhrZyeg
 VhOR2EXyYu+VvicGIYdIV4K1oDLTPU+fqKI2oIENYY5mKl1lk0rqeO710K8rHxQa2/8f
 ET7D5/HxVaiYQYYmniE7K1Wd8JHj0jRAM4yS5VS1iFdSbRjr0RLY8Y6ZgCS0LKkezthg
 lfgw==
X-Gm-Message-State: AOAM533yvK6XQSEFTPvYJsG16vE+0BB4yiDYQ+VN1/u0Cb3iQtLGlYcS
 nD3HY0D2UEjP4ibpqPFUj3a2LQ2VxPfz8HKU
X-Google-Smtp-Source: ABdhPJyCItqfQ8wfR9j5mFvqHMRnajz4PgqTvKjNcbtP9xMx4IE6yWdDOGjWyr8YXSWVCS0SB6+b2A==
X-Received: by 2002:a2e:9846:: with SMTP id e6mr3422481ljj.10.1635955997591;
 Wed, 03 Nov 2021 09:13:17 -0700 (PDT)
Received: from vp-pc.redhat.com ([2a00:1370:810e:bd31:a3af:f811:c4e:52b8])
 by smtp.gmail.com with ESMTPSA id a3sm243337lji.48.2021.11.03.09.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 09:13:17 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: peter.maydell@linaro.org,
	yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 2/3] contrib/elf2dmp: move PE dir search to
 pe_get_data_dir_entry
Date: Wed,  3 Nov 2021 19:12:59 +0300
Message-Id: <20211103161300.114741-3-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103161300.114741-1-viktor.prutyanov@phystech.edu>
References: <20211103161300.114741-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move out PE directory search functionality to be reused not only
for Debug Directory processing but for arbitrary PE directory.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 contrib/elf2dmp/main.c | 66 +++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index beb534e79c..a62fde23cc 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -332,6 +332,40 @@ static int fill_context(KDDEBUGGER_DATA64 *kdbg,
     return 0;
 }
 
+static int pe_get_data_dir_entry(uint64_t base, void *start_addr, int idx,
+        void *entry, size_t size, struct va_space *vs)
+{
+    const char e_magic[2] = "MZ";
+    const char Signature[4] = "PE\0\0";
+    IMAGE_DOS_HEADER *dos_hdr = start_addr;
+    IMAGE_NT_HEADERS64 nt_hdrs;
+    IMAGE_FILE_HEADER *file_hdr = &nt_hdrs.FileHeader;
+    IMAGE_OPTIONAL_HEADER64 *opt_hdr = &nt_hdrs.OptionalHeader;
+    IMAGE_DATA_DIRECTORY *data_dir = nt_hdrs.OptionalHeader.DataDirectory;
+
+    if (memcmp(&dos_hdr->e_magic, e_magic, sizeof(e_magic))) {
+        return 1;
+    }
+
+    if (va_space_rw(vs, base + dos_hdr->e_lfanew,
+                &nt_hdrs, sizeof(nt_hdrs), 0)) {
+        return 1;
+    }
+
+    if (memcmp(&nt_hdrs.Signature, Signature, sizeof(Signature)) ||
+            file_hdr->Machine != 0x8664 || opt_hdr->Magic != 0x020b) {
+        return 1;
+    }
+
+    if (va_space_rw(vs,
+                base + data_dir[idx].VirtualAddress,
+                entry, size, 0)) {
+        return 1;
+    }
+
+    return 0;
+}
+
 static int write_dump(struct pa_space *ps,
         WinDumpHeader64 *hdr, const char *name)
 {
@@ -368,42 +402,16 @@ static int write_dump(struct pa_space *ps,
 static int pe_get_pdb_symstore_hash(uint64_t base, void *start_addr,
         char *hash, struct va_space *vs)
 {
-    const char e_magic[2] = "MZ";
-    const char Signature[4] = "PE\0\0";
     const char sign_rsds[4] = "RSDS";
-    IMAGE_DOS_HEADER *dos_hdr = start_addr;
-    IMAGE_NT_HEADERS64 nt_hdrs;
-    IMAGE_FILE_HEADER *file_hdr = &nt_hdrs.FileHeader;
-    IMAGE_OPTIONAL_HEADER64 *opt_hdr = &nt_hdrs.OptionalHeader;
-    IMAGE_DATA_DIRECTORY *data_dir = nt_hdrs.OptionalHeader.DataDirectory;
     IMAGE_DEBUG_DIRECTORY debug_dir;
     OMFSignatureRSDS rsds;
     char *pdb_name;
     size_t pdb_name_sz;
     size_t i;
 
-    QEMU_BUILD_BUG_ON(sizeof(*dos_hdr) >= ELF2DMP_PAGE_SIZE);
-
-    if (memcmp(&dos_hdr->e_magic, e_magic, sizeof(e_magic))) {
-        return 1;
-    }
-
-    if (va_space_rw(vs, base + dos_hdr->e_lfanew,
-                &nt_hdrs, sizeof(nt_hdrs), 0)) {
-        return 1;
-    }
-
-    if (memcmp(&nt_hdrs.Signature, Signature, sizeof(Signature)) ||
-            file_hdr->Machine != 0x8664 || opt_hdr->Magic != 0x020b) {
-        return 1;
-    }
-
-    printf("Debug Directory RVA = 0x%08"PRIx32"\n",
-            (uint32_t)data_dir[IMAGE_FILE_DEBUG_DIRECTORY].VirtualAddress);
-
-    if (va_space_rw(vs,
-                base + data_dir[IMAGE_FILE_DEBUG_DIRECTORY].VirtualAddress,
-                &debug_dir, sizeof(debug_dir), 0)) {
+    if (pe_get_data_dir_entry(base, start_addr, IMAGE_FILE_DEBUG_DIRECTORY,
+                &debug_dir, sizeof(debug_dir), vs)) {
+        eprintf("Failed to get Debug Directory\n");
         return 1;
     }
 
-- 
2.31.1


