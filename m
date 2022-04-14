Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F385004DA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 05:53:32 +0200 (CEST)
Received: from localhost ([::1]:46188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqXz-0005mP-AP
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 23:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqVB-00032j-BX
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqV9-000578-FW
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649908232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnVYujXbSyenP7brRwRDN2RxiwBLji/2CpFXFMVA0kI=;
 b=RH6MtFCNikOPnn6ymU7g7ZJIzeshChR+/cib+VRio9qRWlh8ehkzPKCawV2Y+npwomybl0
 iIOLqU9d7+iV0Uge67Pe6+3ZDj06licPg2GbK6l0/zO7uBTA1sT/AUBrHcSx+diyUKxK5b
 Gp3Oc6EuWRAYjo4wtN8K77ShxBsvx1Y=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-wvyNVUCzPxqlWpGJA3k7tA-1; Wed, 13 Apr 2022 23:50:31 -0400
X-MC-Unique: wvyNVUCzPxqlWpGJA3k7tA-1
Received: by mail-pg1-f197.google.com with SMTP id
 w3-20020a639343000000b003821fb4a367so2102649pgm.21
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 20:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tnVYujXbSyenP7brRwRDN2RxiwBLji/2CpFXFMVA0kI=;
 b=Ji+rBTESQwu5GQfdLQdKfrJW9uz1A8LpD+X2TEWvv/jlQC2ejCwD81tML7OxbjhTP5
 JA56zjrXBahMax14OV4JAEJPDi3nymKJBUSzIU0vbMmdynFWDkv+KG9lwnNIjPacedvG
 BgQv8rcMhPwRfxwIdgYIrsodSVaCe4Iy4d4tjEzsX2NwJvjZJUMCtRPob+z1//pdEuMR
 exOcbBV22euXeHssjLNb5fO/ppcfsXZRfzM+OAKcvr67IQAMM5/VpsnBUy1xettt36Ho
 Q37eaDY0pia0mE+l6JDE1OnI3kzBMMU8C3d9CMDI5p7fOiicBXMXdY7O0C0/AG2qGqJi
 QLKA==
X-Gm-Message-State: AOAM532ri2ooFgeiEDSYFlOMRIgYPI7Anvk3meKtsAbjJ8e+B0HI3Ctj
 jsVxtYllK61DrevivA/5KlW3DvgQ28PDJZZPdj317Mw7j3SfmLgFka3jDkB9w4jniyenChcExS8
 dW9JbJqGhShc4pvg=
X-Received: by 2002:a65:41c3:0:b0:363:5711:e234 with SMTP id
 b3-20020a6541c3000000b003635711e234mr722060pgq.386.1649908230130; 
 Wed, 13 Apr 2022 20:50:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyorRk5uoz6P8mTzl5ZXLKWpO9vPjspfBmftISJDBgu4Tbvg/7M7lDwkTwtH1xnH7cVGQkkQA==
X-Received: by 2002:a65:41c3:0:b0:363:5711:e234 with SMTP id
 b3-20020a6541c3000000b003635711e234mr722047pgq.386.1649908229927; 
 Wed, 13 Apr 2022 20:50:29 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a17090a091700b001cb57fd5abdsm4504349pjn.40.2022.04.13.20.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 20:50:29 -0700 (PDT)
Message-ID: <85433da7-e6f3-be21-dfdd-7180972035e6@redhat.com>
Date: Thu, 14 Apr 2022 11:50:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v7 03/25] vdpa: Fix bad index calculus at
 vhost_vdpa_get_vring_base
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220413163206.1958254-4-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/14 00:31, Eugenio Pérez 写道:
> Fixes: 6d0b222666 ("vdpa: Adapt vhost_vdpa_get_vring_base to SVQ")
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/vhost-vdpa.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 9e5fe15d03..1f229ff4cb 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1172,11 +1172,11 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>                                          struct vhost_vring_state *ring)
>   {
>       struct vhost_vdpa *v = dev->opaque;
> +    int vdpa_idx = ring->index - dev->vq_index;
>       int ret;
>   
>       if (v->shadow_vqs_enabled) {
> -        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
> -                                                      ring->index);
> +        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
>   
>           /*
>            * Setting base as last used idx, so destination will see as available


