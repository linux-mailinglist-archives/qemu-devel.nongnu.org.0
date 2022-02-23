Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9014C07E0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 03:29:23 +0100 (CET)
Received: from localhost ([::1]:54846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMhP6-00049O-Cn
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 21:29:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMhMo-0002iv-9H
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 21:26:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMhMj-0006CY-5Q
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 21:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645583211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFBrVW2j7bgxrq7IKE3e6mJZ/d5bXY7U1H0yzf0NnOQ=;
 b=aSQ4Q+LBmkzserjABtze5Gg0kggrABSUmaVpcZPb08xlviyK4g1xisrmLSXGTuoN65xlDL
 DDHRLJdVdhFFcpxMn24RQRVRuPVd63N1+4XSTGw0YOYgxkR8qZ6QtHnv5jnXETWsW8e6uV
 RbELa4htEZqqLQYGCrumH++Zx1wknSY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-vHdwv8VvPJCCnVVYxqAayA-1; Tue, 22 Feb 2022 21:26:50 -0500
X-MC-Unique: vHdwv8VvPJCCnVVYxqAayA-1
Received: by mail-lj1-f199.google.com with SMTP id
 r27-20020a2e575b000000b002463f43ca0aso4063532ljd.7
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 18:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HFBrVW2j7bgxrq7IKE3e6mJZ/d5bXY7U1H0yzf0NnOQ=;
 b=wmGwd8P6LBMvFsI0PUDw5NSM0dytvhi4mWuWq7LB25rHZF93X+3KkvDft6yhrZudJz
 Y8nJ0EZzZ/PVh6CL/cASq4lpbtnjEhUFVjWdB+FW3bLtIx4Ffc9qWWWWR/6qdtFHYsaw
 8Rs5uJX8P7VGWXOFvbbQ30kGNFa/cQr568az5HltS5x5dTVXnST+TFiDIpt5dG8rxDfE
 A+naSAH2Do+47ifWwgCWTxynaO+7sy/JGYKUIcjw+z/+AkD8O5ar6b+X6fTvAr8yDC+y
 T1rfaWJfQqqjHpxDmgOiKGJrmZsnLGaahvxAByh3017S/20iKclvDmvu7W36bS9WPDkU
 TjfQ==
X-Gm-Message-State: AOAM5328/QZCKuRXCvKDeHb9ujJcCF8Kz4F8M/ZDCtTrpHglWLwVCjvC
 P2nwemVwc73Ug5q/OR3A14kKWKOAAlQ9T6TN0lCb0VY1GcVJftSsJjRwVDm7w4v7aZP0dDI/Z9X
 2Dx8oMHIBWc0Cng5wdr/uwaAAZYJrezE=
X-Received: by 2002:a2e:a885:0:b0:23a:30ac:5798 with SMTP id
 m5-20020a2ea885000000b0023a30ac5798mr20108268ljq.73.1645583208819; 
 Tue, 22 Feb 2022 18:26:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVBxswc3ZfjIgVcgr8VKwp0TmNSNXUykFxP8Cgjg2kuAqrwJwqJnKROea8cFBvfGMGsd/z+UlAWuBFyLqSIkA=
X-Received: by 2002:a2e:a885:0:b0:23a:30ac:5798 with SMTP id
 m5-20020a2ea885000000b0023a30ac5798mr20108242ljq.73.1645583208512; Tue, 22
 Feb 2022 18:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-19-eperezma@redhat.com>
 <62e877ca-51d7-da85-13c9-d469a85f33c9@redhat.com>
 <CAJaqyWfF01k3LntM7RLEmFcej=EY2d4+2MARKXPptQ2J7VnB9A@mail.gmail.com>
 <7c52e50a-4c8e-7865-1c3d-8b156986c13a@redhat.com>
 <CAJaqyWedqtzRW=ur7upchneSc-oOkvkr3FUph_BfphV3zTmnkw@mail.gmail.com>
 <7e72def5-a1e9-ad92-2c83-fda72ffd7b60@redhat.com>
 <CAJaqyWcHhMpjJ4kde1ejV5c_vP7_8PvfXpi5u9rdWuaORFt_zg@mail.gmail.com>
 <24717b73-7aca-dd75-22d4-2b8d9e6bd737@redhat.com>
 <CAJaqyWePWg+eeQjjcMh24k0K+yUQUF2x0yXH32tPPWEw_wYP0Q@mail.gmail.com>
In-Reply-To: <CAJaqyWePWg+eeQjjcMh24k0K+yUQUF2x0yXH32tPPWEw_wYP0Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 23 Feb 2022 10:26:37 +0800
Message-ID: <CACGkMEsfKWw-sJWH0R+bV=UgdviQUTkY+FYQjNGx+OuBcQx4eA@mail.gmail.com>
Subject: Re: [PATCH 18/31] vhost: Shadow virtqueue buffers forwarding
To: Eugenio Perez Martin <eperezma@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 4:56 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Feb 22, 2022 at 8:26 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/2/21 =E4=B8=8B=E5=8D=884:15, Eugenio Perez Martin =E5=86=
=99=E9=81=93:
> > > On Mon, Feb 21, 2022 at 8:44 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > >>
> > >> =E5=9C=A8 2022/2/17 =E4=B8=8B=E5=8D=888:48, Eugenio Perez Martin =E5=
=86=99=E9=81=93:
> > >>> On Tue, Feb 8, 2022 at 9:16 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > >>>> =E5=9C=A8 2022/2/1 =E4=B8=8B=E5=8D=887:25, Eugenio Perez Martin =
=E5=86=99=E9=81=93:
> > >>>>> On Sun, Jan 30, 2022 at 7:47 AM Jason Wang <jasowang@redhat.com> =
wrote:
> > >>>>>> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =
=E5=86=99=E9=81=93:
> > >>>>>>> @@ -272,6 +590,28 @@ void vhost_svq_set_svq_kick_fd(VhostShadow=
Virtqueue *svq, int svq_kick_fd)
> > >>>>>>>      void vhost_svq_stop(VhostShadowVirtqueue *svq)
> > >>>>>>>      {
> > >>>>>>>          event_notifier_set_handler(&svq->svq_kick, NULL);
> > >>>>>>> +    g_autofree VirtQueueElement *next_avail_elem =3D NULL;
> > >>>>>>> +
> > >>>>>>> +    if (!svq->vq) {
> > >>>>>>> +        return;
> > >>>>>>> +    }
> > >>>>>>> +
> > >>>>>>> +    /* Send all pending used descriptors to guest */
> > >>>>>>> +    vhost_svq_flush(svq, false);
> > >>>>>> Do we need to wait for all the pending descriptors to be complet=
ed here?
> > >>>>>>
> > >>>>> No, this function does not wait, it only completes the forwarding=
 of
> > >>>>> the *used* descriptors.
> > >>>>>
> > >>>>> The best example is the net rx queue in my opinion. This call wil=
l
> > >>>>> check SVQ's vring used_idx and will forward the last used descrip=
tors
> > >>>>> if any, but all available descriptors will remain as available fo=
r
> > >>>>> qemu's VQ code.
> > >>>>>
> > >>>>> To skip it would miss those last rx descriptors in migration.
> > >>>>>
> > >>>>> Thanks!
> > >>>> So it's probably to not the best place to ask. It's more about the
> > >>>> inflight descriptors so it should be TX instead of RX.
> > >>>>
> > >>>> I can imagine the migration last phase, we should stop the vhost-v=
DPA
> > >>>> before calling vhost_svq_stop(). Then we should be fine regardless=
 of
> > >>>> inflight descriptors.
> > >>>>
> > >>> I think I'm still missing something here.
> > >>>
> > >>> To be on the same page. Regarding tx this could cause repeated tx
> > >>> frames (one at source and other at destination), but never a missed
> > >>> buffer not transmitted. The "stop before" could be interpreted as "=
SVQ
> > >>> is not forwarding available buffers anymore". Would that work?
> > >>
> > >> Right, but this only work if
> > >>
> > >> 1) a flush to make sure TX DMA for inflight descriptors are all comp=
leted
> > >>
> > >> 2) just mark all inflight descriptor used
> > >>
> > > It currently trusts on the reverse: Buffers not marked as used (by th=
e
> > > device) will be available in the destination, so expect
> > > retransmissions.
> >
> >
> > I may miss something but I think we do migrate last_avail_idx. So there
> > won't be a re-transmission, since we depend on qemu virtqueue code to
> > deal with vring base?
> >
>
> On stop, vhost_virtqueue_stop calls vhost_vdpa_get_vring_base. In SVQ
> mode, it returns last_used_idx. After that, vhost.c code set VirtQueue
> last_avail_idx =3D=3D last_used_idx, and it's migrated after that if I'm
> not wrong.

