Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7934153B0EB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:18:03 +0200 (CEST)
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZTO-0002Nj-4t
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwZPm-0001Dd-OO
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:14:19 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:33798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwZPk-0006Xx-2n
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:14:18 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-f314077115so4997448fac.1
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HgA56MaIFVW1Hi7BD1a/BkfP5qhlTVvm06VBLjg4OL8=;
 b=B0iNNV0mxqeG7r81Rmmn8lIC8KCLqp3D1iAyF+JGq1jAopCMZwIHxmuvPGiQX83Kfx
 z51XeZ9DT9zAZAaRyYLpGBAcxP+/uQgLtaxiF4sw4Ti4W9lNUyd1ayOkjyM8OJEL8mOr
 jWERo70yHgKG54kji79+stQ2rqtcnwwVQfGtNtJkRTLzby3b2D/mHzjMPQFZyyFyI94m
 5rJUyL1e0hAjnK/SdRz3nCoh66I+IEf5ygRskjjVKVvCilrzgTCBvbdnmGptRmbpdg6m
 XufMRXCsa/R4Cam3ejT2nHkNUet1m31OzPIPNZ/PBLDQC9bPWTQeLYOcmDMvNkU+PiyA
 bHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HgA56MaIFVW1Hi7BD1a/BkfP5qhlTVvm06VBLjg4OL8=;
 b=H69SkaTMaShewxNTxraXaaC2niFYY5nVyawlDvecbyUFbsJBGqtLIu6SoNNbJ6ZG+V
 T/fJCe6JXFmgFnEOKtiRFOmsQG3gvM/cLw26h9A4OkVhUcbmb+FrDLrqDu1QbOI3SG74
 igKmfbhiIIR98x5CLzz5/ABrOVig/pvB4BSV0+SAANsFi/2I8jWUIkZD3YEHjwGLgJ76
 l3cOXhuigidF9jfTFIBTbF3teI5gFQ3QFa+iN+QCS5K2cb6R5ZDwQYAcrTakVPly/ZJa
 vVoMWYeTssGu/c6ZxTZSfO+i6cE9eRq7Q1TiYshhnUM7JihBap7nsCiAeyJbFDTNpl6R
 B91A==
X-Gm-Message-State: AOAM5333QTT/Pvwg4kj5ELB8dChhXoYh1u+/EeQyTddQcODSLiraTlKi
 an9yNmcQcWE9bT+ASI9OAVgzMbmTqtIQw1FuKe5uY6uhRNBl+bVh
X-Google-Smtp-Source: ABdhPJyJumoXrSxEJvdjrueV/VtXmqPW+/uv4ff4lyjfq9fG5QGFdzO3s9v7J/bnPed4MdtPuS3R+3RNdPYuEGHcy2U=
X-Received: by 2002:a05:6870:b00a:b0:f1:7f07:8c36 with SMTP id
 y10-20020a056870b00a00b000f17f078c36mr1353929oae.278.1654132454599; Wed, 01
 Jun 2022 18:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211111141141.3295094-1-jamie@nuviainc.com>
 <20211111141141.3295094-2-jamie@nuviainc.com>
