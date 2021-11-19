Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70324568B6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 04:38:10 +0100 (CET)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnuj4-00037F-16
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 22:38:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnuhx-0002S8-87
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnuhu-0008UJ-S5
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637293017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3v5B9fxOmOCVsP39/UMc4oZ3RJ6KFLFaZa4BKU4DqeY=;
 b=ACF6s2J5ZXsd/ElUGZUctp6VvAIbLYGhotOyUhlLXwWRgD7QelUNsURHzG16T0JKd4zQ9b
 flSHk8HEcCQANHGJec5vPJpSVC7wi5+56UrQf9dnS/Ev+vglynx8oLQx9xPmenLmCAat3m
 71DhG0GKb9PQgCw1jsMjvqfs86HpApU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-Ft8vAtwGMreW9Lk5QipFLQ-1; Thu, 18 Nov 2021 22:36:56 -0500
X-MC-Unique: Ft8vAtwGMreW9Lk5QipFLQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 j9-20020a05651231c900b004037efe9fddso5613584lfe.18
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 19:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3v5B9fxOmOCVsP39/UMc4oZ3RJ6KFLFaZa4BKU4DqeY=;
 b=oj8s32kXrMdasyHncykAqyM1DVu/KC1iKhZmWuNPPfeFQa566IgHPNsw+zih+DqAsU
 CA+yPGz098XtKsSLD6X5oUuIZwYnFklzMnuhZ35F9JQSlVp0OLXlAJWLcwuGQjY5K3vx
 tlfM83g2e7+5Qg0f2o1LpzaTXpGpJITT+Ic0R4v71cRHCm8wp4U/i7D7AYRsFhjVGKZd
 GxpgL0cCjw4+j7q2ThDIW7ERWC3UfufRguouXf/dlP/O1ku6d7DV/a+Ftl7qxrgKLH1q
 LYjYMTE4+CTHInLWrrhKOjh3+FB78BFrrtQfETIOh5MjUQ5PKV2pI+/E5J6p1i9XRhg4
 0F+A==
X-Gm-Message-State: AOAM531Mh6kVWAbltnSpb9p5w9Rrlipda0JhOdaHoeajFBNeUjV/j6Mc
 zNs2lS83j1kEgSRugF7ycioSjANtyHPIGAILfpexo/J/quTYUFMOvDapQyT/OEbVk0aJv4laEr0
 +ad0amKJCMLWd5MYuTERldvPgLHpWObU=
X-Received: by 2002:a05:6512:3b2b:: with SMTP id
 f43mr29298078lfv.629.1637293015270; 
 Thu, 18 Nov 2021 19:36:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJvoXu0fBUto6uacQKMmlzZVYOmiMCb8CHSLyalQ7GBoryU/POAIBodavU87cHH86tgKQfKLmm+nRUCIVCynE=
X-Received: by 2002:a05:6512:3b2b:: with SMTP id
 f43mr29298047lfv.629.1637293014981; 
 Thu, 18 Nov 2021 19:36:54 -0800 (PST)
MIME-Version: 1.0
References: <20211110023915.3797141-1-chen.zhang@intel.com>
 <435c4c3f-9dfc-4a01-e398-72d9fe778a2d@redhat.com>
In-Reply-To: <435c4c3f-9dfc-4a01-e398-72d9fe778a2d@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 19 Nov 2021 11:36:44 +0800
Message-ID: <CACGkMEtTC3wWAXxWwfaT-Acuw8wgjSwDobkgzD=QngvST0211g@mail.gmail.com>
Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by default
To: Zhang Chen <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 11:17 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/11/10 =E4=B8=8A=E5=8D=8810:39, Zhang Chen =E5=86=99=E9=81=
=93:
> > This patch make filters and colo-compare module support vnet_hdr by
> > default. And also support -device non-virtio-net(like e1000.).
> > But it can't avoid user manual configuration error between
> > different filters when enable/disable virtio-net-pci.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
>
>
> Applied.
>
> Thanks

Actually not, it breaks filter-mirror test:


ERROR:../tests/qtest/test-filter-mirror.c:74:test_mirror: assertion
failed (recv_buf =3D=3D send_buf): ("" =3D=3D "Hello! filter-mirror~")
ERROR qtest-x86_64/test-filter-mirror - Bail out!
ERROR:../tests/qtest/test-filter-mirror.c:74:test_mirror: assertion
failed (recv_buf =3D=3D send_buf): ("" =3D=3D "Hello! filter-mirror~")
^Cmake[1]: *** [Makefile.mtest:784: run-test-96] Interrupt

Thanks

