Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530972E1F8E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 17:41:48 +0100 (CET)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks7Cs-0003qy-QO
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 11:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1ks7B2-0002xI-Cm
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 11:39:52 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:36787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1ks7B0-0001oH-H8
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 11:39:52 -0500
Received: by mail-io1-xd35.google.com with SMTP id z136so15627134iof.3
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 08:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rVatYmYCMQJMPjerzko57jobHUoXj+DHRjujys0dqAg=;
 b=CMoRHJGuB1XkSbypZBbRm5Lmn/sYHKrrdSCLcYKUgSpGp/iIxUWpK7MqDlEpZGZ/ZD
 SMUgmlHBkjZAhgOYfKLrsAQQ2mMDkqHE13F3DRTjxTcGD7l658kjyqkYC81jcTfgm40h
 ngdZ8ggxsn4jQ9lLSvbc41CsNjCnD70y41Fcq+PlRGEb+3XfAxEra5cNugupWtTuptdk
 ZOJocOMNm0WBUDIT6NlQuhYN35JEon7iB0ECIKD+pwOL3niu5vO44NxBWPUa6+gdBhE6
 d31sf7OTkUeHc1/u00+DUii7nWaEIpW5kk/NmXqi4ND+8t/dRs77wgI+xsDHUWMmfyDt
 odyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rVatYmYCMQJMPjerzko57jobHUoXj+DHRjujys0dqAg=;
 b=D0cTXE5+jPb+paoPZj6RmaeDmOSA6Ap5B5vCbJV4kj9sWj+XGRwhOcFdoXjUARG00n
 shu8taRSPo2nt1CxUi+INh/fLBnZrxvXb7ppsE+g1W5PT5dqfYT+6dWUhXwOT2yGVUtM
 wvUlCT7QkyUAysD236bkdz01k5tpbqnJz+8sgdsaEgmRkuMQjCA4mX3XqkyEzmLt1czj
 3xat5fr/txxka9FAJTUeusjaFJgJLh99tFh6yo4ce5JS2rC/Nrugl2b+wG2mPb+2+hWr
 SCt1vuoppiof6SrIwl4Pr/AgrcKlWaNzeRmcaiOtiYFzwYtrXbnnrsc7T9holG4gfDfv
 qVPg==
X-Gm-Message-State: AOAM530pd+Dj9Esy5SlmvAFU2gA8PT3F977a2fAh4H/F7TwBR4Mfn3P3
 7BAGgUf0sWq65CJNDepod/KlY/P95iXDGC3mRhc=
X-Google-Smtp-Source: ABdhPJxyAnwmJZzZB1b22WrZzw7BIjDXYDFpaPAmxIgWuUHQ3FHGoOFNR3974ncYPlecPN6dclod2ICJWmOPjDwyEvk=
X-Received: by 2002:a02:5d85:: with SMTP id w127mr23645424jaa.83.1608741587758; 
 Wed, 23 Dec 2020 08:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20201222074656.GA30035@open-light-1.localdomain>
 <CAKgT0Ucs4pv0+rcPi41uNDrav0sgOmLnVaD4NNWkg7=gncidnQ@mail.gmail.com>
 <CA+2MQi_b98v+vS9J+FnovPe5avNv4WSeD2KoQycdQAG4c3Hxpg@mail.gmail.com>
