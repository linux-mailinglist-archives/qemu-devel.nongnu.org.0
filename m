Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E558998E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:56:55 +0200 (CEST)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJWez-0006lV-GB
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJWaN-0001dK-BW
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJWaH-0008Qn-NF
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659603120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0cWg2x8BbMSDn2rDh4VAMMiZchZGx1nB3tPdHIhyq8=;
 b=d8afSFytZgVIvLg8wQM0BRLTEurQ3yhfOzPwRBeyQMJrthwmq1JRAitD/WN6GzYHlodQxu
 UPVhdOE8kngjj8mRp3mNPTUEogRl9xrB1imjB+8n1BdfLND9AVE3WU3ifgZYyXRdYIxPwG
 AMhituILjEaPT8dAxTtzF79rO+mhMrE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-Cm1qAGLPNhC9T-TmkiO9hw-1; Thu, 04 Aug 2022 04:51:58 -0400
X-MC-Unique: Cm1qAGLPNhC9T-TmkiO9hw-1
Received: by mail-lj1-f199.google.com with SMTP id
 y11-20020a05651c220b00b0025e4bd7731fso2931200ljq.3
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 01:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H0cWg2x8BbMSDn2rDh4VAMMiZchZGx1nB3tPdHIhyq8=;
 b=KB2LyPSF9+lgAZTPlZeR/csL9AGJqY8T2PWtu1jPv4MKbaN+9Bq+jaba4Z2QfoFkXn
 q/cboTzK/hZqGGYvoYCq95hR/O1G/GZwYtcgOhYVB9UJMHaknvGQ3B9UUD0r+3L/NZ82
 FhVXhfvxmQB5ea1NoGmufiSR2VeDdChoHWYCO9mEuL5MXAjc19AFOmVu9j1sLTjYtblJ
 cb/fNa3Z4PICHib4UjjObzDAMy998U2kzW6lu+9FK/ackME1jyum97l2Z8DCZDkORtW1
 ZSH3uCln44/1Bx4ge1jf2W6u0D7yY32W25YQR6j8b+Ju80wnsD8X1Xjl55QjrSefcioB
 Il5Q==
X-Gm-Message-State: ACgBeo2oWQNTePkWloJH3wzwrSz9zOGeb+1C1eDaq0brPu0iIbE3QlJk
 /hdX6aHvJO9CC9E8jvOqWgOmG71iOxx+xd5zlwnyHdrs5B+INFIQVb9Mh6tzgV6t+3tZbLLNy9q
 KGzT61Fqh4/mxVkZdsgaSi74isqNJWQQ=
X-Received: by 2002:ac2:4205:0:b0:48a:95e6:395c with SMTP id
 y5-20020ac24205000000b0048a95e6395cmr420281lfh.238.1659603117141; 
 Thu, 04 Aug 2022 01:51:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6DvSmKlkRbRbI+zJ/LMAmOham3m8cNLJTFly7GHo2bBLuvWQ7coUp3hjDO/2NtD00pkxVnT3qlWBXvl0HQ/T0=
X-Received: by 2002:ac2:4205:0:b0:48a:95e6:395c with SMTP id
 y5-20020ac24205000000b0048a95e6395cmr420259lfh.238.1659603116784; Thu, 04 Aug
 2022 01:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220802175731.312115-1-eperezma@redhat.com>
 <20220802175731.312115-7-eperezma@redhat.com>
 <47e1e277-34e9-b043-0a74-bf2b67391c6a@redhat.com>
 <CAJaqyWc2+H0t1tgfmh6kgShJ9Obq46oUxX998YvRvQRfj3+eCA@mail.gmail.com>
 <CACGkMEuQ0cYAaGf6T+m_WuaK1n58XxGXney3jx5mDni78BqbYQ@mail.gmail.com>
 <CAJaqyWeQSLY7dPyaoAZaKtVQ9j8f7HnDk3eNcCTY5hK9cBKs+g@mail.gmail.com>