>
>
> >   net/colo-compare.c    | 2 +-
> >   net/filter-mirror.c   | 4 ++--
> >   net/filter-rewriter.c | 2 +-
> >   qemu-options.hx       | 9 +++++----
> >   4 files changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/net/colo-compare.c b/net/colo-compare.c
> > index b8876d7fd9..82d4d81710 100644
> > --- a/net/colo-compare.c
> > +++ b/net/colo-compare.c
> > @@ -1397,7 +1397,7 @@ static void colo_compare_init(Object *obj)
> >                           get_max_queue_size,
> >                           set_max_queue_size, NULL, NULL);
> >
> > -    s->vnet_hdr =3D false;
> > +    s->vnet_hdr =3D true;
> >       object_property_add_bool(obj, "vnet_hdr_support", compare_get_vne=
t_hdr,
> >                                compare_set_vnet_hdr);
> >   }
> > diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> > index f20240cc9f..adb0c6d89a 100644
> > --- a/net/filter-mirror.c
> > +++ b/net/filter-mirror.c
> > @@ -406,14 +406,14 @@ static void filter_mirror_init(Object *obj)
> >   {
> >       MirrorState *s =3D FILTER_MIRROR(obj);
> >
> > -    s->vnet_hdr =3D false;
> > +    s->vnet_hdr =3D true;
> >   }
> >
> >   static void filter_redirector_init(Object *obj)
> >   {
> >       MirrorState *s =3D FILTER_REDIRECTOR(obj);
> >
> > -    s->vnet_hdr =3D false;
> > +    s->vnet_hdr =3D true;
> >   }
> >
> >   static void filter_mirror_fini(Object *obj)
> > diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
> > index bf05023dc3..5698cd39d1 100644
> > --- a/net/filter-rewriter.c
> > +++ b/net/filter-rewriter.c
> > @@ -407,7 +407,7 @@ static void filter_rewriter_init(Object *obj)
> >   {
> >       RewriterState *s =3D FILTER_REWRITER(obj);
> >
> > -    s->vnet_hdr =3D false;
> > +    s->vnet_hdr =3D true;
> >       s->failover_mode =3D FAILOVER_MODE_OFF;
> >   }
> >
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 7749f59300..c40e385ede 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -4967,13 +4967,13 @@ SRST
> >       ``-object filter-mirror,id=3Did,netdev=3Dnetdevid,outdev=3Dcharde=
vid,queue=3Dall|rx|tx[,vnet_hdr_support][,position=3Dhead|tail|id=3D<id>][,=
insert=3Dbehind|before]``
> >           filter-mirror on netdev netdevid,mirror net packet to
> >           chardevchardevid, if it has the vnet\_hdr\_support flag,
> > -        filter-mirror will mirror packet with vnet\_hdr\_len.
> > +        filter-mirror will mirror packet with vnet\_hdr\_len(default: =
on).
> >
> >       ``-object filter-redirector,id=3Did,netdev=3Dnetdevid,indev=3Dcha=
rdevid,outdev=3Dchardevid,queue=3Dall|rx|tx[,vnet_hdr_support][,position=3D=
head|tail|id=3D<id>][,insert=3Dbehind|before]``
> >           filter-redirector on netdev netdevid,redirect filter's net
> >           packet to chardev chardevid,and redirect indev's packet to
> >           filter.if it has the vnet\_hdr\_support flag, filter-redirect=
or
> > -        will redirect packet with vnet\_hdr\_len. Create a
> > +        will redirect packet with vnet\_hdr\_len(default: on). Create =
a
> >           filter-redirector we need to differ outdev id from indev id, =
id
> >           can not be the same. we can just use indev or outdev, but at
> >           least one of indev or outdev need to be specified.
> > @@ -4983,7 +4983,8 @@ SRST
> >           packet to secondary from primary to keep secondary tcp
> >           connection,and rewrite tcp packet to primary from secondary m=
ake
> >           tcp packet can be handled by client.if it has the
> > -        vnet\_hdr\_support flag, we can parse packet with vnet header.
> > +        vnet\_hdr\_support flag, we can parse packet with vnet
> > +        header(default: on).
> >
> >           usage: colo secondary: -object
> >           filter-redirector,id=3Df1,netdev=3Dhn0,queue=3Dtx,indev=3Dred=
0 -object
> > @@ -5004,7 +5005,7 @@ SRST
> >           checkpoint and send primary packet to out\_dev. In order to
> >           improve efficiency, we need to put the task of comparison in
> >           another iothread. If it has the vnet\_hdr\_support flag,
> > -        colo compare will send/recv packet with vnet\_hdr\_len.
> > +        colo compare will send/recv packet with vnet\_hdr\_len(default=
: on).
> >           The compare\_timeout=3D@var{ms} determines the maximum time o=
f the
> >           colo-compare hold the packet. The expired\_scan\_cycle=3D@var=
{ms}
> >           is to set the period of scanning expired primary node network=
 packets.


