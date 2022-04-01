Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D574EEE32
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:33:03 +0200 (CEST)
Received: from localhost ([::1]:39342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHOg-0004Wq-3S
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:33:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHGO-0002C2-IW
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naHGM-00076S-V4
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648819464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DgXvBgjEtjatf5fv2ESWijuJ3HtfkNCWrF+MKdVuXFs=;
 b=hrnbvJWYRJ9axpOhIEz14dz4Ml/AUag/SP7UmFiFe3iPW5DBRiJyhsY71x1706+RXl9f8m
 st4YxdWXBmsu7ORGpr0Gfo8A8znCtyLgtm0Q8+ExGloi0v3FVTWXthRIoft2wCMJGCuWYU
 668QUXM091eUrDYMx8Y5ZQnLPIk7NAk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-0MJF1gcKPoWO_FZ1RC53dA-1; Fri, 01 Apr 2022 09:24:24 -0400
X-MC-Unique: 0MJF1gcKPoWO_FZ1RC53dA-1
Received: by mail-ed1-f70.google.com with SMTP id
 m21-20020a50d7d5000000b00418c7e4c2bbso1541814edj.6
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DgXvBgjEtjatf5fv2ESWijuJ3HtfkNCWrF+MKdVuXFs=;
 b=N1QjZnqSnxYZUI9KrzTqTNDjpTIf6/5TqvGmYiD9X9Bnxk54r78aGptr/dcwLc3SK4
 ONd0N/QsZJOcAK65T3pkcI71KVje3CyArDDwbelW+VQb7OuLPzNT0xxdT+0y6Xv44/Ni
 RFTzaKlLaAe6aJBJ3GjhTaR5QDd/VXumO2kROf7gM5WMxuP4glvD9oWX0c51SJ9+vkTH
 sZAqm0e/sK3KYm41ITTDWM7Gtb6kPX0sUJ0LKXVRBfSS/2WEkmuzESBovHOwtuOxkqQ0
 YtWhszWLFgE0XBTMCtXqpKeGsQq6dqzWUVAVecKw1Gb20j1LyLgLFyps9MMYjdaCikdq
 6YbA==
X-Gm-Message-State: AOAM530yhNjXVwJNnoSOpeCgIUGfzo6CuJuwddIN1SiFTRzGQSGAr9Js
 Di9KTqMaLQPsekuTc3sUdyPHC9rLuA0hcij/z+eDCA2zn0IWN4GG6mooaaUNc6V6/o91sI3RzJk
 2XXzmCW2Djn5fiaU=
X-Received: by 2002:a17:907:1b25:b0:6da:8206:fc56 with SMTP id
 mp37-20020a1709071b2500b006da8206fc56mr9220363ejc.81.1648819462458; 
 Fri, 01 Apr 2022 06:24:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWjm9SsFHkBzjb5V6sjOQ4EFOvYrWCOhFe4Vq5Rurdx2GfQvk72qXUC+uu7uLIUVZqXbQzzw==
X-Received: by 2002:a17:907:1b25:b0:6da:8206:fc56 with SMTP id
 mp37-20020a1709071b2500b006da8206fc56mr9220347ejc.81.1648819462180; 
 Fri, 01 Apr 2022 06:24:22 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 gl2-20020a170906e0c200b006a767d52373sm1012773ejb.182.2022.04.01.06.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 06:24:21 -0700 (PDT)
Message-ID: <14f219f3-be1c-888e-3076-779de736a2c0@redhat.com>
Date: Fri, 1 Apr 2022 15:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/7] block/copy-before-write: implement cbw-timeout
 option
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-7-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220401091920.287612-7-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
> In some scenarios, when copy-before-write operations lasts too long
> time, it's better to cancel it.
>
> Most useful would be to use the new option together with
> on-cbw-error=break-snapshot: this way if cbw operation takes too long
> time we'll just cancel backup process but do not disturb the guest too
> much.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block/copy-before-write.c | 6 +++++-
>   qapi/block-core.json      | 5 ++++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index 7ef3f9f4c1..0ea5506f77 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c
> @@ -42,6 +42,7 @@ typedef struct BDRVCopyBeforeWriteState {
>       BlockCopyState *bcs;
>       BdrvChild *target;
>       OnCbwError on_cbw_error;
> +    uint32_t cbw_timeout_ns;
>   
>       /*
>        * @lock: protects access to @access_bitmap, @done_bitmap and
> @@ -107,7 +108,7 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
>       off = QEMU_ALIGN_DOWN(offset, cluster_size);
>       end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
>   
> -    ret = block_copy(s->bcs, off, end - off, true, 0);
> +    ret = block_copy(s->bcs, off, end - off, true, s->cbw_timeout_ns);
>       if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
>           return ret;
>       }
> @@ -412,6 +413,7 @@ static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
>        */
>       qdict_extract_subqdict(options, NULL, "bitmap");
>       qdict_del(options, "on-cbw-error");
> +    qdict_del(options, "cbw-timeout");
>   
>   out:
>       visit_free(v);
> @@ -455,6 +457,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>       }
>       s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
>               ON_CBW_ERROR_BREAK_GUEST_WRITE;
> +    s->cbw_timeout_ns = opts->has_cbw_timeout ?
> +        opts->cbw_timeout * NANOSECONDS_PER_SECOND : 0;
>   
>       bs->total_sectors = bs->file->bs->total_sectors;
>       bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 3f08025114..e077506e0f 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -4207,12 +4207,15 @@
>   # @on-cbw-error: Behavior on failure of copy-before-write operation.
>   #                Default is @break-guest-write. (Since 7.0)
>   #
> +# @cbw-timeout: Zero means no limit. Non-zero sets the timeout in seconds
> +#               for copy-before-write operation. Default 0. (Since 7.0)

*7.1, but:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> +#
>   # Since: 6.2
>   ##
>   { 'struct': 'BlockdevOptionsCbw',
>     'base': 'BlockdevOptionsGenericFormat',
>     'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap',
> -            '*on-cbw-error': 'OnCbwError' } }
> +            '*on-cbw-error': 'OnCbwError', '*cbw-timeout': 'uint32' } }
>   
>   ##
>   # @BlockdevOptions:


