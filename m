Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374634BF2DD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 08:46:42 +0100 (CET)
Received: from localhost ([::1]:51098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMPsf-0006jm-B2
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 02:46:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nMPpQ-0004fo-UA
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:43:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nMPpL-0005oy-Vc
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645515792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IuvQ3jheunmQH1WtbgP5r5+N6QkQt8+eFp+N6Cu+lHs=;
 b=jQr0OXSJLuBI45I2M4dGgScGNps3Dh55RJRlcc3oNWoojGm0Xn0DkM1d6Sb3igWcnSqG3p
 Zbp1q88pafMDlIzGhLbK4ySq3vlFzi56Gbv2VRtGfoAtBPu7/PKDfHJaqWUyI6IH+6tSAG
 B8ngFzgrpF+nEqeZiinO3djYtDcd/AE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-6ZizMVx0N1mA4QaYHKewGw-1; Tue, 22 Feb 2022 02:43:11 -0500
X-MC-Unique: 6ZizMVx0N1mA4QaYHKewGw-1
Received: by mail-qv1-f71.google.com with SMTP id
 p4-20020a05621421e400b0042d006b2328so19997270qvj.15
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 23:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IuvQ3jheunmQH1WtbgP5r5+N6QkQt8+eFp+N6Cu+lHs=;
 b=Lx8frugmYXlNGnVkg7KxEUzrZtl9Kt+s0SvwVqcGmbPr5Sk+tnbva6pbXgyAhZP5/2
 HLGSEgkqZop4WXw8/ow+E2QlP32Flkeu8cX3hEcxxDhX4cI7JlihZAnsg4Mpt4Q6VQbK
 IoYrdhIRPUvfZqUv+C/WBsoPjw9GHYRLg8De4FQ9lOiD3vu5F+3wQAPoZ8R6U5Ysvmj0
 OjhZVk5eNGtkYPR36AaAAZSnPamciXOjjG6JSoTnaq97Koh1IdxmmO58YdFm3NKVgE+J
 nZLlGfh7XK/ac2UwU+hjIjkY+O+xrmWGin1nmZ1b1317SuH5R0TvuR2XuMJG52vZGv3R
 fz7w==
X-Gm-Message-State: AOAM530vI7lhPF96YrdnAo5n3LawU6T+PwupUdGMLhEFq0MtHKqcw/6V
 6NC4EHoSSorxg8QOT2edAVeUu1X+Cf1TKloSbDInXzpyJ7AyQBcyFdGReKSN/uqln5K/BgrrxIt
 z86i41YOc2B9vKH4EWn7/8VcV2hOyCzI=
X-Received: by 2002:ac8:7dc6:0:b0:2de:708:3e3a with SMTP id
 c6-20020ac87dc6000000b002de07083e3amr9084664qte.459.1645515790448; 
 Mon, 21 Feb 2022 23:43:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfcQamir4PF18pAiIAEQsExRv3Ap5rFfkpLQ9HRyBp6R8wJS1jDL0BDmIyDKYidIk447fmhlMcBG1NcuNR8Uk=
X-Received: by 2002:ac8:7dc6:0:b0:2de:708:3e3a with SMTP id
 c6-20020ac87dc6000000b002de07083e3amr9084644qte.459.1645515790109; Mon, 21
 Feb 2022 23:43:10 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-18-eperezma@redhat.com>
 <82b8c3bf-1b11-86c7-4fad-294f5ccf1278@redhat.com>
 <CAJaqyWdRKZp6CwnE+HAr0JALhSRh-trJbZ01kddnLTuRX_tMKQ@mail.gmail.com>
 <3d0dfaaa-a67c-6f48-fd03-45d2661ba92a@redhat.com>
 <CAJaqyWfEEg2PKgxBAFwYhF9LD1oDtwVYXSjHHnCbstT3dvL2GA@mail.gmail.com>
 <02f29b62-6656-ba2f-1475-251b16e0e978@redhat.com>
 <CAJaqyWcoHgToqsR-bVRctTnhgufmarR_2hh4O_VoCbCGp8WNhg@mail.gmail.com>
 <CACGkMEs+c8_TkrQ4rgtR9u5xYzhJfrzQ9Wuohs+Q_GXFLmOC7w@mail.gmail.com>
In-Reply-To: <CACGkMEs+c8_TkrQ4rgtR9u5xYzhJfrzQ9Wuohs+Q_GXFLmOC7w@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 22 Feb 2022 08:42:33 +0100
Message-ID: <CAJaqyWd2PQFedaEOV7YVZgp0m37snn-4LYYtNw7g4u+7hrtq=Q@mail.gmail.com>
Subject: Re: [PATCH 17/31] vdpa: adapt vhost_ops callbacks to svq
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Feb 22, 2022 at 4:16 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Feb 22, 2022 at 1:23 AM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Mon, Feb 21, 2022 at 8:15 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > >
> > > =E5=9C=A8 2022/2/18 =E4=B8=8A=E5=8D=881:13, Eugenio Perez Martin =E5=
=86=99=E9=81=93:
> > > > On Tue, Feb 8, 2022 at 4:58 AM Jason Wang <jasowang@redhat.com> wro=
te:
> > > >>
> > > >> =E5=9C=A8 2022/2/1 =E4=B8=8A=E5=8D=882:58, Eugenio Perez Martin =
=E5=86=99=E9=81=93:
> > > >>> On Sun, Jan 30, 2022 at 5:03 AM Jason Wang <jasowang@redhat.com> =
wrote:
> > > >>>> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =
=E5=86=99=E9=81=93:
> > > >>>>> First half of the buffers forwarding part, preparing vhost-vdpa
> > > >>>>> callbacks to SVQ to offer it. QEMU cannot enable it at this mom=
ent, so
> > > >>>>> this is effectively dead code at the moment, but it helps to re=
duce
> > > >>>>> patch size.
> > > >>>>>
> > > >>>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > >>>>> ---
> > > >>>>>     hw/virtio/vhost-shadow-virtqueue.h |   2 +-
> > > >>>>>     hw/virtio/vhost-shadow-virtqueue.c |  21 ++++-
> > > >>>>>     hw/virtio/vhost-vdpa.c             | 133 ++++++++++++++++++=
++++++++---
> > > >>>>>     3 files changed, 143 insertions(+), 13 deletions(-)
> > > >>>>>
> > > >>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vho=
st-shadow-virtqueue.h
> > > >>>>> index 035207a469..39aef5ffdf 100644
> > > >>>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
> > > >>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > > >>>>> @@ -35,7 +35,7 @@ size_t vhost_svq_device_area_size(const Vhost=
ShadowVirtqueue *svq);
> > > >>>>>
> > > >>>>>     void vhost_svq_stop(VhostShadowVirtqueue *svq);
> > > >>>>>
> > > >>>>> -VhostShadowVirtqueue *vhost_svq_new(void);
> > > >>>>> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize);
> > > >>>>>
> > > >>>>>     void vhost_svq_free(VhostShadowVirtqueue *vq);
> > > >>>>>
> > > >>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vho=
st-shadow-virtqueue.c
> > > >>>>> index f129ec8395..7c168075d7 100644
> > > >>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > >>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > >>>>> @@ -277,9 +277,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *=
svq)
> > > >>>>>     /**
> > > >>>>>      * Creates vhost shadow virtqueue, and instruct vhost devic=
e to use the shadow
> > > >>>>>      * methods and file descriptors.
> > > >>>>> + *
> > > >>>>> + * @qsize Shadow VirtQueue size
> > > >>>>> + *
> > > >>>>> + * Returns the new virtqueue or NULL.
> > > >>>>> + *
> > > >>>>> + * In case of error, reason is reported through error_report.
> > > >>>>>      */
> > > >>>>> -VhostShadowVirtqueue *vhost_svq_new(void)
> > > >>>>> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
> > > >>>>>     {
> > > >>>>> +    size_t desc_size =3D sizeof(vring_desc_t) * qsize;
> > > >>>>> +    size_t device_size, driver_size;
> > > >>>>>         g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostSh=
adowVirtqueue, 1);
> > > >>>>>         int r;
> > > >>>>>
> > > >>>>> @@ -300,6 +308,15 @@ VhostShadowVirtqueue *vhost_svq_new(void)
> > > >>>>>         /* Placeholder descriptor, it should be deleted at set_=
kick_fd */
> > > >>>>>         event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK=
_FD);
> > > >>>>>
> > > >>>>> +    svq->vring.num =3D qsize;
> > > >>>> I wonder if this is the best. E.g some hardware can support up t=
o 32K
> > > >>>> queue size. So this will probably end up with:
> > > >>>>
> > > >>>> 1) SVQ use 32K queue size
> > > >>>> 2) hardware queue uses 256
> > > >>>>
> > > >>> In that case SVQ vring queue size will be 32K and guest's vring c=
an
> > > >>> negotiate any number with SVQ equal or less than 32K,
> > > >>
> > > >> Sorry for being unclear what I meant is actually
> > > >>
> > > >> 1) SVQ uses 32K queue size
> > > >>
> > > >> 2) guest vq uses 256
> > > >>
> > > >> This looks like a burden that needs extra logic and may damage the
> > > >> performance.
> > > >>
> > > > Still not getting this point.
> > > >
> > > > An available guest buffer, although contiguous in GPA/GVA, can expa=
nd
> > > > in multiple buffers if it's not contiguous in qemu's VA (by the whi=
le
> > > > loop in virtqueue_map_desc [1]). In that scenario it is better to h=
ave
> > > > "plenty" of SVQ buffers.
> > >
> > >
> > > Yes, but this case should be rare. So in this case we should deal wit=
h
> > > overrun on SVQ, that is
> > >
> > > 1) SVQ is full
> > > 2) guest VQ isn't
> > >
> > > We need to
> > >
> > > 1) check the available buffer slots
> > > 2) disable guest kick and wait for the used buffers
> > >
> > > But it looks to me the current code is not ready for dealing with thi=
s case?
> > >
> >
> > Yes it deals, that's the meaning of svq->next_guest_avail_elem.
>
> Oh right, I missed that.
>
> >
> > >
> > > >
> > > > I'm ok if we decide to put an upper limit though, or if we decide n=
ot
> > > > to handle this situation. But we would leave out valid virtio drive=
rs.
> > > > Maybe to set a fixed upper limit (1024?)? To add another parameter
> > > > (x-svq-size-n=3DN)?
> > > >
> > > > If you mean we lose performance because memory gets more sparse I
> > > > think the only possibility is to limit that way.
> > >
> > >
> > > If guest is not using 32K, having a 32K for svq may gives extra stres=
s
> > > on the cache since we will end up with a pretty large working set.
> > >
> >
> > That might be true. My guess is that it should not matter, since SVQ
> > and the guest's vring will have the same numbers of scattered buffers
> > and the avail / used / packed ring will be consumed more or less
> > sequentially. But I haven't tested.
> >
> > I think it's better to add an upper limit (either fixed or in the
> > qemu's backend's cmdline) later if we see that this is a problem.
>
> I'd suggest using the same size as what the guest saw.
>
> > Another solution now would be to get the number from the frontend
> > device cmdline instead of from the vdpa device. I'm ok with that, but
> > it doesn't delete the svq->next_guest_avail_elem processing, and it
> > comes with disadvantages in my opinion. More below.
>
> Right, we should keep next_guest_avail_elem. Using the same queue size
> is a balance between:
>
> 1) using next_guest_avail_elem (rare)
> 2) not give too much stress on the cache
>

