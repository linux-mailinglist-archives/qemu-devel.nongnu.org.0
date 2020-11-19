Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11432B943D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:14:14 +0100 (CET)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfkhR-0000wI-D0
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kfkgJ-0000UD-80; Thu, 19 Nov 2020 09:13:03 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:46108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kfkgG-00015X-6L; Thu, 19 Nov 2020 09:13:02 -0500
Received: by mail-io1-xd43.google.com with SMTP id r1so6183952iob.13;
 Thu, 19 Nov 2020 06:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A6vEfUEhdxl+0UI83REm74rdcBdx9eu+L5TRh7d5k8o=;
 b=rjiFEuVxqyukpzNw2gc5SG6u0TCNLcJCrGAyFLbhsP8Rv/nC2upYEbocvV0AyGaycC
 5+jjnu7hV72b2h8uKZCvW030i3whkURt20sP3XnP+GZPwk8hkh1SZdlrFYaf8x3E4089
 EWASYZiwGtAaarIh7Pkt/PzuXPWLgSNI54LFP++MCrK2s1CoVZ29B+NL0uJ797Akcb4j
 U2Vvq3GCSaHG7pzA3E8DyaaqZ6ABRAJMPjPRcQ910BAUIychRx4noZTDl9i5aps4L1oz
 G/XpGWFEtE8cGk8ojhNxLnBbfSDitGqHqGgCVL8I9XQIZEH/PvffS9Xkso5wxWpVGM1m
 mPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A6vEfUEhdxl+0UI83REm74rdcBdx9eu+L5TRh7d5k8o=;
 b=ZBvmLMujz0feV8Z80KvkrlkgrQGXVJpp8H33iIuhq5OAohh3isWXHge2zvBdGiLACz
 TaO1ZqEBeEOKrwyI/YfUbjaH1FRjznn3qR/E7WFPPP8pc5ZUxW/m0pSJVyIGdEYWeDjk
 Duq8+KZPnrUMq1Jqx1ZzNron9sOWQi9iOhRLTWOemNvgOV+EzyHoXMfXvG9c0wsn08Q/
 OQ64/Ngw2lMUsNmyhqLwNoPhfHBgPZnfK32EFjUpvjnVmfftS47XJxw1dqAclmJCglqi
 MAAeTixSiX43NdAzInVwQsMsXpJFtlWJ0/NrbJ/WyAPBRL3NN70Tk3gRIdzxjIntwW8k
 s1fQ==
X-Gm-Message-State: AOAM530TEcWlJrQZtZfeHK5N3gI4jYr/rVRSelZtBoB3KvOkEaTFUDxL
 q094F8snB1/RxcokosxSYjnDJ7w7Efg37ZpHosE=
X-Google-Smtp-Source: ABdhPJyQe2T+9UmDevo1348FNGImPfclFlDsWRF/dhGDnLlkDMoasvHx4QhcQ91bC70ylTxDcz41jatNuU0XvIHhJJ8=
X-Received: by 2002:a5d:8592:: with SMTP id f18mr11577347ioj.67.1605795177763; 
 Thu, 19 Nov 2020 06:12:57 -0800 (PST)
MIME-Version: 1.0
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-3-ganqixin@huawei.com>
In-Reply-To: <20201115184903.1292715-3-ganqixin@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 19 Nov 2020 15:12:46 +0100
Message-ID: <CAM9Jb+hf=mcuN_fYYxMS4s-ha2A8Hkqpnjz=-oTtk7D9bcGVDQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] virtio-pmem: put it into the 'storage' category
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Qemu Developers <qemu-devel@nongnu.org>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The category of the virtio-pmem device is not set, put it into the 'storage'
> category.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/virtio/virtio-pmem.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index ddb0125901..98b3139cd0 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -175,6 +175,7 @@ static void virtio_pmem_class_init(ObjectClass *klass, void *data)
>
>      vpc->fill_device_info = virtio_pmem_fill_device_info;
>      vpc->get_memory_region = virtio_pmem_get_memory_region;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>
>  static TypeInfo virtio_pmem_info = {

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

