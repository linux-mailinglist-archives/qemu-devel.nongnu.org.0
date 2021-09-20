Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E9D4128B9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:18:23 +0200 (CEST)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRcE-0006t1-9Q
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR6e-0003aO-SO
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:44 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR6W-00025N-SK
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:42 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mdvyi-1n3QY134li-00b7KM; Mon, 20 Sep 2021 23:45:31 +0200
Subject: Re: [PATCH v4 10/20] nubus-device: remove nubus_register_rom() and
 nubus_register_format_block()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-11-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e1a58b3b-1ab0-5e5e-81b4-415b14337133@vivier.eu>
Date: Mon, 20 Sep 2021 23:45:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dV0A+OUhHxonu7Z9ATnf32p/BJGAmBZFl0tts3/zZNKRRIceakS
 2gdMmuSiM/yf4cbHVAsUcHqvssnmociCSu6pNSoKNEjJ1v3oB7Ptv0q214mm5DIji8sCQht
 9sg4IzhzAx2dGnVBeDJ0ZXSxQ3Y6XjtpXb2KynbpD5tIRzBPB0aqZ4ifi+klfwCV6FAkz01
 v3sRNxfUrNdQAs0MNIolA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SVFm4DeMjgs=:X9v8zvbLZEXgbYgrJwPiEs
 VEgKTzaH5cxLG+BzLqMDmSbTGZG/i7piyD6aZ6LwaQme6qeAHjtE26QCZ5v+xWF+3l6goobTX
 qV8dCIvl7g6NME7PughPUGusW6SVhWAJvxXw1lF9PSkoRMVhiD7ltffI7faSfuIsGuO7sKKfD
 x8FVKpNwWiMhOKH2cpLeAl/vvz6oXfrB+5BD6lAjeL/kTf3esutZf87mHmb6UN3LxziuxtYKe
 nwEymyo/jvkY049oUYgac+Tr62qKIG9h/gKoN6TnjJ5FnAlYhZ14d1js7RFnzkD1IRKkHFarV
 MYVUxOFIHj1QxgPy2KKZGI2EnbafOa+DB7T/JiUeD0A0rwD/C9TmGfFiNwB2jznAKD8QJAir5
 MdDOsNpvyi21zr0d76slt3rL5JmsC4Sij59P92uahExNC4ANW6/AU3+swT4J6/jI32B4HxVAQ
 rBloPRNegd1iM0HDjnJhVFaXu/pRd8jCKXuO/0mFFaFj7HBsR9fkiLxN0wUm8KL4/l8JdaAMi
 8bkvFOcb48pNe0/REKdZG6YeKDPxfCkje4LGxVPwNs4dUXVYShWK4MZlZtUdG9xCCJNLcjXrE
 M9l/Fvy55+FxBoYUxCJ02t+5+m2EhyYdBqhck6bX79sRIm6PY2t2/Q75LWXD3YEitWe/vQ2ER
 N2mvAF1tqdDPtRliAVDFtLFHzfetucUsGJ+sHmmS2qR7d3/x0GWFGTOT+4gxDy776ras9PNhY
 yIpafAHnmbAF072hiUh6gGdVLNf5+BFxbcr/XQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> Since there is no need to generate a dummy declaration ROM, remove both
