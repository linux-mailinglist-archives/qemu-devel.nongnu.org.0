Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA6327DA8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:54:45 +0100 (CET)
Received: from localhost ([::1]:58418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGh8O-0006GY-U1
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lGh77-0004uZ-RA
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:53:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lGh76-0007J4-0l
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614599603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCBDfNcM5/wJ83GY1PhLIHZr4JrVIvrzHU4dOtdbxAI=;
 b=RkMLunoW9vuLfdvLOnLZYDH13XUFKVXnUJ3U0eUeLZ41TZWcQDB/59Du9SnLhzPsbKqS+g
 cmElRtnhUyZ//F/5mBDbv83H8/3LQ/Po3wY9F3xwjMMSrEvVi9VpExoqAce/af4jI0kfdM
 m/FAbfCZOUcP34SV9pGhm01GMQ384iA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-Kmy4d9b_ORSfHBj0ioWf2Q-1; Mon, 01 Mar 2021 06:53:21 -0500
X-MC-Unique: Kmy4d9b_ORSfHBj0ioWf2Q-1
Received: by mail-ed1-f72.google.com with SMTP id n20so3231186edr.8
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MCBDfNcM5/wJ83GY1PhLIHZr4JrVIvrzHU4dOtdbxAI=;
 b=mw4SqvCOq8RKnFE2yr2+XW4nCFTrBLM48RDk7Ez6uRdGHQvcGViPHZk6yyee8Q3A56
 20hLPcatJDzp2FBH/nqcnBYqUEvt7bDcrYawwj7dxbOjiBE43Hg3/kltTMg33VcobrZE
 70qUB3e6qzaV7Cd1SFhivJDSOr0EHs4F5oIwJavZlDAbYnC6N7Y+I+Bxj1VBfVIV81ui
 pYbvlq7gyl1/YGZJFYXEKaV91q++hO9To22+w+bpEqAPtDKkwGR7vUMxNbPLjgCEkhLb
 bV4Iwbf+anZQm9r+Pbk2W+nN8K0nQjLxJcpcHF/GLGsj6yNuN7arFxSo1gzM42I79Z8A
 3z+w==
X-Gm-Message-State: AOAM531NLKgE98TGysZK5F2IC9FlL6N1EVW672de6W6PizffAdzzzXQc
 No8kCxTbvCIvDQPeY4F4OVKCGb4Q7uMoWXv4XZhfIM43G1EaFau2oDwyv59D/d5t1SO2N6LfCiP
 c8waqN74znnECJb4=
X-Received: by 2002:a17:906:3444:: with SMTP id
 d4mr15489031ejb.410.1614599600333; 
 Mon, 01 Mar 2021 03:53:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+XBbAKrCokAQEK6pKnHp8WjhVPNlhiULoljVh+9JfjEWbg50a2G5vQM69kFnBZwe4JzlQEg==
X-Received: by 2002:a17:906:3444:: with SMTP id
 d4mr15489022ejb.410.1614599600147; 
 Mon, 01 Mar 2021 03:53:20 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id hr31sm13703307ejc.125.2021.03.01.03.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 03:53:19 -0800 (PST)
Date: Mon, 1 Mar 2021 12:53:17 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 1/3] exec/memory: Introduce
 memory_region_init_rom_device_from_file()
Message-ID: <20210301115317.i7qctejcit6zcbac@steredhat>
References: <20210225230238.3719051-1-philmd@redhat.com>
 <20210225230238.3719051-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210225230238.3719051-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Zheng Xiang <zhengxiang9@huawei.com>, haibinzhang <haibinzhang@tencent.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I don't know this code very well, but I have a couple of comments below 
:-)

