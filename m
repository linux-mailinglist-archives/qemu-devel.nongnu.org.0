Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6D7324FF4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 13:49:27 +0100 (CET)
Received: from localhost ([::1]:44848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFG57-0005JD-TC
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 07:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lFG3y-0004pQ-In
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:48:14 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lFG3w-0007DK-PB
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:48:14 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t15so5094299wrx.13
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 04:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=6dbQCCypX0xOZqlLHcKR8urNIXe+r4as8BcVWmjoAtM=;
 b=KgUX6Pqz3qM4DsrF77v/cLaHLflrWUxaei6lwP9RD7iG85bPd9uLQir0hrV+JX/M2k
 6mzo5Kf7teC67gY9daJyu9NElAPdSorGK9+bdeTsw1DcCHj95S1xsGxr8woxXispRffU
 oAs8nkN6ZYloE+DZJ6o/nzJZa8RmihreoQP6L5lOA+V+9t8q5A2irsNnDSAzGym0AvsW
 jD5iYYYVx+junjQVDz4u1Ss61p2W+TJbB7jwRNkC0rv/VwKsQKcYiJa3gnyKszimdBwG
 AaVhnyQhv7ULgMKtaR3Gr/rLJmmBLqluu2uOCXlnex9NkHl7Jk8+YH/ub2qHSGDMjil0
 U9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=6dbQCCypX0xOZqlLHcKR8urNIXe+r4as8BcVWmjoAtM=;
 b=S1tpVYL912jI4zUwihOIobTM7PLFtSlIs9CVScxvobdv9y36+HFN2MbYB865R5YZzU
 niNpFNdo6VAPdEk9HryPs+0ObI/tPB7QLU0GUL1/0gb8+5yzPOIaEdQPFS9IcuYlw4XR
 sSD5Fc3DLCKOc/Y7yictrLNEKe6yPm5Ywryxl2R3JfyTB0SyxwGFIZRMB0T7zgKTnzxA
 Nv943HxiJWkLpd4lHnKrqNXwcmNqbotcxPet1W0cQfnHDzAElIt8dkOx+tLxJkjVhBow
 rMDHTb6G734PyY6fc5gxrdwgUXNAg50llJ035KfIFopAALxT7rqbrFrRfB9+afgmIjvQ
 Nqhw==
X-Gm-Message-State: AOAM533L9+JNkaUgL3kgptSBixH168w8cy/16FrcDOqaq0qkGq8u6m0H
 stCEqBQxMLDs/AEeB0LlrfZ/Kw==
X-Google-Smtp-Source: ABdhPJxSVC1OkWBizshmv583kBzECnwAkPNU7Y7Fg4bkiMWKwYOWJ7dderZ/4LCoCmyEtg0zj7r3TA==
X-Received: by 2002:adf:bc50:: with SMTP id a16mr3321625wrh.190.1614257291120; 
 Thu, 25 Feb 2021 04:48:11 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id j16sm8558404wra.17.2021.02.25.04.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 04:48:10 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id ed1dadaa;
 Thu, 25 Feb 2021 12:48:09 +0000 (UTC)
To: Kunkun Jiang <jiangkunkun@huawei.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 3/3] migration/ram: Optimize ram_save_host_page()
In-Reply-To: <20210223021646.500-4-jiangkunkun@huawei.com>
References: <20210223021646.500-1-jiangkunkun@huawei.com>
 <20210223021646.500-4-jiangkunkun@huawei.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Thu, 25 Feb 2021 12:48:09 +0000
Message-ID: <cuna6rs48l2.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::42d;
 envelope-from=dme@dme.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-02-23 at 10:16:45 +08, Kunkun Jiang wrote:

> Starting from pss->page, ram_save_host_page() will check every page
> and send the dirty pages up to the end of the current host page or
> the boundary of used_length of the block. If the host page size is
> a huge page, the step "check" will take a lot of time.
>
> This will improve performance to use migration_bitmap_find_dirty().
>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  migration/ram.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index c7e18dc2fc..c7a2350198 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1994,6 +1994,8 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>      int tmppages, pages = 0;
>      size_t pagesize_bits =
>          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> +    unsigned long hostpage_boundary =
> +        QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
>      unsigned long start_page = pss->page;
>      int res;
>  
> @@ -2005,8 +2007,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>      do {
>          /* Check the pages is dirty and if it is send it */
>          if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> -            pss->page++;
> -            continue;
> +            goto find_next;
>          }
>  
>          tmppages = ram_save_target_page(rs, pss, last_stage);
> @@ -2015,16 +2016,17 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>          }
>  
>          pages += tmppages;
> -        pss->page++;
>          /* Allow rate limiting to happen in the middle of huge pages */
>          if (pagesize_bits > 1) {
>              migration_rate_limit();
>          }
> -    } while ((pss->page & (pagesize_bits - 1)) &&
> +find_next:
> +        pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
> +    } while ((pss->page < hostpage_boundary) &&
>               offset_in_ramblock(pss->block,
>                                  ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));

This ends up looking very messy, with a goto inside the loop.

Wouldn't it be cleaner to invert the sense of the
migration_bitmap_clear_dirty() test, such that
migration_bitmap_find_dirty() is called after the body of the test?

> -    /* The offset we leave with is the last one we looked at */
> -    pss->page--;
> +    /* The offset we leave with is the min boundary of host page and block */
> +    pss->page = MIN(pss->page, hostpage_boundary) - 1;
>  
>      res = ram_save_release_protection(rs, pss, start_page);
>      return (res < 0 ? res : pages);
> -- 
> 2.23.0

dme.
-- 
Oliver darling, call Mister Haney, I think our speakers are blown.

