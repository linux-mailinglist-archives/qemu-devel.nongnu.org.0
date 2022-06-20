Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E752A551D86
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:19:25 +0200 (CEST)
Received: from localhost ([::1]:48516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3IFR-00031f-0n
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o3I3U-0002E1-5C
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:07:05 -0400
Received: from esa10.hc2706-39.iphmx.com ([216.71.140.198]:27318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o3I3O-00070z-Ue
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:07:03 -0400
X-IronPort-RemoteIP: 209.85.222.200
X-IronPort-MID: 207949002
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:z+DqTK+xKpq2kNhP0eAaDrUDF3yTJUtcMsCJ2f8bNWPcYEJGY0x3y
 DZLUGyDPPrcYTShfd9xb4jnox9V7ceAz4JkTQVq+SwxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbgXVvR0
 T/Pi5a31GGNimYc3l08tvrrRCNH5JwebxtB4zTSzdgS1LPvvyB94KA3fMldHFOhKmVgJdNWc
 s6YpF2PEsI1yD92Yj+tuu6TnkTn2dc+NyDX4pZdc/HKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NZxl5WySCYTB6rvhcY7cyJ1EyMhGYQTrdcrIVDn2SCS50jPcn+p2vY3SU9sZdVe9eFwDmVDs
 /cfLVjhbDjZ37PwkO/9ELM2wJ57dKEHP6tG0p1k5TjdHfAqW7jJXuPH6cIwMDIY3JgRTKqPP
 5JDAdZpRA/dPw1RGk4pMq4Fksv2qH7RcD5J+V3A8MLb5ECWlmSdyoPFKdfQZ5mGSNtYmm6eo
 WTJ+Xm/BQsVXOFz0hKA+3Oow/bMxGb1AtpKUrK/8fFujRuYwWl75AAqaGZXaMKR0iaWM++z4
 WRNpULCcYBaGJSXc+TA
IronPort-HdrOrdr: A9a23:Wh1xKqFOU+IRDIylpLqEzMeALOsnbusQ8zAXPidKJiC9E/b1qy
 nKpp8mPHDP5gr5J0tQ/OxoVJPhfZqkz+8Q3WBJB8bEYOCEggaVxeNZnPbfKlTbckWVygc679
 YCT0EUMqyTMbEVt6fHCdiDYq4dKJfuytHSuQ+Tp00dND2CwJsQlTuQRW6gYytLeDU=
Received: from mail-qk1-f200.google.com ([209.85.222.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2022 10:06:48 -0400
Received: by mail-qk1-f200.google.com with SMTP id
 ay8-20020a05620a178800b006a76e584761so13125513qkb.13
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 07:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n9zY54nr8M/vmcz7ZuhTOc9ejunf1jlMa1IcUpl7cT0=;
 b=ZD/DAT36ACBhBpPygHLThywgJ27eE/xKISN09vv4JtzrrU6/T/Pdu6L/IV/zZkmP+F
 o05rjcHNBEkIX3zOxKCsKct3ibSfGeaSQFn0lQd/oKqeEbJ5dAdtb02fYzy+4bSJnpBw
 a2+ht/MqyPww3QZm4R3GgrPvNSgnEyPsMKsxeywvNIwBpalKJ/qvz7nquzYYw7+/zttm
 PMOB7N9HERaZEyyGqejOLw4/ce3S9VCWgqd8cOt1LSaotUhGjvFPnNRvzg96vUX5tIPF
 YBAnz8hHMijyEY1TnsqnMTU0IqRYY2Q8QUSommawGLen1ceWa7FME/OpdeH+HTsHzODo
 3K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n9zY54nr8M/vmcz7ZuhTOc9ejunf1jlMa1IcUpl7cT0=;
 b=KwtQxX//V0yGvfJ5Anf8nKg+RW/HZkw5EUW8j7Yk/khWWxJ1VEPfmAZpy/SEhutfpg
 px3rU5pXaTpsMJXZCKbsNGnLAIEIMhVUeWEEOlPQ9MdPzCJ14tOuslYKRM5V2cSzGk9x
 ETgQibS7IoRtFKsDRoQYlYGtQChuOQFCqnczXjbfGQ0paQij+D60wd19q9syVXlRpENB
 GR3x3VzqWySDmNylCc1OsDkO/z4sp9U13Y9y+BpdXlmLsdDKNGFNVvfnzXT98aLQZlQ+
 w3vBYme2Y1X7Gaw6YtXc9oJ4lSaZrmTfDAeqfUDSZbK9kD90CPakMOMLoojp7mzurYqo
 2Pmw==
X-Gm-Message-State: AJIora/2P10Ovr3nxfAl/zP6S9ee8jswu74/Z1CJu8eTqbgOjypE+W+l
 Apotl0UIIXthsYMNXRZ1ljpbChJ1LXe+44gPUVoD/QqY6K7ijABmRddPhNZSMtqtI6A0ZQnTPPh
 7PzWYmH/f/EBGVxapp9BuakajUh9Ogg==
X-Received: by 2002:a05:6214:202b:b0:46e:60d9:d956 with SMTP id
 11-20020a056214202b00b0046e60d9d956mr19098280qvf.80.1655734007901; 
 Mon, 20 Jun 2022 07:06:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6uUis6pzUTSG5dQjnIa1rsHSKX0CC4cOvnjUHDnRWhPC1u8maTXaYyQB3KMUi+p2v0cU0MA==
X-Received: by 2002:a05:6214:202b:b0:46e:60d9:d956 with SMTP id
 11-20020a056214202b00b0046e60d9d956mr19098242qvf.80.1655734007571; 
 Mon, 20 Jun 2022 07:06:47 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a05622a02c500b00304f3e320f2sm11136953qtx.4.2022.06.20.07.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 07:06:47 -0700 (PDT)
Date: Mon, 20 Jun 2022 10:06:42 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Li Qiang <liq3ea@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2] memory: prevent dma-reentracy issues
Message-ID: <20220620140635.cw3ldyt4npwvocky@mozz.bu.edu>
References: <20220609135851.42193-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609135851.42193-1-alxndr@bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.198; envelope-from=alxndr@bu.edu;
 helo=esa10.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 220609 0958, Alexander Bulekov wrote:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag is set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent two types of DMA-based reentrancy issues:
> 
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
> 
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
> 
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  include/hw/pci/pci.h   | 13 +++++++++++--
>  include/hw/qdev-core.h |  3 +++
>  softmmu/dma-helpers.c  | 12 ++++++++++++
>  softmmu/memory.c       | 15 +++++++++++++++
>  softmmu/trace-events   |  1 +
>  5 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 44dacfa224..ab1ad0f7a8 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -834,8 +834,17 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
>                                       void *buf, dma_addr_t len,
>                                       DMADirection dir, MemTxAttrs attrs)
>  {
> -    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> -                         dir, attrs);
> +    bool prior_engaged_state;
> +    MemTxResult result;
> +
> +    prior_engaged_state = dev->qdev.engaged_in_io;
> +
> +    dev->qdev.engaged_in_io = true;
> +    result = dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
> +                           dir, attrs);
> +    dev->qdev.engaged_in_io = prior_engaged_state;
> +
> +    return result;
>  }
>  
>  /**
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 92c3d65208..6474dc51fa 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -193,6 +193,9 @@ struct DeviceState {
>      int instance_id_alias;
>      int alias_required_for_version;
>      ResettableState reset;
> +
> +    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
> +    int engaged_in_io;
>  };
>  
>  struct DeviceListener {
> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 7820fec54c..7a4f1fb9b3 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -288,8 +288,16 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
>      uint8_t *ptr = buf;
>      dma_addr_t xresidual;
>      int sg_cur_index;
> +    DeviceState *dev;
> +    bool prior_engaged_state;
>      MemTxResult res = MEMTX_OK;
>  
> +    dev = sg->dev;
> +    if (dev) {
> +        prior_engaged_state = dev->engaged_in_io;
> +        dev->engaged_in_io = true;
> +    }
> +
>      xresidual = sg->size;
>      sg_cur_index = 0;
>      len = MIN(len, xresidual);
> @@ -302,6 +310,10 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
>          xresidual -= xfer;
>      }
>  
> +    if (dev) {
> +        dev->engaged_in_io = prior_engaged_state;
> +    }
> +
>      if (residual) {
>          *residual = xresidual;
>      }
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7ba2048836..44a14bb4f5 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>      uint64_t access_mask;
>      unsigned access_size;
>      unsigned i;
> +    DeviceState *dev = NULL;
>      MemTxResult r = MEMTX_OK;
>  
>      if (!access_size_min) {
> @@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>          access_size_max = 4;
>      }
>  
> +    /* Do not allow more than one simultanous access to a device's IO Regions */
> +    if (mr->owner &&
> +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
> +        if (dev->engaged_in_io) {
> +            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
> +            return MEMTX_ERROR;
> +        }
> +        dev->engaged_in_io = true;
> +    }
> +
>      /* FIXME: support unaligned access? */
>      access_size = MAX(MIN(size, access_size_max), access_size_min);
>      access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> @@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>                          access_mask, attrs);
>          }
>      }
> +    if (dev) {
> +        dev->engaged_in_io = false;
> +    }
>      return r;
>  }
>  
> diff --git a/softmmu/trace-events b/softmmu/trace-events
> index 9c88887b3c..d7228316db 100644
> --- a/softmmu/trace-events
> +++ b/softmmu/trace-events
> @@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, u
>  memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
>  memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
> +memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" size %u"
>  memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
> -- 
> 2.33.0
> 

ping

