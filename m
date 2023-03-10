Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1286B3F32
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 13:32:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pabuF-00022y-QR; Fri, 10 Mar 2023 07:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pabuD-00022g-JA
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 07:31:29 -0500
Received: from esa1.hc2706-39.iphmx.com ([68.232.153.39])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pabuA-0000o4-UH
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 07:31:29 -0500
X-IronPort-RemoteIP: 209.85.160.199
X-IronPort-MID: 265917196
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w/LyUKpcN2BZNj85UfrA5LN2TQpeBmKmZxIvgKrLsJaIsI4StFCzt
 garIBmFMv3bMTSmeI8nYNzloENVvMDUmIU1T1dr/CgzRSlD8ZacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPKgT5TcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwx7lGAHtvx
 NkhJQtXbz/crtK5mOyQY7w57igjBJGD0II3v3hhyXTAEa9jT8mSEuPF4thX2Dp2jcdLdRrcT
 5BBOHw/MVKZPUUJYwZGYH49tL7Aan3XejlIrl6PjaAqpWXf0WSd1ZC3boeEI4PTFJs9ckCwr
 TLWwlvoBTwhac3Fkheh9Eu0nuPSpHauMG4VPPjinhJwu3WKy2kOTREbS1a/if++jEG4RpRYM
 UN8x8Y1ha079UjuV8WkGhPh8S/CsRkbVN5dVeY97Wlh15bp3upQPUBcJhYpVTDsnJReqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:t4NhsaoP27pm71aVRklohLcaV5r9eYIsimQD101hICG9vPbo8P
 xGuM5rqCMc6QxhIk3I/OrrBEDuewK/yXcY2/h1AV7mZnibhILKFvAY0WKB+UyYJ8SWzIc0vt
 YCT0E9MqyJMbETt6bHCWKDYrAdKbe8gcSVrNab5VtWCS9RV4FcwzFQNju7e3cGOzWuxqBUKH
 Nf3Kd6TvabF0j/p/7VZ0U4Yw==
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Mar 2023 07:31:23 -0500
Received: by mail-qt1-f199.google.com with SMTP id
 g11-20020ac8774b000000b003bfa92f56cbso2802737qtu.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 04:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678451482;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9x3M5JIhh+PSj5cPOoOnA8Q/jvOkGIyp1a3/FlT6co0=;
 b=Z7he/mWzTmZSvTC5+fUg7835VxGIsJbodtJjKEpBcCHdZYAaZG6VrQG21nJkBQwJNg
 T6395Fyw0P4qGetWNzilYZuz79R8O8RrYLFIXDflyNgCh209GrO2VF9XH4PcEGo9N7cp
 X39seQnVc5jg+lq9SUcOGgiTPk9lqCL3zfvKQf9fi280edvW0bT1nOFK0wJS+38tL/pT
 XmEA9qoU58U3aBV5abXLeDcfORj1f4CT3+dQ3Qsba6lHbtQE5z1/t/agg2IdjltR8gOd
 SnvG8dew4W7Dv8yPYqURGhXFhRTKKIqK1kk6YzaXTa/ix9LA6B+fhCsuMAoR5YOEtffd
 UZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678451482;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9x3M5JIhh+PSj5cPOoOnA8Q/jvOkGIyp1a3/FlT6co0=;
 b=5haSAfaHjPX+iR2x67urcBioSI/XEasjh5Z6uSQwwNOqM33WiBJDEtvo3vsAo0nzhh
 htJvKiVtW0MDb6bxpk4c/jCyc6L4FT79AiJ5vh0+e+fRnD6PaPXLg9Td888BoueVObBK
 G5KA0IjG8vJN3ydpGhcCIq+hApxPOMBg6+KrC0GgAyepp3KI3DXgeIvTlb9GhxM3lm8K
 WBjG7/WJ5gUG73tBundeF1bwnwrj+OWQn8489Vs8oDYARyBtpChVh9Nu2U0WxULqeIGm
 Fk09RiBz6U+da2eF50nxl4XgnoH3j/063i3lKSqOhouHIZewee/eyKqmLYvMi+G7m+VM
 Wj4w==
X-Gm-Message-State: AO0yUKVrcCZ52986SFBDHoqsyUSACdVeVVFTIeRhuWs6ZkIQdsXOM+3k
 znTB/Mbo98TVBUWrTVsvl4JPEBcIsQDrfZ1R0OfmZgYHD4YhAt1N9IuLq9HTiNVO5JwTYrDzwbU
 ybOlrKXDXuD/S338a4nydiUkb6+q4MA==
X-Received: by 2002:a05:622a:296:b0:3b8:2ce4:3e9 with SMTP id
 z22-20020a05622a029600b003b82ce403e9mr11099183qtw.32.1678451482396; 
 Fri, 10 Mar 2023 04:31:22 -0800 (PST)
X-Google-Smtp-Source: AK7set91q4vFkNfFkrFR8/l2+gg6BsUKgI4lEDvr9IIiZovQmPYQcuQsa/cUqjcjxgmWLL98zwN8cw==
X-Received: by 2002:a05:622a:296:b0:3b8:2ce4:3e9 with SMTP id
 z22-20020a05622a029600b003b82ce403e9mr11099131qtw.32.1678451482064; 
 Fri, 10 Mar 2023 04:31:22 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 n16-20020ac81e10000000b003b9a73cd120sm1333209qtl.17.2023.03.10.04.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 04:31:21 -0800 (PST)
