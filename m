Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8AE4C63F2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 08:46:59 +0100 (CET)
Received: from localhost ([::1]:56620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOakE-0006cG-BL
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 02:46:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOac5-0002pQ-Ug
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:38:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOac2-0004fo-H6
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646033909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Wvjc6bhiBV/L81IMZEHXA+XZrxqHRvtBEx7es2Kbyc=;
 b=Rn9GtBcFISlL8AlYLOwwuxJN5XJqq9lXSl5MALTyf7kMcfOFz4jtZ8a2cy5MOUoCp0sjgL
 9Y8terrC9nDC16Mk93yZIcmyHIjgp8AwMFIBtqRmASoj/8MIavEzDqzYZXkfTAvSrsbVSF
 sN6/RQavrcG826Wz/lqJbfz97yk7EYo=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-HJGHjqOCO0ecSvUtF7UALw-1; Mon, 28 Feb 2022 02:38:28 -0500
X-MC-Unique: HJGHjqOCO0ecSvUtF7UALw-1
Received: by mail-pg1-f198.google.com with SMTP id
 bh9-20020a056a02020900b0036c0d29eb3eso6141738pgb.9
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 23:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0Wvjc6bhiBV/L81IMZEHXA+XZrxqHRvtBEx7es2Kbyc=;
 b=JGoEt5QJiR2sz3lyHZ8lDc6TxvYlAt25pMKGgjyG2nkq4AyACsp+GJbLuOxua89DsT
 VhGBWuZjDQJM/Tv6i6z9M0Jq/EHSVPW+Mh9GaidkPL/ozwjw6w/DnDKbBO9NKetP4Wbo
 nVrfhFFbz4J7A+O5TC/2gXaXr+LTsS9qHk9e7VtTwoQwud+HjBcPsEo60PqhdvFHG6Rj
 CV+BidX0xiFkWw3KG0s1F5TZZpgpQniTrCf0K7v4Fg8WdtlBZKBTplM+is6bO9DtEOqT
 Bbj0pzC+cVKDcdefIg+8is4gTB+Vp3ZM0Smtdhz6Wp1H7sTX+AJkGxgvpkDpIjFe/qyj
 azbA==
X-Gm-Message-State: AOAM531NRyBwc6DvXhtjX/OzDBrPbrwXo++Dgs3qZvlG7IbpyZ6v0PEA
 fUm+qopC7aYRH0JbVn5WPfAq1eAWSvnB90dyxmtlc/hZP9plR6z/kWEgphNUjqFndpGlAO75dp+
 6R3MOvkZ7Mu5vQNM=
X-Received: by 2002:a17:902:82c5:b0:151:476b:c581 with SMTP id
 u5-20020a17090282c500b00151476bc581mr10390675plz.158.1646033906842; 
 Sun, 27 Feb 2022 23:38:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP9+aMD7qkw3m78bo1fiGWJvGsGa8g0OtxpeXajuBxQA1ADkbmlTIFUUJcGIaq2AozQF7/4g==
X-Received: by 2002:a17:902:82c5:b0:151:476b:c581 with SMTP id
 u5-20020a17090282c500b00151476bc581mr10390639plz.158.1646033906603; 
 Sun, 27 Feb 2022 23:38:26 -0800 (PST)
Received: from [10.72.13.215] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a63594d000000b003639cf2f9c7sm9487274pgm.71.2022.02.27.23.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 23:38:26 -0800 (PST)
Message-ID: <d0a5454b-b01e-50a6-3a2d-e5223768a163@redhat.com>
Date: Mon, 28 Feb 2022 15:38:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 11/14] vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220227134111.3254066-12-eperezma@redhat.com>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/27 下午9:41, Eugenio Pérez 写道:
> This is needed to achieve migration, so the destination can restore its
> index.


I suggest to duplicate the comment below here.

Thanks


> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 56f9f125cd..accc4024c2 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1180,8 +1180,25 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
>   static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>                                          struct vhost_vring_state *ring)
>   {
> +    struct vhost_vdpa *v = dev->opaque;
>       int ret;
>   
> +    if (v->shadow_vqs_enabled) {
> +        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
> +                                                      ring->index);
> +
> +        /*
> +         * Setting base as last used idx, so destination will see as available
> +         * all the entries that the device did not use, including the in-flight
> +         * processing ones.
> +         *
> +         * TODO: This is ok for networking, but other kinds of devices might
> +         * have problems with these retransmissions.
> +         */
> +        ring->num = svq->last_used_idx;
> +        return 0;
> +    }
> +
>       ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
>       trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
>       return ret;


