Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165B84445AB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:15:21 +0100 (CET)
Received: from localhost ([::1]:41732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIv2-0000KT-4q
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1miItA-0006i0-2I
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:13:24 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:41806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1miIt4-00046C-8H
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:13:23 -0400
Received: by mail-lf1-x12b.google.com with SMTP id br12so4328968lfb.8
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zfpmHzy9rUw4eULZXkrlYVJEPRCYC4Gqp54jnkn16YA=;
 b=OjOkTM2JG6jxnux34JSa1rxyzrUfdyzTG/BqNx/X983eSo2qdyt6A6h8LiGWHkWRsx
 UrtHo5JYctBarnxdz/2+wTVeqgN9zRRv8J+kA/Ee3EDkBE7iUX974mSb3rs2GH40hw1X
 VSlTcTLQmu57pY/2tznmagautDs8EfVZzOqCENoqqbn4Z30Lo6aDTzNutufUAfT3U/Zr
 4C2AdvP9cnOYBRBV631TqcmoLn0YQqOwA/tel3Z5+WlzNA2A5YGRx7Wj+fGxZChbIaDF
 CIFzgGliU+9u8XW6HF9fesehd8AUrH8FvxsQDzkfivbITgrwJOqTal0iuj3BWtTMbCot
 8k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zfpmHzy9rUw4eULZXkrlYVJEPRCYC4Gqp54jnkn16YA=;
 b=XaahWBcIXgylEkUwl9u22WUTv85JxiJpNT8wAo7GqMYWwSGPm6aYfGOM4iOttAoBZO
 fo6tyVMScHfJdigSzxgB4XY+IIQHdJBjOck4LsyL29Cl4srnRJgiDJim323JKqCj8hPa
 eWB+/Lh2I7rHtuID7xiwTyeZXDAto1Qj95Td5uTMirJcnsNYxbOFKUrQ32S6dadMw6FU
 BHiYqraY8fhqISwLRbQOtJQxJIYmMb14fGeo0wMsYjpyWI1pdSV6Dr61clltFv9hZWYw
 HKNx9sel5ACBlc5F1XrudVuDiWWQkaULV/RQEz4CL+hBd7sV2I3HeB4HYibve32Eusf4
 TnHw==
X-Gm-Message-State: AOAM531bjeCt8AQfE6V4AOIqPKlBJlh/drF3Q5DHaQ+oClviVUrdGDvo
 /ckAngCIebDVHqpTn/7Q+Itu5BaSFOaOuBys
X-Google-Smtp-Source: ABdhPJyDjgi4awFvA3dRKLVJ4BBDqSHNOYSq/3MLSOxkBE1PLtLclwPtrVUZfAdxsjU2l4orEYKOdw==
X-Received: by 2002:a19:710f:: with SMTP id m15mr40969167lfc.597.1635955996405; 
 Wed, 03 Nov 2021 09:13:16 -0700 (PDT)
Received: from vp-pc.redhat.com ([2a00:1370:810e:bd31:a3af:f811:c4e:52b8])
 by smtp.gmail.com with ESMTPSA id a3sm243337lji.48.2021.11.03.09.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 09:13:15 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: peter.maydell@linaro.org,
	yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 1/3] contrib/elf2dmp: fix code style
Date: Wed,  3 Nov 2021 19:12:58 +0300
Message-Id: <20211103161300.114741-2-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103161300.114741-1-viktor.prutyanov@phystech.edu>
References: <20211103161300.114741-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x12b.google.com
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

Originally elf2dmp were added with some code style issues,
especially in pe.h header, and some were introduced by
2d0fc797faaa73fbc1d30f5f9e90407bf3dd93f0. Fix them now.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 contrib/elf2dmp/main.c |   9 ++--
 contrib/elf2dmp/pe.h   | 100 ++++++++++++++++++++---------------------
 2 files changed, 56 insertions(+), 53 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index 20b477d582..beb534e79c 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -281,14 +281,16 @@ static int fill_header(WinDumpHeader64 *hdr, struct pa_space *ps,
     };
 
     for (i = 0; i < ps->block_nr; i++) {
-        h.PhysicalMemoryBlock.NumberOfPages += ps->block[i].size / ELF2DMP_PAGE_SIZE;
+        h.PhysicalMemoryBlock.NumberOfPages +=
+                ps->block[i].size / ELF2DMP_PAGE_SIZE;
         h.PhysicalMemoryBlock.Run[i] = (WinDumpPhyMemRun64) {
             .BasePage = ps->block[i].paddr / ELF2DMP_PAGE_SIZE,
             .PageCount = ps->block[i].size / ELF2DMP_PAGE_SIZE,
         };
     }
 
-    h.RequiredDumpSpace += h.PhysicalMemoryBlock.NumberOfPages << ELF2DMP_PAGE_BITS;
+    h.RequiredDumpSpace +=
+            h.PhysicalMemoryBlock.NumberOfPages << ELF2DMP_PAGE_BITS;
 
     *hdr = h;
 
