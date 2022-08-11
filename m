Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B7958F80D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 09:03:48 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM2EF-0008AC-Cp
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 03:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oM23s-0001nN-9d
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 02:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oM23q-0003a5-Lr
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 02:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660200773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XykmjRKG8WObBKegscFBSwy10icIqFhwWTyUiIaUfWM=;
 b=HTsW6jHIyN8FpCK5ty2R2reGz+YN6O6wE/L5XvHA0mrBuu+etKkDpw0t8CaGJYKCgdKzGV
 K4HVDrKaOQXr44eJZPS/Wkck7mzBmhEfCtYQydIkmcqwJSNcJ5FXAANeKpZQrTHQCdhfsF
 peXtF4fHujlFIOrHtHIXVgV3eu6AyaA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-312-X_W6nIwoOeS1Sl0j-deG1A-1; Thu, 11 Aug 2022 02:52:51 -0400
X-MC-Unique: X_W6nIwoOeS1Sl0j-deG1A-1
Received: by mail-qk1-f199.google.com with SMTP id
 bq32-20020a05620a46a000b006b9c033bbe5so1193159qkb.5
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 23:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=XykmjRKG8WObBKegscFBSwy10icIqFhwWTyUiIaUfWM=;
 b=QDn++h8PY4qE+zh83bcIGACt9VghTGYFPh25aQHs3NiguC55CXFPfNPO66F9uaJXrw
 E91O2KtsE2ZD6Cn8t4Hampfoxl1Y5j79v4yt2T0ErCP6BD6LlG0t9aVgPsyuJ8zwj4nK
 aD916PmizZbiv5HKKIdyPxHsq4MpGDxkDDzsiH6xlZ5cteFzWeNDsY78y8r1fYaFKNQO
 m2dDXhKPMcH47mRJ8s/ex6gcmAogfYEbe1pnB9SnsqJhNnNOCL3wciBgwHmgWJd0yAVY
 HjVPo+ZABeR7lfs8ORiGlj1qSplhRd2Vi5VrsiqKsDgQf2J5hpJJTox5E0p5dDn1xFn+
 jT2A==
X-Gm-Message-State: ACgBeo3lyd1IrcOYc/g97txY0r8VaND3TthiqQHyVJOVziWodHXy2L+p
 FdZhoyaqc63PMlFZPgMxBl6MFh0cWYnwvWtryfxDzV7iDEiCvPeOAxxROOXJcNn9FrZiBIoUMWd
 nLTLFAzDkDIxH4IElCYLVkNFLceYc3HQ=
X-Received: by 2002:a05:622a:1102:b0:343:66b0:4a2 with SMTP id
 e2-20020a05622a110200b0034366b004a2mr1157756qty.495.1660200771165; 
 Wed, 10 Aug 2022 23:52:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5aiWpNr47SWLFFkQy4fAiKxua97e9PTz3Q5QYOZcXHpcfXj5EPHEnsrLkHXoZlfOWG5SrT1Ofgnf7EigIj7Pk=
X-Received: by 2002:a05:622a:1102:b0:343:66b0:4a2 with SMTP id
 e2-20020a05622a110200b0034366b004a2mr1157732qty.495.1660200770969; Wed, 10
 Aug 2022 23:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220809173926.1695280-1-eperezma@redhat.com>
 <20220809173926.1695280-12-eperezma@redhat.com>
 <CACGkMEv0hsLskgOj7LC4NEKEjQ9ssCVLBXE1NTY6g0xzDESD6w@mail.gmail.com>
In-Reply-To: <CACGkMEv0hsLskgOj7LC4NEKEjQ9ssCVLBXE1NTY6g0xzDESD6w@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 11 Aug 2022 08:52:14 +0200
Message-ID: <CAJaqyWf637fWeA7bfBsQopwxU=h1UNmDHs2O6Xmn=amxeUzM3Q@mail.gmail.com>
Subject: Re: [PATCH v8 11/12] vdpa: Add virtio-net mac address via CVQ at start
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Wed, Aug 10, 2022 at 7:09 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Aug 10, 2022 at 1:40 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > This is needed so the destination vdpa device see the same state a the
> > guest set in the source.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> > v8:
> > * Delete unneeded copy from device's in buffer.
> >
> > v6:
> > * Map and unmap command buffers at the start and end of device usage.
> >
> > v5:
> > * Rename s/start/load/
> > * Use independent NetClientInfo to only add load callback on cvq.
> > ---
> >  net/vhost-vdpa.c | 41 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index df85567cff..e775957952 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -363,11 +363,52 @@ static ssize_t vhost_vdpa_net_cvq_add(VhostVDPASt=
ate *s, size_t out_len,
> >      return vhost_svq_poll(svq);
> >  }
> >
> > +static int vhost_vdpa_net_load(NetClientState *nc)
> > +{
> > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > +    VirtIONet *n;
> > +    uint64_t features;
> > +
> > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > +
> > +    if (!v->shadow_vqs_enabled) {
> > +        return 0;
> > +    }
> > +
> > +    n =3D VIRTIO_NET(v->dev->vdev);
> > +    features =3D v->dev->vdev->host_features;
> > +    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> > +        const struct virtio_net_ctrl_hdr ctrl =3D {
> > +            .class =3D VIRTIO_NET_CTRL_MAC,
> > +            .cmd =3D VIRTIO_NET_CTRL_MAC_ADDR_SET,
> > +        };
> > +        char *cursor =3D s->cvq_cmd_out_buffer;
> > +        ssize_t dev_written;
> > +
> > +        memcpy(cursor, &ctrl, sizeof(ctrl));
> > +        cursor +=3D sizeof(ctrl);
> > +        memcpy(cursor, n->mac, sizeof(n->mac));
> > +        cursor +=3D sizeof(n->mac);
>
> I'd cast and initialize directly from the cmd_out_buff. But this could
> be done on top.
>

Actually you are right, that's valid for MAC. I think the compiler
should be able to omit the memcpy call if the direct write is safe,
but I haven't checked.

In a second review, either this last increment of the "cursor"
variable is useless and we can delete it or we could use it to
calculate the output size (cursor - s->cvq_cmd_out_buffer).

> So
>
> Acked-by: Jason Wang <jasowang@redhat.com>
>
>
> > +
> > +        dev_written =3D vhost_vdpa_net_cvq_add(s, sizeof(ctrl) + sizeo=
f(n->mac),
> > +                                             sizeof(virtio_net_ctrl_ac=
k));
> > +        if (unlikely(dev_written < 0)) {
> > +            return dev_written;
> > +        }
> > +
> > +        return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) !=3D VIR=
TIO_NET_OK;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> >      .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> >      .size =3D sizeof(VhostVDPAState),
> >      .receive =3D vhost_vdpa_receive,
> >      .start =3D vhost_vdpa_net_cvq_start,
> > +    .load =3D vhost_vdpa_net_load,
> >      .stop =3D vhost_vdpa_net_cvq_stop,
> >      .cleanup =3D vhost_vdpa_cleanup,
> >      .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> > --
> > 2.31.1
> >
>


