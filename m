Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FE3545B34
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:41:27 +0200 (CEST)
Received: from localhost ([::1]:43614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWSd-0000De-10
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFI-0003CZ-JT
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:40 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:23579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWFF-00011H-Ua
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835257; x=1686371257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fhRo+tvXbUf7k03qBy6sXdg66/bDScvaG5TMGsId74Y=;
 b=pm0OraC2FZMyIt7qc/hAwV1ev0GeGZeJAaeUIOLP8h3zSPW7iAGznG3N
 o6xgrhE7LCBElmreLpLGyDgfQU+XyvjdpFw+QDDTikMFqGWNrFT5pbx1D
 MeackQNO/W/yo8gpoKFtcrcAWFLaRtGEXwC9AIRnCuQG3jV4I6TU9ZmYQ
 xV0venbVsXd0wvrIxT+QCf+1h8VwLXIEJi51tGl9t8dCFK3lJhHdy57ZQ
 BBlxn23YHprogVCJufrjwGKLhMAvnXi454/rbQku9cu2SY97zk2lH7/KL
 go5L/6IQYKcyEjL7gy6FdfY5XA+3ghz5QxbcYWP8kvUY9zX9AwBuDd0dH g==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="307046433"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:27:37 +0800
IronPort-SDR: 4ZJQQBfsdLMsdSeZ6+NuQnvxYlRbXdvN1n5crmAHLSlqrBU7KCE0sYOYvsPNS07SaDHVz5UWf5
 2rGIM+sdhfnSNoyMLbhKSsmg2gasuRLIDcwK2ClYtQM0YADl85cDHtDqqywuA0h5ESnWFodbzE
 HdTeurs5tXUfkAg6KZSwzP/LU2Wt4YjCZDOiPEPRLaqBuWwngaxb2shH0ItRwfFy1m7o5HERiu
 U5/NT7oyaCWvz18MMTAK9lu+pVc35eua6h+KDCWbr4rC2D9tfWesk47IFze1ZL31FUDxLQ9nHn
 aQkVPaH9k5YFV8//QRWpGvj4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:50:45 -0700
IronPort-SDR: nlWt37NVXLYIbNK1iuxlS+6cDS9BrZyF5JuSmwrLQyr3qS+81ct75O8BQSGRDMJJtKohZ1c3/g
 G3wLDajBa7u9LENJ4v3lhpotqTl+6+0fKoGjGEujwK7dw9qrd4gsTbpcw7FMOHlPJOn1VThpuF
 HEt9jPGAdHulroURKATj2xceMRxFnkC2dasMqbjBA6FJc4YigwahRXtvFShfgHmMkWUznrBDsN
 57TVmbsL47Zj6wOryhPIhaV8NnR2LBQvzCoeLPVjtLeEQcwxId3hC2XCJFL+e7lQnmdMmojBU0
 qBY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:27:37 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7Gw6WWlz1Rvlx
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:27:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1654835255; x=1657427256; bh=fhRo+tv
 XbUf7k03qBy6sXdg66/bDScvaG5TMGsId74Y=; b=XwF7TBLte/35QmM9iD4cnht
 r3gxNOTAKhQ+c2MkYdahDJPJ4ta8hkZnmefXg3ePZLmLUB5pekw5KF+au3Ed6E0/
 rPIH+q0ggQlZcIdtIYoC7R/mRMIhZ6nHAB7c/+rWasCLiBHZYSUlLtpJAYhzMoLP
 YnFVwVhwlo1F+Bf9akjNAxnFjiKXorbqDddj8GmztX3/9nt+OoRZRW3gBO78OC7S
 inzmtdRiuUU9pZGQtabba6eVdWleNqj7Op3IvNHxm5jdt7JH4WWdUz0OSiiYbGje
 Xdr0IuMVJPCJO/yUgFbd0iRON8NdYr2e0ApHzthd9Tbx2j0sbbTUSI6LVb1V/UQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id p3oohX_NcS93 for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:27:35 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7Gq5Q9Yz1Rwrw;
 Thu,  9 Jun 2022 21:27:31 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jamie Iles <jamie@nuviainc.com>,
 Luc Michel <lmichel@kalray.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/25] hw/core/loader: return image sizes as ssize_t
Date: Fri, 10 Jun 2022 14:26:35 +1000
Message-Id: <20220610042655.2021686-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jamie Iles <jamie@nuviainc.com>

