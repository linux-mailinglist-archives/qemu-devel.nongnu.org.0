Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F86B3F1D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 13:25:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pabn5-0007Lb-AQ; Fri, 10 Mar 2023 07:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pabn2-0007Kv-VP
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 07:24:04 -0500
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pabn0-0007Mf-NF
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 07:24:04 -0500
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 262168029
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GwO/mqPKaA/aUoHvrR0YlcFynXyQoLVcMsEvi/4bfWQNrUp33mBWx
 jQZCmHSb6zfN2X1e9siOo3lpk1U6JXQyIBnTgZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656yEnj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjim4c3l48sfrZ80s05ayq4Vv0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TEzf4yXVMKD9ci6O9oJ1p10
 9xDCz0VV0XW7w626OrTpuhEg80iKIzyItpatC45iz7eCvkiTNbIRKCiCd1whm9hwJATW6yHN
 oxGMFKDbzyZC/FLEl4TGJQyhs+imz/yfyAwRFe9//RtujaDlFYguFTrGIHJedaLddVNpUKR9
 ljjwDjWHDhAC/XKnFJp9Vrp3IcjhxjTQY8XCfi0++BnhHWVwWocDgBQUkG0ycRVkWa7UtNbb
 lUKo28g8vF0+0usQd3wGRa/pRZooyIhZjaZKMVigCnl90Yey13x6rQsJtKZVOEbiQ==
IronPort-HdrOrdr: A9a23:vrswS68cItU1BtG+VnZuk+AEI+orL9Y04lQ7vn2ZKCYlCfBw8v
 rEoB1173HJYVoqNU3I2urwXJVoOEm8yXct2+ks1NSZLWvbUQmTXflfBOLZqlWLJ8SZzJ856U
 4KScdD4bPLYWSSwvyKhzVQvuxQpuWv4eSDv8+b5XFoVARrY6Zr40NCDBqBGEEefngkOXN8Lu
 vk2vZ6
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Mar 2023 07:23:53 -0500
Received: by mail-qv1-f71.google.com with SMTP id
 w2-20020a0cc242000000b00583d8e55181so2829017qvh.23
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 04:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678451033;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v5TqgRYPnxyMBHt9w7fjGh7O9gbKhPwECB6peFfrq7U=;
 b=RKGOzmU1rPqOQEzC3OM1RzKUejJPkXDSF2TvYTkBk02kBEFtKPktDcLcd5PlbQcLKg
 cc1musdz8gIdDzz+Rcm+8Zpll/4JQ2mx6NQSCWM0EtsnTZd/QX0fOzf5mfor1o5tdKAU
 ExKBVxBLoVdtsyJA0eUOmolwsLkaKEqswTl4EG2hDH0wnKPI/m65A5hTrIMixO3u1n8J
 ad2tV+8mLJsLZvtm+rmADABcf+Dq9VFKD9fCwvyRwkFxKgE5AsR9ovBmqWAZ7CeFuc7r
 u6MwGVupN9TiIZ+tRCEzMtWBbz0lXtqD/PPVwKnu84H7kT0Qr1tur6kbBD9CwB/9fEvf
 1A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678451033;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5TqgRYPnxyMBHt9w7fjGh7O9gbKhPwECB6peFfrq7U=;
 b=ghmEnO3nPULH6Jev2uZ+dwNxsLIsxT1UsvfRLowjvznK5oRGpnpUEc5Q/VyzXIsipy
 kjfgfwCFrv5zKmMF3VSwFwb2seynXdCOnVcSiFzClfJfNfsgeonYh46IJHTlxc4Ni6uR
 cqogRFQAjvCO6TKIaCQX9mPZ2PlMsPnCaJOR4itBObOLFYstBoeKFdYcVvW6vXB7Kptu
 9S/v/Ma8QWeAWSZbgXPANp+r79b1rW1FK/XRZkaEjduPpoPiMnh1x3DCjC/WFAh/ZJuG
 RFV0hjfUvBXxajRgJcy1SIlBfZTvgu+8t6Jik5zq+namzA/rqAkSEq4vTBgcDKra6zkx
 XQAA==
X-Gm-Message-State: AO0yUKXf4X6neKNb9qzlOlaBzeApAdln0f3tluBBHngg7gBeuRjvnB1p
 gyzjNFKPxsTuEPiHbth8wFahS34do1q9zK5cx4vYiO03dPh0F2AVueK26+wP5P1WPgfQ/SPVAbE
 ndOOvQZAULrFd1PRK6TEHK25418gm1Q==
X-Received: by 2002:a05:622a:15ce:b0:3b8:6442:2575 with SMTP id
 d14-20020a05622a15ce00b003b864422575mr43379620qty.49.1678451032937; 
 Fri, 10 Mar 2023 04:23:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+C+IY280+YmK86jRfrI2dSFawGdFUFvnUvZOwASm7Q+vFJFZclKqMHXkYzekSy3JaakwxpFQ==
