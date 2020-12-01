Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280EE2CABD7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:24:50 +0100 (CET)
Received: from localhost ([::1]:58918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkBGa-0005l3-TY
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kkBEu-0005Hy-3K
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kkBEr-0004NQ-5S
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606850580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lM8h7rRYrLt35OQZALWfHVM+Gp2wjFmtevJ17Xuxp00=;
 b=GZjR0SHPGpLEpiHxDn29H2+H5WLXXMf9R8Jj5TubDo940t3ZCkHgWKdzLP4n7lcvJeFX+b
 yca1GW30+9aJPlPVX+hoY8pHEFU8BpelHd1nW0tjDdadoiE43ifjE3sLOTPO0HE3vo/H/V
 M81Eo8Maw8EXybD29GHafEcgAS/ZWKY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201--OF2kijHMWuA8jufMppYiA-1; Tue, 01 Dec 2020 14:22:56 -0500
X-MC-Unique: -OF2kijHMWuA8jufMppYiA-1
Received: by mail-qt1-f199.google.com with SMTP id v18so2007822qta.22
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lM8h7rRYrLt35OQZALWfHVM+Gp2wjFmtevJ17Xuxp00=;
 b=ZRArrNAI6nX20mc8DHfEvJaRg+yewQ9OdqOOQkihodXoq8tTIfOsrbfcjCSqqlgWx8
 Gjfnck38NZbLYl7bc0qJ0yzVtgEttjq6G2gNIUhQhcgwfb2odeo6R2man5BLfjsYbX9+
 179zCjQSRsHLYVSzjDyngLEBzqkIh66xB+f+/f1JoP0VMdwiP+l0n/fFdU95Gi7dmExq
 L4ipZEgM4FqVcccKni1p/4kkKJUjaEmKSPYG2+V+3Y11LikJ2KYdIWHYG0ZIHvbJGYSG
 dm7SvoPI5OwVm0MVWSw5i72LOWZyCSnx49Dx1sEqyNpx88NMCd+lTca3Fvs/AnIeZIb+
 2Mlg==
X-Gm-Message-State: AOAM5328IeSi3mdkUXx1kK3EA0uvpmdfft88OMlLgFpsM9wk1OnOH2k9
 g/HqB0w9TT8REitgrjaBHFzV+1DD15VRrjteyLJRfEp+5O9atQk+Js6thZVZymipWpdSAprrSsc
 66COl46zbBI75MsI=
X-Received: by 2002:a0c:a802:: with SMTP id w2mr4807365qva.9.1606850576142;
 Tue, 01 Dec 2020 11:22:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8EbvzeV1xchvEvE1scyK4QHRZJ+wEwFolrTtT59brs1yQgF4UAWXPUswq9Lkn1MhOlj8tLQ==
X-Received: by 2002:a0c:a802:: with SMTP id w2mr4807352qva.9.1606850575906;
 Tue, 01 Dec 2020 11:22:55 -0800 (PST)
Received: from xz-x1 ([142.126.94.187])
 by smtp.gmail.com with ESMTPSA id j4sm323988qtq.42.2020.12.01.11.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:22:55 -0800 (PST)
Date: Tue, 1 Dec 2020 14:22:47 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
Message-ID: <20201201192247.GF3277@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201201070820.GO105758@angien.pipo.sk>
 <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
 <20201201105300.GQ105758@angien.pipo.sk>
 <d3b0c767-14d8-b7e7-345d-0314acb3d07e@virtuozzo.com>
 <20201201184055.GM4338@work-vm>
MIME-Version: 1.0
In-Reply-To: <20201201184055.GM4338@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Krempa <pkrempa@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 01, 2020 at 06:40:55PM +0000, Dr. David Alan Gilbert wrote:
> > Yep, seems that current userfaultfd supports hugetlbfs and shared memory for
> > missing pages but not for wr-protected..
> 
> For hugepages, you'd need kernel support - but also you'd want to make
> sure you write the whole hugepage at once.

Or we can do similar things by splitting the huge pages just like when we
migrate.

I should have overlooked these facts when I replied previusly - we do need the
same logic, but also special care on these special memory types.

> 
> For shared, there's a harder problem to ask; what happens if RAM is
> written by the other process - for postcopy, we get the other process
> to send us a userfaultfd that they have registered with their VM.

Good point... so we should need similar things too.

Looks like we'd better explicitly disable shmem/hugetlbfs for now from qemu
background snapshots before we have prepared these utilities, just in case it
got run on some "future" kernels and accidentally got enabled, so the snapshot
files could be corrupted ones.

Is shmem used a lot in libvirt, or is it even a default configuration?

-- 
Peter Xu