Ok I'll change the SVQ size for the frontend size then.

> >
> > >
> > > >
> > > >> And this can lead other interesting situation:
> > > >>
> > > >> 1) SVQ uses 256
> > > >>
> > > >> 2) guest vq uses 1024
> > > >>
> > > >> Where a lot of more SVQ logic is needed.
> > > >>
> > > > If we agree that a guest descriptor can expand in multiple SVQ
> > > > descriptors, this should be already handled by the previous logic t=
oo.
> > > >
> > > > But this should only happen in case that qemu is launched with a "b=
ad"
> > > > cmdline, isn't it?
> > >
> > >
> > > This seems can happen when we use -device
> > > virtio-net-pci,tx_queue_size=3D1024 with a 256 size vp_vdpa device at=
 least?
> > >
> >
> > I'm going to use the rx queue here since it's more accurate, tx has
> > its own limit separately.
> >
> > If we use rx_queue_size=3D256 in L0 and rx_queue_size=3D1024 in L1 with=
 no
> > SVQ, L0 qemu will happily accept 1024 as size
>
> Interesting, looks like a bug (I guess it works since you enable vhost?):
>

No, emulated interfaces. More below.

> Per virtio-spec:
>
> """
> Queue Size. On reset, specifies the maximum queue size supported by
> the device. This can be modified by the driver to reduce memory
> requirements. A 0 means the queue is unavailable.
> """
>