X-Received: by 2002:a05:622a:15ce:b0:3b8:6442:2575 with SMTP id
 d14-20020a05622a15ce00b003b864422575mr43379587qty.49.1678451032578; 
 Fri, 10 Mar 2023 04:23:52 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 he4-20020a05622a600400b003b646123691sm1285478qtb.31.2023.03.10.04.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 04:23:52 -0800 (PST)
Date: Fri, 10 Mar 2023 07:23:47 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v6 1/4] memory: prevent dma-reentracy issues
Message-ID: <20230310122347.hghmijad7wajiqne@mozz.bu.edu>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-2-alxndr@bu.edu>
 <9cfa0cc8-01c7-cf79-72ef-3224d1276e16@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cfa0cc8-01c7-cf79-72ef-3224d1276e16@proxmox.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230310 1214, Fiona Ebner wrote:
> Am 05.02.23 um 05:07 schrieb Alexander Bulekov:
> > Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> > This flag is set/checked prior to calling a device's MemoryRegion
> > handlers, and set when device code initiates DMA.  The purpose of this
> > flag is to prevent two types of DMA-based reentrancy issues:
> > 
> > 1.) mmio -> dma -> mmio case
> > 2.) bh -> dma write -> mmio case
> > 
> > These issues have led to problems such as stack-exhaustion and
> > use-after-frees.
> > 
> > Summary of the problem from Peter Maydell:
> > https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> > 
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> > 
> > Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > Acked-by: Peter Xu <peterx@redhat.com>
> > ---
> >  include/hw/qdev-core.h |  7 +++++++
> >  softmmu/memory.c       | 17 +++++++++++++++++
> >  softmmu/trace-events   |  1 +
> >  3 files changed, 25 insertions(+)
> > 
> Hi,
> there seems to be an issue with this patch or existing issue exposed by
> this patch in combination with the LSI SCSI controller.
> 
> After applying this patch on current master (i.e.
> ee59483267de29056b5b2ee2421ef3844e5c9932), a Debian 11 with the LSI
> controller would not boot properly anymore:
> > [    7.540907] sym0: <895a> rev 0x0 at pci 0000:00:05.0 irq 10
> > [    7.546028] sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
> > [    7.559724] sym0: SCSI BUS has been reset.
> > [    7.560820] sym0: interrupted SCRIPT address not found.
> > [    7.563802] scsi host2: sym-2.2.3
> > [    7.881111] e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
> > [    7.881998] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
> > [    7.925902] e1000 0000:00:03.0 ens3: renamed from eth0
> > [   32.654811] scsi 2:0:0:0: tag#192 ABORT operation started
> > [   37.764283] scsi 2:0:0:0: ABORT operation timed-out.
> > [   37.774974] scsi 2:0:0:0: tag#192 DEVICE RESET operation started
> > [   42.882488] scsi 2:0:0:0: DEVICE RESET operation timed-out.
> > [   42.883606] scsi 2:0:0:0: tag#192 BUS RESET operation started
> > [   48.002437] scsi 2:0:0:0: BUS RESET operation timed-out.
> > [   48.003030] scsi 2:0:0:0: tag#192 HOST RESET operation started
> > [   48.010226] sym0: SCSI BUS has been reset.
> > [   53.122472] scsi 2:0:0:0: HOST RESET operation timed-out.
> > [   53.123030] scsi 2:0:0:0: Device offlined - not ready after error recovery
> 
> The commandline I used is:
> ./qemu-system-x86_64 \
>    -cpu 'kvm64' \
>    -m 4096 \
>    -serial 'stdio' \
>    -device 'lsi,id=scsihw0,bus=pci.0,addr=0x5' \
>    -drive
> 'file=/dev/zvol/myzpool/vm-9006-disk-0,if=none,id=drive-scsi0,format=raw' \
>    -device
> 'scsi-hd,bus=scsihw0.0,scsi-id=0,drive=drive-scsi0,id=scsi0,bootindex=100' \
>    -machine 'pc'
> 
> Happy to provide any more information if necessary!
> 
> CC-ing Fam Zheng (reviewer:SCSI)
> 
> Originally reported by one of our community members:
> https://forum.proxmox.com/threads/123843/
> 
> Best Regards,
> Fiona
> 

Thanks, I confirmed this by booting up a livecd iso with an lsi device
attached.  I will do some digging

Stack-trace:

