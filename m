Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A3959D16F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 08:45:29 +0200 (CEST)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQNfD-0000A5-D4
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 02:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNYl-0003nB-6U
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQNYh-0004U4-L5
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661236723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lU+FvFzRj71zZHVb/OMe4PdKdHZzWdL6BBWiGtlsZoc=;
 b=Hs2T6DWaGQmXzYWiLk8Od1MUGcUZdh6bwOoeGoAEnzqGQzjd2LEehfItiowWAnjeuUcWWM
 O2ZjdvDXwBZgFC1M2ACAVIV5drQkU0vaLI2tKrfkRvIwHD6eghItWKVa5k7C96Mk499wn+
 ECoN74qsUvX5aB2lKEve+eOCd8iyydA=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-332-jVsr7rDnPsqe-eQEuZ03Nw-1; Tue, 23 Aug 2022 02:38:40 -0400
X-MC-Unique: jVsr7rDnPsqe-eQEuZ03Nw-1
Received: by mail-pl1-f200.google.com with SMTP id
 o12-20020a170902d4cc00b0016e81c62cc8so8601274plg.13
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 23:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=lU+FvFzRj71zZHVb/OMe4PdKdHZzWdL6BBWiGtlsZoc=;
 b=5L11J8Af42A3RwCcY4k7m+LE2WgE9dw7Ni9sExVAw1DbYvzPq8vg/foTvBME/cKU5Q
 DrY9TIrUK34bRR2GJJu8QapTIOY00KKtBgFnWye4gqlYDqfTmoLUwlEjVm8sD9KCNx6d
 GpP1A4vieZ7mJeeuDY/ZAOwK2uEGjAffNSQ4weQjmFpXf4rw+WRmmHiiq9XnxUQS7ROK
 /P1YuvQ7W1zqNziM6DwQItaXmBY9DYxsZaZPS5jmfIbrDlvku8wNZgBkitHfWh1zyh47
 elsj0gBQMDAcCaI77X8hCgiKU68Zo2vqK4REbQ10ohhNQENx/6pYDuRPrjBogujpMg/k
 nQuA==
X-Gm-Message-State: ACgBeo1pxB4550sai3lsqS7MFhqL0lwIrruU8Zrm56fSD+i5pcVrkehj
 qB6DfB7bwfJT4WiqN7XSGcwwSD2nM31zgmZd42wH6315TFfZMv9Ko6b63gPeb0MboZI2D6ztO9a
 cH//p1lc+Bt3OBbQ=
X-Received: by 2002:a17:90b:38cb:b0:1f5:2321:63cb with SMTP id
 nn11-20020a17090b38cb00b001f5232163cbmr1978139pjb.110.1661236719484; 
 Mon, 22 Aug 2022 23:38:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7VIT6PF2As/UHAlkkWPGxmPZuquihiCQ2uE7g2gn5TRiGjOMgEb4VYNVs9bLdcVKaZCluZUw==
X-Received: by 2002:a17:90b:38cb:b0:1f5:2321:63cb with SMTP id
 nn11-20020a17090b38cb00b001f5232163cbmr1978123pjb.110.1661236719206; 
 Mon, 22 Aug 2022 23:38:39 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 n60-20020a17090a2cc200b001ef81574355sm11042282pjd.12.2022.08.22.23.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 23:38:38 -0700 (PDT)
Message-ID: <9505e7a3-b42b-ec94-7670-66bce3919394@redhat.com>
Date: Tue, 23 Aug 2022 14:38:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 6/7] vhost: Always store new kick fd on
 vhost_svq_set_svq_kick_fd
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220819165357.3591965-1-eperezma@redhat.com>
 <20220819165357.3591965-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220819165357.3591965-7-eperezma@redhat.com>
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
> We can unbind twice a file descriptor if we call twice
> vhost_svq_set_svq_kick_fd because of this. Since it comes from vhost and
> not from SVQ, that file descriptor could be a different thing that
> guest's vhost notifier.
>
> Likewise, it can happens the same if a guest start and stop the device
> multiple times.
>
> Reported-by: Lei Yang <leiyang@redhat.com>
> Fixes: dff4426fa6 ("vhost: Add Shadow VirtQueue kick forwarding capabilities")
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>


>   hw/virtio/vhost-shadow-virtqueue.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index e4956728dd..82a784d250 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -602,13 +602,13 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
>           event_notifier_set_handler(svq_kick, NULL);
>       }
>   
> +    event_notifier_init_fd(svq_kick, svq_kick_fd);
>       /*
>        * event_notifier_set_handler already checks for guest's notifications if
>        * they arrive at the new file descriptor in the switch, so there is no
>        * need to explicitly check for them.
>        */
>       if (poll_start) {
> -        event_notifier_init_fd(svq_kick, svq_kick_fd);
>           event_notifier_set(svq_kick);
>           event_notifier_set_handler(svq_kick, vhost_handle_guest_kick_notifier);
>       }
> @@ -655,7 +655,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
>    */
>   void vhost_svq_stop(VhostShadowVirtqueue *svq)
>   {
> -    event_notifier_set_handler(&svq->svq_kick, NULL);
> +    vhost_svq_set_svq_kick_fd(svq, VHOST_FILE_UNBIND);
>       g_autofree VirtQueueElement *next_avail_elem = NULL;
>   
>       if (!svq->vq) {


