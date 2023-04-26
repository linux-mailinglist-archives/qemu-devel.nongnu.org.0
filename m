Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7510B6EF81C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:07:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhf0-0004MW-73; Wed, 26 Apr 2023 12:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhey-0004M1-85
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:06:24 -0400
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhet-0002ui-PO
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:06:24 -0400
X-IronPort-RemoteIP: 209.85.160.199
X-IronPort-MID: 276143740
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:czqkhq0frWQdXLA1EPbD5Wtzkn2cJEfYwER7XKvMYLTBsI5bp2cGm
 GsZUW+CP6qPYmX3ctpwYIzl9E9VvMWAzYdkHFZsqSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv666yE6jfrSLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglYwr414rZ8Ek05Kio5mtC1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1qI2ckZK0T69wsHDpA+
 OQ3KzwNZw+60rfeLLKTEoGAh+wmJcjveZoD4zRulGCIS/khRp/HTuPB4towMDUY3JgfW6aDI
 ZNHMXw2PUWojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKMklUti+exaLI5fPSqd+N2gByYr
 VvU7mijB0E1Gd/A9jaspyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m83sfF3+hX6H5/yWBq3pHPCtRkZMzZNL9AHBMi24vK8y26k6qIsEGUQADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:nDC4v61H0ujEgB3DqaaNDQqjBL8kLtp133Aq2lEZdPU1SKKlfq
 WV9sjzuiWatN98YgBEpTn4AtjlfZuYmKQFgrX5Xo3CYOCFggeVxehZhOPfKlbbak/DH4BmuJ
 uII5IUNDWcZ2IbsfrH
X-Talos-CUID: 9a23:fGeXW27ucshxZ0BrWtss8GEyCJkFeWznl2qLLUKgJmVlSLSKcArF
X-Talos-MUID: 9a23://cybwk2XCmZfXrw8LEYdnpCBuFL/f6uA3kfgJlcvpmrGC8vBDu02WE=
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 12:03:33 -0400
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3f0aa5fef57so18114101cf.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682525012; x=1685117012;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LTB45B1COD2kGWqMZMHyoJJkmOOu5ak+HZhaYBF94xA=;
 b=C2IERh2AQK/Go4gze4UQXcKhdcgN2tmPdbTy7hiMNVn45oRv6Go3VMkLA5KY9EgeWc
 cpRmqS244nWDs9HXembSgYYt83uEOFnSPbtLgUYm48cOhKb+unDVXIzZVGJXc90+Rofa
 p3b8qUfjt8rQk1LzpsIPlBCtVr421Gfvx2UW09k5E8hxvmjHU9OzSJg3TMUT70djMEhJ
 QAYELFKMytEOwkkfQF07xGoSBb0uMyd/uD7o3Dny/MJFNtDQXGTYSyRms2rl+MkQ2+Wy
 uwriV0duk90LTkTLH1bjLO2s66PRy2P2l6kH0xxiBdNWeeZ1ztZHKcQ+lYjnvW/JVV4r
 37Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682525012; x=1685117012;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LTB45B1COD2kGWqMZMHyoJJkmOOu5ak+HZhaYBF94xA=;
 b=SdZbX8JwBtTRgmXNjLr3iWq5CfJRQuTjKEsr/ptoF8b/wm7LFgwH71X4bFFk96FzOg
 yZ3IA3a0nI/qrQ+fxoRdJG673rPLOam1NCMpQI/o4UwSyVIveZfPjBvmejNvAJhydwDD
 7XWznT3RYCASJXu+mmaZNH28QR+ADp7tKh/x6MeTzU9WL50mCQrHQqjuFXENDxjHVcCf
 l/r9KWKLvhx3SnTDkZsGvtIn4BClDpXtDDQwht6Ft1wMmFjQKkxMaFMVelAwq3ZKh9XR
 6PGnHSRkcnL4mD8TEYrvyWntzuR0kyGT/6YM4JAMEs33Gi+SiuVqBwxjoO/dtIF6b82S
 H+fw==
X-Gm-Message-State: AAQBX9cO3ZXllJZjhE/FwnVD+VWFhH6Iv+rzz6NaVPBTExT96zvV4KnC
 0Mz4gSkDUUh8oQxXN1QlXRpQIt9tzUUpyHIQmRESX0I3B0kCS228/vSFfkoX3eo0Ob7IInwsEL8
 KwfFGvQUYY5pgzhMdqqWL3Xo4IE711A==
X-Received: by 2002:a05:622a:1b8c:b0:3e6:938a:2aef with SMTP id
 bp12-20020a05622a1b8c00b003e6938a2aefmr32130720qtb.9.1682525012327; 
 Wed, 26 Apr 2023 09:03:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YHOU4SZHvy/FssaZvhPQ5KZOGqGLC7NBSEY2PG4lkw8+c7iaP6TxTnUZ07ZbGXxNcsjQuT6Q==
