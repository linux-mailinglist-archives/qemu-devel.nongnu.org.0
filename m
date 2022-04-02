Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AB64EFDE6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 04:02:01 +0200 (CEST)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naT5T-0008LI-B1
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 22:01:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naT4J-0007ZQ-5y
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:00:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naT4G-0005la-7d
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648864826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZUh9T39qnlZuCr/kDR4sQv1y4DmyscM7lLCsUb4t78=;
 b=dIy2Fpj/fpnMQpesEWSEVJARZb7JdKIqogfSXJGSe6LlbYUviwDfdlBidcBfuzOG1YpvTJ
 j47IHDVMWQkl2aMi7T2bROuu+8/fyUGczFz+eO8hc76QGWInpgViN+bzSla5pF4GkZXOhg
 aVMgND1B1tZigsBOZpQciltf/C3LTIg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-ajFJOCcPMeK5U1hEHrhKDQ-1; Fri, 01 Apr 2022 22:00:25 -0400
X-MC-Unique: ajFJOCcPMeK5U1hEHrhKDQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 d41-20020a0565123d2900b0044a10c21f39so1906283lfv.22
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 19:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gZUh9T39qnlZuCr/kDR4sQv1y4DmyscM7lLCsUb4t78=;
 b=7NDIEu7N9bi4zvxpMMe5FWrhKGhn2CvcWZQOjx2/0xKimwBaJ3I/CvC+yPvcQUsfbz
 SrUjtPxwKYiNxPR1oQykMa09qyqSDytjyMJA0sQGy2VXkmevBNSQWkQmia1V4fgmQJQF
 sxOgw9jeVmu44sNqGko0yt8Rdyl+wOK3ucm1ibPTcw9fMHIjd6emn3RZwzTmg/qa3LA3
 cGE3EriSKhqJP9JHB9HWoLtxlv9J7ofKWRn07zBiSFsvUgT7iJp6gS/IdYYyrwYe/K1v
 8RUpFHkfhX8Rzy1VNUa63mb8KrjV8ZghuVGgsUHS95anllPGPtOB8P7Gd9Wo26jAHSY0
 TwSg==
X-Gm-Message-State: AOAM530nFCSDfF2QGNhd3J5SzIXgr8idcCQWHaXs7RBwPrQy4k+kMO8L
 em9w6WddW5uqh7Kk9o7CXrV11pgSS+KyornayPcFY3bVNghPYTLIOhjselQjmg5JeqS2E3vLn+7
 LK/sp/HRMNNOlkSF5Gse/rPLWxZDiTEI=
X-Received: by 2002:a2e:81c1:0:b0:24b:f44:3970 with SMTP id
 s1-20020a2e81c1000000b0024b0f443970mr109475ljg.97.1648864824077; 
 Fri, 01 Apr 2022 19:00:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRmUUJEgjCFvX71XktpP4GGzlsp/QDXpc7L38GigZekWlFVLbSqlmjgr5ur93yLe+MuNCDqguMDhsNbLYsigo=
X-Received: by 2002:a2e:81c1:0:b0:24b:f44:3970 with SMTP id
 s1-20020a2e81c1000000b0024b0f443970mr109456ljg.97.1648864823728; Fri, 01 Apr
 2022 19:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-5-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEt=Bs7XPWQaMOQB5iBece1CH9HJZ69YEF_m-e2Tj95qDg@mail.gmail.com>
 <4f2acb7a-d436-9d97-80b1-3308c1b396b5@oracle.com>
 <CACGkMEtsV6e6LOYCfVZb7_-SvSAWRk1XHom+neXR=d3aQQwXmg@mail.gmail.com>
 <b190a762-1d21-4fec-b138-e4c09a949525@oracle.com>
In-Reply-To: <b190a762-1d21-4fec-b138-e4c09a949525@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sat, 2 Apr 2022 10:00:12 +0800
Message-ID: <CACGkMEv-ddVvrwSXGsvajiVXq5X3ZXy8mM41fvwQTYTGGnyznQ@mail.gmail.com>
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

