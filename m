Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2B696310
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 13:06:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRu3b-0004UH-6f; Tue, 14 Feb 2023 07:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <majosaheb@gmail.com>)
 id 1pRu3P-0004Rp-Mg
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:05:01 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <majosaheb@gmail.com>)
 id 1pRu3J-0006YF-7V
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:04:57 -0500
Received: by mail-wm1-x330.google.com with SMTP id n33so4803182wms.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 04:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TZlje+RPdT4CaMTPum42nYsPGqzZ8frDaEpMq4WBN4U=;
 b=F5SLs14ALCzvSi0o/EALZj65PwMuzzgJQ2+AZYBDRU5URi5BNSTukwJ542kQpIDJaY
 wZAPoR5S1gUDmP2rbQN1GP0Nanxqhc+0DXbO1zDaCSzWQ1C1Noej7uXr2Mv1jQcIfTqh
 jBFRCxFmQKvxR7Hj6SC/cXZyMCygKkHbo9LDdTVWKLYb7OElXP+Z1LcTMv3I5ZJEWUkp
 N/wDZoeIYSQHu1ncPvvxQ637doXiGbQSyRUt/YFy8brlE2gCbumVceWU7n+AmZCVtPPL
 DZ0Sgc5eEi2cZkxTndvpkA1BM4Hki5pUulAb6s8B4g/nQFXE7o1KKVeUCEMcX8EsMre1
 TPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TZlje+RPdT4CaMTPum42nYsPGqzZ8frDaEpMq4WBN4U=;
 b=n6ona5UR+y+os+AeGKeewBANhX6KKLZ59W7S1PvH2g7ekz8QivwM2Ig9zUSg92Q2W+
 8bfbLaxnkcDOaJHd721ppelmBfAEB4kWUdrepzVEpG9oT+SZEY9esq+ixViufg9MIitj
 Ge+a62clQcLhRHbTQ96yfggdzy98A4Oa7lydslH3SNS6/iZRy3F7K5Kizm+rHn6enkx9
 tQ0eYlxJlTQNQZXqpqOU6cCTT25WLMJtodZsZuZB7Rb940noj4BJND/bOyUPFFhHMUrW
 NYxwRKumFkGrJiK++JrYHbs+PAxBU9W1haY+30DMuvVeBgyQycwzSei2P8xj86o+SnLR
 ZGMQ==
X-Gm-Message-State: AO0yUKX9VPTI5t4pMYhJdYP7x6i+A1lOquqr4epkxovYHoN2n2qmZGlF
 NJNoaFoRbeiJfDS+3EsS0BD4hT85HM26ywm2oFY=
X-Google-Smtp-Source: AK7set/D5Z6E2TcSJ0lFncuwD/ty2HivIw4OOv7OFOCqOAoYp4dEvMhX2RGrs9BKAl1z2ZXZ5EXZf/qAxhOPt7KKBN8=
X-Received: by 2002:a05:600c:a0e:b0:3dd:1c4a:8a28 with SMTP id
 z14-20020a05600c0a0e00b003dd1c4a8a28mr156140wmp.40.1676376283491; Tue, 14 Feb
 2023 04:04:43 -0800 (PST)
MIME-Version: 1.0
References: <CANBBZXMpWOj5fE2YF8XGvWmBtbc=9YKiMCSfUKC7AoP5Ros9QA@mail.gmail.com>
 <Y+q3+eXdYz0qOtDT@x1n>
In-Reply-To: <Y+q3+eXdYz0qOtDT@x1n>
From: Major Saheb <majosaheb@gmail.com>
Date: Tue, 14 Feb 2023 17:34:32 +0530
Message-ID: <CANBBZXOtEF6Ao+Nxznf6dGOSTMX3F7iJvfOiWWngs79Bjy_YEQ@mail.gmail.com>
Subject: Re: DMAR fault with qemu 7.2 and Ubuntu 22.04 base image
To: Peter Xu <peterx@redhat.com>, k.jensen@samsung.com, philmd@linaro.org, 
 armbru@redhat.com, mst@redhat.com, lukasz.gieryk@linux.intel.com
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, 
 Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=majosaheb@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 LOTS_OF_MONEY=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Thanks Peter for the reply. I tried to connect gdb to qemu and able to
