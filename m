Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558BE22911
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 23:16:57 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSTAu-0002cw-CH
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 17:16:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSZo-0003oH-9E
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:38:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSSZj-0004ZI-8i
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:38:36 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41411)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hSSZi-0004Y7-Pl
	for qemu-devel@nongnu.org; Sun, 19 May 2019 16:38:31 -0400
Received: by mail-pl1-x644.google.com with SMTP id f12so5707270plt.8
	for <qemu-devel@nongnu.org>; Sun, 19 May 2019 13:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iP3/CNN5zTtN5TgGZJCg5VKq0GbEgLMrSCvjo5Au37s=;
	b=mqleqw9bxzXB15Ae63IyBO9zF5opmZmA1z4kVjIK9dGIKhmLSoVZKDAO1mtnV6oPRD
	14SF+B7uGpOsUaMMIK7X79xzEBFVO1gfm0H/TH5z6r+zaef6yTznVmdmWK62gbmPLuF/
	YGIiuKbnv8acUuWxnDKNQpRCMBdcZcfgEAlxWEkkJet43pWRC3/zvYm28ND6LDlhGQyN
	BqiDwguu6TLOdhAiho+4TR4nnFqWFYmM6RI7zKcusblY7ZPXk7jwPCQ1xBOr3j95uB0e
	CXn7CJZ+3ZtIHhLpLKbCDpjvfqkhJJPBMayrXcJ1bJHy/kHU//0nHXRugKzCxWnL72Sc
	0C6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iP3/CNN5zTtN5TgGZJCg5VKq0GbEgLMrSCvjo5Au37s=;
	b=ocoQaeE923u9+tDL6isIRxJI85ELpsz7lxhVGp/dPbViiZbI4Kdn6fS5rM96VEIKbs
	5h3A1Q9aI+zZg/aDc17HNb8iVNKkYco3sACaWo2nv5fYikeGgiDvV2pKeFyXjNPpOz9T
	ogs2NuEyUHlQGXB96ctgpEtw5t5F69P4QRn+WnS898PjDAdswKPK/R7H+wX6nO6mXtYX
	ND2di5OxG1f2F8Pf906Y4PVqO4G5Is1gbG/cN/75Ac1rIsQ6116yFsAT+nrTsSmsNeM/
	AZIhK/1mOdaMwzkcqQc/fDmm5ejMIqVF2CiyuPGq2qRbJ+h/f74j9MkzPUZ3VBREqJ/4
	LTmg==
X-Gm-Message-State: APjAAAWnDIM4uRaz5pOO1vuSreu/0Fs+vxNKm3K94AStifD2XaPqkpXo
	3LJneOWpr1fN+N8uqNRt/1zlluRZ4G0=
X-Google-Smtp-Source: APXvYqxSX+JXrLZFG4M3IVcLAQ7kcFwSU0wEHA5ZlGIqJk/2X2qpTfaCKkrMZNaF260R4Q/RDqr93w==
X-Received: by 2002:a17:902:74c6:: with SMTP id
	f6mr13666125plt.335.1558298308905; 
	Sun, 19 May 2019 13:38:28 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	i7sm11397448pfo.19.2019.05.19.13.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 May 2019 13:38:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 13:36:59 -0700
Message-Id: <20190519203726.20729-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190519203726.20729-1-richard.henderson@linaro.org>
References: <20190519203726.20729-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v7 47/74] linux-user: Split out ioctl
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Do not accidentally change type of "cmd".
---
 linux-user/syscall-defs.h      |   1 +
 linux-user/syscall-ioctl.inc.c | 873 +++++++++++++++++++++++++++++++++
 linux-user/syscall.c           | 852 +-------------------------------
 linux-user/strace.list         |   3 -
 4 files changed, 875 insertions(+), 854 deletions(-)
 create mode 100644 linux-user/syscall-ioctl.inc.c

diff --git a/linux-user/syscall-defs.h b/linux-user/syscall-defs.h
index f8f280f376..f58b9745a4 100644
--- a/linux-user/syscall-defs.h
+++ b/linux-user/syscall-defs.h
@@ -61,6 +61,7 @@ SYSCALL_DEF(getppid);
 #ifdef TARGET_NR_getxpid
 SYSCALL_DEF(getxpid);
 #endif
+SYSCALL_DEF(ioctl, ARG_DEC, ARG_HEX);
 #ifdef TARGET_NR_ipc
 SYSCALL_DEF_ARGS(ipc, ARG_HEX, ARG_DEC, ARG_DEC, ARG_HEX, ARG_PTR, ARG_HEX);
 #endif
