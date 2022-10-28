Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486A8611DB9
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 00:54:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooYDx-0000a6-A7; Fri, 28 Oct 2022 18:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooYDu-0000Zd-8J
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 18:53:11 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooYDq-0001qb-D4
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 18:53:09 -0400
Received: by mail-wm1-x333.google.com with SMTP id t1so322325wmi.4
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 15:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zSusyj+KT8uTWM25u/vF5bJAUtB3sMm4yxGjSInxXR0=;
 b=ARjNeQUXpCCO4glzyd9SCn2EgT4MLc3Y5avtSoZqNvsTbCY1eg1I4efchxhhenVsj3
 2nA8AblTfrKgXKkndiRGxib5qjM8rwwQ67LaCfTzyQE0wtL+CQXisFdmLVddh3UpecsA
 63RrMJU1qt0ptr+G70MKJg1J7ox/6kRWeAm5Lcj2CHZeJkTvOp8isRoZT9UzDxVypLPi
 1rJV5FgwxqXcX9LlZvezAz70+0Ye4G9kMGD3rSD5aMksNewyQbdMpwC6Th1Y5r/bdqw8
 tijsdsbESWVt3+1PigRbxGbuMjekFLGaN3ZZCvs9WrvRGhbvkbzHz5wjrMtP0LQmiDeg
 rcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zSusyj+KT8uTWM25u/vF5bJAUtB3sMm4yxGjSInxXR0=;
 b=iK7htBojbX76rWO0NhGH6iX5X5pzRAdNH+yr2C/AakK6nZui5au1vtQMe+VZkovBcv
 mquU7WTPjaW8ehTCQZajJI3d251R7+aqkR9eqeNVmNVWy/ddHLxAK0KwgqeksI4n7vUP
 NFvUQfdZYxuht3z0gHt26rtATXR4uOv4H4ebEc3XFC2a4IXOaL5FIAnJetzGTb/XofLd
 0kfi3r6YSRBCjALPrBltgMoi2tqwHrf3mlj1vdToDW6cu45fInp3izI6fwX2HpKl+rWH
 w1s6wKYh++PxO8ngv2qGVXYaZl+JsbU4SVaCLERwxSklr2bGFF8YAOnCaLmHBjzfjCEl
 6rHw==
X-Gm-Message-State: ACrzQf12dgSi8bCnqVwzluUAwUJDqll1m9hkcC8M+UD5mbwgh2FL+NxQ
 9r5IaZuaBLcI1NVmITNjI/QYeg==
X-Google-Smtp-Source: AMsMyM7gGqzi9KWGy6+bKfAV0xGyRPZBpTDbRVja6owaDs+I/uijSJxLOc40tqnesYjHZI+6uWEWtw==
X-Received: by 2002:a05:600c:3512:b0:3c8:2c4e:8680 with SMTP id
 h18-20020a05600c351200b003c82c4e8680mr11498239wmq.165.1666997582934; 
 Fri, 28 Oct 2022 15:53:02 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adff5c9000000b0022eafed36ebsm4662920wrp.73.2022.10.28.15.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:53:02 -0700 (PDT)
Message-ID: <a08bc5b7-8481-49f7-c4fb-a4c780783e5b@linaro.org>
Date: Sat, 29 Oct 2022 00:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 4/4] vhost: convert byte order on avail_event read
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-5-eperezma@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221028160251.268607-5-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 18a49e1ecb..3131903edd 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -231,7 +231,8 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
>           size_t num = svq->vring.num;
>           uint16_t *avail_event = (uint16_t *)&svq->vring.used->ring[num];
>   

   uint16_t avail_event = virtio_lduw_p(svq->vdev,
                                        &svq->vring.used->ring[num]);
   needs_kick = vring_need_event(avail_event,
                                 svq->shadow_avail_idx,
                                 svq->shadow_avail_idx - 1);

> -        needs_kick = vring_need_event(*avail_event, svq->shadow_avail_idx,
> +        needs_kick = vring_need_event(le16_to_cpu(*avail_event),
> +                                      svq->shadow_avail_idx,
>                                         svq->shadow_avail_idx - 1);
>       } else {
>           needs_kick = !(svq->vring.used->flags & VRING_USED_F_NO_NOTIFY);


