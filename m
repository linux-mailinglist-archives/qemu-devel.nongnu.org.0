Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1097A4EBD26
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:04:10 +0200 (CEST)
Received: from localhost ([::1]:59430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUFN-0005cf-0G
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:04:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUCt-0003Eo-HQ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUCq-00080s-RF
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648630888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PnETiMQMxr5wXJgsukjEJtjccCsLlpVPvykx6/uz2qI=;
 b=OfFChOGCyBlbGM9GkCoyiHbx1WWGFSNdX3oZ96KPuFVSL67Pm335hIYKAllTHZ8GfkwLEM
 oQP2RIJRjgxjnXoKRQPjskpV0VZTxWh72TFTivZidOPu96rHuQzph2mjLk3zlMp2tC1dat
 hX+JKAGPX0T1bkOmyQ8YfbeySkvLyM8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-ntg24jgePqCabLbveW6GEw-1; Wed, 30 Mar 2022 05:01:25 -0400
X-MC-Unique: ntg24jgePqCabLbveW6GEw-1
Received: by mail-lf1-f69.google.com with SMTP id
 e15-20020ac24e0f000000b0044a8b775985so2399233lfr.19
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 02:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PnETiMQMxr5wXJgsukjEJtjccCsLlpVPvykx6/uz2qI=;
 b=MzVfJAP+t4jvZZBGbzVwSh0QFQxOhSO/vM++F8Toy+2JoTkLMK8bWz/NCJhI7f258L
 JboV+S6LXKO+mY2M2OR4s6FOULx3BquRSrJa43butOcXEKJurNj/7tVw3qt8BU7Jfg+q
 la9DQ7mQWwDuwQii4i2l7xzuRHUXtW0ohEp6PAmgV9TmwqEWRo+hE2Qn3NgHwf8g+vGM
 K4PnO6QB5lQ3LdtpSl9cd/L/bHuryLNVVTt4lAvFwehmXVrpn+P/Y08c5tMIrnJNbixB
 wCHich0Q5nkMy1ZR5qb+FPNDT/RHIxqyceICIT5s2ebM61FuOAeXpv9uhKbXMASOK3GP
 1Xsw==
X-Gm-Message-State: AOAM533KDFLLWYLW1GfBW462+DyqlkkSPLS3S42cFL2u5JHEG4+V/L2z
 JYb/26PzFA12ZqE6xocHAfGh8JgITzaqLDY1MLTMYKM1pwkfxR2rMTEHHYRGRV4mXGHpiXQW6BL
 v1KpMb5NPjpev2bNPHBPX6oI56jfyf70=
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr6104550lfv.257.1648630884301; 
 Wed, 30 Mar 2022 02:01:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmncgoD/O0oLSO1DMZENZQCyxEaVTeWI5RK6KhZrsgegjGueWCHj7tKjxgvAt17DO6VVkDIdpHYFZ8XJIXygw=
X-Received: by 2002:a05:6512:b81:b0:448:b342:513c with SMTP id
 b1-20020a0565120b8100b00448b342513cmr6104518lfv.257.1648630883597; Wed, 30
 Mar 2022 02:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-3-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1648621997-22416-3-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 17:01:12 +0800
Message-ID: <CACGkMEujTuESbtK4dQtVGWZoH93bfkkwOEANjThgyYfE0ewGiA@mail.gmail.com>
Subject: Re: [PATCH 2/7] virtio-net: Fix indentation
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> From: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/net/virtio-net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 484b215..ffaf481 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3523,7 +3523,7 @@ static void virtio_net_device_realize(DeviceState *=
dev, Error **errp)
>      nc =3D qemu_get_queue(n->nic);
>      nc->rxfilter_notify_enabled =3D 1;
>
> -   if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_V=
DPA) {
> +    if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_=
VDPA) {
>          struct virtio_net_config netcfg =3D {};
>          memcpy(&netcfg.mac, &n->nic_conf.macaddr, ETH_ALEN);
>          vhost_net_set_config(get_vhost_net(nc->peer),
> --
> 1.8.3.1
>