In-Reply-To: <20211111141141.3295094-2-jamie@nuviainc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jun 2022 11:13:48 +1000
Message-ID: <CAKmqyKNjVpwe2RLRC-zPiM=URLhVmoxyjtT9L2Ccx7PKMo1kAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/core/loader: return image sizes as ssize_t
To: Jamie Iles <jamie@nuviainc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 lmichel@kalray.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Nov 12, 2021 at 12:12 AM Jamie Iles <jamie@nuviainc.com> wrote:
>
> Various loader functions return an int which limits images to 2GB which
> is fine for things like a BIOS/kernel image, but if we want to be able
> to load memory images or large ramdisks then any file over 2GB would
> silently fail to load.
>
> Cc: Luc Michel <lmichel@kalray.eu>
> Signed-off-by: Jamie Iles <jamie@nuviainc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/arm/armv7m.c          |  2 +-
>  hw/arm/boot.c            |  8 ++--
>  hw/core/generic-loader.c |  2 +-
>  hw/core/loader.c         | 81 +++++++++++++++++++++-------------------
>  hw/i386/x86.c            |  2 +-
>  hw/riscv/boot.c          |  5 ++-
>  include/hw/loader.h      | 55 +++++++++++++--------------
>  7 files changed, 80 insertions(+), 75 deletions(-)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 8d08db80be83..a6393dce7276 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -552,7 +552,7 @@ static void armv7m_reset(void *opaque)
>
>  void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
>  {
> -    int image_size;
> +    ssize_t image_size;
>      uint64_t entry;
>      int big_endian;
>      AddressSpace *as;
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 74ad397b1ff9..3853203438ba 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -876,7 +876,7 @@ static int do_arm_linux_init(Object *obj, void *opaque)
>      return 0;
>  }
>
> -static int64_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
> +static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
>                              uint64_t *lowaddr, uint64_t *highaddr,
>                              int elf_machine, AddressSpace *as)
>  {
> @@ -887,7 +887,7 @@ static int64_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
>      } elf_header;
>      int data_swab = 0;
>      bool big_endian;
> -    int64_t ret = -1;
> +    ssize_t ret = -1;
>      Error *err = NULL;
>
>
> @@ -1009,7 +1009,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>      /* Set up for a direct boot of a kernel image file. */
>      CPUState *cs;
>      AddressSpace *as = arm_boot_address_space(cpu, info);
> -    int kernel_size;
> +    ssize_t kernel_size;
>      int initrd_size;
>      int is_linux = 0;
>      uint64_t elf_entry;
> @@ -1098,7 +1098,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>
>      if (kernel_size > info->ram_size) {
>          error_report("kernel '%s' is too large to fit in RAM "
> -                     "(kernel size %d, RAM size %" PRId64 ")",
> +                     "(kernel size %zd, RAM size %" PRId64 ")",
>                       info->kernel_filename, kernel_size, info->ram_size);
>          exit(1);
>      }
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index d14f932eea2e..bc1451da8f55 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -66,7 +66,7 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>      GenericLoaderState *s = GENERIC_LOADER(dev);
>      hwaddr entry;
>      int big_endian;
> -    int size = 0;
> +    ssize_t size = 0;
>
>      s->set_pc = false;
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 052a0fd7198b..348bbf535bd9 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -115,17 +115,17 @@ ssize_t read_targphys(const char *name,
>      return did;
>  }
>
> -int load_image_targphys(const char *filename,
> -                        hwaddr addr, uint64_t max_sz)
> +ssize_t load_image_targphys(const char *filename,
> +                            hwaddr addr, uint64_t max_sz)
>  {
>      return load_image_targphys_as(filename, addr, max_sz, NULL);
>  }
>
>  /* return the size or -1 if error */
> -int load_image_targphys_as(const char *filename,
> -                           hwaddr addr, uint64_t max_sz, AddressSpace *as)
> +ssize_t load_image_targphys_as(const char *filename,
> +                               hwaddr addr, uint64_t max_sz, AddressSpace *as)
>  {
> -    int size;
> +    ssize_t size;
>
>      size = get_image_size(filename);
>      if (size < 0 || size > max_sz) {
> @@ -139,9 +139,9 @@ int load_image_targphys_as(const char *filename,
>      return size;
>  }
>
> -int load_image_mr(const char *filename, MemoryRegion *mr)
> +ssize_t load_image_mr(const char *filename, MemoryRegion *mr)
>  {
> -    int size;
> +    ssize_t size;
>
>      if (!memory_access_is_direct(mr, false)) {
>          /* Can only load an image into RAM or ROM */
> @@ -223,8 +223,8 @@ static void bswap_ahdr(struct exec *e)
>       : (_N_SEGMENT_ROUND (_N_TXTENDADDR(x, target_page_size), target_page_size)))
>
>
> -int load_aout(const char *filename, hwaddr addr, int max_sz,
> -              int bswap_needed, hwaddr target_page_size)
> +ssize_t load_aout(const char *filename, hwaddr addr, int max_sz,
> +                  int bswap_needed, hwaddr target_page_size)
>  {
>      int fd;
>      ssize_t size, ret;
> @@ -618,13 +618,14 @@ toosmall:
>  }
>
>  /* Load a U-Boot image.  */
> -static int load_uboot_image(const char *filename, hwaddr *ep, hwaddr *loadaddr,
> -                            int *is_linux, uint8_t image_type,
> -                            uint64_t (*translate_fn)(void *, uint64_t),
> -                            void *translate_opaque, AddressSpace *as)
> +static ssize_t load_uboot_image(const char *filename, hwaddr *ep,
> +                                hwaddr *loadaddr, int *is_linux,
> +                                uint8_t image_type,
> +                                uint64_t (*translate_fn)(void *, uint64_t),
> +                                void *translate_opaque, AddressSpace *as)
>  {
>      int fd;
> -    int size;
> +    ssize_t size;
>      hwaddr address;
>      uboot_image_header_t h;
>      uboot_image_header_t *hdr = &h;
> @@ -746,40 +747,40 @@ out:
>      return ret;
>  }
>
> -int load_uimage(const char *filename, hwaddr *ep, hwaddr *loadaddr,
> -                int *is_linux,
> -                uint64_t (*translate_fn)(void *, uint64_t),
> -                void *translate_opaque)
> +ssize_t load_uimage(const char *filename, hwaddr *ep, hwaddr *loadaddr,
> +                    int *is_linux,
> +                    uint64_t (*translate_fn)(void *, uint64_t),
> +                    void *translate_opaque)
>  {
>      return load_uboot_image(filename, ep, loadaddr, is_linux, IH_TYPE_KERNEL,
>                              translate_fn, translate_opaque, NULL);
>  }
>
> -int load_uimage_as(const char *filename, hwaddr *ep, hwaddr *loadaddr,
> -                   int *is_linux,
> -                   uint64_t (*translate_fn)(void *, uint64_t),
> -                   void *translate_opaque, AddressSpace *as)
> +ssize_t load_uimage_as(const char *filename, hwaddr *ep, hwaddr *loadaddr,
> +                       int *is_linux,
> +                       uint64_t (*translate_fn)(void *, uint64_t),
> +                       void *translate_opaque, AddressSpace *as)
>  {
>      return load_uboot_image(filename, ep, loadaddr, is_linux, IH_TYPE_KERNEL,
>                              translate_fn, translate_opaque, as);
>  }
>
>  /* Load a ramdisk.  */
> -int load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz)
> +ssize_t load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz)
>  {
>      return load_ramdisk_as(filename, addr, max_sz, NULL);
>  }
>
> -int load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_sz,
> -                    AddressSpace *as)
> +ssize_t load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_sz,
> +                        AddressSpace *as)
>  {
>      return load_uboot_image(filename, NULL, &addr, NULL, IH_TYPE_RAMDISK,
>                              NULL, NULL, as);
>  }
>
>  /* Load a gzip-compressed kernel to a dynamically allocated buffer. */
> -int load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
> -                              uint8_t **buffer)
> +ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
> +                                  uint8_t **buffer)
>  {
>      uint8_t *compressed_data = NULL;
>      uint8_t *data = NULL;
> @@ -824,9 +825,9 @@ int load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
>  }
>
>  /* Load a gzip-compressed kernel. */
> -int load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz)
> +ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz)
>  {
> -    int bytes;
> +    ssize_t bytes;
>      uint8_t *data;
>
>      bytes = load_image_gzipped_buffer(filename, max_sz, &data);
> @@ -956,14 +957,15 @@ static void *rom_set_mr(Rom *rom, Object *owner, const char *name, bool ro)
>      return data;
>  }
>
> -int rom_add_file(const char *file, const char *fw_dir,
> -                 hwaddr addr, int32_t bootindex,
> -                 bool option_rom, MemoryRegion *mr,
> -                 AddressSpace *as)
> +ssize_t rom_add_file(const char *file, const char *fw_dir,
> +                     hwaddr addr, int32_t bootindex,
> +                     bool option_rom, MemoryRegion *mr,
> +                     AddressSpace *as)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
>      Rom *rom;
> -    int rc, fd = -1;
> +    ssize_t rc;
> +    int fd = -1;
>      char devpath[100];
>
>      if (as && mr) {
> @@ -1005,7 +1007,7 @@ int rom_add_file(const char *file, const char *fw_dir,
>      lseek(fd, 0, SEEK_SET);
>      rc = read(fd, rom->data, rom->datasize);
>      if (rc != rom->datasize) {
> -        fprintf(stderr, "rom: file %-20s: read error: rc=%d (expected %zd)\n",
> +        fprintf(stderr, "rom: file %-20s: read error: rc=%zd (expected %zd)\n",
>                  rom->name, rc, rom->datasize);
>          goto err;
>      }
> @@ -1124,12 +1126,12 @@ int rom_add_elf_program(const char *name, GMappedFile *mapped_file, void *data,
>      return 0;
>  }
>
> -int rom_add_vga(const char *file)
> +ssize_t rom_add_vga(const char *file)
>  {
>      return rom_add_file(file, "vgaroms", 0, -1, true, NULL, NULL);
>  }
>
> -int rom_add_option(const char *file, int32_t bootindex)
> +ssize_t rom_add_option(const char *file, int32_t bootindex)
>  {
>      return rom_add_file(file, "genroms", 0, bootindex, true, NULL, NULL);
>  }
> @@ -1742,11 +1744,12 @@ out:
>  }
>
>  /* return size or -1 if error */
> -int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as)
> +ssize_t load_targphys_hex_as(const char *filename, hwaddr *entry,
> +                             AddressSpace *as)
>  {
>      gsize hex_blob_size;
>      gchar *hex_blob;
> -    int total_size = 0;
> +    ssize_t total_size = 0;
>
>      if (!g_file_get_contents(filename, &hex_blob, &hex_blob_size, NULL)) {
>          return -1;
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b84840a1bb99..1edf7ac53dfd 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1113,7 +1113,7 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
>      char *filename;
>      MemoryRegion *bios, *isa_bios;
>      int bios_size, isa_bios_size;
> -    int ret;
> +    ssize_t ret;
>
>      /* BIOS load */
>      bios_name = ms->firmware ?: default_firmware;
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 519fa455a154..7d221db051bf 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -127,7 +127,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>                                   hwaddr firmware_load_addr,
>                                   symbol_fn_t sym_cb)
>  {
> -    uint64_t firmware_entry, firmware_size, firmware_end;
> +    uint64_t firmware_entry, firmware_end;
> +    ssize_t firmware_size;
>
>      if (load_elf_ram_sym(firmware_filename, NULL, NULL, NULL,
>                           &firmware_entry, NULL, &firmware_end, NULL,
> @@ -176,7 +177,7 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
>  hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
>                           uint64_t kernel_entry, hwaddr *start)
>  {
> -    int size;
> +    ssize_t size;
>
>      /*
>       * We want to put the initrd far enough into RAM that when the
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 4fa485bd61c7..a5e2925040c0 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -40,8 +40,8 @@ ssize_t load_image_size(const char *filename, void *addr, size_t size);
>   *
>   * Returns the size of the loaded image on success, -1 otherwise.
>   */
> -int load_image_targphys_as(const char *filename,
> -                           hwaddr addr, uint64_t max_sz, AddressSpace *as);
> +ssize_t load_image_targphys_as(const char *filename,
> +                               hwaddr addr, uint64_t max_sz, AddressSpace *as);
>
>  /**load_targphys_hex_as:
>   * @filename: Path to the .hex file
> @@ -53,14 +53,15 @@ int load_image_targphys_as(const char *filename,
>   *
>   * Returns the size of the loaded .hex file on success, -1 otherwise.
>   */
> -int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressSpace *as);
> +ssize_t load_targphys_hex_as(const char *filename, hwaddr *entry,
> +                             AddressSpace *as);
>
>  /** load_image_targphys:
>   * Same as load_image_targphys_as(), but doesn't allow the caller to specify
>   * an AddressSpace.
>   */
> -int load_image_targphys(const char *filename, hwaddr,
> -                        uint64_t max_sz);
> +ssize_t load_image_targphys(const char *filename, hwaddr,
> +                            uint64_t max_sz);
>
>  /**
>   * load_image_mr: load an image into a memory region
> @@ -73,7 +74,7 @@ int load_image_targphys(const char *filename, hwaddr,
>   * If the file is larger than the memory region's size the call will fail.
>   * Returns -1 on failure, or the size of the file.
>   */
> -int load_image_mr(const char *filename, MemoryRegion *mr);
> +ssize_t load_image_mr(const char *filename, MemoryRegion *mr);
>
>  /* This is the limit on the maximum uncompressed image size that
>   * load_image_gzipped_buffer() and load_image_gzipped() will read. It prevents
> @@ -81,9 +82,9 @@ int load_image_mr(const char *filename, MemoryRegion *mr);
>   */
>  #define LOAD_IMAGE_MAX_GUNZIP_BYTES (256 << 20)
>
> -int load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
> -                              uint8_t **buffer);
> -int load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz);
> +ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
> +                                  uint8_t **buffer);
> +ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz);
>
>  #define ELF_LOAD_FAILED       -1
>  #define ELF_LOAD_NOT_ELF      -2
> @@ -183,8 +184,8 @@ ssize_t load_elf(const char *filename,
>   */
>  void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
>
> -int load_aout(const char *filename, hwaddr addr, int max_sz,
> -              int bswap_needed, hwaddr target_page_size);
> +ssize_t load_aout(const char *filename, hwaddr addr, int max_sz,
> +                  int bswap_needed, hwaddr target_page_size);
>
>  #define LOAD_UIMAGE_LOADADDR_INVALID (-1)
>
> @@ -205,19 +206,19 @@ int load_aout(const char *filename, hwaddr addr, int max_sz,
>   *
>   * Returns the size of the loaded image on success, -1 otherwise.
>   */
> -int load_uimage_as(const char *filename, hwaddr *ep,
> -                   hwaddr *loadaddr, int *is_linux,
> -                   uint64_t (*translate_fn)(void *, uint64_t),
> -                   void *translate_opaque, AddressSpace *as);
> +ssize_t load_uimage_as(const char *filename, hwaddr *ep,
> +                       hwaddr *loadaddr, int *is_linux,
> +                       uint64_t (*translate_fn)(void *, uint64_t),
> +                       void *translate_opaque, AddressSpace *as);
>
>  /** load_uimage:
>   * Same as load_uimage_as(), but doesn't allow the caller to specify an
>   * AddressSpace.
>   */
> -int load_uimage(const char *filename, hwaddr *ep,
> -                hwaddr *loadaddr, int *is_linux,
> -                uint64_t (*translate_fn)(void *, uint64_t),
> -                void *translate_opaque);
> +ssize_t load_uimage(const char *filename, hwaddr *ep,
> +                    hwaddr *loadaddr, int *is_linux,
> +                    uint64_t (*translate_fn)(void *, uint64_t),
> +                    void *translate_opaque);
>
>  /**
>   * load_ramdisk_as:
> @@ -232,15 +233,15 @@ int load_uimage(const char *filename, hwaddr *ep,
>   *
>   * Returns the size of the loaded image on success, -1 otherwise.
>   */
> -int load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_sz,
> -                    AddressSpace *as);
> +ssize_t load_ramdisk_as(const char *filename, hwaddr addr, uint64_t max_sz,
> +                        AddressSpace *as);
>
>  /**
>   * load_ramdisk:
>   * Same as load_ramdisk_as(), but doesn't allow the caller to specify
>   * an AddressSpace.
>   */
> -int load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz);
> +ssize_t load_ramdisk(const char *filename, hwaddr addr, uint64_t max_sz);
>
>  ssize_t gunzip(void *dst, size_t dstlen, uint8_t *src, size_t srclen);
>
> @@ -253,9 +254,9 @@ void pstrcpy_targphys(const char *name,
>  extern bool option_rom_has_mr;
>  extern bool rom_file_has_mr;
>
> -int rom_add_file(const char *file, const char *fw_dir,
> -                 hwaddr addr, int32_t bootindex,
> -                 bool option_rom, MemoryRegion *mr, AddressSpace *as);
> +ssize_t rom_add_file(const char *file, const char *fw_dir,
> +                     hwaddr addr, int32_t bootindex,
> +                     bool option_rom, MemoryRegion *mr, AddressSpace *as);
>  MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
>                             size_t max_len, hwaddr addr,
>                             const char *fw_file_name,
> @@ -336,8 +337,8 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
>  #define rom_add_blob_fixed_as(_f, _b, _l, _a, _as)      \
>      rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, _as, true)
>
> -int rom_add_vga(const char *file);
> -int rom_add_option(const char *file, int32_t bootindex);
> +ssize_t rom_add_vga(const char *file);
> +ssize_t rom_add_option(const char *file, int32_t bootindex);
>
>  /* This is the usual maximum in uboot, so if a uImage overflows this, it would
>   * overflow on real hardware too. */
> --
> 2.30.2
>
>