On Sat, Apr 2, 2022 at 4:37 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 3/31/2022 1:36 AM, Jason Wang wrote:
> > On Thu, Mar 31, 2022 at 12:41 AM Si-Wei Liu <si-wei.liu@oracle.com> wro=
te:
> >>
> >>
> >> On 3/30/2022 2:14 AM, Jason Wang wrote:
> >>> On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wr=
ote:
> >>>> Previous commit prevents vhost-user and vhost-vdpa from using
> >>>> userland vq handler via disable_ioeventfd_handler. The same
> >>>> needs to be done for host notifier cleanup too, as the
> >>>> virtio_queue_host_notifier_read handler still tends to read
> >>>> pending event left behind on ioeventfd and attempts to handle
> >>>> outstanding kicks from QEMU userland vq.
> >>>>
> >>>> If vq handler is not disabled on cleanup, it may lead to sigsegv
> >>>> with recursive virtio_net_set_status call on the control vq:
> >>>>
> >>>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
> >>>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
> >>>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
> >>>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
> >>>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=3D<optimized o=
ut>, idx=3D<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
> >>>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=3D<optimized o=
ut>, idx=3D<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
> >>>> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=3D0x558f55c01800=
, vdev=3D0x558f568f91f0, n=3D2, mask=3D<optimized out>) at ../hw/virtio/vho=
st.c:1557
> >>> I feel it's probably a bug elsewhere e.g when we fail to start
> >>> vhost-vDPA, it's the charge of the Qemu to poll host notifier and we
> >>> will fallback to the userspace vq handler.
> >> Apologies, an incorrect stack trace was pasted which actually came fro=
m
> >> patch #1. I will post a v2 with the corresponding one as below:
> >>
> >> 0  0x000055f800df1780 in qdev_get_parent_bus (dev=3D0x0) at
> >> ../hw/core/qdev.c:376
> >> 1  0x000055f800c68ad8 in virtio_bus_device_iommu_enabled
> >> (vdev=3Dvdev@entry=3D0x0) at ../hw/virtio/virtio-bus.c:331
> >> 2  0x000055f800d70d7f in vhost_memory_unmap (dev=3D<optimized out>) at
> >> ../hw/virtio/vhost.c:318
> >> 3  0x000055f800d70d7f in vhost_memory_unmap (dev=3D<optimized out>,
> >> buffer=3D0x7fc19bec5240, len=3D2052, is_write=3D1, access_len=3D2052) =
at
> >> ../hw/virtio/vhost.c:336
> >> 4  0x000055f800d71867 in vhost_virtqueue_stop
> >> (dev=3Ddev@entry=3D0x55f8037ccc30, vdev=3Dvdev@entry=3D0x55f8044ec590,
> >> vq=3D0x55f8037cceb0, idx=3D0) at ../hw/virtio/vhost.c:1241
> >> 5  0x000055f800d7406c in vhost_dev_stop (hdev=3Dhdev@entry=3D0x55f8037=
ccc30,
> >> vdev=3Dvdev@entry=3D0x55f8044ec590) at ../hw/virtio/vhost.c:1839
> >> 6  0x000055f800bf00a7 in vhost_net_stop_one (net=3D0x55f8037ccc30,
> >> dev=3D0x55f8044ec590) at ../hw/net/vhost_net.c:315
> >> 7  0x000055f800bf0678 in vhost_net_stop (dev=3Ddev@entry=3D0x55f8044ec=
590,
> >> ncs=3D0x55f80452bae0, data_queue_pairs=3Ddata_queue_pairs@entry=3D7,
> >> cvq=3Dcvq@entry=3D1)
> >>      at ../hw/net/vhost_net.c:423
> >> 8  0x000055f800d4e628 in virtio_net_set_status (status=3D<optimized ou=
t>,
> >> n=3D0x55f8044ec590) at ../hw/net/virtio-net.c:296
> >> 9  0x000055f800d4e628 in virtio_net_set_status
> >> (vdev=3Dvdev@entry=3D0x55f8044ec590, status=3D15 '\017') at
> >> ../hw/net/virtio-net.c:370
> > I don't understand why virtio_net_handle_ctrl() call virtio_net_set_sta=
uts()...
> The pending request left over on the ctrl vq was a VIRTIO_NET_CTRL_MQ
> command, i.e. in virtio_net_handle_mq():

