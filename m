Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDFE5B6792
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 07:59:37 +0200 (CEST)
Received: from localhost ([::1]:45194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXyxL-0002Ni-W8
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 01:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oXyvA-0000wY-Qk
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 01:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oXyv7-00044m-06
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 01:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663048631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RG/6QYUHYQrimrqyHe4Nfxm4SheqHESRLD8uZ3CZw7Q=;
 b=ibtBdTj07DsenrcO5SdlcZE2ridvJdRlcI04OO3zF15nW9h/GL/ybrZ3Pn9dY4B/xz9fQW
 N6qgyd38s89Eyvtpc21ZXFUKeN1JzeyswznQwII+xQDzJWhkH+CDI1jIhXipRydzm3TqZN
 +mtaLbmiE5VtfObT67PTiZM10DRuN4s=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-uQZKX-bANw-4GF_Wea9gmw-1; Tue, 13 Sep 2022 01:57:09 -0400
X-MC-Unique: uQZKX-bANw-4GF_Wea9gmw-1
Received: by mail-vk1-f197.google.com with SMTP id
 e196-20020a1f1ecd000000b003a27f3f8d05so599274vke.21
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 22:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=RG/6QYUHYQrimrqyHe4Nfxm4SheqHESRLD8uZ3CZw7Q=;
 b=OKNEozelADFukPBokxnpAK3pA/01DqamPNg2FVumhy+l1p+3RI8Qe2u3E+wwY7St56
 LPU97CMjCuhUh8GgI8FU+RQc5cwlCLOtF/c1H0AQOmMRqcWmeoSe+8FnurseQC+73RM7
 YOMU5WpiLO1QswX/kB7XzvI7Us3a3BvALXFTDhmj2pMMAL+74/NpMFdiIKG2J33G+vH3
 O50qESJNiAPtb/QYklpdk6xgpDfG1AXaX837TBzmr7OgMrAwuyPfD0H6cYSbLft1wz/H
 FbaepeAHMQvuWuCOy4pNeFiYTTgvKzB6BfXltMnwYoX48q74rP0QbMy73mjA0hNGRJDc
 nwpw==
X-Gm-Message-State: ACgBeo29Ng0Jv8Vgscjg5xkAeg/pnEH9cEyTw0G+sXvyo39n8lbORZZY
 SXYSQbiWknXnh6I+NbDQNCWUMRTJzWkDmJIDFU5gD0OB0mI0xtx0E/PV5Y5TNlVX9p+k97WynPY
 l8tpqrU5Dnc/P3Mgs/70Ja1EmLvjxJlg=
X-Received: by 2002:a67:6283:0:b0:398:8bb1:6ea4 with SMTP id
 w125-20020a676283000000b003988bb16ea4mr2316764vsb.38.1663048629433; 
 Mon, 12 Sep 2022 22:57:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4fzlYkLj/fpJuyvTJoUXjRLo49oMyYpQRmf0go1bJwx+qNOA5fxH9CX/5WGobBgX4xYPr6Zj43FLcVCMNq1tE=
X-Received: by 2002:a67:6283:0:b0:398:8bb1:6ea4 with SMTP id
 w125-20020a676283000000b003988bb16ea4mr2316757vsb.38.1663048629233; Mon, 12
 Sep 2022 22:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662916759.git.kangjie.xu@linux.alibaba.com>
 <776e17f969c81d5d0ca3648a39ea8806261eda50.1662916759.git.kangjie.xu@linux.alibaba.com>
In-Reply-To: <776e17f969c81d5d0ca3648a39ea8806261eda50.1662916759.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 13 Sep 2022 13:56:58 +0800
Message-ID: <CACGkMEtQ0F48uWg=EfUKa7zJAufYTaTZ_ZPEKgFFRne2kbmsuw@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] virtio: core: vq reset feature negotation support
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 wangyanan55@huawei.com, Heng Qi <hengqi@linux.alibaba.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 12, 2022 at 1:22 AM Kangjie Xu <kangjie.xu@linux.alibaba.com> wrote:
>
> A a new command line parameter "queue_reset" is added.
>
> Meanwhile, the vq reset feature is disabled for pre-7.2 machines.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/core/machine.c          | 4 +++-
>  include/hw/virtio/virtio.h | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index aa520e74a8..907fa78ff0 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -40,7 +40,9 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "qom/object_interfaces.h"
>
> -GlobalProperty hw_compat_7_1[] = {};
> +GlobalProperty hw_compat_7_1[] = {
> +    { "virtio-device", "queue_reset", "false" },
> +};
>  const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>
>  GlobalProperty hw_compat_7_0[] = {
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 085997d8f3..ed3ecbef80 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -295,7 +295,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
>      DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
>                        VIRTIO_F_IOMMU_PLATFORM, false), \
>      DEFINE_PROP_BIT64("packed", _state, _field, \
> -                      VIRTIO_F_RING_PACKED, false)
> +                      VIRTIO_F_RING_PACKED, false), \
> +    DEFINE_PROP_BIT64("queue_reset", _state, _field, \
> +                      VIRTIO_F_RING_RESET, true)
>
>  hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
>  bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);
> --
> 2.32.0
>


