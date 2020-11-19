Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33022B9C4A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 21:54:09 +0100 (CET)
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfqwS-0007sw-Ed
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 15:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfqdb-0003eq-JL
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:34:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfqdZ-0000ZF-9F
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605818075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P6DVv6OX8ZbFqpMeWwlCSI84qBvD/MtgVX6Ju5UVVdI=;
 b=EBwaYbY+hWQKCFlrC+JJq9SaZnNQ1u0AbP22F+bDRUoj5VtJvLJFEUo0RkjZ3tiCkONVF/
 tEtHM4sBrgCq+hglM1t+sxoSa2PequMeT3ZfFWBCyBHlxIsX4c5D9X/kHK7UI3glj6kY83
 xT3NHBZVq8eZYAlcBSH1kKoxp+ziTBY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-A4wuVSh6NomoX4UAL_q_1w-1; Thu, 19 Nov 2020 15:34:33 -0500
X-MC-Unique: A4wuVSh6NomoX4UAL_q_1w-1
Received: by mail-qk1-f200.google.com with SMTP id q25so6021630qkm.17
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 12:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P6DVv6OX8ZbFqpMeWwlCSI84qBvD/MtgVX6Ju5UVVdI=;
 b=rj+A8wPdI9SURm71NiltgEPaDp9MYIE0hbVilgFXBTiPLSlNaewgFlyGeVgjzC/eFz
 fs8xNdWBvY2r674D5+5/ZePWnLhj67mW2FMOPmITmxMogF0y79UqPBRyIIu/ZplZVngW
 afA2A3ZF/FJpEiidJWcwibF/MbRK1h3w8bTrbOvdvkZKU++R9e4v4wVz+8i+eVPnNhYa
 O4iYYW6udgldYx3RVt3ZIerz4hja1cyrPyy0aA9h2fzxjT6Oeu+pL7vyW155RkbOzFCe
 BZCt+/H+B3jxg3CCE4OUGwPkE0+gwu46M8aiy8KcB/Dprl+v+h6y8LcUdA4KyH8SsQ3g
 ZBLA==
X-Gm-Message-State: AOAM531cQMJFaBJUMrb7YYhBPcOoUI9/OhN/s+TMHcvyl7DzjNxp0M+h
 TP4b9kRVO9CA3+nv4P2xmeZnZSHARtOQktkPKNDnLsiAl2Mrqf9/GAjZbdRSZqzy9EjnBcD8bzZ
 BqYe8Xb0g2dbRv9g=
X-Received: by 2002:ac8:6ec5:: with SMTP id f5mr12727672qtv.56.1605818073099; 
 Thu, 19 Nov 2020 12:34:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQU44E49+wrEjimavw5xan1K1Hhl4DQRI1RDna6kl0+ym/ZkbN3/W0/9GpVQ74xdW1QQHjTw==
X-Received: by 2002:ac8:6ec5:: with SMTP id f5mr12727637qtv.56.1605818072828; 
 Thu, 19 Nov 2020 12:34:32 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id z6sm600358qti.88.2020.11.19.12.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 12:34:31 -0800 (PST)
Date: Thu, 19 Nov 2020 15:34:30 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 6/9] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
Message-ID: <20201119203430.GA32525@xz-x1>
References: <20201119153918.120976-1-david@redhat.com>
 <20201119153918.120976-7-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201119153918.120976-7-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 04:39:15PM +0100, David Hildenbrand wrote:
>  int ram_block_discard_disable(bool state)
>  {
> -    int old;
> +    int ret = 0;
>  
> +    ram_block_discard_disable_mutex_lock();
>      if (!state) {
> -        qatomic_dec(&ram_block_discard_disabled);
> -        return 0;
> +        ram_block_discard_disablers--;
> +    } else if (!ram_block_discard_requirers) {
> +        ram_block_discard_disablers++;
> +    } else {
> +        ret = -EBUSY;
>      }

I would make things even easier by:

  if (ram_block_discard_is_required()) {
    return -EBUSY;
  }

  if (state) {
    ram_block_discard_disablers++;
  } else {
    ram_block_discard_disablers--;
  }

But I think it's kind of nitpicking. :)

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks for writing this patch.

-- 
Peter Xu