On Fri, Feb 26, 2021 at 12:02:36AM +0100, Philippe Mathieu-Daudé wrote:
>Introduce memory_region_init_rom_device_from_file() which mmap
>the backing file of ROM devices. This allows to reduce QEMU memory
>footprint as the same file can be shared between multiple instances
>of QEMU.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> include/exec/memory.h | 85 +++++++++++++++++++++++++++++++++++++
> softmmu/memory.c      | 98 +++++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 183 insertions(+)
>
>diff --git a/include/exec/memory.h b/include/exec/memory.h
>index c6fb714e499..bacf7495003 100644
>--- a/include/exec/memory.h
>+++ b/include/exec/memory.h
>@@ -487,6 +487,9 @@ struct MemoryRegion {
>     const char *name;
>     unsigned ioeventfd_nb;
>     MemoryRegionIoeventfd *ioeventfds;
>+#ifndef CONFIG_POSIX
>+    gchar *contents;
>+#endif
> };
>
> struct IOMMUMemoryRegion {
>@@ -1131,6 +1134,43 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
>                                              uint64_t size,
>                                              Error **errp);
>
>+/**
>+ * memory_region_init_rom_device_from_file_nomigrate:
>+ * Initialize a ROM memory region from the specified backing file.
>+ * Writes are handled via callbacks.
>+ *
>+ * Note that this function does not do anything to cause the data in the
>+ * RAM side of the memory region to be migrated; that is the responsibility
>+ * of the caller.
>+ *
>+ * @mr: the #MemoryRegion to be initialized.
>+ * @owner: the object that tracks the region's reference count
>+ * @ops: callbacks for write access handling (must not be NULL).
>+ * @opaque: passed to the read and write callbacks of the @ops structure.
>+ * @name: Region name, becomes part of RAMBlock name used in migration stream
>+ *        must be unique within any device
>+ * @size: size of the region.
>+ * @ram_flags: specify the properties of the ram block, which can be one
>+ *             or bit-or of following values
>+ *             - RAM_SHARED: mmap the backing file or device with MAP_SHARED
>+ *             - RAM_PMEM: the backend @mem_path is persistent memory
>+ *             Other bits are ignored.
>+ * @path: specify the backing file
>+ * @readonly: true to open @path for reading, false for read/write.
>+ * @errp: pointer to Error*, to store an error if it happens.
>+ */
>+void memory_region_init_rom_device_from_file_nomigrate(MemoryRegion *mr,
>+                                                       Object *owner,
>+                                                       const MemoryRegionOps *ops,
>+                                                       void *opaque,
>+                                                       const char 
>*name,
>+                                                       uint64_t size,
>+                                                       uint64_t align,
>+                                                       uint32_t ram_flags,
>+                                                       const char *path,
>+                                                       bool readonly,
>+                                                       Error **errp);
>+
> /**
>  * memory_region_init_iommu: Initialize a memory region of a custom type
>  * that translates addresses
>@@ -1249,6 +1289,51 @@ void memory_region_init_rom_device(MemoryRegion *mr,
>                                    Error **errp);
>
>
>+/**
>+ * memory_region_init_rom_device_from_file:
>+ * Initialize a ROM memory region from the specified backing file.
>+ * Writes are handled via callbacks.
>+ *
>+ * This function initializes a memory region backed by RAM for reads
>+ * and callbacks for writes, and arranges for the RAM backing to
>+ * be migrated (by calling vmstate_register_ram()
>+ * if @owner is a DeviceState, or vmstate_register_ram_global() if
>+ * @owner is NULL).
>+ *
>+ * TODO: Currently we restrict @owner to being either NULL (for
>+ * global RAM regions with no owner) or devices, so that we can
>+ * give the RAM block a unique name for migration purposes.
>+ * We should lift this restriction and allow arbitrary Objects.
>+ * If you pass a non-NULL non-device @owner then we will assert.
>+ *
>+ * @mr: the #MemoryRegion to be initialized.
>+ * @owner: the object that tracks the region's reference count
>+ * @ops: callbacks for write access handling (must not be NULL).
>+ * @opaque: passed to the read and write callbacks of the @ops structure.
>+ * @name: Region name, becomes part of RAMBlock name used in migration stream
>+ *        must be unique within any device
>+ * @size: size of the region.
>+ * @ram_flags: specify the properties of the ram block, which can be one
>+ *             or bit-or of following values
>+ *             - RAM_SHARED: mmap the backing file or device with MAP_SHARED
>+ *             - RAM_PMEM: the backend @mem_path is persistent memory
>+ *             Other bits are ignored.
>+ * @path: specify the backing file
>+ * @readonly: true to open @path for reading, false for read/write.
>+ * @errp: pointer to Error*, to store an error if it happens.
>+ */
>+void memory_region_init_rom_device_from_file(MemoryRegion *mr,
>+                                             Object *owner,
>+                                             const MemoryRegionOps *ops,
>+                                             void *opaque,
>+                                             const char *name,
>+                                             uint64_t size,
>+                                             uint64_t align,
>+                                             uint32_t ram_flags,
>+                                             const char *path,
>+                                             bool readonly,
>+                                             Error **errp);
>+
> /**
>  * memory_region_owner: get a memory region's owner.
>  *
>diff --git a/softmmu/memory.c b/softmmu/memory.c
>index 874a8fccdee..ea1892a8cd6 100644
>--- a/softmmu/memory.c
>+++ b/softmmu/memory.c
>@@ -1120,6 +1120,14 @@ static void memory_region_destructor_ram(MemoryRegion *mr)
>     qemu_ram_free(mr->ram_block);
> }
>
>+#ifndef CONFIG_POSIX
>+static void memory_region_destructor_contents(MemoryRegion *mr)
>+{
>+    qemu_ram_free(mr->ram_block);
>+    g_free(mr->contents);
>+}
>+#endif
>+
> static bool memory_region_need_escape(char c)
> {
>     return c == '/' || c == '[' || c == '\\' || c == ']';
>@@ -1712,6 +1720,96 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
>     }
> }
>
>+void memory_region_init_rom_device_from_file_nomigrate(MemoryRegion *mr,
>+                                                       Object *owner,
>+                                                       const MemoryRegionOps *ops,
>+                                                       void *opaque,
>+                                                       const char *name,
>+                                                       uint64_t size,
>+                                                       uint64_t align,
>+                                                       uint32_t ram_flags,
>+                                                       const char *path,
>+                                                       bool readonly,
>+                                                       Error **errp)
>+{
>+    Error *err = NULL;
>+
>+    assert(ops);
>+#ifdef CONFIG_POSIX
>+    memory_region_init(mr, owner, name, size);
>+    mr->opaque = opaque;
>+    mr->ops = ops;
>+    mr->rom_device = true;
>+    mr->readonly = readonly;
>+    mr->ram = true;
>+    mr->align = align;
>+    mr->terminates = true;
>+    mr->destructor = memory_region_destructor_ram;
>+    mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path,
>+                                             readonly, &err);
>+    if (err) {
>+        mr->size = int128_zero();
>+        object_unparent(OBJECT(mr));
>+        error_propagate(errp, err);
>+    }
>+#else
>+    g_autoptr(GError) gerr = NULL;
>+    gsize len;
>+
>+    memory_region_init(mr, owner, name, size);
>+    mr->ops = ops;
>+    mr->opaque = opaque;
>+    mr->terminates = true;
>+    mr->rom_device = true;

Why when CONFIG_POSIX is defined we set 'mr->ram', 'mr->align', and 
'mr->readonly = readonly' but not here?
(I honestly don't know if they are important, I ask out of curiosity.  
:-)

>+
>+    if (!g_file_get_contents(path, &mr->contents, &len, &gerr)) {

Should we do these steps in case of an error?

           mr->size = int128_zero();
           object_unparent(OBJECT(mr));

>+        error_setg(errp, "Unable to read '%s': %s", path, gerr->message);
>+        return;
>+    }
>+    mr->destructor = memory_region_destructor_contents;
>+    mr->contents = g_realloc(mr->contents, size);
>+    mr->ram_block = qemu_ram_alloc_from_ptr(size, mr->contents, mr, &err);
>+    if (err) {
>+        mr->size = int128_zero();
>+        object_unparent(OBJECT(mr));
>+        error_propagate(errp, err);
>+    }
>+#endif

Maybe I would reorganize the code inside ifdef like this:

         memory_region_init(mr, owner, name, size);
         mr->opaque = opaque;
         ...
     #ifdef CONFIG_POSIX
         mr->destructor = memory_region_destructor_ram;
         mr->ram_block = qemu_ram_alloc_from_file(...);
     #else
         if (!g_file_get_contents(..)) {
             ...
         }
         mr->destructor = memory_region_destructor_contents;
         mr->contents = g_realloc(mr->contents, size);
         mr->ram_block = qemu_ram_alloc_from_ptr(...)
     #endif

         if (err) {
             ...
         }

I don't have a strong opinion, just an idea.

Thanks,
Stefano

>+}
>+
>+void memory_region_init_rom_device_from_file(MemoryRegion *mr,
>+                                             Object *owner,
>+                                             const MemoryRegionOps 
>*ops,
>+                                             void *opaque,
>+                                             const char *name,
>+                                             uint64_t size,
>+                                             uint64_t align,
>+                                             uint32_t ram_flags,
>+                                             const char *path,
>+                                             bool readonly,
>+                                             Error **errp)
>+{
>+    DeviceState *owner_dev;
>+    Error *err = NULL;
>+
>+    memory_region_init_rom_device_from_file_nomigrate(mr, owner, ops, opaque,
>+                                                      name, size, align,
>+                                                      ram_flags, path, readonly,
>+                                                      &err);
>+    if (err) {
>+        error_propagate(errp, err);
>+        return;
>+    }
>+    /* This will assert if owner is neither NULL nor a DeviceState.
>+     * We only want the owner here for the purposes of defining a
>+     * unique name for migration. TODO: Ideally we should implement
>+     * a naming scheme for Objects which are not DeviceStates, in
>+     * which case we can relax this restriction.
>+     */
>+    owner_dev = DEVICE(owner);
>+    vmstate_register_ram(mr, owner_dev);
>+}
>+
> void memory_region_init_iommu(void *_iommu_mr,
>                               size_t instance_size,
>                               const char *mrtypename,
>-- 
>2.26.2
>


