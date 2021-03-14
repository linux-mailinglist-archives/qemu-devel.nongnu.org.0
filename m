Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5833A8C8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:30:57 +0100 (CET)
Received: from localhost ([::1]:45046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaCG-0000h3-Fp
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaAm-0007Sp-HQ
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaAl-0003S7-4N
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:29:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id o14so3990190wrm.11
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfOJpmdDqxdEOJJRaB9vA8l3aZbZ2PjO+Vki+heinaM=;
 b=cF2Q+wArsHomAAkgDbsDz9gbCl59YbsgrIsOixISLjE26TcbS4kHvq/ZDezbZO50CW
 J29szc9EBbgRPi6I2uQq762g5fWNoFDKtIgp93ICZxcR5hS0qxOgrPTdQwU2wJXzVXtY
 2P7HssfMkTPFC8FK7gU6TzHn+8o7ULGqp+ZYpx9jvS04MKDS9hVTGtVZYZpZyhaEkD6i
 2nFkcuoVMsaDCx6o6CDKEm+SGqR0nIHZnUwhSpEtOMBQ/1x0PKyxtbuoYV/ddUjfptqk
 HokjENbBJTL+j48FGYOBBmaug4jRaCJ1ZHtP59n1KwRbpq9T49b9VUNrgVzWfbT2JEUJ
 5unA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KfOJpmdDqxdEOJJRaB9vA8l3aZbZ2PjO+Vki+heinaM=;
 b=BeVOAFjdoXnUfPsMFpZQ6aeHNV4/XfgeEJHNgGIkFIIfp77DJJEd5koK5Bvafr34Ce
 61PcYJr3kgPmZ3REjxGyjxXRDAFjfcHV4r+BjtDWHOMYnLNJMsff6FLnDVQgSK1i5D+c
 //ooVYlwPVsSJ+0y7Sk/hvhVIRkNDgrAZBzWCWSb5csy8ZW9DJGXNItIaN2U1Eoeno40
 CG4Hk2vi7WTk1f9i12ufVWHCHeDM1TqveSQqqn0H4rorGObK7seoNW0ePWXBY7vww2Bx
 uZLKycp9uf6W3EJqiCudzDJSE/A6Ik+7j3k6Rb+RdfvUx/TV9qY1S1FMhM1/YkB0O+dt
 tugg==
X-Gm-Message-State: AOAM530B/+xoceUvccUlr+1XiXrowxzRidE+FT2a1FOTZ2QXyWt+OiUB
 SsD54+qotCw/8N4mcdjv8MzotiKoVTIYyQ==
X-Google-Smtp-Source: ABdhPJw7ANf/PufSHWo/b5rKEhcHlAfaKXj7Tndpw5ogdZa+c3xIBrXP5x/2OLhhMuveZeQ1u2G33Q==
X-Received: by 2002:a5d:6205:: with SMTP id y5mr24456623wru.238.1615764561426; 
 Sun, 14 Mar 2021 16:29:21 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l9sm10092495wmq.2.2021.03.14.16.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:29:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/8] softmmu/physmem: Rename io_mem_unassigned ->
 unassigned_mr
Date: Mon, 15 Mar 2021 00:29:06 +0100
Message-Id: <20210314232913.2607360-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210314232913.2607360-1-f4bug@amsat.org>
References: <20210314232913.2607360-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'io_mem_unassigned' memory region is not specific to I/O,
rename it using a more generic 'unassigned_mr', matching
the '_mr' suffix pattern used in various places in the code
base.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/physmem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 7e8b0fab89a..115679f8d1a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -93,7 +93,7 @@ static MemoryRegion *system_io;
 AddressSpace address_space_io;
 AddressSpace address_space_memory;
 
-static MemoryRegion io_mem_unassigned;
+static MemoryRegion unassigned_mr;
 
 typedef struct PhysPageEntry PhysPageEntry;
 
@@ -458,7 +458,7 @@ static MemoryRegionSection address_space_translate_iommu(IOMMUMemoryRegion *iomm
     return *section;
 
 unassigned:
-    return (MemoryRegionSection) { .mr = &io_mem_unassigned };
+    return (MemoryRegionSection) { .mr = &unassigned_mr };
 }
 
 /**
@@ -534,7 +534,7 @@ IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
                                     attrs);
 
     /* Illegal translation */
-    if (section.mr == &io_mem_unassigned) {
+    if (section.mr == &unassigned_mr) {
         goto iotlb_fail;
     }
 
@@ -1212,7 +1212,7 @@ static void register_subpage(FlatView *fv, MemoryRegionSection *section)
     };
     hwaddr start, end;
 
-    assert(existing->mr->subpage || existing->mr == &io_mem_unassigned);
+    assert(existing->mr->subpage || existing->mr == &unassigned_mr);
 
     if (!(existing->mr->subpage)) {
         subpage = subpage_init(fv, base);
@@ -2573,7 +2573,7 @@ MemoryRegionSection *iotlb_to_section(CPUState *cpu,
 
 static void io_mem_init(void)
 {
-    memory_region_init_io(&io_mem_unassigned, NULL, &unassigned_mem_ops, NULL,
+    memory_region_init_io(&unassigned_mr, NULL, &unassigned_mem_ops, NULL,
                           NULL, UINT64_MAX);
 }
 
@@ -2582,7 +2582,7 @@ AddressSpaceDispatch *address_space_dispatch_new(FlatView *fv)
     AddressSpaceDispatch *d = g_new0(AddressSpaceDispatch, 1);
     uint16_t n;
 
-    n = dummy_section(&d->map, fv, &io_mem_unassigned);
+    n = dummy_section(&d->map, fv, &unassigned_mr);
     assert(n == PHYS_SECTION_UNASSIGNED);
 
     d->phys_map  = (PhysPageEntry) { .ptr = PHYS_MAP_NODE_NIL, .skip = 1 };
-- 
2.26.2


