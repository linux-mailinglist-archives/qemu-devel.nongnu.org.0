Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCC231DF2E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 19:42:23 +0100 (CET)
Received: from localhost ([::1]:33660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCRmI-000698-JB
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 13:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCRkg-0004gT-Uz
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 13:40:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lCRkf-0003Po-5v
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 13:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613587239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uDWw0jQxUaND0XQQb+ruknf/iQkbe8UrGU4K4Aidiok=;
 b=io5xCiLLHedb9AjUairplze8o3qUpJK0ZI8a5E/1n7YT1zN0VM6etnxQ/Zfc2C/tnyMclJ
 66NOGMAjU5KZeiirKQJy3NTRqqF1ai9j1FnQ6aH7gFF+kcKlzMTo0z/co2ITv7D+yQxB2b
 lf7SxdP0LjEEKEZafxMSD43k2Ck+ZzM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-yBbFOYGXPcKEWgs-IWlQ5g-1; Wed, 17 Feb 2021 13:40:37 -0500
X-MC-Unique: yBbFOYGXPcKEWgs-IWlQ5g-1
Received: by mail-qv1-f71.google.com with SMTP id h10so10567611qvf.19
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 10:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uDWw0jQxUaND0XQQb+ruknf/iQkbe8UrGU4K4Aidiok=;
 b=iAKhEzilh0IkWXloAwJq7Zz32g0YVBYqEBKIfgVYOXnEdhk5rBMlGWBUE2Lgs2Yfot
 lyscX8IILGvFjHqGnXjLN9vf4/TiINHlYzACcjohp3/zgWcxEKNkdELWcQcvrsAuVmqI
 Zdsqd51M8Gaap5Ol0rrhwQ12OO6faNudDlClSxOKh93PAsMIdA/C4ChCwjPYY/55DmvZ
 9MRI68bOh4BNVd0a365dNjv71hQ/ltOudKiLqpTUFz5loNV1TXqwAknYKvz+BNaNwRsw
 OrKa4Ss75LAdNVS8Kvnb3dxWLhpYWZqSVtz4v6DrVCKsHzB14TqhidLAheVRIXCtDJVo
 XvmA==
X-Gm-Message-State: AOAM531gmGAdq5xkgiyaCvjpwOhjtnCRbhAFjotC0koMB4li4xd2AjmN
 hOjqZ5/47isQtoVF7Tws/nsyuagJcruuMVR4X3wgBKfF27HdpEhLjod39hDG2BYqJhEU5aUNn9B
 gwkNn5CYRBRnafwSyJUNTfY8B0+2OdYA=
X-Received: by 2002:a37:2e05:: with SMTP id u5mr538560qkh.131.1613587237204;
 Wed, 17 Feb 2021 10:40:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGUDYUVA0SZApfqGc6/hfgUglNySaTDFF/HhqxPB9CKcUAmJFYRu3rpyPkpsYUWMA6H2SFMWIeD0v4RagCDqc=
X-Received: by 2002:a37:2e05:: with SMTP id u5mr538545qkh.131.1613587237028;
 Wed, 17 Feb 2021 10:40:37 -0800 (PST)
MIME-Version: 1.0
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-5-eperezma@redhat.com>
 <20210217130108.GF269203@stefanha-x1.localdomain>
In-Reply-To: <20210217130108.GF269203@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 17 Feb 2021 19:40:01 +0100
Message-ID: <CAJaqyWdTBjZ1qXW4fc80E6fKinRtX1r0q6u=J6CGvuRqoFeQCA@mail.gmail.com>
Subject: Re: [RFC v2 4/7] vhost: Add VhostShadowVirtqueue
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Rob Miller <rob.miller@broadcom.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 2:01 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>
> On Tue, Feb 09, 2021 at 04:37:54PM +0100, Eugenio P=C3=A9rez wrote:
> > +/*
> > + * Creates vhost shadow virtqueue, and instruct vhost device to use th=
e shadow
> > + * methods and file descriptors.
> > + */
> > +VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int i=
dx)
> > +{
> > +    g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtque=
ue, 1);
> > +    int r;
> > +
> > +    r =3D event_notifier_init(&svq->kick_notifier, 0);
> > +    if (r !=3D 0) {
> > +        error_report("Couldn't create kick event notifier: %s",
> > +                     strerror(errno));
> > +        goto err_init_kick_notifier;
> > +    }
> > +
> > +    r =3D event_notifier_init(&svq->call_notifier, 0);
> > +    if (r !=3D 0) {
> > +        error_report("Couldn't create call event notifier: %s",
> > +                     strerror(errno));
> > +        goto err_init_call_notifier;
> > +    }
> > +
> > +    return svq;
>
> Use-after-free due to g_autofree. I think this should be:
>
>   return g_steal_pointer(&svq)
>
> https://developer.gnome.org/glib/stable/glib-Memory-Allocation.html#g-ste=
al-pointer

What a miss, thanks for pointing it out!