diff --git a/linux-user/syscall-ioctl.inc.c b/linux-user/syscall-ioctl.inc.c
new file mode 100644
index 0000000000..be3f0b4b92
--- /dev/null
+++ b/linux-user/syscall-ioctl.inc.c
@@ -0,0 +1,873 @@
+/*
+ *  Linux ioctl syscall implementation
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+typedef struct IOCTLEntry IOCTLEntry;
+
+typedef abi_long do_ioctl_fn(const IOCTLEntry *ie, uint8_t *buf_temp,
+                             int fd, int cmd, abi_long arg);
+
+struct IOCTLEntry {
+    int target_cmd;
+    unsigned int host_cmd;
+    const char *name;
+    int access;
+    do_ioctl_fn *do_ioctl;
+    const argtype arg_type[5];
+};
+
+#define IOC_R 0x0001
+#define IOC_W 0x0002
+#define IOC_RW (IOC_R | IOC_W)
+
+#define MAX_STRUCT_SIZE 4096
+
+#ifdef CONFIG_FIEMAP
+/*
+ * So fiemap access checks don't overflow on 32 bit systems.
+ * This is very slightly smaller than the limit imposed by
+ * the underlying kernel.
+ */
+#define FIEMAP_MAX_EXTENTS ((UINT_MAX - sizeof(struct fiemap))  \
+                            / sizeof(struct fiemap_extent))
+
+static abi_long do_ioctl_fs_ioc_fiemap(const IOCTLEntry *ie, uint8_t *buf_temp,
+                                       int fd, int cmd, abi_long arg)
+{
+    /*
+     * The parameter for this ioctl is a struct fiemap followed
+     * by an array of struct fiemap_extent whose size is set
+     * in fiemap->fm_extent_count. The array is filled in by the
+     * ioctl.
+     */
+    int target_size_in, target_size_out;
+    struct fiemap *fm;
+    const argtype *arg_type = ie->arg_type;
+    const argtype extent_arg_type[] = { MK_STRUCT(STRUCT_fiemap_extent) };
+    void *argptr, *p;
+    abi_long ret;
+    int i, extent_size = thunk_type_size(extent_arg_type, 0);
+    uint32_t outbufsz;
+    int free_fm = 0;
+
+    assert(arg_type[0] == TYPE_PTR);
+    assert(ie->access == IOC_RW);
+    arg_type++;
+    target_size_in = thunk_type_size(arg_type, 0);
+    argptr = lock_user(VERIFY_READ, arg, target_size_in, 1);
+    if (!argptr) {
+        return -TARGET_EFAULT;
+    }
+    thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
+    unlock_user(argptr, arg, 0);
+    fm = (struct fiemap *)buf_temp;
+    if (fm->fm_extent_count > FIEMAP_MAX_EXTENTS) {
+        return -TARGET_EINVAL;
+    }
+
+    outbufsz = sizeof(*fm) + sizeof(struct fiemap_extent) * fm->fm_extent_count;
+
+    if (outbufsz > MAX_STRUCT_SIZE) {
+        /*
+         * We can't fit all the extents into the fixed size buffer.
+         * Allocate one that is large enough and use it instead.
+         */
+        fm = g_try_malloc(outbufsz);
+        if (!fm) {
+            return -TARGET_ENOMEM;
+        }
+        memcpy(fm, buf_temp, sizeof(struct fiemap));
+        free_fm = 1;
+    }
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, fm));
+    if (!is_error(ret)) {
+        target_size_out = target_size_in;
+        /*
+         * An extent_count of 0 means we were only counting the extents
+         * so there are no structs to copy
+         */
+        if (fm->fm_extent_count != 0) {
+            target_size_out += fm->fm_mapped_extents * extent_size;
+        }
+        argptr = lock_user(VERIFY_WRITE, arg, target_size_out, 0);
+        if (!argptr) {
+            ret = -TARGET_EFAULT;
+        } else {
+            /* Convert the struct fiemap */
+            thunk_convert(argptr, fm, arg_type, THUNK_TARGET);
+            if (fm->fm_extent_count != 0) {
+                p = argptr + target_size_in;
+                /* ...and then all the struct fiemap_extents */
+                for (i = 0; i < fm->fm_mapped_extents; i++) {
+                    thunk_convert(p, &fm->fm_extents[i], extent_arg_type,
+                                  THUNK_TARGET);
+                    p += extent_size;
+                }
+            }
+            unlock_user(argptr, arg, target_size_out);
+        }
+    }
+    if (free_fm) {
+        g_free(fm);
+    }
+    return ret;
+}
+#endif
+
+static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
+                                int fd, int cmd, abi_long arg)
+{
+    const argtype *arg_type = ie->arg_type;
+    int target_size;
+    void *argptr;
+    int ret;
+    struct ifconf *host_ifconf;
+    uint32_t outbufsz;
+    const argtype ifreq_arg_type[] = { MK_STRUCT(STRUCT_sockaddr_ifreq) };
+    int target_ifreq_size;
+    int nb_ifreq;
+    int free_buf = 0;
+    int i;
+    int target_ifc_len;
+    abi_long target_ifc_buf;
+    int host_ifc_len;
+    char *host_ifc_buf;
+
+    assert(arg_type[0] == TYPE_PTR);
+    assert(ie->access == IOC_RW);
+
+    arg_type++;
+    target_size = thunk_type_size(arg_type, 0);
+
+    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
+    if (!argptr) {
+        return -TARGET_EFAULT;
+    }
+    thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
+    unlock_user(argptr, arg, 0);
+
+    host_ifconf = (struct ifconf *)(unsigned long)buf_temp;
+    target_ifc_len = host_ifconf->ifc_len;
+    target_ifc_buf = (abi_long)(unsigned long)host_ifconf->ifc_buf;
+
+    target_ifreq_size = thunk_type_size(ifreq_arg_type, 0);
+    nb_ifreq = target_ifc_len / target_ifreq_size;
+    host_ifc_len = nb_ifreq * sizeof(struct ifreq);
+
+    outbufsz = sizeof(*host_ifconf) + host_ifc_len;
+    if (outbufsz > MAX_STRUCT_SIZE) {
+        /*
+         * We can't fit all the extents into the fixed size buffer.
+         * Allocate one that is large enough and use it instead.
+         */
+        host_ifconf = malloc(outbufsz);
+        if (!host_ifconf) {
+            return -TARGET_ENOMEM;
+        }
+        memcpy(host_ifconf, buf_temp, sizeof(*host_ifconf));
+        free_buf = 1;
+    }
+    host_ifc_buf = (char *)host_ifconf + sizeof(*host_ifconf);
+
+    host_ifconf->ifc_len = host_ifc_len;
+    host_ifconf->ifc_buf = host_ifc_buf;
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_ifconf));
+    if (!is_error(ret)) {
+        /* convert host ifc_len to target ifc_len */
+
+        nb_ifreq = host_ifconf->ifc_len / sizeof(struct ifreq);
+        target_ifc_len = nb_ifreq * target_ifreq_size;
+        host_ifconf->ifc_len = target_ifc_len;
+
+        /* restore target ifc_buf */
+
+        host_ifconf->ifc_buf = (char *)(unsigned long)target_ifc_buf;
+
+        /* copy struct ifconf to target user */
+
+        argptr = lock_user(VERIFY_WRITE, arg, target_size, 0);
+        if (!argptr) {
+            return -TARGET_EFAULT;
+        }
+        thunk_convert(argptr, host_ifconf, arg_type, THUNK_TARGET);
+        unlock_user(argptr, arg, target_size);
+
+        /* copy ifreq[] to target user */
+
+        argptr = lock_user(VERIFY_WRITE, target_ifc_buf, target_ifc_len, 0);
+        for (i = 0; i < nb_ifreq ; i++) {
+            thunk_convert(argptr + i * target_ifreq_size,
+                          host_ifc_buf + i * sizeof(struct ifreq),
+                          ifreq_arg_type, THUNK_TARGET);
+        }
+        unlock_user(argptr, target_ifc_buf, target_ifc_len);
+    }
+
+    if (free_buf) {
+        free(host_ifconf);
+    }
+
+    return ret;
+}
+
+#if defined(CONFIG_USBFS)
+#if HOST_LONG_BITS > 64
+#error USBDEVFS thunks do not support >64 bit hosts yet.
+#endif
+struct live_urb {
+    uint64_t target_urb_adr;
+    uint64_t target_buf_adr;
+    char *target_buf_ptr;
+    struct usbdevfs_urb host_urb;
+};
+
+static GHashTable *usbdevfs_urb_hashtable(void)
+{
+    static GHashTable *urb_hashtable;
+
+    if (!urb_hashtable) {
+        urb_hashtable = g_hash_table_new(g_int64_hash, g_int64_equal);
+    }
+    return urb_hashtable;
+}
+
+static void urb_hashtable_insert(struct live_urb *urb)
+{
+    GHashTable *urb_hashtable = usbdevfs_urb_hashtable();
+    g_hash_table_insert(urb_hashtable, urb, urb);
+}
+
+static struct live_urb *urb_hashtable_lookup(uint64_t target_urb_adr)
+{
+    GHashTable *urb_hashtable = usbdevfs_urb_hashtable();
+    return g_hash_table_lookup(urb_hashtable, &target_urb_adr);
+}
+
+static void urb_hashtable_remove(struct live_urb *urb)
+{
+    GHashTable *urb_hashtable = usbdevfs_urb_hashtable();
+    g_hash_table_remove(urb_hashtable, urb);
+}
+
+static abi_long
+do_ioctl_usbdevfs_reapurb(const IOCTLEntry *ie, uint8_t *buf_temp,
+                          int fd, int cmd, abi_long arg)
+{
+    const argtype usbfsurb_arg_type[] = { MK_STRUCT(STRUCT_usbdevfs_urb) };
+    const argtype ptrvoid_arg_type[] = { TYPE_PTRVOID, 0, 0 };
+    struct live_urb *lurb;
+    void *argptr;
+    uint64_t hurb;
+    int target_size;
+    uintptr_t target_urb_adr;
+    abi_long ret;
+
+    target_size = thunk_type_size(usbfsurb_arg_type, THUNK_TARGET);
+
+    memset(buf_temp, 0, sizeof(uint64_t));
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
+    if (is_error(ret)) {
+        return ret;
+    }
+
+    memcpy(&hurb, buf_temp, sizeof(uint64_t));
+    lurb = (void *)((uintptr_t)hurb - offsetof(struct live_urb, host_urb));
+    if (!lurb->target_urb_adr) {
+        return -TARGET_EFAULT;
+    }
+    urb_hashtable_remove(lurb);
+    unlock_user(lurb->target_buf_ptr, lurb->target_buf_adr,
+                lurb->host_urb.buffer_length);
+    lurb->target_buf_ptr = NULL;
+
+    /* restore the guest buffer pointer */
+    lurb->host_urb.buffer = (void *)(uintptr_t)lurb->target_buf_adr;
+
+    /* update the guest urb struct */
+    argptr = lock_user(VERIFY_WRITE, lurb->target_urb_adr, target_size, 0);
+    if (!argptr) {
+        g_free(lurb);
+        return -TARGET_EFAULT;
+    }
+    thunk_convert(argptr, &lurb->host_urb, usbfsurb_arg_type, THUNK_TARGET);
+    unlock_user(argptr, lurb->target_urb_adr, target_size);
+
+    target_size = thunk_type_size(ptrvoid_arg_type, THUNK_TARGET);
+    /* write back the urb handle */
+    argptr = lock_user(VERIFY_WRITE, arg, target_size, 0);
+    if (!argptr) {
+        g_free(lurb);
+        return -TARGET_EFAULT;
+    }
+
+    /* GHashTable uses 64-bit keys but thunk_convert expects uintptr_t */
+    target_urb_adr = lurb->target_urb_adr;
+    thunk_convert(argptr, &target_urb_adr, ptrvoid_arg_type, THUNK_TARGET);
+    unlock_user(argptr, arg, target_size);
+
+    g_free(lurb);
+    return ret;
+}
+
+static abi_long
+do_ioctl_usbdevfs_discardurb(const IOCTLEntry *ie,
+                             uint8_t *buf_temp __attribute__((unused)),
+                             int fd, int cmd, abi_long arg)
+{
+    struct live_urb *lurb;
+
+    /* map target address back to host URB with metadata. */
+    lurb = urb_hashtable_lookup(arg);
+    if (!lurb) {
+        return -TARGET_EFAULT;
+    }
+    return get_errno(safe_ioctl(fd, ie->host_cmd, &lurb->host_urb));
+}
+
+static abi_long
+do_ioctl_usbdevfs_submiturb(const IOCTLEntry *ie, uint8_t *buf_temp,
+                            int fd, int cmd, abi_long arg)
+{
+    const argtype *arg_type = ie->arg_type;
+    int target_size;
+    abi_long ret;
+    void *argptr;
+    int rw_dir;
+    struct live_urb *lurb;
+
+    /*
+     * each submitted URB needs to map to a unique ID for the
+     * kernel, and that unique ID needs to be a pointer to
+     * host memory.  hence, we need to malloc for each URB.
+     * isochronous transfers have a variable length struct.
+     */
+    arg_type++;
+    target_size = thunk_type_size(arg_type, THUNK_TARGET);
+
+    /* construct host copy of urb and metadata */
+    lurb = g_try_malloc0(sizeof(struct live_urb));
+    if (!lurb) {
+        return -TARGET_ENOMEM;
+    }
+
+    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
+    if (!argptr) {
+        g_free(lurb);
+        return -TARGET_EFAULT;
+    }
+    thunk_convert(&lurb->host_urb, argptr, arg_type, THUNK_HOST);
+    unlock_user(argptr, arg, 0);
+
+    lurb->target_urb_adr = arg;
+    lurb->target_buf_adr = (uintptr_t)lurb->host_urb.buffer;
+
+    /* buffer space used depends on endpoint type so lock the entire buffer */
+    /* control type urbs should check the buffer contents for true direction */
+    rw_dir = lurb->host_urb.endpoint & USB_DIR_IN ? VERIFY_WRITE : VERIFY_READ;
+    lurb->target_buf_ptr = lock_user(rw_dir, lurb->target_buf_adr,
+                                     lurb->host_urb.buffer_length, 1);
+    if (lurb->target_buf_ptr == NULL) {
+        g_free(lurb);
+        return -TARGET_EFAULT;
+    }
+
+    /* update buffer pointer in host copy */
+    lurb->host_urb.buffer = lurb->target_buf_ptr;
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, &lurb->host_urb));
+    if (is_error(ret)) {
+        unlock_user(lurb->target_buf_ptr, lurb->target_buf_adr, 0);
+        g_free(lurb);
+    } else {
+        urb_hashtable_insert(lurb);
+    }
+
+    return ret;
+}
+#endif /* CONFIG_USBFS */
+
+static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
+                            int cmd, abi_long arg)
+{
+    void *argptr;
+    struct dm_ioctl *host_dm;
+    abi_long guest_data;
+    uint32_t guest_data_size;
+    int target_size;
+    const argtype *arg_type = ie->arg_type;
+    abi_long ret;
+    void *big_buf = NULL;
+    char *host_data;
+
+    arg_type++;
+    target_size = thunk_type_size(arg_type, 0);
+    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
+    if (!argptr) {
+        ret = -TARGET_EFAULT;
+        goto out;
+    }
+    thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
+    unlock_user(argptr, arg, 0);
+
+    /* buf_temp is too small, so fetch things into a bigger buffer */
+    big_buf = g_malloc0(((struct dm_ioctl *)buf_temp)->data_size * 2);
+    memcpy(big_buf, buf_temp, target_size);
+    buf_temp = big_buf;
+    host_dm = big_buf;
+
+    guest_data = arg + host_dm->data_start;
+    if ((guest_data - arg) < 0) {
+        ret = -TARGET_EINVAL;
+        goto out;
+    }
+    guest_data_size = host_dm->data_size - host_dm->data_start;
+    host_data = (char *)host_dm + host_dm->data_start;
+
+    argptr = lock_user(VERIFY_READ, guest_data, guest_data_size, 1);
+    if (!argptr) {
+        ret = -TARGET_EFAULT;
+        goto out;
+    }
+
+    switch (ie->host_cmd) {
+    case DM_REMOVE_ALL:
+    case DM_LIST_DEVICES:
+    case DM_DEV_CREATE:
+    case DM_DEV_REMOVE:
+    case DM_DEV_SUSPEND:
+    case DM_DEV_STATUS:
+    case DM_DEV_WAIT:
+    case DM_TABLE_STATUS:
+    case DM_TABLE_CLEAR:
+    case DM_TABLE_DEPS:
+    case DM_LIST_VERSIONS:
+        /* no input data */
+        break;
+    case DM_DEV_RENAME:
+    case DM_DEV_SET_GEOMETRY:
+        /* data contains only strings */
+        memcpy(host_data, argptr, guest_data_size);
+        break;
+    case DM_TARGET_MSG:
+        memcpy(host_data, argptr, guest_data_size);
+        *(uint64_t *)host_data = tswap64(*(uint64_t *)argptr);
+        break;
+    case DM_TABLE_LOAD:
+    {
+        void *gspec = argptr;
+        void *cur_data = host_data;
+        const argtype arg_type[] = { MK_STRUCT(STRUCT_dm_target_spec) };
+        int spec_size = thunk_type_size(arg_type, 0);
+        int i;
+
+        for (i = 0; i < host_dm->target_count; i++) {
+            struct dm_target_spec *spec = cur_data;
+            uint32_t next;
+            int slen;
+
+            thunk_convert(spec, gspec, arg_type, THUNK_HOST);
+            slen = strlen((char *)gspec + spec_size) + 1;
+            next = spec->next;
+            spec->next = sizeof(*spec) + slen;
+            strcpy((char *)&spec[1], gspec + spec_size);
+            gspec += next;
+            cur_data += spec->next;
+        }
+        break;
+    }
+    default:
+        ret = -TARGET_EINVAL;
+        unlock_user(argptr, guest_data, 0);
+        goto out;
+    }
+    unlock_user(argptr, guest_data, 0);
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
+    if (!is_error(ret)) {
+        guest_data = arg + host_dm->data_start;
+        guest_data_size = host_dm->data_size - host_dm->data_start;
+        argptr = lock_user(VERIFY_WRITE, guest_data, guest_data_size, 0);
+        switch (ie->host_cmd) {
+        case DM_REMOVE_ALL:
+        case DM_DEV_CREATE:
+        case DM_DEV_REMOVE:
+        case DM_DEV_RENAME:
+        case DM_DEV_SUSPEND:
+        case DM_DEV_STATUS:
+        case DM_TABLE_LOAD:
+        case DM_TABLE_CLEAR:
+        case DM_TARGET_MSG:
+        case DM_DEV_SET_GEOMETRY:
+            /* no return data */
+            break;
+        case DM_LIST_DEVICES:
+        {
+            struct dm_name_list *nl = (void *)host_dm + host_dm->data_start;
+            uint32_t remaining_data = guest_data_size;
+            void *cur_data = argptr;
+            const argtype arg_type[] = { MK_STRUCT(STRUCT_dm_name_list) };
+            int nl_size = 12; /* can't use thunk_size due to alignment */
+
+            while (1) {
+                uint32_t next = nl->next;
+                if (next) {
+                    nl->next = nl_size + (strlen(nl->name) + 1);
+                }
+                if (remaining_data < nl->next) {
+                    host_dm->flags |= DM_BUFFER_FULL_FLAG;
+                    break;
+                }
+                thunk_convert(cur_data, nl, arg_type, THUNK_TARGET);
+                strcpy(cur_data + nl_size, nl->name);
+                cur_data += nl->next;
+                remaining_data -= nl->next;
+                if (!next) {
+                    break;
+                }
+                nl = (void *)nl + next;
+            }
+            break;
+        }
+        case DM_DEV_WAIT:
+        case DM_TABLE_STATUS:
+        {
+            struct dm_target_spec *spec
+                = (void *)host_dm + host_dm->data_start;
+            void *cur_data = argptr;
+            const argtype arg_type[] = { MK_STRUCT(STRUCT_dm_target_spec) };
+            int spec_size = thunk_type_size(arg_type, 0);
+            int i;
+
+            for (i = 0; i < host_dm->target_count; i++) {
+                uint32_t next = spec->next;
+                int slen = strlen((char *)&spec[1]) + 1;
+                spec->next = (cur_data - argptr) + spec_size + slen;
+                if (guest_data_size < spec->next) {
+                    host_dm->flags |= DM_BUFFER_FULL_FLAG;
+                    break;
+                }
+                thunk_convert(cur_data, spec, arg_type, THUNK_TARGET);
+                strcpy(cur_data + spec_size, (char *)&spec[1]);
+                cur_data = argptr + spec->next;
+                spec = (void *)host_dm + host_dm->data_start + next;
+            }
+            break;
+        }
+        case DM_TABLE_DEPS:
+        {
+            void *hdata = (void *)host_dm + host_dm->data_start;
+            int count = *(uint32_t *)hdata;
+            uint64_t *hdev = hdata + 8;
+            uint64_t *gdev = argptr + 8;
+            int i;
+
+            *(uint32_t *)argptr = tswap32(count);
+            for (i = 0; i < count; i++) {
+                *gdev = tswap64(*hdev);
+                gdev++;
+                hdev++;
+            }
+            break;
+        }
+        case DM_LIST_VERSIONS:
+        {
+            struct dm_target_versions *vers
+                = (void *)host_dm + host_dm->data_start;
+            uint32_t remaining_data = guest_data_size;
+            void *cur_data = argptr;
+            const argtype arg_type[]
+                = { MK_STRUCT(STRUCT_dm_target_versions) };
+            int vers_size = thunk_type_size(arg_type, 0);
+
+            while (1) {
+                uint32_t next = vers->next;
+                if (next) {
+                    vers->next = vers_size + strlen(vers->name) + 1;
+                }
+                if (remaining_data < vers->next) {
+                    host_dm->flags |= DM_BUFFER_FULL_FLAG;
+                    break;
+                }
+                thunk_convert(cur_data, vers, arg_type, THUNK_TARGET);
+                strcpy(cur_data + vers_size, vers->name);
+                cur_data += vers->next;
+                remaining_data -= vers->next;
+                if (!next) {
+                    break;
+                }
+                vers = (void *)vers + next;
+            }
+            break;
+        }
+        default:
+            unlock_user(argptr, guest_data, 0);
+            ret = -TARGET_EINVAL;
+            goto out;
+        }
+        unlock_user(argptr, guest_data, guest_data_size);
+
+        argptr = lock_user(VERIFY_WRITE, arg, target_size, 0);
+        if (!argptr) {
+            ret = -TARGET_EFAULT;
+            goto out;
+        }
+        thunk_convert(argptr, buf_temp, arg_type, THUNK_TARGET);
+        unlock_user(argptr, arg, target_size);
+    }
+out:
+    g_free(big_buf);
+    return ret;
+}
+
+static abi_long do_ioctl_blkpg(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
+                               int cmd, abi_long arg)
+{
+    void *argptr;
+    int target_size;
+    const argtype *arg_type = ie->arg_type;
+    const argtype part_arg_type[] = { MK_STRUCT(STRUCT_blkpg_partition) };
+    abi_long ret;
+    struct blkpg_ioctl_arg *host_blkpg = (void *)buf_temp;
+    struct blkpg_partition host_part;
+
+    /* Read and convert blkpg */
+    arg_type++;
+    target_size = thunk_type_size(arg_type, 0);
+    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
+    if (!argptr) {
+        ret = -TARGET_EFAULT;
+        goto out;
+    }
+    thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
+    unlock_user(argptr, arg, 0);
+
+    switch (host_blkpg->op) {
+    case BLKPG_ADD_PARTITION:
+    case BLKPG_DEL_PARTITION:
+        /* payload is struct blkpg_partition */
+        break;
+    default:
+        /* Unknown opcode */
+        ret = -TARGET_EINVAL;
+        goto out;
+    }
+
+    /* Read and convert blkpg->data */
+    arg = (abi_long)(uintptr_t)host_blkpg->data;
+    target_size = thunk_type_size(part_arg_type, 0);
+    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
+    if (!argptr) {
+        ret = -TARGET_EFAULT;
+        goto out;
+    }
+    thunk_convert(&host_part, argptr, part_arg_type, THUNK_HOST);
+    unlock_user(argptr, arg, 0);
+
+    /* Swizzle the data pointer to our local copy and call! */
+    host_blkpg->data = &host_part;
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_blkpg));
+
+out:
+    return ret;
+}
+
+static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
+                            int fd, int cmd, abi_long arg)
+{
+    const argtype *arg_type = ie->arg_type;
+    const StructEntry *se;
+    const argtype *field_types;
+    const int *dst_offsets, *src_offsets;
+    int target_size;
+    void *argptr;
+    abi_ulong *target_rt_dev_ptr = NULL;
+    unsigned long *host_rt_dev_ptr = NULL;
+    abi_long ret;
+    int i;
+
+    assert(ie->access == IOC_W);
+    assert(*arg_type == TYPE_PTR);
+    arg_type++;
+    assert(*arg_type == TYPE_STRUCT);
+    target_size = thunk_type_size(arg_type, 0);
+    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
+    if (!argptr) {
+        return -TARGET_EFAULT;
+    }
+    arg_type++;
+    assert(*arg_type == (int)STRUCT_rtentry);
+    se = struct_entries + *arg_type++;
+    assert(se->convert[0] == NULL);
+    /* convert struct here to be able to catch rt_dev string */
+    field_types = se->field_types;
+    dst_offsets = se->field_offsets[THUNK_HOST];
+    src_offsets = se->field_offsets[THUNK_TARGET];
+    for (i = 0; i < se->nb_fields; i++) {
+        if (dst_offsets[i] == offsetof(struct rtentry, rt_dev)) {
+            assert(*field_types == TYPE_PTRVOID);
+            target_rt_dev_ptr = (abi_ulong *)(argptr + src_offsets[i]);
+            host_rt_dev_ptr = (unsigned long *)(buf_temp + dst_offsets[i]);
+            if (*target_rt_dev_ptr != 0) {
+                *host_rt_dev_ptr = (unsigned long)lock_user_string(
+                    tswapal(*target_rt_dev_ptr));
+                if (!*host_rt_dev_ptr) {
+                    unlock_user(argptr, arg, 0);
+                    return -TARGET_EFAULT;
+                }
+            } else {
+                *host_rt_dev_ptr = 0;
+            }
+            field_types++;
+            continue;
+        }
+        field_types = thunk_convert(buf_temp + dst_offsets[i],
+                                    argptr + src_offsets[i],
+                                    field_types, THUNK_HOST);
+    }
+    unlock_user(argptr, arg, 0);
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
+    if (*host_rt_dev_ptr != 0) {
+        unlock_user((void *)*host_rt_dev_ptr,
+                    *target_rt_dev_ptr, 0);
+    }
+    return ret;
+}
+
+static abi_long do_ioctl_kdsigaccept(const IOCTLEntry *ie, uint8_t *buf_temp,
+                                     int fd, int cmd, abi_long arg)
+{
+    int sig = target_to_host_signal(arg);
+    return get_errno(safe_ioctl(fd, ie->host_cmd, sig));
+}
+
+#ifdef TIOCGPTPEER
+static abi_long do_ioctl_tiocgptpeer(const IOCTLEntry *ie, uint8_t *buf_temp,
+                                     int fd, int cmd, abi_long arg)
+{
+    int flags = target_to_host_bitmask(arg, fcntl_flags_tbl);
+    return get_errno(safe_ioctl(fd, ie->host_cmd, flags));
+}
+#endif
+
+static IOCTLEntry ioctl_entries[] = {
+#define IOCTL(cmd, access, ...)                                 \
+    { TARGET_ ## cmd, cmd, #cmd, access, 0, {  __VA_ARGS__ } },
+#define IOCTL_SPECIAL(cmd, access, dofn, ...)                           \
+    { TARGET_ ## cmd, cmd, #cmd, access, dofn, {  __VA_ARGS__ } },
+#define IOCTL_IGNORE(cmd)                       \
+    { TARGET_ ## cmd, 0, #cmd },
+#include "ioctls.h"
+    { 0, 0, },
+};
+
+/* ??? Implement proper locking for ioctls.  */
+SYSCALL_IMPL(ioctl)
+{
+    int fd = arg1;
+    int cmd = arg2;
+    abi_ulong arg = arg3;
+    const IOCTLEntry *ie;
+    const argtype *arg_type;
+    abi_long ret;
+    uint8_t buf_temp[MAX_STRUCT_SIZE];
+    int target_size;
+    void *argptr;
+
+    for (ie = ioctl_entries; ; ie++) {
+        if (ie->target_cmd == 0) {
+            gemu_log("Unsupported ioctl: cmd=0x%04lx\n", (long)cmd);
+            return -TARGET_ENOSYS;
+        }
+        if (ie->target_cmd == cmd) {
+            break;
+        }
+    }
+
+    arg_type = ie->arg_type;
+    if (ie->do_ioctl) {
+        return ie->do_ioctl(ie, buf_temp, fd, cmd, arg);
+    } else if (!ie->host_cmd) {
+        /*
+         * Some architectures define BSD ioctls in their headers
+         * that are not implemented in Linux.
+         */
+        return -TARGET_ENOSYS;
+    }
+
+    switch (arg_type[0]) {
+    case TYPE_NULL:
+        /* no argument */
+        ret = get_errno(safe_ioctl(fd, ie->host_cmd));
+        break;
+    case TYPE_PTRVOID:
+    case TYPE_INT:
+        ret = get_errno(safe_ioctl(fd, ie->host_cmd, arg));
+        break;
+    case TYPE_PTR:
+        arg_type++;
+        target_size = thunk_type_size(arg_type, 0);
+        switch (ie->access) {
+        case IOC_R:
+            ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
+            if (!is_error(ret)) {
+                argptr = lock_user(VERIFY_WRITE, arg, target_size, 0);
+                if (!argptr) {
+                    return -TARGET_EFAULT;
+                }
+                thunk_convert(argptr, buf_temp, arg_type, THUNK_TARGET);
+                unlock_user(argptr, arg, target_size);
+            }
+            break;
+        case IOC_W:
+            argptr = lock_user(VERIFY_READ, arg, target_size, 1);
+            if (!argptr) {
+                return -TARGET_EFAULT;
+            }
+            thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
+            unlock_user(argptr, arg, 0);
+            ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
+            break;
+        default:
+        case IOC_RW:
+            argptr = lock_user(VERIFY_READ, arg, target_size, 1);
+            if (!argptr) {
+                return -TARGET_EFAULT;
+            }
+            thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
+            unlock_user(argptr, arg, 0);
+            ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
+            if (!is_error(ret)) {
+                argptr = lock_user(VERIFY_WRITE, arg, target_size, 0);
+                if (!argptr) {
+                    return -TARGET_EFAULT;
+                }
+                thunk_convert(argptr, buf_temp, arg_type, THUNK_TARGET);
+                unlock_user(argptr, arg, target_size);
+            }
+            break;
+        }
+        break;
+    default:
+        gemu_log("Unsupported ioctl type: cmd=0x%04lx type=%d\n",
+                 (long)cmd, arg_type[0]);
+        ret = -TARGET_ENOSYS;
+        break;
+    }
+    return ret;
+}
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d0e76c392e..8f90affe2f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2979,855 +2979,6 @@ STRUCT_MAX
 #undef STRUCT
 #undef STRUCT_SPECIAL
 
-typedef struct IOCTLEntry IOCTLEntry;
-
-typedef abi_long do_ioctl_fn(const IOCTLEntry *ie, uint8_t *buf_temp,
-                             int fd, int cmd, abi_long arg);
-
-struct IOCTLEntry {
-    int target_cmd;
-    unsigned int host_cmd;
-    const char *name;
-    int access;
-    do_ioctl_fn *do_ioctl;
-    const argtype arg_type[5];
-};
-
-#define IOC_R 0x0001
-#define IOC_W 0x0002
-#define IOC_RW (IOC_R | IOC_W)
-
-#define MAX_STRUCT_SIZE 4096
-
-#ifdef CONFIG_FIEMAP
-/* So fiemap access checks don't overflow on 32 bit systems.
- * This is very slightly smaller than the limit imposed by
- * the underlying kernel.
- */
-#define FIEMAP_MAX_EXTENTS ((UINT_MAX - sizeof(struct fiemap))  \
-                            / sizeof(struct fiemap_extent))
-
-static abi_long do_ioctl_fs_ioc_fiemap(const IOCTLEntry *ie, uint8_t *buf_temp,
-                                       int fd, int cmd, abi_long arg)
-{
-    /* The parameter for this ioctl is a struct fiemap followed
-     * by an array of struct fiemap_extent whose size is set
-     * in fiemap->fm_extent_count. The array is filled in by the
-     * ioctl.
-     */
-    int target_size_in, target_size_out;
-    struct fiemap *fm;
-    const argtype *arg_type = ie->arg_type;
-    const argtype extent_arg_type[] = { MK_STRUCT(STRUCT_fiemap_extent) };
-    void *argptr, *p;
-    abi_long ret;
-    int i, extent_size = thunk_type_size(extent_arg_type, 0);
-    uint32_t outbufsz;
-    int free_fm = 0;
-
-    assert(arg_type[0] == TYPE_PTR);
-    assert(ie->access == IOC_RW);
-    arg_type++;
-    target_size_in = thunk_type_size(arg_type, 0);
-    argptr = lock_user(VERIFY_READ, arg, target_size_in, 1);
-    if (!argptr) {
-        return -TARGET_EFAULT;
-    }
-    thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
-    unlock_user(argptr, arg, 0);
-    fm = (struct fiemap *)buf_temp;
-    if (fm->fm_extent_count > FIEMAP_MAX_EXTENTS) {
-        return -TARGET_EINVAL;
-    }
-
-    outbufsz = sizeof (*fm) +
-        (sizeof(struct fiemap_extent) * fm->fm_extent_count);
-
-    if (outbufsz > MAX_STRUCT_SIZE) {
-        /* We can't fit all the extents into the fixed size buffer.
-         * Allocate one that is large enough and use it instead.
-         */
-        fm = g_try_malloc(outbufsz);
-        if (!fm) {
-            return -TARGET_ENOMEM;
-        }
-        memcpy(fm, buf_temp, sizeof(struct fiemap));
-        free_fm = 1;
-    }
-    ret = get_errno(safe_ioctl(fd, ie->host_cmd, fm));
-    if (!is_error(ret)) {
-        target_size_out = target_size_in;
-        /* An extent_count of 0 means we were only counting the extents
-         * so there are no structs to copy
-         */
-        if (fm->fm_extent_count != 0) {
-            target_size_out += fm->fm_mapped_extents * extent_size;
-        }
-        argptr = lock_user(VERIFY_WRITE, arg, target_size_out, 0);
-        if (!argptr) {
-            ret = -TARGET_EFAULT;
-        } else {
-            /* Convert the struct fiemap */
-            thunk_convert(argptr, fm, arg_type, THUNK_TARGET);
-            if (fm->fm_extent_count != 0) {
-                p = argptr + target_size_in;
-                /* ...and then all the struct fiemap_extents */
-                for (i = 0; i < fm->fm_mapped_extents; i++) {
-                    thunk_convert(p, &fm->fm_extents[i], extent_arg_type,
-                                  THUNK_TARGET);
-                    p += extent_size;
-                }
-            }
-            unlock_user(argptr, arg, target_size_out);
-        }
-    }
-    if (free_fm) {
-        g_free(fm);
-    }
-    return ret;
-}
-#endif
-
-static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
-                                int fd, int cmd, abi_long arg)
-{
-    const argtype *arg_type = ie->arg_type;
-    int target_size;
-    void *argptr;
-    int ret;
-    struct ifconf *host_ifconf;
-    uint32_t outbufsz;
-    const argtype ifreq_arg_type[] = { MK_STRUCT(STRUCT_sockaddr_ifreq) };
-    int target_ifreq_size;
-    int nb_ifreq;
-    int free_buf = 0;
-    int i;
-    int target_ifc_len;
-    abi_long target_ifc_buf;
-    int host_ifc_len;
-    char *host_ifc_buf;
-
-    assert(arg_type[0] == TYPE_PTR);
-    assert(ie->access == IOC_RW);
-
-    arg_type++;
-    target_size = thunk_type_size(arg_type, 0);
-
-    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
-    if (!argptr)
-        return -TARGET_EFAULT;
-    thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
-    unlock_user(argptr, arg, 0);
-
-    host_ifconf = (struct ifconf *)(unsigned long)buf_temp;
-    target_ifc_buf = (abi_long)(unsigned long)host_ifconf->ifc_buf;
-    target_ifreq_size = thunk_type_size(ifreq_arg_type, 0);
-
-    if (target_ifc_buf != 0) {
-        target_ifc_len = host_ifconf->ifc_len;
-        nb_ifreq = target_ifc_len / target_ifreq_size;
-        host_ifc_len = nb_ifreq * sizeof(struct ifreq);
-
-        outbufsz = sizeof(*host_ifconf) + host_ifc_len;
-        if (outbufsz > MAX_STRUCT_SIZE) {
-            /*
-             * We can't fit all the extents into the fixed size buffer.
-             * Allocate one that is large enough and use it instead.
-             */
-            host_ifconf = malloc(outbufsz);
-            if (!host_ifconf) {
-                return -TARGET_ENOMEM;
-            }
-            memcpy(host_ifconf, buf_temp, sizeof(*host_ifconf));
-            free_buf = 1;
-        }
-        host_ifc_buf = (char *)host_ifconf + sizeof(*host_ifconf);
-
-        host_ifconf->ifc_len = host_ifc_len;
-    } else {
-      host_ifc_buf = NULL;
-    }
-    host_ifconf->ifc_buf = host_ifc_buf;
-
-    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_ifconf));
-    if (!is_error(ret)) {
-	/* convert host ifc_len to target ifc_len */
-
-        nb_ifreq = host_ifconf->ifc_len / sizeof(struct ifreq);
-        target_ifc_len = nb_ifreq * target_ifreq_size;
-        host_ifconf->ifc_len = target_ifc_len;
-
-	/* restore target ifc_buf */
-
-        host_ifconf->ifc_buf = (char *)(unsigned long)target_ifc_buf;
-
-	/* copy struct ifconf to target user */
-
-        argptr = lock_user(VERIFY_WRITE, arg, target_size, 0);
-        if (!argptr)
-            return -TARGET_EFAULT;
-        thunk_convert(argptr, host_ifconf, arg_type, THUNK_TARGET);
-        unlock_user(argptr, arg, target_size);
-
-        if (target_ifc_buf != 0) {
-            /* copy ifreq[] to target user */
-            argptr = lock_user(VERIFY_WRITE, target_ifc_buf, target_ifc_len, 0);
-            for (i = 0; i < nb_ifreq ; i++) {
-                thunk_convert(argptr + i * target_ifreq_size,
-                              host_ifc_buf + i * sizeof(struct ifreq),
-                              ifreq_arg_type, THUNK_TARGET);
-            }
-            unlock_user(argptr, target_ifc_buf, target_ifc_len);
-        }
-    }
-
-    if (free_buf) {
-        free(host_ifconf);
-    }
-
-    return ret;
-}
-
-#if defined(CONFIG_USBFS)
-#if HOST_LONG_BITS > 64
-#error USBDEVFS thunks do not support >64 bit hosts yet.
-#endif
-struct live_urb {
-    uint64_t target_urb_adr;
-    uint64_t target_buf_adr;
-    char *target_buf_ptr;
-    struct usbdevfs_urb host_urb;
-};
-
-static GHashTable *usbdevfs_urb_hashtable(void)
-{
-    static GHashTable *urb_hashtable;
-
-    if (!urb_hashtable) {
-        urb_hashtable = g_hash_table_new(g_int64_hash, g_int64_equal);
-    }
-    return urb_hashtable;
-}
-
-static void urb_hashtable_insert(struct live_urb *urb)
-{
-    GHashTable *urb_hashtable = usbdevfs_urb_hashtable();
-    g_hash_table_insert(urb_hashtable, urb, urb);
-}
-
-static struct live_urb *urb_hashtable_lookup(uint64_t target_urb_adr)
-{
-    GHashTable *urb_hashtable = usbdevfs_urb_hashtable();
-    return g_hash_table_lookup(urb_hashtable, &target_urb_adr);
-}
-
-static void urb_hashtable_remove(struct live_urb *urb)
-{
-    GHashTable *urb_hashtable = usbdevfs_urb_hashtable();
-    g_hash_table_remove(urb_hashtable, urb);
-}
-
-static abi_long
-do_ioctl_usbdevfs_reapurb(const IOCTLEntry *ie, uint8_t *buf_temp,
-                          int fd, int cmd, abi_long arg)
-{
-    const argtype usbfsurb_arg_type[] = { MK_STRUCT(STRUCT_usbdevfs_urb) };
-    const argtype ptrvoid_arg_type[] = { TYPE_PTRVOID, 0, 0 };
-    struct live_urb *lurb;
-    void *argptr;
-    uint64_t hurb;
-    int target_size;
-    uintptr_t target_urb_adr;
-    abi_long ret;
-
-    target_size = thunk_type_size(usbfsurb_arg_type, THUNK_TARGET);
-
-    memset(buf_temp, 0, sizeof(uint64_t));
-    ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
-    if (is_error(ret)) {
-        return ret;
-    }
-
-    memcpy(&hurb, buf_temp, sizeof(uint64_t));
-    lurb = (void *)((uintptr_t)hurb - offsetof(struct live_urb, host_urb));
-    if (!lurb->target_urb_adr) {
-        return -TARGET_EFAULT;
-    }
-    urb_hashtable_remove(lurb);
-    unlock_user(lurb->target_buf_ptr, lurb->target_buf_adr,
-        lurb->host_urb.buffer_length);
-    lurb->target_buf_ptr = NULL;
-
-    /* restore the guest buffer pointer */
-    lurb->host_urb.buffer = (void *)(uintptr_t)lurb->target_buf_adr;
-
-    /* update the guest urb struct */
-    argptr = lock_user(VERIFY_WRITE, lurb->target_urb_adr, target_size, 0);
-    if (!argptr) {
-        g_free(lurb);
-        return -TARGET_EFAULT;
-    }
-    thunk_convert(argptr, &lurb->host_urb, usbfsurb_arg_type, THUNK_TARGET);
-    unlock_user(argptr, lurb->target_urb_adr, target_size);
-
-    target_size = thunk_type_size(ptrvoid_arg_type, THUNK_TARGET);
-    /* write back the urb handle */
-    argptr = lock_user(VERIFY_WRITE, arg, target_size, 0);
-    if (!argptr) {
-        g_free(lurb);
-        return -TARGET_EFAULT;
-    }
-
-    /* GHashTable uses 64-bit keys but thunk_convert expects uintptr_t */
-    target_urb_adr = lurb->target_urb_adr;
-    thunk_convert(argptr, &target_urb_adr, ptrvoid_arg_type, THUNK_TARGET);
-    unlock_user(argptr, arg, target_size);
-
-    g_free(lurb);
-    return ret;
-}
-
-static abi_long
-do_ioctl_usbdevfs_discardurb(const IOCTLEntry *ie,
-                             uint8_t *buf_temp __attribute__((unused)),
-                             int fd, int cmd, abi_long arg)
-{
-    struct live_urb *lurb;
-
-    /* map target address back to host URB with metadata. */
-    lurb = urb_hashtable_lookup(arg);
-    if (!lurb) {
-        return -TARGET_EFAULT;
-    }
-    return get_errno(safe_ioctl(fd, ie->host_cmd, &lurb->host_urb));
-}
-
-static abi_long
-do_ioctl_usbdevfs_submiturb(const IOCTLEntry *ie, uint8_t *buf_temp,
-                            int fd, int cmd, abi_long arg)
-{
-    const argtype *arg_type = ie->arg_type;
-    int target_size;
-    abi_long ret;
-    void *argptr;
-    int rw_dir;
-    struct live_urb *lurb;
-
-    /*
-     * each submitted URB needs to map to a unique ID for the
-     * kernel, and that unique ID needs to be a pointer to
-     * host memory.  hence, we need to malloc for each URB.
-     * isochronous transfers have a variable length struct.
-     */
-    arg_type++;
-    target_size = thunk_type_size(arg_type, THUNK_TARGET);
-
-    /* construct host copy of urb and metadata */
-    lurb = g_try_malloc0(sizeof(struct live_urb));
-    if (!lurb) {
-        return -TARGET_ENOMEM;
-    }
-
-    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
-    if (!argptr) {
-        g_free(lurb);
-        return -TARGET_EFAULT;
-    }
-    thunk_convert(&lurb->host_urb, argptr, arg_type, THUNK_HOST);
-    unlock_user(argptr, arg, 0);
-
-    lurb->target_urb_adr = arg;
-    lurb->target_buf_adr = (uintptr_t)lurb->host_urb.buffer;
-
-    /* buffer space used depends on endpoint type so lock the entire buffer */
-    /* control type urbs should check the buffer contents for true direction */
-    rw_dir = lurb->host_urb.endpoint & USB_DIR_IN ? VERIFY_WRITE : VERIFY_READ;
-    lurb->target_buf_ptr = lock_user(rw_dir, lurb->target_buf_adr,
-        lurb->host_urb.buffer_length, 1);
-    if (lurb->target_buf_ptr == NULL) {
-        g_free(lurb);
-        return -TARGET_EFAULT;
-    }
-
-    /* update buffer pointer in host copy */
-    lurb->host_urb.buffer = lurb->target_buf_ptr;
-
-    ret = get_errno(safe_ioctl(fd, ie->host_cmd, &lurb->host_urb));
-    if (is_error(ret)) {
-        unlock_user(lurb->target_buf_ptr, lurb->target_buf_adr, 0);
-        g_free(lurb);
-    } else {
-        urb_hashtable_insert(lurb);
-    }
-
-    return ret;
-}
-#endif /* CONFIG_USBFS */
-
-static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
-                            int cmd, abi_long arg)
-{
-    void *argptr;
-    struct dm_ioctl *host_dm;
-    abi_long guest_data;
-    uint32_t guest_data_size;
-    int target_size;
-    const argtype *arg_type = ie->arg_type;
-    abi_long ret;
-    void *big_buf = NULL;
-    char *host_data;
-
-    arg_type++;
-    target_size = thunk_type_size(arg_type, 0);
-    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
-    if (!argptr) {
-        ret = -TARGET_EFAULT;
-        goto out;
-    }
-    thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
-    unlock_user(argptr, arg, 0);
-
-    /* buf_temp is too small, so fetch things into a bigger buffer */
-    big_buf = g_malloc0(((struct dm_ioctl*)buf_temp)->data_size * 2);
-    memcpy(big_buf, buf_temp, target_size);
-    buf_temp = big_buf;
-    host_dm = big_buf;
-
-    guest_data = arg + host_dm->data_start;
-    if ((guest_data - arg) < 0) {
-        ret = -TARGET_EINVAL;
-        goto out;
-    }
-    guest_data_size = host_dm->data_size - host_dm->data_start;
-    host_data = (char*)host_dm + host_dm->data_start;
-
-    argptr = lock_user(VERIFY_READ, guest_data, guest_data_size, 1);
-    if (!argptr) {
-        ret = -TARGET_EFAULT;
-        goto out;
-    }
-
-    switch (ie->host_cmd) {
-    case DM_REMOVE_ALL:
-    case DM_LIST_DEVICES:
-    case DM_DEV_CREATE:
-    case DM_DEV_REMOVE:
-    case DM_DEV_SUSPEND:
-    case DM_DEV_STATUS:
-    case DM_DEV_WAIT:
-    case DM_TABLE_STATUS:
-    case DM_TABLE_CLEAR:
-    case DM_TABLE_DEPS:
-    case DM_LIST_VERSIONS:
-        /* no input data */
-        break;
-    case DM_DEV_RENAME:
-    case DM_DEV_SET_GEOMETRY:
-        /* data contains only strings */
-        memcpy(host_data, argptr, guest_data_size);
-        break;
-    case DM_TARGET_MSG:
-        memcpy(host_data, argptr, guest_data_size);
-        *(uint64_t*)host_data = tswap64(*(uint64_t*)argptr);
-        break;
-    case DM_TABLE_LOAD:
-    {
-        void *gspec = argptr;
-        void *cur_data = host_data;
-        const argtype arg_type[] = { MK_STRUCT(STRUCT_dm_target_spec) };
-        int spec_size = thunk_type_size(arg_type, 0);
-        int i;
-
-        for (i = 0; i < host_dm->target_count; i++) {
-            struct dm_target_spec *spec = cur_data;
-            uint32_t next;
-            int slen;
-
-            thunk_convert(spec, gspec, arg_type, THUNK_HOST);
-            slen = strlen((char*)gspec + spec_size) + 1;
-            next = spec->next;
-            spec->next = sizeof(*spec) + slen;
-            strcpy((char*)&spec[1], gspec + spec_size);
-            gspec += next;
-            cur_data += spec->next;
-        }
-        break;
-    }
-    default:
-        ret = -TARGET_EINVAL;
-        unlock_user(argptr, guest_data, 0);
-        goto out;
-    }
-    unlock_user(argptr, guest_data, 0);
-
-    ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
-    if (!is_error(ret)) {
-        guest_data = arg + host_dm->data_start;
-        guest_data_size = host_dm->data_size - host_dm->data_start;
-        argptr = lock_user(VERIFY_WRITE, guest_data, guest_data_size, 0);
-        switch (ie->host_cmd) {
-        case DM_REMOVE_ALL:
-        case DM_DEV_CREATE:
-        case DM_DEV_REMOVE:
-        case DM_DEV_RENAME:
-        case DM_DEV_SUSPEND:
-        case DM_DEV_STATUS:
-        case DM_TABLE_LOAD:
-        case DM_TABLE_CLEAR:
-        case DM_TARGET_MSG:
-        case DM_DEV_SET_GEOMETRY:
-            /* no return data */
-            break;
-        case DM_LIST_DEVICES:
-        {
-            struct dm_name_list *nl = (void*)host_dm + host_dm->data_start;
-            uint32_t remaining_data = guest_data_size;
-            void *cur_data = argptr;
-            const argtype arg_type[] = { MK_STRUCT(STRUCT_dm_name_list) };
-            int nl_size = 12; /* can't use thunk_size due to alignment */
-
-            while (1) {
-                uint32_t next = nl->next;
-                if (next) {
-                    nl->next = nl_size + (strlen(nl->name) + 1);
-                }
-                if (remaining_data < nl->next) {
-                    host_dm->flags |= DM_BUFFER_FULL_FLAG;
-                    break;
-                }
-                thunk_convert(cur_data, nl, arg_type, THUNK_TARGET);
-                strcpy(cur_data + nl_size, nl->name);
-                cur_data += nl->next;
-                remaining_data -= nl->next;
-                if (!next) {
-                    break;
-                }
-                nl = (void*)nl + next;
-            }
-            break;
-        }
-        case DM_DEV_WAIT:
-        case DM_TABLE_STATUS:
-        {
-            struct dm_target_spec *spec = (void*)host_dm + host_dm->data_start;
-            void *cur_data = argptr;
-            const argtype arg_type[] = { MK_STRUCT(STRUCT_dm_target_spec) };
-            int spec_size = thunk_type_size(arg_type, 0);
-            int i;
-
-            for (i = 0; i < host_dm->target_count; i++) {
-                uint32_t next = spec->next;
-                int slen = strlen((char*)&spec[1]) + 1;
-                spec->next = (cur_data - argptr) + spec_size + slen;
-                if (guest_data_size < spec->next) {
-                    host_dm->flags |= DM_BUFFER_FULL_FLAG;
-                    break;
-                }
-                thunk_convert(cur_data, spec, arg_type, THUNK_TARGET);
-                strcpy(cur_data + spec_size, (char*)&spec[1]);
-                cur_data = argptr + spec->next;
-                spec = (void*)host_dm + host_dm->data_start + next;
-            }
-            break;
-        }
-        case DM_TABLE_DEPS:
-        {
-            void *hdata = (void*)host_dm + host_dm->data_start;
-            int count = *(uint32_t*)hdata;
-            uint64_t *hdev = hdata + 8;
-            uint64_t *gdev = argptr + 8;
-            int i;
-
-            *(uint32_t*)argptr = tswap32(count);
-            for (i = 0; i < count; i++) {
-                *gdev = tswap64(*hdev);
-                gdev++;
-                hdev++;
-            }
-            break;
-        }
-        case DM_LIST_VERSIONS:
-        {
-            struct dm_target_versions *vers = (void*)host_dm + host_dm->data_start;
-            uint32_t remaining_data = guest_data_size;
-            void *cur_data = argptr;
-            const argtype arg_type[] = { MK_STRUCT(STRUCT_dm_target_versions) };
-            int vers_size = thunk_type_size(arg_type, 0);
-
-            while (1) {
-                uint32_t next = vers->next;
-                if (next) {
-                    vers->next = vers_size + (strlen(vers->name) + 1);
-                }
-                if (remaining_data < vers->next) {
-                    host_dm->flags |= DM_BUFFER_FULL_FLAG;
-                    break;
-                }
-                thunk_convert(cur_data, vers, arg_type, THUNK_TARGET);
-                strcpy(cur_data + vers_size, vers->name);
-                cur_data += vers->next;
-                remaining_data -= vers->next;
-                if (!next) {
-                    break;
-                }
-                vers = (void*)vers + next;
-            }
-            break;
-        }
-        default:
-            unlock_user(argptr, guest_data, 0);
-            ret = -TARGET_EINVAL;
-            goto out;
-        }
-        unlock_user(argptr, guest_data, guest_data_size);
-
-        argptr = lock_user(VERIFY_WRITE, arg, target_size, 0);
-        if (!argptr) {
-            ret = -TARGET_EFAULT;
-            goto out;
-        }
-        thunk_convert(argptr, buf_temp, arg_type, THUNK_TARGET);
-        unlock_user(argptr, arg, target_size);
-    }
-out:
-    g_free(big_buf);
-    return ret;
-}
-
-static abi_long do_ioctl_blkpg(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
-                               int cmd, abi_long arg)
-{
-    void *argptr;
-    int target_size;
-    const argtype *arg_type = ie->arg_type;
-    const argtype part_arg_type[] = { MK_STRUCT(STRUCT_blkpg_partition) };
-    abi_long ret;
-
-    struct blkpg_ioctl_arg *host_blkpg = (void*)buf_temp;
-    struct blkpg_partition host_part;
-
-    /* Read and convert blkpg */
-    arg_type++;
-    target_size = thunk_type_size(arg_type, 0);
-    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
-    if (!argptr) {
-        ret = -TARGET_EFAULT;
-        goto out;
-    }
-    thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
-    unlock_user(argptr, arg, 0);
-
-    switch (host_blkpg->op) {
-    case BLKPG_ADD_PARTITION:
-    case BLKPG_DEL_PARTITION:
-        /* payload is struct blkpg_partition */
-        break;
-    default:
-        /* Unknown opcode */
-        ret = -TARGET_EINVAL;
-        goto out;
-    }
-
-    /* Read and convert blkpg->data */
-    arg = (abi_long)(uintptr_t)host_blkpg->data;
-    target_size = thunk_type_size(part_arg_type, 0);
-    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
-    if (!argptr) {
-        ret = -TARGET_EFAULT;
-        goto out;
-    }
-    thunk_convert(&host_part, argptr, part_arg_type, THUNK_HOST);
-    unlock_user(argptr, arg, 0);
-
-    /* Swizzle the data pointer to our local copy and call! */
-    host_blkpg->data = &host_part;
-    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_blkpg));
-
-out:
-    return ret;
-}
-
-static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
-                                int fd, int cmd, abi_long arg)
-{
-    const argtype *arg_type = ie->arg_type;
-    const StructEntry *se;
-    const argtype *field_types;
-    const int *dst_offsets, *src_offsets;
-    int target_size;
-    void *argptr;
-    abi_ulong *target_rt_dev_ptr = NULL;
-    unsigned long *host_rt_dev_ptr = NULL;
-    abi_long ret;
-    int i;
-
-    assert(ie->access == IOC_W);
-    assert(*arg_type == TYPE_PTR);
-    arg_type++;
-    assert(*arg_type == TYPE_STRUCT);
-    target_size = thunk_type_size(arg_type, 0);
-    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
-    if (!argptr) {
-        return -TARGET_EFAULT;
-    }
-    arg_type++;
-    assert(*arg_type == (int)STRUCT_rtentry);
-    se = struct_entries + *arg_type++;
-    assert(se->convert[0] == NULL);
-    /* convert struct here to be able to catch rt_dev string */
-    field_types = se->field_types;
-    dst_offsets = se->field_offsets[THUNK_HOST];
-    src_offsets = se->field_offsets[THUNK_TARGET];
-    for (i = 0; i < se->nb_fields; i++) {
-        if (dst_offsets[i] == offsetof(struct rtentry, rt_dev)) {
-            assert(*field_types == TYPE_PTRVOID);
-            target_rt_dev_ptr = (abi_ulong *)(argptr + src_offsets[i]);
-            host_rt_dev_ptr = (unsigned long *)(buf_temp + dst_offsets[i]);
-            if (*target_rt_dev_ptr != 0) {
-                *host_rt_dev_ptr = (unsigned long)lock_user_string(
-                                                  tswapal(*target_rt_dev_ptr));
-                if (!*host_rt_dev_ptr) {
-                    unlock_user(argptr, arg, 0);
-                    return -TARGET_EFAULT;
-                }
-            } else {
-                *host_rt_dev_ptr = 0;
-            }
-            field_types++;
-            continue;
-        }
-        field_types = thunk_convert(buf_temp + dst_offsets[i],
-                                    argptr + src_offsets[i],
-                                    field_types, THUNK_HOST);
-    }
-    unlock_user(argptr, arg, 0);
-
-    ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
-
-    assert(host_rt_dev_ptr != NULL);
-    assert(target_rt_dev_ptr != NULL);
-    if (*host_rt_dev_ptr != 0) {
-        unlock_user((void *)*host_rt_dev_ptr,
-                    *target_rt_dev_ptr, 0);
-    }
-    return ret;
-}
-
-static abi_long do_ioctl_kdsigaccept(const IOCTLEntry *ie, uint8_t *buf_temp,
-                                     int fd, int cmd, abi_long arg)
-{
-    int sig = target_to_host_signal(arg);
-    return get_errno(safe_ioctl(fd, ie->host_cmd, sig));
-}
-
-#ifdef TIOCGPTPEER
-static abi_long do_ioctl_tiocgptpeer(const IOCTLEntry *ie, uint8_t *buf_temp,
-                                     int fd, int cmd, abi_long arg)
-{
-    int flags = target_to_host_bitmask(arg, fcntl_flags_tbl);
-    return get_errno(safe_ioctl(fd, ie->host_cmd, flags));
-}
-#endif
-
-static IOCTLEntry ioctl_entries[] = {
-#define IOCTL(cmd, access, ...) \
-    { TARGET_ ## cmd, cmd, #cmd, access, 0, {  __VA_ARGS__ } },
-#define IOCTL_SPECIAL(cmd, access, dofn, ...)                      \
-    { TARGET_ ## cmd, cmd, #cmd, access, dofn, {  __VA_ARGS__ } },
-#define IOCTL_IGNORE(cmd) \
-    { TARGET_ ## cmd, 0, #cmd },
-#include "ioctls.h"
-    { 0, 0, },
-};
-
-/* ??? Implement proper locking for ioctls.  */
-/* do_ioctl() Must return target values and target errnos. */
-static abi_long do_ioctl(int fd, int cmd, abi_long arg)
-{
-    const IOCTLEntry *ie;
-    const argtype *arg_type;
-    abi_long ret;
-    uint8_t buf_temp[MAX_STRUCT_SIZE];
-    int target_size;
-    void *argptr;
-
-    ie = ioctl_entries;
-    for(;;) {
-        if (ie->target_cmd == 0) {
-            gemu_log("Unsupported ioctl: cmd=0x%04lx\n", (long)cmd);
-            return -TARGET_ENOSYS;
-        }
-        if (ie->target_cmd == cmd)
-            break;
-        ie++;
-    }
-    arg_type = ie->arg_type;
-    if (ie->do_ioctl) {
-        return ie->do_ioctl(ie, buf_temp, fd, cmd, arg);
-    } else if (!ie->host_cmd) {
-        /* Some architectures define BSD ioctls in their headers
-           that are not implemented in Linux.  */
-        return -TARGET_ENOSYS;
-    }
-
-    switch(arg_type[0]) {
-    case TYPE_NULL:
-        /* no argument */
-        ret = get_errno(safe_ioctl(fd, ie->host_cmd));
-        break;
-    case TYPE_PTRVOID:
-    case TYPE_INT:
-        ret = get_errno(safe_ioctl(fd, ie->host_cmd, arg));
-        break;
-    case TYPE_PTR:
-        arg_type++;
-        target_size = thunk_type_size(arg_type, 0);
-        switch(ie->access) {
-        case IOC_R:
-            ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
-            if (!is_error(ret)) {
-                argptr = lock_user(VERIFY_WRITE, arg, target_size, 0);
-                if (!argptr)
-                    return -TARGET_EFAULT;
-                thunk_convert(argptr, buf_temp, arg_type, THUNK_TARGET);
-                unlock_user(argptr, arg, target_size);
-            }
-            break;
-        case IOC_W:
-            argptr = lock_user(VERIFY_READ, arg, target_size, 1);
-            if (!argptr)
-                return -TARGET_EFAULT;
-            thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
-            unlock_user(argptr, arg, 0);
-            ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
-            break;
-        default:
-        case IOC_RW:
-            argptr = lock_user(VERIFY_READ, arg, target_size, 1);
-            if (!argptr)
-                return -TARGET_EFAULT;
-            thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
-            unlock_user(argptr, arg, 0);
-            ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
-            if (!is_error(ret)) {
-                argptr = lock_user(VERIFY_WRITE, arg, target_size, 0);
-                if (!argptr)
-                    return -TARGET_EFAULT;
-                thunk_convert(argptr, buf_temp, arg_type, THUNK_TARGET);
-                unlock_user(argptr, arg, target_size);
-            }
-            break;
-        }
-        break;
-    default:
-        gemu_log("Unsupported ioctl type: cmd=0x%04lx type=%d\n",
-                 (long)cmd, arg_type[0]);
-        ret = -TARGET_ENOSYS;
-        break;
-    }
-    return ret;
-}
-
 static const bitmask_transtbl iflag_tbl[] = {
         { TARGET_IGNBRK, TARGET_IGNBRK, IGNBRK, IGNBRK },
         { TARGET_BRKINT, TARGET_BRKINT, BRKINT, BRKINT },
@@ -5294,8 +4445,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     void *p;
 
     switch(num) {
-    case TARGET_NR_ioctl:
-        return do_ioctl(arg1, arg2, arg3);
 #ifdef TARGET_NR_fcntl
     case TARGET_NR_fcntl:
         return do_fcntl(arg1, arg2, arg3);
@@ -8900,6 +8049,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                                 int64_t arg5, int64_t arg6)
 
 #include "syscall-file.inc.c"
+#include "syscall-ioctl.inc.c"
 #include "syscall-ipc.inc.c"
 #include "syscall-mem.inc.c"
 #include "syscall-proc.inc.c"
diff --git a/linux-user/strace.list b/linux-user/strace.list
index ce5e02975b..efc64cd29f 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -365,9 +365,6 @@
 #ifdef TARGET_NR_io_cancel
 { TARGET_NR_io_cancel, "io_cancel" , NULL, NULL, NULL },
 #endif
-#ifdef TARGET_NR_ioctl
-{ TARGET_NR_ioctl, "ioctl" , NULL, NULL, NULL },
-#endif
 #ifdef TARGET_NR_io_destroy
 { TARGET_NR_io_destroy, "io_destroy" , NULL, NULL, NULL },
 #endif
-- 
2.17.1


