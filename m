Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E41559D172
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 08:48:21 +0200 (CEST)
Received: from localhost ([::1]:59482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQNi0-0002P4-Kq
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 02:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNMG-0007CZ-Qf
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:25:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNME-0002pP-PY
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661235949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7R3rjwXZqcaivTOjCc6XxqMB/yt8cv6OyM3FkziY/Y=;
 b=X+cbbgONcTL7NwL9Nwkpwbyi6QJiAskeZrxXBBOsc1xdmFDZDJdtRq+T3JZsKhQ4pYyV1e
 wqE6B3rsHzBtiuNJdkyFPmFVxbz8A1u7cLc91gNU1fkwhqHmNPjKw/SwvBfK7mwdjKeOc6
 iHWdSlzwaTJrJ12VcrrjQ9XeJ+8XYi8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-oB2tbReINQuLTLnBEA5Owg-1; Tue, 23 Aug 2022 02:25:47 -0400
X-MC-Unique: oB2tbReINQuLTLnBEA5Owg-1
Received: by mail-pl1-f199.google.com with SMTP id
 u3-20020a170902e5c300b00172ba9301ceso7865971plf.10
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 23:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=/7R3rjwXZqcaivTOjCc6XxqMB/yt8cv6OyM3FkziY/Y=;
 b=ytxAtZW9h83gfHqjDWAYx5TemhOzISd9+h9YxC3bhHN09EdxS2WI42gaQqgDoV9nUC
 dSMidj3U5oO2kbKJf6Yi1h3nBXqUrnCv4T3I7KO5bD1nq0OEWIOADjn3+lOMwqXFl4/K
 QUKHlqWJOP8OEVjemyhmB/b0JeCPmstVZ2DEJNAqHNnlTloFy99SdGswC1P/G5DPetRz
 qF65M3sMaMBSOiV66IhSeRzEU82yT4HnhvQat2ELlvcMTxHNCtMHG5Wo6rs2v/2Ix16a
 ZJiy9ZQlm4uIG2L95EPjZb7EHMns6jy0W1BCie6sBm1MM6TUDEQYVKpiszF4s3M1aAPN
 dckg==
X-Gm-Message-State: ACgBeo3ak3cSw6zaqHO7Zbb5cYd5r1Latt1kfD6l2PtCmJg8jbegKNEx
 NOUUMh0Z3Z2S7QTc67m0RUVo6DeXmyUT7I2GAasqrAD8aMSozeclj0EWGI5KCCEYJq08kc+EM2U
 i4RjqL/nfxA3oL5s=
X-Received: by 2002:a63:ff4d:0:b0:42a:20e0:1704 with SMTP id
 s13-20020a63ff4d000000b0042a20e01704mr17371995pgk.520.1661235946235; 
 Mon, 22 Aug 2022 23:25:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ab+ahzvN7xzkjvqNyMrMGqdCtP4hil9ZBEdf5B1oY1TObj3EWju/EKt8aJjlv+oOdOhNaqg==
X-Received: by 2002:a63:ff4d:0:b0:42a:20e0:1704 with SMTP id
 s13-20020a63ff4d000000b0042a20e01704mr17371964pgk.520.1661235945519; 
 Mon, 22 Aug 2022 23:25:45 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a634406000000b0042a6dde1d66sm5174819pga.43.2022.08.22.23.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 23:25:44 -0700 (PDT)
Message-ID: <709a894f-d333-d13e-a712-dff0a77a85ab@redhat.com>
Date: Tue, 23 Aug 2022 14:25:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 4/7] vdpa: Remove SVQ vring from iova_tree at shutdown
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220819165357.3591965-1-eperezma@redhat.com>
 <20220819165357.3591965-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220819165357.3591965-5-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/8/20 00:53, Eugenio Pérez 写道:
> Although the device will be reset before usage, the right thing to do is
> to clean it.
>
> Reported-by: Lei Yang <leiyang@redhat.com>
> Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7e28d2f674..943799c17c 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -898,7 +898,12 @@ static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
>   
>       size = ROUND_UP(result->size, qemu_real_host_page_size());
>       r = vhost_vdpa_dma_unmap(v, result->iova, size);
> -    return r == 0;
> +    if (unlikely(r < 0)) {
> +        return false;


vhost-vdpa_svq_map_ring() will call error_report() here, should we do 
the same?

     if (unlikely(r != 0)) {
         error_setg_errno(errp, -r, "Cannot map region to device");

(Btw the error is not very informative, we should dump the map it self 
at least?)

Thanks


> +    }
> +
> +    vhost_iova_tree_remove(v->iova_tree, result);
> +    return 0;
>   }
>   
>   static bool vhost_vdpa_svq_unmap_rings(struct vhost_dev *dev,


