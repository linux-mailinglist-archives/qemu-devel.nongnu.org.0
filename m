Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC11325559
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 19:21:17 +0100 (CET)
Received: from localhost ([::1]:49780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFLGF-0007wO-Mm
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 13:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFLFG-0007CG-AR
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 13:20:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFLFC-00008k-K1
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 13:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614277209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K9ksy8xl9ixiivlLqZ28C9ePMkW+YGg9cGZwNcxzbQY=;
 b=die/WHWUzHHcb47GzWrwTK3ebaYGFmUa4HpeJkN3BlYrW8XViE+Rqb6OUcSsah5hG7AcC1
 uNBoKYCgOuStPJ/LoQ3rHGDS/++I9Stm5Xy73f4w/q6i7uZh9pUMq0G6XdezkQiBfmnJjV
 37jmjWwW6rhkCjCys/pyk4KlUts8UqE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-AB1n3STaP76mNP2_iIUBYw-1; Thu, 25 Feb 2021 13:20:07 -0500
X-MC-Unique: AB1n3STaP76mNP2_iIUBYw-1
Received: by mail-ed1-f72.google.com with SMTP id g20so3271512edy.7
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 10:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K9ksy8xl9ixiivlLqZ28C9ePMkW+YGg9cGZwNcxzbQY=;
 b=SuBX2ZP+h+yrQyRslMn1JDsRzKfjjVLIQeMOOBjsPjDC/6Vz6eBlM2j4VtajT97IUQ
 dGJWkkKgGf0DJNlVwHPCs6npdPQZ6vVYuCMIDKPlKiH8XCHAHOsW2O70zT18QkpaUtNr
 fGk5eYk2mGa9cvEBhI5utXr08BPYoRMvmnpgL4PC2pUZMuaU3MeHa3MAPD+d90ZpOY3j
 IG0Lki4edESgUl9Ves4MLGZkGQR4+66xW3peDJ4yL6bcq+cVf2NTxUkmi0qrE1UKJezj
 BDxfGZvy8HFKXcME3MuiY4cxMOzlQTjeZ8B7pAEjSG5q+niQRBZazyqmkNzzf+hf92ZO
 CdlQ==
X-Gm-Message-State: AOAM533ZTn3XVz27uVJTnkFl2duzsPFofPtI8Szr8QAfMuUajr5lMFNo
 aR9Gp2jxbypart1K/8A6KOD3fkedxOQ8s67q8W/+7qZ0mbCBbPMwXahTTKDyRbK16fGAU58CQ7S
 +YgP94kwFuLHsEXvpeTbFWHwSnAKtkBjzvyOrRfNs2S/QnrMVXwFf4dBqMovLxZz4
X-Received: by 2002:aa7:da18:: with SMTP id r24mr4337346eds.371.1614277206301; 
 Thu, 25 Feb 2021 10:20:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMf2e7If0HNHQ4T5hvHvpXYHSBTkVxFQBpc5ebFvevw4r+jMwIyUjEboxIr/5FHEY2wsAqhA==
X-Received: by 2002:aa7:da18:: with SMTP id r24mr4337312eds.371.1614277205965; 
 Thu, 25 Feb 2021 10:20:05 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c17sm721255edw.32.2021.02.25.10.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 10:20:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] exec/memory: Use struct Object typedef
