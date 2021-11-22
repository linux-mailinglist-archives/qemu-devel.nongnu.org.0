Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B875545887E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 04:57:02 +0100 (CET)
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp0Rx-0002Ro-Dh
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 22:57:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mp0Qm-0001ar-Aq
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 22:55:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mp0Qj-000552-Hi
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 22:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637553344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kEgz5cbKZxAI7pBzdC/KTj4UyOK/+N6fumRqcXNe2E4=;
 b=c11MKwVNDs4/ApT3r6o9eo2yNl5SCpAutPfv49QHMZsuBka5T//zWzcmZITD/M+2Qy1OZO
 IUERGFU7QSN09JnG4WKKi9npOJSU/vk1qC0z0nwiB1wXU61u6GafC0HzJhEHFX2soKnMJp
 1SrzpRcOk42QgLUqp2cXS7w5K4AoDUs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-pEH-KvzQPK282wyyltEgEg-1; Sun, 21 Nov 2021 22:55:43 -0500
X-MC-Unique: pEH-KvzQPK282wyyltEgEg-1
Received: by mail-lf1-f72.google.com with SMTP id
 h40-20020a0565123ca800b00402514d959fso11122501lfv.7
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 19:55:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kEgz5cbKZxAI7pBzdC/KTj4UyOK/+N6fumRqcXNe2E4=;
 b=QETBC9mTvVPYVrStNjgAei8xWkKb/HaZO2nDBsciCoRQilSNPzZoUuJuDESSQ59EUn
 0JVLsC+f3UT2NxMO9wcqQbLKA2JEAVaZZhbJxTh0qmOkhEPghyxzL0lgCTzJgU75/vkT
 aiteMDq81tqNHqibGX+JwzLXyQ7BwgOVLDWi2ZkLD+WbqHxx399+4XVBGSoYEvXNk9Ql
 BeUbTYByKpVuCjXwsZedb7D+yyvQOubpBr9tN8Dmzdaq5fYLSXY/kg7dwLz6MbGHvWkK
 em8epSWAphUBRfU1/iK4+J78gqHjVh/diw0KoZLnefZYBWl5hBjbBFwM4kzI7w80xWAJ
 EWxQ==
X-Gm-Message-State: AOAM5332nmm7xCu4GZXdhWnVLtQo1GNL8Ko6UdM2pSjmlLF+H/wItBM6
 ixsXKoxC1gf5Lv7pL1CmZR2NO9TUQWYQ/1QnJmXTUoMbJXrtJwseslY3zZ+/wBy2Nn4XEmB8vze
 pdYMCmHxtpMHi1vkipIgpQANYk66IJV0=
X-Received: by 2002:a2e:2ac1:: with SMTP id
 q184mr49936429ljq.420.1637553342179; 
 Sun, 21 Nov 2021 19:55:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZ0mMw888SgknpNacLcBQn+Pc4PGfQDAXZDhROanOr5VnWDd1Qq57hjB0zmVqL8KTMG/flEqHzflLTINYjkas=
X-Received: by 2002:a2e:2ac1:: with SMTP id
 q184mr49936383ljq.420.1637553341750; 
 Sun, 21 Nov 2021 19:55:41 -0800 (PST)
MIME-Version: 1.0
References: <20211119102033.36149-1-eperezma@redhat.com>
 <20211119102033.36149-3-eperezma@redhat.com>
In-Reply-To: <20211119102033.36149-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 22 Nov 2021 11:55:30 +0800
Message-ID: <CACGkMEuY5cX+6iCXGNqmZLTAKpVG3vcSxmowtqinj2uK8yOktA@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: Add dummy receive callbacks
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 6:20 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Qemu falls back on userland handlers even if vhost-user and vhost-vdpa
> cases. These assumes a tap device can handle the packets.
>
> If a vdpa device fail to start, it can trigger a sigsegv because of
> that. Add dummy receivers that return no progress so it can keep
> running.
>
> Fixes: 1e0a84ea49 ("vhost-vdpa: introduce vhost-vdpa net client")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  net/vhost-vdpa.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 2e3c22a8c7..4c75b78304 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -170,9 +170,25 @@ static bool vhost_vdpa_check_peer_type(NetClientStat=
e *nc, ObjectClass *oc,
>      return true;
>  }
>
> +/** Dummy receive in case qemu falls back to userland tap networking */
> +static ssize_t vhost_vdpa_receive_iov(NetClientState *nc,
> +                                      const struct iovec *iov, int iovcn=
t)
> +{
> +    return 0;
> +}
> +
> +/** Dummy receive in case qemu falls back to userland tap networking */
> +static ssize_t vhost_vdpa_receive_raw(NetClientState *nc, const uint8_t =
*buf,
> +                                      size_t size)
> +{
> +    return 0;
> +}

It looks to me the .receive_raw is not need, in nc_sendv_compat() we had:

=3D>  if (flags & QEMU_NET_PACKET_FLAG_RAW && nc->info->receive_raw) {
        ret =3D nc->info->receive_raw(nc, buffer, offset);
    } else {
        ret =3D nc->info->receive(nc, buffer, offset);
    }

Thanks

> +
>  static NetClientInfo net_vhost_vdpa_info =3D {
>          .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
>          .size =3D sizeof(VhostVDPAState),
> +        .receive_iov =3D vhost_vdpa_receive_iov,
> +        .receive_raw =3D vhost_vdpa_receive_raw,
>          .cleanup =3D vhost_vdpa_cleanup,
>          .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
>          .has_ufo =3D vhost_vdpa_has_ufo,
> --
> 2.27.0
>


