Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DEE49E1FC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:08:00 +0100 (CET)
Received: from localhost ([::1]:59570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3ZH-00015D-CJ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nD3E1-0003oV-AJ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:46:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nD3Dx-0002zk-88
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643283954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jijDyqVBkztkEFKU7KuQUQDKR/WSBK97+FJJ4qKrst8=;
 b=eLnrV49aeNkD1mRAY6tR4nY2nIINvOSZ2uMme+O2UXkSK0B38uuiqgzKhZgJq93/zrbAbE
 F5ze0LbIW/WEASvsLmn3EKjnRBcFlexyJYI2iUNPPbZVtGAAREaxS7Mmz0L1I90keFaSuC
 oKoagxBb5/wMfZOxHrQLUX/2JlbzfRA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-quX4HPtWMLyDjRuDN1JNbA-1; Thu, 27 Jan 2022 06:45:51 -0500
X-MC-Unique: quX4HPtWMLyDjRuDN1JNbA-1
Received: by mail-qt1-f197.google.com with SMTP id
 e28-20020ac8415c000000b002c5e43ca6b7so1996176qtm.9
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jijDyqVBkztkEFKU7KuQUQDKR/WSBK97+FJJ4qKrst8=;
 b=wit/PyYb/Z7PiTilKNOROE/Hp79j0PmHnuOd8L06hW+bFXenPhMGKWfbTKmUeC5NeJ
 CydQfxWezc/IkZ8pO+/6IJo09VTCjIQtrcGxZgSoXjygzS+SjyCAx+M103hW10gQT7HC
 KN3l+zHcB2ymRYdO8jew2h7VqLoLOe8DdEI0+LsvrfZQ9+SElYrcoxcqYsF7UwEXqCIN
 mVM8r4k2D08XHIcdj5x+381b4/sUyqBp+qO7kTl//X0RoPtzCmv25s13BbAEwtKhssl0
 ixs09JdoUth6P8s2RFx9nAzVecybCyABe3GiWT+8N3/d2uXmQ4LKkAADjDYf+KuJvRMp
 hZ1w==
X-Gm-Message-State: AOAM533Xb3ZYxmpfFu7aZ5P4zd6D6iY7xlrjwSBxkPC9CrsHz4jJoXqM
 7yK1OiO81yCRwPNzo3d393Z1ewou553ivr/gEectrH8KvPVOqayLV2O6IDx0G1ZfFApns0xXayA
 UFht7dTTKDc45LB+8ElmyCwtiz4HgHT4=
X-Received: by 2002:a05:6214:d8e:: with SMTP id
 e14mr2203481qve.119.1643283950779; 
 Thu, 27 Jan 2022 03:45:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXkx1rkL0TfMiOCSKObxPiHkt5aGSUh3ybqk6m8fuohPF+DVZl1DbB7GGz8WvQz9LiEdBIRt3AjWASLVeq5gc=
X-Received: by 2002:a05:6214:d8e:: with SMTP id
 e14mr2203457qve.119.1643283950584; 
 Thu, 27 Jan 2022 03:45:50 -0800 (PST)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-24-eperezma@redhat.com>
 <YfJeZPn6nsCUxFiL@xz-m1.local>
 <CAJaqyWd52cXWHnLsgo=kP2Z7=VG6YKtxFGhTe7OamfYcZxhz6w@mail.gmail.com>
 <YfKBIuTzsoOF9Mj5@xz-m1.local>
In-Reply-To: <YfKBIuTzsoOF9Mj5@xz-m1.local>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 27 Jan 2022 12:45:14 +0100
Message-ID: <CAJaqyWe4eEt3U5n0NTCgnof=H_s9AccShfZHfppsCri+B45r_w@mail.gmail.com>
Subject: Re: [RFC PATCH v5 23/26] util: Add iova_tree_alloc
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 12:25 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Jan 27, 2022 at 11:09:44AM +0100, Eugenio Perez Martin wrote:
> > > > +/**
> > > > + * Try to accomodate a map of size ret->size in a hole between
> > > > + * max(end(hole_left), iova_start).
> > >
> > > I think this functions need the most comments, and above sentence is more or
> > > less not sounding correct... My try...
> > >
> > > /*
> > >  * Try to find an unallocated IOVA range between LEFT and RIGHT elements.
> > >  *
> > >  * There're three cases:
> > >  *
> > >  * (1) When LEFT==NULL, RIGHT must be non-NULL and it means we're iterating at
> > >  *     the 1st element.
> > >  *
> > >  * (2) When RIGHT==NULL, LEFT must be non-NULL and it means we're iterating at
> > >  *     the last element.
> > >  *
> > >  * (3) When both LEFT and RIGHT are non-NULL, this is the most common case,
> > >  *     we'll try to find a hole between LEFT and RIGHT mapping.
> > >  */
> > >
> >
> > This is also called with left == NULL and right == NULL in the first
> > allocation with an empty tree. This allows iova_tree_alloc to have the
> > same code path both if the three is empty or not.
> >
> > But I can add the use cases in the doc for sure.
>
> Ah, right.
>
> >
> > > > + *
> > > > + * @args Arguments to allocation
> > > > + */
> > > > +static bool iova_tree_alloc_map_in_hole(const struct IOVATreeAllocArgs *args)
> > > > +{
> > > > +    const DMAMap *left = args->hole_left, *right = args->hole_right;
> > > > +    uint64_t hole_start, hole_last;
> > > > +
> > > > +    if (right && right->iova + right->size < args->iova_begin) {
> > > > +        return false;
> > > > +    }
> > > > +
> > > > +    if (left && left->iova > args->iova_last) {
> > > > +        return false;
> > > > +    }
> > > > +
> > > > +    hole_start = MAX(left ? left->iova + left->size + 1 : 0, args->iova_begin);
> > > > +    hole_last = MIN(right ? right->iova : HWADDR_MAX, args->iova_last);
> > >
> > > I assume these values should be always inclusive, hence
> > >
> > > s/right->iova/right->iova + 1/
> > >
> > > ?
> > >
> >
> > Right, it is confusing the way it's written. But I think it should be
> > right->iova - 1 in any case to make it the hole last element, isn't
> > it?
>
> I was thinking "-1" but I failed to make it coherent with the thought when
> typing.. Heh.
>
> >
> > Would it work better to rename variable hole_last to hole_end? If not,
> > we have a special case of the second allocation when iova_begin == 0:
> > - We successfully allocate a DMAMap of size N. By the way the
> > algorithm works,  it starts at 0, so [0, N] is allocated.
>
> If we're always talking about inclusive ranges, shouldn't it be [0, N-1]?
>

I meant DMAMap size, which is already inclusive.

> > - We try to allocate a second one of size M. At the first iteration,
> > "right" is the previously allocated DMAMap.
> > Using the -1 trick we get hole_end == HWADDR_MAX.
>
> I'm not sure I get the point, but both naming look fine to me.  As long as we
> use inclusive ranges, then hole_end/last will be limited to HWADDR_MAX.
>

Sorry, I think you were right from the beginning, because with _end we
cannot handle the case of right == NULL well. I'll rewrite with the
-1, taking into account the underflow.

Please let me know if you have more concerns or you come up with more
ideas to improve the patch.

Thanks!

> > > > +static gboolean iova_tree_alloc_traverse(gpointer key, gpointer value,
> > > > +                                         gpointer pargs)
> > > > +{
> > > > +    struct IOVATreeAllocArgs *args = pargs;
> > > > +    DMAMap *node = value;
> > > > +
> > > > +    assert(key == value);
> > > > +
> > > > +    iova_tree_alloc_args_iterate(args, node);
> > > > +    if (args->hole_left && args->hole_left->iova > args->iova_last) {
> > >
> > > IMHO this check is redundant and can be dropped, as it's already done in
> > > iova_tree_alloc_map_in_hole().
> > >
> >
> > Assuming we add "iova_found" to iova_tree_alloc_map_in_hole to
> > IOVATreeAllocArgs as you propose, it returns true if we are able to
> > allocate a DMAMap entry, so no more iterations are needed. But if it
> > returns false, it simply means that DMAMap cannot be allocated between
> > left (or iova_begin) and right (iova_end). It doesn't tell if you can
> > keep iterating or not. In other words, false == keep iterating if you
> > can.
> >
> > This other check signals the end of the available hole, and to avoid
> > iterating beyond iova_last in the (unlikely?) case we have more nodes
> > to iterate beyond that.
> >
> > I'll try to make it more explicit.
>
> Makes sense.  Comment works.
>
> Thanks,
>
> --
> Peter Xu
>


