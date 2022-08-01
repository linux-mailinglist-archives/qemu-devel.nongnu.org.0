Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9995058656B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 08:53:45 +0200 (CEST)
Received: from localhost ([::1]:59704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIPJA-0006sf-Mm
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 02:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIP8l-0002yK-CE
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 02:42:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIP8h-0001xU-JU
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 02:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659336173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o/dsJc9e4UVbw/Ht/jZrEmxfNLPNq23N8K9IOnpoCFc=;
 b=Du913PwnjSmVB/MWWPCmWKKGfPBCVrH2VA4Ff+kyVHiMhjjeuIFx8tmnJAqQsAjAiWDolV
 oLFBP/sk8lQavsSqfFReIi089T+7dIxew3y5NKSUlsB2SMkDXadkBYES1hxcJFHpvmpLq7
 +Vs73t/lxw4M7zAyvOOzdmrsQeyKFR4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-08nrWi1sP9-iC8Kd7NCXwQ-1; Mon, 01 Aug 2022 02:42:52 -0400
X-MC-Unique: 08nrWi1sP9-iC8Kd7NCXwQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 ay35-20020a05620a17a300b006b5d9646d31so8530978qkb.6
 for <qemu-devel@nongnu.org>; Sun, 31 Jul 2022 23:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o/dsJc9e4UVbw/Ht/jZrEmxfNLPNq23N8K9IOnpoCFc=;
 b=33+J85JiJjG+fBN0SlmqleuPEiU5gJ20F7x8yTW5mJyPEybuhBfPgt6jGbUXpOX/Pd
 Xn0TLtgeW84Mo05JwDkxfXXMc1eKo7UGqMnQFgZGVVTLSFuWj5aQIyVXj5Ke+KBS8Tel
 1L8YK6s+ORG9DEtsvb0yvro7Sk2iS54AR8jT3c24TNuO+jTrga06MxvyslwWjPBaWEO3
 wwBWFUuWxNuLZXoncDvhq5IG3P36gQCzSPzvvSEl/m7DLHnhJnCk+hTLM/qzB3WCNEIS
 CwTU09b0Dn+mSokQA5FYj6L2u7ntW+u3ssSW0tHDP4bFE0dec/H3kwF7Q8H2X+fdsk5A
 PPbQ==
X-Gm-Message-State: ACgBeo117l/+cNist+Q1KP1Vlnu1iCV6xGPNmZQNySAsjDHiLU+IAR7Q
 JSEJYaKcfGnjPuhEPDWTe80XZcTO08UwwsL20T6oSu7atgAeT9f2BAt++YUXnF5E9Ga1K/2kSSL
 9n+/sBPnwaxLFNSZtylgfREZq2rWnYiQ=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr12947198qvb.2.1659336171666; 
 Sun, 31 Jul 2022 23:42:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4KtiwRM14qIbJC2DTaOBjheszrNrUpw+Mh3usm2tyvsP+h7cGBaWdROTuyVyVGzJG5iEMY5A++X3FuAGfIC/w=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr12947183qvb.2.1659336171491; Sun, 31
 Jul 2022 23:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220722111245.3403062-1-eperezma@redhat.com>
 <20220722111245.3403062-4-eperezma@redhat.com>
 <8e0e690d-d6af-db2f-5150-480a5d5d6793@redhat.com>
In-Reply-To: <8e0e690d-d6af-db2f-5150-480a5d5d6793@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Aug 2022 08:42:15 +0200
Message-ID: <CAJaqyWdG4HwfYu8U7oUSmGHVXWaLYES-fTvVRv_+dsYLMLtUiA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] vdpa: Make vhost_vdpa_net_cvq_map_elem accept any
 out sg
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Eric Blake <eblake@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>
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

On Mon, Jul 25, 2022 at 10:48 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/22 19:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > So its generic enough to accept any out sg buffer and we can inject
> > NIC state messages.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 29 +++++++++++++++--------------
> >   1 file changed, 15 insertions(+), 14 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 1b82ac2e07..bbe1830824 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -302,35 +302,36 @@ dma_map_err:
> >   }
> >
> >   /**
> > - * Copy the guest element into a dedicated buffer suitable to be sent =
to NIC
> > + * Maps out sg and in buffer into dedicated buffers suitable to be sen=
t to NIC
> >    *
> > - * @iov: [0] is the out buffer, [1] is the in one
> > + * @dev_iov: [0] is the out buffer, [1] is the in one
>
>
> This still has assumption on the layout. I wonder if it's better to
> simply use in_sg and out_sg.
>

Sure, I can resend that way.

It complicates the code a little bit because of error paths. We
currently send one out sg and one in sg always. But we can make it
more generic for sure.

Thanks!

> Thanks
>
>
> >    */
> > -static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> > -                                        VirtQueueElement *elem,
> > -                                        struct iovec *iov)
> > +static bool vhost_vdpa_net_cvq_map_sg(VhostVDPAState *s,
> > +                                      const struct iovec *out, size_t =
out_num,
> > +                                      struct iovec *dev_iov)
> >   {
> >       size_t in_copied;
> >       bool ok;
> >
> > -    iov[0].iov_base =3D s->cvq_cmd_out_buffer;
> > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->=
out_num,
> > -                                vhost_vdpa_net_cvq_cmd_len(), iov[0].i=
ov_base,
> > -                                &iov[0].iov_len, false);
> > +    dev_iov[0].iov_base =3D s->cvq_cmd_out_buffer;
> > +    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, out, out_num,
> > +                                vhost_vdpa_net_cvq_cmd_len(),
> > +                                dev_iov[0].iov_base, &dev_iov[0].iov_l=
en,
> > +                                false);
> >       if (unlikely(!ok)) {
> >           return false;
> >       }
> >
> > -    iov[1].iov_base =3D s->cvq_cmd_in_buffer;
> > +    dev_iov[1].iov_base =3D s->cvq_cmd_in_buffer;
> >       ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
> > -                                sizeof(virtio_net_ctrl_ack), iov[1].io=
v_base,
> > -                                &in_copied, true);
> > +                                sizeof(virtio_net_ctrl_ack),
> > +                                dev_iov[1].iov_base, &in_copied, true)=
;
> >       if (unlikely(!ok)) {
> >           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffe=
r);
> >           return false;
> >       }
> >
> > -    iov[1].iov_len =3D sizeof(virtio_net_ctrl_ack);
> > +    dev_iov[1].iov_len =3D sizeof(virtio_net_ctrl_ack);
> >       return true;
> >   }
> >
> > @@ -434,7 +435,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostSh=
adowVirtqueue *svq,
> >       };
> >       bool ok;
> >
> > -    ok =3D vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
> > +    ok =3D vhost_vdpa_net_cvq_map_sg(s, elem->out_sg, elem->out_num, d=
ev_buffers);
> >       if (unlikely(!ok)) {
> >           goto out;
> >       }
>


