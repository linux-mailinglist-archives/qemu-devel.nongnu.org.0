Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8275809B1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 04:55:37 +0200 (CEST)
Received: from localhost ([::1]:37004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGAjP-0001iV-Iw
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 22:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGAhA-0008Fb-8r
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 22:53:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGAh5-0002Gd-MT
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 22:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658803988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4178Felqsy2EZbsR9TcpG0OIhJBWPEWb36USZQFouDs=;
 b=Aipaoj0P3olJQVqP03KZwLKoH/Vp4YFqV6Dq8EMywTOCHJlpfZuGcHlLoQRbZ1j/Fp01rt
 wKfSC+jdq75b8FlF7D4qM6TIqh5Jo9x9oDea6ZI18muVsShrH6GfJc879HlLNZyubER8tA
 TWxyZGWObW6j8Hq8LjkQvhrayI3mRDc=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-5Ri4IJnLNLiLXK2QAGyUGg-1; Mon, 25 Jul 2022 22:53:06 -0400
X-MC-Unique: 5Ri4IJnLNLiLXK2QAGyUGg-1
Received: by mail-pg1-f199.google.com with SMTP id
 31-20020a63125f000000b00419a2da53bdso5772220pgs.8
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 19:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4178Felqsy2EZbsR9TcpG0OIhJBWPEWb36USZQFouDs=;
 b=ndJebKCRsVVEDPQ1adRNgA/qKrypZoaJ8FCR50NRx/2YZkJXNJDCM3fTzkIeZqMIG+
 38Y7+2uNFnyV5mEn5KJQmkzrOeQb03UYC1zGfMdbW9HV3LovtZRwMZTkhaYqgDdj1B1/
 YLKQI9kfNG4Ml/A/yYW7qihGk+C0y0OzeigeBWUJCqIztQhKCL3sn8IbyZfXcOzbHhpU
 FhfL4TLaX+Ml/mM5N3HwvXJ2238tDWMrlkNLQ3GcCZExiOm1ei44xOaune+4gUcaUe41
 zaaW0BQgI8Mm/HA8uM4pPLplwqlexvLGTqtvViap/TNUyjW1qA0QgHQtwc62Kxi5zvOH
 aRmQ==
X-Gm-Message-State: AJIora814CBn647LLMLFl84/l9qcyFRLpab3kH1IAwzBY5+HjgDg5QDV
 zHWEYL55GPF8bi5DibOSUCsF+5At2TAx+ItzVrYOiddnUjYiRw+wcL8MCksgMymj+w8PWDW9EGl
 w3kzWUMMn8pgGr2U=
X-Received: by 2002:a05:6a00:23c9:b0:52a:cedd:3992 with SMTP id
 g9-20020a056a0023c900b0052acedd3992mr15103815pfc.43.1658803985255; 
 Mon, 25 Jul 2022 19:53:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uMvn+ntuDGJfneq07EY9raRYDydYnbgN6HdSri2FZ6fZ6JiAv0ZlYqnmhAJBqBNBM9Z99eUA==
X-Received: by 2002:a05:6a00:23c9:b0:52a:cedd:3992 with SMTP id
 g9-20020a056a0023c900b0052acedd3992mr15103804pfc.43.1658803984963; 
 Mon, 25 Jul 2022 19:53:04 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170903230100b0016d738d5dbbsm3326664plh.97.2022.07.25.19.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 19:53:04 -0700 (PDT)
Message-ID: <9cbd4657-2c60-be8c-efce-7c2af47398a0@redhat.com>
Date: Tue, 26 Jul 2022 10:52:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v4 4/7] vdpa: add NetClientState->start() callback
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand
 <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cornelia Huck
 <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
References: <20220722111245.3403062-1-eperezma@redhat.com>
 <20220722111245.3403062-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220722111245.3403062-5-eperezma@redhat.com>
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


在 2022/7/22 19:12, Eugenio Pérez 写道:
> It allows per-net client operations right after device's successful
> start.
>
> Vhost-vdpa net will use it to add the CVQ buffers to restore the device
> status.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/net/net.h  | 2 ++
>   hw/net/vhost_net.c | 7 +++++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index 523136c7ac..ad9e80083a 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -44,6 +44,7 @@ typedef struct NICConf {
>   
>   typedef void (NetPoll)(NetClientState *, bool enable);
>   typedef bool (NetCanReceive)(NetClientState *);
> +typedef int (NetStart)(NetClientState *);
>   typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t);
>   typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *, int);
>   typedef void (NetCleanup) (NetClientState *);
> @@ -71,6 +72,7 @@ typedef struct NetClientInfo {
>       NetReceive *receive_raw;
>       NetReceiveIOV *receive_iov;
>       NetCanReceive *can_receive;
> +    NetStart *start;


I think we probably need a better name here. (start should go with 
DRIVER_OK or SET_VRING_ENABLE)

How about load or other (not a native speaker).

Thanks


>       NetCleanup *cleanup;
>       LinkStatusChanged *link_status_changed;
>       QueryRxFilter *query_rx_filter;
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index ccac5b7a64..ddd9ee0441 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -274,6 +274,13 @@ static int vhost_net_start_one(struct vhost_net *net,
>               }
>           }
>       }
> +
> +    if (net->nc->info->start) {
> +        r = net->nc->info->start(net->nc);
> +        if (r < 0) {
> +            goto fail;
> +        }
> +    }
>       return 0;
>   fail:
>       file.fd = -1;


