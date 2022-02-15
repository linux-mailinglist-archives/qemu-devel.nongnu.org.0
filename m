Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B474B6156
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:07:12 +0100 (CET)
Received: from localhost ([::1]:38116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJoBL-0002aA-AF
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:07:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJo8l-0001jp-73
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 22:04:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJo8h-0000Wn-52
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 22:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644894262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOMgHUwkjIv5M9vX91VjKRRVq13u0TmHqkGVHPWAxk8=;
 b=OoGejsHRQMJjTK61rvadFSNgApuCGWbWdfi2ThZP6Wuv1Gp8VeQbSE0F5GeCnMgCxgBM5t
 ATKP1S0/YIkUebiWRehZ58BVZrm6T3Ry/BrdIgPCVvcBmD/emsOn4PjZBwkmKaLuNzTEZc
 bIkmpy4S/DjIywNV+ALxhC4e4LnmXhc=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-cv3YDDpkMc6bmIHrR7oJfA-1; Mon, 14 Feb 2022 22:04:20 -0500
X-MC-Unique: cv3YDDpkMc6bmIHrR7oJfA-1
Received: by mail-lf1-f69.google.com with SMTP id
 q12-20020ac25a0c000000b004389613e0f7so5756417lfn.9
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 19:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lOMgHUwkjIv5M9vX91VjKRRVq13u0TmHqkGVHPWAxk8=;
 b=xV+E3VUuDCkyiRV8LP/1/UIA31j9O/rMOVrRwBuvDDsTF5Fjkgk3R4GMc6S+MJunee
 /L8fq/GrOo7HUlEYsZGtrEGia3EF0xEL4bpLjTSYqBoUS6SflmdAGtpRDUFLj9apqSYI
 e1GTA4iKpHvOCHFZqWuR28nWzIcWCzV/IPFgB7f/wAvFedHiPPB42gNP2GORnP5I947s
 hraTnfjhDgkfk5HYeYoNZ0dbTVBXNeBIO0spcr2pnkQecjpIgT18xiqIv6Fq/a4dsl0e
 yDXPfrBb4i5Nt6F9V2Tr65RA8d6mxiOr12hFhpebgzIPJl8Sef9BMhtu7qX5xPIDpyx+
 mPfA==
X-Gm-Message-State: AOAM531PalOWGq/6qX3LNExQSCtM97yhP+NG/xRbOIvdIQhDz1Nffn0Z
 HwdQzjqs3S8MermPpe/ZFmTGi1XSRuOgAXYsIRBYLk0L9h6jBXssqeS4H+t25vmKgI4tH18oclk
 MvHD9nFLJCGPgzRBPgDZ0hA1TVou4GSA=
X-Received: by 2002:a2e:bf22:: with SMTP id c34mr1152328ljr.369.1644894258734; 
 Mon, 14 Feb 2022 19:04:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOVaCwgeC+8Id3n08kCIt8ji+O8Hc/WuVhoF6leB8c3d1Lye5ABLVlMZqTQBKzL3lUFroIwCyBKuyAoenoKlU=
X-Received: by 2002:a2e:bf22:: with SMTP id c34mr1152307ljr.369.1644894258393; 
 Mon, 14 Feb 2022 19:04:18 -0800 (PST)
MIME-Version: 1.0
References: <20220214193415.1606752-1-eperezma@redhat.com>
 <20220214193415.1606752-2-eperezma@redhat.com>
In-Reply-To: <20220214193415.1606752-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 15 Feb 2022 11:04:07 +0800
Message-ID: <CACGkMEukk9jWDnEtwTuoH0NGBBk=ZZ4Xhf6kLUru6UgQZu54vw@mail.gmail.com>
Subject: Re: [PATCH 1/1] vdpa: Make ncs autofree
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 3:34 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Simplifying memory management.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  net/vhost-vdpa.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4125d13118..4befba5cc7 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -264,7 +264,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>  {
>      const NetdevVhostVDPAOptions *opts;
>      int vdpa_device_fd;
> -    NetClientState **ncs, *nc;
> +    g_autofree NetClientState **ncs =3D NULL;
> +    NetClientState *nc;
>      int queue_pairs, i, has_cvq =3D 0;
>
>      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> @@ -302,7 +303,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>              goto err;
>      }
>
> -    g_free(ncs);
>      return 0;
>
>  err:
> @@ -310,7 +310,6 @@ err:
>          qemu_del_net_client(ncs[0]);
>      }
>      qemu_close(vdpa_device_fd);
> -    g_free(ncs);
>
>      return -1;
>  }
> --
> 2.27.0
>


