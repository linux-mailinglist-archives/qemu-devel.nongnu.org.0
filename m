Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDED470798
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 18:45:33 +0100 (CET)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvjxc-00011I-8d
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 12:45:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvjvy-0000BO-NX
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvjvw-0005yA-63
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639158225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XsWqYPKtjXYEy//DlKr9cSmvoh2uMI/P8WfwMKdKNw=;
 b=hpHpNI8s+zaBRMmuJL+6iJKKCztzrQJrd4m3BSIRZV970Qpgt/y7pzvn15kKFbjT2wWycr
 uFxFkaB6ykqHwxa7Xk0aLKqED+JglyqUA3oLvxDMUYkwFvBfSJaWLD47FUoirGD2OOpl5z
 EjBBwv8jV4zyDep9SgreY8Dxnm+hrOQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-5umNNFi_OeCl1ilsFP4QEQ-1; Fri, 10 Dec 2021 12:43:42 -0500
X-MC-Unique: 5umNNFi_OeCl1ilsFP4QEQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 x17-20020a5d6511000000b0019838caab88so2571791wru.6
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 09:43:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6XsWqYPKtjXYEy//DlKr9cSmvoh2uMI/P8WfwMKdKNw=;
 b=BkJ/40wcyinG24+3sBHUnc1yYDmunSPvYDDQU2USEXsWNqGpn+O4Op3tNe2eYCGHeB
 vPqbTkvoJBDq8m+6LWsz2a+lTw+zrPXljO/fsuhqYspWXAUi7rQUrQKG4lZ5SjCylYcG
 t+2McAlrHDi49z5Ig83R9iPQ4HDQDKlj74niyrRyK+pRPAI1IEphKAetiD/q4EbFU6CB
 UH5XP2vfswIpqrrraQn2kZukJiH1QFaC6HOLF2nI125ZlnahCRWerHCIeDtT+ylqmnab
 OwdJ7qFQFSRK4hnVQxQhaaOD2DCjqNvWZ90Y6fnqYe8oVApxo374JhwJW1I1j8BHkNhV
 8utg==
X-Gm-Message-State: AOAM531zpilhGawEjPqrOPXL99zjSVswAlJukh65/QCAgDgQOOPuIyo8
 cjq0Ej5cOw+qczA9ymvNYX452iR/Sj79jO1JiZj1fg8eJtmV/RrpMhHa91Sf+wsAU7k+1Et/b07
 wRDAGGC4Y/BJ6RMc=
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr14879062wrt.131.1639158221076; 
 Fri, 10 Dec 2021 09:43:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCHxrWBGT7iYfek4G1+zNH7wlMpCvTn/hUz6MX4SJbcIfdAq/Prr89fMFa3YwgNq+/DUdabQ==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr14879025wrt.131.1639158220827; 
 Fri, 10 Dec 2021 09:43:40 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id m36sm3436152wms.25.2021.12.10.09.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 09:43:40 -0800 (PST)
Message-ID: <6dd02c7c-5f0e-9dce-28b8-6ed7fb834a50@redhat.com>
Date: Fri, 10 Dec 2021 18:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 09/31] block: introduce assert_bdrv_graph_writable
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-10-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124064418.3120601-10-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
> We want to be sure that the functions that write the child and
> parent list of a bs are under BQL and drain.
>
> BQL prevents from concurrent writings from the GS API, while
> drains protect from I/O.
>
> TODO: drains are missing in some functions using this assert.
> Therefore a proper assertion will fail. Because adding drains
> requires additional discussions, they will be added in future
> series.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/block/block_int-global-state.h | 10 +++++++++-
>   block.c                                |  4 ++++
>   block/io.c                             | 11 +++++++++++
>   3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
> index a1b7d0579d..fa96e8b449 100644
> --- a/include/block/block_int-global-state.h
> +++ b/include/block/block_int-global-state.h
> @@ -312,4 +312,12 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
>    */
>   void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
>   
> -#endif /* BLOCK_INT_GLOBAL_STATE*/

This looks like it should be squashed into patch 7, sorry I missed this 
in v4...

(Rest of this patch looks good to me, for the record – and while I’m at 
it, for patches I didn’t reply to so far, I planned to send an R-b 
later.  But then there’s things like patches 2/3 looking good to me, but 
it turned out in my review for patch 4 that bdrv_lock_medium() is used 
in an I/O path, so I can’t really send an R-b now anymore...)

Hanna

> +/**
> + * Make sure that the function is running under both drain and BQL.
> + * The latter protects from concurrent writings
> + * from the GS API, while the former prevents concurrent reads
> + * from I/O.
> + */
> +void assert_bdrv_graph_writable(BlockDriverState *bs);
> +
> +#endif /* BLOCK_INT_GLOBAL_STATE */
> diff --git a/block.c b/block.c
> index 198ec636ff..522a273140 100644
> --- a/block.c
> +++ b/block.c
> @@ -1416,6 +1416,7 @@ static void bdrv_child_cb_attach(BdrvChild *child)
>   {
>       BlockDriverState *bs = child->opaque;
>   
> +    assert_bdrv_graph_writable(bs);
>       QLIST_INSERT_HEAD(&bs->children, child, next);
>   
>       if (child->role & BDRV_CHILD_COW) {
> @@ -1435,6 +1436,7 @@ static void bdrv_child_cb_detach(BdrvChild *child)
>   
>       bdrv_unapply_subtree_drain(child, bs);
>   
> +    assert_bdrv_graph_writable(bs);
>       QLIST_REMOVE(child, next);
>   }
>   
> @@ -2818,6 +2820,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>           if (child->klass->detach) {
>               child->klass->detach(child);
>           }
> +        assert_bdrv_graph_writable(old_bs);
>           QLIST_REMOVE(child, next_parent);
>       }
>   
> @@ -2827,6 +2830,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
>       }
>   
>       if (new_bs) {
> +        assert_bdrv_graph_writable(new_bs);
>           QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
>   
>           /*
> diff --git a/block/io.c b/block/io.c
> index cb095deeec..3be08cad29 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -734,6 +734,17 @@ void bdrv_drain_all(void)
>       bdrv_drain_all_end();
>   }
>   
> +void assert_bdrv_graph_writable(BlockDriverState *bs)
> +{
> +    /*
> +     * TODO: this function is incomplete. Because the users of this
> +     * assert lack the necessary drains, check only for BQL.
> +     * Once the necessary drains are added,
> +     * assert also for qatomic_read(&bs->quiesce_counter) > 0
> +     */
> +    assert(qemu_in_main_thread());
> +}
> +
>   /**
>    * Remove an active request from the tracked requests list
>    *


