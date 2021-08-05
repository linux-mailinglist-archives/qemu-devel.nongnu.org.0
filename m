Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DAE3E0FA1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 09:50:49 +0200 (CEST)
Received: from localhost ([::1]:49148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBY9Q-0006hx-N6
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 03:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBY7Y-0004LW-7h
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:48:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mBY7W-0002ag-L3
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628149730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CcDBk7GZxgB8bFAKx8hY0L3+6fDnaDfWDM0bE8SjWGg=;
 b=MZ5n+klZuCcbp3/enLwUz8q6gDlZb7RHoZiBZEsT03qZMrda01YduUxE4t+oxJWpkW6/KJ
 rB7HGex/J/iOxx7MpitqZJIjkAr/n34nxbPF5VsHHqUqadgVBD2yxPx/oZA9BlNiU1T70+
 2Oeb4o8d0dZQ6j9UjrofargEDuMBKAA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-moRneOInMAGiAj6iUg0N0Q-1; Thu, 05 Aug 2021 03:48:49 -0400
X-MC-Unique: moRneOInMAGiAj6iUg0N0Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 p12-20020a5d68cc0000b02901426384855aso1624127wrw.11
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 00:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CcDBk7GZxgB8bFAKx8hY0L3+6fDnaDfWDM0bE8SjWGg=;
 b=FsIG2gU/v2reBNQYAi6pZgVIw9pocRIXTDATtjnsitKBZjX8UcldLtkcwHl9jnTWUq
 kYyay3/6H6nobY3aEQHrB/jqnBGljyhUd+5KFnh9XMsEIDQsYn0suOzxlsgvcnrsRFtR
 /ob9+XU91yqkE+Ih9NIk27M46bVnJTBfAu8pQY/swtzAFclMdfL+jiGXd4UDgmSckJOS
 3bn2O47KGEE3+X/yE6K628aFjZtz+V/d8j5/ZRHNe7DfjSJI29Lchym5YS1qUELZY3Z7
 03id6K5lTNuQeoe6tOoknOlY6XH+VJQvf9DP8kpH9Ech1Em0rWN2jcGUkhQ/mXxKUUmT
 iLdg==
X-Gm-Message-State: AOAM530Pb+zZZ4IarbgeJ6+a8zwIrSxmoMgVK1Mayv628BuCcWyHDW4w
 dt7uYn53ZmiZbPtLeMN2Lp7RfuEKM8z48W7+NG311aoXUJ6lq2tFn1fk7TIWbVbc6A2H2xLgUo0
 eypmALtT6+weuyEE=
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr13584129wmb.178.1628149727878; 
 Thu, 05 Aug 2021 00:48:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx28coKpYTwrLEmC0d46C9+/FuRd1DckBUG+ocWI+n3blVtw7Q1zSwhrc0P/37GZuqR6jWfVw==
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr13584112wmb.178.1628149727729; 
 Thu, 05 Aug 2021 00:48:47 -0700 (PDT)
Received: from [192.168.43.238] (166.red-193-152-126.dynamicip.rima-tde.net.
 [193.152.126.166])
 by smtp.gmail.com with ESMTPSA id n30sm6025601wra.1.2021.08.05.00.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 00:48:47 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210730085249.8246-1-david@redhat.com>
 <20210730085249.8246-7-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5f8c6173-046d-9fc2-c649-93ede45ca77d@redhat.com>
Date: Thu, 5 Aug 2021 09:48:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730085249.8246-7-david@redhat.com>
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
> Currently, when someone (i.e., the VM) accesses discarded parts inside a
> RAMBlock with a RamDiscardManager managing the corresponding mapped memory
> region, postcopy will request migration of the corresponding page from the
> source. The source, however, will never answer, because it refuses to
> migrate such pages with undefined content ("logically unplugged"): the
> pages are never dirty, and get_queued_page() will consequently skip
> processing these postcopy requests.
> 
> Especially reading discarded ("logically unplugged") ranges is supposed to
> work in some setups (for example with current virtio-mem), although it
> barely ever happens: still, not placing a page would currently stall the
> VM, as it cannot make forward progress.
> 
> Let's check the state via the RamDiscardManager (the state e.g.,
> of virtio-mem is migrated during precopy) and avoid sending a request
> that will never get answered. Place a fresh zero page instead to keep
> the VM working. This is the same behavior that would happen
> automatically without userfaultfd being active, when accessing virtual
> memory regions without populated pages -- "populate on demand".
> 
> For now, there are valid cases (as documented in the virtio-mem spec) where
> a VM might read discarded memory; in the future, we will disallow that.
> Then, we might want to handle that case differently, e.g., warning the
> user that the VM seems to be mis-behaving.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  migration/postcopy-ram.c | 31 +++++++++++++++++++++++++++----
>  migration/ram.c          | 21 +++++++++++++++++++++
>  migration/ram.h          |  1 +
>  3 files changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 2e9697bdd2..38cdfc09c3 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -671,6 +671,29 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
>      return ret;
>  }
>  
> +static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
> +                                 ram_addr_t start, uint64_t haddr)
> +{
> +    void *aligned = (void *)(uintptr_t)(haddr & -qemu_ram_pagesize(rb));

  void *aligned = QEMU_ALIGN_PTR_DOWN(haddr, qemu_ram_pagesize(rb)));


