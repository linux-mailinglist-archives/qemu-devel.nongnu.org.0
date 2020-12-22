Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A6D2E06F7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 08:50:50 +0100 (CET)
Received: from localhost ([::1]:47260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krcRV-0000A1-8X
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 02:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang.opensource@gmail.com>)
 id 1krcQ3-0007yq-3M
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 02:49:19 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:45425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang.opensource@gmail.com>)
 id 1krcQ1-0005kq-F0
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 02:49:18 -0500
Received: by mail-pf1-x430.google.com with SMTP id q22so7961052pfk.12
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 23:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:mail-followup-to:mime-version
 :content-disposition:user-agent;
 bh=EteXygXMCMIuOH65MtjowE2DhA9SwUq1uE5SG/8bUGA=;
 b=LGvosuLiYLgn1b5YwdnJwfvCqo3XbN555xW2S/pLyAc8CuUqtZAGHNlX5OhLPeQRO4
 C9wIUC7lj+M+iU2FFT1wsEhktcwBwq76j874fWliVKllFErvCXfAAxAKVekLKJ0fPuX4
 w9BPNrCcyE8RLp4U32xhMH4/yOciZ7ZmUVQsi7kvByf34AwsJf2PEPp8adJg0WcVurN9
 y91b1qv/triV2c+4b/y4HigHiL/Sk+sYpuqdkd4PTNVp0q5YaDIas0IN7YMD2gFHzTrx
 eV/AGLh5tP8pePBFiPGWjo4RlSKftL1n+xJaqNVLxg/eXbhAbpkDrS1x2L8CHRsIt1/n
 D+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id
 :mail-followup-to:mime-version:content-disposition:user-agent;
 bh=EteXygXMCMIuOH65MtjowE2DhA9SwUq1uE5SG/8bUGA=;
 b=SZ0XaM7zNi2TkEY/PTOJCqmtjCwBrKfNyf1i73g3zHmqg/VWMWvlM5hZDZgwS+y0pW
 a5hLQyU3YoYw+WvpLj4Ls7g4be/9l7ZfppoQH6e6F9UQOmqxRbpPbsenfUP5S53NTXT5
 ucyK3GGOOi8D5v5FJh7PwbHt/4IXZwlPhPB3Wi2oGY/ni2WqCCrEkP5bsjUZGt3IFAjC
 tFEGi9yVM5bhucQHA4+mFg6wGUmjPGSTgyP5GNQ8DneQJTloElOzquhOdTuPX5FWamxw
 tjvuzR7Wdcw40fVGhRcEvIcA5XEVmBjikvL/VN+dbKzPWasTcUoNGn0iJO1bremIj7jy
 BnCA==
X-Gm-Message-State: AOAM532ofkWc4kgZaym5NELwVSBrhXQUL94sBlwFFf0Z21KUrkHMiaLe
 iUlhVlsrua1wAR9ExI5R36c=
X-Google-Smtp-Source: ABdhPJzBJLHkMIuEbtGr1+LpiBstQirZrxRohNTninbGDYKqZqqMHLh/V9kjyaXQ/gbGgwJskKjqfQ==
X-Received: by 2002:a63:445a:: with SMTP id t26mr18659351pgk.402.1608623356116; 
 Mon, 21 Dec 2020 23:49:16 -0800 (PST)
Received: from open-light-1.localdomain (66.98.113.28.16clouds.com.
 [66.98.113.28])
 by smtp.gmail.com with ESMTPSA id b189sm19198904pfb.194.2020.12.21.23.49.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Dec 2020 23:49:15 -0800 (PST)
From: Liang Li <liliang.opensource@gmail.com>
X-Google-Original-From: Liang Li <liliangleo@didiglobal.com>
Date: Tue, 22 Dec 2020 02:49:13 -0500
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
Subject: [RFC PATCH 3/3] mm: support free hugepage pre zero out
Message-ID: <20201222074910.GA30051@open-light-1.localdomain>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=liliang.opensource@gmail.com; helo=mail-pf1-x430.google.com
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

This patch add support of pre zero out free hugepage, we can use
this feature to speed up page population and page fault handing.

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
Signed-off-by: Liang Li <liliangleo@didiglobal.com>
---
 mm/page_prezero.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/mm/page_prezero.c b/mm/page_prezero.c
index c8ce720bfc54..dff4e0adf402 100644
--- a/mm/page_prezero.c
+++ b/mm/page_prezero.c
@@ -26,6 +26,7 @@ static unsigned long delay_millisecs = 1000;
 static unsigned long zeropage_enable __read_mostly;
 static DEFINE_MUTEX(kzeropaged_mutex);
 static struct page_reporting_dev_info zero_page_dev_info;
+static struct page_reporting_dev_info zero_hugepage_dev_info;
 
 inline void clear_zero_page_flag(struct page *page, int order)
 {
@@ -69,9 +70,17 @@ static int start_kzeropaged(void)
 		zero_page_dev_info.delay_jiffies = msecs_to_jiffies(delay_millisecs);
 
 		err = page_reporting_register(&zero_page_dev_info);
+
+		zero_hugepage_dev_info.report = zero_free_pages;
+		zero_hugepage_dev_info.mini_order = mini_page_order;
+		zero_hugepage_dev_info.batch_size = batch_size;
+		zero_hugepage_dev_info.delay_jiffies = msecs_to_jiffies(delay_millisecs);
+
+		err |= hugepage_reporting_register(&zero_hugepage_dev_info);
 		pr_info("Zero page enabled\n");
 	} else {
 		page_reporting_unregister(&zero_page_dev_info);
+		hugepage_reporting_unregister(&zero_hugepage_dev_info);
 		pr_info("Zero page disabled\n");
 	}
 
@@ -90,7 +99,15 @@ static int restart_kzeropaged(void)
 		zero_page_dev_info.batch_size = batch_size;
 		zero_page_dev_info.delay_jiffies = msecs_to_jiffies(delay_millisecs);
 
+		hugepage_reporting_unregister(&zero_hugepage_dev_info);
+
+		zero_hugepage_dev_info.report = zero_free_pages;
+		zero_hugepage_dev_info.mini_order = mini_page_order;
+		zero_hugepage_dev_info.batch_size = batch_size;
+		zero_hugepage_dev_info.delay_jiffies = msecs_to_jiffies(delay_millisecs);
+
 		err = page_reporting_register(&zero_page_dev_info);
+		err |= hugepage_reporting_register(&zero_hugepage_dev_info);
 		pr_info("Zero page enabled\n");
 	}
 
-- 
2.18.2