break 'vtd_iova_to_slpte()', I dumped the following with both Ubuntu
20.04 base image container which is the success case and Ubuntu 22.04
base image container which is failure case
One thing I observed is the NvmeSQueue::dma_addr is correctly set to
'0x800000000', however in failure case this value is 0x1196b1000. A
closer look indicates more fields in NvmeSQueue might be corrupted,
for example we are setting admin queue size as 512 but in failure case
it is showing 32.

Ubuntu 22.04 base image (failure case)
===================================
(gdb) bt
#0  vtd_iova_to_slpte (pasid=4294967295, aw_bits=<optimized out>,
writes=<synthetic pointer>, reads=<synthetic pointer>,
slpte_level=<synthetic pointer>, slptep=<synthetic pointer>,
is_write=<optimized out>, iova=4721414144, ce=0x7ffd791680c0,
s=<optimized out>) at ../hw/i386/intel_iommu.c:1086
#1  vtd_do_iommu_translate (entry=0x7ffd79168090, is_write=<optimized
out>, addr=4721414144, devfn=<optimized out>, bus=<optimized out>,
vtd_as=0x55873ec920f0) at ../hw/i386/intel_iommu.c:1942
#2  vtd_iommu_translate (iommu=0x55873ec92160, addr=4721414144,
flag=<optimized out>, iommu_idx=<optimized out>) at
../hw/i386/intel_iommu.c:3149
#3  0x0000558739bf24d1 in address_space_translate_iommu
(iommu_mr=0x55873ec92160, xlat=xlat@entry=0x7ffd791682c0,
plen_out=plen_out@entry=0x7ffd791682b8,
page_mask_out=page_mask_out@entry=0x0, is_write=is_write@entry=false,
is_mmio=true, target_as=0x7ffd791682c8, attrs=...) at
../softmmu/physmem.c:434
#4  0x0000558739bf28ba in flatview_do_translate
(addr=addr@entry=4721414144, xlat=xlat@entry=0x7ffd791682c0,
plen_out=plen_out@entry=0x7ffd791682b8,
page_mask_out=page_mask_out@entry=0x0, is_write=false, is_mmio=true,
target_as=0x7ffd791682c8, attrs=..., fv=<optimized out>, fv=<optimized
out>) at ../softmmu/physmem.c:507
#5  0x0000558739bf7bb3 in flatview_translate (attrs=...,
is_write=false, plen=0x7ffd791682b8, xlat=0x7ffd791682c0,
addr=4721414144, fv=0x7f8c38444300) at ../softmmu/physmem.c:567
#6  flatview_read (fv=0x7f8c38444300, addr=addr@entry=4721414144,
attrs=attrs@entry=..., buf=buf@entry=0x7ffd79168410, len=len@entry=64)
at ../softmmu/physmem.c:2930
#7  0x0000558739bf7f46 in address_space_read_full (len=64,
buf=0x7ffd79168410, attrs=..., addr=4721414144, as=0x55873f323618) at
../softmmu/physmem.c:2947
#8  address_space_rw (as=as@entry=0x55873f323618,
addr=addr@entry=4721414144, attrs=attrs@entry=...,
buf=buf@entry=0x7ffd79168410, len=len@entry=64,
is_write=is_write@entry=false) at ../softmmu/physmem.c:2975
#9  0x00005587399af9cc in dma_memory_rw_relaxed (attrs=...,
dir=DMA_DIRECTION_TO_DEVICE, len=64, buf=0x7ffd79168410,
addr=4721414144, as=0x55873f323618) at
/home/arka/qemu/include/sysemu/dma.h:87
#10 0x00005587399bb1a5 in nvme_process_sq (opaque=<optimized out>) at
../hw/nvme/ctrl.c:6256
#11 0x0000558739e03a34 in aio_bh_call (bh=0x7f8c380a8540) at ../util/async.c:150
#12 aio_bh_poll (ctx=ctx@entry=0x55873c3859f0) at ../util/async.c:178
#13 0x0000558739df0542 in aio_dispatch (ctx=0x55873c3859f0) at
../util/aio-posix.c:421
#14 0x0000558739e03672 in aio_ctx_dispatch (source=<optimized out>,
callback=<optimized out>, user_data=<optimized out>) at
../util/async.c:320
#15 0x00007f9487650d3b in g_main_context_dispatch () from
target:/lib/x86_64-linux-gnu/libglib-2.0.so.0
#16 0x0000558739e05cb0 in glib_pollfds_poll () at ../util/main-loop.c:297
#17 os_host_main_loop_wait (timeout=305962000000) at ../util/main-loop.c:320
#18 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:606
#19 0x0000558739a6c873 in qemu_main_loop () at ../softmmu/runstate.c:739
#20 0x0000558739c8599b in qemu_default_main () at ../softmmu/main.c:37
#21 0x00007f9486826d90 in __libc_start_call_main
(main=main@entry=0x5587398b6ac0 <main>, argc=argc@entry=205,
argv=argv@entry=0x7ffd79168988) at
../sysdeps/nptl/libc_start_call_main.h:58
#22 0x00007f9486826e40 in __libc_start_main_impl (main=0x5587398b6ac0
<main>, argc=205, argv=0x7ffd79168988, init=<optimized out>,
fini=<optimized out>, rtld_fini=<optimized out>,
stack_end=0x7ffd79168978) at ../csu/libc-start.c:392
#23 0x00005587398b8395 in _start ()
(gdb) f 11
#11 0x0000558739e03a34 in aio_bh_call (bh=0x7f8c380a8540) at ../util/async.c:150
150         bh->cb(bh->opaque);
(gdb) p bh->opaque
$5 = (void *) 0x55873f327d20
(gdb) f 10
#10 0x00005587399bb1a5 in nvme_process_sq (opaque=<optimized out>) at
../hw/nvme/ctrl.c:6256
6256            if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
(gdb) p *(NvmeSQueue*)0x55873f327d20
$6 = {
  ctrl = 0x55873f3233e0,
  sqid = 0,
  cqid = 0,
  head = 0,
  tail = 2,
  size = 32,
  dma_addr = 4721414144,
  db_addr = 4735401984,
  ei_addr = 4735397888,
  bh = 0x7f8c380a8540,
  notifier = {
    rfd = 0,
    wfd = 0,
    initialized = false
  },
  ioeventfd_enabled = false,
  io_req = 0x7f8c3848f560,
  req_list = {
    tqh_first = 0x7f8c3848f560,
    tqh_circ = {
      tql_next = 0x7f8c3848f560,
      tql_prev = 0x7f8c38490f50
    }
  },
  out_req_list = {
    tqh_first = 0x0,
    tqh_circ = {
      tql_next = 0x0,
      tql_prev = 0x55873f327d80
    }
  },
  entry = {
    tqe_next = 0x0,
    tqe_circ = {
      tql_next = 0x0,
      tql_prev = 0x55873f327df0
    }
  }
}
(gdb) p/x *(NvmeSQueue*)0x55873f327d20
$7 = {
  ctrl = 0x55873f3233e0,
  sqid = 0x0,
  cqid = 0x0,
  head = 0x0,
  tail = 0x2,
  size = 0x20,
  dma_addr = 0x1196b1000,
  db_addr = 0x11a408000,
  ei_addr = 0x11a407000,
  bh = 0x7f8c380a8540,
  notifier = {
    rfd = 0x0,
    wfd = 0x0,
    initialized = 0x0
  },
  ioeventfd_enabled = 0x0,
  io_req = 0x7f8c3848f560,
  req_list = {
    tqh_first = 0x7f8c3848f560,
    tqh_circ = {
      tql_next = 0x7f8c3848f560,
      tql_prev = 0x7f8c38490f50
    }
  },
  out_req_list = {
    tqh_first = 0x0,
    tqh_circ = {
      tql_next = 0x0,
      tql_prev = 0x55873f327d80
    }
  },
  entry = {
    tqe_next = 0x0,
    tqe_circ = {
      tql_next = 0x0,
      tql_prev = 0x55873f327df0
    }
  }
}

