Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF19512765
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 01:08:52 +0200 (CEST)
Received: from localhost ([::1]:36440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njqmB-0000tl-Rm
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 19:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3rMxpYgMKCgcwjjnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--pcc.bounces.google.com>)
 id 1njqkp-0000Bq-Oe
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 19:07:29 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a]:41911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3rMxpYgMKCgcwjjnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--pcc.bounces.google.com>)
 id 1njqkn-0008Nv-QH
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 19:07:27 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2f4e28ae604so30163997b3.8
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 16:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+m93sz/AcCZZ3BCxg2hqZ599QHhhu+ny90i7L8hfwE4=;
 b=L6RXT0WxVJgW5X8ELba6/h4eEJTyRiwLu3xN9/LNnEX6fIh/pmSf5PXN67vHzYq0s/
 IX3VsfeS4ITczWkxy4D1KKfLFfpwFj0bUQ7Fwy3m72Sx8XHH9/eVrn+V3/VEcCEQNKz7
 pi5MD3KPNfvLGIeaJ68U2v7BVOKdBLsoZTxEStsJv9lJ7bOTfzbKfPqqGfBsDurbw3uf
 rxmrC1U4f3uZrJ4UGd/Va5DlbSj9A/MDTdTvGe/z4dEpmKWQEN4AQXR3RcEfkQc+Piv4
 WWhvqVkyU7HRhmm3tN27m+/2CjKTEtEB4FNhXOWb8NcflcYVt46W6op+dGI9flSwHsRJ
 uxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+m93sz/AcCZZ3BCxg2hqZ599QHhhu+ny90i7L8hfwE4=;
 b=Z4jVN7j9P1Tz5jaVCJIR7pptSD1HU2SKpJld3zhUtIKJLIEK6LqiWTmBnYLik6Z0I0
 Blq94wqWbDCGNuoNgeLxnmXWhCRUyMNa9VtSIqyfV5DyTk3x3lALgyRwu21O/YyLEjWj
 37GnNq83ObFVpBsR10ZXVbIgUTN/bbWQdXSdVxsH7qjOIaihf/IJ1F8tNhDNsjAcPEpW
 ojLhmuWWepDP7VR0KSlmQUQ6lBr7ClMfFLxybcaEVcW4+YHMA23LtHWIqwoQsDNODaD3
 T+FTNJHJ43UN+FdDVu0snev8Gsvq1fA3z5i+TyAzU1Dgq8haNJf8XNB3q4zZBTLgG5V9
 tYvw==
X-Gm-Message-State: AOAM533qUu2IpWD2t6yZsYFhvcVN6+gCYY84pyxzECrta9bTwj3Q1UEZ
 6bKTb9YtjaMb1SkJtYgNkcgd1Gw=
X-Google-Smtp-Source: ABdhPJxIKa2xKxzzLRz2krK1gXNUQ3OJiu0BvlCjisphsfaendLeok9IZhz4ueVSeEJkm0euiUZN+KQ=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:200:7bf6:862b:86da:9ce1])
 (user=pcc job=sendgmr) by 2002:a25:6157:0:b0:645:8d0e:f782 with SMTP id
 v84-20020a256157000000b006458d0ef782mr27891445ybb.36.1651100844247; Wed, 27
 Apr 2022 16:07:24 -0700 (PDT)
Date: Wed, 27 Apr 2022 16:07:16 -0700
Message-Id: <20220427230716.2158127-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [PATCH] loader: support loading large files (>=2GB)
From: Peter Collingbourne <pcc@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Peter Collingbourne <pcc@google.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3rMxpYgMKCgcwjjnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--pcc.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the loader uses int as the return type for various APIs
that deal with file sizes, which leads to an error if the file
size is >=2GB, as it ends up being interpreted as a negative error
code. Furthermore, we do not tolerate short reads, which are possible
at least on Linux when attempting to read such large files in one
syscall.

Fix the first problem by switching to 64-bit types for file sizes,
and fix the second by introducing a loop around the read syscall.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 hw/core/generic-loader.c |  2 +-
 hw/core/loader.c         | 44 ++++++++++++++++++++++++----------------
 include/hw/loader.h      | 13 ++++++------
 3 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index c666545aa0..0891fa73c3 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -67,7 +67,7 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
     GenericLoaderState *s = GENERIC_LOADER(dev);
     hwaddr entry;
     int big_endian;
-    int size = 0;
+    int64_t size = 0;
 
     s->set_pc = false;
 
diff --git a/hw/core/loader.c b/hw/core/loader.c
index ca2f2431fb..d07c79c400 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -115,17 +115,17 @@ ssize_t read_targphys(const char *name,
     return did;
 }
 
-int load_image_targphys(const char *filename,
-                        hwaddr addr, uint64_t max_sz)
+int64_t load_image_targphys(const char *filename,
+                            hwaddr addr, uint64_t max_sz)
 {
     return load_image_targphys_as(filename, addr, max_sz, NULL);
 }
 
 /* return the size or -1 if error */
