Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527F0586C22
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:41:00 +0200 (CEST)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVfG-0003Ym-Rv
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIVI6-00068h-4C
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIVI2-000865-Uk
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659359817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=91T6yfHiA3e83wbO35GlbfBGpKz9nWlFtAjd6yYR7j8=;
 b=SEr9Cmz8bJBV9OmVLUrnUijUZN14bSxYvaLWGsamUm072S+fpUVOzpMYW8zABA9xfgrtSB
 104tK9FQbmeEMTxo14KLLEkiWj9eS+iInPoVsTbAaaAlfAI9effK+knqlmUVwonP/Gh+88
 jIWqL+PZcBSaJnlM77EQTu3Ki5y+BTQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-86cdDgNEOr62OLOh5oN-Rg-1; Mon, 01 Aug 2022 09:16:56 -0400
X-MC-Unique: 86cdDgNEOr62OLOh5oN-Rg-1
Received: by mail-qv1-f71.google.com with SMTP id
 ok7-20020a0562143c8700b00472f0b33853so6380151qvb.12
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 06:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=91T6yfHiA3e83wbO35GlbfBGpKz9nWlFtAjd6yYR7j8=;
 b=zSql95ZAWB4H1LGvBFm3+bthNH22bzLlpczz+dqCplrS5PKnMTV+CoLFHxHQOLNQQj
 gxm/y5SxEZiuZChhsgY3K1HJ2x4+SitvpmE6ksHnxY6p0bjkIHhkh1Ta1t3sfuh9dtgh
 bmBePTQaANA6Aj8iIJ1hDFdZc9VcC76ddp37jtpXG6v6FxTbPjQH83y/eEm7szg/v5hc
 YSbKVCDmheVXDAzavSqoDsqCqbmGwaFeKeNJgi4pIVt/WvDNgsa1XXxOP+JI8VqV6K2w
 KpQmXo0dqUk0pCoF4ntC0hhHe9ZUSlWyK40hOu6qFjYF82hoU3JvarRdjbKd9TuyImcx
 9Eyg==
X-Gm-Message-State: ACgBeo3ml22CmkMCgTv1Yqx2WdRGkHQETH+RuPodYH1niicvzkC9kmPK
 YrCSd9q/J9TeHdN4LnGHY2quhz07HQ1vTCVsWQ0Px9A4urISGvmJnz4ilEE63zx/K+L+IcP9Ixh
 i/HXgKkLgcH0y2B9MEqjGJ0S5ElaXtIQ=
X-Received: by 2002:a05:620a:46a2:b0:6b8:bef3:8f82 with SMTP id
 bq34-20020a05620a46a200b006b8bef38f82mr744617qkb.234.1659359816047; 
 Mon, 01 Aug 2022 06:16:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4D74j6YGgzmUS6t1wZsopB/BkxyKZbByls3LwOZ27+My0pOHRts6cEbmB0U2/q38taN8+DQnX18anp5YvuuLo=
X-Received: by 2002:a05:620a:46a2:b0:6b8:bef3:8f82 with SMTP id
 bq34-20020a05620a46a200b006b8bef38f82mr744599qkb.234.1659359815786; Mon, 01
 Aug 2022 06:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220720090313.55169-1-jasowang@redhat.com>
 <20220720090313.55169-20-jasowang@redhat.com>
 <CAFEAcA8UZcOLTpLUutMFeaugZwm2vAKTGZgLkcHAG3B2BHYtUA@mail.gmail.com>
 <55e82876-fb77-fa6e-2a28-f53efce47efd@redhat.com>
In-Reply-To: <55e82876-fb77-fa6e-2a28-f53efce47efd@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Aug 2022 15:16:19 +0200
Message-ID: <CAJaqyWc=FZQ7vY44Rgkb+Mw+3ENGfSMDnkZHBBk42MN5r0JCqg@mail.gmail.com>
Subject: Re: [PULL V2 19/25] vdpa: Extract get features part from
 vhost_vdpa_get_max_queue_pairs
To: Jason Wang <jasowang@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>
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

On Mon, Aug 1, 2022 at 5:29 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/29 22:08, Peter Maydell =E5=86=99=E9=81=93:
> > On Wed, 20 Jul 2022 at 10:04, Jason Wang <jasowang@redhat.com> wrote:
> >> From: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>
> >> To know the device features is needed for CVQ SVQ, so SVQ knows if it
> >> can handle all commands or not. Extract from
> >> vhost_vdpa_get_max_queue_pairs so we can reuse it.
> >>
> >> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> Acked-by: Jason Wang <jasowang@redhat.com>
> >> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >> Signed-off-by: Jason Wang <jasowang@redhat.com>
> > Hi; this change introduces a resource leak in the new
> > error-exit return path in net_init_vhost_vdpa(). Spotted
> > by Coverity, CID 1490785.
> >
> >> @@ -517,10 +521,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, co=
nst char *name,
> >>                           NetClientState *peer, Error **errp)
> >>   {
> >>       const NetdevVhostVDPAOptions *opts;
> >> +    uint64_t features;
> >>       int vdpa_device_fd;
> >>       g_autofree NetClientState **ncs =3D NULL;
> >>       NetClientState *nc;
> >> -    int queue_pairs, i, has_cvq =3D 0;
> >> +    int queue_pairs, r, i, has_cvq =3D 0;
> >>
> >>       assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>       opts =3D &netdev->u.vhost_vdpa;
> >> @@ -534,7 +539,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >>           return -errno;
> >>       }
> >>
> >> -    queue_pairs =3D vhost_vdpa_get_max_queue_pairs(vdpa_device_fd,
> >> +    r =3D vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
> >> +    if (unlikely(r < 0)) {
> >> +        return r;
> > At this point in the code we have allocated the file descriptor
> > vdpa_device_fd, but this return path fails to close it.
>
>
> Exactly.
>

Right, I'll fix.

>
> >
> >> +    }
> >> +
> >> +    queue_pairs =3D vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, fe=
atures,
> >>                                                    &has_cvq, errp);
> >>       if (queue_pairs < 0) {
> >>           qemu_close(vdpa_device_fd);
> > Compare this pre-existing error-exit path, which correctly
> > calls qemu_close() on the fd.
> >
> > Related question: is this function supposed to return -1 on
> > failure, or negative-errno ?
>
>
> Kind of either:
>
>    if (net_client_init_fun[netdev->type](netdev, netdev->id, peer, errp)
> < 0) {
>          /* FIXME drop when all init functions store an Error */
>          if (errp && !*errp) {
>              error_setg(errp, "Device '%s' could not be initialized",
>                         NetClientDriver_str(netdev->type));
>          }
>          return -1;
>      }
>
>

We can write errno to errp then, and consistently use the goto for
error handling as you propose. I'll post a fix in a moment.

Thanks!

> >   At the moment it has a mix
> > of both. I think that the sole caller only really wants "<0 on
> > error", in which case the error-exit code paths could probably
> > be tidied up so that instead of explicitly calling
> > qemu_close() and returning r, queue_pairs, or whatever
> > they got back from the function they just called, they
> > could just 'goto err_svq' which will do the "close the fd
> > and return -1" work. Better still, by initializing 'i'
> > to 0 at the top of the function (and naming it something
> > clearer, ideally), all the code paths after the initial
> > qemu_open() succeeds could be made to use 'goto err'
> > for the error-exit case.
>
>
> Yes, having a consistent goto based error handling seems much better.
>
> Eugenio, please post patch to fix this.
>
> Thanks
>
>
> >
> > thanks
> > -- PMM
> >
>