Yes but how should it fail? Drivers do not know how to check if the
value was invalid. DEVICE_NEEDS_RESET?

The L0 emulated device simply receives the write to pci and calls
virtio_queue_set_num. I can try to add to the check "num <
vdev->vq[n].vring.num_default", but there is no way to notify the
guest that setting the value failed.

> We can't increase the queue_size from 256 to 1024 actually. (Only
> decrease is allowed).
>
> > when L1 qemu writes that
> > value at vhost_virtqueue_start. I'm not sure what would happen with a
> > real device, my guess is that the device will fail somehow. That's
> > what I meant with a "bad cmdline", I should have been more specific.
>
> I should say that it's something that is probably unrelated to this
> series but needs to be addressed.
>

I agree, I can start developing the patches for sure.

> >
> > If we add SVQ to the mix, the guest first negotiates the 1024 with the
> > qemu device model. After that, vhost.c will try to write 1024 too but
> > this is totally ignored by this patch's changes at
> > vhost_vdpa_set_vring_num. Finally, SVQ will set 256 as a ring size to
> > the device, since it's the read value from the device, leading to your
> > scenario. So SVQ effectively isolates both sides and makes possible
> > the communication, even with a device that does not support so many
> > descriptors.
> >
> > But SVQ already handles this case: It's the same as if the buffers are
> > fragmented in HVA and queue size is equal at both sides. That's why I
> > think SVQ size should depend on the backend device's size, not
> > frontend cmdline.
>
> Right.
>
> Thanks
>
> >
> > Thanks!
> >
> > >
> > > >
> > > > If I run that example with vp_vdpa, L0 qemu will happily accept 102=
4
> > > > as a queue size [2]. But if the vdpa device maximum queue size is
> > > > effectively 256, this will result in an error: We're not exposing i=
t
> > > > to the guest at any moment but with qemu's cmdline.
> > > >
> > > >>> including 256.
> > > >>> Is that what you mean?
> > > >>
> > > >> I mean, it looks to me the logic will be much more simplified if w=
e just
> > > >> allocate the shadow virtqueue with the size what guest can see (gu=
est
> > > >> vring).
> > > >>
> > > >> Then we don't need to think if the difference of the queue size ca=
n have
> > > >> any side effects.
> > > >>
> > > > I think that we cannot avoid that extra logic unless we force GPA t=
o
> > > > be contiguous in IOVA. If we are sure the guest's buffers cannot be=
 at
