Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076B74937B9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:52:06 +0100 (CET)
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7dN-0001QU-54
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:52:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7Yp-0006B4-Qv; Wed, 19 Jan 2022 04:47:24 -0500
Received: from [2a00:1450:4864:20::329] (port=44709
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA7Yl-0005Ym-06; Wed, 19 Jan 2022 04:47:22 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so4622830wms.3; 
 Wed, 19 Jan 2022 01:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VmVPMbK+jg0y1eqgEHaefaFcfgYfb+FAQauZAQU1ZD4=;
 b=GUJ4nMV2rgwt6wd4eERF9j2jxr1OjIVguuVXtfQnnhQ5XsKQ5WWuSjFZoEotKlxvGT
 e6UsN5CFwcD9LIBfEq80dEAMxl6Mhn/M4x5qcfVmJb4lsf229+9sLqzA4P2QRAzM8h6E
 AaDa69fqt1jJCMq2ZBynGTpHZAs2G2zqLkM5I4DqxG5avCQ0G5z3jnXKvXlsIs5XKpCn
 cmHzMvNxFIZGDyiR9u57bLCOnQpgD2MPkcZDgQ9zNl5OVnu8RUjaClwE8VLAwJB6auff
 wQ7hUl7WNDqCpYJUUQUsKJrPQdtmURCiVf2XbHbW9ruX55K0GzPZiqZKqSBbVD7La/VG
 ElHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VmVPMbK+jg0y1eqgEHaefaFcfgYfb+FAQauZAQU1ZD4=;
 b=ljmENv1ys5WUJ+cGcZqPLkqAzs2cizWBx5bUkXA6B+MO9+yWmgZWJmhpr2Ou9uYcOa
 877IzBS3kv2Sv5jrK9Y0K/KWiBxb4UjoQ5bT7zCiQZxcmQ1bXtY8wu4RRZdPgpIfj4Dk
 5w6dlBSl4UcxbWNQUURWr+/TTroeFBBBq8jBl/krYcyE7wfwKc/KmAgJfEyU+ORyXc7X
 21jtat0ljaG5DdlzPkFQWmkd0LwF0D0T/Fd0SLvQhsO++/twUJDtx4Ee6nnFlbVkOYPE
 nqvHdRN/3mlM1f7pNecS0tx7AcSx/J6yo3pV1biWNYzZQbVZ6i4Pve3DMLkmxGh8T5DL
 ZYQw==
X-Gm-Message-State: AOAM530GkUaOEFloZpzJheFuJXIp61b35LOYT/8WWJoBK3Q5vt1RafmL
 U6ZkPXL6y8Se/mEu47STrFo=
X-Google-Smtp-Source: ABdhPJxPH6NkSZAF7RTFugpPIcqkdjMx8+72O6NMn9VgPHDc2WKvaPxos2hbWihoMMlLxJK66/mWhQ==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr3159479wro.222.1642585636932; 
 Wed, 19 Jan 2022 01:47:16 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id l20sm6272040wms.24.2022.01.19.01.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:47:16 -0800 (PST)
Message-ID: <3d99fc75-9b7a-a55c-3587-b1c1ce07b6f4@redhat.com>
Date: Wed, 19 Jan 2022 10:47:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 10/12] block.c: add subtree_drains where needed
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-11-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220118162738.1366281-11-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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

Subject doesn't say what needs them: "block: drain block devices across 
graph modifications"

On 1/18/22 17:27, Emanuele Giuseppe Esposito wrote:
> Protect bdrv_replace_child_noperm, as it modifies the
> graph by adding/removing elements to .children and .parents
> list of a bs. Use the newly introduced
> bdrv_subtree_drained_{begin/end}_unlocked drains to achieve
> that and be free from the aiocontext lock.
> 
> One important criteria to keep in mind is that if the caller of
> bdrv_replace_child_noperm creates a transaction, we need to make sure that the
> whole transaction is under the same drain block.

Okay, this is the important part and it should be mentioned in patch 8 
as well.  It should also be in a comment above bdrv_replace_child_noperm().

> This is imperative, as having
> multiple drains also in the .abort() class of functions causes discrepancies
> in the drained counters (as nodes are put back into the original positions),
> making it really hard to retourn all to zero and leaving the code very buggy.
> See https://patchew.org/QEMU/20211213104014.69858-1-eesposit@redhat.com/
> for more explanations.
> 
> Unfortunately we still need to have bdrv_subtree_drained_begin/end
> in bdrv_detach_child() releasing and then holding the AioContext
> lock, since it later invokes bdrv_try_set_aio_context() that is
> not safe yet. Once all is cleaned up, we can also remove the
> acquire/release locks in job_unref, artificially added because of this.

About this:

> +         * TODO: this is called by job_unref with lock held, because
> +         * afterwards it calls bdrv_try_set_aio_context.
> +         * Once all of this is fixed, take care of removing
> +         * the aiocontext lock and make this function _unlocked.

It may be clear to you, but it's quite cryptic:

- which lock is held by job_unref()?  Also, would it make more sense to 
talk about block_job_free() rather than job_unref()?  I can't quite 
follow where the AioContext lock is taken.

- what is "all of this", and what do you mean by "not safe yet"?  Do 
both refer to bdrv_try_set_aio_context() needing the AioContext lock?

- what is "this function" (that should become _unlocked)?

I think you could also split the patch in multiple parts for different 
call chains.  In particular bdrv_set_backing_hd can be merged with the 
patch to bdrv_reopen_parse_file_or_backing, since both of them deal with 
bdrv_set_file_or_backing_noperm.