Various loader functions return an int which limits images to 2GB which
is fine for things like a BIOS/kernel image, but if we want to be able
to load memory images or large ramdisks then any file over 2GB would
silently fail to load.

Cc: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Luc Michel <lmichel@kalray.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211111141141.3295094-2-jamie@nuviainc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/loader.h      | 55 +++++++++++++--------------
 hw/arm/armv7m.c          |  2 +-
 hw/arm/boot.c            |  8 ++--
 hw/core/generic-loader.c |  2 +-
 hw/core/loader.c         | 81 +++++++++++++++++++++-------------------
 hw/i386/x86.c            |  2 +-
 hw/riscv/boot.c          |  5 ++-
 7 files changed, 80 insertions(+), 75 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 5572108ba5..70248e0da7 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -40,8 +40,8 @@ ssize_t load_image_size(const char *filename, void *add=
r, size_t size);
  *
  * Returns the size of the loaded image on success, -1 otherwise.
  */
-int load_image_targphys_as(const char *filename,
-                           hwaddr addr, uint64_t max_sz, AddressSpace *a=
s);
+ssize_t load_image_targphys_as(const char *filename,
+                               hwaddr addr, uint64_t max_sz, AddressSpac=
e *as);
=20
 /**load_targphys_hex_as:
  * @filename: Path to the .hex file
@@ -53,14 +53,15 @@ int load_image_targphys_as(const char *filename,
  *
  * Returns the size of the loaded .hex file on success, -1 otherwise.
  */
-int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpa=
ce *as);
+ssize_t load_targphys_hex_as(const char *filename, hwaddr *entry,
+                             AddressSpace *as);
=20
 /** load_image_targphys:
  * Same as load_image_targphys_as(), but doesn't allow the caller to spe=
cify
  * an AddressSpace.
  */
-int load_image_targphys(const char *filename, hwaddr,
-                        uint64_t max_sz);
+ssize_t load_image_targphys(const char *filename, hwaddr,
+                            uint64_t max_sz);
=20
 /**
  * load_image_mr: load an image into a memory region
@@ -73,7 +74,7 @@ int load_image_targphys(const char *filename, hwaddr,
  * If the file is larger than the memory region's size the call will fai=
l.
  * Returns -1 on failure, or the size of the file.
  */
-int load_image_mr(const char *filename, MemoryRegion *mr);
+ssize_t load_image_mr(const char *filename, MemoryRegion *mr);
=20
 /* This is the limit on the maximum uncompressed image size that
  * load_image_gzipped_buffer() and load_image_gzipped() will read. It pr=
events
@@ -81,9 +82,9 @@ int load_image_mr(const char *filename, MemoryRegion *m=
r);
  */
 #define LOAD_IMAGE_MAX_GUNZIP_BYTES (256 << 20)
=20
-int load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
-                              uint8_t **buffer);
-int load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_s=
z);
+ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
+                                  uint8_t **buffer);
+ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t m=
ax_sz);
=20
 #define ELF_LOAD_FAILED       -1
 #define ELF_LOAD_NOT_ELF      -2
@@ -183,8 +184,8 @@ ssize_t load_elf(const char *filename,
  */
 void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **e=
rrp);
=20
-int load_aout(const char *filename, hwaddr addr, int max_sz,
-              int bswap_needed, hwaddr target_page_size);
+ssize_t load_aout(const char *filename, hwaddr addr, int max_sz,
+                  int bswap_needed, hwaddr target_page_size);
=20
 #define LOAD_UIMAGE_LOADADDR_INVALID (-1)
=20
@@ -205,19 +206,19 @@ int load_aout(const char *filename, hwaddr addr, in=
t max_sz,
  *
  * Returns the size of the loaded image on success, -1 otherwise.
  */
-int load_uimage_as(const char *filename, hwaddr *ep,
-                   hwaddr *loadaddr, int *is_linux,
-                   uint64_t (*translate_fn)(void *, uint64_t),
-                   void *translate_opaque, AddressSpace *as);
+ssize_t load_uimage_as(const char *filename, hwaddr *ep,
+                       hwaddr *loadaddr, int *is_linux,
+                       uint64_t (*translate_fn)(void *, uint64_t),
+                       void *translate_opaque, AddressSpace *as);
=20
 /** load_uimage:
  * Same as load_uimage_as(), but doesn't allow the caller to specify an
  * AddressSpace.
  */
-int load_uimage(const char *filename, hwaddr *ep,
-                hwaddr *loadaddr, int *is_linux,
-                uint64_t (*translate_fn)(void *, uint64_t),
-                void *translate_opaque);
+ssize_t load_uimage(const char *filename, hwaddr *ep,
+                    hwaddr *loadaddr, int *is_linux,
+                    uint64_t (*translate_fn)(void *, uint64_t),
+                    void *translate_opaque);
=20
 /**
  * load_ramdisk_as:
@@ -232,15 +233,15 @@ int load_uimage(const char *filename, hwaddr *ep,
  *
  * Returns the size of the loaded image on success, -1 otherwise.
  */
-int load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_sz,
-                    AddressSpace *as);
+ssize_t load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_=
sz,
+                        AddressSpace *as);
=20
 /**
  * load_ramdisk:
  * Same as load_ramdisk_as(), but doesn't allow the caller to specify
  * an AddressSpace.
  */
