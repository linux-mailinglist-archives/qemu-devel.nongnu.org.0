Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7F611DB7
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 00:49:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooY9r-0007Tw-UL; Fri, 28 Oct 2022 18:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooY9h-0007TW-DQ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 18:48:55 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooY9f-0001Cp-JP
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 18:48:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so4751994wmb.0
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 15:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KAdEJjo5XKzAudzIgm89dcZB/VfPdiiDziqYVs+iATI=;
 b=qTTHMqeMkNd8/FTItPxyMZAhxrEzTheJAwXfnq2AUNFpZLNUZBmz70wYneEbkhRkIx
 Tpqwu1MdXTnDucrIsrzg27uy2PnxrQ9WnqdN6tfEhS2JlkeBnXtdG9B0mI6dr2Xnyy7P
 YvBGzglWiCcvc/UazUeV1groA4gjivrdRhArgAP6dfYs1SayPG6Fa4PTtUQ/78XLpK1L
 JwxIKtjmAwLV18FGhiIOuUT1yTeHcZlZbwOLlTGh7AlHzNk50+IdMaMakFREVAXtspF1
 unGJw5BDu4Z6b6uBAujBNzekg6pWUatgD3zytjAczHQ3AeTQLP2lVLf0slC3Uss7YgpP
 bAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KAdEJjo5XKzAudzIgm89dcZB/VfPdiiDziqYVs+iATI=;
 b=PcrfSvbY8n/+2M7bqFcac9h1KAiXvaninFJ9k7uOiJYH6NPi8xekdAs5eo4fCFBxBA
 FA5jz9i3d80wBhQo0GfEgQfPFt9xyrwlnwyoIecS+4mlvFmMSnhx5RNTbyMx8b2gZ+bw
 Mzz2p8Sm//MGY23fSzPSQpi9zHGQMFE9UAxUv22oqGEmAmn9WnfcdATidvzFLRvW0Jcx
 c5fimq9NOOf1sWzzflmaFXn5O03HGO/oc9JW2dyrYSynqPiN0KVfYWofw4wbd/yTfsKP
 reusPnjd6Y0ZU/kZdx5biGBnSr5+hLPtaEAGTneK39dZ6VLYfsUxSTXKbMsqkE8pCIXx
 J98A==
X-Gm-Message-State: ACrzQf3pXgqazg+ek2kkHcjJZOiO5bT2vyl8Z5P/YtW+HK3WxeCp0j4S
 WyK6119T917pmUs5clbhuKDuHA==
X-Google-Smtp-Source: AMsMyM5QpgzSZ4PmCrOTyslPdI2wh55b6wdbN+++B90axGjUyzmcXVibdSvea/LPYcq9smRXNaN7qQ==
X-Received: by 2002:a05:600c:3789:b0:3c6:beed:fecf with SMTP id
 o9-20020a05600c378900b003c6beedfecfmr835756wmr.174.1666997325660; 
 Fri, 28 Oct 2022 15:48:45 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003a682354f63sm9930335wmp.11.2022.10.28.15.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:48:45 -0700 (PDT)
Message-ID: <6375bb66-91a5-d638-dd4f-2700ac3a26cc@linaro.org>
Date: Sat, 29 Oct 2022 00:48:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 2/4] vhost: convert byte order on SVQ used event write
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-3-eperezma@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221028160251.268607-3-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/22 18:02, Eugenio Pérez wrote:
> This causes errors on virtio modern devices on big endian hosts
> 
> Fixes: 01f8beacea2a ("vhost: toggle device callbacks using used event idx")
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 70766ea740..467099f5d9 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -382,7 +382,7 @@ static bool vhost_svq_enable_notification(VhostShadowVirtqueue *svq)
>   {
>       if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
>           uint16_t *used_event = &svq->vring.avail->ring[svq->vring.num];
> -        *used_event = svq->shadow_used_idx;
> +        *used_event = cpu_to_le16(svq->shadow_used_idx);

This looks correct, but what about:

            virtio_stw_p(svq->vdev, used_event, svq->shadow_used_idx);

>       } else {
>           svq->vring.avail->flags &= ~cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
>       }