@@ -298,7 +300,8 @@ static int fill_header(WinDumpHeader64 *hdr, struct pa_space *ps,
 static int fill_context(KDDEBUGGER_DATA64 *kdbg,
         struct va_space *vs, QEMU_Elf *qe)
 {
-        int i;
+    int i;
+
     for (i = 0; i < qe->state_nr; i++) {
         uint64_t Prcb;
         uint64_t Context;
diff --git a/contrib/elf2dmp/pe.h b/contrib/elf2dmp/pe.h
index c2a4a6ba7c..807d006364 100644
--- a/contrib/elf2dmp/pe.h
+++ b/contrib/elf2dmp/pe.h
@@ -33,70 +33,70 @@ typedef struct IMAGE_DOS_HEADER {
 } __attribute__ ((packed)) IMAGE_DOS_HEADER;
 
 typedef struct IMAGE_FILE_HEADER {
-  uint16_t  Machine;
-  uint16_t  NumberOfSections;
-  uint32_t  TimeDateStamp;
-  uint32_t  PointerToSymbolTable;
-  uint32_t  NumberOfSymbols;
-  uint16_t  SizeOfOptionalHeader;
-  uint16_t  Characteristics;
+    uint16_t  Machine;
+    uint16_t  NumberOfSections;
+    uint32_t  TimeDateStamp;
+    uint32_t  PointerToSymbolTable;
+    uint32_t  NumberOfSymbols;
+    uint16_t  SizeOfOptionalHeader;
+    uint16_t  Characteristics;
 } __attribute__ ((packed)) IMAGE_FILE_HEADER;
 
 typedef struct IMAGE_DATA_DIRECTORY {
-  uint32_t VirtualAddress;
-  uint32_t Size;
+    uint32_t VirtualAddress;
+    uint32_t Size;
 } __attribute__ ((packed)) IMAGE_DATA_DIRECTORY;
 
 #define IMAGE_NUMBEROF_DIRECTORY_ENTRIES 16
 
 typedef struct IMAGE_OPTIONAL_HEADER64 {
-  uint16_t  Magic; /* 0x20b */
-  uint8_t   MajorLinkerVersion;
-  uint8_t   MinorLinkerVersion;
-  uint32_t  SizeOfCode;
-  uint32_t  SizeOfInitializedData;
-  uint32_t  SizeOfUninitializedData;
-  uint32_t  AddressOfEntryPoint;
-  uint32_t  BaseOfCode;
-  uint64_t  ImageBase;
-  uint32_t  SectionAlignment;
-  uint32_t  FileAlignment;
-  uint16_t  MajorOperatingSystemVersion;
-  uint16_t  MinorOperatingSystemVersion;
-  uint16_t  MajorImageVersion;
-  uint16_t  MinorImageVersion;
-  uint16_t  MajorSubsystemVersion;
-  uint16_t  MinorSubsystemVersion;
-  uint32_t  Win32VersionValue;
-  uint32_t  SizeOfImage;
-  uint32_t  SizeOfHeaders;
-  uint32_t  CheckSum;
-  uint16_t  Subsystem;
-  uint16_t  DllCharacteristics;
-  uint64_t  SizeOfStackReserve;
-  uint64_t  SizeOfStackCommit;
-  uint64_t  SizeOfHeapReserve;
-  uint64_t  SizeOfHeapCommit;
-  uint32_t  LoaderFlags;
-  uint32_t  NumberOfRvaAndSizes;
-  IMAGE_DATA_DIRECTORY DataDirectory[IMAGE_NUMBEROF_DIRECTORY_ENTRIES];
+    uint16_t  Magic; /* 0x20b */
+    uint8_t   MajorLinkerVersion;
+    uint8_t   MinorLinkerVersion;
+    uint32_t  SizeOfCode;
+    uint32_t  SizeOfInitializedData;
+    uint32_t  SizeOfUninitializedData;
+    uint32_t  AddressOfEntryPoint;
+    uint32_t  BaseOfCode;
+    uint64_t  ImageBase;
+    uint32_t  SectionAlignment;
+    uint32_t  FileAlignment;
+    uint16_t  MajorOperatingSystemVersion;
+    uint16_t  MinorOperatingSystemVersion;
+    uint16_t  MajorImageVersion;
+    uint16_t  MinorImageVersion;
+    uint16_t  MajorSubsystemVersion;
+    uint16_t  MinorSubsystemVersion;
+    uint32_t  Win32VersionValue;
+    uint32_t  SizeOfImage;
+    uint32_t  SizeOfHeaders;
+    uint32_t  CheckSum;
+    uint16_t  Subsystem;
+    uint16_t  DllCharacteristics;
+    uint64_t  SizeOfStackReserve;
+    uint64_t  SizeOfStackCommit;
+    uint64_t  SizeOfHeapReserve;
+    uint64_t  SizeOfHeapCommit;
+    uint32_t  LoaderFlags;
+    uint32_t  NumberOfRvaAndSizes;
+    IMAGE_DATA_DIRECTORY DataDirectory[IMAGE_NUMBEROF_DIRECTORY_ENTRIES];
 } __attribute__ ((packed)) IMAGE_OPTIONAL_HEADER64;
 
 typedef struct IMAGE_NT_HEADERS64 {
-  uint32_t Signature;
-  IMAGE_FILE_HEADER FileHeader;
-  IMAGE_OPTIONAL_HEADER64 OptionalHeader;
+    uint32_t Signature;
+    IMAGE_FILE_HEADER FileHeader;
+    IMAGE_OPTIONAL_HEADER64 OptionalHeader;
 } __attribute__ ((packed)) IMAGE_NT_HEADERS64;
 
 typedef struct IMAGE_DEBUG_DIRECTORY {
-  uint32_t Characteristics;
-  uint32_t TimeDateStamp;
-  uint16_t MajorVersion;
-  uint16_t MinorVersion;
-  uint32_t Type;
-  uint32_t SizeOfData;
-  uint32_t AddressOfRawData;
-  uint32_t PointerToRawData;
+    uint32_t Characteristics;
+    uint32_t TimeDateStamp;
+    uint16_t MajorVersion;
+    uint16_t MinorVersion;
+    uint32_t Type;
+    uint32_t SizeOfData;
+    uint32_t AddressOfRawData;
+    uint32_t PointerToRawData;
 } __attribute__ ((packed)) IMAGE_DEBUG_DIRECTORY;
 
 #define IMAGE_DEBUG_TYPE_CODEVIEW   2
-- 
2.31.1


