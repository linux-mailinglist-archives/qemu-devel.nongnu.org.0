Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DD44C2C2C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:52:59 +0100 (CET)
Received: from localhost ([::1]:41826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDcA-0003WM-3d
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:52:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDVb-0000Ua-UX
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:46:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDVY-0000WC-G7
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645706767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AITjYj7VuVl8FexmU/wq+n+iCvBKgI3XGwlkHx0MaoU=;
 b=aD7WhTNLRklOBKSXMjMzt4/utwLcqOky2EXkjnm+jQ0M7ySBTyaFL6g0N4WtDwSXunredC
 2d1MmWjIAEm8uy3F1t8ungd5tGh5Wsqp0Wx7nC95yJAHPrU8DImpxuWRQU3U4lB8U5Dor3
 KvuiTVaQAVNSuvkEqqyLVqD0ku4yJ3U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-wTql20qsO-iHKLWqTbDHcQ-1; Thu, 24 Feb 2022 07:46:04 -0500
X-MC-Unique: wTql20qsO-iHKLWqTbDHcQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 qa30-20020a170907869e00b006cee5e080easo1161984ejc.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AITjYj7VuVl8FexmU/wq+n+iCvBKgI3XGwlkHx0MaoU=;
 b=vKhuWhv6LsshEbqUI5IUdURPme3QG9xryJegWwkhzzjCgbvOwf8rCr5FjOkUI4CKSF
 v9CCxHCnkpyf2a5ytsds/3Xn6bAVIyAFR6o8jbvFfuXrQaGrzn/SBGysOaV7Ldysws2z
 xraCy3jtLrg4Qi+wvaed4eARnwlQKNoVltUqks20U2mT0BvaMoc4d13zJ/vOr7dmoQr+
 CP8jZmkj0d6xpn6AHtUgD6W0Tmf+hRA4nTmhY+F/iKBZxzj1x88I1yxfmLsGN0Z6Eemu
 HMBRZptog/AIcDDD0vG+6e9SLq2rs9wJHlyjZQ65KlpIaaea+0NocpHp0eR7s7gHydq2
 OwSQ==
X-Gm-Message-State: AOAM532IOZ32pBwgEauLtaaZBClrhtP6sog7ZWpg/do//b0TwV+RtHZP
 KyjIOdLkX92oyK51rg3/kDofND+u4D9g4PPGCmM2px9BKwasPL43sAqCS8N44sllJ7JRy9PJc5F
 ROWEbm0dIuryQ+8I=
X-Received: by 2002:a05:6402:1d4f:b0:412:81a5:8bef with SMTP id
 dz15-20020a0564021d4f00b0041281a58befmr2102268edb.163.1645706763707; 
 Thu, 24 Feb 2022 04:46:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQTykGketNnl8GCD5gvx9QShOAXZ+9S7O3+kwwGmSsr4FT6kiIkVnZ8lchhJLjUxaHowOsAw==
X-Received: by 2002:a05:6402:1d4f:b0:412:81a5:8bef with SMTP id
 dz15-20020a0564021d4f00b0041281a58befmr2102240edb.163.1645706763444; 
 Thu, 24 Feb 2022 04:46:03 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id s1sm1289093edd.100.2022.02.24.04.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 04:46:03 -0800 (PST)
Message-ID: <cb3f088b-5d6a-84cb-58bf-14bd740085d3@redhat.com>
Date: Thu, 24 Feb 2022 13:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 12/18] block: copy-before-write: realize
 snapshot-access API
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-13-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-13-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
> Current scheme of image fleecing looks like this:
>
> [guest]                    [NBD export]
>    |                              |
>    |root                          | root
>    v                              v
> [copy-before-write] -----> [temp.qcow2]
>    |                 target  |
>    |file                     |backing
>    v                         |
> [active disk] <-------------+
>
>   - On guest writes copy-before-write filter copies old data from active
>     disk to temp.qcow2. So fleecing client (NBD export) when reads
>     changed regions from temp.qcow2 image and unchanged from active disk
>     through backing link.
>
> This patch makes possible new image fleecing scheme:
>
> [guest]                   [NBD export]
>     |                            |
>     | root                       | root
>     v                 file       v
> [copy-before-write]<------[x-snapshot-access]
>     |           |
>     | file      | target
>     v           v
> [active-disk] [temp.img]
>
>   - copy-before-write does CBW operations and also provides
>     snapshot-access API. The API may be accessed through
>     x-snapshot-access driver.

The “x-” prefix seems like a relic from an earlier version.

(I agree with what I assume is your opinion now, that we don’t need an 
x- prefix.  I can’t imagine why we’d need to change the snapshot-access 
interface in an incompatible way.)

