Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE2B2E17D3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 04:43:50 +0100 (CET)
Received: from localhost ([::1]:48066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krv41-0000Aa-3h
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 22:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1krv2i-00086z-9W
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 22:42:28 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:46081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1krv2g-0001WD-HN
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 22:42:28 -0500
Received: by mail-lf1-x12c.google.com with SMTP id y19so36792769lfa.13
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 19:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ybqpSjFFFFHlPBLk8nUiODbC32XCT34HJ3orNNILNM=;
 b=q802V44G+iqYoHXuiqs3/R4CRSg1mxfDB1ak3G8DwEfKd19hRyh8w35dG9qbFFy5Vr
 tZerxaYM3bzwVzcTOb28xScuWVLpzW/gb9n0+OfRtuWwB6bDL0Se1Nlby9615BzJKGlx
 uaWeX0GG3cXhLJmJ8HmawYI8us+b/km/IMDXcybJkOLtn7SMpvsaeINnZDxC3qgpYmhC
 puhQk8gmB+9xNzWLQSIy1vyVlYIz0thUW6KQmpFS1QtFdtfacixdHjaUOaN+ywvVYC+4
 e4/m/aYfPAdcqw40d8HStwHHOMj/tmj+PCdkyOzJZSVgvUn6cPFSLZKXWt0qG9qyL+Q7
 XkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ybqpSjFFFFHlPBLk8nUiODbC32XCT34HJ3orNNILNM=;
 b=JnzIEk1H1WAr8q59L3RjEpNMEUbu8Z9vnFr+TtL+3kwz0ZioP6DTlrt+/a73jySqPD
 awwoPeZW/sBd3NE/zaiy3VJ/N1grf11szOXO733d/EtE7DwesFIhd7a7L/G0gkQexgYV
 iAZM3VxYIKUA3pVx06rc26E+F+ljd6aBMdYRCRo52Vi3eodx9fjsV6zvYzpU54xuPsh2
 jOxiScAXFjLJzzrCT/CeHYXv69Jw5Zv6W0E1KEC5qo5vrpDTV5HnWwqr7nn00nlIBagS
 G3JGsqb9KZFIXYyPSs6XfQKK32cz3KzTrEalop31TWYiVy/U4T0rw4EX+6i8uJPCkHrr
 zpIg==
X-Gm-Message-State: AOAM531AaxdhNDNDYJyjhL96gjKnKZ09clTQzT/vQ3t+nwoNDE1ne5yG
 yBPOzx1uF+q1NL7xqaMKXU/yWWh7rp5U/fnSFuA=
X-Google-Smtp-Source: ABdhPJx265cqM52gdhbhsGHYsq7df5bDeK+RzTSogLsOrDLz4OYfazEqIXTLJEizjC1b4nEwlLSTBCMR3o0+/2touKA=
X-Received: by 2002:ac2:5c08:: with SMTP id r8mr10135064lfp.12.1608694944427; 
 Tue, 22 Dec 2020 19:42:24 -0800 (PST)
MIME-Version: 1.0
References: <20201222074656.GA30035@open-light-1.localdomain>
 <CAKgT0Ucs4pv0+rcPi41uNDrav0sgOmLnVaD4NNWkg7=gncidnQ@mail.gmail.com>
 <52a6cb93-1fed-dfd7-d21e-f14197a9c9dc@oracle.com>
In-Reply-To: <52a6cb93-1fed-dfd7-d21e-f14197a9c9dc@oracle.com>
From: Liang Li <liliang324@gmail.com>
Date: Wed, 23 Dec 2020 11:42:12 +0800
Message-ID: <CA+2MQi_ajOZge-_1S0pAt+o-beT6QQru9ogYBcwzAs+tWqrPcQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] mm: support hugetlb free page reporting
To: Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=liliang324@gmail.com; helo=mail-lf1-x12c.google.com
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
 Andrew Morton <akpm@linux-foundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Liang Li <liliangleo@didiglobal.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Dave Hansen <dave.hansen@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org,
 Mel Gorman <mgorman@techsingularity.net>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On 12/22/20 11:59 AM, Alexander Duyck wrote:
> > On Mon, Dec 21, 2020 at 11:47 PM Liang Li <liliang.opensource@gmail.com> wrote:
> >> +
> >> +       if (huge_page_order(h) > MAX_ORDER)
> >> +               budget = HUGEPAGE_REPORTING_CAPACITY;
> >> +       else
> >> +               budget = HUGEPAGE_REPORTING_CAPACITY * 32;
> >
> > Wouldn't huge_page_order always be more than MAX_ORDER? Seems like we
> > don't even really need budget since this should probably be pulling
> > out no more than one hugepage at a time.
>
> On standard x86_64 configs, 2MB huge pages are of order 9 < MAX_ORDER (11).
> What is important for hugetlb is the largest order that can be allocated
> from buddy.  Anything bigger is considered a gigantic page and has to be
> allocated differently.
>
> If the code above is trying to distinguish between huge and gigantic pages,
> it is off by 1.  The largest order that can be allocated from the buddy is
> (MAX_ORDER - 1).  So, the check should be '>='.
>
> --
> Mike Kravetz

Yes, you're right!  thanks

Liang

