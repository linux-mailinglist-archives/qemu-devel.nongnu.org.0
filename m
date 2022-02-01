Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8194B4A5C0F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:19:26 +0100 (CET)
Received: from localhost ([::1]:34108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEs85-0000I6-Jt
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:19:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nErId-0004GL-Ld
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:26:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nErIa-0005gB-UX
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643714761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xiKTVcthuowG0A9O6xtlSAwqXWQuS+SO3jaS8h+A7Y=;
 b=ULW7mHnfK1Jn2StLH+FXDoMxS35u29EVhCyozDz/3Lg9MUauNTtBjWjNYoMCPIQFyItbtf
 GnK0vLK5D+zVbJyRkJqw5Lx8ap8+3zwTkeeyfmfwGLqWjEsNNy+CdBDoCvJT3ppnyk66L/
 YMEcu7TshmZlm/yN+5HZ4bol3fE+dVE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-b_pH2gn0NZCbfZbdpB2sww-1; Tue, 01 Feb 2022 06:26:00 -0500
X-MC-Unique: b_pH2gn0NZCbfZbdpB2sww-1
Received: by mail-qt1-f199.google.com with SMTP id
 s1-20020ac85ec1000000b002cf7c93d56dso12682012qtx.21
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7xiKTVcthuowG0A9O6xtlSAwqXWQuS+SO3jaS8h+A7Y=;
 b=OF9efgb2paihzkliCQY7W2NYzIFagvPN9qF66gH/HbIjMoXd70l3TrlwzGDBNhHxrm
 FHlEnrvgjgzZmCAY86be04ZmZq/+RMJ2lpY9QL9Ph8J7q9p7yeiKU0AaC5+gND7MROKY
 CZFcaRKrenXes7MJgtIEeautTSW8YH38dkF7autph411jwbR9GZy0z6p6ZDFsG71Tmcw
 cmWC6aIUnOJSajFxcO1mR2aOfpKa9KaBeTg+oRpH9jBetzYIFoK9ylyuqzgeVbcx9Ss3
 4p9mjhPiZtn2u2pU7BUb0mEyUEQdYeVMEWVDYU5b4Wu2fATiZFfEl4a21kXPUBEaYXwf
 3NNQ==
X-Gm-Message-State: AOAM531G4CcJfr51kqd+LY/sdzieZegCJvJGjr/CSlE7nC0yEnxCa/q9
 OsEvKdsP2mH0/YOdjl8WS5evkzuCM7PFHLqlwBAUlrVGUp9nDis4AOyQQezIyKro+b/wye3CxWK
 X7h4xyB+MX8j+lgxcOamAm4FP+jikoBU=
X-Received: by 2002:a05:622a:199c:: with SMTP id
 u28mr17872400qtc.221.1643714760432; 
 Tue, 01 Feb 2022 03:26:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWnLW7vU+uDMSfRTazUBDmXY/JAhwHApPC9Vd7PDgln69TDvLY9ksZ4g7WluTn+mXEzkW8/WhPvpvEpRZE7XI=
X-Received: by 2002:a05:622a:199c:: with SMTP id
 u28mr17872384qtc.221.1643714760230; 
 Tue, 01 Feb 2022 03:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-19-eperezma@redhat.com>
 <62e877ca-51d7-da85-13c9-d469a85f33c9@redhat.com>
In-Reply-To: <62e877ca-51d7-da85-13c9-d469a85f33c9@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Feb 2022 12:25:24 +0100
Message-ID: <CAJaqyWfF01k3LntM7RLEmFcej=EY2d4+2MARKXPptQ2J7VnB9A@mail.gmail.com>
Subject: Re: [PATCH 18/31] vhost: Shadow virtqueue buffers forwarding
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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

On Sun, Jan 30, 2022 at 7:47 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > @@ -272,6 +590,28 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueu=
e *svq, int svq_kick_fd)
> >   void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >   {
> >       event_notifier_set_handler(&svq->svq_kick, NULL);
> > +    g_autofree VirtQueueElement *next_avail_elem =3D NULL;
> > +
> > +    if (!svq->vq) {
> > +        return;
> > +    }
> > +
> > +    /* Send all pending used descriptors to guest */
> > +    vhost_svq_flush(svq, false);
>
>
> Do we need to wait for all the pending descriptors to be completed here?
>

No, this function does not wait, it only completes the forwarding of
the *used* descriptors.

The best example is the net rx queue in my opinion. This call will
check SVQ's vring used_idx and will forward the last used descriptors
if any, but all available descriptors will remain as available for
qemu's VQ code.

To skip it would miss those last rx descriptors in migration.

Thanks!

> Thanks
>
>
> > +
> > +    for (unsigned i =3D 0; i < svq->vring.num; ++i) {
> > +        g_autofree VirtQueueElement *elem =3D NULL;
> > +        elem =3D g_steal_pointer(&svq->ring_id_maps[i]);
> > +        if (elem) {
> > +            virtqueue_detach_element(svq->vq, elem, elem->len);
> > +        }
> > +    }
> > +
> > +    next_avail_elem =3D g_steal_pointer(&svq->next_guest_avail_elem);
> > +    if (next_avail_elem) {
> > +        virtqueue_detach_element(svq->vq, next_avail_elem,
> > +                                 next_avail_elem->len);
> > +    }
> >   }
>


