Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7752E17D2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 04:41:17 +0100 (CET)
Received: from localhost ([::1]:45790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krv1X-0007Sy-Kd
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 22:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1kruzf-0006w1-Ki
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 22:39:21 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:33399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1kruzV-0000Fj-7R
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 22:39:19 -0500
Received: by mail-lf1-x12b.google.com with SMTP id l11so36988574lfg.0
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 19:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O+L5nyOzWWMqEdUIpe5JXr21QALODnzsWLxiUcKPjas=;
 b=dDs6JYxVtvejeDtqdCy8ki6p1iBg9mDU8NZZHInY3C+LMOelK3F2qW3IH1YRqmrRjW
 voieSGd4gDv9lEMtFNur1Vq9EXfuvdnu+/AAO77kG4oV9kgogGzl9kkynw+VXBTDkWT8
 fr/X6AEk1ujIjFVjwgI4d8NJ/OpP7Wzdw2xQvSdfKxVHuuBEJAMUHeKDXqJWWlDqm7mc
 apz0UZcFLtdyfZMpuYg14Kyd9qIZRsTHBzZGoquSZYmX9YPZlhopnmYPpAF7WshCx5jX
 0orYS69921A/GYVFHzhWp1OLpKc+tDkiwkbU2hnjHoAwrye1fQ/rp85UfPPXKerQ4Uqc
 Ut+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O+L5nyOzWWMqEdUIpe5JXr21QALODnzsWLxiUcKPjas=;
 b=i4hNgJNr2+rblQRtoNOPGVHBnu/fq917QKcf0n8qPn10bZxrX549TjT8oPrldxL4Ca
 +g/2U3xZFB1P393CI7S1fjPHAkjluluBYq5sVtZOiTEx+Jbm3cKioFupKy43M+kH4EW9
 A1ZAmCPnJSRGD36uIjg/divOd/K58y18VnBv3aFCgT9cghm3vohkFLK5v1td9rdD354s
 LsE2Chp7JrBW6aHJ97uejtngwJS8wwGv89Ye3ykzCcsfqXvUf8tC+ZkEVuqSbypuCR1j
 SV4xHLB1sxhaqxApjGekTAL5M70L0N2Zv3eH/j+tvTbNIKttqGxNDk1u4rBm3FCp+sWz
 yC7g==
X-Gm-Message-State: AOAM531UtTJqyTrMweIdgNVNyHkDIQUTXLzVUzfU+eyTKHHBkPBv5Tml
 WEklUzBbdr6DgH6ttpKGJ1qs3GyxHWWXI6eeFpE=
X-Google-Smtp-Source: ABdhPJymzrqQQDUgKITWsNcm3WJsGpsxFXvhUrlb5SiuxiXJIHgzuljNms0LEFw873DDo+wDJ63ogvZ4tGhx++pgMSc=
X-Received: by 2002:a05:651c:1068:: with SMTP id
 y8mr10587775ljm.76.1608694746482; 
 Tue, 22 Dec 2020 19:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20201222074656.GA30035@open-light-1.localdomain>
 <CAKgT0Ucs4pv0+rcPi41uNDrav0sgOmLnVaD4NNWkg7=gncidnQ@mail.gmail.com>
In-Reply-To: <CAKgT0Ucs4pv0+rcPi41uNDrav0sgOmLnVaD4NNWkg7=gncidnQ@mail.gmail.com>
From: Liang Li <liliang324@gmail.com>
Date: Wed, 23 Dec 2020 11:38:54 +0800
Message-ID: <CA+2MQi_b98v+vS9J+FnovPe5avNv4WSeD2KoQycdQAG4c3Hxpg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] mm: support hugetlb free page reporting
To: Alexander Duyck <alexander.duyck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=liliang324@gmail.com; helo=mail-lf1-x12b.google.com
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
 Dan Williams <dan.j.williams@intel.com>, Liang Li <liliangleo@didiglobal.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Dave Hansen <dave.hansen@intel.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > +hugepage_reporting_cycle(struct page_reporting_dev_info *prdev,
> > +                        struct hstate *h, unsigned int nid,
> > +                        struct scatterlist *sgl, unsigned int *offset)
> > +{
> > +       struct list_head *list = &h->hugepage_freelists[nid];
> > +       unsigned int page_len = PAGE_SIZE << h->order;
> > +       struct page *page, *next;
> > +       long budget;
> > +       int ret = 0, scan_cnt = 0;
> > +
> > +       /*
> > +        * Perform early check, if free area is empty there is
> > +        * nothing to process so we can skip this free_list.
> > +        */
> > +       if (list_empty(list))
> > +               return ret;
> > +
> > +       spin_lock_irq(&hugetlb_lock);
> > +
> > +       if (huge_page_order(h) > MAX_ORDER)
> > +               budget = HUGEPAGE_REPORTING_CAPACITY;
> > +       else
> > +               budget = HUGEPAGE_REPORTING_CAPACITY * 32;
>
> Wouldn't huge_page_order always be more than MAX_ORDER? Seems like we
> don't even really need budget since this should probably be pulling
> out no more than one hugepage at a time.

I want to disting a 2M page and 1GB page here. The order of 1GB page is greater
than MAX_ORDER while 2M page's order is less than MAX_ORDER.

>
> > +       /* loop through free list adding unreported pages to sg list */
> > +       list_for_each_entry_safe(page, next, list, lru) {
> > +               /* We are going to skip over the reported pages. */
> > +               if (PageReported(page)) {
> > +                       if (++scan_cnt >= MAX_SCAN_NUM) {
> > +                               ret = scan_cnt;
> > +                               break;
> > +                       }
> > +                       continue;
> > +               }
> > +
>
> It would probably have been better to place this set before your new
> set. I don't see your new set necessarily being the best use for page
> reporting.

I haven't really latched on to what you mean, could you explain it again?

>
> > +               /*
> > +                * If we fully consumed our budget then update our
> > +                * state to indicate that we are requesting additional
> > +                * processing and exit this list.
> > +                */
> > +               if (budget < 0) {
> > +                       atomic_set(&prdev->state, PAGE_REPORTING_REQUESTED);
> > +                       next = page;
> > +                       break;
> > +               }
> > +
>
> If budget is only ever going to be 1 then we probably could just look
> at making this the default case for any time we find a non-reported
> page.

and here again.

> > +               /* Attempt to pull page from list and place in scatterlist */
> > +               if (*offset) {
> > +                       isolate_free_huge_page(page, h, nid);
> > +                       /* Add page to scatter list */
> > +                       --(*offset);
> > +                       sg_set_page(&sgl[*offset], page, page_len, 0);
> > +
> > +                       continue;
> > +               }
> > +
>
> There is no point in the continue case if we only have a budget of 1.
> We should probably just tighten up the loop so that all it does is
> search until it finds the 1 page it can pull, pull it, and then return
> it. The scatterlist doesn't serve much purpose and could be reduced to
> just a single entry.

I will think about it more.

> > +static int
> > +hugepage_reporting_process_hstate(struct page_reporting_dev_info *prdev,
> > +                           struct scatterlist *sgl, struct hstate *h)
> > +{
> > +       unsigned int leftover, offset = HUGEPAGE_REPORTING_CAPACITY;
> > +       int ret = 0, nid;
> > +
> > +       for (nid = 0; nid < MAX_NUMNODES; nid++) {
> > +               ret = hugepage_reporting_cycle(prdev, h, nid, sgl, &offset);
> > +
> > +               if (ret < 0)
> > +                       return ret;
> > +       }
> > +
> > +       /* report the leftover pages before going idle */
> > +       leftover = HUGEPAGE_REPORTING_CAPACITY - offset;
> > +       if (leftover) {
> > +               sgl = &sgl[offset];
> > +               ret = prdev->report(prdev, sgl, leftover);
> > +
> > +               /* flush any remaining pages out from the last report */
> > +               spin_lock_irq(&hugetlb_lock);
> > +               hugepage_reporting_drain(prdev, h, sgl, leftover, !ret);
> > +               spin_unlock_irq(&hugetlb_lock);
> > +       }
> > +
> > +       return ret;
> > +}
> > +
>
> If HUGEPAGE_REPORTING_CAPACITY is 1 it would make more sense to
> rewrite this code to just optimize for a find and process a page
> approach rather than trying to batch pages.

Yes, I will make a change. Thanks for your comments!

Liang

