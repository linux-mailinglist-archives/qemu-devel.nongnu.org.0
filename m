Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD72E236B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 02:34:43 +0100 (CET)
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksFWb-00070C-J8
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 20:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1ksFTd-0006Um-Hd
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 20:31:37 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:32895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1ksFTb-0001rT-I7
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 20:31:37 -0500
Received: by mail-lf1-x136.google.com with SMTP id l11so1668785lfg.0
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 17:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ylr8xtf0vRN/65EDusgs3mZeJJKO/MAb2WdRIppjm8=;
 b=ZV8b8FbD8TZ+50o8AlHdgL2kIgkNMvx3LcjGzyZAsPuEMA5CNGfZyMP42jf59G8GcA
 tfP+6Egyecm0W5A3t3olaLiu22+SWaHeAz3DJi3oYyjuWwVOpOIOcoSxYbJHEgLDcuSS
 z5V2vCaoE0IcDE0LkHffO+li2Qr4KVhUEU09Ixf8a5qy4UQBWUVv0sr1V5GYSzQx38iV
 rp05h/UT506EY6YXwo2ppzxhkjMvFkeW/yEVhAgWa3PhzQaiX0lOt6YelYkyTj06NB2/
 gbS8IFmMhBHLxOYXDgBo9VSfQoezSICh4YRiWEz5Qx0geh5rFAr/dfK/j8NUy6xf1l7g
 mjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ylr8xtf0vRN/65EDusgs3mZeJJKO/MAb2WdRIppjm8=;
 b=IxFQLobNuZcvuJNWH8UsUrCBGvJYvVvR6gvjrDcAp3V9ULOWfWzqqRwPM2MGTyZcp/
 y181u4K/8yZnNzBUO//dBQkRlPMzFPmljKj8aDKi81LI/OKoncf8Xj/yFjfA+VtrG4fg
 ogn3XIIq8pTRfWhUiYz9vCKG4T8t6S0qIdjCgo/M60prODLDv6zaOm9MMHQPG4ENTm1W
 Gpdi76Ct0VIyVPDdrWQP4dL1XyJzlEzqHqP0hpcpoJZbV0qUvsj8ZENqfwSkaUNbA6lX
 CTARfDFpiAHDNXxjyPbRXmwkw+HaMCnYQE2dN1wtEm9ZOpmMjixnAXANz3vcCWmRoIKt
 2i5Q==
X-Gm-Message-State: AOAM530iJyS5TYhXKwohEwi3TDyilr2l8jCSxjwcLQStfTQ6MdS+KkNA
 G7HMpLudaRSYPa/27AYiJPial2W00jQIySl2WJg=
X-Google-Smtp-Source: ABdhPJyEG+SjICWUo3m2UZWlLl0MO437nGTfmoHzp8M/Z0PaDq7bPPDKbJxvN7AIsNn5Z4VtDFOo7tJri5HZhvYInsM=
X-Received: by 2002:a19:814c:: with SMTP id c73mr11053100lfd.638.1608773493512; 
 Wed, 23 Dec 2020 17:31:33 -0800 (PST)
MIME-Version: 1.0
References: <20201222074656.GA30035@open-light-1.localdomain>
 <63318bf1-21ea-7202-e060-b4b2517c684e@oracle.com>
 <CA+2MQi_QDnnsbMdOH5B4Hhak-CWA-Xs6PLhxoGq2f+Vv13sgyg@mail.gmail.com>
 <e9d835e1-5d7f-d0ca-bf42-1cfa64416db6@oracle.com>
In-Reply-To: <e9d835e1-5d7f-d0ca-bf42-1cfa64416db6@oracle.com>
From: Liang Li <liliang324@gmail.com>
Date: Thu, 24 Dec 2020 09:31:21 +0800
Message-ID: <CA+2MQi_bxnzgS+S=GqL7UCYUKqAHZ7VC_ZTHCHcfrBHPsY+9Pg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] mm: support hugetlb free page reporting
To: Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=liliang324@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Liang Li <liliangleo@didiglobal.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Dave Hansen <dave.hansen@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org,
 Mel Gorman <mgorman@techsingularity.net>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >>> +static int
> >>> +hugepage_reporting_cycle(struct page_reporting_dev_info *prdev,
> >>> +                      struct hstate *h, unsigned int nid,
> >>> +                      struct scatterlist *sgl, unsigned int *offset)
> >>> +{
> >>> +     struct list_head *list = &h->hugepage_freelists[nid];
> >>> +     unsigned int page_len = PAGE_SIZE << h->order;
> >>> +     struct page *page, *next;
> >>> +     long budget;
> >>> +     int ret = 0, scan_cnt = 0;
> >>> +
> >>> +     /*
> >>> +      * Perform early check, if free area is empty there is
> >>> +      * nothing to process so we can skip this free_list.
> >>> +      */
> >>> +     if (list_empty(list))
> >>> +             return ret;
> >>
> >> Do note that not all entries on the hugetlb free lists are free.  Reserved
> >> entries are also on the free list.  The actual number of free entries is
> >> 'h->free_huge_pages - h->resv_huge_pages'.
> >> Is the intention to process reserved pages as well as free pages?
> >
> > Yes, Reserved pages was treated as 'free pages'
>
> If that is true, then this code breaks hugetlb.  hugetlb code assumes that
> h->free_huge_pages is ALWAYS >= h->resv_huge_pages.  This code would break
> that assumption.  If you really want to add support for hugetlb pages, then
> you will need to take reserved pages into account.

I didn't know that. thanks!

> P.S. There might be some confusion about 'reservations' based on the
> commit message.  My comments are directed at hugetlb reservations described
> in Documentation/vm/hugetlbfs_reserv.rst.
>
> >>> +             /* Attempt to pull page from list and place in scatterlist */
> >>> +             if (*offset) {
> >>> +                     isolate_free_huge_page(page, h, nid);
> >>
> >> Once a hugetlb page is isolated, it can not be used and applications that
> >> depend on hugetlb pages can start to fail.
> >> I assume that is acceptable/expected behavior.  Correct?
> >> On some systems, hugetlb pages are a precious resource and the sysadmin
> >> carefully configures the number needed by applications.  Removing a hugetlb
> >> page (even for a very short period of time) could cause serious application
> >> failure.
> >
> > That' true, especially for 1G pages. Any suggestions?
> > Let the hugepage allocator be aware of this situation and retry ?
>
> I would hate to add that complexity to the allocator.
>
> This question is likely based on my lack of understanding of virtio-balloon
> usage and this reporting mechanism.  But, why do the hugetlb pages have to
> be 'temporarily' allocated for reporting purposes?

The link here will give your more detail about how page reporting
works, https://www.kernel.org/doc/html/latest//vm/free_page_reporting.html
the virtio-balloon driver is based on this framework and will report the
free pages information to QEMU&KVM, host can unmap the memory
region corresponding to reported free pages and reclaim the memory
for other use, it's useful for memory overcommit.
Allocated the pages 'temporarily' before reporting is necessary, it make
sure guests will not use the page when the host side unmap the region.
or it will break the guest.

Now I realized we should solve this issue first, it seems adding a lock
will help.

Thanks

