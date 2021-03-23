Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDFB346A6E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:51:01 +0100 (CET)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOnzQ-0004nn-I4
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOnxq-0003Y0-18
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:49:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOnxn-0006Bp-OM
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616532558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gFyVsCQrO3xobrTW7ynKM07DeLLQX5NqmNrdWGkoatw=;
 b=Ta9Ub4WbI9eO4AMgLME2MQtgyxWM7qQUsZdAQgiCU8OZPpSLPnt3XfmKYk904geqVUXxRg
 tOX5v8nXQZpgb25magc8E8jbkaDDajICOWP0LVQkBMOS2L4U9h3Ud+igfFLPKTOQAHNiaw
 xW17QF2+FrASF857oy+xmzEgEUENyNc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-kTylnBfVNuCNjw4LbZo-iQ-1; Tue, 23 Mar 2021 16:49:16 -0400
X-MC-Unique: kTylnBfVNuCNjw4LbZo-iQ-1
Received: by mail-qt1-f197.google.com with SMTP id c20so1988211qtw.9
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 13:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gFyVsCQrO3xobrTW7ynKM07DeLLQX5NqmNrdWGkoatw=;
 b=A+PSs3Y/gUdvI69hsgMCxvFjSl190kt1zTB4uD5gxvxwVUsKSVe0xb7Mr/XoqtSevY
 xOevu8qPiPEDt1tFkk6EctSkFtxn/ERzutZURvjbd2EU/wczTRCaVV50Hdtc82RuMrl0
 cjiHgBmTz+DV1MMYQC3+lduBaT6KjlYyyhAskVVjFGIZxC7n7N+njvM+eMu24Sy0zKX7
 KwTNwfRMEefeMZGn/h8R35XtQHnkPKy1jMqjLolOTXzZYTrtJ1ZMGQ0wDjgZgSxk9mse
 heRf3/4azAzV8E/qscxX5C/fWZGsBqf9IkZwy/ZQzdRbs0S09uFei/JCSgOpj5YR0Tbu
 OWnQ==
X-Gm-Message-State: AOAM530WNVQsm1/5KuEZ1KeBkowl8+EsQx5KPIfVDLSTHvK+7bTd7a25
 pDmfUo9L8Q7CUZZ4s0F7phLFqf4UjQ3A3gXWkZ8GH/Gv1nC120x0sPeqQSUjskwMphbGNmixT/w
 PAU1bAF78Pzpz6ZE=
X-Received: by 2002:a05:622a:1654:: with SMTP id
 y20mr172342qtj.364.1616532555961; 
 Tue, 23 Mar 2021 13:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyn0KKKgIGr1kGRiGAdas3Dp/LCqWbt1HyvZ0N2JHIwSx9u8bJCahFR8XidwEm0cT0eQxYDQ==
X-Received: by 2002:a05:622a:1654:: with SMTP id
 y20mr172321qtj.364.1616532555704; 
 Tue, 23 Mar 2021 13:49:15 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id r17sm51811qtn.25.2021.03.23.13.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 13:49:15 -0700 (PDT)
Date: Tue, 23 Mar 2021 16:49:13 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 09/14] util/mmap-alloc: Pass flags instead of separate
 bools to qemu_ram_mmap()
Message-ID: <20210323204913.GL6486@xz-x1>
References: <20210319101230.21531-1-david@redhat.com>
 <20210319101230.21531-10-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210319101230.21531-10-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 11:12:25AM +0100, David Hildenbrand wrote:
> Let's pass flags instead of bools to prepare for passing other flags and
> update the documentation of qemu_ram_mmap(). Introduce new QEMU_MAP_
> flags that abstract the mmap() PROT_ and MAP_ flag handling and simplify
> it.
> 
> We expose only flags that are currently supported by qemu_ram_mmap().
> Maybe, we'll see qemu_mmap() in the future as well that can implement these
> flags.
> 
> Note: We don't use MAP_ flags as some flags (e.g., MAP_SYNC) are only
> defined for some systems and we want to always be able to identify
> these flags reliably inside qemu_ram_mmap() -- for example, to properly
> warn when some future flags are not available or effective on a system.
> Also, this way we can simplify PROT_ handling as well.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/qemu/mmap-alloc.h | 16 +++++++++-------
>  include/qemu/osdep.h      | 18 ++++++++++++++++++
>  softmmu/physmem.c         |  8 +++++---
>  util/mmap-alloc.c         | 15 ++++++++-------
>  util/oslib-posix.c        |  3 ++-
>  5 files changed, 42 insertions(+), 18 deletions(-)
> 
> diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
> index 456ff87df1..a60a2085b3 100644
> --- a/include/qemu/mmap-alloc.h
> +++ b/include/qemu/mmap-alloc.h
> @@ -7,18 +7,22 @@ size_t qemu_fd_getpagesize(int fd);
>  size_t qemu_mempath_getpagesize(const char *mem_path);
>  
>  /**
> - * qemu_ram_mmap: mmap the specified file or device.
> + * qemu_ram_mmap: mmap anonymous memory, the specified file or device.
> + *
> + * mmap() abstraction to map guest RAM, simplifying flag handling, taking
> + * care of alignment requirements and installing guard pages.
>   *
>   * Parameters:
>   *  @fd: the file or the device to mmap
>   *  @size: the number of bytes to be mmaped
>   *  @align: if not zero, specify the alignment of the starting mapping address;
>   *          otherwise, the alignment in use will be determined by QEMU.
> - *  @readonly: true for a read-only mapping, false for read/write.
> - *  @shared: map has RAM_SHARED flag.
> - *  @is_pmem: map has RAM_PMEM flag.
> + *  @qemu_map_flags: QEMU_MAP_* flags
>   *  @map_offset: map starts at offset of map_offset from the start of fd
>   *
> + * Internally, MAP PRIVATE, MAP_ANONYMOUS and MAP_SHARED_VALIDATE are set
                     ^
                     |
                     +---- underscore

> + * implicitly based on other parameters.
> + *

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