Ok, I miss these details in the review. I suggest mentioning this in
the change log and add a comment in vhost_vdpa_get_vring_base().

>
> vhost kernel migrates last_avail_idx, but it makes rx buffers
> available on-demand, unlike SVQ. So it does not need to unwind buffers
> or anything like that. Because of how SVQ works with the rx queue,
> this is not possible, since the destination will find no available
> buffers for rx. And for tx you already have described the scenario.
>
> In other words, we cannot see SVQ as a vhost device in that regard:
> SVQ looks for total drain (as "make all guest's buffers available for
> the device ASAP") vs the vhost device which can live with a lot of
> available ones and it will use them on demand. Same problem as
> masking. So the difference in behavior is justified in my opinion, and
> it can be improved in the future with the vdpa in-flight descriptors.
>
> If we restore the state that way in a virtio-net device, it will see
> the available ones as expected, not as in-flight.
>
> Another possibility is to transform all of these into in-flight ones,
> but I feel it would create problems. Can we migrate all rx queues as
> in-flight, with 0 bytes written? Is it worth it?

To clarify, for inflight I meant from the device point of view, that
is [last_used_idx, last_avail_idx).

So for RX and SVQ, it should be as simple as stop forwarding buffers
since last_used_idx should be the same as last_avail_idx in this case.
(Though technically the rx buffer might be modified by the NIC).

> I didn't investigate
> that path too much, but I think the virtio-net emulated device does
> not support that at the moment. If I'm not wrong, we should copy
> something like the body of virtio_blk_load_device if we want to go
> that route.
>
> The current approach might be too net-centric, so let me know if this
> behavior is unexpected or we can do better otherwise.

It should be fine to start from a networking device. We can add more
in the future if it is needed.

Thanks

>
> Thanks!
>
> > Thanks
> >
> >
> > >
> > > Thanks!
> > >
> > >> Otherwise there could be buffers that is inflight forever.
> > >>
> > >> Thanks
> > >>
> > >>
> > >>> Thanks!
> > >>>
> > >>>> Thanks
> > >>>>
> > >>>>
> > >>>>>> Thanks
> > >>>>>>
> > >>>>>>
> > >>>>>>> +
> > >>>>>>> +    for (unsigned i =3D 0; i < svq->vring.num; ++i) {
> > >>>>>>> +        g_autofree VirtQueueElement *elem =3D NULL;
> > >>>>>>> +        elem =3D g_steal_pointer(&svq->ring_id_maps[i]);
> > >>>>>>> +        if (elem) {
> > >>>>>>> +            virtqueue_detach_element(svq->vq, elem, elem->len)=
;
> > >>>>>>> +        }
> > >>>>>>> +    }
> > >>>>>>> +
> > >>>>>>> +    next_avail_elem =3D g_steal_pointer(&svq->next_guest_avail=
_elem);
> > >>>>>>> +    if (next_avail_elem) {
> > >>>>>>> +        virtqueue_detach_element(svq->vq, next_avail_elem,
> > >>>>>>> +                                 next_avail_elem->len);
> > >>>>>>> +    }
> > >>>>>>>      }
> >
>