Ubuntu 20.04 base image (success case)
===================================
(gdb) bt
#0  vtd_iova_to_slpte (pasid=<optimized out>, aw_bits=<optimized out>,
writes=<optimized out>, reads=<optimized out>, slpte_level=<optimized
out>, slptep=<optimized out>, is_write=<optimized out>,
    iova=<optimized out>, ce=<optimized out>, s=<optimized out>) at
../hw/i386/intel_iommu.c:1052
#1  vtd_do_iommu_translate (entry=0x7ffe914e8e20, is_write=<optimized
out>, addr=34359738368, devfn=<optimized out>, bus=<optimized out>,
vtd_as=0x564b2d86a0f0) at ../hw/i386/intel_iommu.c:1943
#2  vtd_iommu_translate (iommu=0x564b2d86a160, addr=34359738368,
flag=<optimized out>, iommu_idx=<optimized out>) at
../hw/i386/intel_iommu.c:3150
#3  0x0000564b29ca74a1 in address_space_translate_iommu
(iommu_mr=0x564b2d86a160, xlat=xlat@entry=0x7ffe914e9050,
plen_out=plen_out@entry=0x7ffe914e9048,
page_mask_out=page_mask_out@entry=0x0,
    is_write=is_write@entry=false, is_mmio=true,
target_as=0x7ffe914e9058, attrs=...) at ../softmmu/physmem.c:434
#4  0x0000564b29ca788a in flatview_do_translate
(addr=addr@entry=34359738368, xlat=xlat@entry=0x7ffe914e9050,
plen_out=plen_out@entry=0x7ffe914e9048,
page_mask_out=page_mask_out@entry=0x0, is_write=false,
    is_mmio=true, target_as=0x7ffe914e9058, attrs=..., fv=<optimized
out>, fv=<optimized out>) at ../softmmu/physmem.c:507
#5  0x0000564b29cacb83 in flatview_translate (attrs=...,
is_write=false, plen=0x7ffe914e9048, xlat=0x7ffe914e9050,
addr=34359738368, fv=0x7f586c06b390) at ../softmmu/physmem.c:567
#6  flatview_read (fv=0x7f586c06b390, addr=addr@entry=34359738368,
attrs=attrs@entry=..., buf=buf@entry=0x7ffe914e91a0, len=len@entry=64)
at ../softmmu/physmem.c:2930
#7  0x0000564b29cacf16 in address_space_read_full (len=64,
buf=0x7ffe914e91a0, attrs=..., addr=34359738368, as=0x564b2defb618) at
../softmmu/physmem.c:2947
#8  address_space_rw (as=as@entry=0x564b2defb618,
addr=addr@entry=34359738368, attrs=attrs@entry=...,
buf=buf@entry=0x7ffe914e91a0, len=len@entry=64,
is_write=is_write@entry=false)
    at ../softmmu/physmem.c:2975
