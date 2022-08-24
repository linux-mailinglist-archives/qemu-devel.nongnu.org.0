Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D88059F497
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 09:54:53 +0200 (CEST)
Received: from localhost ([::1]:44116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQlDw-0004XB-75
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 03:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQl6I-0007u2-Fd
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 03:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQl6E-0000bm-NF
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 03:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661327212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSecsRvsf2zyhp4I0N4+n/evtgT9k6A8D9MhLoRXUtQ=;
 b=fE9xc3PQZLGMzCXnqx6+qcT6U7f/x71a7QfA1C6WWaCnN01HITOcPkM6hb7vmH24Jptovz
 sJ8ng9ZQxJUlsL01Gxw3/a70qijtltpcRo+AVdUugWWJe9gCo038St1Qcofa60Zk5YMRtU
 9xIvMVr9oyuJmHWS8CLzFSoSzwLsTEI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-QVumfuTDMrm_ruEejXtfAw-1; Wed, 24 Aug 2022 03:46:50 -0400
X-MC-Unique: QVumfuTDMrm_ruEejXtfAw-1
Received: by mail-qv1-f69.google.com with SMTP id
 ly9-20020a0562145c0900b00496e3810e40so4912688qvb.12
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 00:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=hSecsRvsf2zyhp4I0N4+n/evtgT9k6A8D9MhLoRXUtQ=;
 b=GIIDzCdI8A/Agg+SEWVTfllnX0TWcG47X9EqV6pfE1HI0e1npxXkEprx29bHrtZYjq
 Jnu4a6haNzMeA9GxV2oVt6CYRCKok4I+TTWtZHVlz/X3CENc95ihCE6JG4VW49ODWmkE
 Le0IiczUgz3hPaNYOy51FBIiFdCqssQZaolQ/mwoDGn84hH48sVpTjFYNMUnGdCknwGg
 nfGcAp0dGIlwNRg2RFbk8qQc+kYs9qJLwtVBq8+VSwoMhMcnJmEehy2ZHfItMXklbm9n
 bkOpk/blSF1quqv4GFVb/EehUv2mbkU4WK2s3wcK9ImKP5s8CQxJPo/G5xsl/lozChmY
 CYbg==
X-Gm-Message-State: ACgBeo13a3GdQXkaBXmjk7OksNm/4K/F8qG3Ru8FldmRxG49cnNzEiK/
 9CqhO+ZBL1S1DWbqWLnKk1GQBAZYzeiDCnP+BCVyx9oZ2KjhhM5PNgtz+IvtJuN8HrpKlhdhce/
 dHPVpLp+RWHQ3TNVdUO9lrlDOGpnrTqQ=
X-Received: by 2002:a05:620a:2a0d:b0:6b9:9976:1bf3 with SMTP id
 o13-20020a05620a2a0d00b006b999761bf3mr18180971qkp.255.1661327210099; 
 Wed, 24 Aug 2022 00:46:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6yCl+c4rHH6V/HLSTNkOq1Qdnh3tFF9qsRV49TDMHsRohXsq5J6AljvADpHIGl8Nt89ie9TmMkbWEkvr8FfZ4=
X-Received: by 2002:a05:620a:2a0d:b0:6b9:9976:1bf3 with SMTP id
 o13-20020a05620a2a0d00b006b999761bf3mr18180953qkp.255.1661327209892; Wed, 24
 Aug 2022 00:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-3-eperezma@redhat.com>
 <f517a073-fd73-0220-072c-ea054b643468@redhat.com>
In-Reply-To: <f517a073-fd73-0220-072c-ea054b643468@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 24 Aug 2022 09:46:13 +0200
Message-ID: <CAJaqyWcGH-kAVw-yZ2CX-GuPYt1zL8FFJnjmWMcbi4r1NgyfcA@mail.gmail.com>
Subject: Re: [PATCH 2/5] vdpa: Add vhost_vdpa_net_load_mq
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 24, 2022 at 6:23 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/8/20 01:13, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Same way as with the MAC, restore the expected number of queues at
> > device's start.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 33 +++++++++++++++++++++++++++++++++
> >   1 file changed, 33 insertions(+)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 1e0dbfcced..96fd3bc835 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -391,6 +391,35 @@ static int vhost_vdpa_net_load_mac(VhostVDPAState =
*s,
> >       return 0;
> >   }
> >
> > +static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
> > +                                  const VirtIONet *n)
> > +{
> > +    uint64_t features =3D n->parent_obj.guest_features;
> > +    ssize_t dev_written;
> > +    void *cursor =3D s->cvq_cmd_out_buffer;
> > +    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
> > +        return 0;
> > +    }
> > +
> > +    *(struct virtio_net_ctrl_hdr *)cursor =3D (struct virtio_net_ctrl_=
hdr) {
> > +        .class =3D VIRTIO_NET_CTRL_MQ,
> > +        .cmd =3D VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET,
> > +    };
> > +    cursor +=3D sizeof(struct virtio_net_ctrl_hdr);
> > +    *(struct virtio_net_ctrl_mq *)cursor =3D (struct virtio_net_ctrl_m=
q) {
> > +        .virtqueue_pairs =3D cpu_to_le16(n->curr_queue_pairs),
> > +    };
>
>
> Such casting is not elegant, let's just prepare buffer and then do the
> copy inside vhost_vdpa_net_cvq_add()?
>

I'm not sure what you propose here. I can pre-fill a buffer in the
stack and then do an extra copy in vhost_vdpa_net_cvq_add. The
compiler should be able to optimize it, but I'm not sure if it
simplifies the code.

We can have a dedicated buffer for mac, another for mq, and one for
each different command, and map all of them at the device's start. But
this seems too much overhead to me.

Some alternatives that come to my mind:

* Declare a struct with both virtio_net_ctrl_hdr and each of the
control commands (using unions?), and cast s->cvq_cmd_out_buffer
accordingly.
* Declare a struct with all of the supported commands one after
another, and let qemu fill and send these accordingly.

>
> > +    cursor +=3D sizeof(struct virtio_net_ctrl_mq);
> > +
> > +    dev_written =3D vhost_vdpa_net_cvq_add(s, cursor - s->cvq_cmd_out_=
buffer,
> > +                                             sizeof(virtio_net_ctrl_ac=
k));
> > +    if (unlikely(dev_written < 0)) {
> > +        return dev_written;
> > +    }
> > +
> > +    return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) !=3D VIRTIO_=
NET_OK;
>
>
> So I think we should have a dedicated buffer just for ack, then there's
> no need for such casting.
>

You mean to declare cvq_cmd_in_buffer as virtio_net_ctrl_ack type
directly and map it to the device?

Thanks!