Paolo

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/block.c b/block.c
> index fcc44a49a0..6196c95aae 100644
> --- a/block.c
> +++ b/block.c
> @@ -3114,8 +3114,22 @@ static void bdrv_detach_child(BdrvChild **childp)
>       BlockDriverState *old_bs = (*childp)->bs;
>   
>       assert(qemu_in_main_thread());
> +    if (old_bs) {
> +        /*
> +         * TODO: this is called by job_unref with lock held, because
> +         * afterwards it calls bdrv_try_set_aio_context.
> +         * Once all of this is fixed, take care of removing
> +         * the aiocontext lock and make this function _unlocked.
> +         */
> +        bdrv_subtree_drained_begin(old_bs);
> +    }
> +
>       bdrv_replace_child_noperm(childp, NULL, true);
>   
> +    if (old_bs) {
> +        bdrv_subtree_drained_end(old_bs);
> +    }
> +
>       if (old_bs) {
>           /*
>            * Update permissions for old node. We're just taking a parent away, so
> @@ -3154,6 +3168,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>       Transaction *tran = tran_new();
>   
>       assert(qemu_in_main_thread());
> +    bdrv_subtree_drained_begin_unlocked(child_bs);
>   
>       ret = bdrv_attach_child_common(child_bs, child_name, child_class,
>                                      child_role, perm, shared_perm, opaque,
> @@ -3168,6 +3183,7 @@ out:
>       tran_finalize(tran, ret);
>       /* child is unset on failure by bdrv_attach_child_common_abort() */
>       assert((ret < 0) == !child);
> +    bdrv_subtree_drained_end_unlocked(child_bs);
>   
>       bdrv_unref(child_bs);
>       return child;
> @@ -3197,6 +3213,9 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
>   
>       assert(qemu_in_main_thread());
>   
> +    bdrv_subtree_drained_begin_unlocked(parent_bs);
> +    bdrv_subtree_drained_begin_unlocked(child_bs);
> +
>       ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
>                                      child_role, &child, tran, errp);
>       if (ret < 0) {
> @@ -3211,6 +3230,9 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
>   out:
>       tran_finalize(tran, ret);
>       /* child is unset on failure by bdrv_attach_child_common_abort() */
> +    bdrv_subtree_drained_end_unlocked(child_bs);
> +    bdrv_subtree_drained_end_unlocked(parent_bs);
> +
>       assert((ret < 0) == !child);
>   
>       bdrv_unref(child_bs);
> @@ -3456,6 +3478,11 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>   
>       assert(qemu_in_main_thread());
>   
> +    bdrv_subtree_drained_begin_unlocked(bs);
> +    if (backing_hd) {
> +        bdrv_subtree_drained_begin_unlocked(backing_hd);
> +    }
> +
>       ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
>       if (ret < 0) {
>           goto out;
> @@ -3464,6 +3491,10 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>       ret = bdrv_refresh_perms(bs, errp);
>   out:
>       tran_finalize(tran, ret);
> +    if (backing_hd) {
> +        bdrv_subtree_drained_end_unlocked(backing_hd);
> +    }
> +    bdrv_subtree_drained_end_unlocked(bs);
>   
>       return ret;
>   }
> @@ -5266,7 +5297,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
>   
>       assert(qemu_get_current_aio_context() == qemu_get_aio_context());
>       assert(bdrv_get_aio_context(from) == bdrv_get_aio_context(to));
> -    bdrv_drained_begin(from);
> +    bdrv_subtree_drained_begin_unlocked(from);
> +    bdrv_subtree_drained_begin_unlocked(to);
>   
>       /*
>        * Do the replacement without permission update.
> @@ -5298,7 +5330,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
>   out:
>       tran_finalize(tran, ret);
>   
> -    bdrv_drained_end(from);
> +    bdrv_subtree_drained_end_unlocked(to);
> +    bdrv_subtree_drained_end_unlocked(from);
>       bdrv_unref(from);
>   
>       return ret;
> @@ -5345,6 +5378,9 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>   
>       assert(!bs_new->backing);
>   
> +    bdrv_subtree_drained_begin_unlocked(bs_new);
> +    bdrv_subtree_drained_begin_unlocked(bs_top);
> +
>       ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
>                                      &child_of_bds, bdrv_backing_role(bs_new),
>                                      &bs_new->backing, tran, errp);
> @@ -5360,6 +5396,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>       ret = bdrv_refresh_perms(bs_new, errp);
>   out:
>       tran_finalize(tran, ret);
> +    bdrv_subtree_drained_end_unlocked(bs_top);
> +    bdrv_subtree_drained_end_unlocked(bs_new);
>   
>       bdrv_refresh_limits(bs_top, NULL, NULL);
>   
> @@ -5379,8 +5417,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>       assert(qemu_in_main_thread());
>   
>       bdrv_ref(old_bs);
> -    bdrv_drained_begin(old_bs);
> -    bdrv_drained_begin(new_bs);
> +    bdrv_subtree_drained_begin_unlocked(old_bs);
> +    bdrv_subtree_drained_begin_unlocked(new_bs);
>   
>       bdrv_replace_child_tran(&child, new_bs, tran, true);
>       /* @new_bs must have been non-NULL, so @child must not have been freed */
> @@ -5394,8 +5432,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>   
>       tran_finalize(tran, ret);
>   
> -    bdrv_drained_end(old_bs);
> -    bdrv_drained_end(new_bs);
> +    bdrv_subtree_drained_end_unlocked(new_bs);
> +    bdrv_subtree_drained_end_unlocked(old_bs);
>       bdrv_unref(old_bs);
>   
>       return ret;


