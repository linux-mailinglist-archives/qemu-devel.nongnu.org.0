Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC493F5DB9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 14:14:07 +0200 (CEST)
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIVJY-0002G0-FE
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 08:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1mIVIl-0001Kn-9X; Tue, 24 Aug 2021 08:13:11 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:39848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1mIVIj-0007tr-FW; Tue, 24 Aug 2021 08:13:11 -0400
Received: by mail-qv1-xf29.google.com with SMTP id dt3so11504316qvb.6;
 Tue, 24 Aug 2021 05:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ohg2wtdusS0zs97D5JaK5lTDdflZxFN2moOkjyLsBU4=;
 b=rso+8ws5xFVg5ukRIHvAi/hv4PiLpGcYxTSQ6hUVgJa3anH9qkX93dxOQNIlmsleWj
 B3L7MOOYV6VNBzNqJCRFk4kQ5sxxBVAUcEV+AzKPhxpDXu75WigQSZrRNGd25rJ6hAb4
 2wEF3Jb1VigHdi+Pl8nX0e7lmqIKJ+lRGm+aFdZpdPOLL6SmUNXmJxNJFEghFiHJliNZ
 +UT7S65l19iYRQS/1efGiOijU52zb3gsZIBhUDxmKOraIbSuf43WkUTDBsjWUVpI/prb
 iVZ4Nn0Vp5N4kejaWrDhSe2zrZ12MOJ9HdSdvDdgMNiul5+ULM0pAam23GEHh+hv7WhD
 zZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ohg2wtdusS0zs97D5JaK5lTDdflZxFN2moOkjyLsBU4=;
 b=gBf38OjiTlupQ1UVznuMNEgg2VPCRgSZHiDak9AzNhqjlKPmD9btEoUfI+X7mSg1t3
 5NHt/e7URdE82OpbWNzosylGrNqAQ8zFQiddCrzCzueUgXuCsWmLyfmaBLtI1uUc9kVV
 6dqqtJ8Tl7JJHWQ+YvLJolSx2hThTDMWKjWvC2FMS1ir5zTgx3kZ7iX5dJL/Sj5iJX1I
 onBODWxqFwbpikgzaLleSXsSXYRe1MdmTMthSJBAeB34nCckFmpXijzoTZzF8Y4NmGjc
 bF80TT783N/JjCJm/1aeZ5GFlF2p/i33TaqpXBqbFd2qcfqg1WPGQn/fxnMCUCkaWIN+
 i85A==
X-Gm-Message-State: AOAM533YlTy2gzb8e6x3gqcPpUbboWh4IYYVMwKb1YM1CLd7vHehMeVM
 rVigiAcVrOlPUmGg7K9Il7lPr2BnbxfBKaSR3yM=
X-Google-Smtp-Source: ABdhPJyy3ZbaAovklzPUIr5OvJKMcGYvG3HznZDhvmiE5Jd35m1G1d8zSYP1dAExlFtlZZOO1pOcOtBQOx70etaOoeM=
X-Received: by 2002:ad4:522c:: with SMTP id r12mr38102417qvq.17.1629807187751; 
 Tue, 24 Aug 2021 05:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210823164157.751807-1-philmd@redhat.com>
 <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
 <YSQKHaGiJZE5OAk2@t490s>
 <CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com>
 <20210824120153.altqys6jjiuxh35p@sirius.home.kraxel.org>