-int load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz);
+ssize_t load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz)=
;
=20
 ssize_t gunzip(void *dst, size_t dstlen, uint8_t *src, size_t srclen);
=20
@@ -253,9 +254,9 @@ void pstrcpy_targphys(const char *name,
 extern bool option_rom_has_mr;
 extern bool rom_file_has_mr;
=20
-int rom_add_file(const char *file, const char *fw_dir,
-                 hwaddr addr, int32_t bootindex,
-                 bool option_rom, MemoryRegion *mr, AddressSpace *as);
+ssize_t rom_add_file(const char *file, const char *fw_dir,
+                     hwaddr addr, int32_t bootindex,
+                     bool option_rom, MemoryRegion *mr, AddressSpace *as=
);
 MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t le=
n,
                            size_t max_len, hwaddr addr,
                            const char *fw_file_name,
@@ -336,8 +337,8 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
 #define rom_add_blob_fixed_as(_f, _b, _l, _a, _as)      \
     rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, _as, true)
=20
-int rom_add_vga(const char *file);
-int rom_add_option(const char *file, int32_t bootindex);
+ssize_t rom_add_vga(const char *file);
+ssize_t rom_add_option(const char *file, int32_t bootindex);
=20
 /* This is the usual maximum in uboot, so if a uImage overflows this, it=
 would
  * overflow on real hardware too. */
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 32349ec94b..990861ee5e 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -570,7 +570,7 @@ static void armv7m_reset(void *opaque)
=20
 void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int me=
m_size)
 {
-    int image_size;
+    ssize_t image_size;
     uint64_t entry;
     int big_endian;
     AddressSpace *as;
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index a8de33fd64..ada2717f76 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -881,7 +881,7 @@ static int do_arm_linux_init(Object *obj, void *opaqu=
e)
     return 0;
 }
