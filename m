Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516EB4EBD75
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:18:18 +0200 (CEST)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUT3-0001Az-2I
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:18:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUPL-0007NS-Uy
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:14:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUPJ-0002xz-Er
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648631664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFFdvlgm+Doi0YbPcDF3Zuvxx6fQCbC+EVfAwdrkeYs=;
 b=fLvfjDOpznBLqtzCMjbH/o1bJM7cce3OKGSZtDCjrwBYrs7S23Db2bwmnds/yXtQC+von3
 XiKB8Kjabz2ITeca3NVkvl6qBe6ynnrgrlmMK1CeS3Uc8Lfr2186sbZPnXjMZO3e2pgLTH
 qgFIENpMPdDoIE1K6c/cguDCTHqtoA8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-yE8lPt2JPkmGk3lfcXID6g-1; Wed, 30 Mar 2022 05:14:23 -0400
X-MC-Unique: yE8lPt2JPkmGk3lfcXID6g-1
Received: by mail-lf1-f69.google.com with SMTP id
 b7-20020a056512218700b0044869874779so6275706lft.3
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 02:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wFFdvlgm+Doi0YbPcDF3Zuvxx6fQCbC+EVfAwdrkeYs=;
 b=c6Gf922r0C7WPMVyx7t/vdqkxuuktZhmO1FGZHFFmI0ZKMwsXq52CXSh1u+iDqxT90
 3bptJo4X7yfvXJPhB/NtZRCmnY/IUNGW+f4itKtOMC/iWM7jaekA0RJAdrStCAWwclDS
 HvPZyyszzh6b6+GkvJqE1EuUiL0kB7kd7DAylStE2BAKhzZ5mYNzOs47HgfZ/jccHGoY
 Ei9MOwRXIh4bHI3B7AFr0bE77j7w4BHoxWe8RNljyK6+ktgdbt+QkWJ5wRTPz1l0at3e
 2+6TAMV8/bAxqTV5CBe7KdNGv2YDNu5+ug7A4+jyNVVR/QBcj5B9sB5VeXqJoHjJQV9n
 KEKA==
X-Gm-Message-State: AOAM533u1CTPy3rLfST7fhRtu4bbkLJatPDPbdAQnYcsRfrKTL3gtVrT
 jGkCJXJQiWkz1XN981PIQZMDRA0zmmRsIax8oV/xb8CfgPVrMgNKlrXYPPgFJqpetJa+cfdtq7u
 LuUi2uJirSwh/wFwxSJ69lYxTqnnMud4=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr6016011ljq.300.1648631661491; 
 Wed, 30 Mar 2022 02:14:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlm3bwZZTxAC0O2OtOUQudF5hyzL3yiOqbPPq1SrVf2XHw0Qcl1m1Zt0ERZ8VSmH6Pvlvuu6cSXSZhsj+Ps6w=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr6015993ljq.300.1648631661178; Wed, 30
 Mar 2022 02:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-5-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1648621997-22416-5-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 17:14:10 +0800
Message-ID: <CACGkMEt=Bs7XPWQaMOQB5iBece1CH9HJZ69YEF_m-e2Tj95qDg@mail.gmail.com>
Subject: Re: [PATCH 4/7] virtio: don't read pending event on host notifier if
 disabled
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> Previous commit prevents vhost-user and vhost-vdpa from using
> userland vq handler via disable_ioeventfd_handler. The same
> needs to be done for host notifier cleanup too, as the
> virtio_queue_host_notifier_read handler still tends to read
> pending event left behind on ioeventfd and attempts to handle
> outstanding kicks from QEMU userland vq.
>
> If vq handler is not disabled on cleanup, it may lead to sigsegv
> with recursive virtio_net_set_status call on the control vq:
>
> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=3D<optimized out>, =
idx=3D<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=3D<optimized out>, =
idx=3D<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=3D0x558f55c01800, vde=
v=3D0x558f568f91f0, n=3D2, mask=3D<optimized out>) at ../hw/virtio/vhost.c:=
1557

I feel it's probably a bug elsewhere e.g when we fail to start
vhost-vDPA, it's the charge of the Qemu to poll host notifier and we
will fallback to the userspace vq handler.

Thanks

> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=3Dd@entry=3D0x5=
58f568f0f60, n=3Dn@entry=3D2, assign=3Dassign@entry=3Dtrue, with_irqfd=3Dwi=
th_irqfd@entry=3Dfalse)
>    at ../hw/virtio/virtio-pci.c:974
> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=3D0x558f568f0f=
60, nvqs=3D3, assign=3Dtrue) at ../hw/virtio/virtio-pci.c:1019
> 9  0x0000558f52bf091d in vhost_net_start (dev=3Ddev@entry=3D0x558f568f91f=
0, ncs=3D0x558f56937cd0, data_queue_pairs=3Ddata_queue_pairs@entry=3D1, cvq=
=3Dcvq@entry=3D1)
>    at ../hw/net/vhost_net.c:361
> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=3D<optimized out>,=
 n=3D0x558f568f91f0) at ../hw/net/virtio-net.c:289
> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=3D0x558f568f91f0, st=
atus=3D15 '\017') at ../hw/net/virtio-net.c:370
> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=3Dvdev@entry=3D0x558f568=
f91f0, val=3Dval@entry=3D15 '\017') at ../hw/virtio/virtio.c:1945
> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=3D0x558f568f0f60=
, addr=3D<optimized out>, val=3D<optimized out>, size=3D<optimized out>) at=
 ../hw/virtio/virtio-pci.c:1292
> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=3D0x558f568f19d=
0, addr=3D20, value=3D<optimized out>, size=3D1, shift=3D<optimized out>, m=
ask=3D<optimized out>, attrs=3D...)
>    at ../softmmu/memory.c:492
> 15 0x0000558f52d127de in access_with_adjusted_size (addr=3Daddr@entry=3D2=
0, value=3Dvalue@entry=3D0x7f8cdbffe748, size=3Dsize@entry=3D1, access_size=
_min=3D<optimized out>, access_size_max=3D<optimized out>, access_fn=3D0x55=
8f52d15cf0 <memory_region_write_accessor>, mr=3D0x558f568f19d0, attrs=3D...=
) at ../softmmu/memory.c:554
> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=3Dmr@entry=3D0x=
558f568f19d0, addr=3D20, data=3D<optimized out>, op=3D<optimized out>, attr=
s=3Dattrs@entry=3D...)
>    at ../softmmu/memory.c:1504
> 17 0x0000558f52d078e7 in flatview_write_continue (fv=3Dfv@entry=3D0x7f8ac=
cbc3b90, addr=3Daddr@entry=3D103079215124, attrs=3D..., ptr=3Dptr@entry=3D0=
x7f8ce6300028, len=3Dlen@entry=3D1, addr1=3D<optimized out>, l=3D<optimized=
 out>, mr=3D0x558f568f19d0) at ../../../include/qemu/host-utils.h:165
> 18 0x0000558f52d07b06 in flatview_write (fv=3D0x7f8accbc3b90, addr=3D1030=
79215124, attrs=3D..., buf=3D0x7f8ce6300028, len=3D1) at ../softmmu/physmem=
.c:2822
> 19 0x0000558f52d0b36b in address_space_write (as=3D<optimized out>, addr=
=3D<optimized out>, attrs=3D..., buf=3Dbuf@entry=3D0x7f8ce6300028, len=3D<o=
ptimized out>)
>    at ../softmmu/physmem.c:2914
> 20 0x0000558f52d0b3da in address_space_rw (as=3D<optimized out>, addr=3D<=
optimized out>, attrs=3D...,
>    attrs@entry=3D..., buf=3Dbuf@entry=3D0x7f8ce6300028, len=3D<optimized =
out>, is_write=3D<optimized out>) at ../softmmu/physmem.c:2924
> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x558f55c2da60) =
at ../accel/kvm/kvm-all.c:2903
> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=3Darg@entry=3D0x558f55c2=
da60) at ../accel/kvm/kvm-accel-ops.c:49
> 23 0x0000558f52f9f04a in qemu_thread_start (args=3D<optimized out>) at ..=
/util/qemu-thread-posix.c:556
> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>
> Fixes: 4023784 ("vhost-vdpa: multiqueue support")
> Cc: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> ---
>  hw/virtio/virtio-bus.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index 0f69d1c..3159b58 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -311,7 +311,8 @@ void virtio_bus_cleanup_host_notifier(VirtioBusState =
*bus, int n)
>      /* Test and clear notifier after disabling event,
>       * in case poll callback didn't have time to run.
>       */
> -    virtio_queue_host_notifier_read(notifier);
> +    if (!vdev->disable_ioeventfd_handler)
> +        virtio_queue_host_notifier_read(notifier);
>      event_notifier_cleanup(notifier);
>  }
>
> --
> 1.8.3.1
>