Completely forget that the code was actually written by me :\

>
> 1413     n->curr_queue_pairs =3D queue_pairs;
> 1414     /* stop the backend before changing the number of queue_pairs
> to avoid handling a
> 1415      * disabled queue */
> 1416     virtio_net_set_status(vdev, vdev->status);
> 1417     virtio_net_set_queue_pairs(n);
>
> Noted before the vdpa multiqueue support, there was never a vhost_dev
> for ctrl_vq exposed, i.e. there's no host notifier set up for the
> ctrl_vq on vhost_kernel as it is emulated in QEMU software.
>
> >
> >> 10 0x000055f800d534d8 in virtio_net_handle_ctrl (iov_cnt=3D<optimized
> >> out>, iov=3D<optimized out>, cmd=3D0 '\000', n=3D0x55f8044ec590) at
> >> ../hw/net/virtio-net.c:1408
> >> 11 0x000055f800d534d8 in virtio_net_handle_ctrl (vdev=3D0x55f8044ec590=
,
> >> vq=3D0x7fc1a7e888d0) at ../hw/net/virtio-net.c:1452
> >> 12 0x000055f800d69f37 in virtio_queue_host_notifier_read
> >> (vq=3D0x7fc1a7e888d0) at ../hw/virtio/virtio.c:2331
> >> 13 0x000055f800d69f37 in virtio_queue_host_notifier_read
> >> (n=3Dn@entry=3D0x7fc1a7e8894c) at ../hw/virtio/virtio.c:3575
> >> 14 0x000055f800c688e6 in virtio_bus_cleanup_host_notifier
> >> (bus=3D<optimized out>, n=3Dn@entry=3D14) at ../hw/virtio/virtio-bus.c=
:312
> >> 15 0x000055f800d73106 in vhost_dev_disable_notifiers
> >> (hdev=3Dhdev@entry=3D0x55f8035b51b0, vdev=3Dvdev@entry=3D0x55f8044ec59=
0)
> >>      at ../../../include/hw/virtio/virtio-bus.h:35
> >> 16 0x000055f800bf00b2 in vhost_net_stop_one (net=3D0x55f8035b51b0,
> >> dev=3D0x55f8044ec590) at ../hw/net/vhost_net.c:316
> >> 17 0x000055f800bf0678 in vhost_net_stop (dev=3Ddev@entry=3D0x55f8044ec=
590,
> >> ncs=3D0x55f80452bae0, data_queue_pairs=3Ddata_queue_pairs@entry=3D7,
> >> cvq=3Dcvq@entry=3D1)
> >>      at ../hw/net/vhost_net.c:423
> >> 18 0x000055f800d4e628 in virtio_net_set_status (status=3D<optimized ou=
t>,
> >> n=3D0x55f8044ec590) at ../hw/net/virtio-net.c:296
> >> 19 0x000055f800d4e628 in virtio_net_set_status (vdev=3D0x55f8044ec590,
> >> status=3D15 '\017') at ../hw/net/virtio-net.c:370
> >> 20 0x000055f800d6c4b2 in virtio_set_status (vdev=3D0x55f8044ec590,
> >> val=3D<optimized out>) at ../hw/virtio/virtio.c:1945
> >> 21 0x000055f800d11d9d in vm_state_notify (running=3Drunning@entry=3Dfa=
lse,
> >> state=3Dstate@entry=3DRUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:333
> >> 22 0x000055f800d04e7a in do_vm_stop
> >> (state=3Dstate@entry=3DRUN_STATE_SHUTDOWN, send_stop=3Dsend_stop@entry=
=3Dfalse)
> >> at ../softmmu/cpus.c:262
> >> 23 0x000055f800d04e99 in vm_shutdown () at ../softmmu/cpus.c:280
> >> 24 0x000055f800d126af in qemu_cleanup () at ../softmmu/runstate.c:812
> >> 25 0x000055f800ad5b13 in main (argc=3D<optimized out>, argv=3D<optimiz=
ed
> >> out>, envp=3D<optimized out>) at ../softmmu/main.c:51
> >>
> >>   From the trace pending read only occurs in stop path. The recursive
> >> virtio_net_set_status from virtio_net_handle_ctrl doesn't make sense t=
o me.
> > Yes, we need to figure this out to know the root cause.
> I think it has something to do with the virtqueue unready issue that the
> vhost_reset_device() refactoring series attempt to fix. If that is fixed
> we should not see this sigsegv with mlx5_vdpa. However I guess we both
> agreed that the vq_unready support would need new uAPI (some flag) to
> define, hence this fix applies to the situation where uAPI doesn't exist
> on the kernel or the vq_unready is not supported by vdpa vendor driver.
>

Yes.

> >
> > The code should work for the case when vhost-vdp fails to start.
> Unlike the other datapath queues for net vdpa, the events left behind in
> the control queue can't be processed by the userspace, as unlike
> vhost-kernel we don't have a fallback path in the userspace.

So that's the question, we should have a safe fallback.

> To ignore
> the pending event and let vhost vdpa process it on resume/start is
> perhaps the best thing to do. This is even true for datapath queues for
> other vdpa devices than of network.
>
> >
> >> Not sure I got the reason why we need to handle pending host
> >> notification in userland vq, can you elaborate?
> > Because vhost-vDPA fails to start, we will "fallback" to a dummy usersp=
ace.
> Is the dummy userspace working or operational? What's the use case of
> this "fallback" dummy if what guest user can get is a busted NIC?

The problem is we can't do better in this case now. Such fallack (e.g
for vhost-user) has been used for years. Or do you have any better
ideas?

