Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9F49DD1D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:59:22 +0100 (CET)
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD0cj-0006dS-E2
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nD0as-0005d3-3c
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:57:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nD0am-0002Tb-DM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643273837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTSaIcrYyS7aX7pT/lkhRw10yF2xD4ar+kb434Va6dc=;
 b=FNHd9vHVbFk4qSn6dznMkKmbQ1F6FiFcr1U7wTWpK2OZP+v9ZQA0DYMz5yrJXUWPcl7RkX
 eQ2+MCmzjOi0K7k+XJKZUMHfnS45lI/sYZJcG3b5cmOVRgfa04f+WBy2l9YPjCCQ6P+NDf
 de3dnMxT0/Td7vYsMKde3Nhc8GsLtT8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-8e0rkK9dO4ilWA5BcoVW2w-1; Thu, 27 Jan 2022 03:57:15 -0500
X-MC-Unique: 8e0rkK9dO4ilWA5BcoVW2w-1
Received: by mail-pj1-f69.google.com with SMTP id
 a4-20020a17090a70c400b001b21d9c8bc8so3953755pjm.7
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 00:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WTSaIcrYyS7aX7pT/lkhRw10yF2xD4ar+kb434Va6dc=;
 b=JuhRS329dWIUIX7IBV00ZOe5Fz3PjVDXTwn4UzHE6MYDNWa7F/lWEOg6NvGBHgkMsj
 5auqEJMFJzx8ShA2TI5BnZw2C14tmP/ZmkP/ZPjPyJ5MwG3yZi1RWWPhNq6I4JADYTJE
 7rVA3qsT9QICGuziThJQqlD949xsBHBuHQotUsYl7dLBe7HldkKUHjDKZ4azXomTRPrf
 RsfmFjwY76Byb5AXzq47N8u5lZQi5Yuexl65OV8lBo8A08tKmoK+Rrfvexisp9+GueO6
 P5yolFCuR04QfHJ4feTyzYzaZEV8InbaP69N+itOlD9LGOyHBbCj4IU1KZKg0wUahse6
 o+Bg==
X-Gm-Message-State: AOAM53027bsoAQKrvnxYORlcg21NE6SCCdFIia3xJXCmc1h0263dPQyk
 o1l1hlpd6VPPdsIhwYZT39fzyjPwl4Lnz7UF9zNCiawHfNLts/85PF7UokCCUonddHNLu1YjcTG
 18VnpL89/yezwLAY=
X-Received: by 2002:a17:902:ce84:: with SMTP id
 f4mr2373029plg.134.1643273834640; 
 Thu, 27 Jan 2022 00:57:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1fnkKsmQWEQBO69I/cW7a3zjSCwRHfUyg5J6gXZm7MP6RN2jgHGHJlZMQIrX9zXmYDbRFjw==
X-Received: by 2002:a17:902:ce84:: with SMTP id
 f4mr2372989plg.134.1643273834209; 
 Thu, 27 Jan 2022 00:57:14 -0800 (PST)
Received: from xz-m1.local ([111.197.238.41])
 by smtp.gmail.com with ESMTPSA id d126sm4580786pfd.136.2022.01.27.00.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 00:57:13 -0800 (PST)
