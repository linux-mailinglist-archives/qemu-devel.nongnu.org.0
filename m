Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D1F6AE9A2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:26:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZb4T-0005j1-AE; Tue, 07 Mar 2023 12:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pZb4Q-0005iU-6h
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pZb4O-0000lp-DR
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678209947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3M1Nx6lhCqz7S8J885usmME8IEPySzz74xC4zo9aasM=;
 b=d7Rowi6Kdx+vtcBH+bsfjW+vX0k1hTiHY9kc/nkWd2mXx4Bro12jees3iQGfsVfRaFaZFT
 1UaL/dBWcVyZfkjbdWTi/hIzg1fmTy7TlrbfIwzwH/Hcsw4wmTkkA2ml/TKsqnE+POXJ3g
 NhjxB6MqWdeRJThtP/ilPQciN6wbdi0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-OhM_ZjxsOpagXWh-uNVeYQ-1; Tue, 07 Mar 2023 12:25:46 -0500
X-MC-Unique: OhM_ZjxsOpagXWh-uNVeYQ-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-536bbaeceeaso142220437b3.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678209946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3M1Nx6lhCqz7S8J885usmME8IEPySzz74xC4zo9aasM=;
 b=vw7O7O1/JJrzhdSlucrj824hxLZHyfNI5SORUZYsR8cMMh/gih+fpZe9+o2DUJAGra
 K1/rWXegyfx43INA4tUz5/vUI2zrO7p0oBIDYx0FWzGoUqtfiBnhWwE7wdMIJ5c3b7ug
 epjjKm1wLRVP7D/3RELfuWiMi5CIRQOa6rhcQVkR+XkguJQQIfW31r/3FJ3x32CkTFj0
 /LP0f+CeyGlU3aSsqKB/JJoldyOsBrznviQZtVWQVEkNipJ9AmVjrXdV/2GzFI9GNQr0
 GpYK4v5H1LMyd+19M8EnbBRSjTmlFZ9TsKms1XoZqLFgQmt3N1LXqXLXPhUByfmDaM85
 aVhw==
X-Gm-Message-State: AO0yUKU1aoH412NDCoI5vKGxszYoqlBIlKdAR7jY8ZOjKlfnoI6mNDF9
 fEXhb/HFFkooANM3dXawsol6dmwMaMgdr22FcFXAerorIw5WzjrVXBs5Np0thI0FH9BTCd0G1R6
 jyy7kau/wVd4pAosGVqf0yLGhCNMgPmg=
X-Received: by 2002:a5b:112:0:b0:b17:294f:fb30 with SMTP id
 18-20020a5b0112000000b00b17294ffb30mr2184594ybx.2.1678209945878; 
 Tue, 07 Mar 2023 09:25:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/IUfLP0rTsz9l1hNcpfDvbX5CF7hG0YJNjPV2rWzOHcAKovPPkFvP2L7LkcCR+q2AroKyFB+SJPIBxxJDFxuU=
X-Received: by 2002:a5b:112:0:b0:b17:294f:fb30 with SMTP id
 18-20020a5b0112000000b00b17294ffb30mr2184590ybx.2.1678209945650; Tue, 07 Mar
 2023 09:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20230307170018.260557-1-eperezma@redhat.com>
 <20230307120103-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230307120103-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 7 Mar 2023 18:25:09 +0100
Message-ID: <CAJaqyWco_WzDpfEFBdpLDQGG==sRGEK7uY7D8wFig5pOdU69ng@mail.gmail.com>
Subject: Re: [PATCH for 8.1] vdpa: accept VIRTIO_NET_F_SPEED_DUPLEX in SVQ
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Alvaro Karsz <alvaro.karsz@solid-run.com>, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 7, 2023 at 6:02=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Tue, Mar 07, 2023 at 06:00:18PM +0100, Eugenio P=C3=A9rez wrote:
> > There is no reason to block it as it has nothing to do with the vrings.
> > All the support of the feature comes via config space.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > Suggested-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
>
> do we need to version this with machine type btw?
>

No, as far as I know. If the destination qemu does not support
VIRTIO_NET_F_SPEED_DUPLEX and it enables SVQ it will refuse to start.

Thanks!

> > ---
> >  net/vhost-vdpa.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index de5ed8ff22..8b25559320 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -99,7 +99,8 @@ static const uint64_t vdpa_svq_device_features =3D
> >      BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
> >      BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
> >      BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> > -    BIT_ULL(VIRTIO_NET_F_STANDBY);
> > +    BIT_ULL(VIRTIO_NET_F_STANDBY) |
> > +    BIT_ULL(VIRTIO_NET_F_SPEED_DUPLEX);
> >
> >  #define VHOST_VDPA_NET_CVQ_ASID 1
> >
> > --
> > 2.31.1
>


