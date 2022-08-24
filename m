Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A86259F25D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 06:08:59 +0200 (CEST)
Received: from localhost ([::1]:46722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQhhK-0005cP-HC
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 00:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQheZ-00010S-L9
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:06:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQheV-0000jD-Mu
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661313958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b6N9p6bjDXFqid+F7gik1XTdpzuXAcKwW+cO6GzZ9b8=;
 b=OU6xJiDnvhmdfu9nzwAmJWhvNxhQ0VKl2Bh1N13rVHOchewa+t9a3PhCjclccl7h5keTvC
 NoSywM46LiCmRMHRLzU3dRx9SaNKvsNmL9wuSHg6q2iy+Fk4G5qph+D17FsAO70/m35eOy
 aXQcYo9udqL4pM9GAPuwTLwMc1vQNUY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-304-lanLF_BwNR6LQnhF2VpDAg-1; Wed, 24 Aug 2022 00:05:56 -0400
X-MC-Unique: lanLF_BwNR6LQnhF2VpDAg-1
Received: by mail-pj1-f71.google.com with SMTP id
 oo12-20020a17090b1c8c00b001faa0b549caso272799pjb.0
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 21:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=b6N9p6bjDXFqid+F7gik1XTdpzuXAcKwW+cO6GzZ9b8=;
 b=vzEkRBMTMSRstdQfMfG7qIAc5vlB99napM7yhQ2RZ2fWfHplZRlswRJ7XdfeS6Y1pp
 TzrYQn5WMyoSbwsirH7IPx8n/0IoOSjVRTPjYZQFv3mPQ/QKyHqpbNgChGsIsg09tmP4
 8XgIacn85+fNF3KlfqKP8v3hPBWqbmCAXIXLhGxwqZ867eaJ/DO9Gc1CA3DevfaVCI2L
 SwcsrKaXGhBNcEU+yLl1mYQ1nVE/JVucmLWDGKTxjKMyNT6dd7/6Z2S+VBG93Yb2C4h0
 OJdHoe4GTbfORWDWzdllWNaXOJeFVDfyFe7xFk9TPs7cjZjIFo1WzN+D+RxHa4aAOEzT
 xdHQ==
X-Gm-Message-State: ACgBeo0fOZ3nK/7lk30gSv+u7cwaeObyvz5y8kYsYuZy4F8YUXlOrtCM
 b62pgwFCdtFdnX1KhhDdXX3NnVrhrCIrCLFWj0+DC4+1FRnhgaI53aK24OKIwEOvQmMbE4rgNYY
 yjUriDPt5ZYVYkuM=
X-Received: by 2002:a17:902:b207:b0:16f:2349:6116 with SMTP id
 t7-20020a170902b20700b0016f23496116mr26652338plr.80.1661313955578; 
 Tue, 23 Aug 2022 21:05:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7cmVYdbDTYFNJ+6OHEWY/Or6gavEHV9ZqJzEE8rTo93NhL4CymqlYb8P4j6UZ5D51oQR4lkg==
X-Received: by 2002:a17:902:b207:b0:16f:2349:6116 with SMTP id
 t7-20020a170902b20700b0016f23496116mr26652320plr.80.1661313955343; 
 Tue, 23 Aug 2022 21:05:55 -0700 (PDT)
Received: from [10.72.13.242] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 bx11-20020a17090af48b00b001fad1f975casm211283pjb.12.2022.08.23.21.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 21:05:54 -0700 (PDT)
Message-ID: <3b60bcab-f69b-7ec9-caa8-c5947a14b659@redhat.com>
Date: Wed, 24 Aug 2022 12:05:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 18/24] vhost-net: vhost-user: update
 vhost_net_virtqueue_stop()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <303811ffeac48647ac4c81eeec542292e8f67a0e.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <303811ffeac48647ac4c81eeec542292e8f67a0e.1660611460.git.kangjie.xu@linux.alibaba.com>
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> Update vhost_net_virtqueue_stop() for vhost-user scenario.


Let's explain why it is needed now or why it doesn't cause any issue or 
it's a bug fix or not.

Thanks


>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/net/vhost_net.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 2ab67e875e..c0d408f3b4 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -533,6 +533,10 @@ void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
>           assert(r >= 0);
>       }
>   
> +    if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> +        idx = idx - net->dev.vq_index;
> +    }
> +
>       vhost_dev_virtqueue_stop(&net->dev, vdev, idx);
>   }
>   


