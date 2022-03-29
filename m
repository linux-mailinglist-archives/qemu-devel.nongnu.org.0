Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1234EAA40
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 11:14:42 +0200 (CEST)
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ7w1-0000Yo-Lw
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 05:14:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZ7tw-0007rV-4Y
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:12:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZ7tr-0004pG-TH
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 05:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648545145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X9Ovvbb/7HYqdMMAeDdPsYvFwyP61Wr5Uvo4m+npnv0=;
 b=Sw+wY4xlwrzCBMKjJQjGUK61REIRVxHRRfSuZhQFujKvEc1RpXMsitogWRBl8TPxnMLyuL
 p5r4Yjz2y4beqbpIbK9+kLSi3lneguDbAKO2nUWzBcRyY1LjWESA+mxuuOsZcP82Xw/wCB
 YDK4DIuPA2k11vQ8OgXMCwdRpKoqQ0o=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-0aC7giIzOxyJ-M31lQSyHw-1; Tue, 29 Mar 2022 05:12:24 -0400
X-MC-Unique: 0aC7giIzOxyJ-M31lQSyHw-1
Received: by mail-qk1-f198.google.com with SMTP id
 bs8-20020a05620a470800b0067e383077adso10086743qkb.10
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 02:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X9Ovvbb/7HYqdMMAeDdPsYvFwyP61Wr5Uvo4m+npnv0=;
 b=Ycyiuxl2o0NnD2RVCxSvRLBN1n3goNsmqQhje59ZxQ8XQX9129OGoXpJtLf/FF1TGq
 VUxvsTQOVtllCc8guFH4Y/ozlb4OPv/SP5a5p47cV/GcLrKo8TDwuAq4KxaPtIeghN8j
 Ftspqh0e6Qwq0j083cUquc+Gdk0LO5zn/0kV/158ndhqgPKlLRYlB/KtfVWmotvpKI3S
 a3OaKFRRGmfp7hJ3WmhXTa8g5lKAnRZf9J5hG1clsZKRz+Ev1+ZIb7qZTBEWnV1SQuJi
 nlSBEEAEZh7A44tOIEvNWWh+g2MxC9XohRzWn2/rF4RmkSjBCzYLGypYM9kdLQApmeK7
 8vLg==
X-Gm-Message-State: AOAM533G3C5KoTomWVVaKZzUR/TzC+8JHRiQZgSFDbL0Cn5vXrr4jK9p
 hkd4S1Kym06y5YSBMlNtcFPk5Uf3WObP/MgO+b6DHLyeMjnEXqVSZXMBJ62WrxU1lxvpz0/mk5x
 zIpZc0qnBCdtFhNz0ayRqyly7ep9WVEc=
X-Received: by 2002:ac8:59c7:0:b0:2e1:a0d1:fc7b with SMTP id
 f7-20020ac859c7000000b002e1a0d1fc7bmr26414612qtf.320.1648545143594; 
 Tue, 29 Mar 2022 02:12:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd7T2Ip6vSWA+jNJUleCZZii2fZTvqHVYjMMKX1zZS0kdduB6uc4p86lEexNu7PbL9Kgmhq7qT8D+7u0UiEDM=
X-Received: by 2002:ac8:59c7:0:b0:2e1:a0d1:fc7b with SMTP id
 f7-20020ac859c7000000b002e1a0d1fc7bmr26414601qtf.320.1648545143378; Tue, 29
 Mar 2022 02:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220329073602.754456-1-pbonzini@redhat.com>
In-Reply-To: <20220329073602.754456-1-pbonzini@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 29 Mar 2022 11:11:47 +0200
Message-ID: <CAJaqyWfGjdj_qhQQ9ZnFG=dodaj1Eonn1Btye1jxnW-+oXDKGw@mail.gmail.com>
Subject: Re: [PATCH for-7.0] virtio: fix --enable-vhost-user build on non-Linux
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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
Cc: qemu-level <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 9:38 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The vhost-shadow-virtqueue.c build requires include files from
> linux-headers/, so it cannot be built on non-Linux systems.
> Fortunately it is only needed by vhost-vdpa, so move it there.
>

Thanks for the catch!

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/virtio/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 6047670804..67dc77e00f 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -11,9 +11,9 @@ softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhos=
t-stub.c'))
>
>  virtio_ss =3D ss.source_set()
>  virtio_ss.add(files('virtio.c'))
> -virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-bac=
kend.c', 'vhost-shadow-virtqueue.c', 'vhost-iova-tree.c'))
> +virtio_ss.add(when: 'CONFIG_VHOST', if_true: files('vhost.c', 'vhost-bac=
kend.c', 'vhost-iova-tree.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER', if_true: files('vhost-user.c'))
> -virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-vdpa.c'))
> +virtio_ss.add(when: 'CONFIG_VHOST_VDPA', if_true: files('vhost-shadow-vi=
rtqueue.c', 'vhost-vdpa.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-ball=
oon.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypt=
o.c'))
>  virtio_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VIRTIO_PCI'], if_tr=
ue: files('virtio-crypto-pci.c'))
> --
> 2.35.1
>
>


