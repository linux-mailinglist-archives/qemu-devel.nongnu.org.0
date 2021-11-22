Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656B458969
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 07:48:34 +0100 (CET)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp37v-00006x-FB
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 01:48:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mp320-0006x4-JX
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 01:42:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mp31t-0007nO-8u
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 01:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637563335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvUR02iAaO3SojSKUNPgnel5VCrNRntTBwpcvtyFCsg=;
 b=XsZ+BHQ/GfotXdlh62jqGXrPFwsaRC4ndfzt7jLmxoVTJ2EnNqnuCn+qnlPM5EdO8tWvkd
 mQ1jSsHBZUyje3vjsYiPRTLtBT9RETnvAlq04v1g00cGLZZWN5v9WQA1m5f+GjlkvRpC0u
 4Si+LX+hyVUnY9Q8MzoMW+ZjbztJULE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-kvjZS_k_Ma6nwrLZjmrZUw-1; Mon, 22 Nov 2021 01:42:14 -0500
X-MC-Unique: kvjZS_k_Ma6nwrLZjmrZUw-1
Received: by mail-qk1-f197.google.com with SMTP id
 bi22-20020a05620a319600b00468606d7e7fso14094590qkb.10
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 22:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uvUR02iAaO3SojSKUNPgnel5VCrNRntTBwpcvtyFCsg=;
 b=yJ3klAZqAcs+YuLKbBGn9d+tkoMgB5Yeiq86aTqiL8nio8EprLsk+oHHjVO6j2Ck0B
 GXOMTBZJTNYEAWCBRsV8ElCS+5wEuoC8qizFlNjGcz63dTilz0RLoIgcu8oNDstzyssv
 uTP0FkhMXf21zMGY9W6ltiRzmHLdGZWTulnZMg4s1rqAqeE/4pAcfjV30fzB6hvtTpoH
 Pd2y6LJtY86PRBI08ksWY6Tr/fsCc6Hobnmp5yq76e6q54KjQXCRqcmsQ82LFznZhE4l
 YgEXSEWuRhaaatoj9FYioozJb9jGYzUatg9rwrDss8txjIofob4CiO6u67wLuRk0eSlB
 jVcg==
X-Gm-Message-State: AOAM530NKr4+tdKLsA9yf5l/QNvZDvMeGXGpLPQiHFOTSZaBKb4GNLKk
 uGN9ZURBAkx6RhQaoFm2iBWO/4VNpLMTPNW9CWeOlXa6K1ecVjjHW2StL4t0BkEy606W1bIV2gj
 9O8a4O5Ikcd7418zpolI4okJaBMi8vVs=
X-Received: by 2002:ac8:7d01:: with SMTP id g1mr29140179qtb.175.1637563334218; 
 Sun, 21 Nov 2021 22:42:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsxqzjx7bwV5/6NT2LNRfe08Hh2CuWOuYY1pO9sPea9T8cTJ5KnFQk7vraRIDoH0Y7gn+7zsNdChDRQ5Nf93M=
X-Received: by 2002:ac8:7d01:: with SMTP id g1mr29140163qtb.175.1637563334047; 
 Sun, 21 Nov 2021 22:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20211119102033.36149-1-eperezma@redhat.com>
 <20211119102033.36149-3-eperezma@redhat.com>
 <CACGkMEuY5cX+6iCXGNqmZLTAKpVG3vcSxmowtqinj2uK8yOktA@mail.gmail.com>
In-Reply-To: <CACGkMEuY5cX+6iCXGNqmZLTAKpVG3vcSxmowtqinj2uK8yOktA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 22 Nov 2021 07:41:38 +0100
Message-ID: <CAJaqyWdd=6qmwweW94as8nADkG_Kg=3GqRhg-S7y8RUZMeuY0Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] vdpa: Add dummy receive callbacks
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 4:55 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Nov 19, 2021 at 6:20 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > Qemu falls back on userland handlers even if vhost-user and vhost-vdpa
> > cases. These assumes a tap device can handle the packets.
> >
> > If a vdpa device fail to start, it can trigger a sigsegv because of
> > that. Add dummy receivers that return no progress so it can keep
> > running.
> >
> > Fixes: 1e0a84ea49 ("vhost-vdpa: introduce vhost-vdpa net client")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  net/vhost-vdpa.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 2e3c22a8c7..4c75b78304 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -170,9 +170,25 @@ static bool vhost_vdpa_check_peer_type(NetClientSt=
ate *nc, ObjectClass *oc,
> >      return true;
> >  }
> >
> > +/** Dummy receive in case qemu falls back to userland tap networking *=
/
> > +static ssize_t vhost_vdpa_receive_iov(NetClientState *nc,
> > +                                      const struct iovec *iov, int iov=
cnt)
> > +{
> > +    return 0;
> > +}
> > +
> > +/** Dummy receive in case qemu falls back to userland tap networking *=
/
> > +static ssize_t vhost_vdpa_receive_raw(NetClientState *nc, const uint8_=
t *buf,
> > +                                      size_t size)
> > +{
> > +    return 0;
> > +}
>
> It looks to me the .receive_raw is not need, in nc_sendv_compat() we had:
>
> =3D>  if (flags & QEMU_NET_PACKET_FLAG_RAW && nc->info->receive_raw) {
>         ret =3D nc->info->receive_raw(nc, buffer, offset);
>     } else {
>         ret =3D nc->info->receive(nc, buffer, offset);
>     }
>

Right, I will delete the _raw part.

Thanks!

> Thanks
>
> > +
> >  static NetClientInfo net_vhost_vdpa_info =3D {
> >          .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> >          .size =3D sizeof(VhostVDPAState),
> > +        .receive_iov =3D vhost_vdpa_receive_iov,
> > +        .receive_raw =3D vhost_vdpa_receive_raw,
> >          .cleanup =3D vhost_vdpa_cleanup,
> >          .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> >          .has_ufo =3D vhost_vdpa_has_ufo,
> > --
> > 2.27.0
> >
>


