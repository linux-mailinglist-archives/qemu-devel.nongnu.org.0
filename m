Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F0B4A671C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:34:52 +0100 (CET)
Received: from localhost ([::1]:36400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0nb-0005R3-MP
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:34:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEwgC-0002Wy-UD
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:10:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nEwgB-00068z-4u
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643735453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/jC7x+xbQqCmoHhAz/duzz7bR95ONGhMBRABeR9RP8=;
 b=PpO0zgxtQrj7bS8MvNQozbR/8cUvnk//vG9yMSFaL+LvE0CbpYnTgZhvb4Os3Ba5t7mFHp
 NBruyBtclQNWt746f30m+qy/4sotuelHCHE/yPwbNvn00cUWlolgyLqaqJ81okue8EQrY5
 RlFSLwj14U5eHHY6aXYHg8aCbP/hCRA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-cseVGVySONaMjcgJxG1EPg-1; Tue, 01 Feb 2022 12:10:52 -0500
X-MC-Unique: cseVGVySONaMjcgJxG1EPg-1
Received: by mail-qk1-f200.google.com with SMTP id
 u9-20020ae9c009000000b0049ae89c924aso12602946qkk.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b/jC7x+xbQqCmoHhAz/duzz7bR95ONGhMBRABeR9RP8=;
 b=eVRoavHa239oWe6Nbj8LdwOZHKmkvB5uLbKwspIS43mjIYNVhCfJQXuKKGpy3QTAAg
 7SSritNoexEI4aUIBUABtaypFslRb9EbP9UFAAcCmRBxPQBdNBPYEEsv3w8mqz2aZ+Mp
 X8ldF3UfD8tdpJj6GTTF1snOJ1rKItbgCaaB6FBTGuVgpQsUVfZlTYeVyCSoO2lLQcIQ
 fyrnXFisen9okMy1L+LneW1ypYYo9KKsYbzvewPnFCdiKxSfW3GifvCs+aT5TfLJE1yP
 dBLsaqibgfS8MLUGrXG23OzZ9Vz/GF+zlHzJJe4+vaV2Vcp/cjNBdZ2baCmIed5MLFQp
 J54Q==
X-Gm-Message-State: AOAM533k5hmRpF6nDK8sURkpNl2A4RzRqwbXWl/DOxU5KqEHSRWGAGL+
 utW1iNmDg5GbrkB/iw3+t42Tq15+NS8X1GcwUNsw/Y9G1hZFGhKVzONXHY7y5Tay+AGFkOhTZ2l
 HAvOqjE4eVJxLuEFewoW5q/ob4Dp3mfw=
X-Received: by 2002:a05:620a:40cc:: with SMTP id
 g12mr17360088qko.308.1643735452304; 
 Tue, 01 Feb 2022 09:10:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw376giDCzeh/R98fJLJshlsZVozHnI3p3kbLdJxX32uFEWquxL0Qce7LRIqGjk4MVZs9wMcnWrXWOoZeqdqLQ=
X-Received: by 2002:a05:620a:40cc:: with SMTP id
 g12mr17360060qko.308.1643735452057; 
 Tue, 01 Feb 2022 09:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-30-eperezma@redhat.com>
 <2391fb35-15df-abd4-192e-7b124c289c6e@redhat.com>
In-Reply-To: <2391fb35-15df-abd4-192e-7b124c289c6e@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Feb 2022 18:10:16 +0100
Message-ID: <CAJaqyWdK+G_hcsQO4MNHyPH=0Ebj6irVC0r=AcmGeuQ+=tHQWg@mail.gmail.com>
Subject: Re: [PATCH 29/31] vdpa: Make ncs autofree
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

On Sun, Jan 30, 2022 at 7:52 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/1/22 =E4=B8=8A=E5=8D=884:27, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > Simplifying memory management.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
>
> To reduce the size of this series. This can be sent as an separate patch
> if I was not wrong.
>

Sure, I'll send separately to trivial maillist.

Thanks!

> Thanks
>
>
> > ---
> >   net/vhost-vdpa.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 4125d13118..4befba5cc7 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -264,7 +264,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >   {
> >       const NetdevVhostVDPAOptions *opts;
> >       int vdpa_device_fd;
> > -    NetClientState **ncs, *nc;
> > +    g_autofree NetClientState **ncs =3D NULL;
> > +    NetClientState *nc;
> >       int queue_pairs, i, has_cvq =3D 0;
> >
> >       assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > @@ -302,7 +303,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >               goto err;
> >       }
> >
> > -    g_free(ncs);
> >       return 0;
> >
> >   err:
> > @@ -310,7 +310,6 @@ err:
> >           qemu_del_net_client(ncs[0]);
> >       }
> >       qemu_close(vdpa_device_fd);
> > -    g_free(ncs);
> >
> >       return -1;
> >   }
>


