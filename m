Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B683206EF
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 20:33:45 +0100 (CET)
Received: from localhost ([::1]:43568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDY0e-00050S-LP
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 14:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDXy0-00049E-5M
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 14:31:02 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:47011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDXxy-0002UO-Cn
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 14:30:59 -0500
Received: by mail-wr1-x435.google.com with SMTP id t15so14523321wrx.13
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 11:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uSdNUIs76LgVmd8LJVYdfRrm6kvfif97NrTi+smiaRg=;
 b=KWwK2I8KyxQOlEPAEk537m5smULGevJAXtGBp7Vd3LoSUw5X2/e4LYAD5y64pTQUoX
 2Kt6H0gOoixe7b5szSzNUEsEuJ+08bLt96bR2pFuJR1ipfeEDcLDRb0AF31UT2UbEM36
 Q8tFXRg/E/v65L261bLB2EKjs8HGuBHae0hVYnmIiL4sz5z5fDUCXamyg5cRbYxN+usw
 7mzd+nIIAh+YqeO9IEwLOxQuLKXeaiLYxTJyykYHPRxqe96m1s6nhEVPSSREKBWtE2DT
 BgPLLYUIeOjgbXF86Xg6GSADNur+kjMNwR1ex6DrznFFsVsNY+ZOxDRA3MvawUCJKEKM
 Y10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uSdNUIs76LgVmd8LJVYdfRrm6kvfif97NrTi+smiaRg=;
 b=XljeCS+yny3XdL/AkfWZNSXUoEFFfLmZcebtCEiZemm3yWC64/Hpu/hUnZsJVGnCQr
 B02LyoYo6zYf1yxNBi+Eb+amx8a0l4vFsJthdf27DbOJw0C0yRwTBK/rXYSCdMjeupCi
 jwjObLyhP4tn5OHDSVojLdDP1Z98A5xCx2HAhMn/d2xgaq/rKoy3KipkDL3yVjaGdGw8
 oo+1o30izZ5R9hsl8/mZ6bV4yQcwn4IBuwuhpDekPW0C/jHDHsreZgoUDtKUMxTHtFc6
 J0YYSCyuTJhSripXIyykj6EhE4V/oLEK1bKjAy764rYg5dfrlGBksIlBYdLvUvT85IhJ
 Z/8A==
X-Gm-Message-State: AOAM5332i2GTUQLOISuBO+x/4CdeDbzkaLevarvCkz+h+8maZIVN06n6
 mvM5weLUDIDi82PrRUJ0+tU=
X-Google-Smtp-Source: ABdhPJw8isX73eFWYgZf+xbUULgk5uztBgUxhLaDy/rQ52wLC+bPC2KiDerWrS281bj95UCVOnV7TA==
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr14725678wrp.294.1613849456899; 
 Sat, 20 Feb 2021 11:30:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x18sm19915373wrs.16.2021.02.20.11.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Feb 2021 11:30:56 -0800 (PST)
Subject: Re: [PATCH v2 10/13] vt82c686: Implement control of serial port io
 ranges via config regs
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <3e07fafd50db50f965be877409a420c2693d7b29.1610223397.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <19d2d420-722f-9212-0a19-3f7ad99398f7@amsat.org>
Date: Sat, 20 Feb 2021 20:30:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <3e07fafd50db50f965be877409a420c2693d7b29.1610223397.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Paolo (Memory API maintainer).

On 1/9/21 9:16 PM, BALATON Zoltan wrote:
> In VIA super south bridge the io ranges of superio components
> (parallel and serial ports and FDC) can be controlled by superio
> config registers to set their base address and enable/disable them.
> This is not easy to implement in QEMU because ISA emulation is only
> designed to set io base address once on creating the device and io
> ranges are registered at creation and cannot easily be disabled or
> moved later.
> 
> In this patch we hack around that but only for serial ports because
> those have a single io range at port base that's relatively easy to
> handle and it's what guests actually use and set address different
> than the default.
> 
> We do not attempt to handle controlling the parallel and FDC regions
> because those have multiple io ranges so handling them would be messy
> and guests either don't change their deafult or don't care. We could
> even get away with disabling and not emulating them, but since they
> are already there, this patch leaves them mapped at their default
> address just in case this could be useful for a guest in the future.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 84 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 82 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 2921d5c55c..18bd86285b 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -252,8 +252,24 @@ static const TypeInfo vt8231_pm_info = {
>  typedef struct SuperIOConfig {
>      uint8_t regs[0x100];
>      MemoryRegion io;
> +    ISASuperIODevice *superio;
> +    MemoryRegion *serial_io[SUPERIO_MAX_SERIAL_PORTS];
>  } SuperIOConfig;
>  
> +static MemoryRegion *find_subregion(ISADevice *d, MemoryRegion *parent,
> +                                    int offs)
> +{
> +    MemoryRegion *subregion, *mr = NULL;
> +
> +    QTAILQ_FOREACH(subregion, &parent->subregions, subregions_link) {
> +        if (subregion->addr == offs) {
> +            mr = subregion;

Shouldn't we use memory_region_find() here?

Also, why not have a proper helper in "hw/isa/isa.h"?

> +            break;
> +        }
> +    }
> +    return mr;
> +}
> +
>  static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
>                                unsigned size)
>  {
> @@ -279,7 +295,53 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
>      case 0xfd ... 0xff:
>          /* ignore write to read only registers */
>          return;
> -    /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
> +    case 0xe2:
> +    {
> +        data &= 0x1f;
> +        if (data & BIT(2)) { /* Serial port 1 enable */
> +            ISADevice *dev = sc->superio->serial[0];
> +            if (!memory_region_is_mapped(sc->serial_io[0])) {
> +                memory_region_add_subregion(isa_address_space_io(dev),
> +                                            dev->ioport_id, sc->serial_io[0]);
> +            }
> +        } else {
> +            MemoryRegion *io = isa_address_space_io(sc->superio->serial[0]);
> +            if (memory_region_is_mapped(sc->serial_io[0])) {
> +                memory_region_del_subregion(io, sc->serial_io[0]);
> +            }
> +        }
> +        if (data & BIT(3)) { /* Serial port 2 enable */
> +            ISADevice *dev = sc->superio->serial[1];
> +            if (!memory_region_is_mapped(sc->serial_io[1])) {
> +                memory_region_add_subregion(isa_address_space_io(dev),
> +                                            dev->ioport_id, sc->serial_io[1]);
> +            }
> +        } else {
> +            MemoryRegion *io = isa_address_space_io(sc->superio->serial[1]);
> +            if (memory_region_is_mapped(sc->serial_io[1])) {
> +                memory_region_del_subregion(io, sc->serial_io[1]);
> +            }
> +        }
> +        break;
> +    }
> +    case 0xe7: /* Serial port 1 io base address */
> +    {
> +        data &= 0xfe;
> +        sc->superio->serial[0]->ioport_id = data << 2;
> +        if (memory_region_is_mapped(sc->serial_io[0])) {
> +            memory_region_set_address(sc->serial_io[0], data << 2);
> +        }
> +        break;
> +    }
> +    case 0xe8: /* Serial port 2 io base address */
> +    {
> +        data &= 0xfe;
> +        sc->superio->serial[1]->ioport_id = data << 2;
> +        if (memory_region_is_mapped(sc->serial_io[1])) {
> +            memory_region_set_address(sc->serial_io[1], data << 2);
> +        }
> +        break;
> +    }
>      default:
>          qemu_log_mask(LOG_UNIMP,
>                        "via_superio_cfg: unimplemented register 0x%x\n", idx);
> @@ -385,6 +447,7 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>      DeviceState *dev = DEVICE(d);
>      ISABus *isa_bus;
>      qemu_irq *isa_irq;
> +    ISASuperIOClass *ic;
>      int i;
>  
>      qdev_init_gpio_out(dev, &s->cpu_intr, 1);
> @@ -394,7 +457,9 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>      isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
>      i8254_pit_init(isa_bus, 0x40, 0, NULL);
>      i8257_dma_init(isa_bus, 0);
> -    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
> +    s->superio_cfg.superio = ISA_SUPERIO(isa_create_simple(isa_bus,
> +                                                      TYPE_VT82C686B_SUPERIO));
> +    ic = ISA_SUPERIO_GET_CLASS(s->superio_cfg.superio);
>      mc146818_rtc_init(isa_bus, 2000, NULL);
>  
>      for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> @@ -412,6 +477,21 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>       */
>      memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
>                                  &s->superio_cfg.io);
> +
> +    /* Grab io regions of serial devices so we can control them */
> +    for (i = 0; i < ic->serial.count; i++) {
> +        ISADevice *sd = s->superio_cfg.superio->serial[i];
> +        MemoryRegion *io = isa_address_space_io(sd);
> +        MemoryRegion *mr = find_subregion(sd, io, sd->ioport_id);
> +        if (!mr) {
> +            error_setg(errp, "Could not get io region for serial %d", i);
> +            return;
> +        }
> +        s->superio_cfg.serial_io[i] = mr;
> +        if (memory_region_is_mapped(mr)) {
> +            memory_region_del_subregion(io, mr);
> +        }
> +    }
>  }
>  
>  static void via_class_init(ObjectClass *klass, void *data)
> 

