Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD66E334A24
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:51:37 +0100 (CET)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6jw-0002vr-T5
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dx-0003AC-IY; Wed, 10 Mar 2021 16:45:27 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:54981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dv-0004QN-5z; Wed, 10 Mar 2021 16:45:25 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N3sRi-1lkfvy2o0e-00zrXk; Wed, 10 Mar 2021 22:45:19 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/22] exec/memory: Use struct Object typedef
Date: Wed, 10 Mar 2021 22:44:52 +0100
Message-Id: <20210310214504.1183162-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WhQLZoZb+tEUhE/CBKt37b13Wy6kRnwPZKJw3pJ3IEjnpo3KNZR
 lvQzGkb13x5UudryDHqiscKrxXhHt7vRSCYiPO4ItRRIce25735JZhV5TrEd9Tn96kjcP9w
 vZm2y7s2jhBOWLbEebALEFhxzs2FD4NrUK1RJEsfW24ePcpjj9amlaVlPGkSYQ5cuCGVZix
 ugLMnF9I6j/kdvipXEpJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3uoTwvzB7oU=:gBXjZhgIs40yzueKyvK/Fq
 X9r/2HOsbduIbT6gug0B7pa+kvzSHihA1KrVetw28OHMR7XieADcMoQOvOR45Y7Lzx4d3ajIn
 /Y0wOUyL5dzWSOWEFQWErT8MaDc+lh8SO44ofhIGExVSZDlR/2jIWiJQ736FLLoJ/kWZZ2HkS
 +uob8zfWkXoT77bwVpZHnaG9G57cgROPOfaAHscVE0HBGepLygTZZACw/7AKMMtvL+Gi26Emk
 fE1Ql5VXYx1iVtc6GXQYPa9yLnFtZsxH7Lk4Wy4/6NjZow3V5VxHN0tegk0Ny9pN2L0VJtwJI
 bxRv4llA6SpDz9mwmBvqRXkPV8I73ZZA3yzvfc85+JVmnDP6QMlwtY1lKfV1QSxaAJT2sZIVO
 Sts2mkL6dcQc4nEQrNk+CK/pU4g9X+IUh6OLIce92bvXwACHXnxmTcUsjd+B2
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We forward-declare Object typedef in "qemu/typedefs.h" since commit
ca27b5eb7cd ("qom/object: Move Object typedef to 'qemu/typedefs.h'").
Use it everywhere to make the code simpler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210225182003.3629342-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/ppc/pnv_xscom.c         |  2 +-
 include/exec/memory.h      | 32 ++++++++++++++++----------------
 include/hw/ppc/pnv_xscom.h |  2 +-
 softmmu/memory.c           | 12 ++++++------
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index e9ae1569ffcf..be7018e8ac59 100644
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
diff --git a/include/exec/memory.h b/include/exec/memory.h
index c6fb714e499c..54ccf1a5f09b 100644
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
index 8578f5a207df..2ff9f7a8d6fe 100644
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
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 874a8fccdee4..91f1bf47c301 100644
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
2.29.2


