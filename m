Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED50307E3F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:42:39 +0100 (CET)
Received: from localhost ([::1]:53902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5CFa-00055o-Af
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5CBe-0003sL-F6
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:38:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l5CBc-0003fg-GE
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 13:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611859111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xBd0haxfyQH3EkvWoNRt9iyGHLHdnQWo+0Xi4E1pk4=;
 b=OKjhFB1b2uML2VOx2dC20j4lGVncGZmqrf3QmA7PkS7M0KMjLjEMXNbfqmSJCJuzFvEwkr
 JFjYxBItwevM5wWghEFEIy7JQAPKswLvmXGrQR4F5TpzZNyrmcoQod6oo8M8WqNvVQQeoX
 xfvr1bLZiprujT94etV5z+7651b4WoM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-nqk79mvPMfC0yFGtc3golg-1; Thu, 28 Jan 2021 13:38:29 -0500
X-MC-Unique: nqk79mvPMfC0yFGtc3golg-1
Received: by mail-wr1-f72.google.com with SMTP id p16so3206305wrx.10
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 10:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9xBd0haxfyQH3EkvWoNRt9iyGHLHdnQWo+0Xi4E1pk4=;
 b=tZ2tfNPDvvIzK9jrxOBPpM9NMBC73VbvTd9REOF54l5tmQc1veLTYpnBeT+2278fcg
 8FHk1tDpZwZXrvP/Q9jAkCq0EnXz/1hnGnW6YIQiaMDjWq808d+TrQFh8pxQZJZdj4Vd
 U/ZbD5Pp0W2UydUlB7EVL5ebU+LPd76IncdHnu2HMKAz+yDVjaAyIYVTJBr7i1aenOtg
 u53TZ/1N871nojiPCDYIqN9WICpLAFVMBxa7omjpEXlfhOf178zdtaTL7mzew0tzAgtr
 Izqh511YvF4u0yuUubDgYYcPWbn0ACwoPDvxfQZH/HWVPN/hVbOJ6Kvr7yfnCQqz3e9p
 +eIg==
X-Gm-Message-State: AOAM533Locg99jsVRPITmxiWPdJPm86wWMGSF3GQHsvEHNZv0fwDvFh0
 gnSAC4/PrhxCxMsVt4TCwHqAXTy0sVTJcc6zSepzNNV0rcy9z4tw4s7TAkT8X3vrAEcGcrz05Jp
 PH95y3WSGa7b+FA13cCzkIWRaGmHN/7DXV/S+H6n48A20FRrUrqT0fbkIonTQitKJ
X-Received: by 2002:a1c:e1d4:: with SMTP id y203mr590067wmg.50.1611859108198; 
 Thu, 28 Jan 2021 10:38:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydpPUe2Tq1Iw5qcaTdmLS3jFiiDbebw10Bg/8sGgmQuMcbO7lvKFL4m2hD7+WjxPD//xdIqQ==
X-Received: by 2002:a1c:e1d4:: with SMTP id y203mr590051wmg.50.1611859107872; 
 Thu, 28 Jan 2021 10:38:27 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r25sm8507992wrr.64.2021.01.28.10.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 10:38:26 -0800 (PST)
Subject: Re: [PULL 14/53] block: apply COR-filter to block-stream jobs
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
 <20210126142016.806073-15-mreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9772b42b-8175-9433-7a56-405403d64dd9@redhat.com>
Date: Thu, 28 Jan 2021 19:38:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126142016.806073-15-mreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Andrey,

On 1/26/21 3:19 PM, Max Reitz wrote:
> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> This patch completes the series with the COR-filter applied to
> block-stream operations.
> 
> Adding the filter makes it possible in future implement discarding
> copied regions in backing files during the block-stream job, to reduce
> the disk overuse (we need control on permissions).
> 
> Also, the filter now is smart enough to do copy-on-read with specified
> base, so we have benefit on guest reads even when doing block-stream of
> the part of the backing chain.
> 
> Several iotests are slightly modified due to filter insertion.
> 
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Message-Id: <20201216061703.70908-14-vsementsov@virtuozzo.com>
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  block/stream.c             | 105 ++++++++++++++++++++++---------------
>  tests/qemu-iotests/030     |   8 +--
>  tests/qemu-iotests/141.out |   2 +-
>  tests/qemu-iotests/245     |  20 ++++---
>  4 files changed, 80 insertions(+), 55 deletions(-)
> 
> diff --git a/block/stream.c b/block/stream.c
...
> @@ -228,7 +211,9 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>      bool bs_read_only;
>      int basic_flags = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
>      BlockDriverState *base_overlay;
> +    BlockDriverState *cor_filter_bs = NULL;
>      BlockDriverState *above_base;
> +    QDict *opts;
>  
>      assert(!(base && bottom));
>      assert(!(backing_file_str && bottom));
> @@ -266,30 +251,62 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>          }
>      }
>  
> -    if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
> -        return;
> -    }
> -
>      /* Make sure that the image is opened in read-write mode */
>      bs_read_only = bdrv_is_read_only(bs);
>      if (bs_read_only) {
> -        if (bdrv_reopen_set_read_only(bs, false, errp) != 0) {
> -            bs_read_only = false;
> -            goto fail;
> +        int ret;
> +        /* Hold the chain during reopen */
> +        if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
> +            return;
> +        }
> +
> +        ret = bdrv_reopen_set_read_only(bs, false, errp);
> +
> +        /* failure, or cor-filter will hold the chain */
> +        bdrv_unfreeze_backing_chain(bs, above_base);
> +
> +        if (ret < 0) {
> +            return;
>          }
>      }
>  
> -    /* Prevent concurrent jobs trying to modify the graph structure here, we
> -     * already have our own plans. Also don't allow resize as the image size is
> -     * queried only at the job start and then cached. */
> -    s = block_job_create(job_id, &stream_job_driver, NULL, bs,
> -                         basic_flags | BLK_PERM_GRAPH_MOD,
> +    opts = qdict_new();

Coverity reported (CID 1445793) that this resource could be leaked...

> +
> +    qdict_put_str(opts, "driver", "copy-on-read");
> +    qdict_put_str(opts, "file", bdrv_get_node_name(bs));
> +    /* Pass the base_overlay node name as 'bottom' to COR driver */
> +    qdict_put_str(opts, "bottom", base_overlay->node_name);
> +    if (filter_node_name) {
> +        qdict_put_str(opts, "node-name", filter_node_name);
> +    }
> +
> +    cor_filter_bs = bdrv_insert_node(bs, opts, BDRV_O_RDWR, errp);
> +    if (!cor_filter_bs) {

... probably here.

Should we call g_free(opts) here?

> +        goto fail;
> +    }
> +
> +    if (!filter_node_name) {
> +        cor_filter_bs->implicit = true;
> +    }
> +
> +    s = block_job_create(job_id, &stream_job_driver, NULL, cor_filter_bs,
> +                         BLK_PERM_CONSISTENT_READ,
>                           basic_flags | BLK_PERM_WRITE,
>                           speed, creation_flags, NULL, NULL, errp);
>      if (!s) {
>          goto fail;
>      }
>  
> +    /*
> +     * Prevent concurrent jobs trying to modify the graph structure here, we
> +     * already have our own plans. Also don't allow resize as the image size is
> +     * queried only at the job start and then cached.
> +     */
> +    if (block_job_add_bdrv(&s->common, "active node", bs, 0,
> +                           basic_flags | BLK_PERM_WRITE, &error_abort)) {
> +        goto fail;
> +    }
> +
>      /* Block all intermediate nodes between bs and base, because they will
>       * disappear from the chain after this operation. The streaming job reads
>       * every block only once, assuming that it doesn't change, so forbid writes
> @@ -310,9 +327,9 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>      s->base_overlay = base_overlay;
>      s->above_base = above_base;
>      s->backing_file_str = g_strdup(backing_file_str);
> +    s->cor_filter_bs = cor_filter_bs;
>      s->target_bs = bs;
>      s->bs_read_only = bs_read_only;
> -    s->chain_frozen = true;
>  
>      s->on_error = on_error;
>      trace_stream_start(bs, base, s);
> @@ -320,8 +337,10 @@ void stream_start(const char *job_id, BlockDriverState *bs,
>      return;
>  
>  fail:
> +    if (cor_filter_bs) {
> +        bdrv_cor_filter_drop(cor_filter_bs);
> +    }
>      if (bs_read_only) {
>          bdrv_reopen_set_read_only(bs, true, NULL);
>      }
> -    bdrv_unfreeze_backing_chain(bs, above_base);
>  }
...


