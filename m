Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21295004D8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 05:52:50 +0200 (CEST)
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqXK-0004Gf-3X
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 23:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqUi-0002d7-8q
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:50:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqUb-0004mb-D9
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649908200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5p1xXhZxDbAefvN/U2PMYKaXopJXdW8cB2JUZ/mLlUE=;
 b=N5HjEZAIRovq/Sp+mJpf4Ae+IutGgbVYO/NjkezVoCDbC9/Ea8O6A7EPxyU/xHPZ7ODI+y
 Qc8UheQidHYHAFSIWSeLI95myFuNt2MtLRgezMFeN4mczmhac5eKQhU+3fObr0H329Fl5Z
 FNsnaMOJbj3SVw/6GzbJ1k5d/O9zyWI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-8ewkzYeANP2MXP-ynDPgOQ-1; Wed, 13 Apr 2022 23:49:59 -0400
X-MC-Unique: 8ewkzYeANP2MXP-ynDPgOQ-1
Received: by mail-pl1-f199.google.com with SMTP id
 s5-20020a170902b18500b00155d6fbf4d4so2092711plr.18
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 20:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5p1xXhZxDbAefvN/U2PMYKaXopJXdW8cB2JUZ/mLlUE=;
 b=cDLVv1TWktx4wCJWAgK0RQGXsWYuU7b/JoKAY/QTtvPREKFXF+O/CJXS0Qr8fagucp
 zcDaXTRhh0j7AbI1uhPHu9iR1fTBx0+oBzaQvB2nm33dTEzjcJZJirdpYN3FzeLqSewn
 guwbkz2GseRMUbE0cUF5KHw6AFN//A55N77Y15KbDoL4Rd5/nvS8MDou77UOI11Sk1Vg
 Yt8Edg48ou+s/WNIRa+fi2MpkFt8bdAHaEiuMvw+/hk+RiNqTAf3OdAvMc1QYK6HqYIz
 1ygK/n9MYLxbsGCp8noAsfQYYQiYeIBJjLoppIJaU7xUMUHDfIiRmp40XqV08Wn5eQjk
 xOcw==
X-Gm-Message-State: AOAM532W2N91ZWRx2RcB3Y3uYSUGOTafLDw6mbzTfY0CU7rz6NCFpYJS
 NTsVhMgcJd6tq5FFVjAuOAOGlGlGX7ZRTVsgZniy7/Q80m+Te1HP/DtCx6ncz+QndK+Q0fl582A
 yf18rC8iRZTm0v54=
X-Received: by 2002:a17:90a:3484:b0:1cb:59a0:f30b with SMTP id
 p4-20020a17090a348400b001cb59a0f30bmr1555405pjb.92.1649908198844; 
 Wed, 13 Apr 2022 20:49:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWM7ljwTkec7/dj/bDNvltATWR8HQj2jWk8BnxH9/sAQor5eS2Z2h00+11HLFdsAKrFquz3A==
X-Received: by 2002:a17:90a:3484:b0:1cb:59a0:f30b with SMTP id
 p4-20020a17090a348400b001cb59a0f30bmr1555380pjb.92.1649908198539; 
 Wed, 13 Apr 2022 20:49:58 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a635719000000b0039da6cdf82dsm533680pgb.83.2022.04.13.20.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 20:49:57 -0700 (PDT)
Message-ID: <50ca9e55-4a7c-3fc5-6ab6-bd090eba12c9@redhat.com>
Date: Thu, 14 Apr 2022 11:49:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v7 02/25] vdpa: Add missing tracing to batch mapping
 functions
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220413163206.1958254-3-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> These functions were not traced properly.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>


>   hw/virtio/vhost-vdpa.c | 2 ++
>   hw/virtio/trace-events | 2 ++
>   2 files changed, 4 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 8adf7c0b92..9e5fe15d03 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -129,6 +129,7 @@ static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
>           .iotlb.type = VHOST_IOTLB_BATCH_BEGIN,
>       };
>   
> +    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.type);
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>           error_report("failed to write, fd=%d, errno=%d (%s)",
>                        fd, errno, strerror(errno));
> @@ -163,6 +164,7 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
>       msg.type = v->msg_type;
>       msg.iotlb.type = VHOST_IOTLB_BATCH_END;
>   
> +    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
>       if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
>           error_report("failed to write, fd=%d, errno=%d (%s)",
>                        fd, errno, strerror(errno));
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index a5102eac9e..333348d9d5 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -25,6 +25,8 @@ vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"
>   # vhost-vdpa.c
>   vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
>   vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
> +vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
> +vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
>   vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" vaddr: %p read-only: %d"
>   vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t llend) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
>   vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8