In-Reply-To: <CA+2MQi_b98v+vS9J+FnovPe5avNv4WSeD2KoQycdQAG4c3Hxpg@mail.gmail.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 23 Dec 2020 08:39:36 -0800
Message-ID: <CAKgT0Ue2+eV22kAt-DmsTZqRvXGdxQXa8uVEbD0cmmFP22-r5A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] mm: support hugetlb free page reporting
To: Liang Li <liliang324@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alexander.duyck@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Dec 22, 2020 at 7:39 PM Liang Li <liliang324@gmail.com> wrote:
>
> > > +hugepage_reporting_cycle(struct page_reporting_dev_info *prdev,
> > > +                        struct hstate *h, unsigned int nid,
> > > +                        struct scatterlist *sgl, unsigned int *offset)
> > > +{
> > > +       struct list_head *list = &h->hugepage_freelists[nid];
> > > +       unsigned int page_len = PAGE_SIZE << h->order;
> > > +       struct page *page, *next;
> > > +       long budget;
> > > +       int ret = 0, scan_cnt = 0;
> > > +
> > > +       /*
> > > +        * Perform early check, if free area is empty there is
> > > +        * nothing to process so we can skip this free_list.
> > > +        */
> > > +       if (list_empty(list))
> > > +               return ret;
> > > +
> > > +       spin_lock_irq(&hugetlb_lock);
> > > +
> > > +       if (huge_page_order(h) > MAX_ORDER)
> > > +               budget = HUGEPAGE_REPORTING_CAPACITY;
> > > +       else
> > > +               budget = HUGEPAGE_REPORTING_CAPACITY * 32;
> >
> > Wouldn't huge_page_order always be more than MAX_ORDER? Seems like we
> > don't even really need budget since this should probably be pulling
> > out no more than one hugepage at a time.
>
> I want to disting a 2M page and 1GB page here. The order of 1GB page is greater
> than MAX_ORDER while 2M page's order is less than MAX_ORDER.

The budget here is broken. When I put the budget in page reporting it
was so that we wouldn't try to report all of the memory in a given
region. It is meant to hold us to no more than one pass through 1/16
of the free memory. So essentially we will be slowly processing all of
memory and it will take 16 calls (32 seconds) for us to process a
system that is sitting completely idle. It is meant to pace us so we
don't spend a ton of time doing work that will be undone, not to
prevent us from burying a CPU which is what seems to be implied here.

Using HUGEPAGE_REPORTING_CAPACITY makes no sense here. I was using it
in the original definition because it was how many pages we could
scoop out at a time and then I was aiming for a 16th of that. Here you
are arbitrarily squaring HUGEPAGE_REPORTING_CAPACITY in terms of the
amount of work you will doo since you are using it as a multiple
instead of a divisor.

> >
> > > +       /* loop through free list adding unreported pages to sg list */
> > > +       list_for_each_entry_safe(page, next, list, lru) {
> > > +               /* We are going to skip over the reported pages. */
> > > +               if (PageReported(page)) {
> > > +                       if (++scan_cnt >= MAX_SCAN_NUM) {
> > > +                               ret = scan_cnt;
> > > +                               break;
> > > +                       }
> > > +                       continue;
> > > +               }
> > > +
> >
> > It would probably have been better to place this set before your new
> > set. I don't see your new set necessarily being the best use for page
> > reporting.
>
> I haven't really latched on to what you mean, could you explain it again?

It would be better for you to spend time understanding how this patch
set works before you go about expanding it to do other things.
Mistakes like the budget one above kind of point out the fact that you
don't understand how this code was supposed to work and just kind of
shoehorned you page zeroing code onto it.

It would be better to look at trying to understand this code first
before you extend it to support your zeroing use case. So adding huge
pages first might make more sense than trying to zero and push the
order down. The fact is the page reporting extension should be minimal
for huge pages since they are just passed as a scatterlist so you
should only need to add a small bit to page_reporting.c to extend it
to support this use case.

> >
> > > +               /*
> > > +                * If we fully consumed our budget then update our
> > > +                * state to indicate that we are requesting additional
> > > +                * processing and exit this list.
> > > +                */
> > > +               if (budget < 0) {
> > > +                       atomic_set(&prdev->state, PAGE_REPORTING_REQUESTED);
> > > +                       next = page;
> > > +                       break;
> > > +               }
> > > +
> >
> > If budget is only ever going to be 1 then we probably could just look
> > at making this the default case for any time we find a non-reported
> > page.
>
> and here again.

It comes down to the fact that the changes you made have a significant
impact on how this is supposed to function. Reducing the scatterlist
to a size of one makes the whole point of doing batching kind of
pointless. Basically the code should be rewritten with the assumption
that if you find a page you report it.

The old code would batch things up because there is significant
overhead to be addressed when going to the hypervisor to report said
memory. Your code doesn't seem to really take anything like that into
account and instead is using an arbitrary budget value based on the
page size.

> > > +               /* Attempt to pull page from list and place in scatterlist */
> > > +               if (*offset) {
> > > +                       isolate_free_huge_page(page, h, nid);
> > > +                       /* Add page to scatter list */
> > > +                       --(*offset);
> > > +                       sg_set_page(&sgl[*offset], page, page_len, 0);
> > > +
> > > +                       continue;
> > > +               }
> > > +
> >
> > There is no point in the continue case if we only have a budget of 1.
> > We should probably just tighten up the loop so that all it does is
> > search until it finds the 1 page it can pull, pull it, and then return
> > it. The scatterlist doesn't serve much purpose and could be reduced to
> > just a single entry.
>
> I will think about it more.
>
> > > +static int
> > > +hugepage_reporting_process_hstate(struct page_reporting_dev_info *prdev,
> > > +                           struct scatterlist *sgl, struct hstate *h)
> > > +{
> > > +       unsigned int leftover, offset = HUGEPAGE_REPORTING_CAPACITY;
> > > +       int ret = 0, nid;
> > > +
> > > +       for (nid = 0; nid < MAX_NUMNODES; nid++) {
> > > +               ret = hugepage_reporting_cycle(prdev, h, nid, sgl, &offset);
> > > +
> > > +               if (ret < 0)
> > > +                       return ret;
> > > +       }
> > > +
> > > +       /* report the leftover pages before going idle */
> > > +       leftover = HUGEPAGE_REPORTING_CAPACITY - offset;
> > > +       if (leftover) {
> > > +               sgl = &sgl[offset];
> > > +               ret = prdev->report(prdev, sgl, leftover);
> > > +
> > > +               /* flush any remaining pages out from the last report */
> > > +               spin_lock_irq(&hugetlb_lock);
> > > +               hugepage_reporting_drain(prdev, h, sgl, leftover, !ret);
> > > +               spin_unlock_irq(&hugetlb_lock);
> > > +       }
> > > +
> > > +       return ret;
> > > +}
> > > +
> >
> > If HUGEPAGE_REPORTING_CAPACITY is 1 it would make more sense to
> > rewrite this code to just optimize for a find and process a page
> > approach rather than trying to batch pages.
>
> Yes, I will make a change. Thanks for your comments!

Lastly I would recommend setting up and testing page reporting with
the virtio-balloon driver. I worry that your patch set would have a
significant negative impact on the performance of it. As I mentioned
before it was designed to be more of a leaky bucket solution to
reporting memory and was supposed to take about 30 seconds for it to
flush all of the memory in a guest. Your changes seem to be trying to
do a much more aggressive task and I worry that what you are going to
find is that it will easily push CPUs to 100% on an active system
since it will be aggressively trying to zero memory as soon as it is
freed rather than taking it at a slower pace.

