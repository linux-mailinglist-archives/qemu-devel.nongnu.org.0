Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D6445E585
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:55:49 +0100 (CET)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqROu-000553-B8
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqRNv-0003i6-Nm
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:54:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqRNu-0005CN-4l
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637895285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mxHJr++OTzgz21WpbLtpuzlWLo5jxoJweB5eCk77olA=;
 b=AYFF0YV79ayRSrPQvMY8lOE+bclglDuEgdCj42UdBeAFTBddQXZhlqMU6iohqli8jPz50R
 stXADlT5VCCBX7Ixgln6pQbxUfnvypxPgke2l777YfDddh10zO8ukn/U/B6lMHK75dIgb4
 EdxB7FNNlyFBkfgpANohopK/aMM4utY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-74xS7D_gNemiuHzb3vUR8A-1; Thu, 25 Nov 2021 21:54:44 -0500
X-MC-Unique: 74xS7D_gNemiuHzb3vUR8A-1
Received: by mail-lj1-f199.google.com with SMTP id
 p1-20020a2e7401000000b00218d0d11e91so2568706ljc.15
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 18:54:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mxHJr++OTzgz21WpbLtpuzlWLo5jxoJweB5eCk77olA=;
 b=Ddp5UZjd8sN/ealyD6QrVmNYTy4Qchwheu3ecZBTD9BvS8D2GRiLyjL/86uzmUqIVK
 3hDGnmfvbDKpd6X4Srgs9be9+8K0oIQG5gtSIIA1dRBF7TqHTbkkqvp9mJ9QqSOw96Z0
 kTKuxEzcjEoa5FcACmX/pwBFk+RWNRWbt56uZ36BlFTrNLgiq/Qb/1fWg2kvG87ATMXM
 TnHPkkhmzML1279gSUfIv9DnH7U+lLaio3W3qCq0j7XDrfv1cHwlur/8Z6QnJPHlzsqt
 GEiCRW1Cm1+c93aWwaMD5xFwtzRoKEzB/e3gSh5Qpe5kIzhxC9l0gDCq8uUaZWIsAieU
 +3WA==
X-Gm-Message-State: AOAM530OF5jtky03gF3FmQde0Q0OEq0olyLJ/j5+lku8z9Nuks8zOtas
 dv+INcPneTkgdsT7fisFOHZ7SxT+wBp3U+ZddipMJoe50eu20mxem4X9qURIieLZx8UtFaywlKf
 a3PqVsQCs/8KEUWaJLIzT6EcrmS6kqSs=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr27888061lfr.348.1637895283016; 
 Thu, 25 Nov 2021 18:54:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxG6q3lEF6Am13nVq1Oh6DUUgb+fXj4OlWPbT/NEbgqTT+u1Kjm2g7i7AbDI9tep3o7SDYkRDS+xyIgXhoSziU=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr27888047lfr.348.1637895282831; 
 Thu, 25 Nov 2021 18:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20211125101614.76927-1-eperezma@redhat.com>
 <20211125101614.76927-3-eperezma@redhat.com>
In-Reply-To: <20211125101614.76927-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 26 Nov 2021 10:54:32 +0800
Message-ID: <CACGkMEubkMz-BGxQ3zX__-gmweAvEid=CQxLaRXVDEnCHDoE=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] virtio-net: Fix log message
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 6:16 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> The message has never been true in the case of non tap networking, so
> only tell that userland networking will be used if possible.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/net/virtio-net.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f2014d5ea0..d6c98c3c2d 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -245,6 +245,7 @@ static void virtio_net_vhost_status(VirtIONet *n, uin=
t8_t status)
>      NetClientState *nc =3D qemu_get_queue(n->nic);
>      int queue_pairs =3D n->multiqueue ? n->max_queue_pairs : 1;
>      int cvq =3D n->max_ncs - n->max_queue_pairs;
> +    bool tap_backend =3D nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_T=
AP;
>
>      if (!get_vhost_net(nc->peer)) {
>          return;
> @@ -258,9 +259,9 @@ static void virtio_net_vhost_status(VirtIONet *n, uin=
t8_t status)
>          int r, i;
>
>          if (n->needs_vnet_hdr_swap) {
> -            error_report("backend does not support %s vnet headers; "
> -                         "falling back on userspace virtio",
> -                         virtio_is_big_endian(vdev) ? "BE" : "LE");
> +            error_report("backend does not support %s vnet headers%s",
> +                    virtio_is_big_endian(vdev) ? "BE" : "LE",
> +                    tap_backend ? "; falling back on userspace virtio" :=
 "");
>              return;
>          }
>
> @@ -288,8 +289,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uin=
t8_t status)
>          n->vhost_started =3D 1;
>          r =3D vhost_net_start(vdev, n->nic->ncs, queue_pairs, cvq);
>          if (r < 0) {
> -            error_report("unable to start vhost net: %d: "
> -                         "falling back on userspace virtio", -r);
> +            error_report("unable to start vhost net: %d%s", -r,
> +                       tap_backend ? " falling back on userspace virtio"=
 : "");
>              n->vhost_started =3D 0;
>          }
>      } else {
> --
> 2.27.0
>


