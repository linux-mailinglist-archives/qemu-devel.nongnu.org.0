Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0FE327DAE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:55:04 +0100 (CET)
Received: from localhost ([::1]:60242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGh8h-0006zn-Ni
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:55:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGh7O-0005O3-A8
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGh7M-0007Un-8j
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614599619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3QPbF3kCYrwGbuoCgT50QmHdrj0vIiledduYlpbOmo=;
 b=JOCFr7ts3ueHhxa8vTQuqK7k2m+Ddl835TADyXwVh4FhatCw+6PFetuwYjmrcCP4rohYaP
 4K9ghpTE3XCgueJAnrkc9by97cA6KzshgY7KdSEGn/C8SzRrULByf4nmYz3djSR+fp94Qc
 ZHjOPeDSLApjOucsiA+5aJWIP6RAtBY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-UjHrYRyOPAGL2Odj9nbqpA-1; Mon, 01 Mar 2021 06:53:38 -0500
X-MC-Unique: UjHrYRyOPAGL2Odj9nbqpA-1
Received: by mail-wm1-f71.google.com with SMTP id w10so1493055wmk.1
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z3QPbF3kCYrwGbuoCgT50QmHdrj0vIiledduYlpbOmo=;
 b=Cv4EMI2oZjeH412ZceDbOvLKN1LpnfFoUjqaeGNDzLEUiINgi0opQQrmoJtrDqSOTj
 Ks1pg9OVOERd7cfDWYHmjwACUWDPDQnM7gxuj7hKuB/Jl12fLPRWZPhcdeLxmUWGPJ6/
 9OqNT3MA00krZAVtGKAO84RGpYVH9/3BxfIzewNUcUid7q2u9zu390Rs7bL5fuGi7PFI
 IMgYqltKMrSyZCEnjtyLah1uOby6xNLjGCKBeEhvQDj+gFVEGQ/gpLis2/7zQHlCzEp0
 ul7TLdgmYFSVWYws8hVxHTVtULW6wGGP+Agy1DTHuOy37AfxWfb0sqK5SO19RiXFsCaY
 T/QQ==
X-Gm-Message-State: AOAM530MOYyyRYm5kqKE40z0JoktwjjGtEhSvB3frcMS07uCyxN7aVmH
 bDDvdkiDnQpZcd49YdSz6TacqRLRFkxWLfdofkGm2L6Qc/ZOE4SSkyIATrKmTkGKRCVPDeqoela
 F4z9N/tfvW7wznJ91f4Ti8c55J6dUutWWojg8IVk0f2KOnL6Jhk7A3B0aZZdQYF6+
X-Received: by 2002:a05:6000:191:: with SMTP id
 p17mr10412380wrx.154.1614599616438; 
 Mon, 01 Mar 2021 03:53:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlssJzedcjxlgmMmgIoVO7axdJ52yUIzncIcS0L7LALJ17shPwJVTcHBUkTpeDXsYvVHT3Cw==
X-Received: by 2002:a05:6000:191:: with SMTP id
 p17mr10412343wrx.154.1614599616172; 
 Mon, 01 Mar 2021 03:53:36 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d29sm24928181wra.51.2021.03.01.03.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 03:53:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	David Edmondson <david.edmondson@oracle.com>
Subject: [RFC PATCH v2 1/3] exec/memory: Introduce
 memory_region_init_rom_device_from_file()
Date: Mon,  1 Mar 2021 12:53:27 +0100
Message-Id: <20210301115329.411762-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301115329.411762-1-philmd@redhat.com>
References: <20210301115329.411762-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, haibinzhang <haibinzhang@tencent.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce memory_region_init_rom_device_from_file() which mmap
the backing file of ROM devices. This allows to reduce QEMU memory
footprint as the same file can be shared between multiple instances
of QEMU.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory.h | 85 +++++++++++++++++++++++++++++++++++++
 softmmu/memory.c      | 98 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 183 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c6fb714e499..bacf7495003 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -487,6 +487,9 @@ struct MemoryRegion {
     const char *name;
     unsigned ioeventfd_nb;
     MemoryRegionIoeventfd *ioeventfds;
+#ifndef CONFIG_POSIX
+    gchar *contents;
+#endif
 };
 
 struct IOMMUMemoryRegion {
@@ -1131,6 +1134,43 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
                                              uint64_t size,
                                              Error **errp);
 
+/**
+ * memory_region_init_rom_device_from_file_nomigrate:
+ * Initialize a ROM memory region from the specified backing file.
+ * Writes are handled via callbacks.
+ *
+ * Note that this function does not do anything to cause the data in the
+ * RAM side of the memory region to be migrated; that is the responsibility
+ * of the caller.
+ *
+ * @mr: the #MemoryRegion to be initialized.
+ * @owner: the object that tracks the region's reference count
+ * @ops: callbacks for write access handling (must not be NULL).
+ * @opaque: passed to the read and write callbacks of the @ops structure.
+ * @name: Region name, becomes part of RAMBlock name used in migration stream
+ *        must be unique within any device
+ * @size: size of the region.
+ * @ram_flags: specify the properties of the ram block, which can be one
+ *             or bit-or of following values
+ *             - RAM_SHARED: mmap the backing file or device with MAP_SHARED
+ *             - RAM_PMEM: the backend @mem_path is persistent memory
+ *             Other bits are ignored.
+ * @path: specify the backing file
+ * @readonly: true to open @path for reading, false for read/write.
+ * @errp: pointer to Error*, to store an error if it happens.
+ */
+void memory_region_init_rom_device_from_file_nomigrate(MemoryRegion *mr,
+                                                       Object *owner,
+                                                       const MemoryRegionOps *ops,
+                                                       void *opaque,
+                                                       const char *name,
+                                                       uint64_t size,
+                                                       uint64_t align,
+                                                       uint32_t ram_flags,
+                                                       const char *path,
+                                                       bool readonly,
+                                                       Error **errp);
+
 /**
  * memory_region_init_iommu: Initialize a memory region of a custom type
  * that translates addresses
@@ -1249,6 +1289,51 @@ void memory_region_init_rom_device(MemoryRegion *mr,
                                    Error **errp);
 
 
+/**
+ * memory_region_init_rom_device_from_file:
+ * Initialize a ROM memory region from the specified backing file.
+ * Writes are handled via callbacks.
+ *
+ * This function initializes a memory region backed by RAM for reads
+ * and callbacks for writes, and arranges for the RAM backing to
+ * be migrated (by calling vmstate_register_ram()
+ * if @owner is a DeviceState, or vmstate_register_ram_global() if
+ * @owner is NULL).
+ *
+ * TODO: Currently we restrict @owner to being either NULL (for
+ * global RAM regions with no owner) or devices, so that we can
+ * give the RAM block a unique name for migration purposes.
+ * We should lift this restriction and allow arbitrary Objects.
+ * If you pass a non-NULL non-device @owner then we will assert.
+ *
+ * @mr: the #MemoryRegion to be initialized.
+ * @owner: the object that tracks the region's reference count
+ * @ops: callbacks for write access handling (must not be NULL).
+ * @opaque: passed to the read and write callbacks of the @ops structure.
+ * @name: Region name, becomes part of RAMBlock name used in migration stream
+ *        must be unique within any device
+ * @size: size of the region.
+ * @ram_flags: specify the properties of the ram block, which can be one
+ *             or bit-or of following values
+ *             - RAM_SHARED: mmap the backing file or device with MAP_SHARED
+ *             - RAM_PMEM: the backend @mem_path is persistent memory
+ *             Other bits are ignored.
+ * @path: specify the backing file
+ * @readonly: true to open @path for reading, false for read/write.
+ * @errp: pointer to Error*, to store an error if it happens.
+ */
+void memory_region_init_rom_device_from_file(MemoryRegion *mr,
+                                             Object *owner,
+                                             const MemoryRegionOps *ops,
+                                             void *opaque,
+                                             const char *name,
+                                             uint64_t size,
+                                             uint64_t align,
+                                             uint32_t ram_flags,
+                                             const char *path,
+                                             bool readonly,
+                                             Error **errp);
+
 /**
  * memory_region_owner: get a memory region's owner.
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 874a8fccdee..ea1892a8cd6 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1120,6 +1120,14 @@ static void memory_region_destructor_ram(MemoryRegion *mr)
     qemu_ram_free(mr->ram_block);
 }
 
+#ifndef CONFIG_POSIX
+static void memory_region_destructor_contents(MemoryRegion *mr)
+{
+    qemu_ram_free(mr->ram_block);
+    g_free(mr->contents);
+}
+#endif
+
 static bool memory_region_need_escape(char c)
 {
     return c == '/' || c == '[' || c == '\\' || c == ']';
@@ -1712,6 +1720,96 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
     }
 }
 
+void memory_region_init_rom_device_from_file_nomigrate(MemoryRegion *mr,
+                                                       Object *owner,
+                                                       const MemoryRegionOps *ops,
+                                                       void *opaque,
+                                                       const char *name,
+                                                       uint64_t size,
+                                                       uint64_t align,
+                                                       uint32_t ram_flags,
+                                                       const char *path,
+                                                       bool readonly,
+                                                       Error **errp)
+{
+    Error *err = NULL;
+
+    assert(ops);
+#ifdef CONFIG_POSIX
+    memory_region_init(mr, owner, name, size);
+    mr->opaque = opaque;
+    mr->ops = ops;
+    mr->rom_device = true;
+    mr->readonly = readonly;
+    mr->ram = true;
+    mr->align = align;
+    mr->terminates = true;
+    mr->destructor = memory_region_destructor_ram;
+    mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path,
+                                             readonly, &err);
+    if (err) {
+        mr->size = int128_zero();
+        object_unparent(OBJECT(mr));
+        error_propagate(errp, err);
+    }
+#else
+    g_autoptr(GError) gerr = NULL;
+    gsize len;
+
+    memory_region_init(mr, owner, name, size);
+    mr->ops = ops;
+    mr->opaque = opaque;
+    mr->terminates = true;
+    mr->rom_device = true;
+
+    if (!g_file_get_contents(path, &mr->contents, &len, &gerr)) {
+        error_setg(errp, "Unable to read '%s': %s", path, gerr->message);
+        return;
+    }
+    mr->destructor = memory_region_destructor_contents;
+    mr->contents = g_realloc(mr->contents, size);
+    mr->ram_block = qemu_ram_alloc_from_ptr(size, mr->contents, mr, &err);
+    if (err) {
+        mr->size = int128_zero();
+        object_unparent(OBJECT(mr));
+        error_propagate(errp, err);
+    }
+#endif
+}
+
+void memory_region_init_rom_device_from_file(MemoryRegion *mr,
+                                             Object *owner,
+                                             const MemoryRegionOps *ops,
+                                             void *opaque,
+                                             const char *name,
+                                             uint64_t size,
+                                             uint64_t align,
+                                             uint32_t ram_flags,
+                                             const char *path,
+                                             bool readonly,
+                                             Error **errp)
+{
+    DeviceState *owner_dev;
+    Error *err = NULL;
+
+    memory_region_init_rom_device_from_file_nomigrate(mr, owner, ops, opaque,
+                                                      name, size, align,
+                                                      ram_flags, path, readonly,
+                                                      &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    /* This will assert if owner is neither NULL nor a DeviceState.
+     * We only want the owner here for the purposes of defining a
+     * unique name for migration. TODO: Ideally we should implement
+     * a naming scheme for Objects which are not DeviceStates, in
+     * which case we can relax this restriction.
+     */
+    owner_dev = DEVICE(owner);
+    vmstate_register_ram(mr, owner_dev);
+}
+
 void memory_region_init_iommu(void *_iommu_mr,
                               size_t instance_size,
                               const char *mrtypename,
-- 
2.26.2