-int load_image_targphys_as(const char *filename,
-                           hwaddr addr, uint64_t max_sz, AddressSpace *as)
+int64_t load_image_targphys_as(const char *filename,
+                               hwaddr addr, uint64_t max_sz, AddressSpace *as)
 {
-    int size;
+    int64_t size;
 
     size = get_image_size(filename);
     if (size < 0 || size > max_sz) {
@@ -139,9 +139,9 @@ int load_image_targphys_as(const char *filename,
     return size;
 }
 
-int load_image_mr(const char *filename, MemoryRegion *mr)
+int64_t load_image_mr(const char *filename, MemoryRegion *mr)
 {
-    int size;
+    int64_t size;
 
     if (!memory_access_is_direct(mr, false)) {
         /* Can only load an image into RAM or ROM */
@@ -963,7 +963,8 @@ int rom_add_file(const char *file, const char *fw_dir,
 {
     MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
     Rom *rom;
-    int rc, fd = -1;
+    int fd = -1;
+    size_t bytes_read = 0;
     char devpath[100];
 
     if (as && mr) {
@@ -1003,11 +1004,17 @@ int rom_add_file(const char *file, const char *fw_dir,
     rom->datasize = rom->romsize;
     rom->data     = g_malloc0(rom->datasize);
     lseek(fd, 0, SEEK_SET);
-    rc = read(fd, rom->data, rom->datasize);
-    if (rc != rom->datasize) {
-        fprintf(stderr, "rom: file %-20s: read error: rc=%d (expected %zd)\n",
-                rom->name, rc, rom->datasize);
-        goto err;
+    while (bytes_read < rom->datasize) {
+        ssize_t rc =
+            read(fd, rom->data + bytes_read, rom->datasize - bytes_read);
+        if (rc <= 0) {
+            fprintf(stderr,
+                    "rom: file %-20s: read error: rc=%zd at position %zd "
+                    "(expected size %zd)\n",
+                    rom->name, rc, bytes_read, rom->datasize);
+            goto err;
+        }
+        bytes_read += rc;
     }
     close(fd);
     rom_insert(rom);
@@ -1671,7 +1678,7 @@ typedef struct {
     HexLine line;
     uint8_t *bin_buf;
     hwaddr *start_addr;
-    int total_size;
+    int64_t total_size;
     uint32_t next_address_to_write;
     uint32_t current_address;
     uint32_t current_rom_index;
@@ -1767,8 +1774,8 @@ static int handle_record_type(HexParser *parser)
 }
 
 /* return size or -1 if error */
-static int parse_hex_blob(const char *filename, hwaddr *addr, uint8_t *hex_blob,
-                          size_t hex_blob_size, AddressSpace *as)
+static int64_t parse_hex_blob(const char *filename, hwaddr *addr, uint8_t *hex_blob,
+                              size_t hex_blob_size, AddressSpace *as)
 {
     bool in_process = false; /* avoid re-enter and
                               * check whether record begin with ':' */
@@ -1832,11 +1839,12 @@ out:
 }
 
 /* return size or -1 if error */
-int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as)
+int64_t load_targphys_hex_as(const char *filename, hwaddr *entry,
+                             AddressSpace *as)
 {
     gsize hex_blob_size;
     gchar *hex_blob;
-    int total_size = 0;
+    int64_t total_size = 0;
 
     if (!g_file_get_contents(filename, &hex_blob, &hex_blob_size, NULL)) {
         return -1;
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 5572108ba5..7b09705940 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -40,8 +40,8 @@ ssize_t load_image_size(const char *filename, void *addr, size_t size);
  *
  * Returns the size of the loaded image on success, -1 otherwise.
  */
-int load_image_targphys_as(const char *filename,
-                           hwaddr addr, uint64_t max_sz, AddressSpace *as);
+int64_t load_image_targphys_as(const char *filename,
+                               hwaddr addr, uint64_t max_sz, AddressSpace *as);
 
 /**load_targphys_hex_as:
  * @filename: Path to the .hex file
@@ -53,14 +53,15 @@ int load_image_targphys_as(const char *filename,
  *
  * Returns the size of the loaded .hex file on success, -1 otherwise.
  */
-int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as);
+int64_t load_targphys_hex_as(const char *filename, hwaddr *entry,
+                             AddressSpace *as);
 
 /** load_image_targphys:
  * Same as load_image_targphys_as(), but doesn't allow the caller to specify
  * an AddressSpace.
  */
-int load_image_targphys(const char *filename, hwaddr,
-                        uint64_t max_sz);
+int64_t load_image_targphys(const char *filename, hwaddr,
+                            uint64_t max_sz);
 
 /**
  * load_image_mr: load an image into a memory region
@@ -73,7 +74,7 @@ int load_image_targphys(const char *filename, hwaddr,
  * If the file is larger than the memory region's size the call will fail.
  * Returns -1 on failure, or the size of the file.
  */
-int load_image_mr(const char *filename, MemoryRegion *mr);
+int64_t load_image_mr(const char *filename, MemoryRegion *mr);
 
 /* This is the limit on the maximum uncompressed image size that
  * load_image_gzipped_buffer() and load_image_gzipped() will read. It prevents
-- 
2.36.0.464.gb9c8b46e94-goog