X-Received: by 2002:a05:622a:1b8c:b0:3e6:938a:2aef with SMTP id
 bp12-20020a05622a1b8c00b003e6938a2aefmr32130669qtb.9.1682525011896; 
 Wed, 26 Apr 2023 09:03:31 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 o16-20020ac872d0000000b003ef5ba0702fsm4670480qtp.7.2023.04.26.09.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:03:31 -0700 (PDT)
Date: Wed, 26 Apr 2023 12:03:27 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v8 0/8] memory: prevent dma-reentracy issues
Message-ID: <20230426160327.vptzremnm2dhua3j@mozz.bu.edu>
References: <20230421142736.2817601-1-alxndr@bu.edu>
 <a8d076f3-ac2b-4e1a-8bcc-44bf57a750b2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8d076f3-ac2b-4e1a-8bcc-44bf57a750b2@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230425 1146, Thomas Huth wrote:
> On 21/04/2023 16.27, Alexander Bulekov wrote:
> > v7 -> v8:
> >      - Disable reentrancy checks for bcm2835_property's iomem (Patch 7)
> >      - Cache DeviceState* in the MemoryRegion to avoid dynamic cast for
> >        each MemoryRegion access. (Patch 1)
> >      - Make re-entrancy fatal for debug-builds (Patch 8)
> 
>  Hi Alexander,
> 
> I just put your series into a run with the gitlab-CI and it seems this now
> introduced another failure in one of the avocado tests:
> 
>  https://gitlab.com/thuth/qemu/-/jobs/4171448248#L318
> 
> The "IbmPrep40pMachine.test_openbios_and_netbsd" test is failing now.
> 
> You can reproduce it manually quite easily:
> 
>  wget https://archive.netbsd.org/pub/NetBSD-archive/NetBSD-7.1.2/iso/NetBSD-7.1.2-prep.iso
> 
>  ./qemu-system-ppc -nographic -M 40p -boot d -cdrom NetBSD-7.1.2-prep.iso
> 
> Without your patches, this prints out "NetBSD/prep BOOT, Revision 1.9" in
> the console, but with your patches, the message does not appear anymore.

#0  trace_memory_region_reentrant_io  at trace/trace-softmmu.h:335
#1  0x0000555555f3f315 in access_with_adjusted_size  at ../softmmu/memory.c:549
#2  0x0000555555f3f0f6 in memory_region_dispatch_write  at ../softmmu/memory.c:1531
#3  0x0000555555f4e655 in flatview_write_continue  at ../softmmu/physmem.c:2641
#4  0x0000555555f4b30e in flatview_write  at ../softmmu/physmem.c:2683
#5  0x0000555555f4b119 in address_space_write  at ../softmmu/physmem.c:2779
#6  0x0000555555c5a233 in raven_io_write  at ../hw/pci-host/raven.c:194
#7  0x0000555555f3f409 in memory_region_write_accessor  at ../softmmu/memory.c:493
#8  0x0000555555f3f22b in access_with_adjusted_size  at ../softmmu/memory.c:568
#9  0x0000555555f3f0f6 in memory_region_dispatch_write  at ../softmmu/memory.c:1531
#10 0x0000555555fcf74b in io_writex  at ../accel/tcg/cputlb.c:1430
#11 0x0000555555fc33dd in store_helper  at ../accel/tcg/cputlb.c:2454
#12 full_le_stl_mmu  at ../accel/tcg/cputlb.c:2542
#13 0x00007fffa404b78c in code_gen_buffer                                      
#14 0x0000555555fa510d in cpu_tb_exec  at ../accel/tcg/cpu-exec.c:460
#15 0x0000555555fa5ec0 in cpu_loop_exec_tb  at ../accel/tcg/cpu-exec.c:893
#16 cpu_exec_loop  at ../accel/tcg/cpu-exec.c:1013
#17 0x0000555555fa5697 in cpu_exec_setjmp  at ../accel/tcg/cpu-exec.c:1043
#18 0x0000555555fa558e in cpu_exec  at ../accel/tcg/cpu-exec.c:1069
#19 0x0000555555fd1f8f in tcg_cpus_exec  at ../accel/tcg/tcg-accel-ops.c:81
#20 0x0000555555fd2c16 in rr_cpu_thread_fn  at ../accel/tcg/tcg-accel-ops-rr.c:223
#21 0x0000555556156465 in qemu_thread_start  at ../util/qemu-thread-posix.c:541
#22 0x00007ffff6960fd4 in start_thread  at ./nptl/pthread_create.c:442
#23 0x00007ffff69e166c in clone3  at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81
gef➤  p ->name
$4 = 0x555557615bd0 "pci-conf-idx"

Raven owns both the ravio_io MR and the pci-conf MRs. raven_io needs to
be marked re-entrancy safe.

