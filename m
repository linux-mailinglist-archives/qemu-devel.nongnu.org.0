Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7848342A351
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:29:43 +0200 (CEST)
Received: from localhost ([::1]:39790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFyY-0005Sk-EO
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFdS-0008M5-Ol
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:07:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFdQ-0004fe-7u
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634036871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B5eqcYrJMXsn8zMVHiXzZ9Yqs89YkwPYi0196QHrbEc=;
 b=ApHbLld+2xKqmVSKxNX+FkQNGqEfhTPkhytvRiP+6w1zbK5fIYAuwHD9tUsuqbm+8lFKjA
 7q1XMbI186lJIPYNV6ABENpiwdcQyxIoDwqzVKMWXlWmxu2oArUmhbOjH6229lQqcFQf49
 WJX2oVJuPkdlhPsKOpIGQ8JyTW+ZH+c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-7XJ9u7yTOSiUIwWBGu5ceQ-1; Tue, 12 Oct 2021 07:07:48 -0400
X-MC-Unique: 7XJ9u7yTOSiUIwWBGu5ceQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so18569972edl.18
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B5eqcYrJMXsn8zMVHiXzZ9Yqs89YkwPYi0196QHrbEc=;
 b=Jwpjro14MUKkMl1mOKg5JvDOwa5Fvs2qizJejVjnFBsPWpNgLffiyqGmVugCCl1n+N
 ttsDEBeS4DylmGHVOmNc0v/8neOettU/8dH9k3Znwol42Rpd4i7KzqRfNY5tyZkPefqA
 56PRazjhukUjNTFOFQ0CrdhjPoUUvE1lAMUJMcdAHhS0tNOI2YBnVJE/FgTZhAP0BnZI
 PTJw1Ckw2kvLzYyX77Lvymq5J87T0ZtBtmFbhc+gjxyD4wB+/C+bMOJSpFzblBhCfX+W
 ScDDqQ4ZV4z79/p5gX+BhHJLc5LZiRTlJpM6xUTo65MyTbgDoxyL18n6pfw4Wg4Ysrya
 smqw==
X-Gm-Message-State: AOAM531djtk/yfVRBYMyitgbIjqVWbXeD5w4U2eFeLoxXVEBAHpGnTgt
 RYPh53gYAc6VM8Ikt+MWGaUyFskpmZqJt/qTzlWBlIW38sXFxiK2HSF5JKRvQbWat/Sizl3jF85
 zytHv5ElaMMQU0Oc=
X-Received: by 2002:a17:906:f2cd:: with SMTP id
 gz13mr32106581ejb.278.1634036867027; 
 Tue, 12 Oct 2021 04:07:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFm0W1zBQf3o9PrKuT/lN0VSYSF7FYzsp29+SQHhxvYtoePVPvPB4zAzfNs34u0EfNskmLMw==
X-Received: by 2002:a17:906:f2cd:: with SMTP id
 gz13mr32106535ejb.278.1634036866784; 
 Tue, 12 Oct 2021 04:07:46 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y4sm4722583ejr.101.2021.10.12.04.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 04:07:46 -0700 (PDT)
Message-ID: <c2f50115-0316-5686-4291-80fe78fd21dc@redhat.com>
Date: Tue, 12 Oct 2021 13:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 08/25] block: introduce assert_bdrv_graph_writable
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-9-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211012084906.2060507-9-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 10:48, Emanuele Giuseppe Esposito wrote:
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
>   block.c                                |  5 +++++
>   block/io.c                             | 11 +++++++++++
>   include/block/block_int-global-state.h | 10 +++++++++-
>   3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index 41c5883c5c..94bff5c757 100644
> --- a/block.c
> +++ b/block.c
> @@ -2734,12 +2734,14 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
>           if (child->klass->detach) {
>               child->klass->detach(child);
>           }
> +        assert_bdrv_graph_writable(old_bs);
>           QLIST_REMOVE(child, next_parent);
>       }
>   
>       child->bs = new_bs;
>   
>       if (new_bs) {
> +        assert_bdrv_graph_writable(new_bs);
>           QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
>   
>           /*
> @@ -2940,6 +2942,7 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
>           return ret;
>       }
>   
> +    assert_bdrv_graph_writable(parent_bs);
>       QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
>       /*
>        * child is removed in bdrv_attach_child_common_abort(), so don't care to
> @@ -3140,6 +3143,7 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
>   void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
>   {
>       assert(qemu_in_main_thread());
> +    assert_bdrv_graph_writable(parent);
>       if (child == NULL) {
>           return;
>       }
> @@ -4903,6 +4907,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
>       BdrvRemoveFilterOrCowChild *s = opaque;
>       BlockDriverState *parent_bs = s->child->opaque;
>   
> +    assert_bdrv_graph_writable(parent_bs);
>       QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
>       if (s->is_backing) {
>           parent_bs->backing = s->child;
> diff --git a/block/io.c b/block/io.c
> index f271ab3684..1c71e354d6 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -740,6 +740,17 @@ void bdrv_drain_all(void)
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
> diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
> index d08e80222c..6bd7746409 100644
> --- a/include/block/block_int-global-state.h
> +++ b/include/block/block_int-global-state.h
> @@ -316,4 +316,12 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
>    */
>   void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
>   
> -#endif /* BLOCK_INT_GLOBAL_STATE*/
> +/**
> + * Make sure that the function is either running under
> + * drain and BQL. The latter protects from concurrent writings
> + * from the GS API, while the former prevents concurrent reads
> + * from I/O.
> + */
> +void assert_bdrv_graph_writable(BlockDriverState *bs);
> +
> +#endif /* BLOCK_INT_GLOBAL_STATE */
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