Date: Thu, 27 Jan 2022 16:57:08 +0800
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH v5 23/26] util: Add iova_tree_alloc
Message-ID: <YfJeZPn6nsCUxFiL@xz-m1.local>
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-24-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211029183525.1776416-24-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org, Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 29, 2021 at 08:35:22PM +0200, Eugenio Pérez wrote:
> This iova tree function allows it to look for a hole in allocated
> regions and return a totally new translation for a given translated
> address.
> 
> It's usage is mainly to allow devices to access qemu address space,
> remapping guest's one into a new iova space where qemu can add chunks of
> addresses.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  include/qemu/iova-tree.h |  17 +++++
>  util/iova-tree.c         | 139 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 156 insertions(+)
> 
> diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> index 8249edd764..33f9b2e13f 100644
> --- a/include/qemu/iova-tree.h
> +++ b/include/qemu/iova-tree.h
> @@ -29,6 +29,7 @@
>  #define  IOVA_OK           (0)
>  #define  IOVA_ERR_INVALID  (-1) /* Invalid parameters */
>  #define  IOVA_ERR_OVERLAP  (-2) /* IOVA range overlapped */
> +#define  IOVA_ERR_NOMEM    (-3) /* Cannot allocate */
>  
>  typedef struct IOVATree IOVATree;
>  typedef struct DMAMap {
> @@ -119,6 +120,22 @@ const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
>   */
>  void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator);
>  
> +/**
> + * iova_tree_alloc:
> + *
> + * @tree: the iova tree to allocate from
> + * @map: the new map (as translated addr & size) to allocate in iova region
> + * @iova_begin: the minimum address of the allocation
> + * @iova_end: the maximum addressable direction of the allocation
> + *
> + * Allocates a new region of a given size, between iova_min and iova_max.
> + *
> + * Return: Same as iova_tree_insert, but cannot overlap and can be out of
> + * free contiguous range. Caller can get the assigned iova in map->iova.
> + */
> +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> +                    hwaddr iova_end);
> +
>  /**
>   * iova_tree_destroy:
>   *
> diff --git a/util/iova-tree.c b/util/iova-tree.c
> index 23ea35b7a4..27c921c4e2 100644
> --- a/util/iova-tree.c
> +++ b/util/iova-tree.c
> @@ -16,6 +16,36 @@ struct IOVATree {
>      GTree *tree;
>  };
>  
> +/* Args to pass to iova_tree_alloc foreach function. */
> +struct IOVATreeAllocArgs {
> +    /* Size of the desired allocation */
> +    size_t new_size;
> +
> +    /* The minimum address allowed in the allocation */
> +    hwaddr iova_begin;
> +
> +    /* The last addressable allowed in the allocation */
> +    hwaddr iova_last;
> +
> +    /* Previously-to-last iterated map, can be NULL in the first node */
> +    const DMAMap *hole_left;
> +
> +    /* Last iterated map */
> +    const DMAMap *hole_right;

I slightly prefer having two more fields to cache the result:

       /* If found, we fill in the IOVA here */
       hwaddr iova_result;
       /* Whether have we found a valid IOVA */
       bool   iova_found;

IMHO they'll help on readability.  More below.

> +};
> +
> +/**
> + * Iterate args to tne next hole
> + *
> + * @args  The alloc arguments
> + * @next  The next mapping in the tree. Can be NULL to signal the last one
> + */
> +static void iova_tree_alloc_args_iterate(struct IOVATreeAllocArgs *args,
> +                                         const DMAMap *next) {
> +    args->hole_left = args->hole_right;
> +    args->hole_right = next;
> +}
> +
>  static int iova_tree_compare(gconstpointer a, gconstpointer b, gpointer data)
>  {
>      const DMAMap *m1 = a, *m2 = b;
> @@ -107,6 +137,115 @@ int iova_tree_remove(IOVATree *tree, const DMAMap *map)
>      return IOVA_OK;
>  }
>  
> +/**
> + * Try to accomodate a map of size ret->size in a hole between
> + * max(end(hole_left), iova_start).

I think this functions need the most comments, and above sentence is more or
less not sounding correct... My try...

/*
 * Try to find an unallocated IOVA range between LEFT and RIGHT elements.
 *
 * There're three cases:
 *
 * (1) When LEFT==NULL, RIGHT must be non-NULL and it means we're iterating at
 *     the 1st element.
 *
 * (2) When RIGHT==NULL, LEFT must be non-NULL and it means we're iterating at
 *     the last element.
 *
 * (3) When both LEFT and RIGHT are non-NULL, this is the most common case,
 *     we'll try to find a hole between LEFT and RIGHT mapping.
 */

