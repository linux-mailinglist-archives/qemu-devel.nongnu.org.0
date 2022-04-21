Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D850A024
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:58:06 +0200 (CEST)
Received: from localhost ([::1]:33222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWNp-0002oB-Js
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWEv-0005p5-T2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhWEu-00038x-3x
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650545331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Y/BtladFk9zrXM7QiFI/xGA2ezjk3Qt7WtimRCFtRI=;
 b=V932fKhvxhTjmXf/B6JhpehbieUdWRJ8FmP5VgKsZwpOz88rYBT1kql9hsCApWDX0a4we2
 ZKgbtQl21iVh3fz8sGhJrWQB74BxbZZc+jUcewJr1PpcvEAWzeQJRphm9G+Y/72M5pd9sc
 ZuYYOSlqXVGqd6HaC2jG7Eu6F9JniLI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-LPhyfmQmPZSnDEiy_9wqJA-1; Thu, 21 Apr 2022 08:48:50 -0400
X-MC-Unique: LPhyfmQmPZSnDEiy_9wqJA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 043FB811E76;
 Thu, 21 Apr 2022 12:48:50 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAA8340CFD22;
 Thu, 21 Apr 2022 12:48:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] dump: Remove the sh_info variable
Date: Thu, 21 Apr 2022 16:48:24 +0400
Message-Id: <20220421124835.2831856-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
References: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 viktor.prutyanov@redhat.com, richard.henderson@linaro.org,
 frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Janosch Frank <frankja@linux.ibm.com>

There's no need to have phdr_num and sh_info at the same time. We can
make phdr_num 32 bit and set PN_XNUM when we write the header if
phdr_num >= PN_XNUM.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220407094824.5074-1-frankja@linux.ibm.com>
---
 include/sysemu/dump.h |  3 +--
 dump/dump.c           | 44 +++++++++++++++++++++++--------------------
 2 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 250143cb5a71..b463fc9c0226 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -154,8 +154,7 @@ typedef struct DumpState {
     GuestPhysBlockList guest_phys_blocks;
     ArchDumpInfo dump_info;
     MemoryMappingList list;
-    uint16_t phdr_num;
-    uint32_t sh_info;
+    uint32_t phdr_num;
     bool have_section;
     bool resume;
     bool detached;
diff --git a/dump/dump.c b/dump/dump.c
index b91e9d8c123e..010b272da038 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -123,6 +123,12 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
 
 static void write_elf64_header(DumpState *s, Error **errp)
 {
+    /*
+     * phnum in the elf header is 16 bit, if we have more segments we
+     * set phnum to PN_XNUM and write the real number of segments to a
+     * special section.
+     */
+    uint16_t phnum = MIN(s->phdr_num, PN_XNUM);
     Elf64_Ehdr elf_header;
     int ret;
 
@@ -137,9 +143,9 @@ static void write_elf64_header(DumpState *s, Error **errp)
     elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
     elf_header.e_phoff = cpu_to_dump64(s, sizeof(Elf64_Ehdr));
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
-    elf_header.e_phnum = cpu_to_dump16(s, s->phdr_num);
+    elf_header.e_phnum = cpu_to_dump16(s, phnum);
     if (s->have_section) {
-        uint64_t shoff = sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) * s->sh_info;
+        uint64_t shoff = sizeof(Elf64_Ehdr) + sizeof(Elf64_Phdr) * s->phdr_num;
 
         elf_header.e_shoff = cpu_to_dump64(s, shoff);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
@@ -154,6 +160,12 @@ static void write_elf64_header(DumpState *s, Error **errp)
 
 static void write_elf32_header(DumpState *s, Error **errp)
 {
+    /*
+     * phnum in the elf header is 16 bit, if we have more segments we
+     * set phnum to PN_XNUM and write the real number of segments to a
+     * special section.
+     */
+    uint16_t phnum = MIN(s->phdr_num, PN_XNUM);
     Elf32_Ehdr elf_header;
     int ret;
 
@@ -168,9 +180,9 @@ static void write_elf32_header(DumpState *s, Error **errp)
     elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
     elf_header.e_phoff = cpu_to_dump32(s, sizeof(Elf32_Ehdr));
     elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
-    elf_header.e_phnum = cpu_to_dump16(s, s->phdr_num);
+    elf_header.e_phnum = cpu_to_dump16(s, phnum);
     if (s->have_section) {
-        uint32_t shoff = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * s->sh_info;
+        uint32_t shoff = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * s->phdr_num;
 
         elf_header.e_shoff = cpu_to_dump32(s, shoff);
         elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
@@ -357,12 +369,12 @@ static void write_elf_section(DumpState *s, int type, Error **errp)
     if (type == 0) {
         shdr_size = sizeof(Elf32_Shdr);
         memset(&shdr32, 0, shdr_size);
-        shdr32.sh_info = cpu_to_dump32(s, s->sh_info);
+        shdr32.sh_info = cpu_to_dump32(s, s->phdr_num);
         shdr = &shdr32;
     } else {
         shdr_size = sizeof(Elf64_Shdr);
         memset(&shdr64, 0, shdr_size);
-        shdr64.sh_info = cpu_to_dump32(s, s->sh_info);
+        shdr64.sh_info = cpu_to_dump32(s, s->phdr_num);
         shdr = &shdr64;
     }
 
@@ -477,13 +489,6 @@ static void write_elf_loads(DumpState *s, Error **errp)
     hwaddr offset, filesz;
     MemoryMapping *memory_mapping;
     uint32_t phdr_index = 1;
-    uint32_t max_index;
-
-    if (s->have_section) {
-        max_index = s->sh_info;
-    } else {
-        max_index = s->phdr_num;
-    }
 
     QTAILQ_FOREACH(memory_mapping, &s->list.head, next) {
         get_offset_range(memory_mapping->phys_addr,
@@ -501,7 +506,7 @@ static void write_elf_loads(DumpState *s, Error **errp)
             return;
         }
 
-        if (phdr_index >= max_index) {
+        if (phdr_index >= s->phdr_num) {
             break;
         }
     }
@@ -1800,22 +1805,21 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         s->phdr_num += s->list.num;
         s->have_section = false;
     } else {
+        /* sh_info of section 0 holds the real number of phdrs */
         s->have_section = true;
-        s->phdr_num = PN_XNUM;
-        s->sh_info = 1; /* PT_NOTE */
 
         /* the type of shdr->sh_info is uint32_t, so we should avoid overflow */
         if (s->list.num <= UINT32_MAX - 1) {
-            s->sh_info += s->list.num;
+            s->phdr_num += s->list.num;
         } else {
-            s->sh_info = UINT32_MAX;
+            s->phdr_num = UINT32_MAX;
         }
     }
 
     if (s->dump_info.d_class == ELFCLASS64) {
         if (s->have_section) {
             s->memory_offset = sizeof(Elf64_Ehdr) +
-                               sizeof(Elf64_Phdr) * s->sh_info +
+                               sizeof(Elf64_Phdr) * s->phdr_num +
                                sizeof(Elf64_Shdr) + s->note_size;
         } else {
             s->memory_offset = sizeof(Elf64_Ehdr) +
@@ -1824,7 +1828,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     } else {
         if (s->have_section) {
             s->memory_offset = sizeof(Elf32_Ehdr) +
-                               sizeof(Elf32_Phdr) * s->sh_info +
+                               sizeof(Elf32_Phdr) * s->phdr_num +
                                sizeof(Elf32_Shdr) + s->note_size;
         } else {
             s->memory_offset = sizeof(Elf32_Ehdr) +
-- 
2.35.1.693.g805e0a68082a