#9  0x0000564b29a649cc in dma_memory_rw_relaxed (attrs=...,
dir=DMA_DIRECTION_TO_DEVICE, len=64, buf=0x7ffe914e91a0,
addr=34359738368, as=0x564b2defb618) at
/home/arka/qemu/include/sysemu/dma.h:87
#10 0x0000564b29a701a5 in nvme_process_sq (opaque=<optimized out>) at
../hw/nvme/ctrl.c:6256
#11 0x0000564b29eb8a04 in aio_bh_call (bh=0x7f586c2816c0) at ../util/async.c:150
#12 aio_bh_poll (ctx=ctx@entry=0x564b2af5d9f0) at ../util/async.c:178
#13 0x0000564b29ea5512 in aio_dispatch (ctx=0x564b2af5d9f0) at
../util/aio-posix.c:421
#14 0x0000564b29eb8642 in aio_ctx_dispatch (source=<optimized out>,
callback=<optimized out>, user_data=<optimized out>) at
../util/async.c:320
#15 0x00007f609b078d3b in g_main_context_dispatch () from
target:/lib/x86_64-linux-gnu/libglib-2.0.so.0
#16 0x0000564b29ebac80 in glib_pollfds_poll () at ../util/main-loop.c:297
#17 os_host_main_loop_wait (timeout=120935000000) at ../util/main-loop.c:320
#18 main_loop_wait (nonblocking=nonblocking@entry=0) at ../util/main-loop.c:606
#19 0x0000564b29b21873 in qemu_main_loop () at ../softmmu/runstate.c:739
#20 0x0000564b29d3a96b in qemu_default_main () at ../softmmu/main.c:37
#21 0x00007f609a24ed90 in __libc_start_call_main
(main=main@entry=0x564b2996bac0 <main>, argc=argc@entry=205,
argv=argv@entry=0x7ffe914e9718) at
../sysdeps/nptl/libc_start_call_main.h:58
#22 0x00007f609a24ee40 in __libc_start_main_impl (main=0x564b2996bac0
<main>, argc=205, argv=0x7ffe914e9718, init=<optimized out>,
fini=<optimized out>, rtld_fini=<optimized out>,
stack_end=0x7ffe914e9708)
    at ../csu/libc-start.c:392
