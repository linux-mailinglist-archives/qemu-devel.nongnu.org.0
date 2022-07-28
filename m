Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA455838D1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:34:44 +0200 (CEST)
Received: from localhost ([::1]:48856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGx6a-0001FH-0J
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwmi-0006p2-RC
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:14:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwmf-0000yN-9Z
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658988848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puoNETuLigtCVQqfxN6E2JbBy6M1ET5AnTHaj1C/u3E=;
 b=dfH272gKRlWdksL2Zx85G9n5Nmq3xI7T/39q1akE3C8GZ+x0rakSYY1SFvk+luB6OD2eBr
 Gq/KABb78WYhhxay+cmCRZgJIrUwekPdUYQZD+/3LvBN3aVoJzt2PodYnRkqjhwbJSmcgb
 Nbn3tPm9+IOMkLCOYPiIiIqp8edMBRQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-Q__2aOYsM-qH13Plr9xACg-1; Thu, 28 Jul 2022 02:14:06 -0400
X-MC-Unique: Q__2aOYsM-qH13Plr9xACg-1
Received: by mail-pj1-f72.google.com with SMTP id
 k7-20020a17090a62c700b001ef9c16ba10so2319157pjs.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=puoNETuLigtCVQqfxN6E2JbBy6M1ET5AnTHaj1C/u3E=;
 b=V69TaEpvlikcy/+RFdTw+r6AvkQJrPD0tGu7OlaMzwbK1XbVGTbq8LuaAGgZVHC3tH
 xpmVAFGG1OQLHMLrZXCChP7TBtk5DPDBdIiydvll8OXvHQ0jJcJD8MwY/G1uR1Yx/InR
 6BE/aBgIGpZpE2EtGIbfYMbCk3bHPJ96vNONv/1YOPbhX3jPW+79Vn4pH0WEcT6rChNc
 Uy+d0G6T+X+7rGIWgkNsZAZJIq3a98Dwtl8CuKDCgmKF5es8tun97JV+DLmWByoi/cGY
 WSS2ELRs2MDJm7c8CfaF3Gul5Q81LpCJl1LmQA2b3RHgRw4SKnFqzq0n2g19ALiUAB4O
 PvAQ==
X-Gm-Message-State: AJIora/w+XJZp9CZ6yaFda3jJOINBYeAT2tahaFch/bBVIkjNA/6B06D
 J8ha86x+i9pG3SUVaO1/MbmjfenKzn23Pp9zijOtvLXRfJ6wOflHwnUbzQbZonAsglaL3xDvPId
 9ugwg71EWY3UDMFw=
X-Received: by 2002:a63:d94a:0:b0:412:6986:326e with SMTP id
 e10-20020a63d94a000000b004126986326emr22267683pgj.56.1658988845194; 
 Wed, 27 Jul 2022 23:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1swxdeS7i07b64zG620dSjOq1/TomztD8Era8eKmC52AICooGP0mJ1V2FZg3qxetbrcW+LIJA==
X-Received: by 2002:a63:d94a:0:b0:412:6986:326e with SMTP id
 e10-20020a63d94a000000b004126986326emr22267668pgj.56.1658988844829; 
 Wed, 27 Jul 2022 23:14:04 -0700 (PDT)
Received: from [10.72.12.154] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 65-20020a621544000000b00528d880a32fsm15175450pfv.78.2022.07.27.23.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 23:14:04 -0700 (PDT)
Message-ID: <9a3214bc-7d18-94a6-aa46-756ac7ad48d2@redhat.com>
Date: Thu, 28 Jul 2022 14:13:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 05/21] block/vhost-user-blk-server: don't expose
 VHOST_USER_F_PROTOCOL_FEATURES
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, Coiby Xu <Coiby.Xu@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
 <20220726192150.2435175-6-alex.bennee@linaro.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220726192150.2435175-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/7/27 03:21, Alex Bennée 写道:
> This bit is unused in actual VirtIO feature negotiation and should
> only appear in the vhost-user messages between master and slave.


I might be wrong, but this is actually used between master and slave not 
the device and driver?

Thanks


>
> [AJB: experiment, this doesn't break the tests but I'm not super
> confident of the range of tests]
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   block/export/vhost-user-blk-server.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
> index 3409d9e02e..d31436006d 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -125,8 +125,7 @@ static uint64_t vu_blk_get_features(VuDev *dev)
>                  1ull << VIRTIO_BLK_F_MQ |
>                  1ull << VIRTIO_F_VERSION_1 |
>                  1ull << VIRTIO_RING_F_INDIRECT_DESC |
> -               1ull << VIRTIO_RING_F_EVENT_IDX |
> -               1ull << VHOST_USER_F_PROTOCOL_FEATURES;
> +               1ull << VIRTIO_RING_F_EVENT_IDX ;
>   
>       if (!vexp->handler.writable) {
>           features |= 1ull << VIRTIO_BLK_F_RO;