In-Reply-To: <CAJaqyWeQSLY7dPyaoAZaKtVQ9j8f7HnDk3eNcCTY5hK9cBKs+g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 4 Aug 2022 16:51:45 +0800
Message-ID: <CACGkMEtPFi+=HcRJ+RpD51K8Y_jBzPTfybMZMGRQ0izpZrwtkQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] vdpa: Make vhost_vdpa_net_cvq_map_elem accept
 any out sg
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 4, 2022 at 4:19 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Thu, Aug 4, 2022 at 9:51 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Aug 4, 2022 at 3:39 PM Eugenio Perez Martin <eperezma@redhat.co=
m> wrote:
> > >
> > > On Thu, Aug 4, 2022 at 6:17 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > >
> > > > =E5=9C=A8 2022/8/3 01:57, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > > > So its generic enough to accept any out sg buffer and we can inje=
ct
> > > > > NIC state messages.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > > v5: Accept out sg instead of dev_buffers[]
> > > > > ---
> > > > >   net/vhost-vdpa.c | 13 +++++++------
> > > > >   1 file changed, 7 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 33bf3d6409..2421bca347 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -302,16 +302,16 @@ dma_map_err:
> > > > >   }
> > > > >
> > > > >   /**
> > > > > - * Copy the guest element into a dedicated buffer suitable to be=
 sent to NIC
> > > > > + * Maps out sg and in buffer into dedicated buffers suitable to =
be sent to NIC
> > > > >    */
> > > > > -static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> > > > > -                                        VirtQueueElement *elem,
> > > > > -                                        size_t *out_len)
> > > > > +static bool vhost_vdpa_net_cvq_map_sg(VhostVDPAState *s,
> > > > > +                                      const struct iovec *out, s=
ize_t out_num,
> > > > > +                                      size_t *out_len)
> > > >
> > > >
> > > > This still looks not genreal as there's no guarantee that we won't =
have
> > > > command-in-specific-data. One example is that Ali is working on the
> > > > virtio-net statistics fetching from the control virtqueue.
> > > >
> > > > So it looks to me we'd better have a general bounce_map here that a=
ccepts:
> > > >
> > > > 1) out_sg and out_num
> > > > 2) in_sg and in_num
> > > >
> > >
> > > We don't need to pass in_sg for that: The only useful information is
> > > its size.
> >
> > What if we support stats in the future where it extends the ctrl comman=
d:
> >
> >          u8 command;
> >          u8 command-specific-data[];
> >          u8 ack;
> > +        u8 command-specific-data-reply[];
> >
> > in
> >
> > https://lists.oasis-open.org/archives/virtio-dev/202203/msg00000.html
> >
>
> The guest will expose an in descriptor in whatever layout it wants.
> QEMU reads its layout into a VirtQueueElement in_num and in_sg
> members, in qemu's (and SVQ) address space.

Yes, but current code did:

1) map seems based on sg but not unmap, result an non-symmetry API
2) NULL is passed to vhost_vdpa_cvq_map_buf()

    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
                                sizeof(virtio_net_ctrl_ack),
                                s->cvq_cmd_in_buffer, &in_copied, true);
    if (unlikely(!ok)) {
        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
        return false;
    }

So NULL to be used for iov_to_buf() which is tricky (not even sure it can w=
ork).

And this won't work for commands that have in-data in the future.

>
> Since we don't want the guest to be able to modify the in buffer
> maliciously, we offer the device a bounce in buffer. Since the in
> buffer still contains no information, we only need its size, so we can
> "allocate and map" an equivalent one for the device and memset to 0.
> For simplicity, we allocate one page, so no need for iovec
> complexities.
>
> After the device has written in it, we get the written len and verify
> the information. If VIRTIO_NET_OK, we copy that to the guest's in
> buffer, using the iov_from_buf right after out: tag at
> vhost_vdpa_net_handle_ctrl_avail. Instead of copy from the stack
> "(status, sizeof(status))" variable, we copy from
> (s->cvq_cmd_in_buffer, written_len).

