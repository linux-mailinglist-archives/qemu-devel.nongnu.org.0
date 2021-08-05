Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758583E0FDA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 10:06:26 +0200 (CEST)
Received: from localhost ([::1]:55796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBYOX-0003c6-14
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 04:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBYMt-0002r1-94
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBYMq-0007t0-Qe
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628150679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOLKivnEVEF1ik6sxgd9Z7tgczu+9LZ/r+Dfq18u9yU=;
 b=R03Gx3ODT7zpzuxEovO8ovjfP6MCoY87ythVOuFHvSqL+AqEVfy3cJtZRT1tX6Y+DMPp11
 SFk6NRyhSgLfIgCzJoSsOF8WzFg2jZOGPhPgokniS2LwP+qSHAnElroNF28P2UV4y82+1r
 XLHxAciOmbWngUPASNi3P+qt3+9yQiw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-XKCzlZoUMTyEEDU1p44l6w-1; Thu, 05 Aug 2021 04:04:37 -0400
X-MC-Unique: XKCzlZoUMTyEEDU1p44l6w-1
Received: by mail-wm1-f70.google.com with SMTP id
 d72-20020a1c1d4b0000b029025164ff3ebfso2724883wmd.7
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 01:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bOLKivnEVEF1ik6sxgd9Z7tgczu+9LZ/r+Dfq18u9yU=;
 b=Llw5VvwSDlITv96heYN++aHPJrea5z05/6GnE6iXSmu6/dnz78N7mTujb64T9aTcgY
 v0LYLvn0Y+gQffw4tpj1STirNnBE9lUc5GrJjYAJWnv/v54wt9Y/yEsR0jVjOBt517hK
 w1Wb2nR/VcuN0BB3ditJFtADHB6CZz58iCK0vcsB97HYur24ZbW5dlb53IpuR4OY/WFa
 lZCiQ77CPhIVr3NoxKubYt5IJYDsK1EzL/HrX1D3nxhvCLvwDOydKV66veZKpjlGzfJz
 Tbc9jaaTzOUv41p66dW+XmiWmXEf9ebSo9iSCL1acT0M0fxKv3TULaFpXFOHHHTN4wPe
 WENQ==
X-Gm-Message-State: AOAM531YJ7puGbctBs7ZGzCwww+CQMGIMtUK565kriOt4+h1oTu4AvAX
 4uy2XbxAxO/KhDUCyX5Ps8pUueg6WOFTGF6KSWDth/Nnf2fb8GF/9d58AVIxydjOOJ2B2PII5KI
 UeWPVqshgDCJOgBc=
X-Received: by 2002:adf:8b86:: with SMTP id o6mr3637860wra.116.1628150676061; 
 Thu, 05 Aug 2021 01:04:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnXbdGf4bLZV3jor4yauvgely6EXXoLUlGUxDIn3tEtwNfiawcu0zO4Y0WxtTDG7Kh//Kmuw==
X-Received: by 2002:adf:8b86:: with SMTP id o6mr3637830wra.116.1628150675867; 
 Thu, 05 Aug 2021 01:04:35 -0700 (PDT)
Received: from [192.168.43.238] (166.red-193-152-126.dynamicip.rima-tde.net.
 [193.152.126.166])
 by smtp.gmail.com with ESMTPSA id q14sm5372710wrm.66.2021.08.05.01.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:04:34 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] migration/ram: Handle RAMBlocks with a
 RamDiscardManager on background snapshots
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-8-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fd43555b-5661-33a5-a4da-2a38939704f7@redhat.com>
Date: Thu, 5 Aug 2021 10:04:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730085249.8246-8-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 10:52 AM, David Hildenbrand wrote:
> We already don't ever migrate memory that corresponds to discarded ranges
> as managed by a RamDiscardManager responsible for the mapped memory region
> of the RAMBlock.
> 
> virtio-mem uses this mechanism to logically unplug parts of a RAMBlock.
> Right now, we still populate zeropages for the whole usable part of the
> RAMBlock, which is undesired because:
> 
> 1. Even populating the shared zeropage will result in memory getting
>    consumed for page tables.
> 2. Memory backends without a shared zeropage (like hugetlbfs and shmem)
>    will populate an actual, fresh page, resulting in an unintended
>    memory consumption.
> 
> Discarded ("logically unplugged") parts have to remain discarded. As
> these pages are never part of the migration stream, there is no need to
> track modifications via userfaultfd WP reliably for these parts.
> 
> Further, any writes to these ranges by the VM are invalid and the
> behavior is undefined.
> 
> Note that Linux only supports userfaultfd WP on private anonymous memory
> for now, which usually results in the shared zeropage getting populated.
> The issue will become more relevant once userfaultfd WP supports shmem
> and hugetlb.
> 
> Acked-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  migration/ram.c | 53 +++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 01cea01774..fd5949734e 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1639,6 +1639,28 @@ out:
>      return ret;
>  }
>  
> +static inline void populate_range(RAMBlock *block, hwaddr offset, hwaddr size)
> +{
> +    char *ptr = (char *) block->host;
> +
> +    for (; offset < size; offset += qemu_real_host_page_size) {
> +        char tmp = *(ptr + offset);
> +
> +        /* Don't optimize the read out */
> +        asm volatile("" : "+r" (tmp));
> +    }

This template is now used 3 times, a good opportunity to extract it as
an (inline?) helper.