In-Reply-To: <20210824120153.altqys6jjiuxh35p@sirius.home.kraxel.org>
From: Li Qiang <liq3ea@gmail.com>
Date: Tue, 24 Aug 2021 20:12:31 +0800
Message-ID: <CAKXe6S+4+j77QT5dk1JQ3+T0Vyu+3ZVn1RmhJR6m0_VMNAhARA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus permission
 from MemTxAttrs argument
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=liq3ea@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> =E4=BA=8E2021=E5=B9=B48=E6=9C=8824=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=888:02=E5=86=99=E9=81=93=EF=BC=9A
>
>   Hi,
>
> > I was vaguely tossing an idea around in the back of my mind
> > about whether you could have a flag on devices that marked
> > them as "this device is currently involved in IO", such that
> > you could then just fail the last DMA (or qemu_irq_set, or
> > whatever) that would complete the loop back to a device that
> > was already doing IO. But that would need a lot of thinking
> > through to figure out if it's feasible, and it's probably
> > a lot of code change.
>
> Quick & dirty hack trying the above.  Not much code, it is opt-in per
> MemoryRegion (so less overhead for devices which already handle all DMA
> in a BH), tracks state in DeviceState.  Adds a check to a rather hot
> code path though.  Not tested yet (stopped investigating when I noticed
> Philippe tries to fix the same thing with another approach).  Not
> benchmarked.
>
> Maybe it helps ...
>

Gerd's patch just remind my approach here, Just add here:

https://mail.gnu.org/archive/html/qemu-devel/2020-09/msg00906.html

But I check and record it in the device MR handler.

Thanks,
Li Qiang


> take care,
>   Gerd
>
> From 80e58a2cd2c630f0bddd9d0eaee71abb7eeb9440 Mon Sep 17 00:00:00 2001
> From: Gerd Hoffmann <kraxel@redhat.com>
> Date: Tue, 17 Aug 2021 07:35:37 +0200
> Subject: [PATCH] allow track active mmio handlers
>
> ---
>  include/exec/memory.h  |  1 +
>  include/hw/qdev-core.h |  1 +
>  softmmu/memory.c       | 24 ++++++++++++++++++++++--
>  3 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317f0..b1883d45e817 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -265,6 +265,7 @@ struct MemoryRegionOps {
>           */
>          bool unaligned;
>      } impl;
> +    bool block_reenter;
>  };
>
>  typedef struct MemoryRegionClass {
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bafc311bfa1b..4cf281a81fa9 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -191,6 +191,7 @@ struct DeviceState {
>      int instance_id_alias;
>      int alias_required_for_version;
>      ResettableState reset;
> +    bool io_handler_active;
>  };
>
>  struct DeviceListener {
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4dfc..5eb5dd465dd2 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -437,7 +437,18 @@ static MemTxResult  memory_region_read_accessor(Memo=
ryRegion *mr,
>  {
>      uint64_t tmp;
>
> -    tmp =3D mr->ops->read(mr->opaque, addr, size);
> +    if (mr->ops->block_reenter) {
> +        DeviceState *dev =3D DEVICE(mr->owner);
> +        if (!dev->io_handler_active) {
> +            dev->io_handler_active =3D true;
> +            tmp =3D mr->ops->read(mr->opaque, addr, size);
> +            dev->io_handler_active =3D false;
> +        } else {
> +            tmp =3D MEMTX_OK;
> +        }
> +    } else {
> +        tmp =3D mr->ops->read(mr->opaque, addr, size);
> +    }
>      if (mr->subpage) {
>          trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp,=
 size);
>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_RE=
AD)) {
> @@ -489,7 +500,16 @@ static MemTxResult memory_region_write_accessor(Memo=
ryRegion *mr,
>          trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp=
, size,
>                                        memory_region_name(mr));
>      }
> -    mr->ops->write(mr->opaque, addr, tmp, size);
> +    if (mr->ops->block_reenter) {
> +        DeviceState *dev =3D DEVICE(mr->owner);
> +        if (!dev->io_handler_active) {
> +            dev->io_handler_active =3D true;
> +            mr->ops->write(mr->opaque, addr, tmp, size);
> +            dev->io_handler_active =3D false;
> +        }
> +    } else {
> +        mr->ops->write(mr->opaque, addr, tmp, size);
> +    }
>      return MEMTX_OK;
>  }
>
> --
> 2.31.1
>