It doesn't differ too much of the two approaches:

1) dummy fallback which can do even cvq

and

2) disable host notifiers

Especially consider 2) requires more changes.

> I
> think this is very different from the vhost-kernel case in that once
> vhost fails, we can fallback to userspace to emulate the network through
> the tap fd in a good way. However, there's no equivalent yet for
> vhost-vdpa...
>

As said previously, technically we can have vhost-vDPA network backend
as a fallback. (So did for vhost-user).

Thanks

> Thanks,
> -Siwei
>
> >
> > Thanks
> >
> >> Thanks,
> >> -Siwei
> >>
> >>> Thanks
> >>>
> >>>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=3Dd@entry=
=3D0x558f568f0f60, n=3Dn@entry=3D2, assign=3Dassign@entry=3Dtrue, with_irqf=
d=3Dwith_irqfd@entry=3Dfalse)
> >>>>      at ../hw/virtio/virtio-pci.c:974
> >>>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=3D0x558f5=
68f0f60, nvqs=3D3, assign=3Dtrue) at ../hw/virtio/virtio-pci.c:1019
> >>>> 9  0x0000558f52bf091d in vhost_net_start (dev=3Ddev@entry=3D0x558f56=
8f91f0, ncs=3D0x558f56937cd0, data_queue_pairs=3Ddata_queue_pairs@entry=3D1=
, cvq=3Dcvq@entry=3D1)
> >>>>      at ../hw/net/vhost_net.c:361
> >>>> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=3D<optimized =
out>, n=3D0x558f568f91f0) at ../hw/net/virtio-net.c:289
> >>>> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=3D0x558f568f91f=
0, status=3D15 '\017') at ../hw/net/virtio-net.c:370
> >>>> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=3Dvdev@entry=3D0x55=
8f568f91f0, val=3Dval@entry=3D15 '\017') at ../hw/virtio/virtio.c:1945
> >>>> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=3D0x558f568=
f0f60, addr=3D<optimized out>, val=3D<optimized out>, size=3D<optimized out=
>) at ../hw/virtio/virtio-pci.c:1292
> >>>> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=3D0x558f56=
8f19d0, addr=3D20, value=3D<optimized out>, size=3D1, shift=3D<optimized ou=
t>, mask=3D<optimized out>, attrs=3D...)
> >>>>      at ../softmmu/memory.c:492
> >>>> 15 0x0000558f52d127de in access_with_adjusted_size (addr=3Daddr@entr=
y=3D20, value=3Dvalue@entry=3D0x7f8cdbffe748, size=3Dsize@entry=3D1, access=
_size_min=3D<optimized out>, access_size_max=3D<optimized out>, access_fn=
=3D0x558f52d15cf0 <memory_region_write_accessor>, mr=3D0x558f568f19d0, attr=
s=3D...) at ../softmmu/memory.c:554
> >>>> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=3Dmr@entry=
=3D0x558f568f19d0, addr=3D20, data=3D<optimized out>, op=3D<optimized out>,=
 attrs=3Dattrs@entry=3D...)
