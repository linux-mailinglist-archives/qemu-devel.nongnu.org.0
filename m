Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14C7429C14
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 05:49:02 +0200 (CEST)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma8mj-0000j3-V5
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 23:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ma8kP-0007lT-V6
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 23:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ma8kN-0000V4-Fz
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 23:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634010394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/aq/QD9ZXHUwVYlvJZeP6YP9G9ayvsCZ2eIQxsrG8wE=;
 b=YwuWfzhlOzhTLlxmYIspXbJPRCUqDfOM9Uo4Xp3I+1BgBjBHJugr897SuIPGYLDymbg6r9
 rFmTaiX2d3xUw43JOqhe3pDhh4sJJQSrxAltvSSCGAWIx2xWkFB4jxhMlK62qMC2+LAiTW
 u4XuznQPfXOtqvJhlKlo/ueEg3ZFbps=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-yCE4nI8pN76hsxy-OlB5CQ-1; Mon, 11 Oct 2021 23:46:33 -0400
X-MC-Unique: yCE4nI8pN76hsxy-OlB5CQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 v2-20020ac25582000000b003fd1c161a31so14064713lfg.15
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 20:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/aq/QD9ZXHUwVYlvJZeP6YP9G9ayvsCZ2eIQxsrG8wE=;
 b=16ZTplk4CKbJ5SlHCzk4ubLn0oJrZPuqWo8VV59OUNrgM3bqL+68W792bKCGIRS79z
 KFOOLYcGUiYyjI5YBM9MX9YRm8S6GH0qCgoGP3malSO3BLhZAEusUusuuoXD/27Yu5V4
 n+Lx8Yri3GffIqmf57H/Bh6lbFuBf84m/nOkWyjpYfkm+y/9ivkwcEkMGWffJZ16VQVO
 lQxkDISFeTd8Ncn0PCb3I+5Mh0Hc+2rckxa54zc2ioQhY7OLtmWzFWGOm1LKdqLovtrS
 9Z9yepq8MAYIZzPGhE0+GBI4JDzk4zXg/Zdu8QqVglRwBNZ6/NsnCw2hxTjoozAUK+sV
 Rnww==
X-Gm-Message-State: AOAM530ZUg/zdUSbyLfDMPYDaBsTw4m6kIiYEG/oCLkupZj8sT7rePer
 qqyysAOKYloy7o0uIE1FFXWn5smTfljCDOqfDq3wSav9CRKSmaLXPP/GbJVrrAELS42WQcZHhuQ
 zLSasx2TSOsUm3sj4+X8TPV6EqS0P5hg=
X-Received: by 2002:a05:6512:3d29:: with SMTP id
 d41mr19163387lfv.481.1634010392245; 
 Mon, 11 Oct 2021 20:46:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbV5HiKvmKHdL8CJgHGUCSc94w+OzRryKx7X5HJqvmo6pCfiReQzQYjZVPz+jhzHeSg3metnjgt5+Renvf6BY=
X-Received: by 2002:a05:6512:3d29:: with SMTP id
 d41mr19163375lfv.481.1634010392066; 
 Mon, 11 Oct 2021 20:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211005134843.439050-1-eperezma@redhat.com>
 <20211005134843.439050-3-eperezma@redhat.com>
In-Reply-To: <20211005134843.439050-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 12 Oct 2021 11:46:21 +0800
Message-ID: <CACGkMEt3CtrOpbGMpoJ-OcgXM84UzwpugC3EAj_oGxukvNgk8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] vdpa: Add vhost_vdpa_section_end
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 5, 2021 at 9:49 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> Abstract this operation, that will be reused when validating the region
> against the iova range that the device supports.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost-vdpa.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index ea1aa71ad8..be7c63b4ba 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -24,6 +24,19 @@
>  #include "trace.h"
>  #include "qemu-common.h"
>
> +/*
> + * Return one past the end of the end of section. Be careful with uint64=
_t
> + * conversions!
> + */
> +static Int128 vhost_vdpa_section_end(const MemoryRegionSection *section)
> +{
> +    Int128 llend =3D int128_make64(section->offset_within_address_space)=
;
> +    llend =3D int128_add(llend, section->size);
> +    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> +
> +    return llend;
> +}
> +
>  static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *sec=
tion)
>  {
>      return (!memory_region_is_ram(section->mr) &&
> @@ -160,10 +173,7 @@ static void vhost_vdpa_listener_region_add(MemoryLis=
tener *listener,
>      }
>
>      iova =3D TARGET_PAGE_ALIGN(section->offset_within_address_space);
> -    llend =3D int128_make64(section->offset_within_address_space);
> -    llend =3D int128_add(llend, section->size);
> -    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> -
> +    llend =3D vhost_vdpa_section_end(section);
>      if (int128_ge(int128_make64(iova), llend)) {
>          return;
>      }
> @@ -221,9 +231,7 @@ static void vhost_vdpa_listener_region_del(MemoryList=
ener *listener,
>      }
>
>      iova =3D TARGET_PAGE_ALIGN(section->offset_within_address_space);
> -    llend =3D int128_make64(section->offset_within_address_space);
> -    llend =3D int128_add(llend, section->size);
> -    llend =3D int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> +    llend =3D vhost_vdpa_section_end(section);
>
>      trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
>
> --
> 2.27.0
>