Date: Fri, 10 Mar 2023 07:31:17 -0500
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
Message-ID: <20230310123117.d2uxze7zqtigmg44@mozz.bu.edu>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-2-alxndr@bu.edu>
 <9cfa0cc8-01c7-cf79-72ef-3224d1276e16@proxmox.com>
 <20230310122347.hghmijad7wajiqne@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310122347.hghmijad7wajiqne@mozz.bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.153.39; envelope-from=alxndr@bu.edu;
 helo=esa1.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_LOW=-0.7,
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

On 230310 0723, Alexander Bulekov wrote:
> On 230310 1214, Fiona Ebner wrote:
> > Am 05.02.23 um 05:07 schrieb Alexander Bulekov:
> > > Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> > > This flag is set/checked prior to calling a device's MemoryRegion
> > > handlers, and set when device code initiates DMA.  The purpose of this
> > > flag is to prevent two types of DMA-based reentrancy issues:
> > > 
> > > 1.) mmio -> dma -> mmio case
> > > 2.) bh -> dma write -> mmio case
> > > 
> > > These issues have led to problems such as stack-exhaustion and
> > > use-after-frees.
> > > 
> > > Summary of the problem from Peter Maydell:
> > > https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> > > 
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> > > 
> > > Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > > Acked-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  include/hw/qdev-core.h |  7 +++++++
> > >  softmmu/memory.c       | 17 +++++++++++++++++
> > >  softmmu/trace-events   |  1 +
> > >  3 files changed, 25 insertions(+)
> > > 
> > Hi,
> > there seems to be an issue with this patch or existing issue exposed by
> > this patch in combination with the LSI SCSI controller.
> > 
> > After applying this patch on current master (i.e.
> > ee59483267de29056b5b2ee2421ef3844e5c9932), a Debian 11 with the LSI
> > controller would not boot properly anymore:
> > > [    7.540907] sym0: <895a> rev 0x0 at pci 0000:00:05.0 irq 10
> > > [    7.546028] sym0: No NVRAM, ID 7, Fast-40, LVD, parity checking
> > > [    7.559724] sym0: SCSI BUS has been reset.
> > > [    7.560820] sym0: interrupted SCRIPT address not found.
> > > [    7.563802] scsi host2: sym-2.2.3
> > > [    7.881111] e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
> > > [    7.881998] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
> > > [    7.925902] e1000 0000:00:03.0 ens3: renamed from eth0
> > > [   32.654811] scsi 2:0:0:0: tag#192 ABORT operation started
> > > [   37.764283] scsi 2:0:0:0: ABORT operation timed-out.
> > > [   37.774974] scsi 2:0:0:0: tag#192 DEVICE RESET operation started
> > > [   42.882488] scsi 2:0:0:0: DEVICE RESET operation timed-out.
> > > [   42.883606] scsi 2:0:0:0: tag#192 BUS RESET operation started
> > > [   48.002437] scsi 2:0:0:0: BUS RESET operation timed-out.
> > > [   48.003030] scsi 2:0:0:0: tag#192 HOST RESET operation started
> > > [   48.010226] sym0: SCSI BUS has been reset.
> > > [   53.122472] scsi 2:0:0:0: HOST RESET operation timed-out.
> > > [   53.123030] scsi 2:0:0:0: Device offlined - not ready after error recovery
> > 
> > The commandline I used is:
> > ./qemu-system-x86_64 \
> >    -cpu 'kvm64' \
> >    -m 4096 \
> >    -serial 'stdio' \
> >    -device 'lsi,id=scsihw0,bus=pci.0,addr=0x5' \
> >    -drive
> > 'file=/dev/zvol/myzpool/vm-9006-disk-0,if=none,id=drive-scsi0,format=raw' \
> >    -device
> > 'scsi-hd,bus=scsihw0.0,scsi-id=0,drive=drive-scsi0,id=scsi0,bootindex=100' \
> >    -machine 'pc'
> > 
> > Happy to provide any more information if necessary!
> > 
> > CC-ing Fam Zheng (reviewer:SCSI)
> > 
> > Originally reported by one of our community members:
> > https://forum.proxmox.com/threads/123843/
> > 
> > Best Regards,
> > Fiona
> > 
> 
> Thanks, I confirmed this by booting up a livecd iso with an lsi device
> attached.  I will do some digging
> 
> Stack-trace:
> 
> #0  trace_memory_region_reentrant_io (cpu_index=<optimized out>, mr=<optimized out>, offset=<optimized out>, size=<optimized out>) at trace/trace-softmmu.h:337
> #1  0x000055555815ce67 in access_with_adjusted_size (addr=addr@entry=0x1000, value=0x7ffef01fb980, size=size@entry=0x4, access_size_min=0x1, access_size_min@entry=0x0, access_size_max=0x4, access_fn=0x555558181370 <memory_region_read_accessor>, mr=0x627000000c50, attrs=...
> ) at ../softmmu/memory.c:552
> #2  0x000055555815aec7 in memory_region_dispatch_read1 (mr=0x627000000c50, addr=0x1000, pval=<optimized out>, size=0x4, attrs=...) at ../softmmu/memory.c:1448

This MR seems to be "lsi-ram".

From hw/scsi/lsi53c895a.c:

memory_region_init_io(&s->ram_io, OBJECT(s), &lsi_ram_ops, s,
        "lsi-ram", 0x2000);                    

So the LSI device is reading an LSI "Script" from its own IO region.. In
this particular case, I think there was no reason to use
memory_region_init_io rather than memory_region_init_ram, but this makes
me worried that there are other devices that use something like this.

-Alex

