Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30385605669
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 06:39:51 +0200 (CEST)
Received: from localhost ([::1]:57280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNLS-00006p-6y
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:39:50 -0400
Received: from [::1] (port=50716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNLR-0008N4-VD
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olNHB-0003QJ-NQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:35:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olNHA-00051M-1R
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666240523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAet8iZ+oZJ7bwrdMkR1wyVXhoL06p272n6Cn8VhncA=;
 b=BdW+moO6gCboH3TiaH+xG8NKBNmYGofg3cZwA7GtRYJTRDTii0ILOuffCelFHgpwykQ4Uo
 12cZ6S7jWzT2IzgdjH2eDt6OppsfoSBOyUw3kyFoKarkYiVUcoj4VLO/bxNR314XNJPKod
 44GzjMkXC1Aq0Tgasi6D1+WllpgyDNU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-aKafRokwMLSv-kbVrQ9PjQ-1; Thu, 20 Oct 2022 00:35:16 -0400
X-MC-Unique: aKafRokwMLSv-kbVrQ9PjQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 m7-20020a056402430700b0045daff6ee5dso7239645edc.10
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 21:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RAet8iZ+oZJ7bwrdMkR1wyVXhoL06p272n6Cn8VhncA=;
 b=BkTmLXmhazzLC+r4A97At06Ltd2duEMcY3WcA8Y3hyuiw9pSFd6tP/PWXwXw0BXGHv
 Bmf5NQn763K2b5Uq3Rlo5cWUoomyXQyo0bR+rR4YdDaqTynVwQrBFyAXM9Flx+eJoKaX
 La4QrnZ9jzmYAnlEBZ81a7eRp6lm8TbEYcnF36X5u6rBvpgTNrPDV+Fn4lMjaAVXGCL8
 E40u6mQXZy1En8e8SXusSxB0dsvWDGRFV7O7SWQ411Oq78pwukGPzRgT/izM4kx1omBg
 XgcZb4earYJxduwM39N5+U3BJkx7t9YVBBRvBkHuGsI11GS0uHZQprvjq2C0h69ilOQN
 Bosw==
X-Gm-Message-State: ACrzQf0/rKOKPZTl4OvhWdLtKuGlwlaYuSZbhSMTZK5YpIitNAs5P4lh
 HLWaRqEDtCLT2+VPN09DJ+XDNlN6HEjtaODJIU9xLRdqoKqRKHYWqlPzob+mzjXKgUPNyYN/XIw
 ed+5n+VjxEmIem4zviH3yGW6F7cs2q00=
X-Received: by 2002:aa7:c144:0:b0:459:f897:793e with SMTP id
 r4-20020aa7c144000000b00459f897793emr10407469edp.8.1666240515248; 
 Wed, 19 Oct 2022 21:35:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uQplaOucJ4w6csHJsBFEh3bCCuecwvlRwfUMnxrN5bpl02RWkoqemwIGqBrs7t9HP6aYRvR8zbNfdiVKD9RA=
X-Received: by 2002:aa7:c144:0:b0:459:f897:793e with SMTP id
 r4-20020aa7c144000000b00459f897793emr10407451edp.8.1666240515044; Wed, 19 Oct
 2022 21:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-7-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Oct 2022 12:35:01 +0800
Message-ID: <CACGkMEuKCXP2DMQWtPFmLnCKYuyDA8LEFbETU==AM_aRvdVM8g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/8] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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

On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Since this capability is emulated by qemu shadowed CVQ cannot forward it
> to the device.

I wonder what happens for a device that has GUEST_ANNOUNCE support on its o=
wn?

> Process all that command within qemu.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  net/vhost-vdpa.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 3374c21b4d..5fda405a66 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -488,9 +488,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostSha=
dowVirtqueue *svq,
>      out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
>                               s->cvq_cmd_out_buffer,
>                               vhost_vdpa_net_cvq_cmd_len());
> -    dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status=
));
> -    if (unlikely(dev_written < 0)) {
> -        goto out;
> +    if (*(uint8_t *)s->cvq_cmd_out_buffer =3D=3D VIRTIO_NET_CTRL_ANNOUNC=
E) {

Interesting, I thought we can do better by forbidding the code that
goes into vhost-vDPA specific code, everything should be set at
virtio-net.c level.

Thanks

> +        /*
> +         * Guest announce capability is emulated by qemu, so dont forwar=
d to
> +         * the device.
> +         */
> +        dev_written =3D sizeof(status);
> +        *s->status =3D VIRTIO_NET_OK;
> +    } else {
> +        dev_written =3D vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(st=
atus));
> +        if (unlikely(dev_written < 0)) {
> +            goto out;
> +        }
>      }
>
>      if (unlikely(dev_written < sizeof(status))) {
> --
> 2.31.1
>


