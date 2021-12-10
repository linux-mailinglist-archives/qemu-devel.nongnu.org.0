Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE1E470302
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:41:24 +0100 (CET)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvh5O-0002BG-O1
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:41:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvh3B-00011R-IC
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:39:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvh39-0004S1-Mq
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639147142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RiobgG8jV9NMApp4Gw3bq4uvMydfy/qxWKE5LBKFnSU=;
 b=btp4dR/XdlDx0WqgEXq5b9xKDgwkpI5HnxR6979eoniXkHhv1w6aL4EPXC2/bE1E2jLROo
 xdiiOzzh1R6052T7YuUTOuEx2URUsFWSu1MH7ZJDv2znH3RZ/q4tWgLARMzMlVc1gPYcB9
 mgnzUa1CtAjnD2VqF+WKWPo52yXoHRE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-lsX1lh86MuO3j7HIJjno6A-1; Fri, 10 Dec 2021 09:39:00 -0500
X-MC-Unique: lsX1lh86MuO3j7HIJjno6A-1
Received: by mail-wr1-f72.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso2358915wrq.16
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 06:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RiobgG8jV9NMApp4Gw3bq4uvMydfy/qxWKE5LBKFnSU=;
 b=zR4FMf+auXHG6CiMSBLFCibl1vsY17w+Cj+DP1PbyoaLlriCcDfs7M5/H/kOLRPZa6
 eu2/r70RXxdXUIbV+HKqpZsWqfiKUbylaREA+mnE3cMHu3vHW/Db9zxH60N08G972mLl
 GnfAvj59vcRRNJjZaR9rkF25QiwFy9SHeQ4RsO1jMEI8RngKydawvwZ1BAm1QwnTXCxC
 B+9w6o7OzrpFDzLUxcpUIezwL6xmsTkSNVWVaVedxBBYArNE+V1Aj+zy0VUk3ERJ477B
 Us3vSEMZPt8hY7jBjncJVCihHXDAHW4eWzLGOEkfWjVdX86NRmsOraW1f5DWNAMeQZFn
 3KHw==
X-Gm-Message-State: AOAM531YxOi8ZHCKMZTFUd8kFjbNA9/ffNOymdoJdhMIrkme8qsHDSso
 5T0qWhN7F4i6tiK59sD/9W757auJdi8Tc2A4rF4CDsNH4d1VytvfXYBswA1pxkXZLd/RXJxXSpu
 M/LSX3xj7E8kNJ8Q=
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr14509719wry.66.1639147138777; 
 Fri, 10 Dec 2021 06:38:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyG7GsS6P8x31hxM0aFdwhLU04Q1uQoLCQEIMNtzL4bg6HQpRvpQqhBhgAtzT7sY5PzDVBBFQ==
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr14509675wry.66.1639147138485; 
 Fri, 10 Dec 2021 06:38:58 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id w17sm3171750wmc.14.2021.12.10.06.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 06:38:58 -0800 (PST)
Message-ID: <2b924119-5bfd-d00d-169d-5cf1d7460116@redhat.com>
Date: Fri, 10 Dec 2021 15:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 05/31] block-backend: special comments for
 blk_set/get_perm due to fuse
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-6-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124064418.3120601-6-eesposit@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Fuse logic can be classified as I/O, so there is no BQL held
> during its execution. And yet, it uses blk_{get/set}_perm
> functions, that are classified as BQL and clearly require
> the BQL lock. Since there is no easy solution for this,
> add a couple of TODOs and FIXME in the relevant sections of the
> code.

Well, the problem goes deeper, because we still consider them GS 
functions.  So it’s fine for the permission function 
raw_handle_perm_lock() to call bdrv_get_flags(), which is a GS function, 
and then you still get:

qemu-storage-daemon: ../block.c:6195: bdrv_get_flags: Assertion 
`qemu_in_main_thread()' failed.

It looks like in this case making bdrv_get_flags() not a GS function 
would be feasible and might solve the problem, but I guess we should 
instead think about adding something like

if (!exp->growable && !qemu_in_main_thread()) {
     /* Changing permissions like below only works in the main thread */
     return -EPERM;
}

to fuse_do_truncate().

Ideally, to make up for this, we should probably take the RESIZE 
permission in fuse_export_create() for writable exports in iothreads.

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-backend.c | 10 ++++++++++
>   block/export/fuse.c   | 16 ++++++++++++++--
>   2 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 1f0bda578e..7a4b50a8f0 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -888,6 +888,11 @@ int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
>                    Error **errp)
>   {
>       int ret;
> +    /*
> +     * FIXME: blk_{get/set}_perm should be always called under
> +     * BQL, but it is not the case right now (see block/export/fuse.c)
> +     */
> +    /* assert(qemu_in_main_thread()); */
>   
>       if (blk->root && !blk->disable_perm) {
>           ret = bdrv_child_try_set_perm(blk->root, perm, shared_perm, errp);
> @@ -904,6 +909,11 @@ int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
>   
>   void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
>   {
> +    /*
> +     * FIXME: blk_{get/set}_perm should be always called under
> +     * BQL, but it is not the case right now (see block/export/fuse.c)
> +     */
> +    /* assert(qemu_in_main_thread()); */
>       *perm = blk->perm;
>       *shared_perm = blk->shared_perm;
>   }
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index 823c126d23..7ceb8d783b 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -89,7 +89,10 @@ static int fuse_export_create(BlockExport *blk_exp,
>       /* For growable exports, take the RESIZE permission */
>       if (args->growable) {
>           uint64_t blk_perm, blk_shared_perm;
> -
> +        /*
> +         * FIXME: blk_{get/set}_perm should not be here, as permissions
> +         * should be modified only under BQL and here we are not!
> +         */

I believe we are, BlockExportDriver.create() is called by blk_exp_add(), 
which looks very much like it runs in the main thread (calling 
bdrv_lookup_bs(), bdrv_try_set_aio_context(), blk_new(), and whatnot).

Hanna

>           blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
>   
>           ret = blk_set_perm(exp->common.blk, blk_perm | BLK_PERM_RESIZE,
> @@ -400,6 +403,11 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
>   
>       /* Growable exports have a permanent RESIZE permission */
>       if (!exp->growable) {
> +
> +        /*
> +         * FIXME: blk_{get/set}_perm should not be here, as permissions
> +         * should be modified only under BQL and here we are not!
> +         */
>           blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
>   
>           ret = blk_set_perm(exp->common.blk, blk_perm | BLK_PERM_RESIZE,
> @@ -413,7 +421,11 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
>                          truncate_flags, NULL);
>   
>       if (!exp->growable) {
> -        /* Must succeed, because we are only giving up the RESIZE permission */
> +        /*
> +         * Must succeed, because we are only giving up the RESIZE permission.
> +         * FIXME: blk_{get/set}_perm should not be here, as permissions
> +         * should be modified only under BQL and here we are not!
> +         */
>           blk_set_perm(exp->common.blk, blk_perm, blk_shared_perm, &error_abort);
>       }
>   


