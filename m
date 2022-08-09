Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA8B58D4C1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 09:39:39 +0200 (CEST)
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLJpy-0000he-G1
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 03:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLJln-0003rA-Tf
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:35:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLJlf-0008HQ-Am
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660030509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVZ920qQre2bAmru3ShQYrhgioXKdkxKCSZZNjtPp68=;
 b=GiNh66MU6CiYDlSJnRDLVc0MeZlTRWvI4jMznDscZPRadEYrh75goUN3WsWojW7OLNGoq/
 KMhcN/NE4C+y6BC2Dv9vdfeY37b9xJVZcPes4Or78jIqQ4e28bCWFv/6Qrz51JFEhwqW1V
 eKt58fRTfZM4jGAYkCmSl1j8SS2akKA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-YfdZmktNOFWRFMqmuIgUXQ-1; Tue, 09 Aug 2022 03:35:08 -0400
X-MC-Unique: YfdZmktNOFWRFMqmuIgUXQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bi22-20020a05620a319600b006b92f4b2ebbso6698394qkb.22
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 00:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=NVZ920qQre2bAmru3ShQYrhgioXKdkxKCSZZNjtPp68=;
 b=ooOX9E1WZqFRY/qeaHyJXbN/4IB5lrp+OImJAYcuo5imPvy98Qj9SzJBgpKTkKmq79
 qNMS7WjS1hU2Ey5sPrBrGrvP8s3/6y9SUteKK/Tb84majy5YfiK9RyDHUzwdbLVOz+do
 SSxLyR/sK6t4+/kkFalAFYB+hvkS5TlhqeSg5PStGGPVbY/b0GOuaX6jt6i3EeX4dRtj
 qCcWX5b1HiutAyii8IaGBH7GegrvxSbkPx1vnxFfRWU0P494IcDsryOCYikZ6Imy5LhY
 cJc58FsXdZYS6VIAybxW9qXcIOfqJhI3hBKOT8YwvjAqvb4eWf5bJEbXsbAXvceIlBma
 Eivw==
X-Gm-Message-State: ACgBeo3fQARKbeWBFBngg/vBUyW0oNH0nDfWUQ1h3NmaSeBECqpG/+7s
 8AuWK/v2GZbpab5FzM4CfDRqh6aM7dtlfIVSXMxCGAwsNxY1k4n8EtaCJtR1qHTM5h4O6cmQzSH
 ZStmvnOLoyIWmNjNtnq5pwYOFoJyQx1g=
X-Received: by 2002:a0c:be91:0:b0:474:1d6:b1a4 with SMTP id
 n17-20020a0cbe91000000b0047401d6b1a4mr18538053qvi.108.1660030507791; 
 Tue, 09 Aug 2022 00:35:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7l9lwk2unyBkOdXe9FvSzJGxOoSAXqZqK/V9vBTvo7vP4LMf8LSAdnUGHlxfuQRYZxDjPU7fdErOiRyupa6Y8=
X-Received: by 2002:a0c:be91:0:b0:474:1d6:b1a4 with SMTP id
 n17-20020a0cbe91000000b0047401d6b1a4mr18538044qvi.108.1660030507612; Tue, 09
 Aug 2022 00:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-6-eperezma@redhat.com>
 <CACGkMEstThyEwzMgH7KS-7cnw-L6HT7dqNWNaqWMJr9cHh6K5g@mail.gmail.com>
In-Reply-To: <CACGkMEstThyEwzMgH7KS-7cnw-L6HT7dqNWNaqWMJr9cHh6K5g@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 9 Aug 2022 09:34:31 +0200
Message-ID: <CAJaqyWfDQkdoXbdDQrPcgUk4qe6s-7ogpR4cGnk1NLmGOiri4g@mail.gmail.com>
Subject: Re: [PATCH v7 05/12] vhost_net: Add NetClientInfo prepare callback
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Eric Blake <eblake@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
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

On Tue, Aug 9, 2022 at 8:54 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > This is used by the backend to perform actions before the device is
> > started.
> >
> > In particular, vdpa net use it to map CVQ buffers to the device, so it
> > can send control commands using them.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/net/net.h  | 2 ++
> >  hw/net/vhost_net.c | 7 +++++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/include/net/net.h b/include/net/net.h
> > index 523136c7ac..3416bb3d46 100644
> > --- a/include/net/net.h
> > +++ b/include/net/net.h
> > @@ -44,6 +44,7 @@ typedef struct NICConf {
> >
> >  typedef void (NetPoll)(NetClientState *, bool enable);
> >  typedef bool (NetCanReceive)(NetClientState *);
> > +typedef int (NetPrepare)(NetClientState *);
> >  typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t=
);
> >  typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *=
, int);
> >  typedef void (NetCleanup) (NetClientState *);
> > @@ -71,6 +72,7 @@ typedef struct NetClientInfo {
> >      NetReceive *receive_raw;
> >      NetReceiveIOV *receive_iov;
> >      NetCanReceive *can_receive;
> > +    NetPrepare *prepare;
>
> So it looks to me the function is paired with a stop that is
> introduced in the following patch.
>
> Maybe we should use "start/stop" instead of "prepare/stop"?
>

Sure, I can prepare the next series with it.

Thanks!

> Thanks
>
> >      NetCleanup *cleanup;
> >      LinkStatusChanged *link_status_changed;
> >      QueryRxFilter *query_rx_filter;
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index ccac5b7a64..e1150d7532 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -244,6 +244,13 @@ static int vhost_net_start_one(struct vhost_net *n=
et,
> >      struct vhost_vring_file file =3D { };
> >      int r;
> >
> > +    if (net->nc->info->prepare) {
> > +        r =3D net->nc->info->prepare(net->nc);
> > +        if (r < 0) {
> > +            return r;
> > +        }
> > +    }
> > +
> >      r =3D vhost_dev_enable_notifiers(&net->dev, dev);
> >      if (r < 0) {
> >          goto fail_notifiers;
> > --
> > 2.31.1
> >
>


