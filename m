Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B4116BAE0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 08:40:05 +0100 (CET)
Received: from localhost ([::1]:49930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Up2-0007o5-SK
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 02:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j6UoL-0007Lr-9t
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 02:39:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j6UoJ-00039b-Jf
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 02:39:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50431
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j6UoJ-00039D-Fj
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 02:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582616358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpqojjRG3VJiqCefpNMVkZtaxSrzvXahefZrSEACkoY=;
 b=b6OIFykYthbD2gxooIrnJ0FgFhk9UafP/5iBWe+CKVXvD7BNz6xSZKZKlJyOyivUChlT0J
 +bYvmEk1C2DvNgKuJFsT8RgH+PGacbDvAEZC1s57a0HCfSLUUewm7sQEhp1fYUf5DFLUGl
 k7GXNQvQy1Gy3QoJh9Ix3MXUPCCtZeo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-R61ePjXaNw-4YI42W7-Oyw-1; Tue, 25 Feb 2020 02:39:14 -0500
X-MC-Unique: R61ePjXaNw-4YI42W7-Oyw-1
Received: by mail-wm1-f72.google.com with SMTP id x9so496699wmc.7
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 23:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wpqojjRG3VJiqCefpNMVkZtaxSrzvXahefZrSEACkoY=;
 b=Eyihom/U1jrpCUoGH/cHiQxRdZA8pFcaCArsI0SQOXOnsgialBRuBz62ME173ZVO00
 cMG8Qcb+Fq0yxxEeNN6ixSbBy7lcZALGWTvlxZkrnjK82IXQ0tlj8ReFUhMm7xVIDeX+
 EmvbN+Y6DgRm2I9zMXpHneNfygoGHkJpWI/MxGa+D+0o8x9PvACFCX8qAPG+VivXDcQ/
 fW1GzhvRMVqYglcbv/XsAHzwNDOdDhYIjqqMupSDhSZ+W2ksYEBF+Xkgrm9ndvK3UZIO
 d7cTYjOCxXmI/pWhuFgkMHDNN8I/UTnyX2eMQrqUhqYOS0GfkUeQ+eO0CiPIOg/NfvZV
 g8zA==
X-Gm-Message-State: APjAAAXSCftviEzQy+BlQvMcVLemIBwUGs2VNAqdkjDcwRFGfO4c2WvU
 XnYAxUQ8JJp0JFQgRaTpbVunGo7L0Kx4yk/IXa8Vgvs3azmWYj/sagiIp0AFJKmR10W+rNlKKBS
 9mxBzDLPodjD2494=
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr6635764wrw.47.1582616353428; 
 Mon, 24 Feb 2020 23:39:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyvpO02a4t6Dp9GujP6m9j9gLRUA2sJtL5EAIRweSEpmuLLZN4I2nw/gv5pzHkTZVOdJNy/FQ==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr6635730wrw.47.1582616353077; 
 Mon, 24 Feb 2020 23:39:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:60c6:7e02:8eeb:a041?
 ([2001:b07:6468:f312:60c6:7e02:8eeb:a041])
 by smtp.gmail.com with ESMTPSA id h205sm3097823wmf.25.2020.02.24.23.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 23:39:12 -0800 (PST)
Subject: Re: [PATCH 2/2] qxl: drop shadow_rom
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200225055920.17261-1-kraxel@redhat.com>
 <20200225055920.17261-3-kraxel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3e1d3937-1f63-3e8a-4e20-532ae34a51ed@redhat.com>
Date: Tue, 25 Feb 2020 08:39:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225055920.17261-3-kraxel@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, sstabellini@kernel.org,
 pmatouse@redhat.com, mdroth@linux.vnet.ibm.com, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/20 06:59, Gerd Hoffmann wrote:
> Now that the rom bar is mapped read-only and the guest can't change
> things under our feet we don't need the shadow rom any more.

Can't it do so when migrating from an older version?

Paolo

> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/qxl.h |  2 +-
>  hw/display/qxl.c | 25 +++++++++----------------
>  2 files changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/display/qxl.h b/hw/display/qxl.h
> index 707631a1f573..3aedc7db5da0 100644
> --- a/hw/display/qxl.h
> +++ b/hw/display/qxl.h
> @@ -95,11 +95,11 @@ typedef struct PCIQXLDevice {
>      uint32_t           vgamem_size;
>  
>      /* rom pci bar */
> -    QXLRom             shadow_rom;
>      QXLRom             *rom;
>      QXLModes           *modes;
>      uint32_t           rom_size;
>      MemoryRegion       rom_bar;
> +    uint32_t           rom_mode;
>  #if SPICE_SERVER_VERSION >= 0x000c06 /* release 0.12.6 */
>      uint16_t           max_outputs;
>  #endif
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 227da69a50d9..0502802688f9 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -391,7 +391,6 @@ static void init_qxl_rom(PCIQXLDevice *d)
>              sizeof(rom->client_monitors_config));
>      }
>  
> -    d->shadow_rom = *rom;
>      d->rom        = rom;
>      d->modes      = modes;
>  }
> @@ -403,7 +402,7 @@ static void init_qxl_ram(PCIQXLDevice *d)
>      QXLReleaseRing *ring;
>  
>      buf = d->vga.vram_ptr;
> -    d->ram = (QXLRam *)(buf + le32_to_cpu(d->shadow_rom.ram_header_offset));
> +    d->ram = (QXLRam *)(buf + le32_to_cpu(d->rom->ram_header_offset));
>      d->ram->magic       = cpu_to_le32(QXL_RAM_MAGIC);
>      d->ram->int_pending = cpu_to_le32(0);
>      d->ram->int_mask    = cpu_to_le32(0);
> @@ -446,7 +445,7 @@ static void qxl_ram_set_dirty(PCIQXLDevice *qxl, void *ptr)
>  /* can be called from spice server thread context */
>  static void qxl_ring_set_dirty(PCIQXLDevice *qxl)
>  {
> -    ram_addr_t addr = qxl->shadow_rom.ram_header_offset;
> +    ram_addr_t addr = qxl->rom->ram_header_offset;
>      ram_addr_t end  = qxl->vga.vram_size;
>      qxl_set_dirty(&qxl->vga.vram, addr, end);
>  }
> @@ -529,7 +528,6 @@ static void interface_set_compression_level(QXLInstance *sin, int level)
>      PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
>  
>      trace_qxl_interface_set_compression_level(qxl->id, level);
> -    qxl->shadow_rom.compression_level = cpu_to_le32(level);
>      qxl->rom->compression_level = cpu_to_le32(level);
>      qxl_rom_set_dirty(qxl);
>  }
> @@ -561,7 +559,7 @@ static void interface_get_init_info(QXLInstance *sin, QXLDevInitInfo *info)
>      info->num_memslots_groups = NUM_MEMSLOTS_GROUPS;
>      info->internal_groupslot_id = 0;
>      info->qxl_ram_size =
> -        le32_to_cpu(qxl->shadow_rom.num_pages) << QXL_PAGE_BITS;
> +        le32_to_cpu(qxl->rom->num_pages) << QXL_PAGE_BITS;
>      info->n_surfaces = qxl->ssd.num_surfaces;
>  }
>  
> @@ -1035,9 +1033,6 @@ static void interface_set_client_capabilities(QXLInstance *sin,
>          return;
>      }
>  
> -    qxl->shadow_rom.client_present = client_present;
> -    memcpy(qxl->shadow_rom.client_capabilities, caps,
> -           sizeof(qxl->shadow_rom.client_capabilities));
>      qxl->rom->client_present = client_present;
>      memcpy(qxl->rom->client_capabilities, caps,
>             sizeof(qxl->rom->client_capabilities));
> @@ -1232,11 +1227,8 @@ static void qxl_check_state(PCIQXLDevice *d)
>  
>  static void qxl_reset_state(PCIQXLDevice *d)
>  {
> -    QXLRom *rom = d->rom;
> -
>      qxl_check_state(d);
> -    d->shadow_rom.update_id = cpu_to_le32(0);
> -    *rom = d->shadow_rom;
> +    d->rom->update_id = cpu_to_le32(0);
>      qxl_rom_set_dirty(d);
>      init_qxl_ram(d);
>      d->num_free_res = 0;
> @@ -1600,7 +1592,7 @@ static void qxl_set_mode(PCIQXLDevice *d, unsigned int modenr, int loadvm)
>          .format     = SPICE_SURFACE_FMT_32_xRGB,
>          .flags      = loadvm ? QXL_SURF_FLAG_KEEP_DATA : 0,
>          .mouse_mode = true,
> -        .mem        = devmem + d->shadow_rom.draw_area_offset,
> +        .mem        = devmem + d->rom->draw_area_offset,
>      };
>  
>      trace_qxl_set_mode(d->id, modenr, mode->x_res, mode->y_res, mode->bits,
> @@ -1620,7 +1612,6 @@ static void qxl_set_mode(PCIQXLDevice *d, unsigned int modenr, int loadvm)
>      if (mode->bits == 16) {
>          d->cmdflags |= QXL_COMMAND_FLAG_COMPAT_16BPP;
>      }
> -    d->shadow_rom.mode = cpu_to_le32(modenr);
>      d->rom->mode = cpu_to_le32(modenr);
>      qxl_rom_set_dirty(d);
>  }
> @@ -2277,6 +2268,7 @@ static int qxl_pre_save(void *opaque)
>          d->last_release_offset = (uint8_t *)d->last_release - ram_start;
>      }
>      assert(d->last_release_offset < d->vga.vram_size);
> +    d->rom_mode = d->rom->mode;
>  
>      return 0;
>  }
> @@ -2316,6 +2308,7 @@ static int qxl_post_load(void *opaque, int version)
>      } else {
>          d->last_release = (QXLReleaseInfo *)(ram_start + d->last_release_offset);
>      }
> +    d->rom->mode = d->rom_mode;
>  
>      d->modes = (QXLModes*)((uint8_t*)d->rom + d->rom->modes_offset);
>  
> @@ -2361,7 +2354,7 @@ static int qxl_post_load(void *opaque, int version)
>      case QXL_MODE_COMPAT:
>          /* note: no need to call qxl_create_memslots, qxl_set_mode
>           * creates the mem slot. */
> -        qxl_set_mode(d, d->shadow_rom.mode, 1);
> +        qxl_set_mode(d, d->rom->mode, 1);
>          break;
>      }
>      return 0;
> @@ -2428,7 +2421,7 @@ static VMStateDescription qxl_vmstate = {
>      .fields = (VMStateField[]) {
>          VMSTATE_PCI_DEVICE(pci, PCIQXLDevice),
>          VMSTATE_STRUCT(vga, PCIQXLDevice, 0, vmstate_vga_common, VGACommonState),
> -        VMSTATE_UINT32(shadow_rom.mode, PCIQXLDevice),
> +        VMSTATE_UINT32(rom_mode, PCIQXLDevice),
>          VMSTATE_UINT32(num_free_res, PCIQXLDevice),
>          VMSTATE_UINT32(last_release_offset, PCIQXLDevice),
>          VMSTATE_UINT32(mode, PCIQXLDevice),
> 


