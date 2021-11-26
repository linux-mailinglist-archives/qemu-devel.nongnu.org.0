Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC545E584
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:55:19 +0100 (CET)
Received: from localhost ([::1]:51782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqROQ-0003rO-LJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:55:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqRNV-0002tE-Ij
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:54:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mqRNU-0005Aj-7f
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637895259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axIWXwKjdGfwV75JRGjNxSNOca7gNEVtw3cSta4x/kY=;
 b=BY73nSd7EmJj9ivSGTNF2UewGN09DoQAQTLuZ8935hiRIS9h1Se0HAJnlM4bg2XL/eL6Fa
 6qcvn1Et5Yvx86Lk/ehC2vrOmOZ5k4X79c48Cg6XWX8KA7my2o4eM5KiHmEfjm4+15JnJC
 yx7Kk5hNNqvXUxv420RVsV4mc/EM4Sc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-r1lkR-YbNx6J1cxQLoNLIQ-1; Thu, 25 Nov 2021 21:54:16 -0500
X-MC-Unique: r1lkR-YbNx6J1cxQLoNLIQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 y11-20020a2e978b000000b00218df7f76feso2593758lji.11
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 18:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=axIWXwKjdGfwV75JRGjNxSNOca7gNEVtw3cSta4x/kY=;
 b=71lE3V3shY2LrSE8NBKQByo1Ol3oBQRWshd5QWVAw3GMHnm3Agh+e/3EtBYzjnkj1+
 5oM4JQDm0EYftHlrUHU7Binft7bDQKzaW7uMvGomb4AXiU20EY0cUDQ5ImGvFtM8BvH+
 1JUC3F1lYxigX5cQ0G75TlEbn1vfZJgey94sju5AoWUE+SnlPondaRHyFStnCUkWeJ+v
 XueLZJd6x8tjCvYPjzjBsyB7GEYFjKbthG+5S5AgehgiLsKMUTk9yMuK9s+vE2Q3+MX8
 Owm1L+13Jw/XAuAzATZm1GVomazlX6wouKnDdJ9vgoZVFctQOHxjbjhTu42Jc8MUSu9R
 QRpw==
X-Gm-Message-State: AOAM531SlnErSpAF0Gb5xnQWvgCgXyEMyVthvFbVoFfCITF8EQxD0KlZ
 hm5cODg2ZXvkwrh6jIr0Rj9KzGkXe6zdfmKP2POXIHc54qKE18BCe4zHYYpRi7Ooj6dMRz6ODAU
 0ImFTgi3EJtvvoUSXLMMzt+tSMU+E7p8=
X-Received: by 2002:a05:6512:3b2b:: with SMTP id
 f43mr28247557lfv.629.1637895254816; 
 Thu, 25 Nov 2021 18:54:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhNAQxvOt3FDPWDy0EI2J6u8hMmZ/Hpd9ua0pt8SFwKBEfgfec03gQNTzs12EgrDW1uvhom6Ty4eOTkQT7Fx4=
X-Received: by 2002:a05:6512:3b2b:: with SMTP id
 f43mr28247537lfv.629.1637895254561; 
 Thu, 25 Nov 2021 18:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20211125101614.76927-1-eperezma@redhat.com>
 <20211125101614.76927-2-eperezma@redhat.com>
In-Reply-To: <20211125101614.76927-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 26 Nov 2021 10:54:03 +0800
Message-ID: <CACGkMEsCgV_fHJLnf2CxQbqaubD1EFJ7uzpWMKrNxwsq0sKoyQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] vdpa: Add dummy receive callback
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Qemu falls back on userland handlers even if vhost-user and vhost-vdpa
> cases. These assumes a tap device can handle the packets.
>
> If a vdpa device fail to start, it can trigger a sigsegv because of
> that. Add dummy receiver that returns no progress so it can keep
> running.
>
> Fixes: 1e0a84ea49 ("vhost-vdpa: introduce vhost-vdpa net client")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  net/vhost-vdpa.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 2e3c22a8c7..25dd6dd975 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -170,9 +170,17 @@ static bool vhost_vdpa_check_peer_type(NetClientStat=
e *nc, ObjectClass *oc,
>      return true;
>  }
>
> +/** Dummy receive in case qemu falls back to userland tap networking */
> +static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf=
,
> +                                  size_t size)
> +{
> +    return 0;
> +}
> +
>  static NetClientInfo net_vhost_vdpa_info =3D {
>          .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
>          .size =3D sizeof(VhostVDPAState),
> +        .receive =3D vhost_vdpa_receive,
>          .cleanup =3D vhost_vdpa_cleanup,
>          .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
>          .has_ufo =3D vhost_vdpa_has_ufo,
> --
> 2.27.0
>