=20
-static int64_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry=
,
+static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry=
,
                             uint64_t *lowaddr, uint64_t *highaddr,
                             int elf_machine, AddressSpace *as)
 {
@@ -892,7 +892,7 @@ static int64_t arm_load_elf(struct arm_boot_info *inf=
o, uint64_t *pentry,
     } elf_header;
     int data_swab =3D 0;
     bool big_endian;
-    int64_t ret =3D -1;
+    ssize_t ret =3D -1;
     Error *err =3D NULL;
=20
=20
@@ -1014,7 +1014,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cp=
u,
     /* Set up for a direct boot of a kernel image file. */
     CPUState *cs;
     AddressSpace *as =3D arm_boot_address_space(cpu, info);
-    int kernel_size;
+    ssize_t kernel_size;
     int initrd_size;
     int is_linux =3D 0;
     uint64_t elf_entry;
@@ -1093,7 +1093,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cp=
u,
=20
     if (kernel_size > info->ram_size) {
         error_report("kernel '%s' is too large to fit in RAM "
-                     "(kernel size %d, RAM size %" PRId64 ")",
+                     "(kernel size %zd, RAM size %" PRId64 ")",
                      info->kernel_filename, kernel_size, info->ram_size)=
;
         exit(1);
     }
diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index c666545aa0..4f4d77908d 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -67,7 +67,7 @@ static void generic_loader_realize(DeviceState *dev, Er=
ror **errp)
     GenericLoaderState *s =3D GENERIC_LOADER(dev);
     hwaddr entry;
     int big_endian;
-    int size =3D 0;
+    ssize_t size =3D 0;
=20
     s->set_pc =3D false;
=20
diff --git a/hw/core/loader.c b/hw/core/loader.c
index edde657ac3..0548830733 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -114,17 +114,17 @@ ssize_t read_targphys(const char *name,
     return did;
 }
=20
-int load_image_targphys(const char *filename,
-                        hwaddr addr, uint64_t max_sz)
+ssize_t load_image_targphys(const char *filename,
+                            hwaddr addr, uint64_t max_sz)
 {
     return load_image_targphys_as(filename, addr, max_sz, NULL);
 }
=20
 /* return the size or -1 if error */
-int load_image_targphys_as(const char *filename,
-                           hwaddr addr, uint64_t max_sz, AddressSpace *a=
s)
+ssize_t load_image_targphys_as(const char *filename,
+                               hwaddr addr, uint64_t max_sz, AddressSpac=
e *as)
 {
-    int size;
+    ssize_t size;
=20
     size =3D get_image_size(filename);
     if (size < 0 || size > max_sz) {
@@ -138,9 +138,9 @@ int load_image_targphys_as(const char *filename,
     return size;
 }
=20
-int load_image_mr(const char *filename, MemoryRegion *mr)
+ssize_t load_image_mr(const char *filename, MemoryRegion *mr)
 {
-    int size;
+    ssize_t size;
=20
     if (!memory_access_is_direct(mr, false)) {
         /* Can only load an image into RAM or ROM */
@@ -222,8 +222,8 @@ static void bswap_ahdr(struct exec *e)
      : (_N_SEGMENT_ROUND (_N_TXTENDADDR(x, target_page_size), target_pag=
e_size)))
=20
=20
-int load_aout(const char *filename, hwaddr addr, int max_sz,
-              int bswap_needed, hwaddr target_page_size)
+ssize_t load_aout(const char *filename, hwaddr addr, int max_sz,
+                  int bswap_needed, hwaddr target_page_size)
 {
     int fd;
     ssize_t size, ret;
@@ -617,13 +617,14 @@ toosmall:
 }
=20
 /* Load a U-Boot image.  */
-static int load_uboot_image(const char *filename, hwaddr *ep, hwaddr *lo=
adaddr,
-                            int *is_linux, uint8_t image_type,
-                            uint64_t (*translate_fn)(void *, uint64_t),
-                            void *translate_opaque, AddressSpace *as)
+static ssize_t load_uboot_image(const char *filename, hwaddr *ep,
+                                hwaddr *loadaddr, int *is_linux,
+                                uint8_t image_type,
+                                uint64_t (*translate_fn)(void *, uint64_=
t),
+                                void *translate_opaque, AddressSpace *as=
)
 {
     int fd;
-    int size;
+    ssize_t size;
     hwaddr address;
     uboot_image_header_t h;
     uboot_image_header_t *hdr =3D &h;
@@ -760,40 +761,40 @@ out:
     return ret;
 }
=20
-int load_uimage(const char *filename, hwaddr *ep, hwaddr *loadaddr,
-                int *is_linux,
-                uint64_t (*translate_fn)(void *, uint64_t),
-                void *translate_opaque)
+ssize_t load_uimage(const char *filename, hwaddr *ep, hwaddr *loadaddr,
+                    int *is_linux,
+                    uint64_t (*translate_fn)(void *, uint64_t),
+                    void *translate_opaque)
 {
     return load_uboot_image(filename, ep, loadaddr, is_linux, IH_TYPE_KE=
RNEL,
                             translate_fn, translate_opaque, NULL);
 }
=20
-int load_uimage_as(const char *filename, hwaddr *ep, hwaddr *loadaddr,
-                   int *is_linux,
-                   uint64_t (*translate_fn)(void *, uint64_t),
-                   void *translate_opaque, AddressSpace *as)
+ssize_t load_uimage_as(const char *filename, hwaddr *ep, hwaddr *loadadd=
r,
+                       int *is_linux,
+                       uint64_t (*translate_fn)(void *, uint64_t),
+                       void *translate_opaque, AddressSpace *as)
 {
     return load_uboot_image(filename, ep, loadaddr, is_linux, IH_TYPE_KE=
RNEL,
                             translate_fn, translate_opaque, as);
 }
=20
 /* Load a ramdisk.  */
-int load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz)
+ssize_t load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz)
 {
     return load_ramdisk_as(filename, addr, max_sz, NULL);
 }
=20
-int load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_sz,
-                    AddressSpace *as)
+ssize_t load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_=
sz,
+                        AddressSpace *as)
 {
     return load_uboot_image(filename, NULL, &addr, NULL, IH_TYPE_RAMDISK=
,
                             NULL, NULL, as);
 }
