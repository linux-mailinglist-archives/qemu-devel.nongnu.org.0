Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B95493734
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:26:06 +0100 (CET)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7ED-0007yW-DW
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:26:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA70E-0001RX-7z; Wed, 19 Jan 2022 04:11:38 -0500
Received: from [2a00:1450:4864:20::333] (port=53247
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA70C-0003Mp-Aa; Wed, 19 Jan 2022 04:11:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id v123so3944931wme.2;
 Wed, 19 Jan 2022 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mmyXOWnEZ/H23OskmPTSucJ49N8sdigflH+BUpPImFk=;
 b=HxTC5zxJ8qJ3MYh3Jf4gFAsee/iFj8at4kPg99M2dn6ZZdfBuKHrpqD7dPNCZZgXNw
 Qu1/NgmCMbLIbpby+Ha1KzPB2ELkfnYbt4h6Rl3JBCCwkaU4O1DYMmr8YCJuBQ1Uot1w
 3CTLYlV6dB1KFj7ZbzW1dFOkR6vDeYnpIn2zT2Ofk3FlWgD6pwYXVQ2zChMfxsXHoAHf
 xbz/onbET78/+8dp46NsP0k7enM0EOyg8bW5JrA1OLa463zu/cZVy+mRZuA5hYqkRzQG
 KPO1pbv6PEiu7tUItKFdRSAvVwg40MG8zKbl1ZbE/04WwX8lNr+lSpbN8wywr5fl04af
 eBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mmyXOWnEZ/H23OskmPTSucJ49N8sdigflH+BUpPImFk=;
 b=ByLONyas8UU+9EvOtrZcVVzsA1BP6cJSWBnAiKxYwaFSql4cw5ATtNC46RtiugfVXH
 m/3FivkPRtqNyl9ruXs8XqiEGI5i7zlL2CXWI2qVOdRbK6DGGzrNPmZM92qoMKN1W2rj
 ezHf+ruYv5y98+qlIXecUvll6nCKIMVgLl4WqxvI0zJ81ddUWXPNhx8/RggSbDlJksey
 HIbJfm9u3zeD/UFMvCjR8i6ed1W6JETdcYk2kYAH4hGNrJ71HnxGeDqgMy1h2UcNFf12
 hvyTUQXuMgHAUO9VlampcM33XBjMmEB2AasIQgmeYADV7FfpsX/kWLaI7L/67N/1Pskz
 gL5Q==
X-Gm-Message-State: AOAM532YxwaBq/ktvO4xdohSf6HIE4xPt4hDdliyAXu1YQJc2MVwYmKy
 VpsGn27dWsHexSifww+AjJk=
X-Google-Smtp-Source: ABdhPJxUEOZqvzNmPRlnS3zNd5REt4Mr8iUqkwZ/h0lgR/PiYaLOzZBrhbeDO4T73A3L8RvMG46BGA==
X-Received: by 2002:a05:6000:1002:: with SMTP id
 a2mr26907787wrx.157.1642583490497; 
 Wed, 19 Jan 2022 01:11:30 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id z6sm6181436wmp.9.2022.01.19.01.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:11:29 -0800 (PST)
Message-ID: <a1224352-4500-f256-aca1-20f5597aaa8e@redhat.com>
Date: Wed, 19 Jan 2022 10:11:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 02/12] block/io.c: make bdrv_do_drained_begin_quiesce
 static and introduce bdrv_drained_begin_no_poll
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-3-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220118162738.1366281-3-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 17:27, Emanuele Giuseppe Esposito wrote:
> Using bdrv_do_drained_begin_quiesce() in bdrv_child_cb_drained_end()

bdrv_child_cb_drained_begin()

> is not a good idea: the callback might be called when running
> a drain in a coroutine, and bdrv_drained_begin_poll() does not
> handle that case, resulting in assertion failure.
> 
> Instead, bdrv_do_drained_begin with no recursion and poll
> will accomplish the same thing (invoking bdrv_do_drained_begin_quiesce)
> but will firstly check if we are already in a coroutine, and exit
> from that via bdrv_co_yield_to_drain().

A better subject would be "fix bdrv_child_cb_drained_begin invocations 
from a coroutine".

Paolo

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c                  | 2 +-
>   block/io.c               | 7 ++++++-
>   include/block/block-io.h | 8 +++++---
>   3 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/block.c b/block.c
> index 668986c879..08fde585f4 100644
> --- a/block.c
> +++ b/block.c
> @@ -1206,7 +1206,7 @@ static char *bdrv_child_get_parent_desc(BdrvChild *c)
>   static void bdrv_child_cb_drained_begin(BdrvChild *child)
>   {
>       BlockDriverState *bs = child->opaque;
> -    bdrv_do_drained_begin_quiesce(bs, NULL, false);
> +    bdrv_drained_begin_no_poll(bs);
>   }
>   
>   static bool bdrv_child_cb_drained_poll(BdrvChild *child)
> diff --git a/block/io.c b/block/io.c
> index 3be08cad29..5123b7b713 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -425,7 +425,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
>       }
>   }
>   
> -void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
> +static void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
>                                      BdrvChild *parent, bool ignore_bds_parents)
>   {
>       assert(!qemu_in_coroutine());
> @@ -487,6 +487,11 @@ void bdrv_subtree_drained_begin(BlockDriverState *bs)
>       bdrv_do_drained_begin(bs, true, NULL, false, true);
>   }
>   
> +void bdrv_drained_begin_no_poll(BlockDriverState *bs)
> +{
> +    bdrv_do_drained_begin(bs, false, NULL, false, false);
> +}
> +
>   /**
>    * This function does not poll, nor must any of its recursively called
>    * functions.  The *drained_end_counter pointee will be incremented
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index a69bc5bd36..34a991649c 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -238,13 +238,15 @@ bool bdrv_drain_poll(BlockDriverState *bs, bool recursive,
>   void bdrv_drained_begin(BlockDriverState *bs);
>   
>   /**
> - * bdrv_do_drained_begin_quiesce:
> + * bdrv_drained_begin_no_poll:
>    *
>    * Quiesces a BDS like bdrv_drained_begin(), but does not wait for already
>    * running requests to complete.
> + * Same as bdrv_drained_begin(), but do not poll for the subgraph to
> + * actually become unquiesced. Therefore, no graph changes will occur
> + * with this function.
>    */
> -void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
> -                                   BdrvChild *parent, bool ignore_bds_parents);
> +void bdrv_drained_begin_no_poll(BlockDriverState *bs);
>   
>   /**
>    * Like bdrv_drained_begin, but recursively begins a quiesced section for