> Benefits of new scheme:
>
> 1. Access control: if remote client try to read data that not covered
>     by original dirty bitmap used on copy-before-write open, client gets
>     -EACCES.
>
> 2. Discard support: if remote client do DISCARD, this additionally to
>     discarding data in temp.img informs block-copy process to not copy
>     these clusters. Next read from discarded area will return -EACCES.
>     This is significant thing: when fleecing user reads data that was
>     not yet copied to temp.img, we can avoid copying it on further guest
>     write.
>
> 3. Synchronisation between client reads and block-copy write is more
>     efficient. In old scheme we just rely on BDRV_REQ_SERIALISING flag
>     used for writes to temp.qcow2. New scheme is less blocking:
>       - fleecing reads are never blocked: if data region is untouched or
>         in-flight, we just read from active-disk, otherwise we read from
>         temp.img
>       - writes to temp.img are not blocked by fleecing reads
>       - still, guest writes of-course are blocked by in-flight fleecing
>         reads, that currently read from active-disk - it's the minimum
>         necessary blocking
>
> 4. Temporary image may be of any format, as we don't rely on backing
>     feature.
>
> 5. Permission relation are simplified. With old scheme we have to share
>     write permission on target child of copy-before-write, otherwise
>     backing link conflicts with copy-before-write file child write
>     permissions. With new scheme we don't have backing link, and
>     copy-before-write node may have unshared access to temporary node.
>     (Not realized in this commit, will be in future).
>
> 6. Having control on fleecing reads we'll be able to implement
>     alternative behavior on failed copy-before-write operations.
>     Currently we just break guest request (that's a historical behavior
>     of backup). But in some scenarios it's a bad behavior: better
>     is to drop the backup as failed but don't break guest request.
>     With new scheme we can simply unset some bits in a bitmap on CBW
>     failure and further fleecing reads will -EACCES, or something like
>     this. (Not implemented in this commit, will be in future)
>     Additional application for this is implementing timeout for CBW
>     operations.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.c | 212 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 211 insertions(+), 1 deletion(-)
>
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index 91a2288b66..a8c88f64eb 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c

[...]

> +static int coroutine_fn
> +cbw_co_snapshot_block_status(BlockDriverState *bs,
> +                             bool want_zero, int64_t offset, int64_t bytes,
> +                             int64_t *pnum, int64_t *map,
> +                             BlockDriverState **file)
> +{
> +    BDRVCopyBeforeWriteState *s = bs->opaque;
> +    BlockReq *req;
> +    int ret;
> +    int64_t cur_bytes;
> +    BdrvChild *child;
> +
> +    req = cbw_snapshot_read_lock(bs, offset, bytes, &cur_bytes, &child);
> +    if (!req) {
> +        return -EACCES;
> +    }
> +
> +    ret = bdrv_block_status(bs, offset, cur_bytes, pnum, map, file);

This looks like an infinite recursion.  Shouldn’t this be s/bs/child->bs/?

> +    if (child == s->target) {
> +        /*
> +         * We refer to s->target only for areas that we've written to it.
> +         * And we can not report unallocated blocks in s->target: this will
> +         * break generic block-status-above logic, that will go to
> +         * copy-before-write filtered child in this case.
> +         */
> +        assert(ret & BDRV_BLOCK_ALLOCATED);
> +    }
> +
> +    cbw_snapshot_read_unlock(bs, req);
> +
> +    return ret;
> +}

[...]

> @@ -225,6 +407,27 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>           return -EINVAL;
>       }
>   
> +    cluster_size = block_copy_cluster_size(s->bcs);
> +
> +    s->done_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
> +    if (!s->done_bitmap) {
> +        return -EINVAL;

Hmm, similarly to my question on patch 4, I assume cbw_close() will free 
s->bcs (and also s->done_bitmap in the error case below)?

> +    }
> +    bdrv_disable_dirty_bitmap(s->done_bitmap);
> +
> +    /* s->access_bitmap starts equal to bcs bitmap */
> +    s->access_bitmap = bdrv_create_dirty_bitmap(bs, cluster_size, NULL, errp);
> +    if (!s->access_bitmap) {
> +        return -EINVAL;
> +    }
> +    bdrv_disable_dirty_bitmap(s->access_bitmap);
> +    bdrv_dirty_bitmap_merge_internal(s->access_bitmap,
> +                                     block_copy_dirty_bitmap(s->bcs), NULL,
> +                                     true);
> +
> +    qemu_co_mutex_init(&s->lock);
> +    QLIST_INIT(&s->frozen_read_reqs);
> +
>       return 0;
>   }


