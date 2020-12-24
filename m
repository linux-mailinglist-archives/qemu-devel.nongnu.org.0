Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5392E230D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 01:47:36 +0100 (CET)
Received: from localhost ([::1]:55508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksEn0-0005wC-Cq
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 19:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1ksElg-0005W4-WA
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 19:46:13 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:41880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1ksEle-0003d5-Mx
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 19:46:12 -0500
Received: by mail-lf1-x131.google.com with SMTP id s26so1394221lfc.8
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 16:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P+mfzRWo820hFwnQTvuDgGQnlNIq5B5PH6IiVfGAr2I=;
 b=n5V5xcYYmU1D+eNGf301FId+5O506c6d795ULETOA+Pucoj55uCwXJG/TC/3xHr2qn
 gG50GGqN/xr6uQlG9VKPRwYylu0kZ2jOOYz5x+aZebtb+mCev4EqkjoTF8e9jpL2tAJF
 pAl19YNImo9m1ZuoST+Y7ITLmk45XsnU5Xw8OKgL2H/y2homjR/bsATb49ywxlcQGgsP
 nzzynz5BplL2kGLBQwpk3+ueMbqRdBYz6WDxXDhLS5GQvukAfBpS/LiHihCqdmnoYb0S
 5Ofqx1bm1kHZW8x1+6s0MdigKiQFWg3a1N/GkX2IP/kg47loDUJ/OGT4WNZ1zNdy95hw
 WmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P+mfzRWo820hFwnQTvuDgGQnlNIq5B5PH6IiVfGAr2I=;
 b=tr/RWoU2psRZykH1kO6l7VHGrCGQLjiSp1JjhKt5+TIPAJt6f2x9cuIZYb382SxoZ+
 0sgKl7U0QInQSQ+sKcbZNSa+zT8C7wl53sZtHd7tMJa3wbYWY/pACc0fxd9XVrQO6D+J
 /mH/SxyiSd4hRHr4nkRFU5+VoJKxKtq36FAg74EBbOchXl5DmIdFlvbclya/XOXvwFv+
 IUdmIKJPkTLWsrYMhHCFvu9yWTqVUonQ+nrwatnL8IQZRYMIYJDc8elJ5AU3NhHXk/RI
 6AXIn4sghGEt0neW60TWGHNrmgQSy7/7RlieLPNudP/sxZsVLWKNeoz05aVBm+GCUApQ
 na1w==
X-Gm-Message-State: AOAM5330d3rMeQMNYjOb/avYPucL7l9I4bE8UFlB8O2UZRzn28JzV93O
 gMgdLtL3cyyZCa4DAvrVBh5ixuAaBr8xljcKmL8=
X-Google-Smtp-Source: ABdhPJx8qUOK6MKoQOWvWuesmAqrFA0fekM3mQ/J/sa9px1338Tn9kuDnilLyuQRkACJGJWngD4gP+61bEz6bmdzhAk=
X-Received: by 2002:a05:6512:3238:: with SMTP id
 f24mr11572986lfe.29.1608770768351; 
 Wed, 23 Dec 2020 16:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20201222074656.GA30035@open-light-1.localdomain>
 <CAKgT0Ucs4pv0+rcPi41uNDrav0sgOmLnVaD4NNWkg7=gncidnQ@mail.gmail.com>
 <CA+2MQi_b98v+vS9J+FnovPe5avNv4WSeD2KoQycdQAG4c3Hxpg@mail.gmail.com>
 <CAKgT0Ue2+eV22kAt-DmsTZqRvXGdxQXa8uVEbD0cmmFP22-r5A@mail.gmail.com>
In-Reply-To: <CAKgT0Ue2+eV22kAt-DmsTZqRvXGdxQXa8uVEbD0cmmFP22-r5A@mail.gmail.com>
From: Liang Li <liliang324@gmail.com>
Date: Thu, 24 Dec 2020 08:45:54 +0800
Message-ID: <CA+2MQi9ZUeARGJpqqCK5nn1dquZL-n=cFZkDmd9AqNsg40gMOg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] mm: support hugetlb free page reporting
To: Alexander Duyck <alexander.duyck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=liliang324@gmail.com; helo=mail-lf1-x131.google.com
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