Another asymmetry, the iov_to_buf() was hidden in map() but the
iov_from_buf() was exposed to the vhost_vdpa_net_handle_ctrl_avail.
I'd suggest tweaking the code otherwise it's not easy to read and
maintain:

map_sg()
validate_cmd()
add_to_svq()
handle_ctrl()
unmap_sg()

Or since we know the location of the bounce buffer, we can simply do
bouncing/iov_from_buf() explicitly before map_sg().

>
> Note that this is still not enough for stats. We also need a way to:
> * Update the virtio-net device model stats. virtio_net_handle_ctrl_iov
> would try to write the virtio-net stats to in buffer, not to update
> the device model stat.
> * Update the stats on the destination. Another ctrl command? Intercept
> them via svq and simply sum source stats + current device stats? I'd
> say the second is better as it saves effort to the device, but maybe
> it's not.

It should be sufficient to maintain a delta for each counter?

Thanks

>
> That's why I think this command should be left out at the moment, to
> do the modifications is not hard but we should agree on how to do them
> first.
>
> > > Since the exposed buffer is an in one, it's enough to expose
> > > the s->cvq_cmd_in_buffer buffer in full. The caller already knows the
> > > device will write to it, so the only missing piece is to return the
> > > written length at vhost_vdpa_net_cvq_add.
> > >
> > > Is one page the right buffer size for the in buffer?
> >
> > We can start from this.
> >
> > > Is it worth
> > > worrying about it before implementing the stat control command in qem=
u
> > > virtio-net?
> >
> > If it's not complex, it's better to do that from the beginning,
> > otherwise the user may be surprised and we need extra work. Anyhow, we
> > should support at least ack which is an in_sg.
> >
> > >
> > > > In this level, we'd better not have any special care about the in a=
s the
> > > > ack.
> > >
> > > We need to care about it. If a property has not been updated in the
> > > vdpa device (it returned VIRTIO_NET_ERR), we must not update the
> > > device model.
> >
> > Yes, but what I meant is at the level of bouncing itself. If we met
> > VIRTIO_NET_ERR, we should propagate it to the guest as well?
> >
>
> Yes we have, if not the guest thinks the command succeeds. Isn't it?
>
> Thanks!
>
> > Thanks
> >
> > >
> > > We can move the processing from vhost_vdpa_net_cvq_add to
> > > vhost_vdpa_net_load and vhost_vdpa_net_handle_ctrl_avail, but the cod=
e
> > > gets duplicated then.
> > >
> > > > And we need do bouncing:
> > > >
> > > > 1) for out buffer, during map
> > > > 2) for in buffer during unmap
> > > >
> > >
> > > We can move the copy of the in_buffer to the unmap for sure.
> > >
> > > Thanks!
> > >
> > > > Thanks
> > > >
> > > >
> > > > >   {
> > > > >       size_t in_copied;
> > > > >       bool ok;
> > > > >
> > > > > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, =
elem->out_num,
> > > > > +    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, out, out_num,
> > > > >                                   vhost_vdpa_net_cvq_cmd_len(),
> > > > >                                   s->cvq_cmd_out_buffer, out_len,=
 false);
> > > > >       if (unlikely(!ok)) {
> > > > > @@ -435,7 +435,8 @@ static int vhost_vdpa_net_handle_ctrl_avail(V=
hostShadowVirtqueue *svq,
> > > > >       };
> > > > >       bool ok;
> > > > >
> > > > > -    ok =3D vhost_vdpa_net_cvq_map_elem(s, elem, &dev_buffers[0].=
iov_len);
> > > > > +    ok =3D vhost_vdpa_net_cvq_map_sg(s, elem->out_sg, elem->out_=
num,
> > > > > +                                   &dev_buffers[0].iov_len);
> > > > >       if (unlikely(!ok)) {
> > > > >           goto out;
> > > > >       }
> > > >
> > >
> >
>


