Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63A1606E21
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 05:07:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oliNP-0000Bk-Rf
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:07:15 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oliIi-0001g6-Uu
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oliIY-0001aS-5v
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oliIW-0007Kp-Mo
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666321331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFm01QePsgqLIBXO6LHZ5Ei6KUY9Tb76LGSFZsC/f1A=;
 b=bAJcWbRKjcFN0QE5NCxT3BmTPNwrBFE67/xqefwqGQ2CApLNqkPLrtvNnmXFjkfKfl1+3B
 giNihPk9zpgTjeyzz2B6ZhFIKpCgQJVSHu69VbS0XHlKsZcxBfhLZBIH42aZ9pe9Ve3kSS
 WLYtVyIVme/LfXbLEIN7SeCh3cKl+wc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-b3wKjKX8MmSOei3pPBlL9Q-1; Thu, 20 Oct 2022 23:02:09 -0400
X-MC-Unique: b3wKjKX8MmSOei3pPBlL9Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 sd5-20020a1709076e0500b0078de7be1ee3so698262ejc.23
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 20:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFm01QePsgqLIBXO6LHZ5Ei6KUY9Tb76LGSFZsC/f1A=;
 b=6YodYam9E2DyynFqxEi9lOBPZfQOctPI8gOT/QFtRZ+d++TgBTFyuISzsXiDemx0jQ
 QZuwY4P+8n74Fz2CdAlpP+1VHt1GZkMQ3zh4BTyapYzeDEB5vvIUCQuGlTfMOqH5nKVI
 vxHnmdxD8BnrLLvKdbDPyOQTk5B7r3aA2sgfuUWKPkqViSLXDPmsE3uFFgE53DmMSqkW
 RFMwceKesoDZhHA+zTJlxT7cq7iIOurqWmKXfXuW8qjkcsj/bdr8kLPs9rU65JZiPJrM
 TY3oCX0xmKxGg+rkTepscpD7m6fbetfJLVunQDFPVk8i+jkhdpBmWHcaR6VkHQz4fqEr
 Xtpw==
X-Gm-Message-State: ACrzQf2ZxqX8du4JytxTPTkmLVnZfv7bsCNEQ/pc9Wz0wveJPTMRQ9aE
 l6VRAm6ad/bhfl5q3m4KOQUlLaOmG14dic6phkAz0gI6zuinqjOPKNZo2/qOy+XKP7XfL/p80TY
 gS1uky1u6MP0Mg16XVRJDGnp4r08FUFg=
X-Received: by 2002:a05:6402:4022:b0:45c:9f2c:c4d3 with SMTP id
 d34-20020a056402402200b0045c9f2cc4d3mr15129996eda.223.1666321328735; 
 Thu, 20 Oct 2022 20:02:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5k6t5xSumRjFvBVzFsba6ElSMp1DXeMxebWFb1juIxRJSTsesvsQdhgGyn+F2fO9U2l5BTeTl+Zt545ZAkjDg=
X-Received: by 2002:a05:6402:4022:b0:45c:9f2c:c4d3 with SMTP id
 d34-20020a056402402200b0045c9f2cc4d3mr15129974eda.223.1666321328482; Thu, 20
 Oct 2022 20:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-7-eperezma@redhat.com>
 <CACGkMEuKCXP2DMQWtPFmLnCKYuyDA8LEFbETU==AM_aRvdVM8g@mail.gmail.com>
 <CAJaqyWfFk_yXTJjsvSpqG2XCJvgP7BqjcVediQL0KSDgN5nZ=A@mail.gmail.com>
In-Reply-To: <CAJaqyWfFk_yXTJjsvSpqG2XCJvgP7BqjcVediQL0KSDgN5nZ=A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 21 Oct 2022 11:01:55 +0800
Message-ID: <CACGkMEtUBz99zAyreiUgqp7U3BFgFgLi+bPKW1tKZhq7p2+cFQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/8] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 20, 2022 at 3:01 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Thu, Oct 20, 2022 at 6:35 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> > >
> > > Since this capability is emulated by qemu shadowed CVQ cannot forward=
 it
> > > to the device.
> >
> > I wonder what happens for a device that has GUEST_ANNOUNCE support on i=
ts own?
> >
>
> If SVQ is enabled the feature is always emulated by qemu by this series.
>
> if SVQ is disabled then the device is the one in charge of all of it.

Ok, I see.

>
> > > Process all that command within qemu.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  net/vhost-vdpa.c | 15 ++++++++++++---
> > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 3374c21b4d..5fda405a66 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -488,9 +488,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vhos=
tShadowVirtqueue *svq,
> > >      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> > >                               s->cvq_cmd_out_buffer,
> > >                               vhost_vdpa_net_cvq_cmd_len());
> > > -    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(st=
atus));
> > > -    if (unlikely(dev_written < 0)) {
> > > -        goto out;
> > > +    if (*(uint8_t *)s->cvq_cmd_out_buffer =3D=3D VIRTIO_NET_CTRL_ANN=
OUNCE) {
> >
> > Interesting, I thought we can do better by forbidding the code that
> > goes into vhost-vDPA specific code, everything should be set at
> > virtio-net.c level.
> >
>
> Do you mean to move the SVQ processing to each handle_output? It's
> somehow on the roadmap but I'm not sure if it has more priority than
> implementing the different features.

Right, but I think we need to find a way to eliminate the casting here.

Thanks

>
> Thanks!
>
>
> > Thanks
> >
> > > +        /*
> > > +         * Guest announce capability is emulated by qemu, so dont fo=
rward to
> > > +         * the device.
> > > +         */
> > > +        dev_written =3D sizeof(status);
> > > +        *s->status =3D VIRTIO_NET_OK;
> > > +    } else {
> > > +        dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeo=
f(status));
> > > +        if (unlikely(dev_written < 0)) {
> > > +            goto out;
> > > +        }
> > >      }
> > >
> > >      if (unlikely(dev_written < sizeof(status))) {
> > > --
> > > 2.31.1
> > >
> >
>