> > > > more than one descriptor in SVQ, then yes, we can simplify things. =
If
> > > > not, I think we are forced to carry all of it.
> > >
> > >
> > > Yes, I agree, the code should be robust to handle any case.
> > >
> > > Thanks
> > >
> > >
> > > >
> > > > But if we prove it I'm not opposed to simplifying things and making
> > > > head at SVQ =3D=3D head at guest.
> > > >
> > > > Thanks!
> > > >
> > > > [1] https://gitlab.com/qemu-project/qemu/-/blob/17e31340/hw/virtio/=
virtio.c#L1297
> > > > [2] But that's not the whole story: I've been running limited in tx
> > > > descriptors because of virtio_net_max_tx_queue_size, which predates
> > > > vdpa. I'll send a patch to also un-limit it.
> > > >
> > > >>> If with hardware queues you mean guest's vring, not sure why it i=
s
> > > >>> "probably 256". I'd say that in that case with the virtio-net ker=
nel
> > > >>> driver the ring size will be the same as the device export, for
> > > >>> example, isn't it?
> > > >>>
> > > >>> The implementation should support any combination of sizes, but t=
he
> > > >>> ring size exposed to the guest is never bigger than hardware one.
> > > >>>
> > > >>>> ? Or we SVQ can stick to 256 but this will this cause trouble if=
 we want
> > > >>>> to add event index support?
> > > >>>>
> > > >>> I think we should not have any problem with event idx. If you mea=
n
> > > >>> that the guest could mark more buffers available than SVQ vring's
> > > >>> size, that should not happen because there must be less entries i=
n the
> > > >>> guest than SVQ.
> > > >>>
> > > >>> But if I understood you correctly, a similar situation could happ=
en if
> > > >>> a guest's contiguous buffer is scattered across many qemu's VA ch=
unks.
> > > >>> Even if that would happen, the situation should be ok too: SVQ kn=
ows
> > > >>> the guest's avail idx and, if SVQ is full, it will continue forwa=
rding
> > > >>> avail buffers when the device uses more buffers.
> > > >>>
> > > >>> Does that make sense to you?
> > > >>
> > > >> Yes.
> > > >>
> > > >> Thanks
> > > >>
> > >
> >
>


