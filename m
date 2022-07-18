Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E30577AA6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 07:53:53 +0200 (CEST)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDJhZ-0006lw-6q
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 01:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDJeg-0004O9-Nk
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 01:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDJee-0001s8-Ks
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 01:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658123452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7x3HHPPKkd8HATayhs7qFLPP87JUKqlz8QJH3WC/1Mc=;
 b=CZCUs4/mf2EjdmHG7gZDUBKHtmO5oZFnOYIPvrnGAvWyDUyN2cF6UoM5QcCu59lqEluGRb
 VlW+4LuFHHISuyork3noXGN2XG/5HFL/bXulUojgUGj16E8EtR25+Ax8WF+WSB1Ik4xhJY
 XTRbKt7OSoAKgffEvmDASxl+Epcb7lc=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-VIKa7xUHNfWHMo6uhr1_Lw-1; Mon, 18 Jul 2022 01:50:50 -0400
X-MC-Unique: VIKa7xUHNfWHMo6uhr1_Lw-1
Received: by mail-lj1-f198.google.com with SMTP id
 q8-20020a2e8748000000b0025da17feb46so1196516ljj.1
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 22:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7x3HHPPKkd8HATayhs7qFLPP87JUKqlz8QJH3WC/1Mc=;
 b=TUtCbXg1jVGQsEVQydroOVQ60xZXDOF3jL+PPlcYarABXC26faOyZI0gPHd2AXvxRs
 iDcq3PjXHrM9yDC7hxTXFOtWxZ0DTYhVCsmoa7hUlEoEzhz0/qPYBJu9iYmg1x6atEL+
 Mc9BeYcN8JDByDORsEYc85ARg6jcbXi5XjdQkPcQq/b67avn+JyF37cKo3gQ1LZD3QK1
 KfLomb2ZomMAvgN3H+lPQZWdPb/pIlEfvXkuXOEyO/BjBQZ6fcfXorUdGmgDizBg1Lvd
 uMk6RZijfE+KIuaETjMED66gAk/Gik8vSxQmHOpJFh0MeAYNICj7sZpL1rviMlwX5CmM
 Bl1g==
X-Gm-Message-State: AJIora8OVDbKWR+6UlMigd/0p4Vgaal1E24xP+d1vx8G+WMFL1IrrFtZ
 nmvs+3yLuGp+luDIv62pm75ZTHdzAX857XXqtoKLob/OdwI1HQe8JDCGUshN3A9NshjBjGcQ6sb
 U7tVuRzn4rrqe4h6HOFOz+lZxCie8vW4=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr13558616lfu.442.1658123448994; 
 Sun, 17 Jul 2022 22:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tRvdFWg+m27nKMuOSKmKl8b0dd53MrlaI1mt8DonSfl59HWuNpMIEyBPIy2eD4M+dZIP/2nd9SB6BIUxmzrOQ=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr13558603lfu.442.1658123448826; Sun, 17
 Jul 2022 22:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220716113407.2730331-1-eperezma@redhat.com>
 <20220716113407.2730331-4-eperezma@redhat.com>
In-Reply-To: <20220716113407.2730331-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 18 Jul 2022 13:50:38 +0800
Message-ID: <CACGkMEskdYYcJMXDgAmmAoO2QnE2DieaRj70_SLAYY0ygZvSgA@mail.gmail.com>
Subject: Re: [RFC PATCH 03/12] vdpa: Small rename of error labels
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Sat, Jul 16, 2022 at 7:34 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> So later patches are cleaner
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 4458c8d23e..906c365036 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1039,7 +1039,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev =
*dev)
>          int r;
>          bool ok =3D vhost_vdpa_svq_setup(dev, svq, i, &err);
>          if (unlikely(!ok)) {
> -            goto err;
> +            goto err_svq_setup;
>          }
>
>          vhost_svq_start(svq, dev->vdev, vq);
> @@ -1064,8 +1064,7 @@ err_set_addr:
>  err_map:
>      vhost_svq_stop(g_ptr_array_index(v->shadow_vqs, i));
>
> -err:
> -    error_reportf_err(err, "Cannot setup SVQ %u: ", i);

This does not look like a simple rename.

Thanks

> +err_svq_setup:
>      for (unsigned j =3D 0; j < i; ++j) {
>          VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs, j=
);
>          vhost_vdpa_svq_unmap_rings(dev, svq);
> --
> 2.31.1
>


