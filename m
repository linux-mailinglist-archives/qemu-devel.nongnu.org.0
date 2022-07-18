Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3560577F7C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:18:50 +0200 (CEST)
Received: from localhost ([::1]:43360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDNpx-0003RO-Lj
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDNn2-0008M4-Gq
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:15:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDNmw-0007G6-41
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658139341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MZcgzpmvxvVAbUMnmANu/F1nrrAo7ZIeOVritnnW4E=;
 b=CDUYr6Z2C9yUV5Ib+WoERuZXQnTePA9wfUla9PVvCI9aHOXRQ2Zmd6pZqyWohxQlKt61vG
 gaLwwcx5Qhk1aps91SrByOApu2bJT7w5B7+Cf5AeKjyIR4hSTuJomHoXcMVrX7W4Snk97D
 KVILWhCXHH7Snjjwz1F6x0V92tSVmDU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-IuB55huePmOFdVWqIAURvQ-1; Mon, 18 Jul 2022 06:15:40 -0400
X-MC-Unique: IuB55huePmOFdVWqIAURvQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 q21-20020ac84115000000b0031bf60d9b35so8074151qtl.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6MZcgzpmvxvVAbUMnmANu/F1nrrAo7ZIeOVritnnW4E=;
 b=bdCw5Nyj+FmuJlTCF+bSsNWVhKyJGyYSXt213eo2ck7HTQv2UuQCdjoFtzTR7H0v2y
 5ze1mOe2dRkaVsKl9Xjdqaj1EbmzuQ567xyW/b9HA8JyxbcsoYLbQ09WGqPAvoKEnTj3
 6r3COcUpjXhROQSrMqgCu5i44obZ4BW8ZWfKOH8fupic2JZISf9GXcIIojKC37zaJEhp
 JWZPdp5Y415B9cMgSU7oGZ6k1f4WqUH7Far4yjK4nJLl9y9Hx4I81DUzNh4t0k9e8jnS
 KSLTmJ8I5LA2TJZiNyTeIXFHgTVNnONL+EFgYJCmZ3I6mwvpIqHv8w7QlL1XV6c+lDxu
 kUfg==
X-Gm-Message-State: AJIora8PGW4wGw2S0qji+054lJo4MvC1XUmGCoKgnlJZcfkWBF0Cj5pN
 NW0ZUkUYnuaVq9nYTp+kotIdtIexE8oFhYU2BVAv5fXIo+gev4E+sKiLEmKGHiXHDO+abaBZy3i
 yiB+5z0EuCB+4vi218OjbUC04jQ7bDkY=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr16737728qkl.559.1658139339423; 
 Mon, 18 Jul 2022 03:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u26YdLXlWoug+C2s2HAKfeuSDlET74BBUH2gYwX8W60uPQhJa/++kj7J7NP7mNZsFaG53gzTzj8GUTvd9SI04=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr16737704qkl.559.1658139339202; Mon, 18
 Jul 2022 03:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-10-eperezma@redhat.com>
 <56637ea3-1875-9cd4-d455-9060309b8e3b@redhat.com>
In-Reply-To: <56637ea3-1875-9cd4-d455-9060309b8e3b@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Jul 2022 12:15:03 +0200
Message-ID: <CAJaqyWcPLsP2pe9vH-49zaKr1TFs9D7gFiHStSHpjm=WFAHJCw@mail.gmail.com>
Subject: Re: [RFC PATCH 09/12] vdpa: Extract vhost_vdpa_net_svq_add from
 vhost_vdpa_net_handle_ctrl_avail
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gautam Dawar <gdawar@xilinx.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 18, 2022 at 10:53 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/16 19:34, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > So we can reuse to inject state messages.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 89 +++++++++++++++++++++++++++--------------------=
-
> >   1 file changed, 51 insertions(+), 38 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 211bd0468b..aaae51a778 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -334,6 +334,54 @@ static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAS=
tate *s,
> >       return true;
> >   }
> >
> > +static virtio_net_ctrl_ack vhost_vdpa_net_svq_add(VhostShadowVirtqueue=
 *svq,
> > +                                               const struct iovec *dev=
_buffers)
>
>
> The name should be tweaked since it is used only for cvq.
>

Right, I'll change.

>
> > +{
> > +    /* in buffer used for device model */
> > +    virtio_net_ctrl_ack status;
> > +    const struct iovec in =3D {
> > +        .iov_base =3D &status,
> > +        .iov_len =3D sizeof(status),
> > +    };
> > +    size_t dev_written;
> > +    int r;
> > +    void *unused =3D (void *)1;
> > +
> > +    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, u=
nused);
> > +    if (unlikely(r !=3D 0)) {
> > +        if (unlikely(r =3D=3D -ENOSPC)) {
> > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device que=
ue\n",
> > +                          __func__);
> > +        }
> > +        return VIRTIO_NET_ERR;
> > +    }
> > +
> > +    /*
> > +     * We can poll here since we've had BQL from the time we sent the
> > +     * descriptor. Also, we need to take the answer before SVQ pulls b=
y itself,
> > +     * when BQL is released
> > +     */
>
>
> This reminds me that, do we need a upper limit of the time on the
> polling here. (Avoid taking BQL for too long time).
>

Sending a new version of rx filters here.

But we have other parts where we can have BQL forever because we trust
the device, like vring enable syscalls for example.

Thanks!