#23 0x0000564b2996d395 in _start ()
(gdb) p/x 34359738368
$1 = 0x800000000
(gdb) f 11
#11 0x0000564b29eb8a04 in aio_bh_call (bh=0x7f586c2816c0) at ../util/async.c:150
150         bh->cb(bh->opaque);
(gdb) p bh->opaque
$2 = (void *) 0x564b2deffd20
(gdb) set print pretty on
(gdb) set pagination off
(gdb) f 10
#10 0x0000564b29a701a5 in nvme_process_sq (opaque=<optimized out>) at
../hw/nvme/ctrl.c:6256
6256            if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
(gdb) p *(NvmeSQueue*)0x564b2deffd20
$3 = {
  ctrl = 0x564b2defb3e0,
  sqid = 0,
  cqid = 0,
  head = 0,
  tail = 1,
  size = 512,
  dma_addr = 34359738368,
  db_addr = 4736741376,
  ei_addr = 4736688128,
  bh = 0x7f586c2816c0,
  notifier = {
    rfd = 0,
    wfd = 0,
    initialized = false
  },
  ioeventfd_enabled = false,
  io_req = 0x7f586c35e650,
  req_list = {
    tqh_first = 0x7f586c35e650,
    tqh_circ = {
      tql_next = 0x7f586c35e650,
      tql_prev = 0x7f586c378640
    }
  },
  out_req_list = {
    tqh_first = 0x0,
    tqh_circ = {
      tql_next = 0x0,
      tql_prev = 0x564b2deffd80
    }
  },
  entry = {
    tqe_next = 0x0,
    tqe_circ = {
      tql_next = 0x0,
      tql_prev = 0x564b2deffdf0
    }
  }
}
(gdb) p/x *(NvmeSQueue*)0x564b2deffd20
$4 = {
  ctrl = 0x564b2defb3e0,
  sqid = 0x0,
  cqid = 0x0,
  head = 0x0,
  tail = 0x1,
  size = 0x200,
  dma_addr = 0x800000000,
  db_addr = 0x11a54f000,
  ei_addr = 0x11a542000,
  bh = 0x7f586c2816c0,
  notifier = {
    rfd = 0x0,
    wfd = 0x0,
    initialized = 0x0
  },
  ioeventfd_enabled = 0x0,
  io_req = 0x7f586c35e650,
  req_list = {
    tqh_first = 0x7f586c35e650,
    tqh_circ = {
      tql_next = 0x7f586c35e650,
      tql_prev = 0x7f586c378640
    }
  },
  out_req_list = {
    tqh_first = 0x0,
    tqh_circ = {
      tql_next = 0x0,
      tql_prev = 0x564b2deffd80
    }
  },
  entry = {
    tqe_next = 0x0,
    tqe_circ = {
      tql_next = 0x0,
      tql_prev = 0x564b2deffdf0
    }
  }
}

-R

