Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1260563A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 06:15:29 +0200 (CEST)
Received: from localhost ([::1]:53790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olMxr-0002v6-Op
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:15:27 -0400
Received: from [::1] (port=51794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olMxr-0002mG-H3
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olMvk-0008FU-7T
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:13:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olMvi-0001Kd-KU
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666239193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4bpB2IJNm/8mEZ2mJiiycDG1jrdjigTnaGlhWwH5v1o=;
 b=LgqSzgwzFaJVzond6oyLHQmKyIxb+b7UcL37p9QCaMg4dYHjo6eydKOTEv3OviaVtaqAnH
 OwyXO+XxeTGmPJ6tpsOZCiRcVkgVBhdYnieUdFK11tUafkwGcmkuIwV/PfR/VtFwCiQrLK
 SHK3vfICSz2QvayeNLJMYFPapi4E8rI=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-zNKgoRY6Ogen0gen5zmwrA-1; Thu, 20 Oct 2022 00:13:12 -0400
X-MC-Unique: zNKgoRY6Ogen0gen5zmwrA-1
Received: by mail-ot1-f71.google.com with SMTP id
 3-20020a9d0b83000000b00660d7acf0dfso9190174oth.9
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 21:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4bpB2IJNm/8mEZ2mJiiycDG1jrdjigTnaGlhWwH5v1o=;
 b=Im5M4Oi6yvVT3GSd/AkxKN4lVsCkLYca03tbDU6bu3o7HMp8OoYjesKgv5F7H8+eDX
 XhYbFDtQTQvFsUZpa1aA5j/oyLVDvWuuBcjJHLLneWN4tQFL4IFoQ/yhl7N3BixYmyzD
 2jg2yzgrilGOc+/cSaJkqIkxOQumREsaMJ7D7KZ4lY7+BteAKJwj5SwEJDqireJ4o3al
 AE0K+S2K16c7x0CF5iWG/tNCSumhfRHPtO944NZze0c83YPwf+0D7ARNkvSWm+tFI+uP
 t4fFewke05ymX2QjyMaYTLyqp4JUMezsiXOAtC5OgyahrhwMv7zrlE/NWnXujf0v/eGa
 27jw==
X-Gm-Message-State: ACrzQf3SiodCzTZdBKBZt2ZMwH+pOkY1fFBEyldr/68hfJdn8f8WMNpx
 Sx7DGZaNN2S6ZKwswMyS6XfDuB0VCmLXfugROgk/AS+MZpH5NOWILkp/7gde1xbxG1x3EZh1NcE
 srZLbcFa8+MaIn693UMM1qg6hZKUBhIg=
X-Received: by 2002:a05:6808:1985:b0:354:d7cf:9acb with SMTP id
 bj5-20020a056808198500b00354d7cf9acbmr6377136oib.280.1666239191630; 
 Wed, 19 Oct 2022 21:13:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5hkwsW/mNRb3RADm8mbDjhuJ0wtHw6rRpI2i+Rkh8DqKOjRh0cqtwen5+jZCzcwHdkj2jLkgmHSCo4DCG0a3A=
X-Received: by 2002:a05:6808:1985:b0:354:d7cf:9acb with SMTP id
 bj5-20020a056808198500b00354d7cf9acbmr6377119oib.280.1666239191285; Wed, 19
 Oct 2022 21:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-2-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-2-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Oct 2022 12:12:59 +0800
Message-ID: <CACGkMEsyiPzfNCg9imBOWMDf-Qdj6CMTKM==jFT_UmrqWrzjbA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/8] vdpa: Delete duplicated vdpa_feature_bits entry
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This entry was duplicated on referenced commit. Removing it.
>
> Fixes: 402378407dbd ("vhost-vdpa: multiqueue support")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  net/vhost-vdpa.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4bc3fd01a8..eebf29f5c1 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -63,7 +63,6 @@ const int vdpa_feature_bits[] =3D {
>      VIRTIO_NET_F_CTRL_RX,
>      VIRTIO_NET_F_CTRL_RX_EXTRA,
>      VIRTIO_NET_F_CTRL_VLAN,
> -    VIRTIO_NET_F_GUEST_ANNOUNCE,
>      VIRTIO_NET_F_CTRL_MAC_ADDR,
>      VIRTIO_NET_F_RSS,
>      VIRTIO_NET_F_MQ,
> --
> 2.31.1
>


