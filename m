Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47722E070F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 09:10:40 +0100 (CET)
Received: from localhost ([::1]:55854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krckh-00059C-81
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 03:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang.opensource@gmail.com>)
 id 1krcjb-0004iA-16
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 03:09:31 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang.opensource@gmail.com>)
 id 1krcjZ-0006Sx-9Z
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 03:09:30 -0500
Received: by mail-pg1-x531.google.com with SMTP id c22so7872677pgg.13
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 00:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:mail-followup-to:mime-version
 :content-disposition:user-agent;
 bh=vZw5nI+kCEEx1ompDMl4HBZSoNTPvUzGrnmedcFZpg8=;
 b=vLBLjFXhc52zVGGaPxpIaxjR0vZSpL4RJWvs/u4ZFgQIPhGnSO8vUxUyOcQJDcwroz
 C+CTv3VfTYEwuZT78zrciQhiqjjm9XFc64y7aLEnzHkfKaU6BF6++zXrtUq+Z46GXtOB
 83tycbWqXdmhMnIMeVoOtsIEzFSxkjVYZx5+qQyKUWt2KfgiAQ5bcxBoqDXLrfG4/5qR
 yDH+Z6StmiHIPJOs9WVqVp6OjWoM0TD8ZuWL6g8zF2FM8B2otSpqjFND+l1OZECDxkc/
 p4UBrcQV0WZZuJuQJ/ENRZJpMKr2E2AH94CsEQKR0vjN4J3Oc2XTyrm7eO0i9y+gwghf
 1eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id
 :mail-followup-to:mime-version:content-disposition:user-agent;
 bh=vZw5nI+kCEEx1ompDMl4HBZSoNTPvUzGrnmedcFZpg8=;
 b=b+06Cp7rFd2lGev0YPwxOijd1lMvr0kYjA8qGJ0xD2YbNrHjgxnIJNZXISg7b+xX7I
 Hya5Nl9zKekDaHjdDJx2GyX7OvW7HhRQqOQT5yFqTwy+GMfkQDiKuhIixfn2KwQOhlq3
 Uf7YrSKuxXrOOhE4DuohxOzyJYmL3FnoWTdLveZWkzLu5bNDh7i0w3h2W3iYlTnnKxOa
 g5qsnNYN4RuTieOHDfoItWiwWrgaaVRs8961Kntj2CL23/P/1qll1QooFMj3sXpnIdXN
 BEDG4e/WVclv/S8WQ5Cd8FrJPuWooxS1xCQ1sfi8ShJAJzBLsmBZQwWA4sTaFgZdLdVl
 fKfg==
X-Gm-Message-State: AOAM533T1qIcu5GhjIiZAQp5VFtxGLiPu4JWPPLIDU/6ImbIW3TGccWa
 tohKu07SqA1dSUpQYsQ/ft0=
X-Google-Smtp-Source: ABdhPJyU6Wz5lVMCuCgUGh0+zuFDW8nZczDSmN1Y/AkdDSy8vvTKk3wCl/eNGH6+B3nfb09my9dzuQ==
X-Received: by 2002:a63:1e1a:: with SMTP id e26mr4591379pge.66.1608624567657; 
 Tue, 22 Dec 2020 00:09:27 -0800 (PST)
Received: from open-light-1.localdomain (66.98.113.28.16clouds.com.
 [66.98.113.28])
 by smtp.gmail.com with ESMTPSA id r14sm13345752pgi.27.2020.12.22.00.09.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 00:09:27 -0800 (PST)
From: Liang Li <liliang.opensource@gmail.com>
X-Google-Original-From: Liang Li <liliangleo@didiglobal.com>
Date: Tue, 22 Dec 2020 03:09:24 -0500
To: Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@intel.com>, Michal Hocko <mhocko@suse.com>,
 Liang Li <liliangleo@didiglobal.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Liang Li <liliang324@gmail.com>
Subject: [RFC PATCH 0/3 updated] add support for free hugepage reporting
Message-ID: <20201222080921.GA30259@open-light-1.localdomain>
Mail-Followup-To: Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@intel.com>, Michal Hocko <mhocko@suse.com>,
 Liang Li <liliangleo@didiglobal.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Liang Li <liliang324@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=liliang.opensource@gmail.com; helo=mail-pg1-x531.google.com
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
Cc: qemu-devel@nongnu.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A typical usage of hugetlbfs it's to reserve amount of memory during 
kernel booting, and the reserved pages are unlikely to return to the
buddy system. When application need hugepages, kernel will allocate 
them from the reserved pool. when application terminates, huge pages
will return to the reserved pool and are kept in the free list for
hugetlb, these free pages will not return to buddy freelist unless
the size fo reserved pool is changed. 
Free page reporting only supports buddy pages, it can't report the
free pages reserved for hugetlbfs. On the other hand, hugetlbfs
is a good choice for system with a huge amount of RAM, because it
can help to reduce the memory management overhead and improve system
performance.
This patch add the support for reporting hugepages in the free list
of hugetlb, it can be used by virtio_balloon driver for memory
overcommit and pre zero out free pages for speeding up memory
population and page fault handling.

Most of the code are 'copied' from free page reporting because they
are working in the same way. So the code can be refined to remove
the duplicated code. Since this is an RFC, I didn't do that.

For the virtio_balloon driver, changes for the virtio spec are needed.
Before that, I need the feedback of the comunity about this new feature.

This RFC is baed on my previous series:
  '[RFC v2 PATCH 0/4] speed up page allocation for __GFP_ZERO' 

Liang Li (3):
  mm: support hugetlb free page reporting
  virtio-balloon: add support for providing free huge page reports to
    host
  mm: support free hugepage pre zero out

 drivers/virtio/virtio_balloon.c     |  61 ++++++
 include/linux/hugetlb.h             |   3 +
 include/linux/page_reporting.h      |   5 +
 include/uapi/linux/virtio_balloon.h |   1 +
 mm/hugetlb.c                        |  29 +++
 mm/page_prezero.c                   |  17 ++
 mm/page_reporting.c                 | 287 ++++++++++++++++++++++++++++
 mm/page_reporting.h                 |  34 ++++
 8 files changed, 437 insertions(+)

Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: David Hildenbrand <david@redhat.com>  
Cc: Michal Hocko <mhocko@suse.com> 
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Liang Li <liliang324@gmail.com>
-- 
2.18.2