#0  trace_memory_region_reentrant_io (cpu_index=<optimized out>, mr=<optimized out>, offset=<optimized out>, size=<optimized out>) at trace/trace-softmmu.h:337
#1  0x000055555815ce67 in access_with_adjusted_size (addr=addr@entry=0x1000, value=0x7ffef01fb980, size=size@entry=0x4, access_size_min=0x1, access_size_min@entry=0x0, access_size_max=0x4, access_fn=0x555558181370 <memory_region_read_accessor>, mr=0x627000000c50, attrs=...
) at ../softmmu/memory.c:552
#2  0x000055555815aec7 in memory_region_dispatch_read1 (mr=0x627000000c50, addr=0x1000, pval=<optimized out>, size=0x4, attrs=...) at ../softmmu/memory.c:1448
#3  memory_region_dispatch_read (mr=0x627000000c50, addr=0x1000, pval=<optimized out>, op=<optimized out>, attrs=...) at ../softmmu/memory.c:1475
#4  0x000055555819eb77 in flatview_read_continue (fv=<optimized out>, addr=0xfebf1000, attrs=..., ptr=<optimized out>, len=0x4, addr1=0x627000000c50, l=<optimized out>, mr=<optimized out>) at ../softmmu/physmem.c:2893
#5  0x000055555819f844 in flatview_read (fv=<optimized out>, addr=<optimized out>, attrs=..., buf=<optimized out>, len=<optimized out>) at ../softmmu/physmem.c:2935
#6  0x000055555819f554 in address_space_read_full (as=<optimized out>, addr=0xfebf1000, attrs=..., buf=0x7ffef01fd800, len=0x4) at ../softmmu/physmem.c:2948
#7  0x00005555575475ab in dma_memory_rw_relaxed (as=0x0, len=0x4, dir=DMA_DIRECTION_TO_DEVICE, attrs=..., addr=<optimized out>, buf=<optimized out>) at include/sysemu/dma.h:87
#8  dma_memory_rw (as=0x0, len=0x4, dir=DMA_DIRECTION_TO_DEVICE, attrs=..., addr=<optimized out>, buf=<optimized out>) at include/sysemu/dma.h:130
#9  pci_dma_rw (dev=<optimized out>, addr=0xfebf1000, len=0x4, dir=DMA_DIRECTION_TO_DEVICE, attrs=..., buf=<optimized out>) at include/hw/pci/pci_device.h:233
#10 pci_dma_read (dev=<optimized out>, addr=0xfebf1000, len=0x4, buf=<optimized out>) at include/hw/pci/pci_device.h:252
#11 read_dword (s=0x627000000100, addr=<optimized out>) at ../hw/scsi/lsi53c895a.c:472
#12 lsi_execute_script (s=s@entry=0x627000000100) at ../hw/scsi/lsi53c895a.c:1155
#13 0x0000555557540c67 in lsi_reg_writeb (s=<optimized out>, offset=<optimized out>, val=<optimized out>) at ../hw/scsi/lsi53c895a.c:2005
#14 0x000055555815d232 in memory_region_write_accessor (mr=<optimized out>, addr=<optimized out>, value=<optimized out>, size=<optimized out>, shift=<optimized out>, mask=<optimized out>, attrs=...) at ../softmmu/memory.c:493
#15 0x000055555815cbfb in access_with_adjusted_size (addr=0x2c, value=value@entry=0x7ffef01fdba0, size=size@entry=0x4, access_size_min=<optimized out>, access_size_min@entry=0x1, access_size_max=<optimized out>, access_fn=0x55555815cef0 <memory_region_write_accessor>, mr=0
x627000000b40, attrs=...) at ../softmmu/memory.c:569
#16 0x000055555815c134 in memory_region_dispatch_write (mr=0x627000000b40, addr=<optimized out>, data=<optimized out>, op=<optimized out>, attrs=...) at ../softmmu/memory.c:1539
#17 0x00005555581a87b1 in flatview_write_continue (fv=<optimized out>, addr=0xfebf302c, attrs=..., ptr=<optimized out>, len=0x4, addr1=0x627000000c50, l=<optimized out>, mr=<optimized out>) at ../softmmu/physmem.c:2826
#18 0x000055555819fdc4 in flatview_write (fv=<optimized out>, addr=<optimized out>, attrs=..., buf=<optimized out>, len=<optimized out>) at ../softmmu/physmem.c:2868
#19 0x000055555819fad4 in address_space_write (as=<optimized out>, addr=0xfebf302c, attrs=..., buf=0x7ffff3e16028, len=0x4) at ../softmmu/physmem.c:2964
#20 0x00005555584078dc in kvm_cpu_exec (cpu=cpu@entry=0x629000019200) at ../accel/kvm/kvm-all.c:2980
#21 0x0000555558421d64 in kvm_vcpu_thread_fn (arg=0x629000019200) at ../accel/kvm/kvm-accel-ops.c:51
#22 0x0000555558a5a279 in qemu_thread_start (args=0x60300008a6d0) at ../util/qemu-thread-posix.c:512
#23 0x00007ffff66a7fd4 in start_thread (arg=<optimized out>) at ./nptl/pthread_create.c:442
#24 0x00007ffff672866c in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81


