Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295A94A34C9
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 08:12:46 +0100 (CET)
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE4OC-0008Gp-KI
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 02:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE3zZ-0004T3-6R
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 01:47:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE3zV-0001lk-3N
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 01:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643525232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOYyKgOH8RgV9ghW6d3htexHq30T842ik8y10Dn6PXU=;
 b=QAB+I2NqO0IVVCPZkwEfVTKR5ewIIRkiczaR1HAleKarZtj1h2/V1CFtg+urvN6Qk/rApJ
 s4h/JcgVXbYMfvUJp9VnBRfO/7RP3HiH1o/w4f58xf92o46e/J2zRbdta3kmb9TfP4FsNS
 b7wU6qvckNTZ7rAOy0xIe2wM2kQhkgM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-LU7M-6yBOxKuHFRcQizcWQ-1; Sun, 30 Jan 2022 01:47:10 -0500
X-MC-Unique: LU7M-6yBOxKuHFRcQizcWQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 o194-20020a62cdcb000000b004c9d2b4bfd8so5590626pfg.7
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 22:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jOYyKgOH8RgV9ghW6d3htexHq30T842ik8y10Dn6PXU=;
 b=FaQPJRt8iO7tmVugVIuan6ULhZ/1jXAcxymlgUXkPJkSDsI2jBL8jvkUWejP7RcaUp
 +W6XhqAJib/rWj1xMLIg/uWip8nDDg6TJfnuIDK4sMQf+tdWRXO/gHImbJqjVvSuAyOO
 SRWjX/XL/WtxNOyr8c9U8vIMzgfmBVQ1IWAyvaD/Wjcx+TM7iVwbjqy6Vmt5oRKeqzYx
 mvyrbUMYwnX3u68sqMfsSQ+sGGxGUDi1N4qeB25ECCp3giXg1cXbQtPgCx9ybzvrfBmp
 wOE2Sta+P8qkL0bGWMTuYbRYUWlaXx9iGCCEaS3UtYVizHZzNK+T+a5K6Kg1suUNIh6M
 XMNQ==
X-Gm-Message-State: AOAM531FnlsLJags7V5QO+GScFODNV2r7khXZQhjOTjaNMGaSoNE22j3
 bOOwO86AdgBc72xLXcpL/fRWjjqnP1tr/BRWnCAVcq8MnHz5Cxfqee10UaB9VfFbt62BcNcZHc7
 kFYDKqk4EyVryQg4=
X-Received: by 2002:a17:903:2310:: with SMTP id
 d16mr15915284plh.20.1643525229465; 
 Sat, 29 Jan 2022 22:47:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvkJnGJTlkesocFe2yOrHY63ccYBcB9uAQjGdHa8f4+hZV1VOE9H2vT7fPuwB9oTwWXZ0QlA==
X-Received: by 2002:a17:903:2310:: with SMTP id
 d16mr15915263plh.20.1643525229246; 
 Sat, 29 Jan 2022 22:47:09 -0800 (PST)
Received: from [10.72.12.243] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id g1sm7859070pfu.32.2022.01.29.22.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 22:47:08 -0800 (PST)
Message-ID: <62e877ca-51d7-da85-13c9-d469a85f33c9@redhat.com>
Date: Sun, 30 Jan 2022 14:46:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 18/31] vhost: Shadow virtqueue buffers forwarding
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-19-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-19-eperezma@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.098,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/22 上午4:27, Eugenio Pérez 写道:
> @@ -272,6 +590,28 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
>   void vhost_svq_stop(VhostShadowVirtqueue *svq)
>   {
>       event_notifier_set_handler(&svq->svq_kick, NULL);
> +    g_autofree VirtQueueElement *next_avail_elem = NULL;
> +
> +    if (!svq->vq) {
> +        return;
> +    }
> +
> +    /* Send all pending used descriptors to guest */
> +    vhost_svq_flush(svq, false);


Do we need to wait for all the pending descriptors to be completed here?

Thanks


> +
> +    for (unsigned i = 0; i < svq->vring.num; ++i) {
> +        g_autofree VirtQueueElement *elem = NULL;
> +        elem = g_steal_pointer(&svq->ring_id_maps[i]);
> +        if (elem) {
> +            virtqueue_detach_element(svq->vq, elem, elem->len);
> +        }
> +    }
> +
> +    next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
> +    if (next_avail_elem) {
> +        virtqueue_detach_element(svq->vq, next_avail_elem,
> +                                 next_avail_elem->len);
> +    }
>   }


