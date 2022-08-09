Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC0958D41E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 08:57:42 +0200 (CEST)
Received: from localhost ([::1]:36500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLJBN-0004oK-11
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 02:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJ7y-0003MG-2q
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 02:54:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLJ7u-0002Pn-Ng
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 02:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660028044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+32JTvwP6O6TlLDWwumK98ug1yMBQVsXSoHuuABSK5k=;
 b=R5C+XxfKHbhC9JqcucjzLd+qS6FS5zbIc843cQNwqJVgDJkBaAcvCK8v+hu5rXAYxfxY4T
 oiiYAokJzPVL6rfuJxGcX1Tzpzy3frE4I9FZVg5C7ZFrmqTKqV/wW6ffHMCxvp8uq28Ehm
 DAcPgKqjMw27BlyTY4A4/ucK9dxJHso=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-3iRWG-EgOeyMOWE1y11APQ-1; Tue, 09 Aug 2022 02:54:00 -0400
X-MC-Unique: 3iRWG-EgOeyMOWE1y11APQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 e10-20020a19674a000000b0047f8d95f43cso2533538lfj.0
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 23:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+32JTvwP6O6TlLDWwumK98ug1yMBQVsXSoHuuABSK5k=;
 b=289Og/sMFd3E6m81cNmXaXK+3gnO+75X6xbv4JeCTsRi2uavok+AmXSkoVdlGQ0uTL
 9Mcp1sJ3Be4vHigsXXosATwMtZefH7I5RyEwO8tsv55Iy0Y22r9zpVdLzbtlah/U8h0l
 LWEo664hNBIYuV7Zs9kxAg1KU7dLGYN21B9m11L+XSVojoeYBkGfpRFsFShWqdmYBnJn
 bciojaftrsyqOG0BNDUm7TtV4tpZzvk6qZUUwLOzLtLpSvkSErqtqQGXtZsax+2ZjMUy
 xd0k6CROkMkASCWPviuAYdJ/ZEB171D/LvizD6lIb77F3yMMZxYKgjepZrR4CGV3zvW4
 vlKw==
X-Gm-Message-State: ACgBeo2a/XEMMQUuYpzsZqXSezv+MKTkIhogQw33xp31FZpaBWuICcBI
 pAc1ldNyGqpYhmQFMH1dN8ikb2Vwyj5qW4APxtkctPBhqOg7o2ytXMroLU4pBLOeDO6Ji2EeUxw
 x3lFsn+2tUx3FBAkZ4atTnF3L+FB6TjU=
X-Received: by 2002:ac2:43b0:0:b0:48b:1eb:d1e5 with SMTP id
 t16-20020ac243b0000000b0048b01ebd1e5mr8050540lfl.641.1660028037636; 
 Mon, 08 Aug 2022 23:53:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5XtA31Yf3/dmwrOECYibyvXNatD15ck4MBDta2AxxM55EEATvVEUy7dTCNTNsUDzq9lBMVuFhKfk7uLmSusng=
X-Received: by 2002:ac2:43b0:0:b0:48b:1eb:d1e5 with SMTP id
 t16-20020ac243b0000000b0048b01ebd1e5mr8050522lfl.641.1660028037394; Mon, 08
 Aug 2022 23:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-6-eperezma@redhat.com>
In-Reply-To: <20220804182852.703398-6-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Aug 2022 14:53:46 +0800
Message-ID: <CACGkMEstThyEwzMgH7KS-7cnw-L6HT7dqNWNaqWMJr9cHh6K5g@mail.gmail.com>
Subject: Re: [PATCH v7 05/12] vhost_net: Add NetClientInfo prepare callback
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> This is used by the backend to perform actions before the device is
> started.
>
> In particular, vdpa net use it to map CVQ buffers to the device, so it
> can send control commands using them.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/net/net.h  | 2 ++
>  hw/net/vhost_net.c | 7 +++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index 523136c7ac..3416bb3d46 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -44,6 +44,7 @@ typedef struct NICConf {
>
>  typedef void (NetPoll)(NetClientState *, bool enable);
>  typedef bool (NetCanReceive)(NetClientState *);
> +typedef int (NetPrepare)(NetClientState *);
>  typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t);
>  typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *, =
int);
>  typedef void (NetCleanup) (NetClientState *);
> @@ -71,6 +72,7 @@ typedef struct NetClientInfo {
>      NetReceive *receive_raw;
>      NetReceiveIOV *receive_iov;
>      NetCanReceive *can_receive;
> +    NetPrepare *prepare;

So it looks to me the function is paired with a stop that is
introduced in the following patch.

Maybe we should use "start/stop" instead of "prepare/stop"?

Thanks

>      NetCleanup *cleanup;
>      LinkStatusChanged *link_status_changed;
>      QueryRxFilter *query_rx_filter;
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index ccac5b7a64..e1150d7532 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -244,6 +244,13 @@ static int vhost_net_start_one(struct vhost_net *net=
,
>      struct vhost_vring_file file =3D { };
>      int r;
>
> +    if (net->nc->info->prepare) {
> +        r =3D net->nc->info->prepare(net->nc);
> +        if (r < 0) {
> +            return r;
> +        }
> +    }
> +
>      r =3D vhost_dev_enable_notifiers(&net->dev, dev);
>      if (r < 0) {
>          goto fail_notifiers;
> --
> 2.31.1
>


