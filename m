Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0003F812B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 05:30:31 +0200 (CEST)
Received: from localhost ([::1]:46030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ661-00086U-Sp
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 23:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mJ64x-0007Qh-V5
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 23:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mJ64r-00062O-DY
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 23:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629948555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Urw3Y7dAz/Mptxjxa1oEtdoqAKfE8728CCsw1fHfZ/M=;
 b=igAp7oOKNoeMgmbcJUCu+jES87cwJv+f0v/5+O2CQX91VI2jpMxYvHblhXPDkVGwIer0d/
 nTCljwBZai7VQsE6hLB099ZJeiiW1k/kNrr/7Deg6ZJV0KXcf0c2E7cyDCTSy/hW092dHO
 fRJy0tN2eo0qzMHbscz1KFjqJQ5oEwY=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-AQKLjhCdMnOAG0lPfKoiwg-1; Wed, 25 Aug 2021 23:29:12 -0400
X-MC-Unique: AQKLjhCdMnOAG0lPfKoiwg-1
Received: by mail-lj1-f200.google.com with SMTP id
 y6-20020a05651c154600b001c30dac7e87so533734ljp.8
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 20:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Urw3Y7dAz/Mptxjxa1oEtdoqAKfE8728CCsw1fHfZ/M=;
 b=icl8jqN2Pic8HdjBm8ZqWg2cZr5NS6ho305LGmY2SetYE2I6XgGLS1ClelMqnYOYTV
 CimxwiNS7vmWeYVnOp1+xl26gujQnmftuAZrtg3h1fOzPk/065o0/swoQiuMF5ufAQP5
 yf3QSJ10EDnyIroNYvho9YsCbyjGKt2t9skGFJOZHSCKU1rrd1MCMDuyvXbaonOj/X/e
 q6eaJGUieRCY+gdMWrlFv8ntOhSTTGz6mbFTWWlV/jbgw0RmTzUGLfIXpX+bwAu+QX//
 64gPpPVWdqz1cEV/C15umA+DotFJ/B8uUvyklyotu8T1DQGEAC3Y4U45Pc++xFo9xrgP
 5wUw==
X-Gm-Message-State: AOAM5303w7HuH+ruS9P+XAdieIDysbAY8Na7cnpTaCQgK73P3n6pN3ry
 tKtjdC2WayHw4RBH29ZqjDf3K50R150MJ589TyuKbDtShHUMyqftpx1FBXF8sg+1dzLyA4nJIyi
 auqSViH1BVjUVLrbykYmkz3l/5mviSq8=
X-Received: by 2002:ac2:5e7a:: with SMTP id a26mr1078910lfr.312.1629948549737; 
 Wed, 25 Aug 2021 20:29:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwEiCQ1zq8KfVLuj6at3BkM43zdI1Wyf1DVVHCPyAukRPHUFvImkDAphZheTdGDeyH5+Uuk/A58Yjswr61yDM=
X-Received: by 2002:ac2:5e7a:: with SMTP id a26mr1078890lfr.312.1629948549455; 
 Wed, 25 Aug 2021 20:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210825224256.1750286-1-philmd@redhat.com>
In-Reply-To: <20210825224256.1750286-1-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 26 Aug 2021 11:28:58 +0800
Message-ID: <CACGkMEv5qiA7D2LphdzvEZDE+bgiPHsyX++R21xNYtJA_e+AVQ@mail.gmail.com>
Subject: Re: [PATCH] hw/virtio: Update vring after modifying its queue size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 6:43 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> When a ring queue size is modified, we need to call
> virtio_queue_update_rings() to re-init the memory region
> caches. Otherwise the region might have outdated memory
> size, and later load/store access might trigger an
> assertion, such:
>
>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t ad=
dress_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemTxRe=
sult *):
>   Assertion `addr < cache->len && 2 <=3D cache->len - addr' failed.
>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
>   0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
>   (gdb) bt
>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
>   #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=3D0x61300=
010a7c0, addr=3D134, attrs=3D..., result=3D0x0) at include/exec/memory_ldst=
_cached.h.inc:30
>   #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=3D0x61300010a7c0, =
addr=3D134) at include/exec/memory_ldst_phys.h.inc:67
>   #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=3D0x62d00003a68=
0, cache=3D0x61300010a7c0, pa=3D134) at include/hw/virtio/virtio-access.h:1=
66
>   #7  0x0000555558f300ea in vring_avail_ring (vq=3D0x7fffdd55d8a0, i=3D65=
) at hw/virtio/virtio.c:326
>   #8  0x0000555558f33b10 in vring_get_used_event (vq=3D0x7fffdd55d8a0) at=
 hw/virtio/virtio.c:332
>   #9  0x0000555558f33677 in virtio_split_should_notify (vdev=3D0x62d00003=
a680, vq=3D0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
>   #10 0x0000555558f1859f in virtio_should_notify (vdev=3D0x62d00003a680, =
vq=3D0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
>   #11 0x0000555558f188cc in virtio_notify (vdev=3D0x62d00003a680, vq=3D0x=
7fffdd55d8a0) at hw/virtio/virtio.c:2565
>   #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=3D0x62d00003a68=
0, vq=3D0x7fffdd55d8a0) at hw/input/virtio-input.c:100
>   #13 0x0000555558f16df7 in virtio_queue_notify (vdev=3D0x62d00003a680, n=
=3D1) at hw/virtio/virtio.c:2363
>   #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=3D0x62d000032=
400, addr=3D7, val=3D0, size=3D1) at hw/virtio/virtio-pci.c:1369
>   #15 0x0000555558b80b04 in memory_region_write_accessor (mr=3D0x62d00003=
3190, addr=3D7, value=3D0x7fffffff8eb0, size=3D1, shift=3D0, mask=3D255, at=
trs=3D...) at softmmu/memory.c:492
>
> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Fixes: ab223c9518e ("virtio: allow virtio-1 queue layout")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302
> BugLink: https://bugs.launchpad.net/qemu/+bug/1913510
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/virtio/virtio.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 874377f37a7..04ffe5f420e 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2255,6 +2255,7 @@ void virtio_queue_set_num(VirtIODevice *vdev, int n=
, int num)
>          return;
>      }
>      vdev->vq[n].vring.num =3D num;
> +    virtio_queue_update_rings(vdev, n);
>  }
>

Spec said:

"
The driver MUST configure the other virtqueue fields before enabling
the virtqueue with queue_enable.
"

So I think we should forbid the num to be changed if the virtqueue is ready=
?

Thanks

>  VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector=
)
> --
> 2.31.1
>