> nubus_register_rom() and nubus_register_format_block(). These will shortly be
> replaced with a mechanism to optionally load a declaration ROM from disk to
> allow real images to be used within QEMU.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-device.c  | 143 ---------------------------------------
>  include/hw/nubus/nubus.h |  19 ------
>  2 files changed, 162 deletions(-)
> 
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 7a32c8c95b..9c1992ceb0 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -13,147 +13,6 @@
>  #include "qapi/error.h"
>  
>  
> -/* The Format Block Structure */
> -
> -#define FBLOCK_DIRECTORY_OFFSET 0
> -#define FBLOCK_LENGTH           4
> -#define FBLOCK_CRC              8
> -#define FBLOCK_REVISION_LEVEL   12
> -#define FBLOCK_FORMAT           13
> -#define FBLOCK_TEST_PATTERN     14
> -#define FBLOCK_RESERVED         18
> -#define FBLOCK_BYTE_LANES       19
> -
> -#define FBLOCK_SIZE             20
> -#define FBLOCK_PATTERN_VAL      0x5a932bc7
> -
> -static uint64_t nubus_fblock_read(void *opaque, hwaddr addr, unsigned int size)
> -{
> -    NubusDevice *dev = opaque;
> -    uint64_t val;
> -
> -#define BYTE(v, b) (((v) >> (24 - 8 * (b))) & 0xff)
> -    switch (addr) {
> -    case FBLOCK_BYTE_LANES:
> -        val = dev->byte_lanes;
> -        val |= (val ^ 0xf) << 4;
> -        break;
> -    case FBLOCK_RESERVED:
> -        val = 0x00;
> -        break;
> -    case FBLOCK_TEST_PATTERN...FBLOCK_TEST_PATTERN + 3:
> -        val = BYTE(FBLOCK_PATTERN_VAL, addr - FBLOCK_TEST_PATTERN);
> -        break;
> -    case FBLOCK_FORMAT:
> -        val = dev->rom_format;
> -        break;
> -    case FBLOCK_REVISION_LEVEL:
> -        val = dev->rom_rev;
> -        break;
> -    case FBLOCK_CRC...FBLOCK_CRC + 3:
> -        val = BYTE(dev->rom_crc, addr - FBLOCK_CRC);
> -        break;
> -    case FBLOCK_LENGTH...FBLOCK_LENGTH + 3:
> -        val = BYTE(dev->rom_length, addr - FBLOCK_LENGTH);
> -        break;
> -    case FBLOCK_DIRECTORY_OFFSET...FBLOCK_DIRECTORY_OFFSET + 3:
> -        val = BYTE(dev->directory_offset, addr - FBLOCK_DIRECTORY_OFFSET);
> -        break;
> -    default:
> -        val = 0;
> -        break;
> -    }
> -    return val;
> -}
> -
> -static void nubus_fblock_write(void *opaque, hwaddr addr, uint64_t val,
> -                               unsigned int size)
> -{
> -    /* read only */
> -}
> -
> -static const MemoryRegionOps nubus_format_block_ops = {
> -    .read = nubus_fblock_read,
> -    .write = nubus_fblock_write,
> -    .endianness = DEVICE_BIG_ENDIAN,
> -    .valid = {
> -        .min_access_size = 1,
> -        .max_access_size = 1,
> -    }
> -};
> -
> -static void nubus_register_format_block(NubusDevice *dev)
> -{
> -    char *fblock_name;
> -
> -    fblock_name = g_strdup_printf("nubus-slot-%d-format-block",
> -                                  dev->slot);
> -
> -    hwaddr fblock_offset = memory_region_size(&dev->slot_mem) - FBLOCK_SIZE;
> -    memory_region_init_io(&dev->fblock_io, NULL, &nubus_format_block_ops,
> -                          dev, fblock_name, FBLOCK_SIZE);
> -    memory_region_add_subregion(&dev->slot_mem, fblock_offset,
> -                                &dev->fblock_io);
> -
> -    g_free(fblock_name);
> -}
> -
> -static void mac_nubus_rom_write(void *opaque, hwaddr addr, uint64_t val,
> -                                       unsigned int size)
> -{
> -    /* read only */
> -}
> -
> -static uint64_t mac_nubus_rom_read(void *opaque, hwaddr addr,
> -                                    unsigned int size)
> -{
> -    NubusDevice *dev = opaque;
> -
> -    return dev->rom[addr];
> -}
> -
> -static const MemoryRegionOps mac_nubus_rom_ops = {
> -    .read  = mac_nubus_rom_read,
> -    .write = mac_nubus_rom_write,
> -    .endianness = DEVICE_BIG_ENDIAN,
> -    .valid = {
> -        .min_access_size = 1,
> -        .max_access_size = 1,
> -    },
> -};
> -
> -
> -void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
> -                        int revision, int format, uint8_t byte_lanes)
> -{
> -    hwaddr rom_offset;
> -    char *rom_name;
> -
> -    /* FIXME : really compute CRC */
> -    dev->rom_length = 0;
> -    dev->rom_crc = 0;
> -
> -    dev->rom_rev = revision;
> -    dev->rom_format = format;
> -
> -    dev->byte_lanes = byte_lanes;
> -    dev->directory_offset = -size;
> -
> -    /* ROM */
> -
> -    dev->rom = rom;
> -    rom_name = g_strdup_printf("nubus-slot-%d-rom", dev->slot);
> -    memory_region_init_io(&dev->rom_io, NULL, &mac_nubus_rom_ops,
> -                          dev, rom_name, size);
> -    memory_region_set_readonly(&dev->rom_io, true);
> -
> -    rom_offset = memory_region_size(&dev->slot_mem) - FBLOCK_SIZE +
> -                 dev->directory_offset;
> -    memory_region_add_subregion(&dev->slot_mem, rom_offset, &dev->rom_io);
> -
> -    g_free(rom_name);
> -}
> -
>  static void nubus_device_realize(DeviceState *dev, Error **errp)
>  {
>      NubusBus *nubus = NUBUS_BUS(qdev_get_parent_bus(dev));
> @@ -179,8 +38,6 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>      memory_region_add_subregion(&nubus->slot_io, slot_offset,
>                                  &nd->slot_mem);
>      g_free(name);
> -
> -    nubus_register_format_block(nd);
>  }
>  
>  static Property nubus_device_properties[] = {
> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
> index 8ff4736259..87a97516c7 100644
> --- a/include/hw/nubus/nubus.h
> +++ b/include/hw/nubus/nubus.h
> @@ -45,25 +45,6 @@ struct NubusDevice {
>      int32_t slot;
>      MemoryRegion super_slot_mem;
>      MemoryRegion slot_mem;
> -
> -    /* Format Block */
> -
> -    MemoryRegion fblock_io;
> -
> -    uint32_t rom_length;
> -    uint32_t rom_crc;
> -    uint8_t rom_rev;
> -    uint8_t rom_format;
> -    uint8_t byte_lanes;
> -    int32_t directory_offset;
> -
> -    /* ROM */
> -
> -    MemoryRegion rom_io;
> -    const uint8_t *rom;
>  };
>  
> -void nubus_register_rom(NubusDevice *dev, const uint8_t *rom, uint32_t size,
> -                        int revision, int format, uint8_t byte_lanes);
> -
>  #endif
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