=20
 /* Load a gzip-compressed kernel to a dynamically allocated buffer. */
-int load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
-                              uint8_t **buffer)
+ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
+                                  uint8_t **buffer)
 {
     uint8_t *compressed_data =3D NULL;
     uint8_t *data =3D NULL;
@@ -838,9 +839,9 @@ int load_image_gzipped_buffer(const char *filename, u=
int64_t max_sz,
 }
=20
 /* Load a gzip-compressed kernel. */
-int load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_s=
z)
+ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t m=
ax_sz)
 {
-    int bytes;
+    ssize_t bytes;
     uint8_t *data;
=20
     bytes =3D load_image_gzipped_buffer(filename, max_sz, &data);
@@ -970,14 +971,15 @@ static void *rom_set_mr(Rom *rom, Object *owner, co=
nst char *name, bool ro)
     return data;
 }
=20
-int rom_add_file(const char *file, const char *fw_dir,
-                 hwaddr addr, int32_t bootindex,
-                 bool option_rom, MemoryRegion *mr,
-                 AddressSpace *as)
+ssize_t rom_add_file(const char *file, const char *fw_dir,
+                     hwaddr addr, int32_t bootindex,
+                     bool option_rom, MemoryRegion *mr,
+                     AddressSpace *as)
 {
     MachineClass *mc =3D MACHINE_GET_CLASS(qdev_get_machine());
     Rom *rom;
-    int rc, fd =3D -1;
+    ssize_t rc;
+    int fd =3D -1;
     char devpath[100];
=20
     if (as && mr) {
@@ -1019,7 +1021,7 @@ int rom_add_file(const char *file, const char *fw_d=
ir,
     lseek(fd, 0, SEEK_SET);
     rc =3D read(fd, rom->data, rom->datasize);
     if (rc !=3D rom->datasize) {
-        fprintf(stderr, "rom: file %-20s: read error: rc=3D%d (expected =
%zd)\n",
+        fprintf(stderr, "rom: file %-20s: read error: rc=3D%zd (expected=
 %zd)\n",
                 rom->name, rc, rom->datasize);
         goto err;
     }
@@ -1138,12 +1140,12 @@ int rom_add_elf_program(const char *name, GMapped=
File *mapped_file, void *data,
     return 0;
 }
=20
-int rom_add_vga(const char *file)
+ssize_t rom_add_vga(const char *file)
 {
     return rom_add_file(file, "vgaroms", 0, -1, true, NULL, NULL);
 }
=20
-int rom_add_option(const char *file, int32_t bootindex)
+ssize_t rom_add_option(const char *file, int32_t bootindex)
 {
     return rom_add_file(file, "genroms", 0, bootindex, true, NULL, NULL)=
;
 }
@@ -1846,11 +1848,12 @@ out:
 }
=20
 /* return size or -1 if error */
-int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpa=
ce *as)
+ssize_t load_targphys_hex_as(const char *filename, hwaddr *entry,
+                             AddressSpace *as)
 {
     gsize hex_blob_size;
     gchar *hex_blob;
-    int total_size =3D 0;
+    ssize_t total_size =3D 0;
=20
     if (!g_file_get_contents(filename, &hex_blob, &hex_blob_size, NULL))=
 {
         return -1;
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 78b05ab7a2..6003b4b2df 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1115,7 +1115,7 @@ void x86_bios_rom_init(MachineState *ms, const char=
 *default_firmware,
     char *filename;
     MemoryRegion *bios, *isa_bios;
     int bios_size, isa_bios_size;
-    int ret;
+    ssize_t ret;
=20
     /* BIOS load */
     bios_name =3D ms->firmware ?: default_firmware;
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 57a41df8e9..2d80f40b31 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -129,7 +129,8 @@ target_ulong riscv_load_firmware(const char *firmware=
_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb)
 {
-    uint64_t firmware_entry, firmware_size, firmware_end;
+    uint64_t firmware_entry, firmware_end;
+    ssize_t firmware_size;
=20
     if (load_elf_ram_sym(firmware_filename, NULL, NULL, NULL,
                          &firmware_entry, NULL, &firmware_end, NULL,
@@ -185,7 +186,7 @@ target_ulong riscv_load_kernel(const char *kernel_fil=
ename,
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start)
 {
-    int size;
+    ssize_t size;
=20
     /*
      * We want to put the initrd far enough into RAM that when the
--=20
2.36.1