> > > > +       spin_lock_irq(&hugetlb_lock);
> > > > +
> > > > +       if (huge_page_order(h) > MAX_ORDER)
> > > > +               budget = HUGEPAGE_REPORTING_CAPACITY;
> > > > +       else
> > > > +               budget = HUGEPAGE_REPORTING_CAPACITY * 32;
> > >
> > > Wouldn't huge_page_order always be more than MAX_ORDER? Seems like we
> > > don't even really need budget since this should probably be pulling
> > > out no more than one hugepage at a time.
> >
> > I want to disting a 2M page and 1GB page here. The order of 1GB page is greater
> > than MAX_ORDER while 2M page's order is less than MAX_ORDER.
>
> The budget here is broken. When I put the budget in page reporting it
> was so that we wouldn't try to report all of the memory in a given
> region. It is meant to hold us to no more than one pass through 1/16
> of the free memory. So essentially we will be slowly processing all of
> memory and it will take 16 calls (32 seconds) for us to process a
> system that is sitting completely idle. It is meant to pace us so we
> don't spend a ton of time doing work that will be undone, not to
> prevent us from burying a CPU which is what seems to be implied here.
>
> Using HUGEPAGE_REPORTING_CAPACITY makes no sense here. I was using it
> in the original definition because it was how many pages we could
> scoop out at a time and then I was aiming for a 16th of that. Here you
> are arbitrarily squaring HUGEPAGE_REPORTING_CAPACITY in terms of the
> amount of work you will doo since you are using it as a multiple
> instead of a divisor.
>
> > >
> > > > +       /* loop through free list adding unreported pages to sg list */
> > > > +       list_for_each_entry_safe(page, next, list, lru) {
> > > > +               /* We are going to skip over the reported pages. */
> > > > +               if (PageReported(page)) {
> > > > +                       if (++scan_cnt >= MAX_SCAN_NUM) {
> > > > +                               ret = scan_cnt;
> > > > +                               break;
> > > > +                       }
> > > > +                       continue;
> > > > +               }
> > > > +
> > >
> > > It would probably have been better to place this set before your new
> > > set. I don't see your new set necessarily being the best use for page
> > > reporting.
> >
> > I haven't really latched on to what you mean, could you explain it again?
>
> It would be better for you to spend time understanding how this patch
> set works before you go about expanding it to do other things.
> Mistakes like the budget one above kind of point out the fact that you
> don't understand how this code was supposed to work and just kind of
> shoehorned you page zeroing code onto it.
>
> It would be better to look at trying to understand this code first
> before you extend it to support your zeroing use case. So adding huge
> pages first might make more sense than trying to zero and push the
> order down. The fact is the page reporting extension should be minimal
> for huge pages since they are just passed as a scatterlist so you
> should only need to add a small bit to page_reporting.c to extend it
> to support this use case.
>
> > >
> > > > +               /*
> > > > +                * If we fully consumed our budget then update our
> > > > +                * state to indicate that we are requesting additional
> > > > +                * processing and exit this list.
> > > > +                */
> > > > +               if (budget < 0) {
> > > > +                       atomic_set(&prdev->state, PAGE_REPORTING_REQUESTED);
> > > > +                       next = page;
> > > > +                       break;
> > > > +               }
> > > > +
> > >
> > > If budget is only ever going to be 1 then we probably could just look
> > > at making this the default case for any time we find a non-reported
> > > page.
> >
> > and here again.
>
> It comes down to the fact that the changes you made have a significant
> impact on how this is supposed to function. Reducing the scatterlist
> to a size of one makes the whole point of doing batching kind of
> pointless. Basically the code should be rewritten with the assumption
> that if you find a page you report it.
>
> The old code would batch things up because there is significant
> overhead to be addressed when going to the hypervisor to report said
> memory. Your code doesn't seem to really take anything like that into
> account and instead is using an arbitrary budget value based on the
> page size.
>
> > > > +               /* Attempt to pull page from list and place in scatterlist */
> > > > +               if (*offset) {
> > > > +                       isolate_free_huge_page(page, h, nid);
> > > > +                       /* Add page to scatter list */
> > > > +                       --(*offset);
> > > > +                       sg_set_page(&sgl[*offset], page, page_len, 0);
> > > > +
> > > > +                       continue;
> > > > +               }
> > > > +
> > >
> > > There is no point in the continue case if we only have a budget of 1.
> > > We should probably just tighten up the loop so that all it does is
> > > search until it finds the 1 page it can pull, pull it, and then return
> > > it. The scatterlist doesn't serve much purpose and could be reduced to
> > > just a single entry.
> >
> > I will think about it more.
> >
> > > > +static int
> > > > +hugepage_reporting_process_hstate(struct page_reporting_dev_info *prdev,
> > > > +                           struct scatterlist *sgl, struct hstate *h)
> > > > +{
> > > > +       unsigned int leftover, offset = HUGEPAGE_REPORTING_CAPACITY;
> > > > +       int ret = 0, nid;
> > > > +
> > > > +       for (nid = 0; nid < MAX_NUMNODES; nid++) {
> > > > +               ret = hugepage_reporting_cycle(prdev, h, nid, sgl, &offset);
> > > > +
> > > > +               if (ret < 0)
> > > > +                       return ret;
> > > > +       }
> > > > +
> > > > +       /* report the leftover pages before going idle */
> > > > +       leftover = HUGEPAGE_REPORTING_CAPACITY - offset;
> > > > +       if (leftover) {
> > > > +               sgl = &sgl[offset];
> > > > +               ret = prdev->report(prdev, sgl, leftover);
> > > > +
> > > > +               /* flush any remaining pages out from the last report */
> > > > +               spin_lock_irq(&hugetlb_lock);
> > > > +               hugepage_reporting_drain(prdev, h, sgl, leftover, !ret);
> > > > +               spin_unlock_irq(&hugetlb_lock);
> > > > +       }
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > >
> > > If HUGEPAGE_REPORTING_CAPACITY is 1 it would make more sense to
> > > rewrite this code to just optimize for a find and process a page
> > > approach rather than trying to batch pages.
> >
> > Yes, I will make a change. Thanks for your comments!
>
> Lastly I would recommend setting up and testing page reporting with
> the virtio-balloon driver. I worry that your patch set would have a
> significant negative impact on the performance of it. As I mentioned
> before it was designed to be more of a leaky bucket solution to
> reporting memory and was supposed to take about 30 seconds for it to
> flush all of the memory in a guest. Your changes seem to be trying to
> do a much more aggressive task and I worry that what you are going to
> find is that it will easily push CPUs to 100% on an active system
> since it will be aggressively trying to zero memory as soon as it is
> freed rather than taking it at a slower pace.

Thanks for your explanation, I got what your meaning now. In this RFC
I just try to make it work, there is a lot of room for code refinement. I will
take advice and pay more attention to the points you mentioned.

Liang

