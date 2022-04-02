Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9714EFDEB
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 04:12:26 +0200 (CEST)
Received: from localhost ([::1]:33434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naTFZ-0004w8-Eg
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 22:12:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naTDz-0004Ex-Ac
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naTDw-0006z7-Ll
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648865443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5i32OZiKv9fv1wUYhDFAWdV0ilx8jCvjIybT8A7nGsU=;
 b=SZ2f4A8Gq5m6GbuGvs6C5MBTP7uIJ2i6U1cvheGDYRb0d3uzlWja+yWbAvlfWvdzkKUmrH
 vr4MEXtRCjnhXYuNOk0ilrYssbvBwGPyPTM8ug3KECIsee0099PvBr0fgwThGf6+yj1DVd
 hGLAvT3VvdqMZKAyzGVeITqYRyAHtP8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28--T1gSqQQMCmfUHpHxSGiBg-1; Fri, 01 Apr 2022 22:10:42 -0400
X-MC-Unique: -T1gSqQQMCmfUHpHxSGiBg-1
Received: by mail-lf1-f69.google.com with SMTP id
 j28-20020ac2455c000000b0044a3dd2b75aso1926501lfm.9
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 19:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5i32OZiKv9fv1wUYhDFAWdV0ilx8jCvjIybT8A7nGsU=;
 b=YL9E8TO64bg446ykdS4jWpnU510lXvzSH9lWDiIbVtDBsmv1J5lCJoq03JZolqrB3E
 B7ElJoZWrygEXrdmedwVCTe7eqg5DRqXmlsW4Co7vunKKtcOVdkS323/1qZpRKjLH3Oa
 9i1/jNpTa/k8TpK//H+c96OaSyrWpeLgq4Jd2l5Crs9Sb75McXlCWmyaWR1P/TiTacAj
 TGXHlg1Fo3DJpEDvVEi0vzgW4soSf4beiUMSZgvaHO/IKWAYt24FBQCJk1PnfaQ4E5Lz
 feZBF3cKld3Cv1LsrRKEBVKH1tLCa5kHh40SdKsUq8WJBQ4ZTMGncrjFtcFH9rPgzX8d
 zoJA==
X-Gm-Message-State: AOAM533Hzq5B+nWMVNtVuIqIxz+/jUwCizJvnIARIdxe5ypEDX/fBE8g
 1bnHvDqd7Ts+Yc876nkiUAVrJY+kgz38kYqZqZapGJ9T3VS7d41AGl7vIRSDP8lw/SsGwMKQAMy
 roK6O42vLrZBcbdEPE1IVehde76gWO34=
X-Received: by 2002:a05:6512:2203:b0:44a:12c9:8696 with SMTP id
 h3-20020a056512220300b0044a12c98696mr16231900lfu.98.1648865440687; 
 Fri, 01 Apr 2022 19:10:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7WUCe0vi7zhXeBba3VkdJpVQIjclT6ennWb/HbXfvRAe6ZVGnr/zprjvtde141iEKyKKXspyPu7IBPPOOyUk=
X-Received: by 2002:a05:6512:2203:b0:44a:12c9:8696 with SMTP id
 h3-20020a056512220300b0044a12c98696mr16231889lfu.98.1648865440375; Fri, 01
 Apr 2022 19:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-2-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEv=bhGFHqv=Mi7FSnwvDZU4GAvFw564piP6nr3CHD+-Wg@mail.gmail.com>
 <2e9ec844-952d-b43c-7ed3-499eeac6b7cb@oracle.com>
 <CACGkMEsQMk9Tbk76HLnKXF=YQ04K8T3tysk927wt_prkPw8ONQ@mail.gmail.com>
 <293bb948-f3f1-22bb-ee8b-30656f7620b5@oracle.com>
In-Reply-To: <293bb948-f3f1-22bb-ee8b-30656f7620b5@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sat, 2 Apr 2022 10:10:29 +0800
Message-ID: <CACGkMEt4DjiKb-q9FhYFdhrXPhs8+daD6EPaRwShBqDCixe0wQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] virtio-net: align ctrl_vq index for non-mq guest for
 vhost_vdpa
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Sat, Apr 2, 2022 at 6:32 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 3/31/2022 1:39 AM, Jason Wang wrote:
> > On Wed, Mar 30, 2022 at 11:48 PM Si-Wei Liu <si-wei.liu@oracle.com> wro=
te:
> >>
> >>
> >> On 3/30/2022 2:00 AM, Jason Wang wrote:
> >>> On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wr=
ote:
> >>>> With MQ enabled vdpa device and non-MQ supporting guest e.g.
> >>>> booting vdpa with mq=3Don over OVMF of single vqp, below assert
> >>>> failure is seen:
> >>>>
> >>>> ../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `i=
dx >=3D dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
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
mized out>, mr=3D0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/ho=
st-utils.h:165
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
> >>>> The cause for the assert failure is due to that the vhost_dev index
> >>>> for the ctrl vq was not aligned with actual one in use by the guest.
> >>>> Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
> >>>> if guest doesn't support multiqueue, the guest vq layout would shrin=
k
> >>>> to a single queue pair, consisting of 3 vqs in total (rx, tx and ctr=
l).
> >>>> This results in ctrl_vq taking a different vhost_dev group index tha=
n
> >>>> the default. We can map vq to the correct vhost_dev group by checkin=
g
> >>>> if MQ is supported by guest and successfully negotiated. Since the
> >>>> MQ feature is only present along with CTRL_VQ, we make sure the inde=
x
> >>>> 2 is only meant for the control vq while MQ is not supported by gues=
t.
> >>>>
> >>>> Be noted if QEMU or guest doesn't support control vq, there's no bot=
her
> >>>> exposing vhost_dev and guest notifier for the control vq. Since
> >>>> vhost_net_start/stop implies DRIVER_OK is set in device status, feat=
ure
> >>>> negotiation should be completed when reaching virtio_net_vhost_statu=
s().
> >>>>
> >>>> Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
> >>>> Suggested-by: Jason Wang <jasowang@redhat.com>
> >>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> >>>> ---
> >>>>    hw/net/virtio-net.c | 19 ++++++++++++++++---
> >>>>    1 file changed, 16 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >>>> index 1067e72..484b215 100644
> >>>> --- a/hw/net/virtio-net.c
> >>>> +++ b/hw/net/virtio-net.c
> >>>> @@ -245,7 +245,8 @@ static void virtio_net_vhost_status(VirtIONet *n=
, uint8_t status)
> >>>>        VirtIODevice *vdev =3D VIRTIO_DEVICE(n);
> >>>>        NetClientState *nc =3D qemu_get_queue(n->nic);
> >>>>        int queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
> >>>> -    int cvq =3D n->max_ncs - n->max_queue_pairs;
> >>>> +    int cvq =3D virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)=
 ?
> >>>> +              n->max_ncs - n->max_queue_pairs : 0;
> >>> Let's use a separate patch for this.
> >> Yes, I can do that. Then the new patch will become a requisite for thi=
s
> >> patch.
> >>
> >>>>        if (!get_vhost_net(nc->peer)) {
> >>>>            return;
> >>>> @@ -3170,8 +3171,14 @@ static NetClientInfo net_virtio_info =3D {
> >>>>    static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev,=
 int idx)
> >>>>    {
> >>>>        VirtIONet *n =3D VIRTIO_NET(vdev);
> >>>> -    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> >>>> +    NetClientState *nc;
> >>>>        assert(n->vhost_started);
> >>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx =3D=
=3D 2) {
> >>>> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))=
;
> >>> This assert seems guest trigger-able. If yes, I would remove this or
> >>> replace it with log_guest_error.
> >> This assert actually is relevant to the cvq change in
> >> virtio_net_vhost_status(). Since the same check on VIRTIO_NET_F_CTRL_V=
Q
> >> has been done earlier, it is assured that CTRL_VQ is negotiated when
> >> getting here.
> >> Noted the vhost_started is asserted in the same function, which in tur=
n
> >> implies DRIVER_OK is set meaning feature negotiation is complete. I
> >> can't easily think of a scenario which guest may inadvertently or
> >> purposely trigger the assert?
> > So the code can be triggered like e.g unmasking:
> >
> > virtio_pci_vq_vector_unmask()
> >          k->guest_notifier_pending()
> Hmmm, are you concerned more about idx being invalid, or
> VIRTIO_NET_F_CTRL_VQ getting cleared?

Something like this, we can't let a buggy driver crash into Qemu.

>
> virtio_pci_vector_unmask() has validation through virtio_queue_get_num()
> that ensures the vq index is valid.

Actually not, it just check whether the vq size is set:

int virtio_queue_get_num(VirtIODevice *vdev, int n)
{
    return vdev->vq[n].vring.num;
}

> While it doesn't seem possible for
> VIRTIO_NET_F_CTRL_VQ to be cleared without device reset first,

Probably, since we had a check in virtio_set_features():

    /*
     * The driver must not attempt to set features after feature negotiatio=
n
     * has finished.
     */
    if (vdev->status & VIRTIO_CONFIG_S_FEATURES_OK) {
        return -EINVAL;
    }

But another interesting part is that the guest_feautres come from the
migration stream as well:

static const VMStateDescription vmstate_virtio_64bit_features =3D {
    .name =3D "virtio/64bit_features",
    .version_id =3D 1,
    .minimum_version_id =3D 1,
    .needed =3D &virtio_64bit_features_needed,
    .fields =3D (VMStateField[]) {
        VMSTATE_UINT64(guest_features, VirtIODevice),
        VMSTATE_END_OF_LIST()
    }
};

We should also be ready to let the buggy migration flow to crash us.

>during
> which the pending event left over on guest notifier eventfd should have
> been completed within virtio_pci_set_guest_notifiers(false) before
> vhost_net_stop() returns. If I am not missing something here, I guess
> we're probably fine?

I'm not sure I got here, but the mask/unmask is not necessarily
related to vhost stop. E.g it can happen if guest want to change IRQ
affinity.

Thanks

>
> -Siwei
>
> >
> > Thanks
> >
> >
> >> -Siwei
> >>
> >>>> +        nc =3D qemu_get_subqueue(n->nic, n->max_queue_pairs);
> >>>> +    } else {
> >>>> +        nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> >>>> +    }
> >>>>        return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), i=
dx);
> >>>>    }
> >>>>
> >>>> @@ -3179,8 +3186,14 @@ static void virtio_net_guest_notifier_mask(Vi=
rtIODevice *vdev, int idx,
> >>>>                                               bool mask)
> >>>>    {
> >>>>        VirtIONet *n =3D VIRTIO_NET(vdev);
> >>>> -    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> >>>> +    NetClientState *nc;
> >>>>        assert(n->vhost_started);
> >>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx =3D=
=3D 2) {
> >>>> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))=
;
> >>> And this.
> >>>
> >>> Thanks
> >>>
> >>>
> >>>> +        nc =3D qemu_get_subqueue(n->nic, n->max_queue_pairs);
> >>>> +    } else {
> >>>> +        nc =3D qemu_get_subqueue(n->nic, vq2q(idx));
> >>>> +    }
> >>>>        vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
> >>>>                                 vdev, idx, mask);
> >>>>    }
> >>>> --
> >>>> 1.8.3.1
> >>>>
>