On Tue, Feb 14, 2023 at 3:51 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Feb 13, 2023 at 10:15:34PM +0530, Major Saheb wrote:
> > Hi All,
>
> Hi, Major,
>
> >
> > I am facing an issue with qemu 7.2 rc2 with nvme. I have a container
>
> Is there any known working qemu version?  Or should I assume it's failing
> always?
>
> > running Ubuntu 22.04 base image and host is running Ubuntu 22.04
> > (Linux node-1 5.15.0-60-generic #66-Ubuntu SMP Fri Jan 20 14:29:49 UTC
> > 2023 x86_64 x86_64 x86_64 GNU/Linux), and I am using vfio-pci to
> > communicate with nvme devices. I am observing DMAR fault as following
> >
> > [ 3761.999996] DMAR: DRHD: handling fault status reg 2
> > [ 3762.001609] DMAR: [DMA Read NO_PASID] Request device [0b:00.0]
> > fault addr 0x1187a9000 [fault reason 0x06] PTE Read access is not set
> >
> > I also enabled vtd_iommu_translate and vtd_dmar_fault traces which is
> > showing the following
> >
> > 2023-02-13T07:02:37.074397Z qemu-system-x86_64: vtd_iova_to_slpte:
> > detected slpte permission error (iova=0x1187a9000, level=0x3,
> > slpte=0x0, write=0, pasid=0xffffffff)
>
> I think slpte=0x0 means the device pgtable entry does not exist at all,
> rather than an explicit permission issue.
>
> Is the guest using generic Intel IOMMU driver?  Could it possible that for
> some reason the pgtable update was not flushed to the guest pages when the
> driver sent the IOTLB invalidation (probably via QI interface)?
>
> I saw that you mentioned your driver is using 0x800000000 as iova base
> address, then why here the iova being mapped is 0x1187a9000?  Anything
> special on the device driver being used?
>
> > 236498@1676271757.075075:vtd_dmar_fault sid 0xb00 fault 6 addr
> > 0x1187a9000 write 0
> > 2023-02-13T07:02:37.075174Z qemu-system-x86_64: vtd_iommu_translate:
> > detected translation failure (dev=0b:00:00, iova=0x1187a9000)
> >
> > It seems 'vtd_iova_to_slpte()' it is returning 0 slpte resulting this
> > issue. In our driver code (which is running in a container) we are
> > using 0x800000000 as our IOVA base address. We have 10 nvme devices
> > that we are initializing, and we start initialization by sending
> > identify controller and get log page commands. Observation is
> > sometimes the first device is getting DMAR fault, sometimes first is
> > successfully completed identify and get log page, and second device is
> > getting DMAR fault. Also if I use Ubuntu 20.04 as base image for the
> > container, then this issue is not seens as seen in the following trace
> > output
> >
> > 278365@1676297375.587477:vtd_dmar_slpte sid 0xb00 slpte 0x1f2556003
> > addr 0x800000000 write 0
> > 278365@1676297375.587513:vtd_dmar_translate pasid 0xffffffff: dev
> > 0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff
> > 278365@1676297375.587527:vtd_dmar_slpte sid 0xb00 slpte 0x1f25fc003
> > addr 0x80020a000 write 1
> > 278365@1676297375.587532:vtd_dmar_translate pasid 0xffffffff: dev
> > 0b:00.00 iova 0x80020a000 -> gpa 0x1f25fc000 mask 0xfff
> > 278365@1676297375.587566:vtd_dmar_slpte sid 0xb00 slpte 0x1f2560003
> > addr 0x800008000 write 1
> > 278365@1676297375.587572:vtd_dmar_translate pasid 0xffffffff: dev
> > 0b:00.00 iova 0x800008000 -> gpa 0x1f2560000 mask 0xfff
> > 278365@1676297375.587814:vtd_dmar_translate pasid 0xffffffff: dev
> > 0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff
> > 278365@1676297375.587850:vtd_dmar_translate pasid 0xffffffff: dev
> > 0b:00.00 iova 0x800008000 -> gpa 0x1f2560000 mask 0xfff
> > 278365@1676297375.588455:vtd_dmar_translate pasid 0xffffffff: dev
> > 0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff
> > 278365@1676297375.588473:vtd_dmar_slpte sid 0xb00 slpte 0x1f25fe003
> > addr 0x80020b000 write 1
> > 278365@1676297375.588479:vtd_dmar_translate pasid 0xffffffff: dev
> > 0b:00.00 iova 0x80020b000 -> gpa 0x1f25fe000 mask 0xfff
> > 278365@1676297375.588507:vtd_dmar_translate pasid 0xffffffff: dev
> > 0b:00.00 iova 0x800008000 -> gpa 0x1f2560000 mask 0xfff
> > 278365@1676297375.588737:vtd_dmar_translate pasid 0xffffffff: dev
> > 0b:00.00 iova 0x800000000 -> gpa 0x1f2556000 mask 0xfff
> >
> > Following is the partial qemu command line that I am using
> >
> > -device intel-iommu,intremap=on,caching-mode=on,eim=on,device-iotlb=on,aw-bits=48
> >
> > -device pcie-root-port,id=pcie-root-port0,slot=1 -drive
> > file=/home/raghu/lfd/datadir/rs-bdc0/storage/rs-bdc0-0-0,format=qcow2,cache=unsafe,if=none,id=NVME0
> > -device nvme,serial=rs-bdc0-0_0,id=NVME0,bus=pcie-root-port0 -device
> > nvme-ns,drive=NVME0,eui64=0,uuid=30303030-3030-3030-3030-303030303030
> >
> > cat /proc/cmdline
> > BOOT_IMAGE=/boot/vmlinuz-5.15.0-60-generic
> > root=UUID=102c974c-7a1c-49cf-9bdd-a8e4638cf5c4 ro console=ttyS0,115200
> > intel_iommu=on iommu=pt
> >
> > I have also tried without 'iommu=pt' producing same result in Ubuntu
> > 22.04 base image in container, also the host OS version remains same
> > in both cases.
>
> Did you mean using iommu=pt on the host or guest, or both?
>
> IIUC iommu=pt on the host at least won't make a difference, because when
> it's assigned to QEMU it'll ignore the pt setting.
>
> Thanks,
>
> --
> Peter Xu
>