> + *
> + * @args Arguments to allocation
> + */
> +static bool iova_tree_alloc_map_in_hole(const struct IOVATreeAllocArgs *args)
> +{
> +    const DMAMap *left = args->hole_left, *right = args->hole_right;
> +    uint64_t hole_start, hole_last;
> +
> +    if (right && right->iova + right->size < args->iova_begin) {
> +        return false;
> +    }
> +
> +    if (left && left->iova > args->iova_last) {
> +        return false;
> +    }
> +
> +    hole_start = MAX(left ? left->iova + left->size + 1 : 0, args->iova_begin);
> +    hole_last = MIN(right ? right->iova : HWADDR_MAX, args->iova_last);

I assume these values should be always inclusive, hence

s/right->iova/right->iova + 1/

?

> +
> +    if (hole_last - hole_start > args->new_size) {
> +        /* We found a valid hole. */

IMHO it's cleaner we simply set:

           args->iova_result = hole_start;

Here before stop the iterations.

> +        return true;
> +    }
> +
> +    /* Keep iterating */
> +    return false;
> +}
> +
> +/**
> + * Foreach dma node in the tree, compare if there is a hole wit its previous
> + * node (or minimum iova address allowed) and the node.
> + *
> + * @key   Node iterating
> + * @value Node iterating
> + * @pargs Struct to communicate with the outside world
> + *
> + * Return: false to keep iterating, true if needs break.
> + */
> +static gboolean iova_tree_alloc_traverse(gpointer key, gpointer value,
> +                                         gpointer pargs)
> +{
> +    struct IOVATreeAllocArgs *args = pargs;
> +    DMAMap *node = value;
> +
> +    assert(key == value);
> +
> +    iova_tree_alloc_args_iterate(args, node);
> +    if (args->hole_left && args->hole_left->iova > args->iova_last) {

IMHO this check is redundant and can be dropped, as it's already done in
iova_tree_alloc_map_in_hole().

> +        return true;
> +    }
> +
> +    if (iova_tree_alloc_map_in_hole(args)) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +int iova_tree_alloc(IOVATree *tree, DMAMap *map, hwaddr iova_begin,
> +                    hwaddr iova_last)
> +{
> +    struct IOVATreeAllocArgs args = {
> +        .new_size = map->size,
> +        .iova_begin = iova_begin,
> +        .iova_last = iova_last,
> +    };
> +
> +    if (iova_begin == 0) {
> +        /* Some devices does not like addr 0 */
> +        iova_begin += qemu_real_host_page_size;
> +    }

(This should be dropped as the new version goes)

> +
> +    assert(iova_begin < iova_last);
> +
> +    /*
> +     * Find a valid hole for the mapping
> +     *
> +     * Assuming low iova_begin, so no need to do a binary search to
> +     * locate the first node.

We could also mention something like this here:

        *
        * The traversing will cover all the possible holes but except the last
        * hole starting from the last element.  We need to handle it separately
        * below.
        *

> +     *
> +     * TODO: We can improve the search speed if we save the beginning and the
> +     * end of holes, so we don't iterate over the previous saved ones.
> +     *
> +     * TODO: Replace all this with g_tree_node_first/next/last when available
> +     * (from glib since 2.68). To do it with g_tree_foreach complicates the
> +     * code a lot.
> +     *
> +     */
> +    g_tree_foreach(tree->tree, iova_tree_alloc_traverse, &args);
> +    if (!iova_tree_alloc_map_in_hole(&args)) {

With iova_found, here it could be (hopefully) more readable:

       if (!args->iova_found) {
           /* If we failed to find a hole in 0..N-1 entries, try the last one */
           iova_tree_alloc_args_iterate(&args, NULL);
           iova_tree_alloc_map_in_hole(&args);
           if (!args->iova_found) {
               return IOVA_ERR_NOMEM;
           }
       }

       map->iova = args->iova_result;
       ...

Thanks,

> +        /*
> +         * 2nd try: Last iteration left args->right as the last DMAMap. But
> +         * (right, end) hole needs to be checked too
> +         */
> +        iova_tree_alloc_args_iterate(&args, NULL);
> +        if (!iova_tree_alloc_map_in_hole(&args)) {
> +            return IOVA_ERR_NOMEM;
> +        }
> +    }
> +
> +    map->iova = MAX(iova_begin,
> +                    args.hole_left ?
> +                    args.hole_left->iova + args.hole_left->size + 1 : 0);
> +    return iova_tree_insert(tree, map);
> +}
> +
>  void iova_tree_destroy(IOVATree *tree)
>  {
>      g_tree_destroy(tree->tree);
> -- 
> 2.27.0
> 

-- 
Peter Xu