> >>>>      at ../softmmu/memory.c:1504
> >>>> 17 0x0000558f52d078e7 in flatview_write_continue (fv=3Dfv@entry=3D0x=
7f8accbc3b90, addr=3Daddr@entry=3D103079215124, attrs=3D..., ptr=3Dptr@entr=
y=3D0x7f8ce6300028, len=3Dlen@entry=3D1, addr1=3D<optimized out>, l=3D<opti=
mized out>, mr=3D0x558f568f19d0) at ../../../include/qemu/host-utils.h:165
> >>>> 18 0x0000558f52d07b06 in flatview_write (fv=3D0x7f8accbc3b90, addr=
=3D103079215124, attrs=3D..., buf=3D0x7f8ce6300028, len=3D1) at ../softmmu/=
physmem.c:2822
> >>>> 19 0x0000558f52d0b36b in address_space_write (as=3D<optimized out>, =
addr=3D<optimized out>, attrs=3D..., buf=3Dbuf@entry=3D0x7f8ce6300028, len=
=3D<optimized out>)
> >>>>      at ../softmmu/physmem.c:2914
> >>>> 20 0x0000558f52d0b3da in address_space_rw (as=3D<optimized out>, add=
r=3D<optimized out>, attrs=3D...,
> >>>>      attrs@entry=3D..., buf=3Dbuf@entry=3D0x7f8ce6300028, len=3D<opt=
imized out>, is_write=3D<optimized out>) at ../softmmu/physmem.c:2924
> >>>> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x558f55c2d=
a60) at ../accel/kvm/kvm-all.c:2903
> >>>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=3Darg@entry=3D0x558=
f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
> >>>> 23 0x0000558f52f9f04a in qemu_thread_start (args=3D<optimized out>) =
at ../util/qemu-thread-posix.c:556
> >>>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
> >>>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
> >>>>
> >>>> Fixes: 4023784 ("vhost-vdpa: multiqueue support")
> >>>> Cc: Jason Wang <jasowang@redhat.com>
> >>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> >>>> ---
> >>>>    hw/virtio/virtio-bus.c | 3 ++-
> >>>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> >>>> index 0f69d1c..3159b58 100644
> >>>> --- a/hw/virtio/virtio-bus.c
> >>>> +++ b/hw/virtio/virtio-bus.c
> >>>> @@ -311,7 +311,8 @@ void virtio_bus_cleanup_host_notifier(VirtioBusS=
tate *bus, int n)
> >>>>        /* Test and clear notifier after disabling event,
> >>>>         * in case poll callback didn't have time to run.
> >>>>         */
> >>>> -    virtio_queue_host_notifier_read(notifier);
> >>>> +    if (!vdev->disable_ioeventfd_handler)
> >>>> +        virtio_queue_host_notifier_read(notifier);
> >>>>        event_notifier_cleanup(notifier);
> >>>>    }
> >>>>
> >>>> --
> >>>> 1.8.3.1
> >>>>
>