Date: Thu, 25 Feb 2021 19:20:03 +0100
Message-Id: <20210225182003.3629342-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We forward-declare Object typedef in "qemu/typedefs.h" since commit
ca27b5eb7cd ("qom/object: Move Object typedef to 'qemu/typedefs.h'").
Use it everywhere to make the code simpler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory.h      | 32 ++++++++++++++++----------------
 include/hw/ppc/pnv_xscom.h |  2 +-
 hw/ppc/pnv_xscom.c         |  2 +-
 softmmu/memory.c           | 12 ++++++------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c6fb714e499..54ccf1a5f09 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -828,7 +828,7 @@ static inline bool MemoryRegionSection_eq(MemoryRegionSection *a,
  * @size: size of the region; any subregions beyond this size will be clipped
  */
 void memory_region_init(MemoryRegion *mr,
-                        struct Object *owner,
+                        Object *owner,
                         const char *name,
                         uint64_t size);
 
@@ -876,7 +876,7 @@ void memory_region_unref(MemoryRegion *mr);
  * @size: size of the region.
  */
 void memory_region_init_io(MemoryRegion *mr,
-                           struct Object *owner,
+                           Object *owner,
                            const MemoryRegionOps *ops,
                            void *opaque,
                            const char *name,
@@ -898,7 +898,7 @@ void memory_region_init_io(MemoryRegion *mr,
  * RAM memory region to be migrated; that is the responsibility of the caller.
  */
 void memory_region_init_ram_nomigrate(MemoryRegion *mr,
-                                      struct Object *owner,
+                                      Object *owner,
                                       const char *name,
                                       uint64_t size,
                                       Error **errp);
@@ -920,7 +920,7 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
  * The only difference is part of the RAM region can be remapped.
  */
 void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
-                                             struct Object *owner,
+                                             Object *owner,
                                              const char *name,
                                              uint64_t size,
                                              bool share,
@@ -946,7 +946,7 @@ void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
  * RAM memory region to be migrated; that is the responsibility of the caller.
  */
 void memory_region_init_resizeable_ram(MemoryRegion *mr,
-                                       struct Object *owner,
+                                       Object *owner,
                                        const char *name,
                                        uint64_t size,
                                        uint64_t max_size,
@@ -979,7 +979,7 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
  * RAM memory region to be migrated; that is the responsibility of the caller.
  */
 void memory_region_init_ram_from_file(MemoryRegion *mr,
-                                      struct Object *owner,
+                                      Object *owner,
                                       const char *name,
                                       uint64_t size,
                                       uint64_t align,
@@ -1005,7 +1005,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * RAM memory region to be migrated; that is the responsibility of the caller.
  */
 void memory_region_init_ram_from_fd(MemoryRegion *mr,
-                                    struct Object *owner,
+                                    Object *owner,
                                     const char *name,
                                     uint64_t size,
                                     bool share,
@@ -1030,7 +1030,7 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
  * RAM memory region to be migrated; that is the responsibility of the caller.
  */
 void memory_region_init_ram_ptr(MemoryRegion *mr,
-                                struct Object *owner,
+                                Object *owner,
                                 const char *name,
                                 uint64_t size,
                                 void *ptr);
@@ -1058,7 +1058,7 @@ void memory_region_init_ram_ptr(MemoryRegion *mr,
  * (For RAM device memory regions, migrating the contents rarely makes sense.)
  */
 void memory_region_init_ram_device_ptr(MemoryRegion *mr,
-                                       struct Object *owner,
+                                       Object *owner,
                                        const char *name,
                                        uint64_t size,
                                        void *ptr);
@@ -1076,7 +1076,7 @@ void memory_region_init_ram_device_ptr(MemoryRegion *mr,
  * @size: size of the region.
  */
 void memory_region_init_alias(MemoryRegion *mr,
-                              struct Object *owner,
+                              Object *owner,
                               const char *name,
                               MemoryRegion *orig,
                               hwaddr offset,
@@ -1101,7 +1101,7 @@ void memory_region_init_alias(MemoryRegion *mr,
  * @errp: pointer to Error*, to store an error if it happens.
  */
 void memory_region_init_rom_nomigrate(MemoryRegion *mr,
-                                      struct Object *owner,
+                                      Object *owner,
                                       const char *name,
                                       uint64_t size,
                                       Error **errp);
@@ -1124,7 +1124,7 @@ void memory_region_init_rom_nomigrate(MemoryRegion *mr,
  * @errp: pointer to Error*, to store an error if it happens.
  */
 void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
-                                             struct Object *owner,
+                                             Object *owner,
                                              const MemoryRegionOps *ops,
                                              void *opaque,
                                              const char *name,
@@ -1183,7 +1183,7 @@ void memory_region_init_iommu(void *_iommu_mr,
  * If you pass a non-NULL non-device @owner then we will assert.
  */
 void memory_region_init_ram(MemoryRegion *mr,
-                            struct Object *owner,
+                            Object *owner,
                             const char *name,
                             uint64_t size,
                             Error **errp);
@@ -1210,7 +1210,7 @@ void memory_region_init_ram(MemoryRegion *mr,
  * @errp: pointer to Error*, to store an error if it happens.
  */
 void memory_region_init_rom(MemoryRegion *mr,
-                            struct Object *owner,
+                            Object *owner,
                             const char *name,
                             uint64_t size,
                             Error **errp);
@@ -1241,7 +1241,7 @@ void memory_region_init_rom(MemoryRegion *mr,
  * @errp: pointer to Error*, to store an error if it happens.
  */
 void memory_region_init_rom_device(MemoryRegion *mr,
-                                   struct Object *owner,
+                                   Object *owner,
                                    const MemoryRegionOps *ops,
                                    void *opaque,
                                    const char *name,
@@ -1254,7 +1254,7 @@ void memory_region_init_rom_device(MemoryRegion *mr,
  *
  * @mr: the memory region being queried.
  */
-struct Object *memory_region_owner(MemoryRegion *mr);
+Object *memory_region_owner(MemoryRegion *mr);
 
 /**
  * memory_region_size: get a memory region's size.
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 8578f5a207d..2ff9f7a8d6f 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -139,7 +139,7 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
 void pnv_xscom_add_subregion(PnvChip *chip, hwaddr offset,
                              MemoryRegion *mr);
 void pnv_xscom_region_init(MemoryRegion *mr,
-                           struct Object *owner,
+                           Object *owner,
                            const MemoryRegionOps *ops,
                            void *opaque,
                            const char *name,
diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index e9ae1569ffc..be7018e8ac5 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -308,7 +308,7 @@ void pnv_xscom_add_subregion(PnvChip *chip, hwaddr offset, MemoryRegion *mr)
 }
 
 void pnv_xscom_region_init(MemoryRegion *mr,
-                           struct Object *owner,
+                           Object *owner,
                            const MemoryRegionOps *ops,
                            void *opaque,
                            const char *name,
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 874a8fccdee..91f1bf47c30 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1581,7 +1581,7 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
 
 #ifdef CONFIG_POSIX
 void memory_region_init_ram_from_file(MemoryRegion *mr,
-                                      struct Object *owner,
+                                      Object *owner,
                                       const char *name,
                                       uint64_t size,
                                       uint64_t align,
@@ -1607,7 +1607,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
 }
 
 void memory_region_init_ram_from_fd(MemoryRegion *mr,
-                                    struct Object *owner,
+                                    Object *owner,
                                     const char *name,
                                     uint64_t size,
                                     bool share,
@@ -1679,7 +1679,7 @@ void memory_region_init_alias(MemoryRegion *mr,
 }
 
 void memory_region_init_rom_nomigrate(MemoryRegion *mr,
-                                      struct Object *owner,
+                                      Object *owner,
                                       const char *name,
                                       uint64_t size,
                                       Error **errp)
@@ -3205,7 +3205,7 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
 }
 
 void memory_region_init_ram(MemoryRegion *mr,
-                            struct Object *owner,
+                            Object *owner,
                             const char *name,
                             uint64_t size,
                             Error **errp)
@@ -3229,7 +3229,7 @@ void memory_region_init_ram(MemoryRegion *mr,
 }
 
 void memory_region_init_rom(MemoryRegion *mr,
-                            struct Object *owner,
+                            Object *owner,
                             const char *name,
                             uint64_t size,
                             Error **errp)
@@ -3253,7 +3253,7 @@ void memory_region_init_rom(MemoryRegion *mr,
 }
 
 void memory_region_init_rom_device(MemoryRegion *mr,
-                                   struct Object *owner,
+                                   Object *owner,
                                    const MemoryRegionOps *ops,
                                    void *opaque,
                                    const char *name,
-- 
2.26.2


