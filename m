Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA9456892
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 04:20:38 +0100 (CET)
Received: from localhost ([::1]:46890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnuS4-0008Re-Rp
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 22:20:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnuPR-00079D-Tq
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:17:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnuPP-0005pS-Ga
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637291870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHdOBUvvjefLCON9PekH/8ZTb8WWx7JYkh9OHln2Tcs=;
 b=c/EzkeDUPopYJXlHy+8R6tFO5oBxEDfIn8n5ru+HcULrbCfdzSHpiP/tYkV2mEd7r9DwWc
 tNYkV324Xdk2K5Oxr3Q7NZxNVZwWFU+lxDTVMWueipvmizwUbVkdCXVdC+KT4pn5A41/zi
 iABJ3YOUi5nyatY1pleTOxIGMyzInaU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-SHfXOi1lNvmix2xzvPomPQ-1; Thu, 18 Nov 2021 22:17:49 -0500
X-MC-Unique: SHfXOi1lNvmix2xzvPomPQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 e4-20020a630f04000000b002cc40fe16afso3568320pgl.23
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 19:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oHdOBUvvjefLCON9PekH/8ZTb8WWx7JYkh9OHln2Tcs=;
 b=l1tYydz3tqaTVLquN0nwP+oSp73XHXQyJ48x8+krxciAMT9lvPefejF+WD3AzmDccV
 ea6ZJo1LidXb+D1mzwnHhP2Vd4xAbPd9XQMe5t1fKKewSHPlkDi8NFJ1k6JMqU27dNWA
 VHrdFImt31WbuSlWSgG2YUewxO3QleBThUa6Suuepn857W2FyyDKdCXHaka6lB+bEKGc
 KNzpim8n6ja+Jw8i4yD5iUW0FZ/RvddxVeZzZkfzPji/WitUVo/+G2HCrQrNWG8Q5OT0
 NxxVt8ClGd8lGR8AY14+dE2esqUyTLYRaOe66WaZge8dLfoUpfQt1L7z58I8NxoaKxCA
 llJA==
X-Gm-Message-State: AOAM532qy0IcZszGqiEr0zXPk6F9i8myKjZoC5DVR7vWleg0ydfygaOG
 lHG/FmqVf85fyvDchBANIldNXEPGxQihSjZuIg9Gul7iq3yWVuZCLcoUBjfywL4XfDlHNXkqlJA
 +qcpHp/k2EWmv0FY=
X-Received: by 2002:a17:90b:3ecc:: with SMTP id
 rm12mr541851pjb.75.1637291867836; 
 Thu, 18 Nov 2021 19:17:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXqEdaIqMWn8RHl8AmFI5dL/hpBGLn8bGn54ENL50Soodq0JZFWo3xKVa+5yi4KuJyxO89Tg==
X-Received: by 2002:a17:90b:3ecc:: with SMTP id
 rm12mr541828pjb.75.1637291867543; 
 Thu, 18 Nov 2021 19:17:47 -0800 (PST)
Received: from [10.72.13.18] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x33sm976958pfh.133.2021.11.18.19.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 19:17:47 -0800 (PST)
Message-ID: <435c4c3f-9dfc-4a01-e398-72d9fe778a2d@redhat.com>
Date: Fri, 19 Nov 2021 11:17:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH] net/filter: Enable the vnet_hdr_support by default
To: Zhang Chen <chen.zhang@intel.com>
References: <20211110023915.3797141-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20211110023915.3797141-1-chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/11/10 上午10:39, Zhang Chen 写道:
> This patch make filters and colo-compare module support vnet_hdr by
> default. And also support -device non-virtio-net(like e1000.).
> But it can't avoid user manual configuration error between
> different filters when enable/disable virtio-net-pci.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---


Applied.

Thanks


>   net/colo-compare.c    | 2 +-
>   net/filter-mirror.c   | 4 ++--
>   net/filter-rewriter.c | 2 +-
>   qemu-options.hx       | 9 +++++----
>   4 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index b8876d7fd9..82d4d81710 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -1397,7 +1397,7 @@ static void colo_compare_init(Object *obj)
>                           get_max_queue_size,
>                           set_max_queue_size, NULL, NULL);
>   
> -    s->vnet_hdr = false;
> +    s->vnet_hdr = true;
>       object_property_add_bool(obj, "vnet_hdr_support", compare_get_vnet_hdr,
>                                compare_set_vnet_hdr);
>   }
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> index f20240cc9f..adb0c6d89a 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -406,14 +406,14 @@ static void filter_mirror_init(Object *obj)
>   {
>       MirrorState *s = FILTER_MIRROR(obj);
>   
> -    s->vnet_hdr = false;
> +    s->vnet_hdr = true;
>   }
>   
>   static void filter_redirector_init(Object *obj)
>   {
>       MirrorState *s = FILTER_REDIRECTOR(obj);
>   
> -    s->vnet_hdr = false;
> +    s->vnet_hdr = true;
>   }
>   
>   static void filter_mirror_fini(Object *obj)
> diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
> index bf05023dc3..5698cd39d1 100644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -407,7 +407,7 @@ static void filter_rewriter_init(Object *obj)
>   {
>       RewriterState *s = FILTER_REWRITER(obj);
>   
> -    s->vnet_hdr = false;
> +    s->vnet_hdr = true;
>       s->failover_mode = FAILOVER_MODE_OFF;
>   }
>   
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7749f59300..c40e385ede 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4967,13 +4967,13 @@ SRST
>       ``-object filter-mirror,id=id,netdev=netdevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
>           filter-mirror on netdev netdevid,mirror net packet to
>           chardevchardevid, if it has the vnet\_hdr\_support flag,
> -        filter-mirror will mirror packet with vnet\_hdr\_len.
> +        filter-mirror will mirror packet with vnet\_hdr\_len(default: on).
>   
>       ``-object filter-redirector,id=id,netdev=netdevid,indev=chardevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
>           filter-redirector on netdev netdevid,redirect filter's net
>           packet to chardev chardevid,and redirect indev's packet to
>           filter.if it has the vnet\_hdr\_support flag, filter-redirector
> -        will redirect packet with vnet\_hdr\_len. Create a
> +        will redirect packet with vnet\_hdr\_len(default: on). Create a
>           filter-redirector we need to differ outdev id from indev id, id
>           can not be the same. we can just use indev or outdev, but at
>           least one of indev or outdev need to be specified.
> @@ -4983,7 +4983,8 @@ SRST
>           packet to secondary from primary to keep secondary tcp
>           connection,and rewrite tcp packet to primary from secondary make
>           tcp packet can be handled by client.if it has the
> -        vnet\_hdr\_support flag, we can parse packet with vnet header.
> +        vnet\_hdr\_support flag, we can parse packet with vnet
> +        header(default: on).
>   
>           usage: colo secondary: -object
>           filter-redirector,id=f1,netdev=hn0,queue=tx,indev=red0 -object
> @@ -5004,7 +5005,7 @@ SRST
>           checkpoint and send primary packet to out\_dev. In order to
>           improve efficiency, we need to put the task of comparison in
>           another iothread. If it has the vnet\_hdr\_support flag,
> -        colo compare will send/recv packet with vnet\_hdr\_len.
> +        colo compare will send/recv packet with vnet\_hdr\_len(default: on).
>           The compare\_timeout=@var{ms} determines the maximum time of the
>           colo-compare hold the packet. The expired\_scan\_cycle=@var{ms}
>           is to set the period of scanning expired primary node network packets.


