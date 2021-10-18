Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544AF4310E2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 08:51:52 +0200 (CEST)
Received: from localhost ([::1]:56904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcMUw-0004de-Pq
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 02:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mcMU2-0003wz-6J
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:50:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mcMTy-000367-LY
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 02:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634539849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5k09rGkA4hr7j1+iaqig5HCJ4r3uypQOyPYH9dyOuuI=;
 b=jHyCSfEkrXgQChu6Syy9V5UgoIJ1w1o3NMlfjhRLWIooMjpUY+6UOn+uhqFTO2tkifTqOI
 KHG6L+lfYnlC1f3w92HVi3wCXJgQ6wekR1dBLezOpxTvSAsznST/NUaZQZfnOAQ6BPqTsD
 qdOWV6YhF/cTAOB0CtR3P01z8PzVS8w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-0U_cIawgPvq8YxKs01u5iw-1; Mon, 18 Oct 2021 02:50:46 -0400
X-MC-Unique: 0U_cIawgPvq8YxKs01u5iw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso1432713wrj.20
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 23:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5k09rGkA4hr7j1+iaqig5HCJ4r3uypQOyPYH9dyOuuI=;
 b=MCVkl8SqQsENOV2XY8Hyq6BYgTv4DraL1biLk+wkFCtihBg8hNFteprBnFEbZB1EcU
 os9i6YNjXOuVA8iWlcmNirNeM19FI3m7LJh4ZBxp1cE3gWobZCsdqy1P/+L1eQ4gzjUr
 OGEpqjOT2/TnnRPJIUrEAovxedBBayyKXCOvTCCF2i2rbZKCr3TYJ/j2rjzGCeeyIEBH
 leO9x9UZqXMuKG9PyU+pOjb3GVOQffvBfjL7lOSsmxM9ana03YSgKYVQYdb+2JZvDjU7
 JtN2Pg4VZEcVhE80wgIojRqm8eLSZ9FgZ0fYaS7YckOwPWrmKQylQiU1Nsx92J3GhIqH
 TqRg==
X-Gm-Message-State: AOAM5302Pscfa/SYkvDUQXyRJNoljLGl+psxgcmlRMKHj1lus19mnYly
 1pSI2ZGDxAlT/zLDbqLZcImMsHadoZ3mbRljIaldprAof0KzzicSTfZebx3/gAw64l7HytHXPOq
 iCIMtpQqOQu12h9Q=
X-Received: by 2002:a5d:59a3:: with SMTP id p3mr33818931wrr.146.1634539845051; 
 Sun, 17 Oct 2021 23:50:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwtAb7aDrBSVuuwgZMlN50ShtgoWUVKecXSmMQbONj+hkAVD4eny0woypfi1Si1zBTE9meFw==
X-Received: by 2002:a5d:59a3:: with SMTP id p3mr33818922wrr.146.1634539844885; 
 Sun, 17 Oct 2021 23:50:44 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id a2sm11845982wru.82.2021.10.17.23.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 23:50:44 -0700 (PDT)
Subject: Re: [PATCH] net: vmxnet3: validate configuration values during
 activate (CVE-2021-20203)
To: P J P <ppandit@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>
References: <20210130131652.954143-1-ppandit@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c15f0f4f-dee0-4414-6496-fe4844d34bdf@redhat.com>
Date: Mon, 18 Oct 2021 08:50:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210130131652.954143-1-ppandit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gaoning Pan <pgn@zju.edu.cn>, QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/01/2021 14.16, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> While activating device in vmxnet3_acticate_device(), it does not
> validate guest supplied configuration values against predefined
> minimum - maximum limits. This may lead to integer overflow or
> OOB access issues. Add checks to avoid it.
> 
> Fixes: CVE-2021-20203
> Buglink: https://bugs.launchpad.net/qemu/+bug/1913873
> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>   hw/net/vmxnet3.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index eff299f629..4a910ca971 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1420,6 +1420,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>       vmxnet3_setup_rx_filtering(s);
>       /* Cache fields from shared memory */
>       s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
> +    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
>       VMW_CFPRN("MTU is %u", s->mtu);
>   
>       s->max_rx_frags =
> @@ -1473,6 +1474,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>           /* Read rings memory locations for TX queues */
>           pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.txRingBasePA);
>           size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.txRingSize);
> +        if (size > VMXNET3_TX_RING_MAX_SIZE) {
> +            size = VMXNET3_TX_RING_MAX_SIZE;
> +        }
>   
>           vmxnet3_ring_init(d, &s->txq_descr[i].tx_ring, pa, size,
>                             sizeof(struct Vmxnet3_TxDesc), false);
> @@ -1483,6 +1487,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>           /* TXC ring */
>           pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.compRingBasePA);
>           size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.compRingSize);
> +        if (size > VMXNET3_TC_RING_MAX_SIZE) {
> +            size = VMXNET3_TC_RING_MAX_SIZE;
> +        }
>           vmxnet3_ring_init(d, &s->txq_descr[i].comp_ring, pa, size,
>                             sizeof(struct Vmxnet3_TxCompDesc), true);
>           VMXNET3_RING_DUMP(VMW_CFPRN, "TXC", i, &s->txq_descr[i].comp_ring);
> @@ -1524,6 +1531,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>               /* RX rings */
>               pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.rxRingBasePA[j]);
>               size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.rxRingSize[j]);
> +            if (size > VMXNET3_RX_RING_MAX_SIZE) {
> +                size = VMXNET3_RX_RING_MAX_SIZE;
> +            }
>               vmxnet3_ring_init(d, &s->rxq_descr[i].rx_ring[j], pa, size,
>                                 sizeof(struct Vmxnet3_RxDesc), false);
>               VMW_CFPRN("RX queue %d:%d: Base: %" PRIx64 ", Size: %d",
> @@ -1533,6 +1543,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>           /* RXC ring */
>           pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.compRingBasePA);
>           size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.compRingSize);
> +        if (size > VMXNET3_RC_RING_MAX_SIZE) {
> +            size = VMXNET3_RC_RING_MAX_SIZE;
> +        }
>           vmxnet3_ring_init(d, &s->rxq_descr[i].comp_ring, pa, size,
>                             sizeof(struct Vmxnet3_RxCompDesc), true);
>           VMW_CFPRN("RXC queue %d: Base: %" PRIx64 ", Size: %d", i, pa, size);
> 

Ping!

According to 
https://gitlab.com/qemu-project/qemu/-/issues/308#note_705736713 this is 
still an issue...

Patch looks fine to me ... maybe just add some 
qemu_log_mask(LOG_GUEST_ERROR, ...) statements before correcting the values?

  Thomas


